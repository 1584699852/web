<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>天气</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/echarts.min.js"></script>
	
	<style type="text/css">
		#main{
			width: 1000px;
			padding: 20px;
			margin: 100px auto;
		}
		
		#head{
			background-color: rgb(51,153,254);
			padding: 10px
		}
		
		#head div{
			display: inline-block;
		}
		
		#head input{
			height: 20px;
			padding: 5px;
		}
		
		#head button{
			height: 30px;
		}
		
		#left{
			float: left;
			width: 40%;
			background-color: rgb(51,153,254);
			height: 280px;
			padding: 10px 0 30px 0;
		}
		#right{
			float: left;
			width: 60%;
			background-color: rgb(51,153,254);
			height: 280px;
			position: relative;
			padding: 10px 0 30px 0;
		}
		
		#l-top{
			margin: 20px 0 20px 90px;
			
		}
		#city-name{
			color: white;
			font-weight: 600;
			font-size: 30px;
			margin-right: 15px;
		}
		
		#exchange{
			color: aliceblue;
			font-size: 14px;
		}
		
		#date{
			margin-top: 5px;
			color: aliceblue;
			font-size: 14px;
		}
		/**************************/
		#l-mid > div{
			float: left;
		}
		#img{
			height: 60px;
			padding: 5px 20px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		#temp span{
			float: left;
			color: white;
		}
		#temp span:nth-child(1){
			font-size: 50px;
		}
		
		#temp span:nth-child(2){
			font-size: 25px;
			margin-top: 5px;
		}
		#weather{
			margin-top: 5px;
			color: aliceblue;
			margin-left: 10px;
		}
		#weather div:nth-child(1){
			font-size: 20px;
		}
		
		#weather div:nth-child(2){
			font-size: 10px;
			margin-top: 8px;
		}
		
		#detail{
			margin: 20px;
		}
		#detail::before{
			display: block;
			content: '';
			clear: both;
		}
		#detail span{
			margin-right: 20px;
			font-size: 14px;
			color: aliceblue;
		}
		#l-bottom{
			color: aliceblue;
			padding-left: 20px;
		}
		#l-bottom > div{
			float: left;
			font-size: 14px;
			line-height: 14px;
			font-weight: 400;
			text-align: center;
			padding: 8px;
			border-radius: 5px;
			margin-right: 5px;
		}
		#l-bottom > div:nth-child(1){
			background-color: orange;
			border: 1px solid orange;
		}
		#l-bottom > div:nth-child(2){
			border: 1px solid aliceblue;
		}
		
		/*************************************/
		#r-top{
			font-size: 25px;
			font-weight: 600;
			color: white;
			padding: 5px 20px;
		}
		
		#r-mid{
			background-color: rgba(255,255,255,0.3);
			border-radius: 5px;
			margin: 10px 20px;
		}
		
		.r-list{
			display: flex;
			justify-content: space-around;
			width: 100%;
		}
		
		.item{
			width: 12%;
		}
		
		.item > div{
			margin: 5px 0;
			text-align: center;
		}
		
		.item>div:nth-child(1),.item>div:nth-child(2){
			font-size: 10px;
			color: aliceblue;
		}
		.item>div:nth-child(3) img{
			width: 30px;
			margin: 0 auto;
		}
		.item>div:nth-child(4){
			font-size: 14px;
			color: white;
			font-weight: 600;
		}
		
		#w{
			display: inline-block;
			width: 560px;
		}
	</style>
	</head>
	<body>
		<div id="main">
			<div id="head">
				<form>
					<div>
						<input type="text" id="cityName" name="cityName"/>
					</div>
					<div>
						<button type="button" id="searchBtn">查询</button>
					</div>
				</form>
			</div>
			
			<div id="content">
				<div id="left">
					<div id="l-top">
						<div id="city">
							<span id="city-name">武汉</span>
							<span id="exchange">[切换城市]</span>
						</div>
						<p id="date"></p>
					</div>
				
					<div id="l-mid">
						<div id="img">
							<img src="img/00.png" >
						</div>
						<div id="temp">
							<span>武汉</span><span>℃</span>
						</div>
						<div id="weather">
							<div>晴</div>
							<div>3-11℃</div>
						</div>
					</div>
					<div id="detail">
						<span>湿度：50%</span>
						<span>风向：东南风2级</span>
						<span>紫外线：中等</span>
					</div>
					<div id="l-bottom">
						<div>空气质量：良</div>
						<div>PM：82</div>
					</div>
				</div>
				<div id="right">
					<div id="r-top">
						<span>武汉</span>一周天气预报
					</div>
					<div id="r-mid">
						<ul class="r-list" id="list1">
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>晴</div>
							</li>
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>晴</div>
							</li>
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>晴</div>
							</li>
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>晴</div>
							</li>
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>晴</div>
							</li>
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>晴</div>
							</li>
							<li class="item">
								<div>11月12日</div>
								<div>星期1</div>
								<div><img src="img/03.png" ></div>
								<div>北风3-5级</div>
							</li>
						</ul>
						<div id="w" style="height:80px"></div>
						<ul class="r-list"  id="list2">
							<li class="item">
								<div>北风3-5级</div>
							</li>
							<li class="item">
								<div>北风3-5级</div>
							</li>
							<li class="item">
								<div>北风3-5级</div>
							</li>
							<li class="item">
								<div>北风3-5级</div>
							</li>
							<li class="item">
								<div>北风3-5级</div>
							</li>
							<li class="item">
								<div>北风3-5级</div>
							</li>
							<li class="item">
								<div>北风3-5级</div>
							</li>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		
	</body>
	
	<script type="text/javascript">
		var weather = echarts.init($('#w').get(0));
		console.log(weather)
		option = {
		    xAxis: {
		        show : false,
		        type: 'category',
				axisLabel:{interval:10},
		        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
		    },
		    yAxis: {
		        show : false,
		        type: 'value'
		    },
			grid: {
				top: '30%', 
				left: '0', 
				right: '0',
				bottom: '0',
			},

		    series: [
				{
					data: [20, 25, 19, 23, 27, 21, 24],
					type: 'line',
					itemStyle : { normal: {
						label : {show: true},
						color:'#F0F8FF', 
						}
					}
				}
			]
		};
		weather.setOption(option)
	</script>
	
	<script type="text/javascript">
		// 初始是默认获取武汉天气
		/*
		$.get("getWeather?cityName=武汉",function(res){
			setData(res)
			console.log(res)
		})
		*/
		
		// 按钮的点击监听
		$('#searchBtn').click(function(res){
			// 获取输入框数据
			var cityName = $('#cityName').val();
			if(cityName == ''){
				alert("请输入城市名")
			}else{
				// 发起ajax请求，从后台获取数据
				$.get("getWeather?cityName="+cityName, function(res){
					console.log(res)
					setData(res)
				})
			}
			
		})
		
		// 设置页面数据
		function setData(res) {
			var obj = JSON.parse(res);
			
			$('#city-name').text(obj.cityName);
			$('#date').text(obj.date_y + '  ' + obj.week)
			$('#img img').attr('src',obj.imgUrl)
			$('#temp span').first().text(obj.temp);
			$('#weather div').first().text(obj.weather);
			$('#weather div').last().text(obj.temperature);
			$('#detail span').eq(0).text('湿度：' + obj.humidity);
			$('#detail span').eq(1).text('风向：' + obj.wind_direction + obj.wind_strength);
			$('#detail span').eq(2).text('紫外线：' + obj.uv_index);
			$('#l-bottom div').eq(0).text('穿衣指数：' + obj.dressing_index);
			$('#l-bottom div').eq(1).text('旅游指数：' + obj.travel_index);
			$('#r-top span').text(obj.cityName);
			
			var futureList = obj.futureList;
			var tempArr = []; // 存储解析出来的一周温度值
			var list2 = $('#list2 li div');  
			console.log(futureList)
			$('#list1 li').each(function(index,item){
				var target = $(item);
				target.children('div').eq(0).text(futureList[index].date);
				target.children('div').eq(1).text(futureList[index].week);
				target.children('div').eq(2).children('img').attr('src',futureList[index].imgUrl);
				target.children('div').eq(3).text(futureList[index].weather);
				list2.eq(index).text(futureList[index].wind)
				// 获取温度值
				var temperature = futureList[index].temperature.replace('℃','');
				tempArr.push(parseInt(temperature));
				
			})
			
			// 设置图表的数据
			option.series[0].data = tempArr;
			weather.setOption(option)
		}
	</script>
</html>