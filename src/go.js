const fse = require('fs-extra');
const { parse } = require('node-html-parser');

const { ftlPath } = require('./analysis/paths');
const getFiles = require('./analysis/getFiles');
const exegesis = require('./utils/exegesis');
const initTemplate = require('./analysis/initTemplate');
const pickData = require('./pick/pickData');
const pickComponent = require('./pick/pickComponent');
const analysisBody = require('./analysis/analysisBody');
const pickMethod = require('./pick/pickMethod');
const pickStyle = require('./pick/pickStyle');
const changeTitle = require('./analysis/changeTitle');

const toVueFile = require('./toFile/toVueFile');
const createRouter = require('./toFile/createRouter');

/** 开始执行逻辑 */
getFiles(ftlPath).then(files => {
  files.forEach(item => {
    let vuePath = item.replace(/\\ftl\\/, '\\dist\\');
    vuePath = vuePath.replace(/\.ftl/, '\.vue');
    /** 保留一个原始值 */
    let originContent = fse.readFileSync(item, 'utf-8');
    /** ftl字符串格式内容变量 */
    let ftlContent = exegesis(originContent); //去除注释；

    /** flt内容解析为html格式 */
    let ftlHtml = parse(ftlContent);
    let bodyHtml = ftlHtml.querySelector("body");
    bodyHtml = bodyHtml ? bodyHtml : ftlHtml;
    /** 获取script元素 */
    let scriptArr = ftlHtml.getElementsByTagName("script");
    /** 获取link元素 */
    let linkArr = ftlHtml.getElementsByTagName("link");
    /** 获取style元素 */
    let styleArr = ftlHtml.getElementsByTagName("style");
    /** 移除ftlHtml中的style和script；*/
    styleArr.forEach(item => item.remove());
    scriptArr.forEach(item => item.remove());
    /** 组件中移除link标签 */
    linkArr.forEach(item => item.remove());
    /** 获取title标签 */
    let titleLabel = ftlHtml.querySelector("title");
    /** ------------------------------------------------------- */
    /** 获取初始化模板 */
    let { vueTemplate, vueScript, vueStyle } = initTemplate();
    // let bodyHtml = ftlHtml.querySelector("body");
    // bodyHtml = bodyHtml ? bodyHtml : ftlHtml;
    let bodyString = bodyHtml.toString();
    /** 修改title */
    vueScript = changeTitle(titleLabel, vueScript);
    /** 提取data内容 */
    vueScript = pickData(bodyString, vueScript);
    /** 提取component组件 */
    let obj = pickComponent(bodyString, vueScript);
    vueScript = obj.vueScript;
    bodyString = obj.bodyString;
    /** 解析ftl语法 */
    vueTemplate = analysisBody(bodyString, vueTemplate)
    /** 提取js方法和文件 */
    vueScript = pickMethod(scriptArr, vueScript);
    /** 提取style和link标签 */
    vueStyle = pickStyle(styleArr, linkArr, vueStyle);

    toVueFile(vueTemplate, vueScript, vueStyle, vuePath);
    
  });
  createRouter(files);
}).catch(err => {
  console.log('未知错误！ - ', err);
}).then(res => {

})



