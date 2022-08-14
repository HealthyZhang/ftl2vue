const path = require('path');
const fse = require('fs-extra');



let ftlPath = path.resolve(__dirname, '../ftl/ftl2.ftl');
let vuePath = path.resolve(__dirname, '../dist/vue.vue');

let ftlContent, vueContent, vueTemplate, vueScript, vueStyle;
createVueTemplate()
fse.readFile(ftlPath, (err, data) => {
  if (err) throw err;
  // console.log(data.toString())
  ftlContent = data.toString();
  exegesis()
  moveStyle()
  moveScript()
  moveHtml()
})

function moveHtml() {
  let html = ftlContent.match(/<body>(\d|\D)*\s+<\/body>/gi);
  html = html[0]
  // // 替换if语句
  html = html.replace(/<\/#if>/gim, '</fragment>');
  html = html.replace(/<#else>/gim, '</fragment><fragment v-else>');
  html = html.replace(/<#if(\S|\s(?!(<)))*>/gim, function (math) {
    return '<fragment v-if="' + math.substring(5, math.length - 1) + '">'
  })
  // 替换for循环；
  html = html.replace(/<\/#list>/gim, '</fragment>');
  html = html.replace(/<#list\s(\S*)\sas\s(\S*)>/gim, '<fragment v-for="($2,index) in $1" :key="index">')


  // 解析${} 
  // 标签内不携带字符模板；
  html = html.replace(/(\s)(\w+)=\"\$\{([\w.]+)\!?\}/gmi, "$1:$2=" + "'$3'")
  // 标签内携带字符模板；
  html = html.replace(/(\s)(\w+)=\"((\S(?!>))*)\$\{([\w.]+)\!?\}/gmi, "$1:$2=" + "\"'$3" + "'" + "+ $5")
  // 标签内多个query属性； 
  html = html.replace(/\$\{([\w.]+)\!?\}\&/gmi, "'+$1+'")
  // 非标签内模板；
  html = html.replace(/(>|\s)\$\{([\w.]+)\!?\}/gmi, '$1{{$2}}');

  vueTemplate = vueTemplate.replace('ht', html.substring(5, html.length - 7));
  toVueFile()
}

function toVueFile() {
  let content = vueTemplate + vueScript + vueStyle;
  fse.outputFile(vuePath, content).then(res => {
    console.log('outPutSuccess!', res)
  }).catch(err => {
    console.log('outPFial:', err)
  })
}

function moveScript() {
  // let scriptArr = ftlContent.match(/<script(\S|\s(?!<script))*<\/script>/g);
  // let scriptArr = ftlContent.match(/<script(\S|\s(?!(<script|src)))*<\/script>/g)

  let scriptArr1 = ftlContent.match(/<script>(\S|\s(?!(<script|src)))*<\/script>/g);
  let mtd1 = ''
  scriptArr1.forEach(string => {
    mtd1 += string.substring(8, string.length - 9)
  });
  vueScript = vueScript.replace(/mtd1/g, mtd1)

  let scriptArr2 = ftlContent.match(/<script\stype(\S|\s(?!(<script|src)))*<\/script>/g);
  let mtd2 = ''
  scriptArr2.forEach(string => {
    mtd2 += string.substring(32, string.length - 9)
  });
  vueScript = vueScript.replace(/mtd2/g, mtd2)
}


function moveStyle() {
  const slength = ftlContent.match(/<style/g).length;
  if (slength > 1) {
    console.log("自动移动style失败，请手动进行赋值！涉及文件路径：", 'waiting complete！');
    return;
  }
  ftlStyleArr = ftlContent.match(/<style(\d|\D)*<\/style>/g)
  // console.log(ftlStyleArr)
  vueStyle = vueStyle.replace('</style>', ftlStyleArr[0].substring(23));
}

function createVueTemplate() {
  vueTemplate = '<template>' +
    '  <div class="">' +
    'ht' +
    '  </div>' +
    '</template>' +
    '';
  vueScript = '<script>' +
    '  export default {' +
    '    components:  {' +
    ' ' +
    '     },' +
    '     data() {' +
    '       return {' +
    ' dt' +
    '       }' +
    '     },' +
    '     created() {' +
    ' ' +
    '     },' +
    '     mounted() {' +
    ' ' +
    '     },' +
    '     beforeDestory() {' +
    ' ' +
    '     },' +
    '     methods: {' +
    '       fn1(){' +
    '           mtd1' +
    '        },' +
    '       fn2(){' +
    '           mtd2' +
    '        },' +
    '     }' +
    '   }' +
    ' </script>' +
    '';
  vueStyle = ' <style scoped>' +
    ' ' +
    ' ' +
    ' </style>'
}

function exegesis() {
  ftlContent = ftlContent.replace(/<#--/g, '<!--')
}