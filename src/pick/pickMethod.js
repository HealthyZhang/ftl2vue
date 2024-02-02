/**
 * @Date 2024/2/2 10:37
 * @Discrition 提取method和js文件
 */


/** 将js代买放入到method中 */
module.exports = function pickMethod(scriptArr = [], vueScript) {
  let impts = ''; /** 导入js文件的路径 */
  let mtd1 = '';
  scriptArr.forEach(item => {
    let src = item.getAttribute("src");
    let innerHTML = item.innerHTML;
    if (src) {
      impts += `import \'${src}\';\n`;
    } else if (innerHTML) {
      mtd1 += innerHTML + '\n';
    } else {
      impts += `/* 出现空script标签 */\n`;
    }
  })
  if (!scriptArr.length) {
    impts = '//无需导入的js文件;';
    mtd1 = '//无js代码;';
  }
  vueScript = vueScript.replace('impts', impts);
  vueScript = vueScript.replace('mtd1', mtd1);
  return vueScript;
}