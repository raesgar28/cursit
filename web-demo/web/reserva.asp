<!--#include file="comun/menu_sup.asp"-->
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%id_item=request("id_item")
if id_item<>"" and session("u_agente")="si" and session("id_usuario")<>"" then
Sql2= "SELECT id_agente FROM agentesCursos WHERE id_agente= "&session("id_usuario")&" AND id_item="&id_item&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
session("ag_autorizado")="si"
else
session("ag_autorizado")="no"
ob_rs2.close
end if
end if
id_curso=request("curso")
alojamiento=request("alojamiento")
alojamiento_d=request("alojamiento")
if alojamiento<>""then
alojamiento = Split(alojamiento, "|")
id_alo_opcion= alojamiento(0)
id_alojamiento = alojamiento(1)
end if
s_fecha=request("salida_fecha")
s_mes=request("salida_mes")
id_quincena=request("salida_quincena")
aero_ob=request("aero_ob")
aeropuerto=request("aeropuerto")
aeropuerto_in=request("aeropuerto")
if aeropuerto<>"" then
aeropuerto = Split(aeropuerto, "|")
id_aeropuerto= aeropuerto(0)
aeropuerto_mes = aeropuerto(1)
id_itemSubAero=aeropuerto(2)
end if
if aeropuerto_mes<>"" and IsNumeric(aeropuerto_mes) and IsNumeric(id_itemSubAero) Then
Sql= "SELECT titulo_esp, id_quincena FROM quincenas WHERE id_quincena="&aeropuerto_mes&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
aeropuerto_mes=ob_rs("titulo_esp")
id_quincena=ob_rs("id_quincena")
end if
ob_rs.close
end if
semanas=request("semanas")
transfer=request("transfer")
pr_medico=request("pr_medico")
pr_cancelacion=request("pr_cancelacion")
tasas_aerop=request("tasas_aerop")
pr_examen=request("pr_examen")
pr_gestion_bill=request("pr_gestion_bill")
Dim opp(40),opc(40)
for i=1 to 40
opp(i)=request("opp["&i&"]") 
opc(i)=request("opc["&i&"]")
privado=request("privado")
codPrivado=trim(request("codPrivado"))
next%>
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%if session("id_usuario")<>"" then%>
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-sbold"><%=titulo_esp_web%></h3><h4 class=""><%=titulo_esp_div%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li>
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li><li class="c-state_active">Escritorio</li></ul></div></div>
<%else%>
<div class="c-layout-breadcrumbs-1 c-bgimage-full c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza" style="background-image: url(<%=ruta_banner%>)"><div class="c-breadcrumbs-wrapper"><div class="container"><div class="c-page-title c-pull-left"><h1 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim "><%=titulo_esp_div%> | reserva | <%=titulo_esp%></h1><h2 class="c-font-white c-font-thin c-opacity-07"><%=alt_banner%></h2></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white" title="<%=titulo_esp_web%>"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white"><%=titulo_esp%></li></ul></div></div></div>
<%end if%>
<div class="c-content-box c-size-md c-bg-white">
<div class="container">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content">
<div class="c-content-title-1">
<h3 class="">Proceso de reserva</h3>
<div class="c-line-left"></div>
</div>
<%if id_item<>""then%>
<div id="arriba">
<div class="wizard"  style="">
<div class="wizard-inner">
<div class="connecting-line"></div>
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Revisa los datos de tu curso">
<span class="round-tab"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span></a></li>
<li role="presentation" class="disabled"><a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Introduce tus datos">
<span class="round-tab"><i class="fa fa-user" aria-hidden="true"></i></span></a></li>
<li role="presentation" class="disabled"><a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Selecciona método de pago">
<span class="round-tab"><i class="fa fa-money" aria-hidden="true"></i></span></a></li>
<li role="presentation" class="disabled"><a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Confirmar reserva">
<span class="round-tab"><i class="fa fa-check" aria-hidden="true"></i></span></a></li>
</ul>
</div>
<form action="reserva-check"  name="f_reserva" id="f_reserva" method="post"><input name="id_item" type="hidden" value="<%=id_item%>"><input name="id_curso" type="hidden" value="<%=id_curso%>"><input name="alojamiento" type="hidden" value="<%=alojamiento_d%>"><input name="s_fecha" type="hidden" value="<%=s_fecha%>"><input name="s_mes" type="hidden" value="<%=s_mes%>"><input name="id_quincena" type="hidden" value="<%=id_quincena%>"><input name="aero_ob" type="hidden" value="<%=aero_ob%>"><input name="aeropuerto" type="hidden" value="<%=aeropuerto_in%>"><input name="semanas" type="hidden" value="<%=semanas%>"><input name="transfer" type="hidden" value="<%=transfer%>"><input name="pr_medico" type="hidden" value="<%=pr_medico%>"><input name="pr_cancelacion" type="hidden" value="<%=pr_cancelacion%>"><input name="tasas_aerop" type="hidden" value="<%=tasas_aerop%>"><input name="pr_examen" type="hidden" value="<%=pr_examen%>"><input name="pr_gestion_bill" type="hidden" value="<%=pr_gestion_bill%>">
<%for i=1 to 40
opp(i)=request("opp["&i&"]") 
opc(i)=request("opc["&i&"]")
if opp(i)<>""then%><input name="opp[<%=i%>]" type="hidden" value="<%=opp(i)%>"><%end if%>

<%if opc(i)<>""then%><input name="opc[<%=i%>]" type="hidden" value="<%=opc(i)%>"><%end if
next%>
<div class="tab-content reserva_check">
<div class="tab-pane active" role="tabpanel" id="step1">
<div class="paso1">
<h4><i class="fa fa-graduation-cap" aria-hidden="true"></i> Confirma los datos del curso <i class="fa fa-arrow-down" aria-hidden="true" style="float:right;"></i></h4>
<div class="col-md-6">
<%Sql= "SELECT titulo_esp, pr_reserva, datos_familia_ob, codPrivado, gestion_aeropuertos, pre_medida,format_sem FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
pr_reserva=ob_rs("pr_reserva")
datos_familia_ob=ob_rs("datos_familia_ob")
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
pre_medida=ob_rs("pre_medida")
format_sem=ob_rs("format_sem")
if privado="si" then
if codPrivado<>ob_rs("codPrivado") then
prev=Request.ServerVariables ( "HTTP_REFERER" )
prev=replace(prev,"/cod-ko","")
response.redirect(prev&"/cod-ko")
end if
end if%>
<span class="pres_concepto"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close

if id_curso<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin, con_examen, pr_reserva, salidas,txt_aviso FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_inicio")
f_fin=ob_rs("f_fin")
salidas=ob_rs("salidas")
con_examen=ob_rs("con_examen")
txt_aviso=ob_rs("txt_aviso")
if ob_rs("pr_reserva")<>0 and ob_rs("pr_reserva")<>"0,00" then pr_reserva=ob_rs("pr_reserva")end if%>
<span class="pres_concepto"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close
end if

if id_itemSubAero<>""then
Sql= "SELECT f_salida, f_fin FROM itemsSubAero WHERE id_itemSubAero="&id_itemSubAero&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_salida")
f_fin=ob_rs("f_fin")
end if
ob_rs.close
end if

if semanas<>""then
if semanas<>"" and id_curso <>"" then
Sql= "SELECT precio FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas="&semanas&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
precio_cur=ob_rs("precio")*fluctuacion_c
if s_fecha<>""and s_fecha<>"01/01/1000"then f_inicio=s_fecha end if
fecha_inicio_f=month(f_inicio)&"/"&day(f_inicio)&"/"&year(f_inicio)
dias=semanas*7
f_fin=cdate(f_inicio)+dias 
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql2= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE id_itemSub="&id_curso&" AND rel.id_suplemento<>0  AND rel.id_suplemento=preciosSUplementos.id_suplemento AND rel.id_alojamiento=0 AND((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if cdate(f_inicio)>=ob_rs2("fecha_inicio") and cdate(f_fin)<=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(f_fin) ) end if
if cdate(f_inicio)>=ob_rs2("fecha_inicio") and cdate(f_fin)>=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(ob_rs2("fecha_fin")) ) end if
if cdate(f_inicio)<=ob_rs2("fecha_inicio") and cdate(f_fin)<=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs2("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(f_inicio)<=ob_rs2("fecha_inicio") and cdate(f_fin)>=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs2("fecha_inicio")) ,cdate(ob_rs2("fecha_fin")) )end if
precio_sup_dia=ob_rs2("precio")/7
precio_sup=(total_dias*precio_sup_dia)*fluctuacion_c
precio_cur_a=precio_cur
precio_cur=precio_cur+precio_sup
end if
ob_rs2.close
else 'SE HA ELEGID SEM EXTRA

Sql2= "SELECT precio, semanas FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas<>53 ORDER BY semanas DESC "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
precio_sem=ob_rs2("precio")
ultima_sem=ob_rs2("semanas")
end if
ob_rs2.close

Sql2= "SELECT semanas, precio FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas=53 "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
precio_ext=ob_rs2("precio")
sem_extra=semanas-ultima_sem
precio_ext=precio_ext*sem_extra
precio_cur=(precio_ext+precio_sem)*fluctuacion_c
fecha_inicio_f=month(s_fecha)&"/"&day(s_fecha)&"/"&year(s_fecha)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql3= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE id_itemSub="&id_curso&" AND rel.id_suplemento<>0  AND rel.id_suplemento=preciosSUplementos.id_suplemento AND rel.id_alojamiento=0 AND((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(f_fin) ) end if
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(ob_rs2("fecha_fin")) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(ob_rs3("fecha_fin")) )end if
precio_sup_dia=ob_rs3("precio")/7
precio_sup=(total_dias*precio_sup_dia)*fluctuacion_c
precio_cur_a=precio_cur
precio_cur=precio_cur+precio_sup
end if
ob_rs3.close
end if
ob_rs2.close
end if
ob_rs.close
end if%>
<span class="pres_concepto"><i class="fa fa-calendar" aria-hidden="true" style="margin-right:5px"></i> 
<%if semanas=12 then%>Trimestre escolar.<%end if%>
<%if semanas=16 then%>Cuatrimestre escolar.<%end if%>
<%if semanas=24 then%>Semestre escolar.<%end if%>
<%if semanas=52 then%>Año escolar.<%end if%>
<%if semanas<>12 and semanas<>24 and semanas<>52then%>
<%=semanas%> semana<%if semanas>1then%>s<%end if%>
<%end if%>
<span class="preciete"><%if precio_cur_a<>0 then%><%=FormatNumber(ccur(precio_cur_a),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i><%end if%></span></span>
<%end if
if id_quincena<>""then
Sql= "SELECT titulo_esp FROM quincenas WHERE id_quincena="&id_quincena&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<span class="pres_concepto"><i class="fa fa-calendar-check-o" aria-hidden="true" style="margin-right:5px"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close
end if
if aeropuerto_mes<>"" and not IsNumeric(aeropuerto_mes) and id_quincena="" then%>
<span class="pres_concepto"><i class="fa fa-calendar-check-o" aria-hidden="true" style="margin-right:5px"></i> <%=aeropuerto_mes%></span>
<%end if
if id_quincena<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin FROM quincenas WHERE id_quincena="&id_quincena&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if f_inicio="" or f_inicio="01/01/1000" then  f_inicio=ob_rs("f_inicio") end if
'f_fin=ob_rs("f_fin")%>
<%end if
ob_rs.close
end if
Sql= "SELECT id_rel FROM rel WHERE id_itemSub ="&id_curso&" and id_itemSubAero<>0 "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
gestion_grupos="si"
end if
ob_rs.close

if gestion_aeropuertos="si" or gestion_grupos="si" then
if f_inicio<>"" and f_inicio<> "01/01/1000"then%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_inicio%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
<%if semanas<>"" then
dias=semanas*7
if f_fin<>"01/01/1000" OR f_fin<>"" then f_fin=f_fin ELSE f_fin=cdate(f_inicio)+dias end if' ESTO ES NUEVO MOVIDA AVILA
'f_fin=cdate(f_inicio)+dias
end if%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
<%end if
else
if s_fecha<>""then
if s_fecha<>"" and s_fecha<> "01/01/1000"then%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=s_fecha%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
<%end if
if semanas<>""  and format_sem<>"si"then
dias=semanas*7
f_fin=cdate(s_fecha)+dias-1'(-1 ES NUEVA MOVIDA)%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
<%end if
end if
end if

if id_quincena<>"" and gestion_aeropuertos<>"si" and gestion_grupos<>"si" then
if f_inicio<>"" and f_inicio<> "01/01/1000"then%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_inicio%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
<%if semanas<>"" then
dias=semanas*7
f_fin=cdate(f_inicio)+dias
end if%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
<%end if
else
'if s_fecha<>""then
'if s_fecha<>"" and s_fecha<> "01/01/1000"then%>
<!--<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%'=s_fecha%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
--><%'end if
'if semanas<>"" then
'dias=semanas*7
'f_fin=cdate(s_fecha)+dias%>
<!--<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%'=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
--><%'end if
'end if
end if%>
<%if txt_aviso<>""then%><span class="pres_concepto" style="font"><i class="fa fa-info-circle" aria-hidden="true" style="margin-right:5px"></i> <%=txt_aviso%></span><%end if%>
<%if semanas<>"" and id_curso <>"" then%>
<%if precio_sup<>0 then%><span class="pres_concepto"><i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-right:5px"></i>Suplemento temporada<span class="preciete"><%if precio_sup<>0 then%><%=FormatNumber(ccur(precio_sup),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i><%end if%></span></span></span><%end if%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;color:#ccc"></i> <%if precio_cur<>0 then%><%=FormatNumber(ccur(precio_cur),2)%>&nbsp;<%=mon%><%end if%></span>
<%end if
if id_alojamiento<>""then
Sql= "SELECT titulo_esp, tasas FROM alo_conceptos WHERE id_alojamiento="&id_alojamiento&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tasas_concepto=ob_rs("tasas")
alo_concepto=ob_rs("titulo_esp")%>
<span class="pres_concepto"><i class="fa fa-home" aria-hidden="true" style="margin-right:7px"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close
Sql= "SELECT op_alo, precio, tasas FROM alo_opciones WHERE id_alo_opcion="&id_alo_opcion&" and op_alo<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
precio_alo=ob_rs("precio")
tasas_opciones=ob_rs("tasas")
if semanas<>""then semanas=semanas else semanas=1 end if
precio_alo=precio_alo*semanas*fluctuacion_a
Sql2= "SELECT titulo_esp FROM alo_op WHERE id_alo_op="&ob_rs("op_alo")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
alo_opcion=ob_rs2("titulo_esp")%>
<span class="pres_concepto"><i class="fa fa-bed" aria-hidden="true" style="margin-right:5px"></i> <%=ob_rs2("titulo_esp")%> <span class="preciete"><%if precio_alo<>0 then%><%=FormatNumber(ccur(precio_alo),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i><%end if%></span></span>
<%if s_fecha<>""and s_fecha<>"01/01/1000"then f_inicio=s_fecha end if
fecha_inicio_f=month(f_inicio)&"/"&day(f_inicio)&"/"&year(f_inicio)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql3= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE rel.id_suplemento<>0  AND rel.id_suplemento=preciosSuplementos.id_suplemento AND rel.id_alojamiento<>0 AND rel.id_alojamiento="&id_alojamiento&" AND ((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if cdate(f_inicio)>=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(f_fin) ) end if
if cdate(f_inicio)>=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(ob_rs3("fecha_fin")) ) end if
if cdate(f_inicio)<=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(f_inicio)<=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(ob_rs3("fecha_fin")) )end if
precio_sup_dia=ob_rs3("precio")/7
total_dias=total_dias+1'MOVIDA ELENA SUMAR UN DIA AL SUPLEMENTO
precio_sup_alo=(total_dias*precio_sup_dia)*fluctuacion_a
precio_alo=precio_alo+precio_sup_alo%>
<span class="pres_concepto"><i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-right:5px"></i> Suplemento Temporada<span class="preciete"><%if precio_sup_alo<>0 then%><%=FormatNumber(ccur(precio_sup_alo),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i><%end if%></span></span>
<%end if
ob_rs3.close
if tasas_concepto<>0then
tasas_concepto=tasas_concepto*fluctuacion_a
precio_alo=precio_alo+tasas_concepto%>
<span class="pres_concepto"><i class="fa fa-tags" aria-hidden="true" style="margin-right:5px"></i> <%if tasas_concepto<>0 then%><span class="pre_concepto_p">Tasas <%=alo_concepto%><span class="preciete"><%if tasas_concepto<>0 then%><%=FormatNumber(ccur(tasas_concepto),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i><%end if%></span></span><%end if%></span>
<%end if
if tasas_opciones<>0then
tasas_opciones=tasas_opciones*fluctuacion_a
precio_alo=precio_alo+tasas_opciones%>
<span class="pres_concepto"><i class="fa fa-tags" aria-hidden="true" style="margin-right:5px"></i> <%if tasas_opciones<>0 then%><span class="pre_concepto_p">Tasas <%=alo_opcion%></span><%end if%><span class="preciete"><%if tasas_opciones<>0 then%><%=FormatNumber(ccur(tasas_opciones),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i><%end if%></span></span>
<%end if%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;color:#ccc"></i> <%if precio_alo<>0 then%><%=FormatNumber(ccur(precio_alo),2)%>&nbsp;<%=mon%><%end if%></span>
<%end if
ob_rs2.close
end if
ob_rs.close
end if%>
</div>
<div class="col-md-6">
<%if id_aeropuerto<>""then
Sql= "SELECT ciudad FROM aeropuertos WHERE id_aeropuerto="&id_aeropuerto&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<span class="pres_concepto"><i class="fa fa-plane" aria-hidden="true" style="margin-right:10px"></i> <%=ob_rs("ciudad")%> <%if aeropuerto_mes<>""then%><i class="fa fa-share" aria-hidden="true" style="margin-left:9px;"></i><%=aeropuerto_mes%><%end if%></span>
<%end if
ob_rs.close
end if
opciones_cursos=0
if transfer<>""then
Sql= "SELECT opcion_esp, opcion_pre FROM itemsSubOp WHERE id_itemSubOp="&transfer&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_cursos=opciones_cursos+ob_rs("opcion_pre")%>
<span class="pres_concepto"><i class="fa fa-bus" aria-hidden="true" style="margin-right:10px"></i> <%=ob_rs("opcion_esp")%> <%if ob_rs("opcion_pre")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("opcion_pre")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
ob_rs.close
end if
if id_curso<>""then
Sql= "SELECT pr_medico, pr_cancelacion, tasas_aerop, pr_examen, pr_gestion_bill,pr_medico_ob, pr_cancelacion_ob, tasas_aerop_ob, pr_examen_ob, pr_gestion_bill_ob FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if pr_medico="si"then
pr_medico_pr=ob_rs("pr_medico")*semanas%>
<span class="pres_concepto"><i class="fa fa-user-md" aria-hidden="true" style="margin-right:10px"></i> Seguro médico <%if ob_rs("pr_medico")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("pr_medico"))*semanas,2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span> 
<%end if
if pr_cancelacion="si"then
pr_cancelacion_pr=ob_rs("pr_cancelacion")%>
<span class="pres_concepto"><i class="fa fa-ban" aria-hidden="true" style="margin-right:10px"></i> Seguro cancelación  <%if ob_rs("pr_cancelacion")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("pr_cancelacion")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
if tasas_aerop="si"then
tasas_aerop_pr=ob_rs("tasas_aerop")%>
<span class="pres_concepto"><i class="fa fa-paper-plane" aria-hidden="true" style="margin-right:5px"></i> Tasas aeropuerto <%if ob_rs("tasas_aerop")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("tasas_aerop")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
if pr_examen="si"then
pr_examen_pr=ob_rs("pr_examen")%>
<span class="pres_concepto"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right:7px"></i> <%if con_examen<>""then%><%=con_examen%><%else%>Examen<%end if%> <%if ob_rs("pr_examen")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("pr_examen")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
if pr_gestion_bill="si"then
pr_gestion_bill_pr=ob_rs("pr_gestion_bill")%>
<span class="pres_concepto"><i class="fa fa-ticket" aria-hidden="true" style="margin-right:7px"></i> Gestión billete avión <%if ob_rs("pr_gestion_bill")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("pr_gestion_bill")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
end if
ob_rs.close
end if
opciones_programa=0
for i=1 to 40							      		        
if opp(i)<>""  then
Sql= "SELECT opcion_esp,opcion_pre FROM itemsOp WHERE id_itemOp="&opp(i)&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_programa=opciones_programa+ob_rs("opcion_pre")%>
<span class="pres_concepto"><i class="fa fa-check-square-o" aria-hidden="true" style="margin-right:7px"></i> <%=ob_rs("opcion_esp")%> <%if ob_rs("opcion_pre")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("opcion_pre")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
ob_rs.close
end if
next
for i=1 to 40							      		        
if opc(i)<>""  then
Sql= "SELECT opcion_esp, opcion_pre FROM itemsSubOp WHERE id_itemSubOp="&opc(i)&" and  (transfer IS NULL or transfer='')"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_cursos=opciones_cursos+ob_rs("opcion_pre")%>
<span class="pres_concepto"><i class="fa fa-check-square-o" aria-hidden="true" style="margin-right:7px"></i> <%=ob_rs("opcion_esp")%> <%if ob_rs("opcion_pre")<>0 then%><span style="float:right;"><%=FormatNumber(ccur(ob_rs("opcion_pre")),2)%>&nbsp;<%=mon%><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i></span><%end if%></span>
<%end if
ob_rs.close
end if
next
total_opciones=pr_medico_pr+pr_cancelacion_pr+tasas_aerop_pr+pr_examen_pr+pr_gestion_bill_pr+opciones_programa+opciones_cursos
if total_opciones<>0 and total_opciones<>""then%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;color:#ccc"></i> <%if total_opciones<>0 then%><%=FormatNumber(ccur(total_opciones),2)%>&nbsp;<%=mon%><%end if%></span>
<%end if
suma_total=total_opciones+precio_cur+precio_alo%>
</div>
<div class="clearfix"></div>
<%if suma_total<>0then%><div class="suma_total_total" style=""><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;"></i><%if pre_medida="si"then%> <span class="" style="font-size:0.8em;color:#999">desde*&nbsp;&nbsp;</span><%else%> Total: <%end if%><%=FormatNumber(ccur(suma_total),2)%>&nbsp;<%=mon%></div><%end if%>
</div>
<ul class="list-inline pull-right"><li>
<button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  next-step" id="nxt_step_1"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Siguiente Paso <i class="fa fa-user" aria-hidden="true" style="margin-left:8px"></i>
</button>
</li></ul>
</div>
<div class="tab-pane active ocult" role="tabpanel" id="step2">
<h4><i class="fa fa-user" aria-hidden="true"></i> Datos de usuario <i class="fa fa-arrow-down" aria-hidden="true" style="float:right;"></i></h4>
<div class="col-md-12 acceso" id="usuario_reg" >
<div class="col-md-6">
<div class="acceso_in">
<div class="acceso_in_in nuevo_user"><a href="javascript:sh_usuario_new();" class="a_nuevo_user"><h5><i class="fa fa-user-plus" aria-hidden="true"></i> Soy nuevo usuario </h5></a></div>
</div>
</div>
<div class="col-md-6">
<div class="acceso_in">
<div class="acceso_in_in">
<div class="form-group"><i class="fa fa-user"></i><input type="text" placeholder="Usuario*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Usuario*'" class="form-control c-square c-theme input-lg inp" name="usuario" id="usuario"></div>
<div class="form-group">
<i class="fa fa-key" aria-hidden="true"></i>
<input type="password" placeholder="Contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Contraseña*'" class="form-control c-square c-theme input-lg inp" name="pass" id="pass"></div>
<span class="btn_acceso"><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold" onCLick="javascript:logueo();">Acceder<i class="fa fa-sign-in" aria-hidden="true" style="margin-left:8px"></i></button></span>
<span class="btn_recuperar"><a href="<%=r%>recuperar-pass" class="a_recuperar"><i class="fa fa-question-circle" aria-hidden="true"></i>  contraseña</a></span>
<span class="error_acceso_span" id="fallo_pass"></span>
</div>
</div>
</div>
</div>
<!--DENTRO TABLA ALUMNOS-->
<div class="col-md-12">
<button onClick="javascript:a_inscribir_nuevo();" class="inscribir_nuevo btn btn-warning c-btn-uppercase c-btn-bold" id="bot_inscribir_new" type="button"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Inscribir a un nuevo alumno<i class="fa fa-plus" aria-hidden="true"></i></button>
<div class="alert alert-danger  display-hide" id="no_autorizado"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Este agente no está autorizado a inscribir en este programa.</div>
</div>
<div class="col-md-12" id="reg_dentro"></div>
<!--FIN DENTRO TABLA ALUMNOS-->
<!--NUEVO USUARIO-->
<div id="usuario_new" class="col-md-12">
<a href="javascript:sh_usuario_reg();" id="a_usuario_reg"><h5 style="text-align:right"><i class="fa fa-user" aria-hidden="true"></i> Soy usuario registrado <i class="fa fa-arrow-up" aria-hidden="true" style="float:right;margin-left:15px"></i></h5></a>
<div class="col-md-12"></div>
<div class="col-md-12" id="usuario_new_ko">
<div class="col-md-12 alert alert-danger alert-dismissible" role="alert"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Este usuario parece estar ya registrado. Revisa el mail, el nombre y los apellidos, o intenta recuperar tu contraseña.
</div>
</div>
<div class="col-md-12" id="datos_usuario">
<div class="col-md-12">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-user-plus" aria-hidden="true" style="margin-right:10px"></i>Datos de Usuario</h3>
</div>
<div class="panel-body">Introduce la información correspondiente a los datos del usuario. Por ejemplo, padre o madre de un alumno o, en caso de adultos, los datos del propio alumno. </div>
</div></div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Nombre*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre*'" class="form-control c-square c-theme input-lg inp" name="u_nombre" id="u_nombre"></div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Apellidos*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos*'" class="form-control c-square c-theme input-lg inp" name="u_apellidos" id="u_apellidos"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="email*" onclick="this.placeholder = ''" onblur="this.placeholder = 'email*'" class="form-control c-square c-theme input-lg inp"  name="u_email" id="u_email"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="repetir email*" onclick="this.placeholder = ''" onblur="this.placeholder = 'repetir email*'" class="form-control c-square c-theme input-lg inp" name="u_email_r" id="u_email_r"></div>
<div class="form-group"><i class="fa fa-key" aria-hidden="true"></i><input type="password" placeholder="contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'contraseña*'" class="form-control c-square c-theme input-lg inp" name="u_pass" id="u_pass" ></div>
<div class="form-group"><i class="fa fa-key" aria-hidden="true"></i><input type="password" placeholder="repetir contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'repetir contraseña*'" class="form-control c-square c-theme input-lg inp" name="u_pass_r" id="u_pass_r"></div>
<div class="form-group"><i class="fa fa-id-card" aria-hidden="true"></i><input type="u_nif" placeholder="NIF*" onclick="this.placeholder = ''" onblur="this.placeholder = 'NIF*'" class="form-control c-square c-theme input-lg inp" name="u_nif" id="u_nif"></div>
<div class="c-checkbox-list agente inp_n" data-toggle="tooltip" data-placement="top" title="Solo agentes Cursit Idiomas" style="display:none">
<div class="c-checkbox" style="margin:0;margin-top:5px" >
<input type="checkbox" class="c-check" name="u_agente" id="u_agente" autocomplete="off">
<label for="u_agente" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span> Soy agente de Cursit Idiomas</label>
</div>
</div>
</div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono*'" class="form-control c-square c-theme input-lg inp" name="u_telefono" id="u_telefono"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Móvil*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Móvil*'" class="form-control c-square c-theme input-lg inp" name="u_movil" id="u_movil"></div>
<div class="form-group"><i class="fa fa-street-view" aria-hidden="true"></i><input type="text" placeholder="Dirección*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Dirección*'" class="form-control c-square c-theme input-lg inp" name="u_direccion" id="u_direccion"></div>
<div class="form-group"><i class="fa fa-map-marker" aria-hidden="true"></i><input type="text" placeholder="Ciudad / Localidad*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Ciudad / Localidad*'" class="form-control c-square c-theme input-lg inp" name="u_ciudad" id="u_ciudad"></div>
<div class="form-group"><i class="fa fa-envelope-open-o" aria-hidden="true"></i><input type="text" placeholder="Código Postal" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código Postal'" class="form-control c-square c-theme input-lg inp" name="u_c_postal" id="u_c_postal"></div>
<div class="col-md-5 form-group" style="margin:0px;padding:0;margin-bottom:11px;" id="prov" ><i class="fa fa-map-pin" aria-hidden="true"></i>
<select name="u_provincia" id="u_provincia" style="margin-right:16px;width:100%;" class="select-provincia inp">
<option value="" selected="selected">Selecciona Provncia*</option>
<option value="ALAVA">ALAVA</option>
<option value="ALBACETE">ALBACETE</option>
<option value="ALICANTE">ALICANTE</option>
<option value="ALMERIA">ALMERIA</option>
<option value="ASTURIAS">ASTURIAS</option>
<option value="AVILA">AVILA</option>
<option value="BADAJOZ">BADAJOZ</option>
<option value="BARCELONA">BARCELONA</option>
<option value="BURGOS">BURGOS</option>
<option value="CACERES">CACERES</option>
<option value="CADIZ">CADIZ</option>
<option value="CANTABRIA">CANTABRIA</option>
<option value="CASTELLON">CASTELLON</option>
<option value="CEUTA">CEUTA</option>
<option value="CIUDAD REAL">CIUDAD REAL</option>
<option value="CORDOBA">CORDOBA</option>
<option value="CORU&Ntilde;A, A">CORU&Ntilde;A, A</option>
<option value="CUENCA">CUENCA</option>
<option value="GIRONA">GIRONA</option>
<option value="GRANADA">GRANADA</option>
<option value="GUADALAJARA">GUADALAJARA</option>
<option value="GUIPUZCOA">GUIPUZCOA</option>
<option value="HUELVA">HUELVA</option>
<option value="HUESCA">HUESCA</option>
<option value="ILLES BALEARS">ILLES BALEARS</option>
<option value="JAEN">JAEN</option>
<option value="LEON">LEON</option>
<option value="LLEIDA">LLEIDA</option>
<option value="LUGO">LUGO</option>
<option value="MADRID">MADRID</option>
<option value="MALAGA">MALAGA</option>
<option value="MELILLA">MELILLA</option>
<option value="MURCIA">MURCIA</option>
<option value="NAVARRA">NAVARRA</option>
<option value="OURENSE">OURENSE</option>
<option value="PALENCIA">PALENCIA</option>
<option value="PALMAS, LAS">PALMAS, LAS</option>
<option value="PONTEVEDRA">PONTEVEDRA</option>
<option value="RIOJA, LA">RIOJA, LA</option>
<option value="SALAMANCA">SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE">SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA">SEGOVIA</option>
<option value="SEVILLA">SEVILLA</option>
<option value="SORIA">SORIA</option>
<option value="TARRAGONA">TARRAGONA</option>
<option value="TERUEL">TERUEL</option>
<option value="TOLEDO">TOLEDO</option>
<option value="VALENCIA">VALENCIA</option>
<option value="VALLADOLID">VALLADOLID</option>
<option value="VIZCAYA">VIZCAYA</option>
<option value="ZAMORA">ZAMORA</option>
<option value="ZARAGOZA">ZARAGOZA</option>
<option value="OTRAS">OTRAS</option>
</select>
</div>
<div class="col-md-7 form-group select-pais" style="margin:0px;padding:0px;padding-left:25px;margin-bottom:11px;" id="pais_sel">
<select name="u_pais" id="u_pais" class="selects" style="width:100%;">
<option value='ad' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ad" data-title="Andorra">Andorra</option>
  <option value='ae' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ae" data-title="United Arab Emirates">United Arab Emirates</option>
  <option value='af' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag af" data-title="Afghanistan">Afghanistan</option>
  <option value='ag' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ag" data-title="Antigua and Barbuda">Antigua and Barbuda</option>
  <option value='ai' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ai" data-title="Anguilla">Anguilla</option>
  <option value='al' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag al" data-title="Albania">Albania</option>
  <option value='am' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag am" data-title="Armenia">Armenia</option>
  <option value='an' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag an" data-title="Netherlands Antilles">Netherlands Antilles</option>
  <option value='ao' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ao" data-title="Angola">Angola</option>
  <option value='aq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aq" data-title="Antarctica">Antarctica</option>
  <option value='ar' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ar" data-title="Argentina">Argentina</option>
  <option value='as' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag as" data-title="American Samoa">American Samoa</option>
  <option value='at' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag at" data-title="Austria">Austria</option>
  <option value='au' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag au" data-title="Australia">Australia</option>
  <option value='aw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aw" data-title="Aruba">Aruba</option>
  <option value='ax' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ax" data-title="Aland Islands">Aland Islands</option>
  <option value='az' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag az" data-title="Azerbaijan">Azerbaijan</option>
  <option value='ba' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ba" data-title="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
  <option value='bb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bb" data-title="Barbados">Barbados</option>
  <option value='bd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bd" data-title="Bangladesh">Bangladesh</option>
  <option value='be' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag be" data-title="Belgium">Belgium</option>
  <option value='bf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bf" data-title="Burkina Faso">Burkina Faso</option>
  <option value='bg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bg" data-title="Bulgaria">Bulgaria</option>
  <option value='bh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bh" data-title="Bahrain">Bahrain</option>
  <option value='bi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bi" data-title="Burundi">Burundi</option>
  <option value='bj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bj" data-title="Benin">Benin</option>
  <option value='bm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bm" data-title="Bermuda">Bermuda</option>
  <option value='bn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bn" data-title="Brunei Darussalam">Brunei Darussalam</option>
  <option value='bo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bo" data-title="Bolivia">Bolivia</option>
  <option value='br' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag br" data-title="Brazil">Brazil</option>
  <option value='bs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bs" data-title="Bahamas">Bahamas</option>
  <option value='bt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bt" data-title="Bhutan">Bhutan</option>
  <option value='bv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bv" data-title="Bouvet Island">Bouvet Island</option>
  <option value='bw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bw" data-title="Botswana">Botswana</option>
  <option value='by' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag by" data-title="Belarus">Belarus</option>
  <option value='bz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bz" data-title="Belize">Belize</option>
  <option value='ca' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ca" data-title="Canada">Canada</option>
  <option value='cc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cc" data-title="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
  <option value='cd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cd" data-title="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
  <option value='cf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cf" data-title="Central African Republic">Central African Republic</option>
  <option value='cg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cg" data-title="Congo">Congo</option>
  <option value='ch' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ch" data-title="Switzerland">Switzerland</option>
  <option value='ci' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ci" data-title="Cote D'Ivoire (Ivory Coast)">Cote D'Ivoire (Ivory Coast)</option>
  <option value='ck' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ck" data-title="Cook Islands">Cook Islands</option>
  <option value='cl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cl" data-title="Chile">Chile</option>
  <option value='cm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cm" data-title="Cameroon">Cameroon</option>
  <option value='cn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cn" data-title="China">China</option>
  <option value='co' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag co" data-title="Colombia">Colombia</option>
  <option value='cr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cr" data-title="Costa Rica">Costa Rica</option>
  <option value='cs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cs" data-title="Serbia and Montenegro">Serbia and Montenegro</option>
  <option value='cu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cu" data-title="Cuba">Cuba</option>
  <option value='cv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cv" data-title="Cape Verde">Cape Verde</option>
  <option value='cx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cx" data-title="Christmas Island">Christmas Island</option>
  <option value='cy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cy" data-title="Cyprus">Cyprus</option>
  <option value='cz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cz" data-title="Czech Republic">Czech Republic</option>
  <option value='de' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag de" data-title="Germany">Germany</option>
  <option value='dj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dj" data-title="Djibouti">Djibouti</option>
  <option value='dk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dk" data-title="Denmark">Denmark</option>
  <option value='dm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dm" data-title="Dominica">Dominica</option>
  <option value='do' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag do" data-title="Dominican Republic">Dominican Republic</option>
  <option value='dz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dz" data-title="Algeria">Algeria</option>
  <option value='ec' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ec" data-title="Ecuador">Ecuador</option>
  <option value='ee' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ee" data-title="Estonia">Estonia</option>
  <option value='eg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eg" data-title="Egypt">Egypt</option>
  <option value='eh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eh" data-title="Western Sahara">Western Sahara</option>
  <option value='er' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag er" data-title="Eritrea">Eritrea</option>
  <option value='es' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag es" data-title="Spain" selected="selected">España / Spain</option>
  <option value='et' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag et" data-title="Ethiopia">Ethiopia</option>
  <option value='fi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fi" data-title="Finland">Finland</option>
  <option value='fj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fj" data-title="Fiji">Fiji</option>
  <option value='fk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fk" data-title="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
  <option value='fm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fm" data-title="Federated States of Micronesia">Federated States of Micronesia</option>
  <option value='fo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fo" data-title="Faroe Islands">Faroe Islands</option>
  <option value='fr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fr" data-title="France">France</option>
  <option value='fx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fx" data-title="France, Metropolitan">France, Metropolitan</option>
  <option value='ga' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ga" data-title="Gabon">Gabon</option>
  <option value='gd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gd" data-title="Grenada">Grenada</option>
  <option value='ge' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ge" data-title="Georgia">Georgia</option>
  <option value='gf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gf" data-title="French Guiana">French Guiana</option>
  <option value='gh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gh" data-title="Ghana">Ghana</option>
  <option value='gi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gi" data-title="Gibraltar">Gibraltar</option>
  <option value='gl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gl" data-title="Greenland">Greenland</option>
  <option value='gm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gm" data-title="Gambia">Gambia</option>
  <option value='gn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gn" data-title="Guinea">Guinea</option>
  <option value='gp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gp" data-title="Guadeloupe">Guadeloupe</option>
  <option value='gq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gq" data-title="Equatorial Guinea">Equatorial Guinea</option>
  <option value='gr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gr" data-title="Greece">Greece</option>
  <option value='gs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gs" data-title="S. Georgia and S. Sandwich Islands">S. Georgia and S. Sandwich Islands</option>
  <option value='gt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gt" data-title="Guatemala">Guatemala</option>
  <option value='gu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gu" data-title="Guam">Guam</option>
  <option value='gw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gw" data-title="Guinea-Bissau">Guinea-Bissau</option>
  <option value='gy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gy" data-title="Guyana">Guyana</option>
  <option value='hk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hk" data-title="Hong Kong">Hong Kong</option>
  <option value='hm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hm" data-title="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
  <option value='hn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hn" data-title="Honduras">Honduras</option>
  <option value='hr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hr" data-title="Croatia (Hrvatska)">Croatia (Hrvatska)</option>
  <option value='ht' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ht" data-title="Haiti">Haiti</option>
  <option value='hu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hu" data-title="Hungary">Hungary</option>
  <option value='id' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag id" data-title="Indonesia">Indonesia</option>
  <option value='ie' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ie" data-title="Ireland">Ireland</option>
  <option value='il' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag il" data-title="Israel">Israel</option>
  <option value='in' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag in" data-title="India" >India</option>
  <option value='io' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag io" data-title="British Indian Ocean Territory">British Indian Ocean Territory</option>
  <option value='iq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag iq" data-title="Iraq">Iraq</option>
  <option value='ir' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ir" data-title="Iran">Iran</option>
  <option value='is' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag is" data-title="Iceland">Iceland</option>
  <option value='it' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag it" data-title="Italy">Italy</option>
  <option value='jm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jm" data-title="Jamaica">Jamaica</option>
  <option value='jo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jo" data-title="Jordan">Jordan</option>
  <option value='jp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jp" data-title="Japan">Japan</option>
  <option value='ke' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ke" data-title="Kenya">Kenya</option>
  <option value='kg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kg" data-title="Kyrgyzstan">Kyrgyzstan</option>
  <option value='kh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kh" data-title="Cambodia">Cambodia</option>
  <option value='ki' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ki" data-title="Kiribati">Kiribati</option>
  <option value='km' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag km" data-title="Comoros">Comoros</option>
  <option value='kn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kn" data-title="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
  <option value='kp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kp" data-title="Korea (North)">Korea (North)</option>
  <option value='kr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kr" data-title="Korea (South)">Korea (South)</option>
  <option value='kw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kw" data-title="Kuwait">Kuwait</option>
  <option value='ky' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ky" data-title="Cayman Islands">Cayman Islands</option>
  <option value='kz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kz" data-title="Kazakhstan">Kazakhstan</option>
  <option value='la' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag la" data-title="Laos">Laos</option>
  <option value='lb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lb" data-title="Lebanon">Lebanon</option>
  <option value='lc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lc" data-title="Saint Lucia">Saint Lucia</option>
  <option value='li' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag li" data-title="Liechtenstein">Liechtenstein</option>
  <option value='lk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lk" data-title="Sri Lanka">Sri Lanka</option>
  <option value='lr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lr" data-title="Liberia">Liberia</option>
  <option value='ls' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ls" data-title="Lesotho">Lesotho</option>
  <option value='lt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lt" data-title="Lithuania">Lithuania</option>
  <option value='lu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lu" data-title="Luxembourg">Luxembourg</option>
  <option value='lv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lv" data-title="Latvia">Latvia</option>
  <option value='ly' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ly" data-title="Libya">Libya</option>
  <option value='ma' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ma" data-title="Morocco">Morocco</option>
  <option value='mc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mc" data-title="Monaco">Monaco</option>
  <option value='md' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag md" data-title="Moldova">Moldova</option>
  <option value='mg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mg" data-title="Madagascar">Madagascar</option>
  <option value='mh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mh" data-title="Marshall Islands">Marshall Islands</option>
  <option value='mk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mk" data-title="Macedonia">Macedonia</option>
  <option value='ml' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ml" data-title="Mali">Mali</option>
  <option value='mm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mm" data-title="Myanmar">Myanmar</option>
  <option value='mn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mn" data-title="Mongolia">Mongolia</option>
  <option value='mo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mo" data-title="Macao">Macao</option>
  <option value='mp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mp" data-title="Northern Mariana Islands">Northern Mariana Islands</option>
  <option value='mq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mq" data-title="Martinique">Martinique</option>
  <option value='mr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mr" data-title="Mauritania">Mauritania</option>
  <option value='ms' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ms" data-title="Montserrat">Montserrat</option>
  <option value='mt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mt" data-title="Malta">Malta</option>
  <option value='mu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mu" data-title="Mauritius">Mauritius</option>
  <option value='mv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mv" data-title="Maldives">Maldives</option>
  <option value='mw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mw" data-title="Malawi">Malawi</option>
  <option value='mx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mx" data-title="Mexico">Mexico</option>
  <option value='my' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag my" data-title="Malaysia">Malaysia</option>
  <option value='mz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mz" data-title="Mozambique">Mozambique</option>
  <option value='na' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag na" data-title="Namibia">Namibia</option>
  <option value='nc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nc" data-title="New Caledonia">New Caledonia</option>
  <option value='ne' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ne" data-title="Niger">Niger</option>
  <option value='nf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nf" data-title="Norfolk Island">Norfolk Island</option>
  <option value='ng' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ng" data-title="Nigeria">Nigeria</option>
  <option value='ni' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ni" data-title="Nicaragua">Nicaragua</option>
  <option value='nl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nl" data-title="Netherlands">Netherlands</option>
  <option value='no' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag no" data-title="Norway">Norway</option>
  <option value='np' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag np" data-title="Nepal">Nepal</option>
  <option value='nr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nr" data-title="Nauru">Nauru</option>
  <option value='nu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nu" data-title="Niue">Niue</option>
  <option value='nz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nz" data-title="New Zealand (Aotearoa)">New Zealand (Aotearoa)</option>
  <option value='om' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag om" data-title="Oman">Oman</option>
  <option value='pa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pa" data-title="Panama">Panama</option>
  <option value='pe' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pe" data-title="Peru">Peru</option>
  <option value='pf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pf" data-title="French Polynesia">French Polynesia</option>
  <option value='pg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pg" data-title="Papua New Guinea">Papua New Guinea</option>
  <option value='ph' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ph" data-title="Philippines">Philippines</option>
  <option value='pk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pk" data-title="Pakistan">Pakistan</option>
  <option value='pl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pl" data-title="Poland">Poland</option>
  <option value='pm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pm" data-title="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
  <option value='pn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pn" data-title="Pitcairn">Pitcairn</option>
  <option value='pr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pr" data-title="Puerto Rico">Puerto Rico</option>
  <option value='ps' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ps" data-title="Palestinian Territory">Palestinian Territory</option>
  <option value='pt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pt" data-title="Portugal">Portugal</option>
  <option value='pw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pw" data-title="Palau">Palau</option>
  <option value='py' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag py" data-title="Paraguay">Paraguay</option>
  <option value='qa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag qa" data-title="Qatar">Qatar</option>
  <option value='re' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag re" data-title="Reunion">Reunion</option>
  <option value='ro' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ro" data-title="Romania">Romania</option>
  <option value='ru' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ru" data-title="Russian Federation">Russian Federation</option>
  <option value='rw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag rw" data-title="Rwanda">Rwanda</option>
  <option value='sa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sa" data-title="Saudi Arabia">Saudi Arabia</option>
  <option value='sb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sb" data-title="Solomon Islands">Solomon Islands</option>
  <option value='sc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sc" data-title="Seychelles">Seychelles</option>
  <option value='sd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sd" data-title="Sudan">Sudan</option>
  <option value='se' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag se" data-title="Sweden">Sweden</option>
  <option value='sg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sg" data-title="Singapore">Singapore</option>
  <option value='sh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sh" data-title="Saint Helena">Saint Helena</option>
  <option value='si' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag si" data-title="Slovenia">Slovenia</option>
  <option value='sj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sj" data-title="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
  <option value='sk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sk" data-title="Slovakia">Slovakia</option>
  <option value='sl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sl" data-title="Sierra Leone">Sierra Leone</option>
  <option value='sm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sm" data-title="San Marino">San Marino</option>
  <option value='sn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sn" data-title="Senegal">Senegal</option>
  <option value='so' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag so" data-title="Somalia">Somalia</option>
  <option value='sr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sr" data-title="Suriname">Suriname</option>
  <option value='st' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag st" data-title="Sao Tome and Principe">Sao Tome and Principe</option>
  <option value='su' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag su" data-title="USSR (former)">USSR (former)</option>
  <option value='sv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sv" data-title="El Salvador">El Salvador</option>
  <option value='sy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sy" data-title="Syria">Syria</option>
  <option value='sz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sz" data-title="Swaziland">Swaziland</option>
  <option value='tc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tc" data-title="Turks and Caicos Islands">Turks and Caicos Islands</option>
  <option value='td' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag td" data-title="Chad">Chad</option>
  <option value='tf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tf" data-title="French Southern Territories">French Southern Territories</option>
  <option value='tg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tg" data-title="Togo">Togo</option>
  <option value='th' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag th" data-title="Thailand">Thailand</option>
  <option value='tj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tj" data-title="Tajikistan">Tajikistan</option>
  <option value='tk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tk" data-title="Tokelau">Tokelau</option>
  <option value='tl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tl" data-title="Timor-Leste">Timor-Leste</option>
  <option value='tm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tm" data-title="Turkmenistan">Turkmenistan</option>
  <option value='tn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tn" data-title="Tunisia">Tunisia</option>
  <option value='to' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag to" data-title="Tonga">Tonga</option>
  <option value='tp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tp" data-title="East Timor">East Timor</option>
  <option value='tr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tr" data-title="Turkey">Turkey</option>
  <option value='tt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tt" data-title="Trinidad and Tobago">Trinidad and Tobago</option>
  <option value='tv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tv" data-title="Tuvalu">Tuvalu</option>
  <option value='tw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tw" data-title="Taiwan">Taiwan</option>
  <option value='tz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tz" data-title="Tanzania">Tanzania</option>
  <option value='ua' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ua" data-title="Ukraine">Ukraine</option>
  <option value='ug' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ug" data-title="Uganda">Uganda</option>
    <option value='uk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gb" data-title="Great Britain (UK)">United Kingdom</option>
  <option value='um' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag um" data-title="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
  <option value='us' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag us" data-title="United States">United States</option>
  <option value='uy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uy" data-title="Uruguay">Uruguay</option>
  <option value='uz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uz" data-title="Uzbekistan">Uzbekistan</option>
  <option value='va' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag va" data-title="Vatican City State (Holy See)">Vatican City State (Holy See)</option>
  <option value='vc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vc" data-title="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
  <option value='ve' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ve" data-title="Venezuela">Venezuela</option>
  <option value='vg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vg" data-title="Virgin Islands (British)">Virgin Islands (British)</option>
  <option value='vi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vi" data-title="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
  <option value='vn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vn" data-title="Viet Nam">Viet Nam</option>
  <option value='vu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vu" data-title="Vanuatu">Vanuatu</option>
  <option value='wf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag wf" data-title="Wallis and Futuna">Wallis and Futuna</option>
  <option value='ws' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ws" data-title="Samoa">Samoa</option>
  <option value='ye' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ye" data-title="Yemen">Yemen</option>
  <option value='yt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yt" data-title="Mayotte">Mayotte</option>
  <option value='yu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yu" data-title="Yugoslavia (former)">Yugoslavia (former)</option>
  <option value='za' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag za" data-title="South Africa">South Africa</option>
  <option value='zm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zm" data-title="Zambia">Zambia</option>
  <option value='zr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zr" data-title="Zaire (former)">Zaire (former)</option>
  <option value='zw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zw" data-title="Zimbabwe">Zimbabwe</option>
</select>
</div>
</div>
<ul class="list-inline pull-right">
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right" onCLick="javascript:usuario_new_reg();"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i> Dar alta de usuario <i class="fa fa-user-plus" aria-hidden="true" style="margin-left:8px"></i></button></li></ul>
</div>
</div>
<!--FIN NUEVO USUARIO-->
<div id="spinner_back_usu" ><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Comprobando datos...</div></div>
<div id="usuario_new_ok"></div>
<!--DATOS ALUMNOS-->
<div id="reg_nuevo" style="float:left">
<div class="col-md-12">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:10px"></i>Datos del Alumno</h3>
</div>
<div class="panel-body"> Introduce la información correspondiente a los datos del alumno que va a realizar el curso.<br>
Puedes adjuntar la documentación solicitada ahora o más adelante, desde tu área de usuario. </div>
</div>
</div>
<div class="col-md-6">
<div class="c-checkbox-list" style="margin-bottom:22px">
<div class="c-checkbox">
<input type="checkbox" class="c-check" name="copiar_1" id="copiar_1" onClick="copy_1();">
<label for="copiar_1" class="check_txt" onClick="copy_1();"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-files-o" aria-hidden="true" style="color:#999"></i> Copiar datos de Usuario</label>
</div>
</div>
<div class="form-group"><i class="fa fa-user-o" aria-hidden="true"></i><input type="text" placeholder="Nombre*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre*'" name="a_nombre" id="a_nombre" class="form-control c-square c-theme input-lg inp" data-toggle="tooltip" data-placement="top" title="Como figura en el NIF"></div>
<div class="form-group"><i class="fa fa-user-o" aria-hidden="true"></i><input type="text" placeholder="Apellidos*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos*'" name="a_apellidos" id="a_apellidos" class="form-control c-square c-theme input-lg inp" data-toggle="tooltip" data-placement="top" title="Como figura en el NIF"></div>
<div class="col-md-8 form-group" style="margin:0px;padding:0px;margin-bottom:11px" id="sexo" >
<i class="fa fa-transgender"></i><select name="a_sexo" id="a_sexo" class="select-sexo inp" styl="width:100%;">
<option value="" selected="selected" style="width:100%;">Sexo*</option>
<option value="hombre">Hombre</option>
<option value="mujer">Mujer</option>
</select>
</div>
<div class="col-md-12 form-group" style="padding:0px;"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="NIF / NIE*" onclick="this.placeholder = ''" onblur="this.placeholder = 'NIF / NIE*'" class="form-control c-square c-theme input-lg inp" name="a_nif" id="a_nif" data-toggle="tooltip" data-placement="top" title="8 dígitos y letra">
</div>
<div class="col-md-12" style="padding:0">
<div class="col-md-4 form-group" style="padding:0px;"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="Pasaporte<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Pasaporte<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_pasaporte" id="a_pasaporte">
</div>
<div class="col-md-4 form-group" style="padding:0px;padding-left:20px"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="Expedido" onclick="this.placeholder = ''" onblur="this.placeholder = 'Expedido'" class="form-control c-square c-theme input-lg inp" name="a_pas_exp" id="a_pas_exp">
</div>
<div class="col-md-4 form-group" style="padding:0px;padding-left:20px"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="Caducidad<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Caducidad<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_pas_cad" id="a_pas_cad" data-toggle="tooltip" data-placement="top" title="Fecha de caducidad dd/mm/aaaa">
</div>
</div>
<div class="col-md-12 form-group subidor" style="padding:0px;margin:0;margin-bottom:11px">
<div class="col-md-7" style="padding-left:0px;padding-bottom:0px">
<input type="file" name="a_pass_adj[]" id="a_pass_adj" class="inputfile inputfile-1 inp" data-multiple-caption="{count} archivos seleccionados"/>
<label for="a_pass_adj" class="tolea" data-toggle="tooltip" data-placement="top" title="Máx 1 mb. (PDF, JPG, PNG)" id="pas_doc"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span class="spanea">Adjunta tu pasaporte escaneado </span></label><span class="desadjuntar desadjuntar_pas"><a href="javascript:desadjunta_pas();"><i class="fa fa-trash-o" aria-hidden="true"></i></a></span>
</div>
<div class="col-md-5" style="padding:0">
<input type="file" name="a_nif_adj[]" id="a_nif_adj" class="inputfile inputfile-1" data-multiple-caption="{count} archivos seleccionados"/>
<label for="a_nif_adj" class="tolea" data-toggle="tooltip" data-placement="top" title="Máx 1 mb. (PDF, JPG, PNG)" id="nif_doc"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span  class="spanea" id="nif_del">Adjunta tu NIF </span></label><span class="desadjuntar desadjuntar_nif"><a href="javascript:desadjunta_nif();"><i class="fa fa-trash-o" aria-hidden="true"></i></a></span>
</div>
</div>
<div class="clearfix"></div>

<div class="form-group"><i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" placeholder="email<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'email<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_email" id="a_email"></div>
<div class="form-group"><i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" placeholder="repetir email<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'repetir email<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_email_r" id="a_email_r"></div>
</div>
<div class="col-md-6">


<div class="col-md-12 f_nacimiento_txt"><i class="fa fa-calendar" aria-hidden="true"></i>Fecha Nacimiento <i class="fa fa-arrow-down" aria-hidden="true" style="margin-left:8px"></i></div>
<div style="width:100%;">
<div class="col-md-3 form-group div_f_nacimiento" >
<select name="a_cumple_dia" class="f_nacimiento" id="a_cumple_dia" style="width:100%;">
<option value="" selected="selected">dia<%if session("u_agente")<>"si" then%>*<%end if%></option>
<%for i=1 to 31%>
<option value="<%=i%>"><%=i%></option>
<%next%>
</select>
</div>
<div class="col-md-4 form-group div_f_nacimiento" >
<select name="a_cumple_mes" class="f_nacimiento" id="a_cumple_mes" style="width:100%;">
<option value="" selected="selected">mes<%if session("u_agente")<>"si" then%>*<%end if%></option>
<option value="1">Enero</option>
<option value="2">Febrero</option>
<option value="3">Marzo</option>
<option value="4">Abril</option>
<option value="5">Mayo</option>
<option value="6">Junio</option>
<option value="7">Julio</option>
<option value="8">Agosto</option>
<option value="9">Septiembre</option>
<option value="10">Octubre</option>
<option value="11">Noviembre</option>
<option value="12">Diciembre</option>
</select>
</div>
<div class="col-md-3 form-group div_f_nacimiento" >
<select name="a_cumple_ano" id="a_cumple_ano" class="f_nacimiento" style="width:100%;">
<option value="" selected="selected">año<%if session("u_agente")<>"si" then%>*<%end if%></option>
<%for i=1940 to int(year(date))%>
<option value="<%=i%>"><%=i%></option>
<%next%>
</select>
</div>
</div>
<div class="clearfix"></div>
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono'" class="form-control c-square c-theme input-lg inp" name="a_telefono" id="a_telefono"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Móvil<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Móvil<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_movil" id="a_movil"></div>
<div class="form-group"><i class="fa fa-commenting-o" aria-hidden="true"></i><input type="text" placeholder="Móvil SMS<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Móvil SMS<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_movil_sms" id="a_movil_sms" data-toggle="tooltip" data-placement="top" title="Móvil al que enviaremos notificaciones"></div>
<div class="form-group"><i class="fa fa-street-view" aria-hidden="true"></i><input type="text" placeholder="Dirección<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Dirección<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_direccion" id="a_direccion"></div>
<div class="form-group"><i class="fa fa-map-marker" aria-hidden="true"></i><input type="text" placeholder="Ciudad / Localidad<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Ciudad / Localidad<%if session("u_agente")<>"si" then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_ciudad" id="a_ciudad"></div>
<div class="form-group"><i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" placeholder="Código Postal" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código Postal'" class="form-control c-square c-theme input-lg inp" name="a_c_postal" id="a_c_postal"></div>
<div class="col-md-5 form-group" style="margin:0px;padding:0;margin-bottom:11px;" id="prov" >
<i class="fa fa-map-pin"></i>
<select name="a_provincia" id="a_provincia" style="margin-right:16px;width:100%;" class="select-provincia inp">
<option value="" selected="selected">Provincia<%if session("u_agente")<>"si" then%>*<%end if%></option>
<option value="ALAVA">ALAVA</option>
<option value="ALBACETE">ALBACETE</option>
<option value="ALICANTE">ALICANTE</option>
<option value="ALMERIA">ALMERIA</option>
<option value="ASTURIAS">ASTURIAS</option>
<option value="AVILA">AVILA</option>
<option value="BADAJOZ">BADAJOZ</option>
<option value="BARCELONA">BARCELONA</option>
<option value="BURGOS">BURGOS</option>
<option value="CACERES">CACERES</option>
<option value="CADIZ">CADIZ</option>
<option value="CANTABRIA">CANTABRIA</option>
<option value="CASTELLON">CASTELLON</option>
<option value="CEUTA">CEUTA</option>
<option value="CIUDAD REAL">CIUDAD REAL</option>
<option value="CORDOBA">CORDOBA</option>
<option value="CORU&Ntilde;A, A">CORU&Ntilde;A, A</option>
<option value="CUENCA">CUENCA</option>
<option value="GIRONA">GIRONA</option>
<option value="GRANADA">GRANADA</option>
<option value="GUADALAJARA">GUADALAJARA</option>
<option value="GUIPUZCOA">GUIPUZCOA</option>
<option value="HUELVA">HUELVA</option>
<option value="HUESCA">HUESCA</option>
<option value="ILLES BALEARS">ILLES BALEARS</option>
<option value="JAEN">JAEN</option>
<option value="LEON">LEON</option>
<option value="LLEIDA">LLEIDA</option>
<option value="LUGO">LUGO</option>
<option value="MADRID">MADRID</option>
<option value="MALAGA">MALAGA</option>
<option value="MELILLA">MELILLA</option>
<option value="MURCIA">MURCIA</option>
<option value="NAVARRA">NAVARRA</option>
<option value="OURENSE">OURENSE</option>
<option value="PALENCIA">PALENCIA</option>
<option value="PALMAS, LAS">PALMAS, LAS</option>
<option value="PONTEVEDRA">PONTEVEDRA</option>
<option value="RIOJA, LA">RIOJA, LA</option>
<option value="SALAMANCA">SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE">SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA">SEGOVIA</option>
<option value="SEVILLA">SEVILLA</option>
<option value="SORIA">SORIA</option>
<option value="TARRAGONA">TARRAGONA</option>
<option value="TERUEL">TERUEL</option>
<option value="TOLEDO">TOLEDO</option>
<option value="VALENCIA">VALENCIA</option>
<option value="VALLADOLID">VALLADOLID</option>
<option value="VIZCAYA">VIZCAYA</option>
<option value="ZAMORA">ZAMORA</option>
<option value="ZARAGOZA">ZARAGOZA</option>
<option value="OTRAS">OTRAS</option>
</select>
</div>
<div class="col-md-7 form-group select-pais" style="margin:0px;padding:0px;padding-left:25px;margin-bottom:11px" id="pais_sel">
<select name="a_pais" id="a_pais" class="selects" style="width:100%;">
<option value='ad' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ad" data-title="Andorra">Andorra</option>
  <option value='ae' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ae" data-title="United Arab Emirates">United Arab Emirates</option>
  <option value='af' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag af" data-title="Afghanistan">Afghanistan</option>
  <option value='ag' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ag" data-title="Antigua and Barbuda">Antigua and Barbuda</option>
  <option value='ai' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ai" data-title="Anguilla">Anguilla</option>
  <option value='al' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag al" data-title="Albania">Albania</option>
  <option value='am' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag am" data-title="Armenia">Armenia</option>
  <option value='an' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag an" data-title="Netherlands Antilles">Netherlands Antilles</option>
  <option value='ao' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ao" data-title="Angola">Angola</option>
  <option value='aq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aq" data-title="Antarctica">Antarctica</option>
  <option value='ar' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ar" data-title="Argentina">Argentina</option>
  <option value='as' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag as" data-title="American Samoa">American Samoa</option>
  <option value='at' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag at" data-title="Austria">Austria</option>
  <option value='au' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag au" data-title="Australia">Australia</option>
  <option value='aw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aw" data-title="Aruba">Aruba</option>
  <option value='ax' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ax" data-title="Aland Islands">Aland Islands</option>
  <option value='az' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag az" data-title="Azerbaijan">Azerbaijan</option>
  <option value='ba' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ba" data-title="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
  <option value='bb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bb" data-title="Barbados">Barbados</option>
  <option value='bd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bd" data-title="Bangladesh">Bangladesh</option>
  <option value='be' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag be" data-title="Belgium">Belgium</option>
  <option value='bf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bf" data-title="Burkina Faso">Burkina Faso</option>
  <option value='bg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bg" data-title="Bulgaria">Bulgaria</option>
  <option value='bh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bh" data-title="Bahrain">Bahrain</option>
  <option value='bi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bi" data-title="Burundi">Burundi</option>
  <option value='bj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bj" data-title="Benin">Benin</option>
  <option value='bm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bm" data-title="Bermuda">Bermuda</option>
  <option value='bn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bn" data-title="Brunei Darussalam">Brunei Darussalam</option>
  <option value='bo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bo" data-title="Bolivia">Bolivia</option>
  <option value='br' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag br" data-title="Brazil">Brazil</option>
  <option value='bs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bs" data-title="Bahamas">Bahamas</option>
  <option value='bt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bt" data-title="Bhutan">Bhutan</option>
  <option value='bv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bv" data-title="Bouvet Island">Bouvet Island</option>
  <option value='bw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bw" data-title="Botswana">Botswana</option>
  <option value='by' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag by" data-title="Belarus">Belarus</option>
  <option value='bz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bz" data-title="Belize">Belize</option>
  <option value='ca' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ca" data-title="Canada">Canada</option>
  <option value='cc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cc" data-title="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
  <option value='cd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cd" data-title="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
  <option value='cf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cf" data-title="Central African Republic">Central African Republic</option>
  <option value='cg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cg" data-title="Congo">Congo</option>
  <option value='ch' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ch" data-title="Switzerland">Switzerland</option>
  <option value='ci' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ci" data-title="Cote D'Ivoire (Ivory Coast)">Cote D'Ivoire (Ivory Coast)</option>
  <option value='ck' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ck" data-title="Cook Islands">Cook Islands</option>
  <option value='cl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cl" data-title="Chile">Chile</option>
  <option value='cm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cm" data-title="Cameroon">Cameroon</option>
  <option value='cn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cn" data-title="China">China</option>
  <option value='co' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag co" data-title="Colombia">Colombia</option>
  <option value='cr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cr" data-title="Costa Rica">Costa Rica</option>
  <option value='cs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cs" data-title="Serbia and Montenegro">Serbia and Montenegro</option>
  <option value='cu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cu" data-title="Cuba">Cuba</option>
  <option value='cv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cv" data-title="Cape Verde">Cape Verde</option>
  <option value='cx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cx" data-title="Christmas Island">Christmas Island</option>
  <option value='cy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cy" data-title="Cyprus">Cyprus</option>
  <option value='cz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cz" data-title="Czech Republic">Czech Republic</option>
  <option value='de' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag de" data-title="Germany">Germany</option>
  <option value='dj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dj" data-title="Djibouti">Djibouti</option>
  <option value='dk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dk" data-title="Denmark">Denmark</option>
  <option value='dm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dm" data-title="Dominica">Dominica</option>
  <option value='do' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag do" data-title="Dominican Republic">Dominican Republic</option>
  <option value='dz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dz" data-title="Algeria">Algeria</option>
  <option value='ec' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ec" data-title="Ecuador">Ecuador</option>
  <option value='ee' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ee" data-title="Estonia">Estonia</option>
  <option value='eg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eg" data-title="Egypt">Egypt</option>
  <option value='eh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eh" data-title="Western Sahara">Western Sahara</option>
  <option value='er' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag er" data-title="Eritrea">Eritrea</option>
  <option value='es' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag es" data-title="Spain" selected="selected">España / Spain</option>
  <option value='et' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag et" data-title="Ethiopia">Ethiopia</option>
  <option value='fi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fi" data-title="Finland">Finland</option>
  <option value='fj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fj" data-title="Fiji">Fiji</option>
  <option value='fk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fk" data-title="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
  <option value='fm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fm" data-title="Federated States of Micronesia">Federated States of Micronesia</option>
  <option value='fo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fo" data-title="Faroe Islands">Faroe Islands</option>
  <option value='fr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fr" data-title="France">France</option>
  <option value='fx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fx" data-title="France, Metropolitan">France, Metropolitan</option>
  <option value='ga' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ga" data-title="Gabon">Gabon</option>
  <option value='gd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gd" data-title="Grenada">Grenada</option>
  <option value='ge' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ge" data-title="Georgia">Georgia</option>
  <option value='gf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gf" data-title="French Guiana">French Guiana</option>
  <option value='gh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gh" data-title="Ghana">Ghana</option>
  <option value='gi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gi" data-title="Gibraltar">Gibraltar</option>
  <option value='gl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gl" data-title="Greenland">Greenland</option>
  <option value='gm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gm" data-title="Gambia">Gambia</option>
  <option value='gn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gn" data-title="Guinea">Guinea</option>
  <option value='gp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gp" data-title="Guadeloupe">Guadeloupe</option>
  <option value='gq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gq" data-title="Equatorial Guinea">Equatorial Guinea</option>
  <option value='gr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gr" data-title="Greece">Greece</option>
  <option value='gs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gs" data-title="S. Georgia and S. Sandwich Islands">S. Georgia and S. Sandwich Islands</option>
  <option value='gt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gt" data-title="Guatemala">Guatemala</option>
  <option value='gu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gu" data-title="Guam">Guam</option>
  <option value='gw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gw" data-title="Guinea-Bissau">Guinea-Bissau</option>
  <option value='gy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gy" data-title="Guyana">Guyana</option>
  <option value='hk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hk" data-title="Hong Kong">Hong Kong</option>
  <option value='hm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hm" data-title="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
  <option value='hn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hn" data-title="Honduras">Honduras</option>
  <option value='hr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hr" data-title="Croatia (Hrvatska)">Croatia (Hrvatska)</option>
  <option value='ht' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ht" data-title="Haiti">Haiti</option>
  <option value='hu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hu" data-title="Hungary">Hungary</option>
  <option value='id' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag id" data-title="Indonesia">Indonesia</option>
  <option value='ie' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ie" data-title="Ireland">Ireland</option>
  <option value='il' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag il" data-title="Israel">Israel</option>
  <option value='in' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag in" data-title="India" >India</option>
  <option value='io' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag io" data-title="British Indian Ocean Territory">British Indian Ocean Territory</option>
  <option value='iq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag iq" data-title="Iraq">Iraq</option>
  <option value='ir' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ir" data-title="Iran">Iran</option>
  <option value='is' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag is" data-title="Iceland">Iceland</option>
  <option value='it' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag it" data-title="Italy">Italy</option>
  <option value='jm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jm" data-title="Jamaica">Jamaica</option>
  <option value='jo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jo" data-title="Jordan">Jordan</option>
  <option value='jp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jp" data-title="Japan">Japan</option>
  <option value='ke' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ke" data-title="Kenya">Kenya</option>
  <option value='kg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kg" data-title="Kyrgyzstan">Kyrgyzstan</option>
  <option value='kh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kh" data-title="Cambodia">Cambodia</option>
  <option value='ki' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ki" data-title="Kiribati">Kiribati</option>
  <option value='km' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag km" data-title="Comoros">Comoros</option>
  <option value='kn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kn" data-title="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
  <option value='kp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kp" data-title="Korea (North)">Korea (North)</option>
  <option value='kr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kr" data-title="Korea (South)">Korea (South)</option>
  <option value='kw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kw" data-title="Kuwait">Kuwait</option>
  <option value='ky' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ky" data-title="Cayman Islands">Cayman Islands</option>
  <option value='kz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kz" data-title="Kazakhstan">Kazakhstan</option>
  <option value='la' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag la" data-title="Laos">Laos</option>
  <option value='lb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lb" data-title="Lebanon">Lebanon</option>
  <option value='lc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lc" data-title="Saint Lucia">Saint Lucia</option>
  <option value='li' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag li" data-title="Liechtenstein">Liechtenstein</option>
  <option value='lk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lk" data-title="Sri Lanka">Sri Lanka</option>
  <option value='lr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lr" data-title="Liberia">Liberia</option>
  <option value='ls' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ls" data-title="Lesotho">Lesotho</option>
  <option value='lt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lt" data-title="Lithuania">Lithuania</option>
  <option value='lu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lu" data-title="Luxembourg">Luxembourg</option>
  <option value='lv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lv" data-title="Latvia">Latvia</option>
  <option value='ly' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ly" data-title="Libya">Libya</option>
  <option value='ma' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ma" data-title="Morocco">Morocco</option>
  <option value='mc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mc" data-title="Monaco">Monaco</option>
  <option value='md' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag md" data-title="Moldova">Moldova</option>
  <option value='mg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mg" data-title="Madagascar">Madagascar</option>
  <option value='mh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mh" data-title="Marshall Islands">Marshall Islands</option>
  <option value='mk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mk" data-title="Macedonia">Macedonia</option>
  <option value='ml' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ml" data-title="Mali">Mali</option>
  <option value='mm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mm" data-title="Myanmar">Myanmar</option>
  <option value='mn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mn" data-title="Mongolia">Mongolia</option>
  <option value='mo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mo" data-title="Macao">Macao</option>
  <option value='mp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mp" data-title="Northern Mariana Islands">Northern Mariana Islands</option>
  <option value='mq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mq" data-title="Martinique">Martinique</option>
  <option value='mr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mr" data-title="Mauritania">Mauritania</option>
  <option value='ms' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ms" data-title="Montserrat">Montserrat</option>
  <option value='mt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mt" data-title="Malta">Malta</option>
  <option value='mu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mu" data-title="Mauritius">Mauritius</option>
  <option value='mv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mv" data-title="Maldives">Maldives</option>
  <option value='mw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mw" data-title="Malawi">Malawi</option>
  <option value='mx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mx" data-title="Mexico">Mexico</option>
  <option value='my' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag my" data-title="Malaysia">Malaysia</option>
  <option value='mz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mz" data-title="Mozambique">Mozambique</option>
  <option value='na' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag na" data-title="Namibia">Namibia</option>
  <option value='nc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nc" data-title="New Caledonia">New Caledonia</option>
  <option value='ne' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ne" data-title="Niger">Niger</option>
  <option value='nf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nf" data-title="Norfolk Island">Norfolk Island</option>
  <option value='ng' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ng" data-title="Nigeria">Nigeria</option>
  <option value='ni' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ni" data-title="Nicaragua">Nicaragua</option>
  <option value='nl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nl" data-title="Netherlands">Netherlands</option>
  <option value='no' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag no" data-title="Norway">Norway</option>
  <option value='np' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag np" data-title="Nepal">Nepal</option>
  <option value='nr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nr" data-title="Nauru">Nauru</option>
  <option value='nu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nu" data-title="Niue">Niue</option>
  <option value='nz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nz" data-title="New Zealand (Aotearoa)">New Zealand (Aotearoa)</option>
  <option value='om' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag om" data-title="Oman">Oman</option>
  <option value='pa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pa" data-title="Panama">Panama</option>
  <option value='pe' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pe" data-title="Peru">Peru</option>
  <option value='pf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pf" data-title="French Polynesia">French Polynesia</option>
  <option value='pg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pg" data-title="Papua New Guinea">Papua New Guinea</option>
  <option value='ph' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ph" data-title="Philippines">Philippines</option>
  <option value='pk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pk" data-title="Pakistan">Pakistan</option>
  <option value='pl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pl" data-title="Poland">Poland</option>
  <option value='pm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pm" data-title="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
  <option value='pn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pn" data-title="Pitcairn">Pitcairn</option>
  <option value='pr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pr" data-title="Puerto Rico">Puerto Rico</option>
  <option value='ps' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ps" data-title="Palestinian Territory">Palestinian Territory</option>
  <option value='pt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pt" data-title="Portugal">Portugal</option>
  <option value='pw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pw" data-title="Palau">Palau</option>
  <option value='py' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag py" data-title="Paraguay">Paraguay</option>
  <option value='qa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag qa" data-title="Qatar">Qatar</option>
  <option value='re' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag re" data-title="Reunion">Reunion</option>
  <option value='ro' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ro" data-title="Romania">Romania</option>
  <option value='ru' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ru" data-title="Russian Federation">Russian Federation</option>
  <option value='rw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag rw" data-title="Rwanda">Rwanda</option>
  <option value='sa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sa" data-title="Saudi Arabia">Saudi Arabia</option>
  <option value='sb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sb" data-title="Solomon Islands">Solomon Islands</option>
  <option value='sc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sc" data-title="Seychelles">Seychelles</option>
  <option value='sd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sd" data-title="Sudan">Sudan</option>
  <option value='se' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag se" data-title="Sweden">Sweden</option>
  <option value='sg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sg" data-title="Singapore">Singapore</option>
  <option value='sh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sh" data-title="Saint Helena">Saint Helena</option>
  <option value='si' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag si" data-title="Slovenia">Slovenia</option>
  <option value='sj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sj" data-title="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
  <option value='sk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sk" data-title="Slovakia">Slovakia</option>
  <option value='sl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sl" data-title="Sierra Leone">Sierra Leone</option>
  <option value='sm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sm" data-title="San Marino">San Marino</option>
  <option value='sn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sn" data-title="Senegal">Senegal</option>
  <option value='so' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag so" data-title="Somalia">Somalia</option>
  <option value='sr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sr" data-title="Suriname">Suriname</option>
  <option value='st' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag st" data-title="Sao Tome and Principe">Sao Tome and Principe</option>
  <option value='su' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag su" data-title="USSR (former)">USSR (former)</option>
  <option value='sv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sv" data-title="El Salvador">El Salvador</option>
  <option value='sy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sy" data-title="Syria">Syria</option>
  <option value='sz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sz" data-title="Swaziland">Swaziland</option>
  <option value='tc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tc" data-title="Turks and Caicos Islands">Turks and Caicos Islands</option>
  <option value='td' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag td" data-title="Chad">Chad</option>
  <option value='tf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tf" data-title="French Southern Territories">French Southern Territories</option>
  <option value='tg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tg" data-title="Togo">Togo</option>
  <option value='th' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag th" data-title="Thailand">Thailand</option>
  <option value='tj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tj" data-title="Tajikistan">Tajikistan</option>
  <option value='tk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tk" data-title="Tokelau">Tokelau</option>
  <option value='tl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tl" data-title="Timor-Leste">Timor-Leste</option>
  <option value='tm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tm" data-title="Turkmenistan">Turkmenistan</option>
  <option value='tn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tn" data-title="Tunisia">Tunisia</option>
  <option value='to' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag to" data-title="Tonga">Tonga</option>
  <option value='tp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tp" data-title="East Timor">East Timor</option>
  <option value='tr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tr" data-title="Turkey">Turkey</option>
  <option value='tt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tt" data-title="Trinidad and Tobago">Trinidad and Tobago</option>
  <option value='tv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tv" data-title="Tuvalu">Tuvalu</option>
  <option value='tw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tw" data-title="Taiwan">Taiwan</option>
  <option value='tz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tz" data-title="Tanzania">Tanzania</option>
  <option value='ua' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ua" data-title="Ukraine">Ukraine</option>
  <option value='ug' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ug" data-title="Uganda">Uganda</option>
    <option value='uk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gb" data-title="Great Britain (UK)">United Kingdom</option>
  <option value='um' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag um" data-title="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
  <option value='us' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag us" data-title="United States">United States</option>
  <option value='uy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uy" data-title="Uruguay">Uruguay</option>
  <option value='uz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uz" data-title="Uzbekistan">Uzbekistan</option>
  <option value='va' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag va" data-title="Vatican City State (Holy See)">Vatican City State (Holy See)</option>
  <option value='vc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vc" data-title="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
  <option value='ve' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ve" data-title="Venezuela">Venezuela</option>
  <option value='vg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vg" data-title="Virgin Islands (British)">Virgin Islands (British)</option>
  <option value='vi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vi" data-title="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
  <option value='vn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vn" data-title="Viet Nam">Viet Nam</option>
  <option value='vu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vu" data-title="Vanuatu">Vanuatu</option>
  <option value='wf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag wf" data-title="Wallis and Futuna">Wallis and Futuna</option>
  <option value='ws' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ws" data-title="Samoa">Samoa</option>
  <option value='ye' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ye" data-title="Yemen">Yemen</option>
  <option value='yt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yt" data-title="Mayotte">Mayotte</option>
  <option value='yu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yu" data-title="Yugoslavia (former)">Yugoslavia (former)</option>
  <option value='za' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag za" data-title="South Africa">South Africa</option>
  <option value='zm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zm" data-title="Zambia">Zambia</option>
  <option value='zr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zr" data-title="Zaire (former)">Zaire (former)</option>
  <option value='zw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zw" data-title="Zimbabwe">Zimbabwe</option>
</select>
</div>
</div>
<%if datos_familia_ob="si" then%>
<div class="col-md-12" style="margin-top:35px">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-users" aria-hidden="true" style="margin-right:15px"></i>Datos Familiares</h3>
</div>
<div class="panel-body"> Debes rellenar al menos uno de los dos, padre y/o madre.  </div>
</div>
</div>
<div class="col-md-6">
<div class="c-checkbox-list" style="margin-bottom:22px">
<div class="c-checkbox">
<input type="checkbox" id="copiar_2" class="c-check" name="copiar_2" onClick="copy_2();">
<label for="copiar_2" class="check_txt" onClick="copy_2();"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-files-o" aria-hidden="true" style="color:#999"></i> Copiar datos de Usuario</label>
</div>
</div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Nombre del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_p_nombre" id="a_p_nombre"></div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Apellidos del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_p_apellidos" id="a_p_apellidos"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="Email del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Email del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp"  name="a_p_email" id="a_p_email"></div>
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_p_telefono" id="a_p_telefono"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Teléfono móvil del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono móvil del padre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_p_movil" id="a_p_movil"></div>
<div class="form-group"><i class="fa fa-building-o" aria-hidden="true"></i><input type="text" placeholder="Profesión del padre" onclick="this.placeholder = ''" onblur="this.placeholder = 'Profesión del padre'" class="form-control c-square c-theme input-lg inp" name="a_p_profesion" id="a_p_profesion"></div>
</div>
<div class="col-md-6">
<div class="c-checkbox-list" style="margin-bottom:22px">
<div class="c-checkbox">
<input type="checkbox" id="copiar_3" class="c-check" name="copiar_3" onClick="copy_3();">
<label for="copiar_3" class="check_txt" onClick="copy_3();"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-files-o" aria-hidden="true" style="color:#999"></i> Copiar datos de Usuario</label>
</div>
</div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Nombre de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_m_nombre" id="a_m_nombre"></div><div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Apellidos de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_m_apellidos" id="a_m_apellidos"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="Email de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Email de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp"  name="a_m_email" id="a_m_email"></div>
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_m_telefono" id="a_m_telefono"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Teléfono móvil de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono móvil de la madre (<%if session("u_agente")<>"si" then%>*<%end if%>)'" class="form-control c-square c-theme input-lg inp" name="a_m_movil" id="a_m_movil"></div>
<div class="form-group"><i class="fa fa-building-o" aria-hidden="true"></i><input type="text" placeholder="Profesión de la madre" onclick="this.placeholder = ''" onblur="this.placeholder = 'Profesión de la madre'" class="form-control c-square c-theme input-lg inp" name="a_m_profesion" id="a_m_profesion"></div>
</div>
<%end if%>
<div class="col-md-12" style="margin-top:25px">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-medkit" aria-hidden="true"></i> Datos Médicos & Complementarios</h3>
</div>
<div class="panel-body"> Datos sobre enfermedades reseñables, medicamentos a tomar,...  </div>
</div>
</div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-heart-o" aria-hidden="true"></i><input type="text" placeholder="Enfermedades reseñables incluidas alergias" onclick="this.placeholder = ''" onblur="this.placeholder = 'Listado de enfermedades reseñables'" class="form-control c-square c-theme input-lg inp" name="a_enfermedades" id="a_enfermedades"  data-toggle="tooltip" data-placement="top" title="Enfermedades a tener en cuenta durante el curso"></div>
<div class="form-group"><i class="fa fa-eyedropper" aria-hidden="true"></i><input type="text" placeholder="Medicamentos a tomar" onclick="this.placeholder = ''" onblur="this.placeholder = 'Medicamentos a tomar'" class="form-control c-square c-theme input-lg inp" name="a_medicamentos" id="a_medicamentos"></div>
<span class="agrees">Estoy de acuerdo en autorizar a Cursit, la organización con la que colabora em el país de destino o a la familia en la que me hospede, a actuar por mi en caso de emergencia, accidente o enfermedad durante el periodo de tiempo que dure el programa que esté realizando.</span>
<div class="form-group form-c-radios">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_permiso_medico" type="radio" class="c-radio" id="permiso1" value="si" checked>
<label for="permiso1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input type="radio" id="permiso2" class="c-radio"  name="a_permiso_medico">
<label for="permiso2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div>
</div>
</div>
<div class="form-group form-c-radios">
<label class=" control-label" style="padding:0;padding-top:6px;width:60%;float:left;max-width:130px"><i class="fa fa-apple" aria-hidden="true" style="margin-right:9px"></i>Vegetariano</label>
<div class=""  style="padding:0;padding-top:0px;width:60%;float:left;max-width:170px">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_vegetariano" type="radio" class="c-radio" id="vegetariano1" value="si">
<label for="vegetariano1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input type="radio" id="vegetariano2" class="c-radio" checked name="a_vegetariano" value="no">
<label for="vegetariano2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div>
</div>
</div>
<label class="control-label" style="padding:0;padding-top:6px;width:60%;float:left;max-width:97px"><i class="fa fa-fire" aria-hidden="true" style="margin-right:5px"></i>¿Fumas?</label>
<div class="" style="padding:0;padding-top:0px;width:60%;float:left;max-width:120px">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_fuma" type="radio" class="c-radio" id="fuma1" value="si">
<label for="fuma1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input type="radio" id="fuma2" class="c-radio" checked name="a_fuma" value="no">
<label for="fuma2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
</div>
<div class="col-md-6">
<%if datos_familia_ob="si" then%><div class="form-group"><i class="fa fa-university" aria-hidden="true"></i><input type="text" placeholder="¿A qué colegio o instituto vas?<%if session("u_agente")<>"si" then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = '¿A qué colegio o instituto vas?'" class="form-control c-square c-theme input-lg inp" name="a_colegio" id="a_colegio"></div><%end if%>
<div class="form-group form-c-radios">
<label class="col-md-8 control-label" style="padding-left:0px">¿Has hecho algún curso similar anteriormente?</label>
<div class="col-md-4">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_curso_ant" type="radio" class="c-radio" id="a_curso_ant1" value="si">
<label for="a_curso_ant1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input  name="a_curso_ant" type="radio" class="c-radio" id="a_curso_ant2" value="no" checked="CHECKED">
<label for="a_curso_ant2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="form-group"><i class="fa fa-building-o" aria-hidden="true"></i><input type="text" placeholder="¿Con qué organización?" onclick="this.placeholder = ''" onblur="this.placeholder = '¿Con qué organización?'" class="form-control c-square c-theme input-lg inp" name="a_curso_ant_org" id="a_curso_ant_org"></div>
<div class="col-md-5 form-group" style="margin:0px;margin-right:25px;padding:0;margin-bottom:11px;display:none" id="prov" >
<i class="fa fa-expand"></i>
<select name="a_talla" id="a_talla" style="margin-right:16px;width:100%;" class="select-provincia inp" >
<option value="" selected="selected">Talla de camiseta</option>
<option value="S">S</option>
<option value="M">M</option>
<option value="L">L</option>
<option value="XL">XL</option>
<option value="XXL">XXL</option>
</select>
</div>
<div class="col-md-12 form-group" style="margin:0px;padding:0;margin-bottom:11px;" id="prov" >
<i class="fa fa-search"></i>
<select name="a_conocido" id="a_conocido" style="margin-right:16px;width:100%;" class="select-provincia inp">
<option value="" selected="selected">¿Cómo nos has conocido?</option>
<option value="Prensa">Prensa</option>
<option value="Buscador de Internet">Buscador de Internet</option>
<option value="Vallas Publicitarias">Vallas Publicitarias</option>
<option value="Colegio">Colegio</option>
<option value="Agente/Agencia">Agente/Agencia</option>
<option value="Amigo">Amigo</option>
</select>
</div>
<div class="clearfix"></div>
</div>
<div class="col-md-12" style="margin-top:35px">
<div class="form-group"><i class="fa fa-comments-o" aria-hidden="true"></i>
<textarea rows="4" placeholder="Observaciones para el curso" onclick="this.placeholder = ''" onblur="this.placeholder = 'Observaciones para el curso'" class="form-control c-theme c-square input-lg inp" name="a_observaciones_curso_n" id="a_observaciones_curso_n"></textarea></div>
</div>
<div class="col-md-12">
<div class="c-content-divider c-icon-bg c-theme-bg"><i class="icon-doc c-rounded c-theme-bg c-font-white"></i></div>
<div class="c-checkbox-list" >
<div class="c-checkbox">
<input name="factura" type="checkbox" class="c-check" id="factura" autocomplete="off" value="si">
<label for="factura" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-file-text-o" aria-hidden="true" style="color:#999;margin-right:8px"></i>Facturar con otros datos</label>
</div>
</div>
<div class="form-group" id="datos_factura">
<div class="col-md-6">
<div class="form-group"><i class="fa fa-gavel" aria-hidden="true"></i><input type="text" placeholder="Nombre / Razón Social" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre / Razón Social'" class="form-control c-square c-theme input-lg inp" name="u_f_nombre" id="u_f_nombre"></div>
</div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-id-card-o" aria-hidden="true"></i>
<input type="text" placeholder="NIF / CIF" onclick="this.placeholder = ''" onblur="this.placeholder = 'NIF / CIF'" class="form-control c-square c-theme input-lg inp" name="u_f_nif" id="u_f_nif"></div>
</div>
<div class="col-md-12">
<div class="form-group"><i class="fa fa-location-arrow" aria-hidden="true"></i>
<textarea rows="4" placeholder="Dirección, localidad, provincia, código postal, país,..." onclick="this.placeholder = ''" onblur="this.placeholder = 'Dirección, localidad, provincia, código postal, país,...'" class="form-control c-theme c-square input-lg inp" name="u_f_direccion" id="u_f_direccion"></textarea></div>
</div>
</div>
</div>
<ul class="list-inline pull-right" >
<li><button type="button" id="bot_preinscribir" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right" onCLick="javascript:alumno_new_reg();"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i> Preinscribir al alumno  <i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-left:9px"></i>
</button></li></ul>
</div>
<div id="alumno_new_ok"></div>
<div id="reg_usu_nuevo" style="float:left"></div>
<!--FIN DATOS ALUMNOS-->
<ul class="list-inline pull-right">
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  prev-step" id="prv_step_2"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:8px"></i> Paso anterior <i class="fa fa-arrow-left" aria-hidden="true" style="margin-left:8px"></i>
</button></li>
<li class="disabled"><button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right next-step" disabled id="nxt_step_2" onClick="confirmar_formalizar_n();"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Siguiente Paso <i class="fa fa-money" aria-hidden="true" style="margin-left:8px"></i></button></li>
</ul>
</div>
<div class="tab-pane" role="tabpanel" id="step3">
<div class="panel panel-default" style="text-align:left">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-money" aria-hidden="true" style="margin-right:10px"></i>Métodos de Pago</h3>
</div>
<div class="panel-body"> Dispones de los siguientes métodos de pago para formalizar tu reserva.  </div>
</div>

<!--Comprobamos si este caso está en rango-->
<%mes_sal=request("salida_mes")
if mes_sal="" then mes_sal=aeropuerto_mes end if
if mes_sal="" then mes_sal=s_mes end if
Sql= "SELECT id_seccion FROM rel WHERE id_item="&id_item&" and id_seccion<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_seccion=ob_rs("id_seccion")
end if
ob_rs.close
Sql= "SELECT id_destino FROM rel WHERE id_item="&id_item&" and id_destino<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_destino=ob_rs("id_destino")
end if
ob_rs.close
Sql= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_categoria=ob_rs("id_categoria")
end if
ob_rs.close
Sql= "SELECT id_categoria FROM descuentosRel WHERE id_categoria="&id_categoria&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
Sql= "SELECT id_seccion FROM descuentosRel WHERE id_seccion="&id_seccion&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
if mes_sal<>"" then
Sql= "SELECT mes FROM descuentosRel WHERE mes='"&mes_sal&"' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
if f_inicio<>"" then 
f_inicio_cod=year(f_inicio) 
Sql= "SELECT id_seccion FROM descuentosRel WHERE anyo="&f_inicio&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
if id_destino<>"" then
Sql= "SELECT mes FROM descuentosRel WHERE id_destino="&id_destino&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
if session("id_usuario")<>"" then
Sql= "SELECT mes FROM descuentosRel WHERE id_usuario="&session("id_usuario")&"  "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
Sql= "SELECT mes FROM descuentosRel WHERE id_alumno<>0 "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
Sql= "SELECT mes FROM descuentosRel WHERE ciudad<>'' or ciudad is not null "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
Sql= "SELECT mes FROM descuentosRel WHERE provincia<>'' or ciudad is not null "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close

if pasa="si" then%>
<div class="descuento">
<div id="check_descuento">
<div id="check_ko"><span class="cod_txt">¿Dispones de un código de agente?</span>
<div class="form-group"><i class="fa fa-barcode" aria-hidden="true"></i><input type="text" placeholder="Código agente" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código agente'" class="form-control c-square c-theme input-lg inp"  name="cod_descuento" id="cod_descuento"></div>
<button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-10" onClick="ap_descuento();"><i class="fa fa-edit" aria-hidden="true"></i> Aplicar código </button>
</div>
</div>
</div>
<%end if%>
<input type="hidden" name="id_programa_desc" id="id_programa_desc" value=""/>

<div class="col-md-12 metodosPagos" id="metodosPago"></div>
<div class="col-md-12 metodosPagos" id="pro_pago_opt">
<%Sql= "SELECT * FROM metodosPago WHERE id_metodoPago IS NOT NULL"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<%if ob_rs("transferencia")="si" and ob_rs("datos_transferencia")<>"" then%>
<div class="metodoPago met_pago" onClick="activa2();"><input name="metodoPago" type="radio" value="pag_transferencia" id="matodoPago1" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="En un plazo de 72 horas"><label for="matodoPago1" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="En un plazo de 72 horas"><i class="fa fa-exchange met_pago" aria-hidden="true"></i> Transferencia <br>Bancaria</label></div>
<%end if
if ob_rs("tarjeta")="si" and ob_rs("tar_comercio")<>"" and ob_rs("tar_cod_comercio")<>"" and ob_rs("tar_pass")<>"" then%>
<div class="metodoPago met_pago" onClick="activa2();"><input name="metodoPago" type="radio" value="pag_tarjeta" id="matodoPago2" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Se redirigirá a la pasarela bancaria"><label for="matodoPago2" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Se redirigirá a la pasarela bancaria"><i class="fa fa-credit-card met_pago" aria-hidden="true"></i> Tarjeta de Crédito</label></div>
<%end if
if ob_rs("paypal")="si" and ob_rs("pay_mail")<>""then%>
<div class="metodoPago met_pago" onClick="activa2();"><input name="metodoPago" type="radio" value="pag_paypal" id="pag_paypal" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Mediante redirección a pasarela PayPal"><label for="matodoPago3" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Mediante redirección a pasarela PayPal"><i class="fa fa-cc-paypal met_pago" aria-hidden="true"></i> PayPal</label></div>
<%end if
if ob_rs("oficina")="si"then%>
<div class="metodoPago met_pago" onClick="activa2();"><input name="metodoPago" type="radio" value="pag_oficina" id="matodoPago4" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Pago en metálico en oficina o delegación Cursit"><label for="matodoPago4" onClick="activa2();" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Pago en metálico en oficina o delegación Cursit"><i class="fa fa-money met_pago" aria-hidden="true"></i> Pago en Oficina</label></div>
<%end if%>
<%else%>
<div class="no_hay_pago"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Actualmente no hay ningún método de pago habilitado.</div>
<%end if
ob_rs.close%>
</div>
<ul class="list-inline pull-right">
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  prev-step" onClick="res_programa();"><i class="fa fa-arrow-left" aria-hidden="true" style="margin-right:8px"></i> Paso anterior 
</button></li>
<li><button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  next-step" id="nxt_step_3">Siguiente Paso <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:8px"></i>
</button></li>
</ul>
</div>
<div class="tab-pane condiciones" role="tabpanel" id="complete">
<div class="panel panel-default" style="text-align:left">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-check" aria-hidden="true" style="margin-right:10px"></i>Confirmación y aceptación</h3>
</div>
<div class="panel-body"> Para finalizar debes aceptar las condiciones de contratación y la cláusula informativa y autorización al tratamiento de datos.<br> Al "confirmar reserva" pasarás al medio de pago que hayas elegido.</div>
</div>
<%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='cc'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_cc=ob_rs("texto_esp")
titulo_cc=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="col-md-12">
<div class="condiciones_contratacion"><span class="condiciones_contratacion_tit"><i class="fa fa-gavel" aria-hidden="true"></i> <%=titulo_cc%></span>
<div class="clausula_aceptacion"><%=texto_cc%></div>
<div class="c-checkbox">
<input type="checkbox" class="c-check" name="acp_condiciones" id="acp_condiciones" autocomplete="off">
<label for="acp_condiciones" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-gavel" aria-hidden="true" style="color:#999"></i> Sí, he leido y acepto Las condiciones de contratación</label>
</div>
</div>
<div class="c-checkbox">
<input type="checkbox" class="c-check" name="acp_info" id="acp_info" autocomplete="off">
<label for="acp_info" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leido y acepto <a href="javascript:tratamiento_datos();" class="check_a">La Cláusula Informativa y Autorización al Tratamiento de los Datos</a></label>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#ccc"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i>
 <span><%=titulo_td%></span></h4>
</div>
<div class="modal-body"><p><span><%=texto_td%></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
</div>
<div class="c-checkbox">
<input name="acp_mail" type="checkbox" class="c-check" id="acp_mail" autocomplete="off" >
<label for="acp_mail" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-envelope-o" aria-hidden="true" style="color:#999"></i> Sí, quiero formar parte de la base de datos para el envío de Newsletters de Cursit Idiomas </label>
</div>
<ul class="list-inline pull-right final_reserva" >
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  prev-step" ><i class="fa fa-arrow-left" aria-hidden="true" style="margin-right:8px"></i> Paso anterior 
</button></li>
<li><button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  next-step" id="btn_confirmar" onClick="paso_fin();">Confirmar reserva <i class="fa fa-check" aria-hidden="true" style="margin-left:8px"></i>
</button></li>
</ul>
</div>
</div>
<div class="clearfix"></div>
</div>
<div id="inscribir_observaciones" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#ccc"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar preinscripción de alumno</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres confirmar la preinscripción del alumno?<br><br>Recuerda que puedes introducir alguna observación para esta preinscripción en "Observaciones para el curso"</span></p></div>
<div class="modal-footer"><input name="id_alumnor" id="id_alumnor" type="hidden" value="">
<button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_inscribir();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div>
</div>
</div>
<div id="eliminar_alumno" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#ccc"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar eliminación de alumno</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres eliminar este alumno de Preinscripciones?</span></p></div>
<div class="modal-footer"><input name="id_alumnor_e" id="id_alumnor_e" type="hidden" value="">
<button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_eliminar();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div>
</div>
</div>
<div id="formalizar_alumno" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#ccc"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Formalizar reserva</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres formalizar la reserva del alumno?</span></p></div>
<div class="modal-footer"><input name="id_alumnor_f" id="id_alumnor_f" type="hidden" value=""><input name="id_programa_f" id="id_programa_f" type="hidden" value=""><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_formalizar();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div></div></div>
</form>
</div></div>
<%else%>
<div class="reg_curso_completo" style="text-align:center"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> No sabemos cómo has llegado aquí, pero esta URL es errónea.</div>
<%end if 'if id_item<>""%>
<%if session("id_usuario")<>"" then%></div><%end if%>
</div></div></div></div>
<!--</div></div>-->
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#ccc"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4>
</div>
<div class="modal-body"><p><span id="alerta_txt"></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
<div id="alumno_new_reg_ok" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#ccc"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar preinscripción de alumno</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres confirmar la preinscripción del alumno?</span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" onClick="alumno_new_reg_ok();" data-dismiss="modal">Aceptar</button><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Cancelar</button></div>
</div></div></div>
<!--#include file="comun/menu_inf.asp"-->
<style>.men_usu{display:none}</style>
<script src="<%=r%>web/lib/js/custom.js"></script>
<script src="<%=r%>web/lib/js/reserva-steps.js"></script>
<script src="<%=r%>web/lib/js/validador.js"></script>
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/dd.css" />
<script src="<%=r%>web/lib/js/jquery.dd.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/flags.css" />
<script>
function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
$(document).ready(function(e) {
$('#no_autorizado').hide();
$('#usuario_new_ok').hide();
<%if session("id_usuario")<>""then%>$('.men_usu').show();$(".men_usu").css("display", "block");<%else%>$('.men_usu').hide();$(".men_usu").css("display", "none");<%end if%>
$('#usuario_new_ko').hide();
$('#spinner_back_usu').hide();})
$( "#nxt_step_1" ).click(function() {$("#step2").removeClass( "ocult" );});
function u_nombre() {Ctrl = f_reserva.u_nombre;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del usuario.');$('#alerta_tit').html('Nombre del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_apellidos() {Ctrl = f_reserva.u_apellidos;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce los apellidos del usuario.');$('#alerta_tit').html('Apellidos del usuario no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_email() {Ctrl = f_reserva.u_email;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el mail del usuario.');$('#alerta_tit').html('eMail del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_pass() {Ctrl = f_reserva.u_pass;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la contraseña del usuario.');$('#alerta_tit').html('Contraseña del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_telefono() {Ctrl = f_reserva.u_telefono;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el teléfono del usuario.');$('#alerta_tit').html('Teléfono del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_movil() {Ctrl = f_reserva.u_movil;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil del usuario.');$('#alerta_tit').html('Móvil del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_direccion() {Ctrl = f_reserva.u_direccion;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la dirección del usuario.');$('#alerta_tit').html('Dirección del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_ciudad() {Ctrl = f_reserva.u_ciudad;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la ciudad del usuario.');$('#alerta_tit').html('Ciudad del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_provincia() {Ctrl = f_reserva.u_provincia;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona la provincia del usuario.');$('#alerta_tit').html('Provincia del usuario no seleccionada.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_nif() {Ctrl = f_reserva.u_direccion;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la dirección del usuario.');$('#alerta_tit').html('Dirección del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}

function u_nif_ok(form) {
var numero, let, letra;
var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;
dni = document.f_reserva.u_nif.value.toUpperCase();
if(expresion_regular_dni.test(dni) === true){
numero = dni.substr(0,dni.length-1);
numero = numero.replace('X', 0);
numero = numero.replace('Y', 1);
numero = numero.replace('Z', 2);
let = dni.substr(dni.length-1, 1);
numero = numero % 23;
letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
letra = letra.substring(numero, numero+1);
if (letra != let) {
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del usuario no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del usuario incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.u_nif).css('border', '2px solid #FF0000');$(document.f_reserva.u_nif).click(function() {$(document.f_reserva.u_nif).css('border', '1px solid #D0D7DE');})
return false;}else{return true;}}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del usuario no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del usuario incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.u_nif).css('border', '2px solid #FF0000');$(document.f_reserva.u_nif).click(function() {$(document.f_reserva.u_nif).css('border', '1px solid #D0D7DE');})
return false;
}}

function u_email_ok(form){
var resultado
var str=document.f_reserva.u_email.value;
var Ctrl=document.f_reserva.u_email;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del usuario no es correcto.');$('#alerta_tit').html('eMail del usuario incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}
return (resultado)
}
function u_compara(form)	     {
var Ctrl=document.f_reserva.u_email_r;
if(document.f_reserva.u_email.value == document.f_reserva.u_email_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del usuario repetido no es correcto.');$('#alerta_tit').html('eMail del usuario repetido incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})}
function u_compara_pass(form){
var Ctrl=document.f_reserva.u_pass_r;
if(document.f_reserva.u_pass.value == document.f_reserva.u_pass_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> La Contraseña del usuario repetida no coincide.');$('#alerta_tit').html('Contraseña del usuario incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})}
function usuario_new_reg(){
	if (!u_nombre()) return;
	if (!u_apellidos()) return;
	if (!u_email()) return;
	if (!u_email_ok()) return;
	if (!u_compara()) return;
	if (!u_pass()) return;
	if (!u_compara_pass()) return;
	if (!u_nif_ok()) return;
	if (!u_telefono()) return;
	if (!u_movil()) return;
	if (!u_direccion()) return;
	if (!u_ciudad()) return;
	if (!u_provincia()) return;
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_new_reg.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#usuario_new_ok').html(data);
}
});
return false;
}
function reg_ok(){$('#spinner_back_usu').fadeOut(500, function(){$('#usuario_new_ok').fadeIn(500);$('#usuario_new_ko').fadeOut(500);});
$('#usuario_new').fadeOut(500, function(){$("#reg_nuevo").fadeIn( "slow" )});}
function alu_ok(){$('#spinner_back_usu').fadeOut(500, function(){$('#usuario_new_ok').fadeIn(500);$('#usuario_new_ko').fadeOut(500);});
$('#usuario_new').fadeOut(500, function(){$("#reg_nuevo").fadeIn( "slow" )});}
function reg_ko(){$('#spinner_back_usu').fadeOut(500, function(){$('#usuario_new_ko').fadeIn(500);});}
function alumno_new_reg_ok() {
$('#spinner_back_usu').fadeIn(100, function(){});
$("#inscribir_observaciones #id_alumnor").val('');
$("#eliminar_alumno #id_alumnor_e").val('');
$("#formalizar_alumno #id_alumnor_f").val('');
var form = $('#f_reserva')[0];
var data = new FormData(form);
var url = "<%=r%>web/pr_alu_new_reg.asp";
$.ajax({
type: "POST",
url: url,
enctype: 'multipart/form-data',
data: data,
processData: false,
contentType: false,
cache: false,
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$("#reg_nuevo").slideToggle( "slow" );
$('#alumno_new_ok').html(data);
$(document).scrollTop( $("#reg_nuevo").offset().top-150 );  
reg_dentro2();
var url = "<%=r%>web/pr_metodos_pago.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#metodosPago').html(data); 
}
});
return false;
}
});
return false;
}
function a_nombre() {Ctrl = f_reserva.a_nombre;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del alumno.');$('#alerta_tit').html('Nombre de alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_apellidos() {Ctrl = f_reserva.a_apellidos;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce los apellidos del alumno.');$('#alerta_tit').html('Apellidos del alumno no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_sexo() {Ctrl = f_reserva.a_sexo;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el sexo del alumno.');$('#alerta_tit').html('Sexo del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_pasaporte() {Ctrl = f_reserva.a_pasaporte;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el Pasaporte del alumno.');$('#alerta_tit').html('Pasaporte del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_email() {Ctrl = f_reserva.a_email;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el eMail del alumno.');$('#alerta_tit').html('eMail del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_cumple_dia() {Ctrl = f_reserva.a_cumple_dia;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona el DIA de nacimiento del alumno.');$('#alerta_tit').html('DIA de nacimiento del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_cumple_mes() {Ctrl = f_reserva.a_cumple_mes;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona el MES de nacimiento del alumno.');$('#alerta_tit').html('MES de nacimiento del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_cumple_ano() {Ctrl = f_reserva.a_cumple_ano;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona el AÑO de nacimiento del alumno.');$('#alerta_tit').html('AÑO de nacimiento del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_movil() {Ctrl = f_reserva.a_movil;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil del alumno.');$('#alerta_tit').html('Móvil del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_movil_sms() {Ctrl = f_reserva.a_movil_sms;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil para envíos de SMS del alumno.');$('#alerta_tit').html('Móvil SMS del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_direccion() {Ctrl = f_reserva.a_direccion;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la dirección del alumno.');$('#alerta_tit').html('Dirección del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_ciudad() {Ctrl = f_reserva.a_ciudad;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la ciudad del alumno.');$('#alerta_tit').html('Ciudad del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_provincia() {Ctrl = f_reserva.a_provincia;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la provincia del alumno.');$('#alerta_tit').html('Provincia del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_conocido() {Ctrl = f_reserva.a_conocido;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona cómo nos has conocido.');$('#alerta_tit').html('¿Cómo nos has conocido?.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_colegio() {Ctrl = f_reserva.a_colegio;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del colegio al que vas.');$('#alerta_tit').html('Colegio del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function nombre_obliga() {Ctrl = f_reserva.a_p_nombre;Ctrl2 = f_reserva.a_m_nombre;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del padre o de la madre.');$('#alerta_tit').html('Nombre de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function apellidos_obliga() {Ctrl = f_reserva.a_p_apellidos;Ctrl2 = f_reserva.a_m_apellidos;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce los apellidos del padre o de la madre.');$('#alerta_tit').html('Apellidos de padre o madre no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function email_obliga() {Ctrl = f_reserva.a_p_email;Ctrl2 = f_reserva.a_m_email;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el eMail del padre o de la madre.');$('#alerta_tit').html('Email de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function telefono_obliga() {Ctrl = f_reserva.a_p_telefono;Ctrl2 = f_reserva.a_m_telefono;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el teléfono del padre o de la madre.');$('#alerta_tit').html('Teléfono de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function movil_obliga() {Ctrl = f_reserva.a_p_movil;Ctrl2 = f_reserva.a_m_movil;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil del padre o de la madre.');$('#alerta_tit').html('Móvil de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_email_ok(form){
var resultado
var str=document.f_reserva.a_email.value;
var Ctrl=document.f_reserva.a_email;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del alumno no es correcto.');$('#alerta_tit').html('eMail del alumno incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}
return (resultado)}
function compara(form)	     {
var Ctrl=document.f_reserva.a_email_r;
if(document.f_reserva.a_email.value == document.f_reserva.a_email_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del alumno repetido no es correcto.');$('#alerta_tit').html('eMail del alumno incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})}

function nif_ok(form) {
<%Sql= "SELECT nifClave FROM datComunes where nifClave<>''" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nifClave=ob_rs("nifClave")
end if
ob_rs.close%>
var numero, let, letra;
var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;
dni = document.f_reserva.a_nif.value.toUpperCase();
if(dni=="<%=nifClave%>" && dni!=''){
return true;
}else{
if(expresion_regular_dni.test(dni) === true){
numero = dni.substr(0,dni.length-1);
numero = numero.replace('X', 0);
numero = numero.replace('Y', 1);
numero = numero.replace('Z', 2);
let = dni.substr(dni.length-1, 1);
numero = numero % 23;
letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
letra = letra.substring(numero, numero+1);
if (letra != let) {
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del alumno no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del alumno incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.a_nif).css('border', '2px solid #FF0000');$(document.f_reserva.a_nif).click(function() {$(document.f_reserva.a_nif).css('border', '1px solid #D0D7DE');})
return false;}else{return true;}}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del alumno no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del alumno incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.a_nif).css('border', '2px solid #FF0000');$(document.f_reserva.a_nif).click(function() {$(document.f_reserva.a_nif).css('border', '1px solid #D0D7DE');})
return false;
}}}

function a_pas_cad(){
Ctrl=document.f_reserva.a_pas_cad;
re2=/^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9]$/
if(document.f_reserva.a_pas_cad.length==0 || !re2.exec(document.f_reserva.a_pas_cad.value))
{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El formato de caducidad del pasaporte no es correcto (dd/mm/aaaa).');$('#alerta_tit').html('Caduciad pasaporte del alumno incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
return false;
}else
return true;}

function restarFechas() {
var f = new Date();
dia= f.getDate();
dia=("0" + dia).slice (-2);
mes= (f.getMonth() +1);
mes=("0" + mes).slice (-2);
var fech2 = dia + "/" + mes + "/" + f.getFullYear();
inp1 = document.f_reserva.a_pas_cad.value;
inp2 = fech2;
tmp = inp1.split('/');
fini = tmp[2]+tmp[1]+tmp[0];
tmp = inp2.split('/');
ffin = tmp[2]+tmp[1]+tmp[0];
if(fini <= ffin){
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i>La fecha de caducidad del pasaporte no puede ser inferior al '+ fech2 +'.');$('#alerta_tit').html('Fecha de caducidad incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
return false;
}else
return true;
}
function alumno_new_reg(){
if (!a_nombre()) return;
if (!a_apellidos()) return;
if (!a_sexo()) return;
if (!nif_ok()) return; //    DESACTIVAMOS EN PRODUCCION PARA NO CONFIRMAR NIF
<%if session("u_agente")<>"si" then%>
//if (!a_pasaporte()) return;
//if (!a_pas_cad()) return;
if (!restarFechas()) return;
if (!a_email()) return;
if (!a_email_ok()) return;
if (!compara()) return;
if (!a_cumple_dia()) return;
if (!a_cumple_mes()) return;
if (!a_cumple_ano()) return;
if (!a_movil()) return;
if (!a_movil_sms()) return;
if (!a_direccion()) return;
if (!a_ciudad()) return;
if (!a_provincia()) return;
if (!a_conocido()) return;

<%if datos_familia_ob="si"then%>
if (!nombre_obliga()) return;
if (!apellidos_obliga()) return;
if (!email_obliga()) return;
if (!movil_obliga()) return;
if (!telefono_obliga()) return;
if (!a_colegio()) return;
<%end if
end if 'caso agente%>
$('#alumno_new_reg_ok').modal('show');}
function ver_datos_alumno(){$("#reg_nuevo").slideToggle( "slow" );$(document).scrollTop( $("#reg_nuevo").offset().top-120 );$("#bot_preinscribir" ).prop( "disabled", true );}
$(document).ready(function(e) {$("body select").msDropDown();$( "#nxt_step_3" ).hide();<%if session("id_usuario")="" then%>$( "#bot_inscribir_new" ).hide();<%end if%>})
$("#usuario_new").fadeOut( "fast" );
$("#datos_factura").fadeOut( "fast" );
$("#reg_nuevo").fadeOut( "fast" );
$("#reg_dentro").fadeOut( "fast" );
function sh_usuario_new(){
$("#usuario_new").slideToggle( "slow" );
$("#usuario_reg").slideToggle( "slow" );};
function sh_usuario_reg(){
$("#usuario_reg").slideToggle( "slow" );
$("#usuario_new").slideToggle( "slow" );};
//$("#reg_nuevo").slideToggle( "slow" );
function a_inscribir_nuevo(){///////////////// ESTO OCURRIRÄ SI SE DA DE ALTA Y TODO OK
$("#reg_nuevo").slideToggle( "slow" );
$(document).scrollTop( $("#reg_nuevo").offset().top-150 );
$("#a_usuario_reg").fadeOut( "slow" );
$('#f_reserva').trigger("reset");
document.f_reserva.a_cumple_dia.selectedIndex = 0;
var manejador = $(document.f_reserva.a_cumple_dia).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", document.f_reserva.a_cumple_dia.selectedIndex)}
document.f_reserva.a_cumple_mes.selectedIndex = 0;
var manejador = $(document.f_reserva.a_cumple_mes).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", document.f_reserva.a_cumple_mes.selectedIndex)}
document.f_reserva.a_cumple_ano.selectedIndex = 0;
var manejador = $(document.f_reserva.a_cumple_ano).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", document.f_reserva.a_cumple_ano.selectedIndex)}
document.f_reserva.a_sexo.selectedIndex = 0;
var manejador = $(document.f_reserva.a_sexo).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", document.f_reserva.a_sexo.selectedIndex)}
document.f_reserva.a_provincia.selectedIndex = 0;
var manejador = $(document.f_reserva.a_provincia).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", document.f_reserva.a_provincia.selectedIndex)}
document.f_reserva.a_conocido.selectedIndex = 0;
var manejador = $(document.f_reserva.a_conocido).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", document.f_reserva.a_conocido.selectedIndex)}
desadjunta_pas();
desadjunta_nif();
$(".reg_curso_completo").fadeOut( "slow" );
$(".alu_new_res").fadeOut( "slow" );
$("#nxt_step_2" ).prop( "disabled", true );
$("#bot_preinscribir" ).prop( "disabled", false );};
$("#factura").click(function(){$("#datos_factura").slideToggle();});
$(".inp").tooltip({html:true});
$(".inp_n").tooltip({html:true});
$(".tolea").tooltip({html:true});
function usuario() {Ctrl = f_reserva.usuario;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-user" aria-hidden="true"></i> Introduce tu mail o usuario.');$('#alerta_tit').html('Usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function pass() {Ctrl = f_reserva.pass;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-key" aria-hidden="true"></i> Introduce tu contraseña.');$('#alerta_tit').html('Contraseña no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function logueo(){if (!usuario()) return;if (!pass()) return;check_user();return;}

function check_user(){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_check.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#fallo_pass').html(data);
}
});
return false;}
function reg_dentro2(){
var url = "<%=r%>web/pr_usu_alu_lst.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#reg_dentro').html(data);
$("#reg_dentro").fadeIn( "slow" );
}
});
return false;};
function reg_dentro3(usu){
var url = "<%=r%>web/pr_usu_alu_lst.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$("#no_logueado").hide();
$("#logueado").show();
$("#log_usuario").html(usu);
$(document).scrollTop( $("#reg_nuevo").offset().top-150 );}});return false;};
function reg_dentro(usu){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_alu_lst.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#reg_dentro').html(data);
$("#reg_dentro").slideToggle( "slow" );
$("#usuario_reg").slideToggle( "slow" );
$("#no_logueado").hide();
$("#logueado").show();
$("#log_usuario").html(usu);
}
});
return false;};//function recuperar_pass(){$("#recuperar_pass iframe" ).attr('src','<%'=r%>web/z_rec_pass.asp');$("#recuperar_pass").modal();}
function selectItemCombo(combo, valor){for(i=0; i<combo.length; i++){if (combo.options[i].value == valor)combo.selectedIndex = i;var manejador = $(combo).msDropDown().data("dd");if(manejador) {manejador.set("selectedIndex", combo.selectedIndex)}}}
function copy_1(){
if (document.f_reserva.copiar_1.checked){ 
document.f_reserva.a_nombre.value = document.getElementById("u_nombre").value;
document.f_reserva.a_apellidos.value = document.getElementById("u_apellidos").value;
document.f_reserva.a_email.value = document.getElementById("u_email").value;
document.f_reserva.a_telefono.value = document.getElementById("u_telefono").value;
document.f_reserva.a_movil.value = document.getElementById("u_movil").value;
document.f_reserva.a_movil_sms.value = document.getElementById("u_movil").value;
document.f_reserva.a_direccion.value = document.getElementById("u_direccion").value;
document.f_reserva.a_ciudad.value = document.getElementById("u_ciudad").value;
document.f_reserva.a_c_postal.value = document.getElementById("u_c_postal").value;
}
else{
document.f_reserva.a_nombre.value = "";
document.f_reserva.a_apellidos.value = "";
document.f_reserva.a_email.value = "";
document.f_reserva.a_telefono.value = "";
document.f_reserva.a_movil.value = "";
document.f_reserva.a_movil_sms.value = "";
document.f_reserva.a_direccion.value = "";
document.f_reserva.a_ciudad.value = "";
document.f_reserva.a_c_postal.value = "";
}
}
function copy_2(){
if (document.f_reserva.copiar_2.checked){ 
document.f_reserva.a_p_nombre.value = document.getElementById("u_nombre").value;
document.f_reserva.a_p_apellidos.value = document.getElementById("u_apellidos").value;
document.f_reserva.a_p_email.value = document.getElementById("u_email").value;
document.f_reserva.a_p_telefono.value = document.getElementById("u_telefono").value;
document.f_reserva.a_p_movil.value = document.getElementById("u_movil").value;
}
else{
document.f_reserva.a_p_nombre.value = "";
document.f_reserva.a_p_apellidos.value = "";
document.f_reserva.a_p_email.value = "";
document.f_reserva.a_p_telefono.value = "";
document.f_reserva.a_p_movil.value = "";
}
}
function copy_3(){
if (document.f_reserva.copiar_3.checked){ 
document.f_reserva.a_m_nombre.value = document.getElementById("u_nombre").value;
document.f_reserva.a_m_apellidos.value = document.getElementById("u_apellidos").value;
document.f_reserva.a_m_email.value = document.getElementById("u_email").value;
document.f_reserva.a_m_telefono.value = document.getElementById("u_telefono").value;
document.f_reserva.a_m_movil.value = document.getElementById("u_movil").value;
}
else{
document.f_reserva.a_m_nombre.value = "";
document.f_reserva.a_m_apellidos.value = "";
document.f_reserva.a_m_email.value = "";
document.f_reserva.a_m_telefono.value = "";
document.f_reserva.a_m_movil.value = "";
}
}
function confirmar_inscribir(id_alumno){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_alu_reg_ins.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#alumno_new_ok').html(data);
$(document).scrollTop( $("#alumno_new_ok").offset().top-150 );  
reg_dentro2();
}
});
return false;}
function a_inscribir_alumno_reg(id_alumno){
$('#inscribir_observaciones').modal('show');
$("#inscribir_observaciones #id_alumnor").val( id_alumno );
$("#eliminar_alumno #id_alumnor_e").val('');
$("#formalizar_alumno #id_alumnor_f").val('');}

function alu_usu_ok(){$('#spinner_back_usu').fadeOut(500, function(){$('#reg_usu_new').fadeIn(500);});}
function a_eliminar_alumno_reg(id_alumno){
$('#eliminar_alumno').modal('show');
$("#eliminar_alumno #id_alumnor_e").val( id_alumno );
$("#inscribir_observaciones #id_alumnor").val('');
$("#formalizar_alumno #id_alumnor_f").val('');}

function confirmar_eliminar(id_alumno){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_alu_reg_eli.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#alumno_new_ok').html(data);
$(document).scrollTop( $("#alumno_new_ok").offset().top-150 );  
reg_dentro2();
}
});
return false;}

function confirmar_formalizar(){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_metodos_pago.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#metodosPago').html(data); 
$( "#bot_preinscribir" ).prop( "disabled", false );	
var $active = $('.wizard .nav-tabs li.active');
$active.next().removeClass('disabled');
nextTab($active);
$(document).scrollTop( $("#arriba").offset().top );
}
});
return false;}
function ap_descuento(){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_descuento.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#check_descuento').html(data); 
}
});
return false;}
function confirmar_formalizar_n(){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_metodos_pago.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#metodosPago').html(data); 
$( "#bot_preinscribir" ).prop( "disabled", false );	
//desactiva2();
activa();
$(document).scrollTop( $("#arriba").offset().top );
}
});
return false;}
function a_formalizar_alumno_reg(id_alumno, id_programa){
$('#formalizar_alumno').modal('show');
$("#formalizar_alumno #id_alumnor_f").val( id_alumno );
$("#formalizar_alumno #id_programa_f").val( id_programa );
$("#id_programa_desc").val( id_programa );
$("#inscribir_observaciones #id_alumnor").val('');
$("#eliminar_alumno #id_alumnor_e").val('');}
function a_pdf_presupuesto(programa){window.location.href = "web/pr_pdf_preins.asp?id_programa="+programa;}
<%if session("id_usuario")<>"" then%>
reg_dentro();
$("#usuario_reg").hide();
$( "#bot_inscribir_new" ).show();
$("#usuario_reg").slideToggle( "slow" );
<%end if%>
function volver_listado(){var body = $("html, body");body.stop().animate({scrollTop:300}, '500', 'swing', function() { });}
function dis_boton_preins(){$("#bot_preinscribir" ).prop( "disabled", true );}
function desadjunta_nif(){
document.getElementById("a_nif_adj").value = "";
$("#nif_doc").html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='17' viewBox='0 0 20 17'><path d='M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z'/></svg> <span  class='spanea' id='nif_del'>Adjunta tu NIF </span>");
$(".desadjuntar_nif").css( "visibility","hidden" );
$('#nif_doc').tooltip('destroy');}
function desadjunta_pas(){
document.getElementById("a_pass_adj").value = "";
$("#pas_doc").html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='17' viewBox='0 0 20 17'><path d='M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z'/></svg> <span  class='spanea' id='pas_del'>Adjunta tu pasaporte escaneado </span>");
$(".desadjuntar_pas").css( "visibility","hidden" );
$('#pas_doc').tooltip('destroy');}
function acp_condiciones(){
if (document.getElementById("acp_condiciones").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar las condiciones de contratación.');$('#alerta_tit').html('Aceptar condiciones de contratación.');$('#alerta').modal('show');return (false)}}
function acp_info(){
if (document.getElementById("acp_info").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function paso_fin(){
if (!acp_condiciones()) return;
if (!acp_info()) return;
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.f_reserva.submit(); }, 0);});
return;}
function res_programa(){$("#id_programar").val('');ya_registrado();}
function desactiva_0(){$("#id_programa_f").val('');$("#id_programar").val('');}//desactiva();
function activa(){$("#nxt_step_2" ).prop( "disabled", false );}
function desactiva(){$("#nxt_step_2" ).prop( "disabled", true );}
function activa2(){$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Para continuar el proceso debes clicar en "Siguiente paso". Si no la reserva no quedará formalizada.');$('#alerta_tit').html('Continua el proceso de reserva.');$('#alerta').modal('show');$('#nxt_step_3').fadeIn("slow");activa();}
$(".met_pago").click(function(){$('#nxt_step_3').fadeIn("slow");activa();});
function desactiva2(){$('#nxt_step_3').fadeOut("slow");activa();}
function activa3(){$('#bot_inscribir_new').show();}
function desactiva3(){$('#bot_inscribir_new').hide();}
function activa4(){$( "#bot_inscribir_new" ).show();$('.men_usu').fadeIn();$('#no_autorizado').hide();}
function activa5(){$( "#no_autorizado" ).show(); $( "#bot_inscribir_new" ).hide();$('.men_usu').fadeIn();}
function desactiva4(){$( "#bot_inscribir_new" ).show();}
function ya_registrado(){$("#ya_registrado").fadeOut('slow');}
function desactiva_01(){$("#pro_pago").hide();$("#pro_pago_opt").hide();}
function activa_01(){$("#pro_pago").show();$("#pro_pago_opt").show();}
//if ('addEventListener' in document) {document.addEventListener('DOMContentLoaded', function() {FastClick.attach(document.body);}, false);}/////////////// CLICK MÁS RÁPIDO EN IPADS...
<%if session("ag_autorizado")="no" then%>activa5();<%end if%>
</script>