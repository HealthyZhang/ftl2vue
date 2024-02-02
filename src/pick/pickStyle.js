/**
 * @Date 2024/2/2 10:38
 * @Discrition 提取style样式
 */

/** 将css代码放入到对应为止 */
module.exports = function pickStyle(styleArr = [], linkArr = [], vueStyle) {
    let stl = '';
    let impt2 = '';
    /** @import url('./external.css'); */
    linkArr.forEach(item => {
        let href = item.getAttribute("href");
        if (href) {
            impt2 += `@import url(\'${href}\');\n`
        } else {
            impt2 += '/* 导入有空值 */'
        }
    })
    if (!linkArr.length) {
        impt2 = "/* 无link */\n"
    }

    styleArr.forEach(item => {
        let innerHTML = item.innerHTML;
        if (innerHTML) {
            stl += innerHTML + '\n';
        } else {
            stl += '/* style有空值 */\n';
        }
    })
    if (!styleArr.length) {
        stl = "/* 无style */\n"
    }
    vueStyle = vueStyle.replace("impt2", impt2);
    vueStyle = vueStyle.replace("stl", stl);
    return vueStyle;
}