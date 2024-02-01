﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${title_!}-${title}</title>
     
    <script src="/js/jquery-1.9.1.js"></script>
    <link href="/css/2222.css" rel="stylesheet" type="text/css"/>
     
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
        <#include "/public/asd.ftl">
         
    </div>
<#else>
    <div class="cas_head" id="cas_head">
         
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
        

    });
</script>
