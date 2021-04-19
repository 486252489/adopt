<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="/WEB-INF/tlds/fn.tld"  %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物领养管理后台</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${path}/static/css/admin/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="${path}/static/css/admin/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/static/css/admin/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${path}/static/css/admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/static/css/admin/boot-crm.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${path}/static/js/echarts.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/macarons.js"></script>
    <style>
        .panel-heading{background-color: #337ab7;border-color: #2e6da4;font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
        .panel-heading span{position:absolute;right:10px;top:12px;}
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">宠物领养系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="/admin/developing">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user ">
                    <li>
                        <input type="hidden" id = "currentAdminId" value="${admin.id}">
                    </li>
                    <li><a href="/admin/developing"><i class="fa fa-user fa-fw"></i>
                        管理员：${admin.adminName}</a>
                    </li>
                    <li><a href="/admin/developing"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${path}/admin/logout">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul> <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <!-- 教学管理  折叠的分组列表 -->
                <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
                    <h4 class="panel-title">
                        后台管理 <span class="fa fa-chevron-up right"></span>
                    </h4>
                </div>
                <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                    <ul class="list-group">
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/user">
                                <i class="fa fa-flash fa-fw"></i> 用户信息
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/admin">
                                <i class="fa fa-flash fa-fw"></i> 管理员信息
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/pet">
                                <i class="fa fa-sitemap fa-fw"></i> 宠物管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/adopt">
                                <i class="fa fa-sitemap fa-fw"></i> 领养管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/comment">
                                <i class="fa fa-sitemap fa-fw"></i> 评论管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/blog">
                                <i class="fa fa-sitemap fa-fw"></i> 团队活动管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/apply">
                                <i class="fa fa-sitemap fa-fw"></i> 志愿者的申请
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/agree">
                                <i class="fa fa-sitemap fa-fw"></i> 同意领养列表
                            </a>
                        </li>
                       <li class="list-group-item my_font">
                            <a href="${path}/admin/disAgree">
                                <i class="fa fa-sitemap fa-fw"></i> 不同意领养列表
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/news">
                                <i class="fa fa-sitemap fa-fw"></i> 发布流浪宠物
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/chart">
                                <i class="fa fa-sitemap fa-fw"></i> 统计分析
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div><!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 班级列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">统计图表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="if_sy_tongyongkuai_cont" id="thscfx" style="height:360px;"></div>
        <div class="if_sy_tongyongkuai_cont" id="thscfx2" style="height:360px;"></div>
        <div class="if_sy_tongyongkuai_cont" id="thscfx3" style="height:360px;"></div>
    </div>
</div>

<!-- 引入js文件 -->
<!-- jQuery -->
<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${path}/static/js/admin/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="${path}/static/js/admin/jquery.dataTables.min.js"></script>
<script src="${path}/static/js/admin/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${path}/static/js/admin/sb-admin-2.js"></script>

<!-- 编写js代码 -->
<script type="text/javascript">
    var myChartFjHfl = echarts.init(document.getElementById('thscfx'));
    option = {
        title: {
            text: "流浪宠物领养统计",
            x: "center"
        },
        tooltip: {
            trigger: "item",
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x: "left",
            /* data: ["中药", "西药", "草药"] */
            data: [
                <c:forEach items="${maps}" var="spe" varStatus="b">
                <c:if test="${b.index+1 == fn:length(maps)}">
                "${spe.name}"
                </c:if>
                <c:if test="${b.index+1 != fn:length(maps)}">
                "${spe.name}",
                </c:if>
                </c:forEach>
            ]
        },
        label: {
            normal: {
                formatter: "{b} ({d}%)",
                position: "insideTopRight"
            }
        },
        labelLine: {
            normal: {
                smooth: .6
            }
        },
        toolbox: {
            show: !0,
            feature: {
                mark: {
                    show: !0
                },
                dataView: {
                    show: !0,
                    readOnly: !1
                },
                magicType: {
                    show: !0,
                    type: ["pie", "funnel"]
                },
                restore: {
                    show: !0
                },
                saveAsImage: {
                    show: !0
                }
            }
        },
        calculable: !0,
        series: [{
            name: "类别",
            type: "pie",
            roseType: "area",
            label: {
                normal: {
                    show: !0
                },
                emphasis: {
                    show: !0
                }
            },
            lableLine: {
                normal: {
                    show: !0
                },
                emphasis: {
                    show: !0
                }
            },
            /*  data: [{
                 value: 305,
                 name: "西药"
             }, {
                 value: 234,
                 name: "中药"
             }, {
                 value: 145,
                 name: "草药"
             }] */
            data: [
                <c:forEach items="${maps}" var="row" varStatus="b">
                <c:if test="${b.index+1 == fn:length(maps)}">
                { name: '${row.name}', value: ${row.value}}
                </c:if>
                <c:if test="${b.index+1 != fn:length(maps)}">
                { name: '${row.name}', value: ${row.value}},
                </c:if>
                </c:forEach>
            ]

        }]
    };
    myChartFjHfl.setOption(option);

</script>


<script type="text/javascript">
    var myChartFjHfl2 = echarts.init(document.getElementById('thscfx2'));
    option2 = {
        backgroundColor: '#424956',
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)",

        },
        legend: {

            orient: 'vertical',
            x: 'right',
            itemWidth: 14,
            itemHeight: 14,
            align: 'left',

            data:['总收入','总支出'],
            textStyle: {
                color: '#fff'
            }
        },
        series: [
            {
                name:'费用',
                type:'pie',
                hoverAnimation: false,
                legendHoverLink:false,
                radius: ['40%', '42%'],
                color: ['#915872', '#3077b7'],

                label: {
                    normal: {
                        position: 'inner'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    },

                },
                tooltip: {
                    show:false,


                },

                data:[
                    <c:forEach items="${maps}" var="row" varStatus="b">
                    <c:if test="${b.index+1 == fn:length(maps)}">
                    { name: '${row.name}', value: ${row.value}}
                    </c:if>
                    <c:if test="${b.index+1 != fn:length(maps)}">
                    { name: '${row.name}', value: ${row.value}},
                    </c:if>
                    </c:forEach>
                ]
            },
            {
                name:'费用',
                type:'pie',
                radius: ['42%', '55%'],
                color: ['#d74e67', '#0092ff'],
                label: {
                    normal: {
                        formatter: '{b}\n{d}%'
                    },

                },
                data:[
                    <c:forEach items="${maps}" var="row" varStatus="b">
                    <c:if test="${b.index+1 == fn:length(maps)}">
                    { name: '${row.name}', value: ${row.value}}
                    </c:if>
                    <c:if test="${b.index+1 != fn:length(maps)}">
                    { name: '${row.name}', value: ${row.value}},
                    </c:if>
                    </c:forEach>
                ]
            }
        ]
    };
    myChartFjHfl2.setOption(option2);

</script>

<script type="text/javascript">
    var myChartFjHf3 = echarts.init(document.getElementById('thscfx3'));


    var optionFjHf3 = {
        backgroundColor: '#ffffff',
        title: {
            text: '流浪宠物领养统计',
            top: '7%',
            textStyle: {fontSize: 12},
            left: '43%'
        },
        color: ['#3398DB'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                axisLabel: {
                    //横坐标上的文字换行显示 begin
                    formatter: function (val) {
                        return val.split("").join("\n");
                    }
                    //横坐标上的文字换行显示 end
                },
                data: [
                    <c:forEach items="${maps}" var="spe" varStatus="b">
                    <c:if test="${b.index+1 == fn:length(maps)}">
                    "${spe.name}"
                    </c:if>
                    <c:if test="${b.index+1 != fn:length(maps)}">
                    "${spe.name}",
                    </c:if>
                    </c:forEach>
                ],
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '销售量',
                type: 'bar',
                barWidth: '60%',
                clickable: false,//绑定点击事件
                data: [
                    <c:forEach items="${maps}" var="row" varStatus="b">
                    <c:if test="${b.index+1 == fn:length(maps)}">
                    {id:'${row.id}', name: '${row.name}', value: ${row.value}}
                    </c:if>
                    <c:if test="${b.index+1 != fn:length(maps)}">
                    {id:'${row.id}', name: '${row.name}', value: ${row.value}},
                    </c:if>
                    </c:forEach>
                ]
            }
        ]
    };


    myChartFjHf3.setOption(optionFjHf3);

</script>

</body></html>
