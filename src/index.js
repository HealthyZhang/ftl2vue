const path = require('path');
const fse = require('fs-extra');
const { parse } = require('node-html-parser');
const { clearTimeout } = require('timers');

const ftlPath = path.resolve(__dirname, '../ftl');
const logPath = path.resolve(__dirname, '../logs');
/** vue模板变量； */
let vueTemplate, vueScript, vueStyle, routerContent;

let htmlRoot; //parse后的html
let vuePath; //转换后的vue文件路径；

// ftl文件内容；
let ftlContent;
/**
 * 日志功能
 */
let logContent = '',
  fileCount = 0,
  successCount = 0,
  failCount = 0,
  timer = null;
/** 日志结束 */

readFiles(ftlPath)

function readFiles(filePath) {
  //根据文件路径读取文件，返回文件列表
  fse.readdir(filePath, function (err, files) {
    if (err) {
      console.warn("文件读取错误！错误内容：", err)
      logContent += `文件读取错误：${filePath} \n`;
    } else {
      //遍历读取到的文件列表
      files.forEach(function (filename) {
        //获取当前文件的绝对路径
        var filedir = path.join(filePath, filename);
        //根据文件路径获取文件信息，返回一个fse.Stats对象
        fse.stat(filedir, function (eror, stats) {
          if (eror) {
            console.warn('获取文件stats失败');
            logContent += `获取文件stats失败:${filedir} \n`;
          } else {
            var isFile = stats.isFile(); //是文件
            var isDir = stats.isDirectory(); //是文件夹
            if (isFile) {
              try {
                // *初始化vue页面模板；
                initVueTemplate();
                // *文件转换后的新路径；
                vuePath = filedir.replace(/\\ftl\\/, '\\dist\\')
                vuePath = vuePath.replace(/\.ftl/, '\.vue')
                // ftl文件内的字符串内容；
                ftlContent = fse.readFileSync(filedir, 'utf-8');
                // *去掉注释；
                exegesis()
                // node-html-parse;
                let htmlRoot = parse(ftlContent);
                // console.log('htmlRoot:', htmlRoot.toString()); //转为html结构；
                // *获取script链接及内容；
                let scriptArr = htmlRoot.getElementsByTagName("script");
                // 获取script链接及内容；
                let linkArr = htmlRoot.getElementsByTagName("link");
                // *style标签内容；
                let styleArr = htmlRoot.getElementsByTagName("style");
                // *移除document中的style和script；
                styleArr.forEach(item => item.remove())
                scriptArr.forEach(item => item.remove())
                // *获取title；
                let title;
                let titleHtml = htmlRoot.querySelector("title");
                if (titleHtml) {
                  title = titleHtml.innerText;
                }
                // *修改title；
                changeTitle(title);

                let bodyHtml = htmlRoot.querySelector("body");
                // if (!bodyHtml) throw '未查询到body标签';
                if (!bodyHtml) {
                  dealWithBody(htmlRoot);
                } else {
                  dealWithBody(bodyHtml.innerHTML);
                }
                addMethod(scriptArr);
                addStyle(styleArr, linkArr);
                fileCount++;
                toVueFile();
                /** 日志相关 */
                printLog();
              } catch (err) {
                console.log('流程错误：', err);
                console.log('流程错误路径：', vuePath);
                logContent += `流程错误：:${err} \n`;
                logContent += `流程错误路径：:${vuePath} \n`;
                failCount++;
                printLog();
              }
            }
            if (isDir) {
              readFiles(filedir); //递归，如果是文件夹，就继续遍历该文件夹下面的文件
            }
          }
        })
      });
    }
  });
}

// 初始化vue基础模板；
function initVueTemplate() {
  vueTemplate = '<template>' +
    '\n' +
    '  <div class="">' +
    '\n' +
    'ht' +
    '\n' +
    '  </div>' +
    '\n' +
    '</template>' + '\n' +
    '';
  vueScript = '<script>' + '\n' +
    'impts' + '\n' +
    'impt1' + '\n' +
    '\n' +
    '  export default {' + '\n' +
    '    components:  {' + '\n' +
    ' cmpts' + '\n' +
    '     },' + '\n' +
    '     data() {' + '\n' +
    '       return {' + '\n' +
    ' dt' + '\n' +
    '       }' + '\n' +
    '     },' + '\n' +
    '     created() {' + '\n' +
    ' ' + '\n' +
    '     },' + '\n' +
    '     mounted() {' + '\n' +
    ' tit0 ' + '\n' +
    '     },' + '\n' +
    '     beforeDestory() {' + '\n' +
    ' ' + '\n' +
    '     },' + '\n' +
    '     methods: {' + '\n' +
    '       fn1(){' + '\n' +
    '           mtd1' + '\n' +
    '        },' + '\n' +
    '       fn2(){' + '\n' +
    '           //mtd2' + '\n' +
    '        },' + '\n' +
    '     }' + '\n' +
    '   }' + '\n' +
    ' </script>' + '\n' +
    '';
  vueStyle = ' <style scoped>' + '\n' +
    'impt2' + '\n' +
    ' ' + '\n' +
    ' stl' + '\n' +
    ' </style>'
}

//* 去除#井号开头的注释；
function exegesis() {
  ftlContent = ftlContent.replace(/<#--(\S|\s(?!(<#--|<!--)))*-->/gim, '')
}

//* 修改document.title
function changeTitle(title) {
  if (title) {
    vueScript = vueScript.replace("tit0", "document.title = title;")
  } else {
    vueScript = vueScript.replace("tit0", "/* title未修改 */")
  }
}
/** 处理body标签内内容，并替换 */
function dealWithBody(body) {
  let bodyString = body.toString();
  /**
   * TODO include的component逻辑略过；
   * 
   */
  bodyString = dealWithComponents(bodyString);
  add2Data(bodyString);
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
    vueTemplate = vueTemplate.replace('ht', html);

  } catch (err) {
    console.log('bodyHtml解析错误:', e)
    console.log('bodyHtml解析错误文件:', vuePath)
    logContent += `bodyHtml解析错误:${e} \n`;
    logContent += `bodyHtml解析错误文件:${vuePath} \n`;
  }
}

/** 将标签内意思data的字段放入到data中 */
function add2Data(bodyString) {
  try {
    dataArr = bodyString.match(/\$\{([\w.]+)\!?(\?c)?\}/gmi);
    let dt = '';
    dataArr && dataArr.forEach(item => {
      dt += item.replace(/(\$\{)|(\!?\})|((\?c)?\})/gim, '').split('.')[0] + ": '',\n"
    })
    if (dt) {
      dt = dt.slice(0, -2);
    }
    vueScript = vueScript.replace('dt', dt)
  } catch (e) {
    console.log('提取data错误:', e)
    console.log('提取data错误文件:', vuePath)
    vueScript = vueScript.replace('dt', "/** data未提取 */")
    logContent += `提取data错误:${e} \n`;
    logContent += `提取data错误文件:${vuePath} \n`;
  }
}
/** 将js代买放入到method中 */
function addMethod(scriptArr = []) {
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
}

/** 将css代码放入到对应为止 */
function addStyle(styleArr = [], linkArr = []) {
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
  vueStyle = vueStyle.replace("impt2", impt2)
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
  vueStyle = vueStyle.replace("stl", stl)
}

/** 转存为vue文件； */
function toVueFile() {
  let content = vueTemplate + vueScript + vueStyle;
  fse.outputFile(vuePath, content).then(res => {
    // console.log('outPutSuccess!', res);
    successCount++;
  }).catch(err => {
    console.log('outPFial:', err, vuePath);
    logContent += `转存为vue文件；失败:${err} \n`;
    logContent += `转存为vue文件失败路径:${vuePath} \n`;
    failCount++;
  })
}
/** 打印log */
function printLog() {
  clearTimeout(timer);
  timer = setTimeout(() => {
    let content =
      `总文件数量：${fileCount}\n
    成功数量：${successCount}\n
    失败数量：${failCount}\n
    ${logContent}`
    let filePath = logPath + '\\' + Date.now() + '\.txt';
    fse.outputFile(filePath, content).then(res => {
      console.log('printLogSuccess!', res)
    }).catch(err => {
      console.log('printLogFial:', err)
    })
  }, 3000)
}

/** 处理组件导入 */
function dealWithComponents(bodyString) {
  const componentArr = bodyString.match(/<#include(\S|\s(?!(<)))*>/gim);
  let impt1 = '';/** 承载导入的组件路径 */
  let cmpts = ''; /** 组件名称 */
  componentArr.forEach(item => {
    try {
      let fileName = item.match(/\/((\S|\s)(?!\/))*\.ftl/gim)[0].replace(/\/|\.ftl/gim, '');
      // let path = item.split(" ")[1].replace(".ftl", ".vue");
      let path = item.match(/\/((\S|\s))*\.ftl/gim)[0].replace(".ftl", ".vue");
      let camelName = toUpperCamelCase(fileName);
      let componentName = `<${camelName} />`;
      bodyString = bodyString.replace(item, componentName);
      /** 避免重复引入 */
      if (impt1.includes(path)) return;
      cmpts += camelName + ',\n';
      impt1 += `import ${camelName} from \'@/components${path}\';\n`;
    } catch (err) {
      console.log('组件转换错误：', err);
      console.log('组件转换错误文件路径：', vuePath);
      logContent += `组件转换错误：:${err} \n`;
      logContent += `组件转换错误文件路径：:${vuePath} \n`;
    }
  })
  if (cmpts.length) {
    cmpts = cmpts.slice(0, -2);
  }
  vueScript = vueScript.replace("impt1", impt1);
  vueScript = vueScript.replace("cmpts", cmpts);
  return bodyString;
}
/** 转大驼峰 */
function toUpperCamelCase(str) {
  // let newStr = str.replace(/[-_\s]+(\w)/g, function (match, letter) {
  //   return letter.toUpperCase();
  // });
  // return newStr.replace(/^\w/, a => {
  //   return a.toUpperCase()
  // })
  return str.replace(/(^\w)|[-_\s]+(\w)/gim, function (match, b, c) {
    if (b) return b.toUpperCase();
    if (c) return c.toUpperCase();
  });
}

/**
 * var input = "hello-world_test";
 * console.log(toUpperCamelCase(input)); // HelloWorldTest
 */
/** 创建路由文件 */
function createRouter() {
  // let filePath = logPath + '\\' + Date.now() + '\.txt';
  // fse.outputFile(filePath, content).then(res => {
  //   console.log('printLogSuccess!', res)
  // }).catch(err => {
  //   console.log('printLogFial:', err)
  // })
}