/**
 * @Date 2024/2/2 10:18
 * @Discrition 写入路径；
 */
const path = require('path');
const ftlPath = path.resolve(__dirname, '../../ftl');
const logPath = path.resolve(__dirname, '../../logs');
const routerPath = path.resolve(__dirname, '../../router');

module.exports = {
    ftlPath,
    logPath,
    routerPath
}