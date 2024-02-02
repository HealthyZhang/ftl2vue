/**
 * @Date 2024/2/2 10:23
 * @Discrition 创建路由文件
 * 
 */
const { routerPath } = require('../analysis/paths');
let initTemplate = require('../analysis/initTemplate');
const fse = require('fs-extra');
/** 创建路由文件 */
module.exports = function createRouter(files) {
    let { routerContent } = initTemplate();
    let filePath = routerPath + '\\index\.js';
    let rts = '';
    files.forEach(item => {
        let route = item.replace(/(.*)\\ftl\\(.*)(\.ftl)/g, (m, a, b) => {
            return b.replace(/\\/g,'/');
        });
        let name = route.replace(/\//g, '-');
        console.log('item:', item);
        console.log('route:', route);
        rts += `{
            path: '/${route}',
            name: '${name}',
            meta: {
              title: ''
            },
            component: () => import('../views/${route}.vue')
          },\n`
    });
    routerContent = routerContent.replace('rts', rts)
    fse.outputFile(filePath, routerContent).then(res => {
        console.log('createRouter_success!', res)
    }).catch(err => {
        console.log('createRouter_fail:', err)
    })
}