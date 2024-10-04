<!--#include file="comun/menu_sup.asp"-->
<%if id_categoria<>"" then
Sql= "SELECT titulo_esp, url_esp FROM categorias WHERE id_categoria="&id_categoria&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp_cat=ob_rs("titulo_esp")
url_esp_cat=ob_rs("url_esp")
end if
ob_rs.close
end if%>

<div class="c-layout-breadcrumbs-1 c-bgimage-full c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza" style="background-image: url(<%=ruta_banner%>)"><div class="c-breadcrumbs-wrapper"><div class="container"><div class="c-page-title c-pull-left"><h1 class="c-font-uppercase c-font-white c-font-20 c-font-slim "><%=titulo_esp_div%> | <%=titulo_esp_cat%> | <%=titulo_esp%></h1><h2 class="c-font-white c-font-thin c-opacity-07"><%=alt_banner%></h2></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white" title="<%=titulo_esp_web%>"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white"><%=titulo_esp%></li></ul></div></div></div>

<div class="c-content-box c-size-md c-bg-white content_programa">
<div class="container"><div class="row"><div class="col-sm-12 wow animate fadeInLeft">
<%if completo="si"then%><a href="#relacionados" class="c-link"> <span class="btn btn-md c-btn-square c-btn-green c-btn-uppercase c-btn-bold pull-right" style="cursor:pointer;margin-bottom:25px"><i class="fa fa-lock" aria-hidden="true"></i> Curso completo&nbsp; (ver alternativas <i class="fa fa-search"></i>)</span></a><%end if%>
<div class="c-content-title-1"><h2 class="c-font-uppercase h2_programa"><%=titulo_esp%></h2><div class="c-line-left c-theme-bg"></div></div>
</div>
</div>
<div class="c-content-tab-4 c-opt-5 tabs_no_resp" role="tabpanel">
<ul class="nav nav-justified" role="tablist">
<li role="presentation" class="active"><a href="#tab-1" role="tab" data-toggle="tab" aria-expanded="true">GENERAL</a></li>
<%if tab_1_act="si" and tab_1_titulo_esp<>"" then%><li role="presentation"><a href="#tab-2" role="tab" data-toggle="tab" aria-expanded="false"><%=ucase(tab_1_titulo_esp)%></a></li><%end if%>
<%if tab_2_act="si" and tab_2_titulo_esp<>"" then%><li role="presentation"><a href="#tab-3" role="tab" data-toggle="tab" aria-expanded="false"><%=ucase(tab_2_titulo_esp)%></a></li><%end if%>
<%if tab_3_act="si" and tab_3_titulo_esp<>"" then%><li role="presentation"><a href="#tab-4" role="tab" data-toggle="tab" aria-expanded="false"><%=ucase(tab_3_titulo_esp)%></a></li><%end if%>       
<%if tab_4_act="si" and tab_4_titulo_esp<>"" then%><li role="presentation"><a href="#tab-5" role="tab" data-toggle="tab" aria-expanded="false"><%=ucase(tab_4_titulo_esp)%></a></li><%end if%>     
<%if tab_5_act="si" and tab_5_titulo_esp<>"" then%><li role="presentation"><a href="#tab-6" role="tab" data-toggle="tab" aria-expanded="false"><%=ucase(tab_5_titulo_esp)%></a></li><%end if%>        
<%if tab_6_act="si" and tab_6_titulo_esp<>"" then%><li role="presentation"><a href="#tab-7" role="tab" data-toggle="tab" aria-expanded="false"><%=ucase(tab_6_titulo_esp)%></a></li><%end if%>
</ul>
<div class="tab-content">
<div role="tabpanel" class="tab-pane fade active in" id="tab-1">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<h4 class="c-font-23">Acerca de <%=titulo_esp%></h4>
<%=replace(texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%if tab_1_act="si" and tab_1_titulo_esp<>"" then%>                            
<div role="tabpanel" class="tab-pane fade" id="tab-2">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<%=replace(tab_1_texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%end if%>                            
<%if tab_2_act="si" and tab_2_titulo_esp<>"" then%>                            
<div role="tabpanel" class="tab-pane fade" id="tab-3">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<%=replace(tab_2_texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%end if%>   
<%if tab_3_act="si" and tab_3_titulo_esp<>"" then%>                            
<div role="tabpanel" class="tab-pane fade" id="tab-4">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<%=replace(tab_3_texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%end if%> 
<%if tab_4_act="si" and tab_4_titulo_esp<>"" then%>                            
<div role="tabpanel" class="tab-pane fade" id="tab-5">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<%=replace(tab_4_texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%end if%> 
<%if tab_5_act="si" and tab_5_titulo_esp<>"" then%>                            
<div role="tabpanel" class="tab-pane fade" id="tab-6">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<%=replace(tab_5_texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%end if%> 
<%if tab_6_act="si" and tab_6_titulo_esp<>"" then%>                            
<div role="tabpanel" class="tab-pane fade" id="tab-7">
<ul class="c-tab-items">
<li class="row">
<div class="col-sm-12 col-xs-12 tab_dentro">
<%=replace(tab_6_texto_esp,"&#34;","""")%>
</div>
</li>
</ul>
</div>
<%end if%>                             
</div>
</div>
<div class="c-content-accordion-1 c-theme wow animate fadeInRight tabs_resp">
<div class="panel-group" id="accordion" role="tablist">
<div class="panel"><div class="panel-heading" role="tab" id="cab0"><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col0" aria-expanded="true" aria-controls="col0" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i>Acerca de <%=titulo_esp%></a></h4></div><div id="col0" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab0"><!--in-->
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(texto_esp,"&#34;","""")%></div></div></div>
<%if tab_1_act="si" and tab_1_titulo_esp<>"" then%>
<div class="panel"><div class="panel-heading" role="tab" id="cab1"><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col1" aria-expanded="true" aria-controls="col1" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i> <%=tab_1_titulo_esp%></a></h4></div><div id="col1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab1"><!--in-->
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(tab_1_texto_esp,"&#34;","""")%></div></div></div>
<%end if%>                                  
<%if tab_2_act="si" and tab_2_titulo_esp<>"" then%>
<div class="panel"><div class="panel-heading" role="tab" id="cab2"><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col2" aria-expanded="true" aria-controls="col2" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i><%=tab_2_titulo_esp%></a></h4></div><div id="col2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab2">
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(tab_2_texto_esp,"&#34;","""")%></div></div></div>
<%end if%>    
<%if tab_3_act="si" and tab_3_titulo_esp<>"" then%>
<div class="panel"><div class="panel-heading" role="tab" id="cab3" ><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col3" aria-expanded="true" aria-controls="col3" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i><%=tab_3_titulo_esp%></a></h4></div><div id="col3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab3">
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(tab_3_texto_esp,"&#34;","""")%></div></div></div>
<%end if%>          
<%if tab_4_act="si" and tab_4_titulo_esp<>"" then%>
<div class="panel"><div class="panel-heading" role="tab" id="cab4"><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col4" aria-expanded="true" aria-controls="col4" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i><%=tab_4_titulo_esp%></a></h4></div><div id="col4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab4">
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(tab_4_texto_esp,"&#34;","""")%></div></div></div>
<%end if%>                               
<%if tab_5_act="si" and tab_5_titulo_esp<>"" then%>
<div class="panel"><div class="panel-heading" role="tab" id="cab5"><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col5" aria-expanded="true" aria-controls="col5" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i><%=tab_5_titulo_esp%></a></h4></div><div id="col5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab5">
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(tab_5_texto_esp,"&#34;","""")%></div></div></div>
<%end if%>
<%if tab_6_act="si" and tab_6_titulo_esp<>"" then%>
<div class="panel"><div class="panel-heading" role="tab" id="cab6"><h4 class="panel-title"><a class="collapsed c-font-bold c-font-uppercase c-font-19" data-toggle="collapse" data-parent="#accordion" href="#col6" aria-expanded="true" aria-controls="col6" style="padding-top:15px;padding-bottom:15px;border:1px solid #ddd"><i class="fa fa-sort" aria-hidden="true" style="color:#CCC"></i><%=tab_6_titulo_esp%></a></h4></div><div id="col6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="cab6">
<div class="panel-body c-font-18" style="background:#fff;color:#666;padding-top:20px;border-left:1px solid #ddd;border-right:1px solid #ddd;border-bottom:1px solid #ddd;"><%=replace(tab_6_texto_esp,"&#34;","""")%></div></div></div>
<%end if%>
</div>                           
</div>
<div class="descarga_curso_pdf"><a href="<%=r%>web/pr_pdf.asp?id_item=<%=id_item%>">Descargar pdf <i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></div>
</div>
</div>
<%cod_ko=request("cod_ko")
if completo="si" then disponible="" end if%>
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<%Sql2= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&id_item&" and id_itemSub <>0 " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana,itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana and itemsSubSemanas.semanas<>53 order by itemsSubSemanas.precio" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio=ob_rs3("precio")
id_itemSub_dd=ob_rs3("id_itemSub")
semanas_dd=ob_rs3("semanas")%>
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&id_item&" and id_itemSub <>0 " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if precio<>"" and precio<>0 then
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana and itemsSubSemanas.precio < "&precio&" and itemsSubSemanas.semanas<>53" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio=ob_rs3("precio")
id_itemSub_dd=ob_rs3("id_itemSub")
semanas_dd=ob_rs3("semanas")
end if
ob_rs3.close
end if
ob_rs2.movenext
loop
end if
ob_rs2.close%>
<div class="container"><div class="c-row c-try"><%if precio<>0 and precio<>"" and disponible="si" then%><a class="btn btn-md c-btn-square c-btn-red c-btn-uppercase c-btn-bold" title="Reservar curso de idiomas <%=titulo_esp%>" href="javascript:cargaCurso(<%=semanas_dd%>, <%=id_itemSub_dd%>);suma();">RESERVAR desde <%=FormatNumber(ccur(precio*fluctuacion_c),2)%>&nbsp;<%=mon%></a>
<%end if%>
<%if completo="si"then%><a href="#relacionados" class="c-link"> <span class="btn btn-md c-btn-square c-btn-green c-btn-uppercase c-btn-bold" style="cursor:pointer;margin-bottom:0px;margin-top:0px"><i class="fa fa-lock" aria-hidden="true"></i> Curso completo&nbsp; (ver alternativas <i class="fa fa-search"></i>)</span></a><%end if%>
<%if pr_actualizado="si" and anyo_actualizado<>""then%><span class="pr_actualilzado"><i class="fa fa-check" aria-hidden="true"></i> Precio actualizado a <%=anyo_actualizado%></span><%end if%></div></div>
<div class="container" id="content">
<div class="<%if disponible="si"then%>col-md-9<%else%>col-md-12<%end if%> padding-0">
<div class="col-md-12 padding-0">            
<%Sql= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&id_item&" and id_itemSub <>0 "                  '  PRECIOS RESERVA
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tabla="on"
end if
ob_rs.close%>
<%if tabla="on"then%>
<div class="c-content-box c-size-md padding-0" style="padding-top:10px;">
<div class="container">
<div class="row c-margin-t-10 c-margin-b-10" >
<div class="col-md-12">
<div class="c-content-title-1 c-title-pricing-1">
<h3 class="c-font-uppercase c-font-grey-2">Elige tu curso de idiomas</h3>
</div>
</div>
</div>
<div class="row">
<div class="<%if disponible="si"then%>col-md-9 col-lg-9<%else%>col-md-12 col-lg-12<%end if%> ">
<div class="table-responsive">                
<table class="table table-reflow tabla_cursos">
<thead>
<tr>
<th style="width:240px">Cursos / Semanas</th>
<%Dim col(53), sem(53)'VAMOS A SACAR COLUMNAS
Sql= "SELECT rel.id_item, rel.id_itemSub, itemsSub.id_itemSub FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub <>0 and rel.id_itemSub=itemsSub.id_itemSub ORDER BY itemsSub.orden_curso" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
for y=1 to 53
Sql2= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs("rel.id_itemSub")&" and itemsSubSemanas.id_itemSubSemana<>0 and itemsSubSemanas.id_itemSubSemana = rel.id_itemSubSemana and itemsSubSemanas.semanas="&y&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
col(y)="on"
sem(y)=ob_rs2("semanas")
ob_rs2.movenext
loop
end if
ob_rs2.close
next
ob_rs.movenext
loop
end if
ob_rs.close'FIN SACAR COLUMNAS
for t=1 to 53
if col(t)="on" and t=sem(t) then
if sem(t)<>53then%><th><%if t=12 and format_sem="si"then%>Trimestre escolar.<%end if%><%if t=16 and format_sem="si"then%>Cuatrimestre escolar.<%end if%><%if t=24 and format_sem="si"then%>Semestre escolar.<%end if%><%if t=52 and format_sem="si"then%>Año escolar<%end if%><%if t<>12 and t<>16 and t<>24 and t<>52 then%><%=sem(t)%> sem.<%end if%><%if (t=12 or t=16 or t=24 or t=52) and format_sem<>"si" then%><%=sem(t)%> sem.<%end if%></th><%else%><th>Sem. Extra</th><%end if
end if
next%>
</tr>
</thead>
<tbody  style="text-align:center">
<%Sql= "SELECT rel.id_item, rel.id_itemSub, itemsSub.id_itemSub, itemsSub.titulo_esp, texto_esp FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub <>0 and rel.id_itemSub=itemsSub.id_itemSub AND visible='si' ORDER BY itemsSub.orden_curso" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_i=1
do while not ob_rs.eof%>
<tr><td scope="row"><%=ob_rs("titulo_esp")%> <%if ob_rs("texto_esp")<>""then%><a href="javascript:info_curso<%=num_i%>();" class=""><i class="fa fa-info-circle" aria-hidden="true" style="margin-left:5px;color:#999"></i></a><script>function info_curso<%=num_i%>() {$('#alerta_txt').html('<%=ob_rs("texto_esp")%>');$('#alerta_tit').html('<%=ob_rs("titulo_esp")%>');$('#alerta').modal('show');}</script><%end if%></td>
<%for t=1 to 53
if col(t)="on" and t=sem(t) then%>
<td>
<%Sql2= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs("rel.id_itemSub")&" and itemsSubSemanas.id_itemSubSemana<>0 and itemsSubSemanas.id_itemSubSemana = rel.id_itemSubSemana and itemsSubSemanas.semanas="&t&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%if t<>53 then%><%if disponible="si"then%><a href="javascript:cargaCurso(<%=t%>, <%=ob_rs2("id_itemSub")%>);suma();" class="enlace_reserva"><%end if%><%if pre_medida="si"then%> <span class="" style="font-size:0.8em;color:#999">desde*&nbsp;&nbsp;</span><%end if%><%=FormatNumber(ccur(ob_rs2("precio")*fluctuacion_c),0)%>&nbsp;<%=mon%><%if disponible="si"then%><i class="fa fa-plus-circle" aria-hidden="true"></i></a><%end if%>
<%else%>
<%if pre_medida="si"then%> <span class="" style="font-size:0.8em;color:#999">desde*&nbsp;&nbsp;</span><%end if%><%=FormatNumber(ccur(ob_rs2("precio")*fluctuacion_c),0)%>&nbsp;<%=mon%>
<%end if%>
<%else%>-<%end if
ob_rs2.close%>
</td>
<%end if
next%>
</tr>
<%ob_rs.movenext
num_i=num_i+1
loop
end if
ob_rs.close%>
</tbody>
</table>
</div>
</div>
</div>      
</div>
</div>
<%end if '                  FIN PRECIOS RESERVA%>
</div>
<div class="col-md-12 padding-0">            
<%Sql= "SELECT id_item, id_alojamiento FROM rel WHERE id_item="&id_item&" and id_alojamiento <>0 "                  '  PRECIOS ALOJAMIENTOS
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then tabla_alo="on" end if
ob_rs.close%>
<%if tabla_alo="on"then%>
<div class="c-content-box c-size-md padding-0" style="padding-top:0px;">
<div class="container">
<div class="row c-margin-t-0 c-margin-b-10">
<div class="col-md-12">
<div class="c-content-title-1 c-title-pricing-1">
<h3 class="c-font-uppercase c-font-grey-2">Elige tu alojamiento</h3>
</div>
</div>
</div>
<div class="row">
<div class="<%if disponible="si"then%>col-md-9 col-lg-9<%else%>col-md-12 col-lg-12<%end if%>" >
<div class="table-responsive">   
<%Sql= "SELECT rel.id_alo_tipo, alo_tipo.titulo_esp, alo_tipo.texto_esp,alo_tipo.orden FROM rel, alo_tipo WHERE id_item="&id_item&" and rel.id_alo_tipo<>0 and rel.id_alo_tipo=alo_tipo.id_alo_tipo and rel.id_alojamiento <> 0 GROUP BY rel.id_alo_tipo, alo_tipo.titulo_esp, alo_tipo.orden,alo_tipo.texto_esp ORDER BY alo_tipo.orden"           
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f=1
do while not ob_rs.eof%>
<table class="table table-reflow tabla_aloja">
<thead>
<tr>
<th style="width:240px"><%=ob_rs("titulo_esp")%><%if ob_rs("texto_esp")<>"" then%><a href="javascript:info_alo_tipo<%=a%>();" class="infos"><span class="fa fa-info-circle" aria-hidden="true"></span></a><script>function info_alo_tipo<%=a%>() {$('#alerta_txt').html('<%=ob_rs("texto_esp")%>');$('#alerta_tit').html('<%=ob_rs("titulo_esp")%>');$('#alerta').modal('show');}</script><%end if%>
</th>
<%Sql2= "SELECT alo_op.titulo_esp, texto_esp FROM rel, alo_op WHERE rel.id_item="&id_item&" and alo_op.id_alo_op=rel.id_alo_op and rel.id_alojamiento<>0 and rel.id_alo_tipo<> 0 and rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" GROUP BY alo_op.id_alo_op, alo_op.titulo_esp,alo_op.orden, texto_esp ORDER BY alo_op.orden"               
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
j=1
do while not ob_rs2.eof %>
<th><%=ob_rs2("titulo_esp")%><%if ob_rs2("texto_esp")<>""then%><a href="javascript:info_alo_opcion<%=j%>();" class="infos"><i class="fa fa-info-circle" aria-hidden="true"></i></a><script>function info_alo_opcion<%=j%>() {$('#alerta_txt').html('<%=ob_rs2("texto_esp")%>');$('#alerta_tit').html('<%=ob_rs2("titulo_esp")%>');$('#alerta').modal('show');}</script><%end if%></th>
<%ob_rs2.movenext
j=j+1
loop
end if
ob_rs2.close%>
</tr>
</thead><tbody  style="text-align:center">
<%Sql2= "SELECT rel.id_alojamiento, alo_conceptos.titulo_esp, texto_esp FROM rel, alo_conceptos WHERE rel.id_item="&id_item& " and rel.id_alojamiento<>0 and rel.id_alojamiento=alo_conceptos.id_alojamiento and rel.id_alo_tipo<> 0 and rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" and alo_conceptos.tipo_alo="&ob_rs("id_alo_tipo")&" and rel.id_alo_opcion=0 and rel.id_suplemento=0 GROUP BY alo_conceptos.tipo_alo, rel.id_alojamiento, rel.id_alo_tipo, alo_conceptos.titulo_esp, rel.id_rel, alo_conceptos.orden, texto_esp ORDER BY alo_conceptos.orden"    
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
c=1
do while not ob_rs2.eof %>
<tr><td><%=ob_rs2("titulo_esp")%><%if ob_rs2("texto_esp")<>""then%><a href="javascript:info_alo_concepto<%=f%>();" class="infos"><i class="fa fa-info-circle" aria-hidden="true"></i></a><script>function info_alo_concepto<%=f%>() {$('#alerta_txt').html('<%=ob_rs2("texto_esp")%>');$('#alerta_tit').html('<%=ob_rs2("titulo_esp")%>');$('#alerta').modal('show');}</script><%end if%></td>
<%Sql3= "SELECT alo_op.titulo_esp, alo_op.id_alo_op FROM rel, alo_op WHERE rel.id_item="&id_item&" and alo_op.id_alo_op=rel.id_alo_op and rel.id_alo_tipo<> 0 and rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" GROUP BY alo_op.id_alo_op, alo_op.titulo_esp,alo_op.orden ORDER BY alo_op.orden"               
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof 
Sql4= "SELECT alo_opciones.precio, alo_opciones.id_alo_opcion, texto_esp FROM rel, alo_opciones WHERE id_item="&id_item&" AND rel.id_alo_op="&ob_rs3("id_alo_op")&" AND rel.id_alo_opcion=alo_opciones.id_alo_opcion AND id_alojamiento="&ob_rs2("id_alojamiento")&" AND alo_opciones.op_alo="&ob_rs3("id_alo_op")&""               
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof%><td><%if disponible="si"then%><a href="javascript: cargaAloja(<%=ob_rs4("id_alo_opcion")%>, <%=ob_rs2("id_alojamiento")%>)" class="enlace_reserva"><%end if%><%=FormatNumber(ccur(ob_rs4("precio")*fluctuacion_a),0)%>&nbsp;<%=mon%><%if disponible="si"then%><i class="fa fa-plus-circle" aria-hidden="true" style="margin-right:-5px;"></i>
<%if ob_rs4("texto_esp")<>""then%>
<i class="fa fa-info-circle" aria-hidden="true" onclick="javascript:info_alo_opcion<%=f%><%=c%>();" style="color:#32C5D2"></i><script>function info_alo_opcion<%=f%><%=c%>() {$('#alerta_txt').html('<%=replace(ob_rs4("texto_esp"),"â‚¬","€")%>');$('#alerta_tit').html('<%=ob_rs2("titulo_esp")%>');$('#alerta').modal('show');}</script></a><%end if%>
<%else%>
<%if ob_rs4("texto_esp")<>"" then%><a href="javascript:info_alo_opcion<%=f%><%=c%>();" class="infos"><i class="fa fa-info-circle" aria-hidden="true"></i></a><script>function info_alo_opcion<%=f%><%=c%>() {$('#alerta_txt').html('<%=ob_rs4("texto_esp")%>');$('#alerta_tit').html('<%=ob_rs2("titulo_esp")%>');$('#alerta').modal('show');}</script><%end if%>
<%end if%>
</td><%ob_rs4.movenext
loop
else%><td>-</td><%
end if
ob_rs4.close
ob_rs3.movenext
c=c+1
loop
end if
ob_rs3.close%>
</tr>
<%ob_rs2.movenext
f=f+1
loop
end if
ob_rs2.close%>
</tbody>
</table>
<%ob_rs.movenext
a=a+1
loop
end if
ob_rs.close%>
<span style="width:100%;text-align:right;display:block;font-style:italic;font-size:0.8em">*Precios de alojamientos por semana</span>
</div>
</div>
</div>      
</div>
</div>
<%end if '                  FIN PRECIOS ALOJA%>
</div>
</div>
<%if disponible="si"then%>
<div class="col-md-3 col-lg-3 reserva" ><h3><i class="fa fa-file-text-o" aria-hidden="true"></i> Reserva</h3><!--TABLA RESERVA DERECHA-->
<form name="reserva" id="reserva" method="post" action="<%=r%>reserva">
<input name="cod_ko" type="hidden" value="<%=cod_ko%>" sutocomplete="off">
<input name="id_item" type="hidden" value="<%=id_item%>"><input name="id_categoria" type="hidden" value="<%=id_categoria%>">
<%Sql= "SELECT rel.id_itemSub, itemsSub.titulo_esp FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub <>0 and rel.id_itemSub=itemsSub.id_itemSub"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="caja_curso">
<select name="curso" id="curso" onChange="suma();" style="width:100%" autocomplete="off">
<option value="">Selecciona Curso</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_itemSub")%>"><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop%>
</select>
</div>
<%end if
ob_rs.close%>
<%Sql= "SELECT rel.id_alo_tipo, alo_tipo.titulo_esp FROM rel, alo_tipo WHERE rel.id_item="&id_item&" and rel.id_alojamiento <>0 and rel.id_alo_tipo=alo_tipo.id_alo_tipo GROUP BY rel.id_alo_tipo, alo_tipo.titulo_esp,  alo_tipo.orden ORDER BY alo_tipo.orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="caja_aloja">
<select name="alojamiento" id="alojamiento" onChange="suma();" style="width:100%" autocomplete="off">
<option value="">Selecciona Alojamiento</option>
<%do while not ob_rs.eof%>
<optgroup value="" label="<%=ob_rs("titulo_esp")%>">
<%Sql2= "SELECT alo_conceptos.titulo_esp, alo_op.titulo_esp, rel.id_alo_op, rel.id_alo_opcion, rel.id_alojamiento FROM alo_conceptos, rel, alo_op WHERE rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" AND rel.id_item="&id_item&" AND rel.id_alo_op=alo_op.id_alo_op AND rel.id_alojamiento=alo_conceptos.id_alojamiento ORDER BY alo_conceptos.orden, alo_op.orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<option value="<%=ob_rs2("id_alo_opcion")%>|<%=ob_rs2("id_alojamiento")%>"><%=ob_rs2("alo_conceptos.titulo_esp")%> / <%=ob_rs2("alo_op.titulo_esp")%></option>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
</optgroup>
<%ob_rs.movenext
loop%>
</select>
</div>
<%end if
ob_rs.close%>
<input name="semanas_p" type="hidden" value="">
<%Sql= "SELECT opcion_esp, opcion_ob, rel.id_itemOp FROM rel, itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp<>0 AND rel.id_itemOp=itemsOp.id_itemOp  ORDER BY opcion_orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<div class="c-checkbox-list" >
<%do while not ob_rs.eof%>
<div class="c-checkbox">
<%if ob_rs("opcion_ob")="si"then%>
<input type="checkbox" id="no<%=i%>" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no<%=i%>" class="check_txt"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("opcion_esp")%></label>
<input type="hidden" name="opp[<%=i%>]" value="<%=ob_rs("id_itemOp")%>" />
<%else%>
<input type="checkbox" id="opp[<%=i%>]" class="c-check" onclick="suma_total();" value="<%=ob_rs("id_itemOp")%>" name="opp[<%=i%>]" autocomplete="off">
<label for="opp[<%=i%>]" class="check_txt" onclick="suma_total();"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("opcion_esp")%></label>
<%end if%>
</div>
<%ob_rs.movenext
i=i+1
loop%>
</div>
<%end if
ob_rs.close%>
<div id="Suma_Curso"></div>
<div id="Suma_Total"></div>
<div class="carga">calculando...</div>
</form>
<script language="javascript">
suma_total();
function datea(esto){
String.prototype.contains = function(it){return this.indexOf(it) != -1;};
var esto2;
var uno = esto.contains("1"); 
if (uno==false){esto2=esto2+"1"}
var dos = esto.contains("2"); 
if (dos==false){esto2=esto2+"2"}
var tres = esto.contains("3"); 
if (tres==false){esto2=esto2+"3"}
var cuatro = esto.contains("4"); 
if (cuatro==false){esto2=esto2+"4"}
var cinco = esto.contains("5"); 
if (cinco==false){esto2=esto2+"5"}
var seis = esto.contains("6"); 
if (seis==false){esto2=esto2+"6"}
var siete = esto.contains("7"); 
if (siete==false){esto2=esto2+"0"}
$('.date-picker').datepicker({ startDate: new Date() , minDate: 0, language: 'es',autoclose: true,daysOfWeekHighlighted: esto,daysOfWeekDisabled: esto2});}
function selectItemCombo(combo, valor)
{for(i=0; i<combo.length; i++){if (combo.options[i].value == valor)combo.selectedIndex = i;
var manejador = $(combo).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", combo.selectedIndex)}}}
function cargaCurso(semanas,id_curso){
selectItemCombo(document.reserva.curso, id_curso);
document.reserva.semanas_p.value=semanas;
$( ".caja_curso .dd .ddTitle" ).addClass( "cajote" );}
function cargaAloja(opcion,alojamiento){
$( ".caja_aloja .dd .ddTitle" ).addClass( "cajote" );
selectItemCombo(document.reserva.alojamiento, opcion+"|"+alojamiento);
suma_total();}
$('.carga').hide();
$("#curso").change(function(){suma();})
$("#alojamiento").change(function(){suma();})
function suma(){
semanas_p=	document.reserva.semanas_p.value;
id_itemSub=document.reserva.curso.value;
$('#Suma_Total').hide();
$('.carga').fadeIn(100, function(){});
$(function() {     
$.ajax({
url:'<%=r%>web/pr_curso.asp?id_item=<%=id_item%>&id_itemSub='+id_itemSub+'&semanas_p='+semanas_p+'',
type: 'get',
success: function(content,code) {
$('#Suma_Curso').html(content);$('#Suma_Curso').hide();
$('.carga').fadeOut(800, function(){$('#Suma_Curso').fadeIn(800, function(){});$( ".caja_curso .dd .ddTitle" ).removeClass( "cajote" );});}});});}
function suma_total(){
$('#Suma_Total').hide();
$('.carga').fadeIn(100, function(){});
var url = "<%=r%>web/pr_total.asp";
$.ajax({
type: "GET",
url: url,
data: $("#reserva").serialize(),
success: function(data){
$('#Suma_Total').html(data);
$('#Suma_Total').hide();
$('.carga').fadeOut(500, function(){$('#Suma_Total').html(data).fadeIn(500);$( ".caja_aloja .dd .ddTitle" ).removeClass( "cajote" );});}});return false;}</script>
</div>
<%end if'FIN TABLA RESERVA DERECHA%>
<div class="<%if disponible="si"then%>col-md-9<%else%>col-md-12<%end if%> padding-0" style="padding-right:13px"> 
<div class="c-content-box c-size-md c-bg-white" style="padding-top:25px">
<div class="c-content-feature-2-grid">
<div class="c-content-title-1">
  <h3 class="c-font-uppercase c-center c-font-green">En este curso</h3>
  <div class="c-line-center"></div></div>
<div class="row">
<%if tel_24="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-phone" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Teléfono 24 h</h3>
<p>Atención telefónica 24 horas al día</p></div>
</div>
</div>
<%end if%>
<%if wifi="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-wifi" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Wi Fi</h3>
  <p>Conexión gratuita a internet</p>
</div>
</div>
</div>
<%end if%>
<%if monitor="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-user" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Monitor acompañante</h3><p>Apoyo de un monitor en destino</p>
</div>
</div>
</div>
<%end if%>
<%if sup_dest="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Supervisor en destino</h3>
<p>Ayuda de un supervisor en destino</p>
</div>
</div>
</div>
<%end if%>
<%if vuelo="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-plane" aria-hidden="true"></i></div>
<div class="servicios">
<h3 class="">Vuelo Incluido</h3>
<p>Billete de avión incluido en el precio</p>
</div>
</div>
</div>
<%end if%>
<%if alo_fam="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-home" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Alojamiento en Familia</h3>
<p>Con opción de alojamiento en familia</p></div>
</div>
</div>
<%end if%>
<%if alo_res="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-university" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Alojamiento en Residencia</h3>
<p>Con opción de alojamiento en residencia</p></div>
</div>
</div>
<%end if%>
<%if alo_apa="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-building-o" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Alojamiento en Apartamento</h3>
<p>Con opción de alojamiento en apartamento</p></div>
</div>
</div>
<%end if%>
<%if alo_hot="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-h-square" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Alojamiento en Hotel</h3>
<p>Con opción de alojamiento en hotel</p></div>
</div>
</div>
<%end if%>

<%if alo_hos="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-h-square" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Alojamiento en Hostel</h3>
<p>Con opción de alojamiento en hostel</p></div>
</div>
</div>
<%end if%>

<%if act_inc="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-camera-retro" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Actividades incluidas</h3>
<p>Programa de actividades incluido</p></div>
</div>
</div>
<%end if
if c_gene="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-battery-half" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Curso General</h3>
<p>Todas las destrezas lingüísticas. Metodología comunicativa y de tareas</p></div>
</div>
</div>
<%end if%>

<%if multialumno="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-users" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Programa Multi-alumno</h3>
<p>Para viajar acompañado</p></div>
</div>
</div>
<%end if%>
<%if c_semi="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-battery-three-quarters" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Curso Semi Intensivo</h3>
<p>Lograr confianza, conocimientos y uso del idioma rápidamente</p></div>
</div>
</div>
<%end if%>
<%if c_inten="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-battery-full" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Curso Intensivo</h3>
<p>Más lecciones y más ritmo para lograr confianza y fluidez</p></div>
</div>
</div>
<%end if%>
<%if pre_medida="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-calculator" aria-hidden="true"></i>
</div>
<div class="servicios"><h3 class="">Presupuesto a medida*</h3>
<p>Un presupuesto para tus necesidades exactas</p></div>
</div>
</div>
<%end if%>
<%if escuela_tam="m"then
tam="mediano"
em=1.7
end if%>
<%if escuela_tam="g"then
tam="grande"
em=2.4
end if%>
<%if escuela_tam="p"then
tam="pequeño"
em=1.4
end if%>
<%if tam<>""then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-university" aria-hidden="true" style="font-size:<%=em%>em;"></i>
</div>
<div class="servicios"><h3 class="">Tamaño de escuela <%=tam%></h3><p>Con escuela de tamaño <%=tam%></p></div>
</div>
</div>
<%end if%>
<%if ejecutivos="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-suitcase" aria-hidden="true"></i>
</div>
<div class="servicios"><h3 class="">Programa para ejecutivos</h3>
<p>Programa diseñado para profesionales</p></div>
</div>
</div>
<%end if%>
<%if material="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-book" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Material académico</h3>
<p>Se incluye el material académico</p></div>
</div>
</div>
<%end if%>
<%if seg_medico="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-user-md" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Seguro médico incluido</h3><p>Seguro médico y de asistencia en viaje incluido</p>
</div>
</div>
</div>
<%end if%>
<%if uniforme="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Uniforme</h3><p>Obligatoriedad de vestir el uniforme del colegio</p>
</div>
</div>
</div>
<%end if%>


<%if edad_bot="si"then%>
<div class="col-md-6 col-sm-6">
<div class="servicio">
<div class="iconitos"><i class="fa fa-id-card-o" aria-hidden="true"></i></div>
<div class="servicios"><h3 class="">Edades</h3><p>Edades desde <%=ed_desde%> hasta <%=ed_hasta%> años</p>
</div>
</div>
</div>
<%end if%>

<div style="width:100%;clear:both;height:65px"></div>
</div>
</div>
</div>
</div>
</div>
<%Sql= "SELECT rel.id_archivo, rel.id_item, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_item="&id_item&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_2' order by archivos.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
dd=0%>
<div class="c-content-box c-size-md c-bg-grey-1">
<div class="container">
<div class="c-content-title-1"><h3 class="c-center c-font-uppercase ">Lo que verás en el destino</h3><div class="c-line-center c-theme-bg"></div>
<p class="c-center c-font-uppercase">Esta es solo una pequeña muestra de lo que te encontrarás en tu destino.</p>
</div>
<div class="cbp-panel">
<div class="c-content-latest-works cbp cbp-l-grid-masonry-projects wow animate fadeInLeft">
<%Set fso = CreateObject("Scripting.FileSystemObject")
do while not ob_rs.eof
if ob_rs("campo")<>"archivo_19" and ob_rs("campo")<>"archivo_20" and ob_rs("campo")<>"archivo_17" and ob_rs("campo")<>"archivo_18" then

if fso.FileExists (Server.MapPath(replace(ob_rs("nombre"),"%20"," "))) then%>
<div class="cbp-item web-design logos wow animate fadeInLeft" data-wow-delay="<%=dd%>s">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap">
<%txt_ver="ver imagen"%>
<img src="<%=ob_rs("nombre")%>" alt="<%=ob_rs("alt")%>"> 
</div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="<%=ob_rs("nombre")%>" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="<%=ob_rs("alt")%>"><%=txt_ver%></a>
</div>
</div>
</div>
</div>
</div>
<%end if
else%>
<div class="cbp-item web-design logos wow animate fadeInLeft" data-wow-delay="<%=dd%>s"><!---->
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap">
<%txt_ver="ver vídeo"%>
<img src="<%=r%>web/lib/img/ver_video.jpg"> 
</div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="<%=ob_rs("nombre")%>" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="<%=ob_rs("alt")%>"><%=txt_ver%></a>
</div>
</div>
</div>
</div>
</div>
<%end if
ob_rs.movenext
dd=dd+1
loop%>
</div>
</div>
</div>
<div class="c-content-title-1"><div class="c-line-center c-theme-bg" style="margin-top:45px;"></div></div>
</div>
<%end if
ob_rs.close
'RELACIONES CON CURSOS
Sql= "SELECT rel.id_item, rel.id_item_rel, items.orden, items.titulo_esp, items.inc_cat, items.inc_sec, items.inc_des, items.inc_sub, items.visible, items.resumen_esp, items.url_esp FROM rel, items WHERE rel.id_item="&id_item&" and rel.id_item_rel=items.id_item and items.visible='si' order by items.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>

<div class="c-content-box c-size-md" id="relacionados">
<div class="container">
<div class="c-content-blog-post-card-1-slider" data-slider="owl">
<div class="c-content-title-1">
<h3 class="c-center c-font-uppercase c-font-green">Cursos de idiomas relacionados</h3>
<div class="c-line-center c-theme-bg"></div>
</div>
<div class="owl-carousel owl-theme c-theme c-owl-nav-center" data-items="3" data-slide-speed="8000" data-rtl="false">
<%do while not ob_rs.eof
id_item_r=ob_rs("id_item_rel")%>
<!--#include file="comun/fluctuaciones_rel.asp"-->
<!--#include file="comun/moneda_rel.asp"-->
<%if ob_rs("inc_cat")="si" then
Sql2= "SELECT rel.id_item, rel.id_categoria, categorias.id_categoria, categorias.url_esp FROM rel,categorias WHERE rel.id_item="&ob_rs("id_item_rel")&" and rel.id_categoria <>0 and categorias.id_categoria=rel.id_categoria" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then url_cat=ob_rs2("url_esp")&"/" else url_cat="" end if
ob_rs2.close
else
url_cat=""
end if
if ob_rs("inc_sec")="si" then
Sql2= "SELECT rel.id_item, rel.id_seccion, secciones.id_seccion, secciones.url_esp FROM rel,secciones WHERE rel.id_item="&ob_rs("id_item_rel")&" and rel.id_seccion <>0 and secciones.id_seccion=rel.id_seccion" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then url_sec=ob_rs2("url_esp")&"/" else url_sec="" end if
ob_rs2.close
else
url_sec=""
end if
if ob_rs("inc_sub")="si" then
Sql2= "SELECT rel.id_item, rel.id_subSeccion, subsecciones.id_subSeccion, subsecciones.url_esp FROM rel,subsecciones WHERE rel.id_item="&ob_rs("id_item_rel")&" and rel.id_subSeccion <>0 and subsecciones.id_subseccion=rel.id_subseccion" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then url_sub=ob_rs2("url_esp")&"/" else url_sub="" end if
ob_rs2.close
else
url_sub=""
end if
if ob_rs("inc_des")="si" then
Sql2= "SELECT rel.id_item, rel.id_destino, destinos.id_destino, destinos.url_esp FROM rel,destinos WHERE rel.id_item="&ob_rs("id_item_rel")&" and rel.id_destino <>0 and destinos.id_destino=rel.id_destino" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then url_des=ob_rs2("url_esp")&"/" else url_des="" end if
ob_rs2.close
else
url_des=""
end if%>
<div class="item">
<div class="c-content-blog-post-card-1 c-option-2">
<div class="c-media c-content-overlay" style="height:195px;overflow:hidden"><div class="c-overlay-wrapper"><div class="c-overlay-content"><a href="<%=r%><%=url_cat%><%=url_sec%><%=url_sub%><%=url_des%><%=ob_rs("url_esp")%>" title="Curso de idiomas <%=ob_rs("titulo_esp")%>" class="btn btn-md c-btn-grey-1 c-btn-uppercase c-btn-bold c-btn-border-1x c-btn-square">ver curso</a></div></div>
<%Sql2= "SELECT rel.id_archivo, rel.id_item, archivos.nombre, archivos.alt,archivos.campo FROM rel, archivos WHERE rel.id_item="&ob_rs("id_item_rel")&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
alt=ob_rs2("alt")
img_nom=ob_rs2("nombre")
else
img_nom=r&"web/lib/img/no-imagen.gif"
end if
ob_rs2.close%>
<div class="c-bg-img-center c-overlay-object" data-height="height" style="height: 230px; background-image: url('<%=img_nom%>');"></div>
</div>
<div class="c-body" style="background:#fafafa">
<div class="c-title c-font-uppercase c-font-bold"><a href="<%=r%><%=url_cat%><%=url_sec%><%=url_sub%><%=url_des%><%=ob_rs("url_esp")%>" title="Curso de idiomas <%=ob_rs("titulo_esp")%>"><%=ob_rs("titulo_esp")%></a></div>
<div class="c-author"><%=alt%></div>
<div class="c-panel">
<%Sql2= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&ob_rs("id_item_rel")&" and id_itemSub <>0 " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana order by itemsSubSemanas.precio" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio_rel=ob_rs3("precio")%>
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&ob_rs("id_item_rel")&" and id_itemSub <>0 " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana and itemsSubSemanas.precio < "&precio_rel&"" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio_rel=ob_rs3("precio")
end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close%>
<%if precio_rel<>0then%><ul class="c-tags c-theme-ul-bg"><li>desde <%=FormatNumber(ccur(precio_rel*fluctuacion_c),2)%>&nbsp;<%=mon_r%></li></ul><%end if%>
</div>
<p><%=ob_rs("resumen_esp")%></p>
</div></div></div>
<%ob_rs.movenext
loop%></div></div></div></div>
<%end if
ob_rs.close'ob_conn.close%>
<!--#include file="comun/menu_inf.asp"-->
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4>
</div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<%if id_categoria<>""then
Sql2= "SELECT seg_cancelacion FROM categorias WHERE id_categoria="&id_categoria&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div id="seg_cancelacion" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-file-text-o" aria-hidden="true" style="margin-right:15px;"></i>Seguro de Cancelación</h4></div>
<div class="modal-body"><p><%=ob_rs2("seg_cancelacion") %></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<script>function seg_cancelacion(){$('#seg_cancelacion').modal('show');}</script>
<%end if
end if%>
<script src="<%=r%>web/lib/js/validador.js"></script><link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/dd.css" /><script src="<%=r%>web/lib/js/jquery.dd.min.js"></script><link href="<%=r%>web/lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"> <script src="<%=r%>web/lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script><script src="<%=r%>web/lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script><script language="javascript">$(document).ready(function(e) {$("body select").msDropDown();})</script>