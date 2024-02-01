<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${title_!}-${title}</title>
    <link href="/css/index_bk.css" rel="stylesheet" type="text/css"/>
    <link href="/css/jquery.bxslider.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.9.1.js"></script>
    <link href="/css/index_hx.css" rel="stylesheet" type="text/css"/>
    <link href="/css/index2_hx.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/lib/layer/layer.js"></script>
    <script type="text/javascript" src="/js/laypage/laypage.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <style>
        .maptab {
            margin-top: 30px;
        }

        .maptab td {
            line-height: 50px;
            border-bottom: 1px solid #dddddd;
            font-size: 14px;
        }

        .maptab td a {
            display: inline-block;
            width: 100px;
            text-align: center;
            line-height: 50px;
            color: #0f74a8
        }
    </style>
</head>
<body  style="background-color:#f5f5f9;">
<!--头部 开始-->

<#if typego?? && typego == 'zh'>
    <link href="/css/index_zhihui.css" rel="stylesheet" type="text/css" />
    <div class="cas_head" id="cas_head">
        <#include "/public/topnav_hx.ftl">
        <#include "/public/topnav_hx.ftl">
        <#include "/public/topnav_hx.ftl">
        <#include "/public/headnav_hx.ftl">
        <#include "/public/headnav_hx.ftl">
        <#include "/public/headnav_hx.ftl">
        <#include "/public/headnav_hx.ftl">
    </div>
<#else>
    <div class="cas_head" id="cas_head">
        <#include "/public/topnav.ftl">
        <#include "/public/topnav.ftl">
        <#include "/public/topnav.ftl">
        <#include "/public/headnav_shop.ftl">
        <#include "/public/headnav_shop.ftl">
        <#include "/public/headnav_shop.ftl">
        <#include "/public/headnav_shop.ftl">
    </div>
</#if>
<!--头部 结束-->
<div class="hs_bk_content">
    <div class="about" style="width: 100%;">
        <h2>
            <ul>
                <#if abouts??>
                    <#list abouts as about>
                        <#if about.id == aboutInfo.id>
                            <li class="on"><a href="/about?id=${about.id}" target="_self" id="titleval">${about.title}</a></li>
                        <#else>
                            <li><a href="/about?id=${about.id}" target="_self">${about.title}</a></li>
                        </#if>
                    </#list>
                </#if>
                <!-- -
                <li class="on"><a href="/about/info?sign=aboutus" target="_blank">关于我们</a></li>
                     <li><a href="/about/info?sign=contactus" target="_blank">联系我们</a></li>
                     <li><a href="#" target="_blank">法律声明</a></li>
                     <li><a href="/about/info?sign=useragreement" target="_blank">服务条款</a></li>
                     <li><a href="/about/info?sign=networkmap" target="_blank">网站地图</a></li>
                -->
            </ul>
        </h2>
        <div class="about_main">

            <h3>${(aboutInfo.title)!""}</h3>

            <p>${(aboutInfo.content)!""}</p>
        </div>
    </div>
</div>
<!-- 底部 开始-->
<#if typego?? && typego == 'zh'>
    <#include "/public/bottom_hx.ftl">
<#else>
    <#include "/public/bottom.ftl">
</#if>
<!--底部 结束-->
</body>
</html>
<script>
    // 切换分类
    $(function () {
        $('.blk-list-tit li').on('click', function () {
            $(this).addClass('active').siblings('li').removeClass('active');
        });
        // 头部选中
        $('.classify-title ul li a').on('click', function () {
            $(this).addClass('active').siblings('li').removeClass('active');
        });

        $('.product-list-more').on('click', function () {
            var text = $(this).text();
            var ul = $(this).closest('div').find('ul');
            if (text == "更多") {
                $(this).text("收起").addClass('up');
                ul.css("height", "auto");
            } else {
                $(this).text("更多").removeClass('up');
                ul.css("height", "54px");
            }
        });

        $(document).on('click', '.list-head-1.selected-classify .close', function () {
            $(this).closest('li').remove();
        });

        $('.list-head-1').not('.selected-classify').find('li').on('click', function () {
            var text = $(this).text();
            var li = $('<li><a href="javascript:;">' + text + '<i class="close">X</i></a></li>');
            li.appendTo($('.selected-classify ul'));
        });

        $('.list-head-1.selected-classify .delete-all').on('click', function () {
            $(this).closest('.selected-classify').find('li').remove();
        });

    });
</script>
