<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> ${companyName!}-招标中心-${title}</title>
    <link href="/css/index_eval.css?v=1.0" rel="stylesheet" type="text/css"/>
    <link href="/css/jquery.bxslider.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.9.1.js"></script>
    <script src="/js/custom.min.js"></script>
    <!-- moment -->
    <script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/lib/layer/layer.js"></script>
    <script type="text/javascript" src="/js/laypage/laypage.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <link href="/css/index_hx.css" rel="stylesheet" type="text/css"/>
    <style>
        .search-form {
            padding-top: 10px;
            padding-left: 10px;
        }

        .search-form .search-item {
            padding: 10px;
            line-height: 50px;
            height: 50px;
            width: 440px;
            display: inline-block;
        }

        .search-form input {
            height: 30px;
            border: 1px solid #dfe1e6;
            padding: 0 10px;
            margin-left: 10px;
            width: 280px;
        }

        .search-item select {
            display: inline-block;
            vertical-align: middle;
            color: #717787;
            line-height: 32px;
            height: 32px;
            padding: 0 12px;
            border: 1px solid #dfe1e6;
            border-radius: 0;
            -webkit-appearance: none;
            background-image: url('/images/hs_bk_icon10_2.png');
            background-repeat: no-repeat;
            background-position: 97% 13px;
            width: 60px;
            background-size: 6px auto;
            width: 300px;
            margin-left: 10px;
        }

        .search-form button.btn-search {
            display: inline-block;
            vertical-align: middle;
            margin: 0 5px;
            width: 80px;
            height: 30px;
            border: 1px solid #ac2807;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            line-height: 30px;
            background-color: #ac2807;
            color: #fff;
            margin-left: 50px;
        }
    </style>
</head>
<body>
<!--头部 开始-->
<div class="cas_head" id="cas_head">
    <#include "/public/topnav.ftl">
</div>
<div class="shop_head">
    <font>
        <input name="keyword" type="text" id="topKeyWord" class="bk_input01" value="${bidQuery.title!}"/>
        <input name="" type="button" class="bk_input02" value="搜全站" onclick="selectByType(0)"/>
        <input name="" type="button" class="bk_input03" value="搜本采购" onclick="selectByType(1)"/>
    </font>
    <div class="hs_bk_logo">
        <a href="/buyerCenter/index?memberId=${member.id?c}">
            <img src="${member.headimg!}" style="height: 75px;" onerror='this.src="/images/hs_bk_pic01.jpg"'>
        </a>
    </div>
    <dl>
        <dt>
            <a href="/buyerCenter/index?memberId=${member.id?c}">
                ${companyName!}
            </a>
        </dt>
        <dd>
            <#if member??>
                <#if member.informationLevel?? && member.informationLevel==3>
                    <img src="/images/hs_bk_icon01.png">
                <#elseif member.informationLevel?? && member.informationLevel==2>
                    <img src="/images/hs_bk_icon02.png">
                <#else>
                    <img src="/images/hs_bk_icon03.png">
                </#if>
            <#else>
                <img src="/images/hs_bk_icon03.png">
            </#if>
            <img src="/images/hs_bk_icon07.png"></i>
        </dd>
    </dl>
</div>
<div class="shop_nav">
    <div class="shop_nav_main">
        <div class="shop_nav_right">
            <ul>
                <li>
                    <a href="/buyerCenter/index?memberId=${member.id}">首页</a>
                </li>
                <li class="active"><a href="/buyerCenter/bidList?memberId=${member.id}">招标公告</a></li>
                <li><a href="/buyerCenter/noticeList?memberId=${member.id}">中标公告</a></li>
                <li><a href="/buyerCenter/helpList?memberId=${member.id}">帮助中心</a></li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!--头部 结束-->
<div class="hs_bk_content">

    <p class="current-position">当前位置：
        <a href="/buyerCenter/index?memberId=${member.id?c}">采购商首页</a> >
        <a href="/buyerCenter/bidList?memberId=${member.id?c}"">采购商招标列表</a>
    </p>


    <div class="product-list-head  clearfix">
        <div class="list-head-1 clearfix">
            <form action="/buyerCenter/bidList" class="search-form" id="mySearchFrom">
                <div>
                    <div class="classify-title">
                        <span>分类：</span>
                    </div>
                    <ul class="clearfix">
                        <#if bidCateId?? && bidCateId == 0>
                            <li class="active"><a href="javascript:cateClick(0)">全部 </a></li>
                            <#if bidCategorys??>
                                <#list bidCategorys as cate>
                                    <li><a href="javascript:cateClick(${cate.id?c})">${cate.name}</a></li>
                                </#list>
                            </#if>
                        <#else>
                            <#if  children?? && children>
                                <li class="active"><a href="javascript:cateClick('${cateInfo.parentId}')">全部 </a></li>
                                <#if bidCategorys??>
                                    <#list bidCategorys as cate>
                                        <li><a href="javascript:cateClick(${cate.id?c})">${cate.name}</a></li>
                                    </#list>
                                </#if>
                            <#else>
                                <li><a href="javascript:cateClick('${cateInfo.parentId}')">全部 </a></li>
                                <#if bidCategorys??>
                                    <#list bidCategorys as cate>
                                        <#if bidCateId == cate.id>
                                            <li class="active"><a
                                                        href="javascript:cateClick(${cate.id?c})">${cate.name}</a>
                                            </li>
                                        <#else>
                                            <li><a href="javascript:cateClick(${cate.id?c})">${cate.name}</a></li>
                                        </#if>
                                    </#list>
                                </#if>
                            </#if>
                        </#if>
                    </ul>
                    <em class="product-list-more" style="top: 25px;">更多</em>
                </div>
                <div class="search-item">
                    <span>招标公告名称</span>
                    <lable>
                        <input type="text" name="title" class="input-search" value="${bidQuery.title!}"
                               placeholder="请输入招标公告名称">
                    </lable>
                </div>

                <input type="hidden" name="memberId" value="${member.id?c}">
                <div class="search-item">
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;招标状态</span>
                    <lable>
                        <select name="bidStatus">
                            <option value="">全部</option>
                            <option value="0">报名中</option>
                            <option value="1">已截止</option>
                        </select>
                        <script>
                            $('[name="bidStatus"]').val('${bidQuery.bidStatus!}')
                        </script>
                    </lable>
                </div>

                <div class="search-item">
                    <span>报名截止日期</span>
                    <lable>
                        <input id="datemax" class="Wdate" name="signEnd"
                               <#if bidQuery.signEnd??>value="${bidQuery.signEnd?string("yyyy-MM-dd")}" </#if>
                               class="Wdate input-search" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    </lable>
                </div>

                <div class="search-item">
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属项目</span>
                    <lable>
                        <input type="text" name="bidProjectName" value="${bidQuery.bidProjectName!}"
                               class="input-search" placeholder="请输入招标所属项目">
                    </lable>
                </div>

                <input type="hidden" name="bidCateId" value="${bidCateId!}">

                <button class="btn-search">查找</button>
            </form>
        </div>
    </div>
    <!--招标列表主体 开始-->
    <div class="hs_bk_blk11" style="width: 1200px;">
        <#if entitys?has_content>
            <ul>
                <li>序号</li>
                <li style="margin-left: 58px;">公告名称</li>
                <li style="margin-left: 274px;">招标项目</li>
                <li style="margin-left: 120px;">发布时间</li>
                <li style="margin-left: 150px;">报名截止时间</li>
                <li style="margin-left: 172px;">操作</li>
            </ul>
            <div class="clear"></div>
            <table width="1200" border="0" cellspacing="0" cellpadding="0">
                <#list entitys as entity>
                    <tr>
                        <td width="50">${entity_index+1}</td>
                        <td width="200" style="text-align: left;">
                            <a href="/bid/detail?id=${entity.id?c}" style="color: #446bcc">
                                ${entity.title!}
                            </a>
                        </td>
                        <td width="150">
                            <#if entity.projectid??>
                                <a href="/project/img/indexview?id=${entity.projectid?c}"
                                   target="_blank" style="color: #446bcc">${entity.projectName!}</a>
                            <#else>
                                ${entity.projectName!}
                            </#if>
                        </td>
                        <td width="100">
                            ${entity.created!} 发布<br>
                        </td>
                        <td width="200">
                            ${entity.signEnd!} <br>
                            <#if entity.sign>
                                剩余<i>${entity.days!}</i>天
                            <#else>
                                已截止
                            </#if>
                        </td>
                        <td width="150">
                            <a
                                    <#if entity.sign>
                                        href="/bid/detail?id=${entity.id?c}"
                                    <#else>
                                        href="javascript:;"
                                    </#if>
                                    class="bk_a04"
                                    style="width: 80px; <#if !entity.sign>background-color:#cccccc;border:1px solid #cccccc;</#if>">马上报名</a>
                            <#--                            <a href="javascript:;" onclick="AddFav('${entity.id?c}')" class="bk_a04">收藏</a>-->
                        </td>
                    </tr>
                </#list>
            </table>
        <#else>
            <img src="/images/no-info.png" style="margin-left: 225px;"/>
        </#if>

        <#if pageCount ??>
            <div class="list_box" id="listBox">
                <div class="clear"></div>
                <div class="at_page" id="pager" style="margin:20px 0 20px 0;"></div>
                <script type="text/javascript">LaypageConfig("${pageCount?c}", "CN");</script>
            </div>
        </#if>
    </div>
    <!--招标列表主体 结束-->
</div>
<!-- 底部 开始-->
<#include "/public/bottom.ftl">
<!--底部 结束-->
</body>
</html>
<script>
    function selectByType(type) {
        var searchKeyWord = $("#topKeyWord").val()
        if (searchKeyWord) {
            if (type == 0) {
                window.location.href = "/bid/list?title=" + searchKeyWord;
            }
            if (type == 1) {
                window.location.href = "/buyerCenter/bidList?memberId=${member.id?c}&title=" + searchKeyWord;
            }
        }
    }

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

    function AddFav(bidId) {
        $.ajax({
            type: "post", async: false, global: false, dataType: "json",
            url: "/product/cart/fav",
            data: "targettype=5&targetid=" + bidId,
            success: function (data) {
                if (data.code == "000000") {
                    layer.msg(data.msg, {offset: '200px', anim: 1, icon: 1, shade: 0.3});
                } else if (data.code == "100001") {
                    window.location = "/login?returnURL=" + encodeURIComponent(location.href);
                } else {
                    layer.msg(data.msg, {offset: '200px', anim: 1, icon: 1, shade: 0.3});
                }
            }
        });
    }

    function cateClick(cateId) {
        $("[name='bidCateId']").val(cateId);
        $("#mySearchFrom").submit();
    }
</script>
