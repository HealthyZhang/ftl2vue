function createVueTemplate() {
  vueTemplate = '<template>' +
    '  <div class="">' +
    '' +
    '  </div>' +
    '</template>' +
    '';
  vueScript = '<script>' +
    '  export default {' +
    '    components:  {' +
    ' ' +
    '     },' +
    '     data() {' +
    '       return {' +
    ' ' +
    '       }' +
    '     },' +
    '     created() {' +
    ' ' +
    '     },' +
    '     mounted() {' +
    ' ' +
    '     },' +
    '     beforeDestory() {' +
    ' ' +
    '     },' +
    '     methods: {' +
    '       fn1(){' +
    '           mtd1' +
    '        },' +
    '       fn2(){' +
    '           mtd2' +
    '        },' +
    '     }' +
    '   }' +
    ' </script>' +
    '';
  vueStyle = ' <style scoped>' +
    ' ' +
    ' ' +
    ' </style>'
}

module.exports = createVueTemplate;