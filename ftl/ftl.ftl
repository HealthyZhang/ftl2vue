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
        .hx_zb_pc_right ul li p {
            font-size: 12px;
            font-weight: normal;
            line-height: 26px;
            color: #717787;
            height: 40px;
            display: block;
            overflow: hidden;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(223,225,230,.5);
            padding: 10px;
        }

        ul.fonsty li p {
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
        }
        p.tipsty {
            cursor: pointer;
        }
        p.longsty {
            margin-left: 60px;
        }
        .hx_zb_ph_right ul li a img {
            width: 100%;
            height: 132px;
        }
        /*.dropList dl dd a img {
            width: 90px !important;;
            height: 60px !important;;
            border: 1px solid #eeeeee;
            float: left;
            display: inline;
        }*/
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
    <div class="hx_parta">
        <div class="hx_pa_left">
            <h2><img src="/images/hx_zb_icon05.png">行业分类</h2>
            <div class="nav_main_left_box">
                <div class="testbox">
                    <ul>
                        <#if treecates?? && (treecates?size > 0)>
                            <#list treecates as trect>
                                <li>
                                    <dl class="a3">
                                        <dd>
                                            <a href="/bid/list?bidCateId=${trect.id!}" target="_blank">${trect.name!}</a>
                                        </dd>
                                    </dl>
                                    <div class="boxshow" id="xs01">
                                        <div class="boxshow_left">
                                            <#if trect.children?? && (trect.children?size > 0)>
                                                <#list trect.children as twotrect>
                                                    <dl class="dst5">
                                                        <dt><a href="/bid/list?bidCateId=${trect.id!}" target="_blank">${twotrect.name!}</a></dt>
                                                        <dd>
                                                            <#if twotrect.children?? && (twotrect.children?size > 0)>
                                                                <#list twotrect.children as threetrect>
                                                                    <a href="/bid/list?bidCateId=${trect.id!}" target="_blank">${threetrect.name!}</a>
                                                                </#list>
                                                            </#if>
                                                        </dd>
                                                        <div class="clear"></div>
                                                    </dl>
                                                </#list>
                                            </#if>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="hx_pa_mid">
            <!--轮播 开始-->
            <div class="banner" style=" height:330px; width:716px; padding:0; margin:0; width:100%; overflow:hidden;">
                <div class="slide-main" id="touchMain">
                    <a class="prev" href="javascript:;" stat="prev1001"><img src="/images/hximg/left_bu.png"></a>
                    <div class="slide-box" id="slideContent">
                        <#if wisdomList??>
                            <#assign icount = 0 />
                            <#list wisdomList as ad>
                                <#assign icount = icount + 1 />
                                <div style="opacity: 1; z-index: 8; display: block;" class="slide banAnimate" id="bgstylea">
                                    <a stat="sslink-${icount!}" href="${ad.link!''}"  style="background-image: url(${ad.media!''}); background-repeat:no-repeat; background-position:top center;" class="banner_a">
                                    </a>
                                </div>
                            </#list>
                        </#if>
                    </div>
                    <a class="next" href="javascript:;" stat="next1002"><img src="/images/hximg/right_bu.png"></a>
                    <div class="item">
                        <a  stat="item1001" href="javascript:;" class="cur"></a><a  href="javascript:;" stat="item1002"></a><a href="javascript:;" stat="item1003"></a><a href="javascript:;" stat="item1004"></a><a href="javascript:;" stat="item1005"></a>
                    </div>
                </div>
            </div>
            <!--轮播 结束-->
            <div class="hx_zb_num">
                <dl>
                    <dt><img src="/images/hximg/hx_zb_icon06.png"></dt>
                    <dd>
                        <ul>
                         <#if bigRsList??>
                            <#list bigRsList as binfo>
                            <#if binfo_index<2>
                                <li><font>${binfo.created?string("MM-dd")}</font>
                                    祝贺<a href="/bid/notice/detail?id=${binfo.id}" target="_blank">${binfo.title!}！</a></li>
                            </#if>
                            </#list>
                         </#if>
                            <#--<li><font>09-28</font>祝贺<a href="#" target="_blank">此处文字间隔固定时间向上滚动！</a></li>
                            <li><font>09-28</font>祝贺<a href="#" target="_blank">青岛华腾地产有限公司入驻！(同上)</a></li>-->
                        </ul>
                        <div class="clear"></div>
                    </dd>
                    <div class="clear"></div>
                </dl>
                <ul class="num">
                    <li>供应商<strong>${memCount!}</strong>家</li>
                    <li>招标方<strong>${goldcount!}</strong>家</li>
                    <li>招标信息<strong>${bigcs!}</strong>条</li>
                    <#--<li>招募信息<strong>11600</strong>条</li>-->
                </ul>
            </div>
        </div>
        <div class="hx_pa_right">
            <dl class="dst01">
                <dt><img src="/images/hximg/yd_tx.jpg"><p>华夏基石云.智慧招标欢迎您！</p></dt>
                <dd>
                    <#if memberInfo??>
                        <#if memberSubLogin?? && memberSubLogin>
                           <p class="longsty"> ${memberSubInfo.account!}</p>
                        <#else>
                            <#if memberInfo.membername?? && memberInfo.membername!=''>
                    <p class="longsty">  ${memberInfo.membername!}</p>
                            <#else>
                    <p class="longsty">  ${memberInfo.mobile!}</p>
                            </#if>
                        </#if>
                    <#else>
                    <a href="javascript:;" onclick="login()" target="_blank" class="a01">登录</a>
                    <a href="/register/" target="_blank" class="a02">注册</a></dd>
                    </#if>

            </dl>
            <h2>
                <ul>
                    <li id="a01" class="on">供应商专享</li>
                    <li id="a02">招标方专享</li>
                </ul>
            </h2>
            <div class="h2_box">
                <ul id="aa01">
                    <li><a href="/seller/bid/list" target="_blank"><div class="img_box"><img src="/images/hximg/hx_zb_icon07.png"></div>我的投标</a></li>
                    <li><a href="/seller/bid/list?status=5 " target="_blank"><div class="img_box"><img src="/images/hximg/hx_zb_icon08.png"></div>我的中标</a></li>
                    <li><a href="/member/inquiry?type=3" target="_blank"><div class="img_box"><img src="/images/hximg/hx_zb_icon09.png"></div>我的竞价</a></li>
                </ul>
                <ul id="aa02" style="display:none;">
                    <li><a href="/buyer/bid/list" target="_blank"><div class="img_box"><img src="/images/hximg/hx_zb_icon10.png"></div>我的招标</a></li>
                    <li><a href="/member/orders" target="_blank"><div class="img_box"><img src="/images/hximg/hx_zb_icon11.png"></div>我的订单</a></li>
                    <li><a href="/myfavorite/list" target="_blank"><div class="img_box"><img src="/images/hximg/hx_zb_icon12.png"></div>我的收藏</a></li>
                </ul>
            </div>
            <h3><a href="/information" target="_blank">全部 ></a><img src="/images/hximg/hx_zb_tit.jpg"></h3>
            <ul class="list02">
                <#if latestInfomationList??>
                    <#assign icount = 0 />
                    <#list latestInfomationList as info>
                        <#assign icount = icount+1 />
                        <#if info_index<5>
                            <li><a href="/information/detail?id=${info.id}" target="_blank">${info.title!}</a></li>
                        </#if>
                    </#list>
                </#if>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="hx_zb_partb">
        <h2 class="h2_tit01"><a href="/bid/list" target="_blank">全部招募招标<i>></i></a>工程招标<font>共享商机 携手共赢</font></h2>
        <div class="hx_zb_pb_left">
            <ul class="hx_list01">
                <li class="on">招标信息<span><strong>${bidTotal!}</strong>条</span></li>
                <#-- <li class="on">招募信息<span><strong>3264</strong>条</span></li>-->
            </ul>
            <ul class="hx_list02">
                <li><img src="/images/hximg/hx_zb_icon13.png">海量信息</li>
                <li><img src="/images/hximg/hx_zb_icon13.png">及时更新</li>
                <li><img src="/images/hximg/hx_zb_icon13.png">快速推送</li>
            </ul>
        </div>
        <div class="hx_zb_pb_mid">
            <ul>
                <#if bidList??>
                    <#list bidList as biddate>
                        <#if biddate_index<8>
                            <li>

                                <div class="tag"><font>招 标</font></div>
                                <h3><a href="/bid/detail?id=${biddate.id!}" target="_blank">${biddate.title!}</a></h3>
                                <div class="li_box"><i>${biddate.cateName!}</i></div>
                                <p>招标数量：<em>${biddate.caseAmount!}</em>项</p>
                                <p>发布时间：${biddate.created!}</p>
                                <#if biddate.sign>
                                    <p>剩余天数：<strong>${biddate.days!}</strong>天</p>
                                <#else>
                                    <p>剩余天数：已截止</p>
                                </#if>

                                <span><font>企</font>${biddate.memberName!}</span>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <div class="clear"></div>
            <ul>
                <li>
                    <div class="tag"><font class="font2">招 募</font></div>
                    <h3><a href="javascript:;" target="_blank">青岛文旅综合体项目B40地块供
                            电供货及安装工程2</a></h3>
                    <div class="li_box"><i>基础及主体工程</i></div>
                    <p>招标数量：<em>20</em>项</p>
                    <p>发布时间：08/20</p>
                    <p>剩余天数：<strong>2</strong>天</p>
                    <span><font>企</font>青岛隆江地产有限公司</span>
                </li>
                <li>
                    <div class="tag"><font class="font2">招 募</font></div>
                    <h3><a href="#" target="_blank">青岛文旅综合体项目B40地块供
                            电供货及安装工程</a></h3>
                    <div class="li_box"><i>基础及主体工程</i></div>
                    <p>招标数量：<em>20</em>项</p>
                    <p>发布时间：08/20</p>
                    <p>剩余天数：<strong>2</strong>天</p>
                    <span><font>企</font>青岛隆江地产有限公司</span>
                </li>
                <li>
                    <div class="tag"><font class="font2">招 募</font></div>
                    <h3><a href="#" target="_blank">青岛文旅综合体项目B40地块供
                            电供货及安装工程</a></h3>
                    <div class="li_box"><i>基础及主体工程</i></div>
                    <p>招标数量：<em>20</em>项</p>
                    <p>发布时间：08/20</p>
                    <p>剩余天数：<strong>2</strong>天</p>
                    <span><font>企</font>青岛隆江地产有限公司</span>
                </li>
                <li>
                    <div class="tag"><font style=" background-color:#c8c8c8">招 募</font></div>
                    <h3><a href="#" target="_blank">青岛文旅综合体项目B40地块供
                            电供货及安装工程</a></h3>
                    <div class="li_box"><i>基础及主体工程</i></div>
                    <p>招标数量：<em>20</em>项</p>
                    <p>发布时间：08/20</p>
                    <p>剩余天数：<strong>已结束</strong></p>
                    <span><font>企</font>青岛隆江地产有限公司</span>
                </li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="hx_zb_partc">
        <div class="hx_zb_pc_left">
            <h3>中标公告</h3>
            <#if bigcountRs??>
                <font>
                <#list bigcountRs as bc>
                   <i>${bc!}</i>
                </#list>条
                </font>
            </#if>
            <a href="/bid/notice/list" target="_blank">全部公告</a>
        </div>
        <div class="hx_zb_pc_right">
            <ul class="fonsty">
                <#if bigRsList??>
                    <#list bigRsList as bigrs>
                        <#if bigrs_index<4>
                            <li>
                                <a href="/bid/notice/detail?id=${bigrs.id!}"  target="_blank"><font>祝贺</font>${bigrs.title!}</a>
                                <p class="tipsty" title="${bigrs.title!}"><font>中标项目:</font>${bigrs.title!}</p>
                                <span><img src="/images/hximg/hx_zb_icon14.png">${bigrs.created?string("yyyy-MM-dd")}  发布</span>
                                <div class="icon_box"><img src="/images/hximg/zb.png"></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

    <div class="partg_bg" style=" margin-top:50px;">
        <div class="hx_zb_partg">
            <h2 class="h2_tit01"><a href="/buyerCenter/index" target="_blank">全部招标方<i>></i></a>招标方<font>大牌企业 实力云集</font></h2>
            <div class="hx_zb_pg_left">
                <ul class="hx_list05">
                    <li class="on" id="d01">招标方<span><strong>${goldcount!}</strong>家</span></li>
                    <#--<li id="d02">百强招标方<span><strong>3264</strong>家</span></li>-->
                </ul>
                <ul class="hx_list06">
                    <li><img src="/images/hximg/hx_zb_icon13.png">大牌企业</li>
                    <li><img src="/images/hximg/hx_zb_icon13.png">实力认证</li>
                    <li><img src="/images/hximg/hx_zb_icon13.png">精英汇聚</li>
                </ul>
            </div>
            <div class="hx_zb_pg_mid" id="dd01">
                <ul>
                    <#if bidsgoldList??>
                        <#list bidsgoldList as bids>
                            <#if bids_index<4>
                                <li>
                                    <a href="/buyerCenter/index?memberId=${bids.id}" target="_blank">
                                        <#if bids.headimg??>
                                            <img src="${bids.headimg!}">
                                        <#else>
                                            <img src="/images/default_hx.png">
                                        </#if>
                                        ${bids.membername!}</a>
                                    <div class="li_box">
                                        <span>招标<strong>10</strong></span>
                                        <#-- <span>招募<strong>258</strong></span>-->
                                        <span>项目<strong>17</strong></span>
                                    </div>
                                    <p><span>${bids.regtime?string("yyyy-MM-dd")} 入驻</span>所在:重庆</p>
                                </li>
                            </#if>
                        </#list>
                    </#if>

                </ul>
                <div class="clear"></div>
            </div>
            <div class="hx_zb_pg_mid" id="dd02" style="display:none;">
                <ul>
                    <li>
                        <a href="#" target="_blank"><img src="/images/hximg/business_logo.jpg">重庆融汇地产有限公司重庆融汇地产有限公司</a>
                        <div class="li_box">
                            <span>招标<strong>10</strong></span>
                            <span>招募<strong>258</strong></span>
                            <span>项目<strong>17</strong></span>
                        </div>
                        <p><span>2021-05-18 入驻</span>所在:重庆</p>
                        <font>百强</font>
                    </li>
                    <li>
                        <a href="#" target="_blank"><img src="/images/hximg/business_logo.jpg">重庆融汇地产有限公司重庆融汇地产有限公司</a>
                        <div class="li_box">
                            <span>招标<strong>10</strong></span>
                            <span>招募<strong>258</strong></span>
                            <span>项目<strong>17</strong></span>
                        </div>
                        <p><span>2021-05-18 入驻</span>所在:重庆</p>
                        <font>百强</font>
                    </li>
                    <li>
                        <a href="#" target="_blank"><img src="/images/hximg/business_logo.jpg">重庆融汇地产有限公司重庆融汇地产有限公司</a>
                        <div class="li_box">
                            <span>招标<strong>10</strong></span>
                            <span>招募<strong>258</strong></span>
                            <span>项目<strong>17</strong></span>
                        </div>
                        <p><span>2021-05-18 入驻</span>所在:重庆</p>
                        <font>百强</font>
                    </li>
                    <li>
                        <a href="#" target="_blank"><img src="/images/hximg/business_logo.jpg">重庆融汇地产有限公司重庆融汇地产有限公司</a>
                        <div class="li_box">
                            <span>招标<strong>10</strong></span>
                            <span>招募<strong>258</strong></span>
                            <span>项目<strong>17</strong></span>
                        </div>
                        <p><span>2021-05-18 入驻</span>所在:重庆</p>
                        <font>百强</font>
                    </li>

                </ul>
                <div class="clear"></div>
            </div>
            <div class="hx_zb_pg_info">
                <h3>实力招标方推荐</h3>
                <ul class="hx_list07">
                    <#if bidpxlist??>
                        <#list bidpxlist as bp>
                            <#if bp_index<3>
                                <li><font>荐</font><a href="/buyerCenter/index?memberId=${bp.id!}" target="_blank">${bp.companyname!}</a>
                                    <span>所在:${bp.stateStr!} | 招标招募:${bp.amount!}项 | ${bp.totalAddres!}</span></li>
                            </#if>
                        </#list>
                    </#if>
                    <#-- <li><font>荐</font><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><span>所在:四川 | 招标招募:120项 | 四川百强地产企业</span></li>
                     <li><font>荐</font><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><span>所在:四川 | 招标招募:120项 | 四川百强地产企业</span></li>
                     <li><font>荐</font><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><span>所在:四川 | 招标招募:120项 | 四川百强地产企业</span></li>-->
                </ul>
                <h3 style=" margin-top:22px; margin-bottom:10px;">最新入驻招标方</h3>
                <ul class="hx_list08" >
                    <#if bidsList??>
                        <#list bidsList as bid>
                            <#if bid_index<6>
                                <li><a href="/buyerCenter/index?memberId=${bid.id!}" style="width: 150px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            word-break: break-all;" target="_blank">${bid.membername!}</a><img src="/images/hximg/new.png"></li>
                            </#if>
                        </#list>
                    </#if>
                    <#--<li><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><img src="/images/hximg/new.png"></li>
                    <li><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><img src="/images/hximg/new.png"></li>
                    <li><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><img src="/images/hximg/new.png"></li>
                    <li><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><img src="/images/hximg/new.png"></li>
                    <li><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><img src="/images/hximg/new.png"></li>
                    <li><a href="#" target="_blank">四川蓝城旅游开发有限公司</a><img src="/images/hximg/new.png"></li>-->
                </ul>
            </div>
            <div class="hx_zb_pg_right">
                <h3><span>TOP10</span>活跃招标方排行</h3>
                <div class="dropList" id=0>
                    <#if activesorts??>
                        <#assign icount = 0 />
                        <#list activesorts as active>
                            <#if active_index<10>
                                <#if active_index==0>
                                    <#assign icount = icount+1 />
                                    <dl>
                                        <dt><p><font>1</font>${active.membername!}</p></dt>
                                        <dd>
                                            <a href="/buyerCenter/index?memberId=${active.id!}" target="_blank">
                                                <div class="img_box"><img <#if active.headimg?has_content>
                                                    src="${active.headimg!}"
                                                <#else>
                                                    src="/images/default_hx.png"
                                                        </#if>></div>
                                                <p>${active.membername!}<span>累计招标<strong>${active.bcount!}</strong>项</span></p>
                                                <font>1</font>
                                            </a>
                                        </dd>
                                    </dl>
                                <#elseif active_index==1>
                                    <#assign icount = icount+1 />
                                    <dl>
                                        <dt><p><font>2</font>${active.membername!}</p></dt>
                                        <dd>
                                            <a href="/buyerCenter/index?memberId=${active.id!}" target="_blank">
                                                <div class="img_box"><#if active.headimg??>
                                                    <img src="${active.headimg!}">
                                                <#else>
                                                    <img src="/images/default_hx.png">
                                                    </#if></div>
                                                <p>${active.membername!}<span>累计招标<strong>${active.bcount!}</strong>项</span></p>
                                                <font>2</font>
                                            </a>
                                        </dd>
                                    </dl>
                                <#elseif active_index==2>
                                    <#assign icount = icount+1 />
                                    <dl>
                                        <dt><p><font>3</font>${active.membername!}</p></dt>
                                        <dd>
                                            <a href="/buyerCenter/index?memberId=${active.id!}" target="_blank">
                                                <div class="img_box"><#if active.headimg??>
                                                    <img src="${active.headimg!}">
                                                <#else>
                                                    <img src="/images/default_hx.png">
                                                    </#if></div>
                                                <p>${active.membername!}<span>累计招标<strong>${active.bcount!}</strong>项</span></p>
                                                <font>3</font>
                                            </a>
                                        </dd>
                                    </dl>
                                <#else>
                                    <#assign icount = icount+1 />
                                    <dl>
                                        <dt><p><font>${icount!}</font>${active.membername!}</p></dt>
                                        <dd>
                                            <a href="/buyerCenter/index?memberId=${active.id!}" target="_blank">
                                                <div class="img_box"><#if active.headimg??>
                                                    <img src="${active.headimg!}">
                                                <#else>
                                                    <img src="/images/default_hx.png">
                                                    </#if></div>
                                                <p>${active.membername!}<span>累计招标<strong>${active.bcount!}</strong>项</span></p>
                                                <font>${icount!}</font>
                                            </a>
                                        </dd>
                                    </dl>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
                </div>
                <SCRIPT type=text/javascript>$('#0').AdAdvance();</SCRIPT>
            </div>
        </div>
    </div>
    <div class="partg_bg" style="padding:40px 0 50px 0;">
        <div class="hx_zb_partg">
            <h2 class="h2_tit01"><a href="/shopCenter/info" target="_blank">全部供应商<i>></i></a>供应商<font>专业品质 服务至上</font></h2>
            <div class="hx_zb_pg_left"  style="background-image:url(/images/hximg/hx_div_bg04.jpg);">
                <ul class="hx_list05">
                    <li class="on" id="c01">金牌供应商<span><strong>${sellgoldcount!}</strong>家</span></li>
                    <li id="c02">银牌供应商<span><strong>${sellsilvercount!}</strong>家</span></li>
                    <#-- <li id="c03">银牌供应商<span><strong>3264</strong>家</span></li>-->
                </ul>
                <ul class="hx_list06">
                    <li><img src="/images/hximg/hx_zb_icon13.png">绿色低碳</li>
                    <li><img src="/images/hximg/hx_zb_icon13.png">资质认证</li>
                    <li><img src="/images/hximg/hx_zb_icon13.png">服务保障</li>
                </ul>
            </div>
            <div class="hx_zb_pg_mid2" id="cc02" style="display:none;">
                <ul>
                    <#if sellsilverList??>
                        <#list sellsilverList as silver>
                            <#if silver_index<2>
                                <li>
                                    <a href="/shopCenter/info?memberId=${silver.id}" target="_blank">
                                        <#if silver.headimg??>
                                            <img src="${silver.headimg!}">
                                        <#else>
                                            <img src="/images/default_hx.png">
                                        </#if>
                                        ${silver.membername!}</a>
                                    <p><span>主营:空调及电器设备</span><img src="/images/hximg/hx_tb_icon04.png"><img src="/images/hximg/hx_tb_icon02.png"></p>
                                    <div class="li_box">
                                        <span>服务商家<font><strong>${silver.randomnum!}</strong>家</font></span>
                                        <#-- <span>被入库<font><strong>10</strong>家</font></span>-->
                                        <span>入驻时间<font><strong>${silver.datestr!}</strong></font></span>
                                    </div>
                                </li>

                            </#if>
                        </#list>
                    </#if>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="hx_zb_pg_mid2" id="cc01" style="">
                <ul>
                    <#if sellgoldList??>
                        <#list sellgoldList as gold>
                            <#if gold_index<4>
                                <li>
                                    <a href="/shopCenter/info?memberId=${gold.id!}" target="_blank">
                                        <#if gold.headimg??>
                                            <img src="${gold.headimg!}">
                                        <#else>
                                            <img src="/images/default_hx.png">
                                        </#if>

                                        ${gold.membername!}</a>
                                    <p><span>主营:空调及电器设备</span><img src="/images/hx_tb_icon03.png"><img src="/images/hx_tb_icon02.png"></p>
                                    <div class="li_box">
                                        <span>服务商家<font><strong>${gold.randomnum!}</strong>家</font></span>
                                        <#-- <span>被入库<font><strong>10</strong>家</font></span>-->
                                        <span>入驻时间<font><strong>${gold.datestr!}</strong></font></span>
                                    </div>
                                </li>
                            </#if>
                        </#list>
                    </#if>

                </ul>
                <div class="clear"></div>
            </div>
            <div class="hx_zb_pg_info">
                <h3>实力供应商推荐</h3>
                <ul class="hx_list07">
                    <#if beforelist??>
                        <#list beforelist as blis>
                            <#if blis_index<3>
                                <li><font>荐</font><a href="/shopCenter/info?memberId=${blis.memberId!}" target="_blank">${blis.membername!}</a>
                                    <span>所在:${blis.provinceStr!} | 主营:${blis.mainsell!}</span></li>
                            </#if>
                        </#list>
                    </#if>
                </ul>
                <h3 style=" margin-top:22px; margin-bottom:10px;">最新入驻供应商</h3>
                <ul class="hx_list08" >
                    <ul>
                        <#if sellList??>
                            <#list sellList as sell>
                                <#if sell_index<6>
                                    <li><a class="lensty" style="width: 150px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            word-break: break-all;" href="/shopCenter/info?memberId=${sell.id!}" target="_blank">${sell.membername!}</a>
                                        <img  src="/images/hximg/new.png">
                                    </li>
                                </#if>
                            </#list>
                        </#if>
                    </ul>
            </div>
            <div class="hx_zb_pg_right">
                <h3><span>TOP10</span>活跃供应商排行</h3>
                <div class="dropList" id=1>
                    <#if supplierlist??>
                        <#assign icount = 0 />
                        <#list supplierlist as sup>
                            <#assign icount = icount+1 />
                            <#if sup_index<10>
                                <#if sup_index==0>
                                    <dl>
                                        <dt><p><font>1</font>${sup.membername!}</p></dt>
                                        <dd>
                                            <a href="/shopCenter/info?memberId=${sup.id!}" target="_blank">
                                                <div class="img_box"><img <#if sup.headimg?has_content>
                                                    src="${sup.headimg!}"
                                                <#else>
                                                    src="/images/default_hx.png"
                                                            </#if>></div>

                                                <p>${sup.membername!}<span>服务企业<strong>${sup.pcount!}</strong>家</span></p>
                                                <font>1</font>
                                            </a>
                                        </dd>
                                    </dl>
                                <#elseif sup_index==1>
                                    <dl>
                                        <dt><p><font>2</font>${sup.membername!}</p></dt>
                                        <dd>
                                            <a href="/shopCenter/info?memberId=${sup.id!}" target="_blank">
                                                <div class="img_box"><#if sup.headimg??>
                                                    <img src="${sup.headimg!}">
                                                <#else>
                                                    <img src="/images/default_hx.png">
                                                    </#if></div>
                                                <p>${sup.membername!}<span>服务企业<strong>${sup.pcount!}</strong>家</span></p>
                                                <font>2</font>
                                            </a>
                                        </dd>
                                    </dl>
                                <#elseif sup_index==2>
                                    <dl>
                                        <dt><p><font>3</font>${sup.membername!}</p></dt>
                                        <dd>
                                            <a href="/shopCenter/info?memberId=${sup.id!}" target="_blank">
                                                <div class="img_box">
                                                    <img <#if sup.headimg?has_content>
                                                        src="${sup.headimg!}"
                                                    <#else>
                                                        src="/images/default_hx.jpg"
                                                            </#if>></div>
                                                <p>${sup.membername!}<span>服务企业<strong>${sup.pcount!}</strong>家</span></p>
                                                <font>3</font>
                                            </a>
                                        </dd>
                                    </dl>
                                <#else>
                                    <dl>
                                        <dt><p><font>${icount!}</font>${sup.membername!}</p></dt>
                                        <dd>
                                            <a href="/shopCenter/info?memberId=${sup.id!}" target="_blank">
                                                <div class="img_box">
                                                    <img <#if sup.headimg?has_content>
                                                        src="${sup.headimg!}"
                                                    <#else>
                                                        src="/images/default_hx.jpg"
                                                            </#if>></div>
                                                <p>${sup.membername!}<span>服务企业<strong>${sup.pcount!}</strong>家</span></p>
                                                <font> ${icount!}</font>
                                            </a>
                                        </dd>
                                    </dl>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
                </div>
                <SCRIPT type=text/javascript>$('#1').AdAdvance();</SCRIPT>
            </div>
        </div>
    </div>


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
                                    <li><a href="/information/detail?id=${info.id}" target="_blank"><img src="${info.smallPic!}">${info.title!}</a></li>
                                <#else>
                                    <li><a href="/information/detail?id=${info.id}" target="_blank">
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

