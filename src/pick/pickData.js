/**
 * @Date 2024/2/2 10:39
 * @Discrition 提取data
 */

/** 将标签内意思data的字段放入到data中 */
module.exports = function pickData(bodyString, vueScript) {
    let dt = '';
    try {
        let dataArr = bodyString.match(/\$\{([\w.]+)\!?(\?c)?\}/gmi);
        dataArr && dataArr.forEach(item => {
            dt += item.replace(/(\$\{)|(\!?\})|((\?c)?\})/gim, '').split('.')[0] + ": '',\n"
        })
        if (dt) {
            dt = dt.slice(0, -2);
        }

    } catch (e) {
        console.log('提取data错误:', e);
        dt = "/** data异常未提取 */";
    }
    return vueScript.replace('dt', dt);
}