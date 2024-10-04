<%rd="../../"
r="../"%>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<!--#include file="../../conex/conex.asp"-->
<%Dim Ob_connb, ob_commandb%>
<!--#include file="../../conex/conex_back.asp"-->
<script src="../lib/js/jquery.min.js" type="text/javascript"></script><script src="../lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</div></div></div>
<div class="row">
<%mes_act=month(date)
anyo_act=year(date)
Sql= "SELECT id_programa from programas where month(fecha_in)='"&mes_act&"' and year(fecha_in)='"&anyo_act&"'"  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
cuenta_al=ob_rs.recordcount
else
cuenta_al=0
end if
Sql= "SELECT id_alumno from alumnos "  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
cuenta_alu=ob_rs.recordcount
else
cuenta_alu=0
end if
Sql= "SELECT id_programa from programas where year(fecha_in)='"&anyo_act&"'"  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
cuenta_al2=ob_rs.recordcount
else
cuenta_al2=0
end if
Sql= "SELECT id_item from items where disponible='si'"  
  Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
cuenta_c=ob_rs.recordcount
else
cuenta_c=0
end if
ob_rs.close%>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"><span class="dashboard-stat dashboard-stat-v2 blue"><div class="visual"><i class="fa fa-shopping-cart"></i></div><div class="details"><div class="number"><span data-counter="counterup" data-value="<%=cuenta_al%>">0</span></div><div class="desc">Inscripciones este mes</div></div></span></div>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"><span class="dashboard-stat dashboard-stat-v2 red"><div class="visual"><i class="fa fa-user"></i></div>
<div class="details"><div class="number"><span data-counter="counterup" data-value="<%=cuenta_alu%>">0</span></div><div class="desc"> Total Alumnos Inscritos </div></div></span></div>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"><span class="dashboard-stat dashboard-stat-v2 green"><div class="visual"><i class="fa fa-graduation-cap"></i></div>
<div class="details"><div class="number"><span data-counter="counterup" data-value="<%=cuenta_al2%>">0</span></div><div class="desc"> Programas vendidos este año </div></div></span></div>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"><span class="dashboard-stat dashboard-stat-v2 purple"><div class="visual"><i class="fa fa-globe"></i></div><div class="details"><div class="number"><span data-counter="counterup" data-value="<%=cuenta_c%>"></span></div><div class="desc"> Programas activos </div></div></span></div>
</div>
<div class="clearfix"></div>
<div class="row">
<div class="col-md-6 col-sm-6"><div class="portlet light bordered"><div class="portlet-title"><div class="caption"><i class="icon-bar-chart font-dark hide"></i><span class="caption-subject font-dark bold uppercase">Inscripciones</span><span class="caption-helper">&nbsp;&nbsp;año en curso...</span></div></div>
<div class="portlet-body"><div id="site_statistics_loading">
<img src="../images/loading.gif" alt="loading"> </div><div id="site_statistics_content" class="display-none"><div id="site_statistics" class="chart"> </div></div></div></div></div>

<div class="col-md-6 col-sm-6"><div class="portlet light bordered"><div class="portlet-title"><div class="caption"><i class="icon-share font-red-sunglo hide"></i><span class="caption-subject font-dark bold uppercase">Inscripciones</span><span class="caption-helper">&nbsp;&nbsp;histórico...</span></div></div><div class="portlet-body">
<div id="site_activities_loading">
<img src="../images/loading.gif" alt="loading"> </div><div id="site_activities_content" class="display-none"><div id="site_activities" style="height: 228px;"> </div></div>
</div></div></div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6"><div class="portlet light bordered"><div class="portlet-title tabbable-line"><div class="caption"><i class="icon-bubbles font-dark hide"></i><span class="caption-subject font-dark bold uppercase">Ultimas noticias</span></div></div><div class="portlet-body"><div class="tab-content">
<div class="tab-pane active">
<%Sql= "SELECT titulo_esp, fecha_in, texto_esp from noticias order by fecha_in desc"  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof and i<=3%>
<div class="mt-comments"><div class="mt-comment"><div class="mt-comment-body"><div class="mt-comment-info">
<span class="mt-comment-author"><%=ob_rs("titulo_esp")%></span>
<span class="mt-comment-date"><%=ob_rs("fecha_in")%></span>
</div><div class="mt-comment-text"><%=ob_rs("texto_esp")%></div></div>
</div></div>
<%ob_rs.movenext
i=i+1
loop
end if
ob_rs.close%>
</div></div></div></div></div>
<div class="col-md-6 col-sm-6"><div class="portlet light bordered"><div class="portlet-title"><div class="caption"><i class="icon-bubble font-dark hide"></i><span class="caption-subject font-hide bold uppercase">Últimos Inscritos</span></div></div><div class="portlet-body"><div class="row">
<%Sql= "SELECT id_alumno, nom_item, id_programa from programas_tmp order by fecha_in desc"  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
p=1
do while not ob_rs.eof and p<=6
Sql2= "SELECT a_nombre,a_apellidos from alumnos_tmp where id_alumno="&ob_rs("id_alumno")&""  
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="col-md-4" style="margin-bottom:15px">
<div class="mt-widget-1">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_programa")&"&ver="&ver))%>
<div class="mt-icon"><a href="../preinscripciones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_programa")&"&ver="&ver)%>"><i class="icon-plus"></i></a></div>
<div class="mt-body"><br>
<h3 class="mt-username" style="max-width:80%"><%=ob_rs2("a_nombre")%>&nbsp;<%=ob_rs2("a_apellidos")%></h3><br>
<p class="mt-user-title"> <%=ob_rs("nom_item")%> </p>
</div>
</div>
</div>
<%end if
ob_rs2.close
ob_rs.movenext
p=p+1
loop
ob_rs.close
end if%>
</div></div></div></div></div>
<div class="row">
<div class="col-md-6 col-sm-6">
<div class="portlet light bordered">
<div class="portlet-title">
<div class="caption">
<i class="icon-cursor font-dark hide"></i>
<span class="caption-subject font-dark bold uppercase">Estadísticas Generales</span>
</div>
</div>
<div class="portlet-body">
<div class="row">
<div class="col-md-4">
<div class="easy-pie-chart">
<div class="number transactions" data-percent="55">
<span>+55</span>% </div>
<a class="title" href="javascript:;"> Transacciones
<i class="icon-arrow-right"></i>
</a>
</div>
</div>
<div class="margin-bottom-10 visible-sm"> </div>
<div class="col-md-4">
<div class="easy-pie-chart">
<div class="number visits" data-percent="85">
<span>+85</span>% </div>
<a class="title" href="javascript:;"> Nuevas Visitas
<i class="icon-arrow-right"></i>
</a>
</div>
</div>
<div class="margin-bottom-10 visible-sm"> </div>
<div class="col-md-4">
<div class="easy-pie-chart">
<div class="number bounce" data-percent="46">
<span>-46</span>% </div>
<a class="title" href="javascript:;"> Rebote
<i class="icon-arrow-right"></i>
</a>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6">
<div class="portlet light bordered">
<div class="portlet-title">
<div class="caption">
<i class="icon-equalizer font-dark hide"></i>
<span class="caption-subject font-dark bold uppercase">Estadísticas Servidor</span>
<span class="caption-helper">mensuales...</span>
</div>
</div>
<div class="portlet-body">
<div class="row">
<div class="col-md-4">
<div class="sparkline-chart">
<div class="number" id="sparkline_bar5"></div>
<a class="title" href="javascript:;"> Network
<i class="icon-arrow-right"></i>
</a>
</div>
</div>
<div class="margin-bottom-10 visible-sm"> </div>
<div class="col-md-4">
<div class="sparkline-chart">
<div class="number" id="sparkline_bar6"></div>
<a class="title" href="javascript:;"> CPU Carga
<i class="icon-arrow-right"></i>
</a>
</div>
</div>
<div class="margin-bottom-10 visible-sm"> </div>
<div class="col-md-4">
<div class="sparkline-chart">
<div class="number" id="sparkline_line"></div>
<a class="title" href="javascript:;"> Media de Carga
<i class="icon-arrow-right"></i>
</a>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div><%if edi<>"rap" then%><p class="copyright"><%=year(date)%> © Wishing <a href="https://www.wishingwell.es" title="Vaaaamos" target="_blank">Well</a></p>
<a href="#index" class="go2top"><i class="icon-arrow-up"></i></a><%end if%></div></div>
<script src="<%=r%>lib/app/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/counterup/jquery.counterup.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/app.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/layout.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>
</body></html>
<script>
var Dashboard=function(){return{initJQVMAP:function(){if(jQuery().vectorMap){var t=function(t){jQuery(".vmaps").hide(),jQuery("#vmap_"+t).show()},e=function(t){var e=jQuery("#vmap_"+t);if(1===e.size()){var a={onLabelShow:function(t,e,a){},onRegionOver:function(t,e){"ca"==e&&t.preventDefault()},onRegionClick:function(t,e,a){var i='You clicked "'+a+'" which has the code: '+e.toUpperCase();alert(i)}};a.map=t+"_en",e.width(e.parent().parent().width()),e.show(),e.vectorMap(a),e.hide()}};e("world"),jQuery("#regional_stat_world").click(function(){t("world")}),$("#region_statistics_loading").hide(),$("#region_statistics_content").show(),App.addResizeHandler(function(){jQuery(".vmaps").each(function(){var t=jQuery(this);t.width(t.parent().width())})})}},initCharts:function(){function t(t,e,a,i){$('<div id="tooltip" class="chart-tooltip">'+i+"</div>").css({position:"absolute",display:"none",top:e-40,left:t-40,border:"0px solid #ccc",padding:"2px 6px","background-color":"#fff"}).appendTo("body").fadeIn(200)}if(jQuery.plot){var e=[
<%Sql= "SELECT id_programa, fecha_in from programas where year(fecha_in)='"&anyo_act&"' order by month(fecha_in)"  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
mes=month(ob_rs("fecha_in"))
Sql2= "SELECT fecha_in from programas where year(fecha_in)='"&anyo_act&"' and month(fecha_in)='"&mes&"' "  
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
tot=ob_rs2.recordcount
else
tot=0
end if
ob_rs2.close
if len(mes=1) then mes="0"&mes end if%>
["<%=mes%>/<%=anyo_act%>",<%=tot%>],
<%ob_rs.movenext
loop
end if
ob_rs.close%>
];if(0!=$("#site_statistics").size()){$("#site_statistics_loading").hide(),$("#site_statistics_content").show();var a=($.plot($("#site_statistics"),[{data:e,lines:{fill:.6,lineWidth:0},color:["#f89f9f"]},{data:e,points:{show:!0,fill:!0,radius:5,fillColor:"#f89f9f",lineWidth:3},color:"#fff",shadowSize:0}],{xaxis:{tickLength:0,tickDecimals:0,mode:"categories",min:0,font:{lineHeight:14,style:"normal",variant:"small-caps",color:"#6F7B8A"}},yaxis:{ticks:5,tickDecimals:0,tickColor:"#eee",font:{lineHeight:14,style:"normal",variant:"small-caps",color:"#6F7B8A"}},grid:{hoverable:!0,clickable:!0,tickColor:"#eee",borderColor:"#eee",borderWidth:1}}),null);$("#site_statistics").bind("plothover",function(e,i,l){if($("#x").text(i.x.toFixed(2)),$("#y").text(i.y.toFixed(2)),l){if(a!=l.dataIndex){a=l.dataIndex,$("#tooltip").remove();l.datapoint[0].toFixed(2),l.datapoint[1].toFixed(2);t(l.pageX,l.pageY,l.datapoint[0],l.datapoint[1]+" inscritos")}}else $("#tooltip").remove(),a=null})}if(0!=$("#site_activities").size()){var i=null;$("#site_activities_loading").hide(),$("#site_activities_content").show();var l=[
<%Sql= "SELECT id_programa, fecha_in from programas order by year(fecha_in) "  
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
anyo=year(ob_rs("fecha_in"))
Sql2= "SELECT fecha_in from programas where year(fecha_in)='"&anyo&"' "  
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
tot_a=ob_rs2.recordcount
else
tot_a=0
end if
ob_rs2.close%>
["<%=anyo%>",<%=tot_a%>],
<%ob_rs.movenext
loop
end if%>

];$.plot($("#site_activities"),[{data:l,lines:{fill:.2,lineWidth:0},color:["#BAD9F5"]},{data:l,points:{show:!0,fill:!0,radius:4,fillColor:"#9ACAE6",lineWidth:2},color:"#9ACAE6",shadowSize:1},{data:l,lines:{show:!0,fill:!1,lineWidth:3},color:"#9ACAE6",shadowSize:0}],{xaxis:{tickLength:0,tickDecimals:0,mode:"categories",min:0,font:{lineHeight:18,style:"normal",variant:"small-caps",color:"#6F7B8A"}},yaxis:{ticks:5,tickDecimals:0,tickColor:"#eee",font:{lineHeight:14,style:"normal",variant:"small-caps",color:"#6F7B8A"}},grid:{hoverable:!0,clickable:!0,tickColor:"#eee",borderColor:"#eee",borderWidth:1}});$("#site_activities").bind("plothover",function(e,a,l){if($("#x").text(a.x.toFixed(2)),$("#y").text(a.y.toFixed(2)),l&&i!=l.dataIndex){i=l.dataIndex,$("#tooltip").remove();l.datapoint[0].toFixed(2),l.datapoint[1].toFixed(2);t(l.pageX,l.pageY,l.datapoint[0],l.datapoint[1]+" inscritos")}}),$("#site_activities").bind("mouseleave",function(){$("#tooltip").remove()})}}},initEasyPieCharts:function(){jQuery().easyPieChart&&($(".easy-pie-chart .number.transactions").easyPieChart({animate:1e3,size:75,lineWidth:3,barColor:App.getBrandColor("yellow")}),$(".easy-pie-chart .number.visits").easyPieChart({animate:1e3,size:75,lineWidth:3,barColor:App.getBrandColor("green")}),$(".easy-pie-chart .number.bounce").easyPieChart({animate:1e3,size:75,lineWidth:3,barColor:App.getBrandColor("red")}),$(".easy-pie-chart-reload").click(function(){$(".easy-pie-chart .number").each(function(){var t=Math.floor(100*Math.random());$(this).data("easyPieChart").update(t),$("span",this).text(t)})}))},initSparklineCharts:function(){jQuery().sparkline&&($("#sparkline_bar").sparkline([8,9,10,11,10,10,12,10,10,11,9,12,11,10,9,11,13,13,12],{type:"bar",width:"100",barWidth:5,height:"55",barColor:"#35aa47",negBarColor:"#e02222"}),$("#sparkline_bar2").sparkline([9,11,12,13,12,13,10,14,13,11,11,12,11,11,10,12,11,10],{type:"bar",width:"100",barWidth:5,height:"55",barColor:"#ffb848",negBarColor:"#e02222"}),$("#sparkline_bar5").sparkline([8,9,10,11,10,10,12,10,10,11,9,12,11,10,9,11,13,13,12],{type:"bar",width:"100",barWidth:5,height:"55",barColor:"#35aa47",negBarColor:"#e02222"}),$("#sparkline_bar6").sparkline([9,11,12,13,12,13,10,14,13,11,11,12,11,11,10,12,11,10],{type:"bar",width:"100",barWidth:5,height:"55",barColor:"#ffb848",negBarColor:"#e02222"}),$("#sparkline_line").sparkline([9,10,9,10,10,11,12,10,10,11,11,12,11,10,12,11,10,12],{type:"line",width:"100",height:"55",lineColor:"#ffb848"}))},initChat:function(){var t=$("#chats"),e=$(".chats",t),a=$(".chat-form",t),i=$("input",a),l=$(".btn",a),o=function(a){a.preventDefault();var l=i.val();if(0!=l.length){var o=new Date,n=o.getHours()+":"+o.getMinutes(),s="";s+='<li class="out">',s+='<img class="avatar" alt="" src="../../assets/pages/scripts/'+Layout.getLayoutImgPath()+'avatar1.jpg"/>',s+='<div class="message">',s+='<span class="arrow"></span>',s+='<a href="#" class="name">Ramón Espinosa</a> ',s+='<span class="datetime">at '+n+"</span>",s+='<span class="body">',s+=l,s+="</span>",s+="</div>",s+="</li>";e.append(s);i.val("");var r=function(){var e=0;return t.find("li.out, li.in").each(function(){e+=$(this).outerHeight()}),e};t.find(".scroller").slimScroll({scrollTo:r()})}};$("body").on("click",".message .name",function(t){t.preventDefault();var e=$(this).text();i.val("@"+e+":"),App.scrollTo(i)}),l.click(o),i.keypress(function(t){return 13==t.which?(o(t),!1):void 0})},initDashboardDaterange:function(){jQuery().daterangepicker&&($("#dashboard-report-range").daterangepicker({ranges:{Today:[moment(),moment()],Yesterday:[moment().subtract("days",1),moment().subtract("days",1)],"Last 7 Days":[moment().subtract("days",6),moment()],"Last 30 Days":[moment().subtract("days",29),moment()],"This Month":[moment().startOf("month"),moment().endOf("month")],"Last Month":[moment().subtract("month",1).startOf("month"),moment().subtract("month",1).endOf("month")]},locale:{format:"MM/DD/YYYY",separator:" - ",applyLabel:"Apply",cancelLabel:"Cancel",fromLabel:"From",toLabel:"To",customRangeLabel:"Custom",daysOfWeek:["Su","Mo","Tu","We","Th","Fr","Sa"],monthNames:["January","February","March","April","May","June","July","August","September","October","November","December"],firstDay:1},opens:App.isRTL()?"right":"left"},function(t,e,a){$("#dashboard-report-range span").html(t.format("MMMM D, YYYY")+" - "+e.format("MMMM D, YYYY"))}),$("#dashboard-report-range span").html(moment().subtract("days",29).format("MMMM D, YYYY")+" - "+moment().format("MMMM D, YYYY")),$("#dashboard-report-range").show())},initAmChart1:function(){if("undefined"!=typeof AmCharts&&0!==$("#dashboard_amchart_1").size()){var t=[{date:"2012-01-05",distance:480,townName:"Miami",townName2:"Miami",townSize:10,latitude:25.83,duration:501},{date:"2012-01-06",distance:386,townName:"Tallahassee",townSize:7,latitude:30.46,duration:443},{date:"2012-01-07",distance:348,townName:"New Orleans",townSize:10,latitude:29.94,duration:405},{date:"2012-01-08",distance:238,townName:"Houston",townName2:"Houston",townSize:16,latitude:29.76,duration:309},{date:"2012-01-09",distance:218,townName:"Dalas",townSize:17,latitude:32.8,duration:287},{date:"2012-01-10",distance:349,townName:"Oklahoma City",townSize:11,latitude:35.49,duration:485},{date:"2012-01-11",distance:603,townName:"Kansas City",townSize:10,latitude:39.1,duration:890},{date:"2012-01-12",distance:534,townName:"Denver",townName2:"Denver",townSize:18,latitude:39.74,duration:810},{date:"2012-01-13",townName:"Salt Lake City",townSize:12,distance:425,duration:670,latitude:40.75,alpha:.4},{date:"2012-01-14",latitude:36.1,duration:470,townName:"Las Vegas",townName2:"Las Vegas",bulletClass:"lastBullet"},{date:"2012-01-15"}];AmCharts.makeChart("dashboard_amchart_1",{type:"serial",fontSize:12,fontFamily:"Open Sans",dataDateFormat:"YYYY-MM-DD",dataProvider:t,addClassNames:!0,startDuration:1,color:"#6c7b88",marginLeft:0,categoryField:"date",categoryAxis:{parseDates:!0,minPeriod:"DD",autoGridCount:!1,gridCount:50,gridAlpha:.1,gridColor:"#FFFFFF",axisColor:"#555555",dateFormats:[{period:"DD",format:"DD"},{period:"WW",format:"MMM DD"},{period:"MM",format:"MMM"},{period:"YYYY",format:"YYYY"}]},valueAxes:[{id:"a1",title:"distance",gridAlpha:0,axisAlpha:0},{id:"a2",position:"right",gridAlpha:0,axisAlpha:0,labelsEnabled:!1},{id:"a3",title:"duration",position:"right",gridAlpha:0,axisAlpha:0,inside:!0,duration:"mm",durationUnits:{DD:"d. ",hh:"h ",mm:"min",ss:""}}],graphs:[{id:"g1",valueField:"distance",title:"distance",type:"column",fillAlphas:.7,valueAxis:"a1",balloonText:"[[value]] miles",legendValueText:"[[value]] mi",legendPeriodValueText:"total: [[value.sum]] mi",lineColor:"#08a3cc",alphaField:"alpha"},{id:"g2",valueField:"latitude",classNameField:"bulletClass",title:"latitude/city",type:"line",valueAxis:"a2",lineColor:"#786c56",lineThickness:1,legendValueText:"[[description]]/[[value]]",descriptionField:"townName",bullet:"round",bulletSizeField:"townSize",bulletBorderColor:"#02617a",bulletBorderAlpha:1,bulletBorderThickness:2,bulletColor:"#89c4f4",labelText:"[[townName2]]",labelPosition:"right",balloonText:"latitude:[[value]]",showBalloon:!0,animationPlayed:!0},{id:"g3",title:"duration",valueField:"duration",type:"line",valueAxis:"a3",lineAlpha:.8,lineColor:"#e26a6a",balloonText:"[[value]]",lineThickness:1,legendValueText:"[[value]]",bullet:"square",bulletBorderColor:"#e26a6a",bulletBorderThickness:1,bulletBorderAlpha:.8,dashLengthField:"dashLength",animationPlayed:!0}],chartCursor:{zoomable:!1,categoryBalloonDateFormat:"DD",cursorAlpha:0,categoryBalloonColor:"#e26a6a",categoryBalloonAlpha:.8,valueBalloonsEnabled:!1},legend:{bulletType:"round",equalWidths:!1,valueWidth:120,useGraphSettings:!0,color:"#6c7b88"}})}},initAmChart2:function(){if("undefined"!=typeof AmCharts&&0!==$("#dashboard_amchart_2").size()){var t="M9,0C4.029,0,0,4.029,0,9s4.029,9,9,9s9-4.029,9-9S13.971,0,9,0z M9,15.93 c-3.83,0-6.93-3.1-6.93-6.93S5.17,2.07,9,2.07s6.93,3.1,6.93,6.93S12.83,15.93,9,15.93 M12.5,9c0,1.933-1.567,3.5-3.5,3.5S5.5,10.933,5.5,9S7.067,5.5,9,5.5 S12.5,7.067,12.5,9z",e="M19.671,8.11l-2.777,2.777l-3.837-0.861c0.362-0.505,0.916-1.683,0.464-2.135c-0.518-0.517-1.979,0.278-2.305,0.604l-0.913,0.913L7.614,8.804l-2.021,2.021l2.232,1.061l-0.082,0.082l1.701,1.701l0.688-0.687l3.164,1.504L9.571,18.21H6.413l-1.137,1.138l3.6,0.948l1.83,1.83l0.947,3.598l1.137-1.137V21.43l3.725-3.725l1.504,3.164l-0.687,0.687l1.702,1.701l0.081-0.081l1.062,2.231l2.02-2.02l-0.604-2.689l0.912-0.912c0.326-0.326,1.121-1.789,0.604-2.306c-0.452-0.452-1.63,0.101-2.135,0.464l-0.861-3.838l2.777-2.777c0.947-0.947,3.599-4.862,2.62-5.839C24.533,4.512,20.618,7.163,19.671,8.11z";AmCharts.makeChart("dashboard_amchart_2",{type:"map",theme:"light",pathToImages:"../assets/global/plugins/amcharts/ammap/images/",dataProvider:{map:"worldLow",linkToObject:"london",images:[{id:"london",color:"#009dc7",svgPath:t,title:"London",latitude:51.5002,longitude:-.1262,scale:1.5,zoomLevel:2.74,zoomLongitude:-20.1341,zoomLatitude:49.1712,lines:[{latitudes:[51.5002,50.4422],longitudes:[-.1262,30.5367]},{latitudes:[51.5002,46.948],longitudes:[-.1262,7.4481]},{latitudes:[51.5002,59.3328],longitudes:[-.1262,18.0645]},{latitudes:[51.5002,40.4167],longitudes:[-.1262,-3.7033]},{latitudes:[51.5002,46.0514],longitudes:[-.1262,14.506]},{latitudes:[51.5002,48.2116],longitudes:[-.1262,17.1547]},{latitudes:[51.5002,44.8048],longitudes:[-.1262,20.4781]},{latitudes:[51.5002,55.7558],longitudes:[-.1262,37.6176]},{latitudes:[51.5002,38.7072],longitudes:[-.1262,-9.1355]},{latitudes:[51.5002,54.6896],longitudes:[-.1262,25.2799]},{latitudes:[51.5002,64.1353],longitudes:[-.1262,-21.8952]},{latitudes:[51.5002,40.43],longitudes:[-.1262,-74]}],images:[{label:"Flights from London",svgPath:e,left:100,top:45,labelShiftY:5,color:"#d93d5e",labelColor:"#d93d5e",labelRollOverColor:"#d93d5e",labelFontSize:20},{label:"show flights from Vilnius",left:106,top:70,labelColor:"#6c7b88",labelRollOverColor:"#d93d5e",labelFontSize:11,linkToObject:"vilnius"}]},{id:"vilnius",color:"#009dc7",svgPath:t,title:"Vilnius",latitude:54.6896,longitude:25.2799,scale:1.5,zoomLevel:4.92,zoomLongitude:15.4492,zoomLatitude:50.2631,lines:[{latitudes:[54.6896,50.8371],longitudes:[25.2799,4.3676]},{latitudes:[54.6896,59.9138],longitudes:[25.2799,10.7387]},{latitudes:[54.6896,40.4167],longitudes:[25.2799,-3.7033]},{latitudes:[54.6896,50.0878],longitudes:[25.2799,14.4205]},{latitudes:[54.6896,48.2116],longitudes:[25.2799,17.1547]},{latitudes:[54.6896,44.8048],longitudes:[25.2799,20.4781]},{latitudes:[54.6896,55.7558],longitudes:[25.2799,37.6176]},{latitudes:[54.6896,37.9792],longitudes:[25.2799,23.7166]},{latitudes:[54.6896,54.6896],longitudes:[25.2799,25.2799]},{latitudes:[54.6896,51.5002],longitudes:[25.2799,-.1262]},{latitudes:[54.6896,53.3441],longitudes:[25.2799,-6.2675]}],images:[{label:"Flights from Vilnius",svgPath:e,left:100,top:45,labelShiftY:5,color:"#d93d5e",labelColor:"#d93d5e",labelRollOverColor:"#d93d5e",labelFontSize:20},{label:"show flights from London",left:106,top:70,labelColor:"#009dc7",labelRollOverColor:"#d93d5e",labelFontSize:11,linkToObject:"london"}]},{svgPath:t,title:"Brussels",latitude:50.8371,longitude:4.3676},{svgPath:t,title:"Prague",latitude:50.0878,longitude:14.4205},{svgPath:t,title:"Athens",latitude:37.9792,longitude:23.7166},{svgPath:t,title:"Reykjavik",latitude:64.1353,longitude:-21.8952},{svgPath:t,title:"Dublin",latitude:53.3441,longitude:-6.2675},{svgPath:t,title:"Oslo",latitude:59.9138,longitude:10.7387},{svgPath:t,title:"Lisbon",latitude:38.7072,longitude:-9.1355},{svgPath:t,title:"Moscow",latitude:55.7558,longitude:37.6176},{svgPath:t,title:"Belgrade",latitude:44.8048,longitude:20.4781},{svgPath:t,title:"Bratislava",latitude:48.2116,longitude:17.1547},{svgPath:t,title:"Ljubljana",latitude:46.0514,longitude:14.506},{svgPath:t,title:"Madrid",latitude:40.4167,longitude:-3.7033},{svgPath:t,title:"Stockholm",latitude:59.3328,longitude:18.0645},{svgPath:t,title:"Bern",latitude:46.948,longitude:7.4481},{svgPath:t,title:"Kiev",latitude:50.4422,longitude:30.5367},{svgPath:t,title:"Paris",latitude:48.8567,longitude:2.351},{svgPath:t,title:"New York",latitude:40.43,longitude:-74}]},zoomControl:{buttonFillColor:"#dddddd"},areasSettings:{unlistedAreasColor:"#15A892"},imagesSettings:{color:"#d93d5e",rollOverColor:"#d93d5e",selectedColor:"#009dc7"},linesSettings:{color:"#d93d5e",alpha:.4},backgroundZoomsToTop:!0,linesAboveImages:!0,"export":{enabled:!0,libs:{path:"http://www.amcharts.com/lib/3/plugins/export/libs/"}}})}},initAmChart3:function(){if("undefined"!=typeof AmCharts&&0!==$("#dashboard_amchart_3").size()){AmCharts.makeChart("dashboard_amchart_3",{type:"serial",addClassNames:!0,theme:"light",path:"../assets/global/plugins/amcharts/ammap/images/",autoMargins:!1,marginLeft:30,marginRight:8,marginTop:10,marginBottom:26,balloon:{adjustBorderColor:!1,horizontalPadding:10,verticalPadding:8,color:"#ffffff"},dataProvider:[{year:2009,income:23.5,expenses:21.1},{year:2010,income:26.2,expenses:30.5},{year:2011,income:30.1,expenses:34.9},{year:2012,income:29.5,expenses:31.1},{year:2013,income:30.6,expenses:28.2},{year:2014,income:34.1,expenses:32.9,dashLengthColumn:5,alpha:.2,additional:"(projection)"}],valueAxes:[{axisAlpha:0,position:"left"}],startDuration:1,graphs:[{alphaField:"alpha",balloonText:"<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",fillAlphas:1,title:"Income",type:"column",valueField:"income",dashLengthField:"dashLengthColumn"},{id:"graph2",balloonText:"<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",bullet:"round",lineThickness:3,bulletSize:7,bulletBorderAlpha:1,bulletColor:"#FFFFFF",useLineColorForBulletBorder:!0,bulletBorderThickness:3,fillAlphas:0,lineAlpha:1,title:"Expenses",valueField:"expenses"}],categoryField:"year",categoryAxis:{gridPosition:"start",axisAlpha:0,tickLength:0},"export":{enabled:!0}})}},initAmChart4:function(){if("undefined"!=typeof AmCharts&&0!==$("#dashboard_amchart_4").size()){var t=AmCharts.makeChart("dashboard_amchart_4",{type:"pie",theme:"light",path:"../assets/global/plugins/amcharts/ammap/images/",dataProvider:[{country:"Lithuania",value:260},{country:"Ireland",value:201},{country:"Germany",value:65},{country:"Australia",value:39},{country:"UK",value:19},{country:"Latvia",value:10}],valueField:"value",titleField:"country",outlineAlpha:.4,depth3D:15,balloonText:"[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",angle:30,"export":{enabled:!0}});jQuery(".chart-input").off().on("input change",function(){var e=jQuery(this).data("property"),a=t,i=Number(this.value);t.startDuration=0,"innerRadius"==e&&(i+="%"),a[e]=i,t.validateNow()})}},initWorldMapStats:function(){0!==$("#mapplic").size()&&($("#mapplic").mapplic({source:"../assets/global/plugins/mapplic/world.json",height:265,animate:!1,sidebar:!1,minimap:!1,locations:!0,deeplinking:!0,fullscreen:!1,hovertip:!0,zoombuttons:!1,clearbutton:!1,developer:!1,maxscale:2,skin:"mapplic-dark",zoom:!0}),$("#widget_sparkline_bar").sparkline([8,7,9,8.5,8,8.2,8,8.5,9,8,9],{type:"bar",width:"100",barWidth:5,height:"30",barColor:"#4db3a4",negBarColor:"#e02222"}),$("#widget_sparkline_bar2").sparkline([8,7,9,8.5,8,8.2,8,8.5,9,8,9],{type:"bar",width:"100",barWidth:5,height:"30",barColor:"#f36a5a",negBarColor:"#e02222"}),$("#widget_sparkline_bar3").sparkline([8,7,9,8.5,8,8.2,8,8.5,9,8,9],{type:"bar",width:"100",barWidth:5,height:"30",barColor:"#5b9bd1",negBarColor:"#e02222"}),$("#widget_sparkline_bar4").sparkline([8,7,9,8.5,8,8.2,8,8.5,9,8,9],{type:"bar",width:"100",barWidth:5,height:"30",barColor:"#9a7caf",negBarColor:"#e02222"}))},init:function(){this.initCharts(),this.initEasyPieCharts(),this.initSparklineCharts(),this.initDashboardDaterange(),this.initAmChart1(),this.initAmChart2(),this.initAmChart3(),this.initAmChart4()}}}();App.isAngularJsApp()===!1&&jQuery(document).ready(function(){Dashboard.init()});
</script>
