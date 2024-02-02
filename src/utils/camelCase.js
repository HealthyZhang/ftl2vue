/**
 * @Date 2024/2/2 10:23
 * @Discrition 转大驼峰；
 * 
 * var input = "hello-world_test";
 * console.log(toCamelCase(input)); // HelloWorldTest
 */

/** 转大驼峰 */
module.exports = function toCamelCase(str) {
    return str.replace(/(^\w)|[-_\s]+(\w)/gim, function (match, b, c) {
        if (b) return b.toUpperCase();
        if (c) return c.toUpperCase();
    });
}
function aa() {
    // 转小驼峰
    let newStr = str.replace(/[-_\s]+(\w)/g, function (match, letter) {
        return letter.toUpperCase();
    });
    // 首字母大写；
    return newStr.replace(/^\w/, a => {
        return a.toUpperCase()
    })
}

