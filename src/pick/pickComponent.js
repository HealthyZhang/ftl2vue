/**
 * @Date 2024/2/2 10:35
 * @Discrition 处理组件导入
 */
const toCamelCase = require('../utils/camelCase');

/** 处理组件导入 */
module.exports = function pickComponent(bodyString, vueScript) {
  const componentArr = bodyString.match(/<#include(\S|\s(?!(<)))*>/gim);
  let impt1 = '';/** 承载导入的组件路径 */
  let cmpts = ''; /** 组件名称 */
  componentArr && componentArr.forEach(item => {
    try {
      let fileName = item.match(/\/((\S|\s)(?!\/))*\.ftl/gim)[0].replace(/\/|\.ftl/gim, '');
      // let path = item.split(" ")[1].replace(".ftl", ".vue");
      let path = item.match(/\/((\S|\s))*\.ftl/gim)[0].replace(".ftl", ".vue");
      let camelName = toCamelCase(fileName);
      let componentName = `<${camelName} />`;
      bodyString = bodyString.replace(item, componentName);
      /** 避免重复引入 */
      if (impt1.includes(path)) return;
      cmpts += camelName + ',\n';
      impt1 += `import ${camelName} from \'@/components${path}\';\n`;
    } catch (err) {
      console.log('组件转换错误：', err);
      console.log('组件转换错误文件路径：');
    }
  })
  if (cmpts.length) {
    cmpts = cmpts.slice(0, -2);
  }
  vueScript = vueScript.replace("impt1", impt1);
  vueScript = vueScript.replace("cmpts", cmpts);
  return {
    bodyString,
    vueScript
  };
}