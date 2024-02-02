/**
 * @Date 2024/2/2 10:18
 * @Discrition 创建所需模板
 */
/**
 * 模板接收变量
 */
let vueTemplate,
  vueScript,
  vueStyle,
  routerContent;
/**
 *  初始化基础模板；
 *  */
module.exports = function initTemplate() {

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
    ' </style>';


  routerContent =
    `import Vue from \'vue\';\n
import VueRouter from \'vue-router\';\n
Vue.use(VueRouter);\n

const routes = [\n
rts\n
]\n

const router = new VueRouter({
  mode: \'history\',
  base: \'./\',
  routes
})

export default router;

`;

  return {
    vueTemplate,
    vueScript,
    vueStyle,
    routerContent
  }
}
