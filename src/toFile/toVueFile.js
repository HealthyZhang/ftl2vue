/**
 * @Date 2024/2/2 10:38
 * @Discrition 转为vue文件
 */
const fse = require('fs-extra');

/** 转存为vue文件； */
module.exports = function toVueFile(vueTemplate, vueScript, vueStyle, vuePath) {
  let content = vueTemplate + vueScript + vueStyle;
  fse.outputFile(vuePath, content).then(res => {
    // console.log('outPutSuccess!', res);
  }).catch(err => {
    console.log('outPFial:', err, vuePath);
  })
}