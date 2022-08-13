const path = require('path');
const fse = require('fs-extra');

// import './createTemplate.js';
// import './exegesis.js';
// import './move.js';

let ftlPath = path.resolve(__dirname, '../ftl/ftl2.ftl');
let vuePath = path.resolve(__dirname, '../dist/vue.vue');

let ftlContent, vueContent, vueTemplate, vueScript, vueStyle;
createVueTemplate()
fse.readFile(ftlPath, (err, data) => {
  if (err) throw err;
  // console.log(data.toString())
  ftlContent = data.toString();
  // exegesis(ftlContent)
  // moveStyle()
  // moveScript()
  moveHtml()
})

function moveHtml() {

}

function toVueFile() {
  let content = vueTemplate + vueScript + vueStyle;
  fse.outputFile(vuePath, content).then(res => {
    console.log('outPutSuccess!', res)
  }).catch(err => {
    console.log('outPFial:', err)
  })
}