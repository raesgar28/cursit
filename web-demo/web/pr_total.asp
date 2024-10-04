<%rd="../"
id_item=request("id_item")
id_curso=request("curso")
alojamiento=request("alojamiento")
if alojamiento<>""then
alojamiento = Split(alojamiento, "|")
id_alo_opcion= alojamiento(0)
id_alojamiento = alojamiento(1)
end if
id_categoria=request("id_categoria")
s_fecha=request("salida_fecha")
s_mes=request("salida_mes")
id_quincena=request("salida_quincena")
aero_ob=request("aero_ob")
aeropuerto=request("aeropuerto")
if aeropuerto<>"" then
aeropuerto = Split(aeropuerto, "|")
id_aeropuerto= aeropuerto(0)
aeropuerto_mes = aeropuerto(1)
id_itemSubAero=aeropuerto(2)
end if%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<%if aeropuerto_mes<>"" and IsNumeric(aeropuerto_mes) and IsNumeric(id_itemSubAero) Then
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
next%>
<h4 class="h4_presupuesto"><i class="fa fa-calculator" aria-hidden="true"></i> Presupuesto <i class="fa fa-arrow-down" aria-hidden="true" style="float:right"></i></h4>
<%Sql= "SELECT titulo_esp, codPrivado, privado, gestion_aeropuertos,pre_medida,format_sem FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
privado=ob_rs("privado")
codPrivado=ob_rs("codPrivado")
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
pre_medida=ob_rs("pre_medida")
format_sem=ob_rs("format_sem")%>
<span class="pres_concepto"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close
if id_curso<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin, con_examen, salidas FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_inicio")
f_fin_p=ob_rs("f_fin")
con_examen=ob_rs("con_examen")
salidas=ob_rs("salidas")%>
<span class="pres_concepto"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close
end if
if id_itemSubAero<>""then
Sql= "SELECT f_salida, f_fin, mes FROM itemsSubAero WHERE id_itemSubAero="&id_itemSubAero&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_salida")
if f_fin_p="" or IsNull(f_fin_p) or f_fin_p="01/01/1000" then f_fin_p=ob_rs("f_fin") end if
mes=ob_rs("mes")
'if f_fin_p="" then f_fin=ob_rs("f_fin") end if
end if
ob_rs.close
end if
if semanas<>""then%>
<span class="pres_concepto"><i class="fa fa-calendar" aria-hidden="true" style="margin-right:5px"></i> 
<%if semanas=12 then%>Trimestre escolar.<%end if%>
<%if semanas=16 then%>Cuatrimestre escolar.<%end if%>
<%if semanas=24 then%>Semestre escolar.<%end if%>
<%if semanas=52 then%>Año escolar.<%end if%>
<%if semanas<>12 and semanas<>24 and semanas<>52then%>
<%=semanas%> semana<%if semanas>1then%>s<%end if%>
<%end if%>
</span>
<%end if
if id_quincena<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin FROM quincenas WHERE id_quincena="&id_quincena&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if f_inicio="" or f_inicio="01/01/1000" then  f_inicio=ob_rs("f_inicio") end if%>
<span class="pres_concepto"><i class="fa fa-calendar-check-o" aria-hidden="true" style="margin-right:5px"></i> <%=ob_rs("titulo_esp")%></span>
<%end if
ob_rs.close
end if
if aeropuerto_mes<>"" and not IsNumeric(aeropuerto_mes) and id_quincena="" then%>
<span class="pres_concepto"><i class="fa fa-calendar-check-o" aria-hidden="true" style="margin-right:5px"></i> <%=aeropuerto_mes%> </span>
<%end if
if f_inicio<>"" and f_inicio<> "01/01/1000" then
if salidas="salida_quincenas" then
if id_quincena<>"" then%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_inicio%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
<%end if
else
if salidas<>"salida_dias" and salidas<>"salida_fecha" then%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_inicio%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
<%end if
end if
end if
if f_fin<>"" and f_fin<> "01/01/1000" and salidas<>"salida_dias" and salidas<>"salida_fecha" then
if semanas<>"" then
dias=semanas*7
f_fin=cdate(f_inicio)+dias
end if
if id_quincena<>"" or gestion_aeropuertos="si" or gestion_grupos="si" then
dias=semanas*7
if f_fin_p<>"" and f_fin_p<>"01/01/1000" and IsDate (f_fin_p) then f_fin=f_fin_p else f_fin=cdate(f_inicio)+dias end if%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
<%end if
end if
if s_fecha<>""then
if s_fecha<>"" and s_fecha<> "01/01/1000"then%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=s_fecha%> (salida) <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:10px"></i></span>
<%end if
if semanas<>"" and format_sem<>"si" then
dias=semanas*7
f_fin=cdate(s_fecha)+dias-1'(-1 ES NUEVA MOVIDA)%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
<%end if
end if
if (f_fin="" or f_fin="01/01/1000") and f_inicio<>"01/01/1000" and semanas <>"" and (id_quincena<>"" or mes<>"")then
dias=semanas*7
if f_fin_p<>"" and f_fin_p<>"01/01/1000" and IsDate (f_fin_p) then f_fin=f_fin_p else f_fin=cdate(f_inicio)+dias end if%>
<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>
<%end if
'if id_curso<>""then
'Sql= "SELECT id_rel FROM rel WHERE id_itemSub ="&id_curso&" and id_itemSubAero<>0 "
'Set Ob_RS = Server.CreateObject("ADODB.Recordset")
'Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
'if not ob_rs.eof then
'gestion_grupos="si"
'end if
'ob_rs.close
'if s_fecha="" and gestion_grupos="si" then
'if semanas<>"" then
'dias=semanas*7
'f_fin=cdate(f_inicio)+dias
'if f_inicio<>"01/01/1000"then%>
<!--<span class="pres_concepto"><i class="fa fa-calendar-o" aria-hidden="true" style="margin-right:5px"></i> <%'=f_fin%> (regreso) <i class="fa fa-arrow-left" aria-hidden="true"></i></span>-->
<%'end if
'end if
'end if
'end if
if semanas<>"" and id_curso <>"" then
Sql= "SELECT precio FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas="&semanas&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
precio_cur=ob_rs("precio")*fluctuacion_c
fecha_inicio_f=month(f_inicio)&"/"&day(f_inicio)&"/"&year(f_inicio)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql2= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE id_itemSub="&id_curso&" AND rel.id_suplemento<>0  AND rel.id_suplemento=preciosSUplementos.id_suplemento AND rel.id_alojamiento=0 AND((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if s_fecha<>""and s_fecha<>"01/01/1000"then f_inicio=s_fecha end if
if cdate(f_inicio)>=ob_rs2("fecha_inicio") and cdate(f_fin)<=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(f_fin) ) end if
if cdate(f_inicio)>=ob_rs2("fecha_inicio") and cdate(f_fin)>=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(ob_rs2("fecha_fin")) ) end if
if cdate(f_inicio)<=ob_rs2("fecha_inicio") and cdate(f_fin)<=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs2("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(f_inicio)<=ob_rs2("fecha_inicio") and cdate(f_fin)>=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs2("fecha_inicio")) ,cdate(ob_rs2("fecha_fin")) )end if
precio_sup_dia=ob_rs2("precio")/7
precio_sup=(total_dias*precio_sup_dia)*fluctuacion_c
precio_cur=precio_cur+precio_sup
if precio_sup<>0 then%><span class="pres_concepto"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%=FormatNumber(ccur(precio_sup),2)%>&nbsp;<%=mon%> (sup.temporada)</span>
<%end if%>
<%end if
ob_rs2.close%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if ob_rs("precio")<>0 then%><%=FormatNumber(ccur(precio_cur),2)%>&nbsp;<%=mon%><%end if%></span>
<%else 'SE HA ELEGID SEM EXTRA
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

'OJO /////////////////////////////////////////////////////////////////////////////
if s_fecha<>""then fecha_inicio_f=month(s_fecha)&"/"&day(s_fecha)&"/"&year(s_fecha) else fecha_inicio_f="01/01/1000" end if
'OJO /////////////////////////////////////////////////////////////////////////////

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
precio_cur=precio_cur+precio_sup%>
<span class="pres_concepto"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if precio_sup<>0 then%><%=FormatNumber(ccur(precio_sup),2)%>&nbsp;<%=mon%> (sup.temporada)<%end if%></span>
<%end if
ob_rs3.close%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if precio_cur<>0 then%><%=FormatNumber(ccur(precio_cur),2)%>&nbsp;<%=mon%><%end if%> </span>
<%end if
ob_rs2.close
end if
ob_rs.close
end if
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
<span class="pres_concepto"><i class="fa fa-bed" aria-hidden="true" style="margin-right:5px"></i> <%=ob_rs2("titulo_esp")%></span>
<%if s_fecha<>""and s_fecha<>"01/01/1000"then f_inicio=s_fecha end if
fecha_inicio_f=month(f_inicio)&"/"&day(f_inicio)&"/"&year(f_inicio)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql3= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE rel.id_suplemento<>0  AND rel.id_suplemento=preciosSuplementos.id_suplemento AND rel.id_alojamiento<>0 AND rel.id_alojamiento="&id_alojamiento&" AND ((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(f_fin) ) end if
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(ob_rs3("fecha_fin"))) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(ob_rs3("fecha_fin")))end if
precio_sup_dia=ob_rs3("precio")/7
total_dias=total_dias+1'MOVIDA ELENA SUMAR UN DIA AL SUPLEMENTO
precio_sup_alo=(total_dias*precio_sup_dia)*fluctuacion_a
precio_alo=precio_alo+precio_sup_alo%>
<span class="pres_concepto"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if precio_sup_alo<>0 then%><%=FormatNumber(ccur(precio_sup_alo),2)%>&nbsp;<%=mon%> (sup.temporada)<%end if%></span>
<%end if
ob_rs3.close
if tasas_concepto<>0then
tasas_concepto=tasas_concepto*fluctuacion_a
precio_alo=precio_alo+tasas_concepto%>
<span class="pres_concepto"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if tasas_concepto<>0 then%><%=FormatNumber(ccur(tasas_concepto),2)%>&nbsp;<%=mon%> <span class="pre_concepto_p">(tasas <%=alo_concepto%>)</span><%end if%></span>
<%end if
if tasas_opciones<>0then
tasas_opciones=tasas_opciones*fluctuacion_a
precio_alo=precio_alo+tasas_opciones%>
<span class="pres_concepto"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if tasas_opciones<>0 then%><%=FormatNumber(ccur(tasas_opciones),2)%>&nbsp;<%=mon%> <span class="pre_concepto_p">(tasas <%=alo_opcion%>)</span><%end if%></span>
<%end if%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if precio_alo<>0 then%><%=FormatNumber(ccur(precio_alo),2)%>&nbsp;<%=mon%><%end if%></span>
<%end if
ob_rs2.close
end if
ob_rs.close
end if
if id_aeropuerto<>""then
Sql= "SELECT ciudad FROM aeropuertos WHERE id_aeropuerto="&id_aeropuerto&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<span class="pres_concepto"><i class="fa fa-plane" aria-hidden="true" style="margin-right:10px"></i> <%=ob_rs("ciudad")%> <%if aeropuerto_mes<>""then%><i class="fa fa-share" aria-hidden="true" style="margin-left:9px;margin-right:9px;"></i><%=aeropuerto_mes%><%end if%></span>
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
<span class="pres_concepto"><i class="fa fa-bus" aria-hidden="true" style="margin-right:10px"></i> <%=ob_rs("opcion_esp")%> <%if ob_rs("opcion_pre")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("opcion_pre")),2)%>&nbsp;<%=mon%></span><%end if%></span>
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
<span class="pres_concepto"><i class="fa fa-user-md" aria-hidden="true" style="margin-right:10px"></i> Seguro médico <%if ob_rs("pr_medico")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("pr_medico"))*semanas,2)%>&nbsp;<%=mon%></span><%end if%></span> 
<%end if
if pr_cancelacion="si"then
pr_cancelacion_pr=ob_rs("pr_cancelacion")
if id_categoria<>""then
Sql2= "SELECT seg_cancelacion FROM categorias WHERE id_categoria="&id_categoria&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then seg_cancelacion=ob_rs2("seg_cancelacion") end if
end if%>
<span class="pres_concepto">
<%if seg_cancelacion<>""then%><a href="javascript:seg_cancelacion();"><i class="fa fa-external-link" aria-hidden="true" style="margin-right:10px"></i>Seguro cancelación </a><%else%>
<i class="fa fa-ban" aria-hidden="true" style="margin-right:10px"></i>Seguro cancelación <%end if%>
<%if ob_rs("pr_cancelacion")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("pr_cancelacion")),2)%>&nbsp;<%=mon%></span><%end if%></span>
<%end if
if tasas_aerop="si"then
tasas_aerop_pr=ob_rs("tasas_aerop")%>
<span class="pres_concepto"><i class="fa fa-paper-plane" aria-hidden="true" style="margin-right:5px"></i> Tasas aeropuerto <%if ob_rs("tasas_aerop")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("tasas_aerop")),2)%>&nbsp;<%=mon%></span><%end if%></span>
<%end if
if pr_examen="si"then
pr_examen_pr=ob_rs("pr_examen")%>
<span class="pres_concepto"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right:7px"></i> <%if con_examen<>""then%><%=con_examen%><%else%>Examen<%end if%> <%if ob_rs("pr_examen")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("pr_examen")),2)%>&nbsp;<%=mon%></span><%end if%></span>
<%end if
if pr_gestion_bill="si"then
pr_gestion_bill_pr=ob_rs("pr_gestion_bill")%>
<span class="pres_concepto"><i class="fa fa-ticket" aria-hidden="true" style="margin-right:7px"></i> Gestión billete avión <%if ob_rs("pr_gestion_bill")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("pr_gestion_bill")),2)%>&nbsp;<%=mon%></span><%end if%></span>
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
<span class="pres_concepto"><i class="fa fa-check-square-o" aria-hidden="true" style="margin-right:7px"></i> <%=ob_rs("opcion_esp")%> <%if ob_rs("opcion_pre")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("opcion_pre")),2)%>&nbsp;<%=mon%></span><%end if%></span>
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
<span class="pres_concepto"><i class="fa fa-check-square-o" aria-hidden="true" style="margin-right:7px"></i> <%=ob_rs("opcion_esp")%> <%if ob_rs("opcion_pre")<>0 then%><span style="float:right;"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px;margin-left:10px;"></i><%=FormatNumber(ccur(ob_rs("opcion_pre")),2)%>&nbsp;<%=mon%></span><%end if%></span>
<%end if
ob_rs.close
end if
next
total_opciones=pr_medico_pr+pr_cancelacion_pr+tasas_aerop_pr+pr_examen_pr+pr_gestion_bill_pr+opciones_programa+opciones_cursos
if total_opciones<>0 and total_opciones<>""then%>
<span class="pres_concepto pre_precio"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> <%if total_opciones<>0 then%><%=FormatNumber(ccur(total_opciones),2)%>&nbsp;<%=mon%><%end if%></span>
<%end if
suma_total=total_opciones+precio_cur+precio_alo%>
<%if suma_total<>0then%><div class="suma_total_total"><i class="fa fa-calculator" aria-hidden="true" style="margin-right:5px"></i> Total: <%if pre_medida="si"then%> <span class="" style="font-size:0.8em;color:#999">desde*&nbsp;&nbsp;</span><%end if%><%=FormatNumber(ccur(suma_total),2)%>&nbsp;<%=mon%></div><div class="clearfix"></div><%end if%>
<%if privado="si"then%>
<input type="hidden" name="privado" id="privado" value="<%=privado%>">
<div class="col-md-12 form-group" style="padding:0px;padding-top:8px"><i class="fa fa-key" aria-hidden="true"></i><input type="text" placeholder="Código*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código*'" class="form-control c-square c-theme input-lg inp" name="codPrivado" id="codPrivado"></div>
<%end if%>
<%if request("cod_ko")="si"then%><div class="cod_mal"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Código erróneo</div><%end if%>
<button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right" onClick="<%if privado="si"then%>Enviar_reserva_cod();<%else%>Enviar_reserva();<%end if%>">Siguiente Paso <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:8px"></i>
</button>
<style>
.form-group .fa{position:absolute;text-indent:12px;margin-top:12px;font-size:1.3em;color:#ddd;z-index:3}
.form-group label .fa{position:relative;text-indent:0px;margin-top:0px;font-size:1.3em;color:#ddd;z-index:3}
.inp {text-indent:30px;}
</style>