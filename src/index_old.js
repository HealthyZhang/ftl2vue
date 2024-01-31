const path = require('path');
const fse = require('fs-extra');  

let ftlPath = path.resolve(__dirname, '../ftl');

// vue模板变量；
let ftlContent, vueContent, vueTemplate, vueScript, vueStyle;

readFiles(ftlPath)

function readFiles(filePath) {
  //根据文件路径读取文件，返回文件列表
  fse.readdir(filePath, function (err, files) {
    if (err) {
      console.warn("文件读取错误！错误内容：", err)
    } else {
      //遍历读取到的文件列表
      files.forEach(function (filename) {
        //获取当前文件的绝对路径
        var filedir = path.join(filePath, filename);
        //根据文件路径获取文件信息，返回一个fse.Stats对象
        fse.stat(filedir, function (eror, stats) {
          if (eror) {
            console.warn('获取文件stats失败');
          } else {
            var isFile = stats.isFile(); //是文件
            var isDir = stats.isDirectory(); //是文件夹
            if (isFile) {
              createVueTemplate()

              // console.log(filedir); // 读取文件内容
              ftlContent = fse.readFileSync(filedir, 'utf-8');
              // console.log(content); 
              let vuePath = filedir.replace(/\\ftl\\/, '\\dist\\')
              vuePath = vuePath.replace(/\.ftl/, '\.vue')
              exegesis(vuePath)
              moveHtml(vuePath)
              moveStyle(vuePath)
              moveScript(vuePath)
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
// HTML 修改，待扩展；
function moveHtml(vuePath) {
  let html = ftlContent.match(/<body(\d|\D)*\s+<\/body>/gi);
  try {
    html = html[0]
    addData(html, vuePath)
    // // 替换if语句
    html = html.replace(/<\/#if>/gim, '</fragment>');
    html = html.replace(/<#else>/gim, '</fragment><fragment v-else>');

    html = html.replace(/<#if(\S|\s(?!(<)))*>/gim, function (math) {
      return '<fragment v-if="' + math.substring(5, math.length - 1) + '">'
    })

    html = html.replace(/<#elseif(\S|\s(?!(<)))*>/gim, function (math) {
      return '</fragment><fragment v-else-if="' + math.substring(8, math.length - 1) + '">'
    })
    // 替换for循环；
    html = html.replace(/<\/#list>/gim, '</fragment>');
    html = html.replace(/<#list\s(\S*)\sas\s(\S*)>/gim, '<fragment v-for="($2,index) in $1" :key="index">')


    // 解析${} 
    // 标签内不携带字符的模板；
    html = html.replace(/(\s)(\w+)=\"\$\{([\w.]+)\!?\}/gmi, "$1:$2=\"" + "$3")
    // 标签内携带字符模板；
    html = html.replace(/(\s)(\w+)=\"((\S(?!>))*)\$\{([\w.]+)\!?(\?c)?\}/gmi, "$1:$2=" + "\"'$3" + "'" + "+ $5")
    // 标签内多个query属性； 
    html = html.replace(/\$\{([\w.]+)\!?(\?c)?\}\&/gmi, "'+$1+'")
    // 非标签内模板；
    html = html.replace(/(>|\s)\$\{([\w.]+)\!?(\?c)?\}/gmi, '$1{{$2}}');
    vueTemplate = vueTemplate.replace('ht', html.substring(5, html.length - 7));

  } catch (e) {
    html = ''
    console.log('moveHtmlError:', e, vuePath)
  }
}

function addData(html, vuePath) {
  dataArr = html.match(/\$\{([\w.]+)\!?(\?c)?\}/gmi);
  let dt = '';
  try {
    dataArr && dataArr.forEach(item => {
      dt += item.replace(/(\$\{)|(\!?\})|((\?c)?\})/gim, '').split('.')[0] + ": '',"
    })
    vueScript = vueScript.replace('dt', dt)
  } catch (e) {
    console.log('addDataerr:', e, vuePath)
  }

}

function toVueFile(vuePath) {
  let content = vueTemplate + vueScript + vueStyle;
  fse.outputFile(vuePath, content).then(res => {
    console.log('outPutSuccess!', res)
  }).catch(err => {
    console.log('outPFial:', err, vuePath)
  })
}
// 调出js语句；
function moveScript(vuePath) {
  try {
    let scriptArr1 = ftlContent.match(/<script>(\S|\s(?!(<script|src)))*<\/script>/g);
    let mtd1 = '';
    scriptArr1 && scriptArr1.forEach(string => {
      mtd1 += string.substring(8, string.length - 9)
    });
    vueScript = vueScript.replace(/mtd1/g, mtd1)
    let scriptArr2 = ftlContent.match(/<script\stype(\S|\s(?!(<script|src)))*<\/script>/g);
    let mtd2 = ''
    scriptArr2 && scriptArr2.forEach(string => {
      mtd2 += string.substring(30, string.length - 9)
    });
    vueScript = vueScript.replace(/mtd2/g, mtd2)
    toVueFile(vuePath)
  } catch (e) {
    console.log('moveScriptErr;', e, vuePath)
  }
}

// 拼接样式；
function moveStyle(vuePath) {
  let ftlStyleArr = ftlContent.match(/<style(\S|(\s(?!<style)))*<\/style>/g)
  let styleString;
  try {
    styleString = ftlStyleArr.join('\r\n');
    styleString = styleString.replace(/<style>|<\/style>|<style type="text\/css">/g, '')
    vueStyle = vueStyle.replace('stl', styleString);
  } catch (e) {
    console.log('StyleError,样式处理错误：', e);
    console.log('错误文件路径：', vuePath);
    vueStyle = vueStyle.replace('stl', '\/* 样式未处理 *\/ ');
    // console.log('moveStyleerr', vuePath);
  }
}

// 创建vue基础模板；
function createVueTemplate() {
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
    ' ' + '\n' +
    '     },' + '\n' +
    '     beforeDestory() {' + '\n' +
    ' ' + '\n' +
    '     },' + '\n' +
    '     methods: {' + '\n' +
    '       fn1(){' + '\n' +
    '           mtd1' + '\n' +
    '        },' + '\n' +
    '       fn2(){' + '\n' +
    '           mtd2' + '\n' +
    '        },' + '\n' +
    '     }' + '\n' +
    '   }' + '\n' +
    ' </script>' + '\n' +
    '';
  vueStyle = ' <style scoped>' + '\n' +
    ' ' + '\n' +
    ' stl' + '\n' +
    ' </style>'
}

// 修改注释；
function exegesis() {
  ftlContent = ftlContent.replace(/<#--/g, '<!--')
}