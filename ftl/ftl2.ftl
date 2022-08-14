<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>华夏基石云智慧招标平台</title>
    <link href="/css/index_zhihui.css" rel="stylesheet" type="text/css" />
    <link href="/css/index2_hx.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_hx.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/1.js"></script>
    <script src="/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="/js/main.js"></script>
    <!--滑动门 开始-->
   <script src="/js/hdtab.js"></script>
    <script type="text/javascript">
        function scrollDoor() {
        }

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
        window.onload = function(){
            var SDmodel = new scrollDoor();
          /*  SDmodel.sd(["a01","a02"],["aa01","aa02"],"on"," ");
            SDmodel.sd(["d01","d02"],["dd01","dd02"],"on"," ");*/
            /*SDmodel.sd(["c01","c02","c03"],["cc01","cc02","cc03"],"on"," ");*/
            SDmodel.sd(["c01","c02"],["cc01","cc02"],"on"," ");
        }
    </script>
    <!--滑动门 结束-->
    <!--弹出菜单 start-->
    <script>
        $(document).ready(function(){
            var byt = $(".testbox li");
            var box = $(".boxshow")
            byt.hover(
                function(){
                    $(this).find(".boxshow").show();$(this).find(".a3").attr("class","a3 a3h");
                },
                function () {
                    $(this).find(".boxshow").hide();$(this).find(".a3h").attr("class","a3");
                }
            );
        });
    </script>
    <!--弹出菜单 end-->
    <script>
        $(function(){
            $(".returnTop").click(function () {
                var speed=200;//滑动的速度
                $('body,html').animate({ scrollTop: 0 }, speed);
                return false;
            });
        });
    </script>
    <script>
        $(function() {
            var setCoverOpacity = function() {

                var returnTop = $('body').find('.returnTop');
                var wValue=returnTop.width();
                var hValue=returnTop.height();
                if($(window).scrollTop() > 50 ){
                    returnTop.addClass('on');
                }
                else{
                    returnTop.removeClass('on');
                }
            }
            setCoverOpacity();
            $(window).scroll(function() {
                setCoverOpacity()
            });
        });
    </script>

    <style type="text/css">
        
        .dropList dl dd .img_box {width:90px; height:60px;border:1px solid #eeeeee;float:left; display:inline;position:relative; overflow:hidden;}
        .dropList dl dd .img_box img {height:60px; position:absolute; top:0; left:50%;transform: translateX(-50%);}
    </style>
    <!--商品排行 start-->
    <script src="/js/jquery-extend-AdAdvance.js" type=text/javascript></script>
</head>
<body>
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
            <h2 class="h2_tit01"><a href="/information" target="_blank">全部资讯<i>></i></a>产业资讯<font>市场动态 快速更新</font></h2>
            <div class="hx_zb_ph_left">
                <ul>
                    <#if latestInfomationList??>
                        <#assign icount = 0 />
                        <#list latestInfomationList as info>
                            <#assign icount = icount+1 />
                            <#if info_index<10>
                                <li><font>${icount!}</font><a href="/information/detail?id=${info.id}" target="_blank">${info.title!}</a></li>
                            </#if>
                        </#list>
                    </#if>
                </ul>
            </div>
            <div class="hx_zb_ph_mid">
                <#if latestInfomationList??>
                    <#assign icount = 0 />
                    <#list latestInfomationList as info>
                        <#if info_index<3>
                            <dl>
                                <dt><font>资讯</font><a href="/information/detail?id=${info.id}" target="_blank">${info.title!}</a></dt>
                                <dd class="consty">${info.created?string("yyyy-MM-dd")}，${info.content!}</dd>
                            </dl>
                        </#if>
                    </#list>
                </#if>
            </div>
            <div class="hx_zb_ph_right">
                <ul>
                    <#if latestInfomationList??>
                        <#assign icount = 0 />
                        <#list latestInfomationList as info>
                            <#if info_index<4>
                                <#if info.smallPic??>
                                    <li><a href="/information/detail?id=${info.id}" target="_blank"><img src="${info.smallPic!}">${info.title}</a></li>
                                <#else>
                                    <li><a href="/information/detail?id=${info.id}&sss=${asdf}" target="_blank">
                                            <img <#if info.smallPic?has_content>
                                                src="${info.smallPic!}"
                                            <#else>
                                                src="/images/default_hx.png"
                                                    </#if>>
                                            ${info.title!}</a></li>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
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
    function login(){
        window.location.href="/login?returnURL="+encodeURIComponent(location.href);
    }
</script>
<!--返回顶部 结束-->
</body>
</html>

