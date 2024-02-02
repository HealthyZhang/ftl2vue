/**
 * @Date 2024/2/2 10:32
 * @Discrition 修改document。title
 */

//* 修改document.title
module.exports = function changeTitle(titleLabel, vueScript) {
    if (titleLabel) {
        let title = titleLabel.innerText;
        vueScript = vueScript.replace("tit0", `document.title = \'${title}\';`)
    } else {
        vueScript = vueScript.replace("tit0", "/* title未修改 */")
    }
    return vueScript;
}