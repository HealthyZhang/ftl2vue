/**
 * @Date 2024/2/2 10:36
 * @Discrition 打印日志
 */

/** 打印log 日志*/
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