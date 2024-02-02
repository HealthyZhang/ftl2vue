/**
 * @Date 2024/2/2 10:30
 * @Discrition 去除注释
 */

//* 去除#井号开头的注释；
module.exports = function exegesis(str) {
  return str.replace(/<#--(\S|\s(?!(<#--|<!--)))*-->/gim, '');
}