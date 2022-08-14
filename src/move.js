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


function moveHtml() {
  let html = ftlContent.match(/<body>(\d|\D)*\s+<\/body>/gi)
  // let ifArr = html[0].match(/<#if(\S|\s(?!(<#if)))*<\/#if>/gi);
  // // let ifArr = html[0].match(/<#if(\s|\S)*(.*)(\s|\S)*<\/#if>/gi);
  // // console.log(ifArr, ifArr.length)
  // ifArr.forEach((string, index) => {
  //   ifArr[index] = string.substring(0, string.indexOf('</#if>') + 6)
  // });
  // // console.log(ifArr)
  // ifArr.forEach(item => {
  //   console.log(ftlContent.match(new RegExp(item, 'gmi')));
  // })
  html = html[0]
  html = html.replace(/<\/#if>/gim, '</fragment>');
  html = html.replace(/<\/#list>/gim, '</fragment>');
  html = html.replace(/<#else>/gim, '</fragment><fragment v-else>');
  // let ifTags = html[0].match(/<#if(\S|\s(?!(<?!\(d+)|>?!\(d+))))*>/gi);
  // let ifTags = html.match(/<#if(\S|(\s?!(<(?!(\d+)))))*>/gi);
  // let ifTags = html.match(/<#if(\S|\s(?!(<)))*>/gim);
  html = html.replace(/<#if(\S|\s(?!(<)))*>/gim, function (math) {
    // console.log(math)
    return '<fragment v-if="' + math.substring(5, math.length - 1) + '">'
  })
  // console.log(ifTags, ifTags.length)


  // let listTags = html.match(/<#list\s(\S*)\sas\s(\S*)>/gim);
  // console.log(listTags, listTags.length)
  // 解析${}
  // tmArr = html.match(/(\s)(\w+)=\"((\S(?!>))*)\$\{([\w.]+)\!?\}/gmi);
  // tmArr = html.match(/(\s)(\w+)=\"\$\{([\w.]+)\!?\}/gmi);
  // console.log(tmArr, tmArr.length);
  // 标签内不携带字符模板；
  html = html.replace(/(\s)(\w+)=\"\$\{([\w.]+)\!?\}/gmi, "$1:$2=" + "'$3'")
  // 标签内携带字符模板；
  html = html.replace(/(\s)(\w+)=\"((\S(?!>))*)\$\{([\w.]+)\!?\}/gmi, "$1:$2=" + "\"'$3" + "'" + "+ $5")
  // 标签内多个query属性；
  tmArr = html.match(/\$\{([\w.]+)\!?\}\&/gmi);
  console.log(tmArr, tmArr.length);
  html = html.replace(/\$\{([\w.]+)\!?\}\&/gmi, "'+$1+'")
  // 非标签内模板；
  html = html.replace(/(>|\s)\$\{([\w.]+)\!?\}/gmi, '$1{{$2}}');

  html = html.replace(/<#list\s(\S*)\sas\s(\S*)>/gim, '<fragment v-for="($2,index) in $1" :key="index">')

  vueTemplate = vueTemplate.replace('ht', html.substring(5, html.length - 7));
  toVueFile()
}