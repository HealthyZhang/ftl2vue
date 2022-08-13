function moveScript() {
  // let scriptArr = ftlContent.match(/<script(\S|\s(?!<script))*<\/script>/g);
  // let scriptArr = ftlContent.match(/<script(\S|\s(?!(<script|src)))*<\/script>/g)

  let scriptArr1 = ftlContent.match(/<script>(\S|\s(?!(<script|src)))*<\/script>/g);
  let mtd1 = ''
  scriptArr1.forEach(string => {
    mtd1 += string.substring(8, string.length - 9)
  });
  vueScript = vueScript.replace(/mtd1/g, mtd1)

  let scriptArr2 = ftlContent.match(/<script\stype(\S|\s(?!(<script|src)))*<\/script>/g);
  let mtd2 = ''
  scriptArr2.forEach(string => {
    mtd2 += string.substring(32, string.length - 9)
  });
  vueScript = vueScript.replace(/mtd2/g, mtd2)
  toVueFile()
  // console.log(scriptArr2.length)
}


function moveStyle() {
  const slength = ftlContent.match(/<style/g).length;
  if (slength > 1) {
    console.log("自动移动style失败，请手动进行赋值！涉及文件路径：", 'waiting complete！');
    return;
  }
  ftlStyleArr = ftlContent.match(/<style(\d|\D)*<\/style>/g)
  // console.log(ftlStyleArr)
  vueStyle = vueStyle.replace('</style>', ftlStyleArr[0].substring(23));
  toVueFile()
}