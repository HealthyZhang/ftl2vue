/**
 * @Date 2024/2/2 10:33
 * @Discrition 解析ftl语法；
 */

/** 处理body标签内内容，并替换 */
module.exports = function analysisBody(bodyString, vueTemplate) {
  let html = bodyString;
  try {
    /** 替换if语句*/
    html = html.replace(/<\/#if>/gim, '</fragment>');
    html = html.replace(/<#else>/gim, '</fragment><fragment v-else>');

    html = html.replace(/<#if(\S|\s(?!(<)))*>/gim, function (math) {
      return '<fragment v-if="' + math.substring(5, math.length - 1) + '">'
    })

    html = html.replace(/<#elseif(\S|\s(?!(<)))*>/gim, function (math) {
      return '</fragment><fragment v-else-if="' + math.substring(8, math.length - 1) + '">'
    })

    /** 替换for循环； */
    html = html.replace(/<\/#list>/gim, '</fragment>');
    html = html.replace(/<#list\s(\S*)\sas\s(\S*)>/gim, '<fragment v-for="($2,index) in $1" :key="index">')


    /**
     * 解析${} 
     * 标签内不携带字符的模板；
     */
    html = html.replace(/(\s)(\w+)=\"\$\{([\w.]+)\!?\}/gmi, "$1:$2=\"" + "$3")

    /** 标签内携带字符模板； */
    html = html.replace(/(\s)(\w+)=\"((\S(?!>))*)\$\{([\w.]+)\!?(\?c)?\}/gmi, "$1:$2=" + "\"'$3" + "'" + "+ $5")
    /** 标签内多个query属性； */
    html = html.replace(/\$\{([\w.]+)\!?(\?c)?\}\&/gmi, "'+$1+'")

    /** 非标签内模板 */
    html = html.replace(/(>|\s)\$\{([\w.]+)\!?(\?c)?\}/gmi, '$1{{$2}}');
  } catch (err) {
    console.log('bodyHtml解析错误:', e)
    console.log('bodyHtml解析错误文件:')
  }
  return vueTemplate.replace('ht', html);
}