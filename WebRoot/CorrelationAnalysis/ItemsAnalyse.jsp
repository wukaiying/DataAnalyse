<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>关联分析</title>
	  <script type="text/javascript" src="../js/esl.js"></script>
	  <script type="text/javascript" src="../js/echarts.js"></script>
	  <script type="text/javascript" src="../js/force.js"></script>
	  <script type="text/javascript" src="../js/chord.js"></script>
  	  <script type="text/javascript" src="../js/config.js"></script>
  </head>
  
  <body>
  <div id="main1" style="height:600px"></div>
  	 <script type="text/javascript">
    
        // 路径配置
        require.config({
            paths:{ 
                'echarts' : '../js/echarts',
                'echarts/chart/bar' : '../js/echarts',
                'echarts/chart/line': '../js/echarts',
                'echarts/chart/pie': '../js/echarts'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/line',
                'echarts/chart/pie'
            ],
           DrawCharts
        );
        
         function DrawCharts(ec) {
                FunDraw3(ec);
            }
  	            //创建ECharts图表
        function FunDraw3(ec) {
            //--- 折柱 ---
            myChart = ec.init(document.getElementById('main1'));
            //图表显示提示信息
            myChart.showLoading({
                text: "站点关系图正在努力加载..."
            });
            myChart.hideLoading();
            myChart.setOption({
                title: {
                    text: '关联分析图',
                    subtext: 'From:wky',
                    x: 'center',
                    y: 'head'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} : {b}'
                },
                legend: {
                    x: 'left',
                    data: []
                },
                series: [
        {
            type: 'force',
            name: "可信度70%",
            categories: [
                {
                    name: '名称',
                    itemStyle: {
                        normal: {
                            color: '#ff7f50'
                        }
                    }
                }
            ],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#800080'
                        }
                    },
                    nodeStyle: {
                        brushType: 'both',
                        strokeColor: 'rgba(255,215,0,0.4)',
                        lineWidth: 8
                    }
                }
            },
            minRadius: 15,
            maxRadius: 200,
            linkSymbol: 'arrow',   //箭头还是非箭头的区别
            density: 0.05,
            attractiveness: 1.2,
            nodes: [
                { category: 0, name: '玉米赤霉醇', value: 10, url: "http://www.stepday.com/blog/" },
                { category: 0, name: '铅', value: 10, url: "http://www.stepday.com/post/" },
                { category: 0, name: '总砷', value: 10, url: "http://www.stepday.com/list/?1" },
                { category: 0, name: '黄曲霉毒素M1', value: 10, url: "http://www.stepday.com/list/?1" },
           
            ],
            links: [
              { source: 0, target: 3, weight: 4 },
              { source: 1, target: 3, weight: 4 },
              { source: 2, target: 3, weight: 2 },
              { source: 3, target: 3, weight: 2 },
            ]
        }
    ]
            });

            var ecConfig = require('echarts/config');
            //实现节点点击事件
            function focus(param) {
                var option = myChart.getOption();
                var data = param.data;
                //判断节点的相关数据是否正确
                if (data != null && data != undefined) {
                    if (data.url != null && data.url != undefined) {
                        //根据节点的扩展属性url打开新页面
                        window.open(data.url);
                    }
                }
            }
            //绑定图表节点的点击事件
            myChart.on(ecConfig.EVENT.CLICK, focus)
        }
                    
  </script>
  </body>
</html>
