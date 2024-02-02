/**
 * @Date 2024/2/2 10:19
 * @Discrition 获取ftl文件列表；
 * @Return filePathList
 */
const fse = require('fs-extra');
const path = require('path');
let timer = null;
/*TODO 暂行 */
module.exports = function getFiles(folderPath) {
  return new Promise(resolve => {
    let filePathArr = [];
    readFolder(folderPath, filePathArr);
    clearTimeout(timer);
    timer = setTimeout(() => {
      resolve(filePathArr)
    }, 2000)
  })
}
function readFolder(folderPath, filePathArr) {
  //根据文件路径读取文件，返回文件列表
  fse.readdir(folderPath, function (err, files) {
    if (err) {
      console.warn("文件读取错误！错误内容：", err)
      console.warn("文件读取错误！错误路径：", folderPath)
    } else {
      //遍历读取到的文件列表
      files.forEach(function (filename) {
        //获取当前文件的绝对路径
        var filedir = path.join(folderPath, filename);
        //根据文件路径获取文件信息，返回一个fse.Stats对象
        fse.stat(filedir, function (eror, stats) {
          if (eror) {
            console.warn('获取文件stats失败：', filedir);
          } else {
            var isFile = stats.isFile(); //是文件
            var isDir = stats.isDirectory(); //是文件夹
            if (isFile) {
              filePathArr.push(filedir);
            } else if (isDir) {
              readFolder(filedir, filePathArr); //递归，如果是文件夹，就继续遍历该文件夹下面的文件
            } else {
              console.log('读取路径不是文件或文件夹！:', filedir);
            }
          }
        })
      });
    }
  });
}