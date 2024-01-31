<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>华夏基石云智慧采购平台</title>
<link href="/css/member_center.css" rel="stylesheet" type="text/css" />
	<link href="/css/index_hx.css" rel="stylesheet" type="text/css"/>
	<link href="/css/index2_hx.css" rel="stylesheet" type="text/css"/>
<script src="/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/js/laypage/laypage.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/lib/layer/layer.js"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">

	.order-tb { width: 1000px; border-collapse:collapse; }
	.order-tb thead th { height: 32px; line-height: 32px; text-align: center; background: #f5f5f5; color: #666; font-weight: 400; }
	.order-tb a { color: #f00;border: 1px solid #f00;border-radius: 3px;padding: 3px 5px;background: white;}
	.order-tb a:hover { color: #e4393c; }
	.order-tb .tr-th {
	    background: #f5f5f5;
	    height: 31px;
	    line-height: 31px;
	    color: #aaa;
	    overflow: hidden;
	}
	.order-tb .tr-bd {
	    text-align: center;
	    vertical-align: top;
	    line-height:40px;
	}
	.order-tb .order-status {
		color:#ccc;
		display:block;
		margin-bottom:5px;
	}
	
	
	.order-tb tbody td {
	    border: 1px solid #e5e5e5;
	    padding:0px 10px;
	}
	
	.order-tb .goods-item {
	    width: 340px;
	    margin-right: 74px;
	    display: block;
    	float: left;
	}
	.order-tb .goods-item .p-name {
	    height: 36px;
	    line-height: 18px;
	    overflow: hidden;
	    color: #333;
	    text-align: left;
	}
	.order-tb .goods-item .p-msg {
	    width: 240px;
	}
	.order-tb .goods-item .p-img {
	    float: left;
	    width: 60px;
	    height: 60px;
	    border: 1px solid #efefef;
	    margin: 0 14px;
	    _display: inline;
	}
	.order-tb .goods-number {
	    float: left;
	    width: 70px;
	    text-align: left;
	    color: #aaa;
	    font-family: verdana;
	}
	.order-tb .sep-row td {
	    border: 0;
	    height: 20px;
	}
	.order-tb .tr-th .dealtime {
	    margin-right: 30px;
	    _margin-right: 15px;
	    font-family: verdana;
	}
	.order-tb .consignee .txt {
	    display: inline-block;
	    white-space: nowrap;
	    overflow: hidden;
	    max-width: 72px;
	    text-overflow: ellipsis;
	    vertical-align: middle;
	}
	.order-tb .tooltip .prompt-02 {
	    position: absolute;
	    z-index: 1;
	    width: 220px;
	    right: 90px;
	    top: -22px;
	    padding: 15px 20px;
	    display: none;
	    color: #666;
	    line-height: 22px;
	}
	.order-tb .tooltip {
	    position: relative;
	    width: 100px;
	    margin: 0 auto;
	    z-index: 2;
	    cursor: pointer;
	}
	.order-tb .tooltip .prompt-02 {
	    position: absolute;
	    z-index: 1;
	    width: 220px;
	    right: 90px;
	    top: -22px;
	    padding: 15px 20px;
	    display: none;
	    color: #666;
	    line-height: 22px;
	}
	
	.order-tb .tr-th .tr-operate {
	    float: right;
	    position: relative;
	    margin-right: 15px;
	    width: 608px;
	    height: 23px;
	}
	.order-tb .tr-th-split .order-consignee {
	    width: 128px;
	    margin-right: 38px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	}
	.order-tb .tr-th span {
	    float: left;
	    height: 18px;
	    line-height: 18px;
	    padding: 2px 0 0;
	    _display: inline;
	}
	.order-tb .tr-th-split .split-row {
	    position: relative;
	    top: 1px;
	    padding: 11px 0;
	    height: 18px;
	    margin: 1px 0 0;
	    border-bottom: 1px solid #e5e5e5;
	}
	.order-tb .tr-th-split .top-arr {
	    position: absolute;
	    width: 17px;
	    height: 10px;
	    left: 180px;
	    top: -10px;
	    background: url(//misc.360buyimg.com/user/myjd/ordercenter/css/i/split-arr.png) no-repeat;
	    overflow: hidden;
	}
	.order-tb .tr-th-split .order-count em {
	    font-family: verdana;
	    font-style: normal;
	}
	.order-tb .tr-th-split .split-row02 {
	    position: relative;
	    color: #393941;
	}
	.order-tb .tr-th-split .order-pay {
	    width: 178px;
	    float: left;
	    height: 18px;
	    line-height: 18px;
	    padding: 2px 0 0;
	}
	.order-tb .tr-th-02 {
	    background: #fff;
	}
	
	.at_page { text-align:center; font-size:12px; font-weight:normal;  color:#666;}
	.at_page a { display:inline-block; vertical-align:middle; margin:0 5px; font-size:12px; font-weight:normal; color:#333; text-align:center; line-height:30px; border:1px solid #cccccc; padding:0 12px; border-radius:8px; font-family:Verdana, Geneva, sans-serif;}
	.at_page a.on { background-color:#ffeff0; font-weight:bold; color:#e4393c; border:1px solid #e4393c;}
	.at_page a:hover { background-color:#ffeff0; border:1px solid #e4393c;color:#e4393c;}
	.at_page a.on:hover { background-color:#ffeff0; font-weight:bold; color:#e4393c; border:1px solid #e4393c;}

	.divSearch { margin-bottom:10px; }
	.divSearch .key { height:30px; line-height:28px; font-size:12px; width:300px; padding:0px 3px; }
	.divSearch .sub { height:34px; }
	.inquiryButton{
		margin-top: 24px;
	    cursor: pointer;
	    background-color: #5c4ac7;
	    color: #fff;
	    border: 1px solid #5c4ac7;
	    padding: 0.25rem 0.5rem;
	    font-size: 12px;
	    border-radius: .2rem;
    }
</style>


</head>
<body style="background-color:#f4f4f4;">
	<!--头部 开始-->
	<#include "/public/memberhead.ftl">
	<!--头部 结束-->

	<!--主体 开始-->
	<div id="member_box">
		<div id="member_main">
			<!--左侧菜单 开始-->
			<#include "/public/memberleft.ftl">
			<!--左侧菜单 结束-->

			<!--右侧主体 开始-->
			<div id="member_right">

				<input type="hidden" id="menu" value="3-1-2">

				<div class="e_partf">
					<div class="xj_mem_blk01" style="margin-top:0;">
						<h2 style="width: 1004px;">
							<#if type == 0>
								<b>商品咨询管理</b>
							<#else>
								<b>店铺咨询管理</b>
							</#if>

							<#if type??>
								<#else>
								<a href="/member/inquiry/add" class="inquiryButton" style="color: #fff;margin-top: 24px;">商品咨询留言</a>
							</#if>
						</h2>
						<div class="xj_mem_b01_main02">
							
							<div class="divSearch">
								<form action="?" method="get" id="frmsearch">
									<!--列表展示-->
									<input type="hidden"  id="listtype" value="1" >
								</form>
								
							</div>
		
							<table class="td-void order-tb">
								<thead>
                                <#if type==0>
                                    <tr>
                                        <th>信息标题</th>
                                        <th>店铺名称</th>
                                        <th>咨询时间</th>
                                        <th>回复状态</th>
                                        <th>操作</th>
                                    </tr>
                                <#else>
                                    <tr>
                                        <th>店铺名称</th>
                                        <th>咨询时间</th>
                                        <th>回复状态</th>
                                        <th>操作</th>
                                    </tr>
                                </#if>
								</thead>

								<#if advisoryInfos??>
									<#list advisoryInfos as entity>
									<tbody>
										<tr class="tr-bd">
                                        <#if type==0>
                                                <#--商品名称-->
                                                <td>${entity['productname']!}</td>
                                                <#--店铺名称-->
                                                <td>${entity['shopName']!}</td>
                                                <td>${entity['advisoryInfo'].addtime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <#if entity['advisoryInfo'].replystatus==1>
                                                    <td>已回复</td>
                                                <#else>
                                                    <td>未回复</td>
                                                </#if>
                                            <#--<td>${entity.replystatus}</td>-->
                                                <td>
                                                <a href="/advisory/buyerAdvisoryInfo/${entity['advisoryInfo'].id}" >查看</a>
                                                </td>
                                        <#else>
                                                <#--店铺名称-->
                                                <td>${entity['shopName']!}</td>
                                                <td>${entity['advisoryInfo'].addtime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <#if entity['advisoryInfo'].replystatus==1>
                                                    <td>已回复</td>
                                                <#else>
                                                    <td>未回复</td>
                                                </#if>
                                                <td>
                                                <a href="/advisory/buyerAdvisoryInfo/${entity['advisoryInfo'].id}" >查看</a>
                                                </td>
                                        </#if>
										</tr>
									</tbody>
									</#list>
								</#if>
							</table>
							
							<#--<#if entitys??>-->
								<#--<div class="at_page" id="pager" style="margin-top:30px;"></div>-->
								<#--<script type="text/javascript">LaypageConfig(${pagecount}, "CN");</script>-->
							<#--</#if>-->
							<div class="at_page" id="pager" style="margin-top:30px;"></div>
							<script type="text/javascript">LaypageConfig(${pagecount}, "CN");</script>
						</div>
					</div>
				</div>
			</div>
			<!--右侧主体 结束-->
			<div class="clear"></div>
		</div>
	</div>
	<!--主体 结束-->
	
	<script type="text/javascript">

	var memberid=${Session.memberInfo.id?c}

		$(document).ready(function() {
            $.ajax({
                type : "get", async: false, global: false, dataType:"json",
                url : "/Advisory/buyerConsult",
                data : {
                    advisorytype:${type},
					memberid:memberid
                },
                success : function(data) {
                    window.location.reload();
                }
            });
		});
	</script>

	<#include "/public/bottom_hx.ftl">
</body>
</html>

