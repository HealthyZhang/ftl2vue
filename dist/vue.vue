<template>
  <div class="">>
    <!--头部 开始-->
    <div class="cas_head" id="cas_head">
      <#include "/public/topnav_hx.ftl">
        <#include "/public/headnav_hx.ftl">
    </div>
    <!--头部 结束-->
    <!--主体 开始-->
    <div class="hx_content">
      <div class="parth_bg">
        <div class="hx_zb_parth">
          <h2 class="h2_tit01"><a href="/information" target="_blank">全部资讯<i>></i></a>产业资讯<font>市场动态 快速更新</font>
          </h2>
          <div class="hx_zb_ph_left">
            <ul>
              <fragment v-if="latestInfomationList??">
                <#assign icount=0 />
                <fragment v-for="(info,index) in latestInfomationList" :key="index">
                  <#assign icount=icount+1 />
                  <fragment v-if="info_index<10">
                    <li>
                      <font>{{icount}}</font><a :href="'/information/detail?id='+ info.id"
                        target="_blank">{{info.title}}</a>
                    </li>
                  </fragment>
                </fragment>
              </fragment>
            </ul>
          </div>
          <div class="hx_zb_ph_mid">
            <fragment v-if="latestInfomationList??">
              <#assign icount=0 />
              <fragment v-for="(info,index) in latestInfomationList" :key="index">
                <fragment v-if="info_index<3">
                  <dl>
                    <dt>
                      <font>资讯</font><a :href="'/information/detail?id='+ info.id" target="_blank">{{info.title}}</a>
                    </dt>
                    <dd class="consty">${info.created?string("yyyy-MM-dd")}，${info.content!}</dd>
                  </dl>
                </fragment>
              </fragment>
            </fragment>
          </div>
          <div class="hx_zb_ph_right">
            <ul>
              <fragment v-if="latestInfomationList??">
                <#assign icount=0 />
                <fragment v-for="(info,index) in latestInfomationList" :key="index">
                  <fragment v-if="info_index<4">
                    <fragment v-if="info.smallPic??">
                      <li><a :href="'/information/detail?id='+ info.id" target="_blank">
                          {{info.title}}</a></li>
                    </fragment>
                  </fragment>
                </fragment>
              </fragment>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
    <!--主体 结束-->

    <!--尾部 开始-->
    <#include "/public/bottom_hx.ftl">
      <!--尾部 结束-->
      <!--返回顶部 开始-->
      <a class="returnTop"><img src="/images/cp_icon04.png"></a>
      <script type="text/javascript">
        function login() {
          window.location.href = "/login?returnURL=" + encodeURIComponent(location.href);
        }
      </script>
      <!--返回顶部 结束-->
  </div>
</template>
<script>
  export default {
    components: {},
    data() {
      return {
        dt
      }
    },
    created() {},
    mounted() {},
    beforeDestory() {},
    methods: {
      fn1() {
        $(document).ready(function () {
          var byt = $(".testbox li");
          var box = $(".boxshow")
          byt.hover(
            function () {
              $(this).find(".boxshow").show();
              $(this).find(".a3").attr("class", "a3 a3h");
            },
            function () {
              $(this).find(".boxshow").hide();
              $(this).find(".a3h").attr("class", "a3");
            }
          );
        });

        $(function () {
          $(".returnTop").click(function () {
            var speed = 200; //滑动的速度
            $('body,html').animate({
              scrollTop: 0
            }, speed);
            return false;
          });
        });

        $(function () {
          var setCoverOpacity = function () {

            var returnTop = $('body').find('.returnTop');
            var wValue = returnTop.width();
            var hValue = returnTop.height();
            if ($(window).scrollTop() > 50) {
              returnTop.addClass('on');
            } else {
              returnTop.removeClass('on');
            }
          }
          setCoverOpacity();
          $(window).scroll(function () {
            setCoverOpacity()
          });
        });
      },
      fn2() {
        function scrollDoor() {}

        scrollDoor.prototype = {
          sd: function (menus, divs, openClass, closeClass) {
            var _this = this;
            if (menus.length != divs.length) {
              alert("菜单层数量和内容层数量不一样!");
              return false;
            }
            for (var i = 0; i < menus.length; i++) {
              _this.$(menus[i]).value = i;
              _this.$(menus[i]).onclick = function () {

                for (var j = 0; j < menus.length; j++) {
                  _this.$(menus[j]).className = closeClass;
                  _this.$(divs[j]).style.display = "none";
                }
                _this.$(menus[this.value]).className = openClass;
                _this.$(divs[this.value]).style.display = "block";
              }
            }
          },
          $: function (oid) {
            if (typeof (oid) == "string")
              return document.getElementById(oid);
            return oid;
          }

        }
        window.onload = function () {
          var SDmodel = new scrollDoor();
          /*  SDmodel.sd(["a01","a02"],["aa01","aa02"],"on"," ");
            SDmodel.sd(["d01","d02"],["dd01","dd02"],"on"," ");*/
          /*SDmodel.sd(["c01","c02","c03"],["cc01","cc02","cc03"],"on"," ");*/
          SDmodel.sd(["c01", "c02"], ["cc01", "cc02"], "on", " ");
        }

        function login() {
          window.location.href = "/login?returnURL=" + encodeURIComponent(location.href);
        }
      },
    }
  }
</script>
<style scoped>
  .dropList dl dd .img_box {
    width: 90px;
    height: 60px;
    border: 1px solid #eeeeee;
    float: left;
    display: inline;
    position: relative;
    overflow: hidden;
  }

  .dropList dl dd .img_box img {
    height: 60px;
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
  }
</style>