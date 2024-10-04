<%rd="../"
id_item=request("id_item")
Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<%id_item=request("id_item")
if id_item<>"" and id_item<>0 then
Sql= "SELECT rel.id_archivo, rel.id_item, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_item="&id_item&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
end if
ob_rs.close
Sql= "SELECT * FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
escuela_tam=ob_rs("escuela_tam")
alo_fam=ob_rs("alo_fam")
alo_res=ob_rs("alo_res")
alo_apa=ob_rs("alo_apa")
wifi=ob_rs("wifi")
tel_24=ob_rs("tel_24")
vuelo=ob_rs("vuelo")
c_inten=ob_rs("c_inten")
c_semi=ob_rs("c_semi")
c_gene=ob_rs("c_gene")
monitor=ob_rs("monitor")
privado=ob_rs("privado")
pr_actualizado=ob_rs("pr_actualizado")
anyo_actualizado=ob_rs("anyo_actualizado")
oferta=ob_rs("oferta")
campamento=ob_rs("campamento")
moneda=ob_rs("moneda")
ejecutivos=ob_rs("ejecutivos")
alo_hot=ob_rs("alo_hot")
multialumno=ob_rs("multialumno")
pre_medida=ob_rs("pre_medida")
seg_medico=ob_rs("seg_medico")
material=ob_rs("material")
uniforme=ob_rs("uniforme")
function safeSTR(str)
dim output
output = str
output = replace( output,"&acute;","" ) '"
output = replace( output, "&aacute;","a" ) '"
output = replace( output, "&eacute;","e"  ) '"
output = replace( output,"&iacute;","i"  ) '"
output = replace( output,"&oacute;","o"  ) '"
output = replace( output,"&uacute;","u"  ) '"
output = replace( output, "&Aacute;","A"  ) '"
output = replace( output,"&Eacute;","E"  ) '"
output = replace( output, "&Iacute;","I"  ) '"
output = replace( output,"&Oacute;","O"  ) '"
output = replace( output,"&Uacute;","U"  ) '"
output = replace( output,"&ntilde;","n"  ) '"
output = replace( output,"&Ntilde;","N"  ) '"
output = replace( output,"&#96;",""  ) '"
output = replace( output,"&agrave;","a"  ) '"
output = replace( output,"&egrave;","e"  ) '"
output = replace( output,"&igrave;","i"  ) '"
output = replace( output,"&ograve;","o"  ) '"
output = replace( output, "&ugrave;","u"  ) '"
output = replace( output,"&uuml;","u"  ) '"
output = replace( output,"&Uuml;","U"  ) '"
output = replace( output,"&iquest;",""  ) '"
output = replace( output,chr(34),""  ) '"
output = replace( output,"&#34;",""  ) '"
output = replace( output,"&#39;",""  )  '
output = replace( output,"&#63;",""  ) '?
output = replace( output,"&ordf;",""  ) '?
output = replace( output,"&deg;",""  ) '?
output = replace( output," ","-"  ) 
safeSTR= output
end function
nombre_pdf=safeSTR(ob_rs("titulo_esp"))
Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument 
Set Page = Doc.Pages.Add
Set Font = Doc.Fonts("Helvetica")
str = "<HTML>"
str = str& "<table style=""width:670px;""><tr><td valign=""top""><IMG SRC="""&Server.MapPath(rd&"web/lib/img/logos/logo_pdf.png")&""" width=""105""></td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#666""><b>Oficina Valencia</b><br>c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>sat@cursit.com</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#666"">-</td></tr></table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:35px;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">"&ob_rs("titulo_esp")&"</div>"
if ruta_banner<>""then
str = str& "<div style=""margin-bottom:35px;height:150px;overflow:hidden;""><IMG SRC="""&Server.MapPath(ruta_banner)&""" style=""width:670px;height:auto;""></div>"
end if
str = str& "<div style=""font-family:arial;color:#333;font-size:0.7em;text-align:justify;"">"&ob_rs("texto_esp")&"</div>"
if ob_rs("tab_1_act")="si" and ob_rs("tab_1_texto_esp")<>"" then
str = str& "<div style=""border-bottom:1px solid #32C5D2;width:670px;height:4px;margin-bottom:35px;margin-top:35px;""></div>"
str = str& "<table style=""width:670px;""><tr><td valign=""top"" style=""width:30%""><div style=""font-family:arial;color:#32C5D2;font-size:1.3em;text-align:right;padding-right:50px"">"&ob_rs("tab_1_titulo_esp")&"</div></td><td style=""text-align:justify;font-size:0.7em;font-family:arial;color:#666""><div style="""">"&ob_rs("tab_1_texto_esp")&"</div></td></tr></table>"
end if
if ob_rs("tab_2_act")="si" and ob_rs("tab_2_texto_esp")<>"" then
str = str& "<div style=""border-bottom:1px solid #32C5D2;width:670px;height:4px;margin-bottom:35px;margin-top:35px;""></div>"
str = str& "<table style=""width:670px;""><tr><td valign=""top"" style=""width:30%""><div style=""font-family:arial;color:#32C5D2;font-size:1.3em;text-align:right;padding-right:50px"">"&ob_rs("tab_2_titulo_esp")&"</div></td><td style=""text-align:justify;font-size:0.7em;font-family:arial;color:#666""><div style="""">"&ob_rs("tab_2_texto_esp")&"</div></td></tr></table>"
end if
if ob_rs("tab_3_act")="si" and ob_rs("tab_3_texto_esp")<>"" then
str = str& "<div style=""border-bottom:1px solid #32C5D2;width:670px;height:4px;margin-bottom:35px;margin-top:35px;""></div>"
str = str& "<table style=""width:670px;""><tr><td valign=""top"" style=""width:30%""><div style=""font-family:arial;color:#32C5D2;font-size:1.3em;text-align:right;padding-right:50px"">"&ob_rs("tab_3_titulo_esp")&"</div></td><td style=""text-align:justify;font-size:0.7em;font-family:arial;color:#666""><div style="""">"&ob_rs("tab_3_texto_esp")&"</div></td></tr></table>"
end if
if ob_rs("tab_4_act")="si" and ob_rs("tab_4_texto_esp")<>"" then
str = str& "<div style=""border-bottom:1px solid #32C5D2;width:670px;height:4px;margin-bottom:35px;margin-top:35px;""></div>"
str = str& "<table style=""width:670px;""><tr><td valign=""top"" style=""width:30%""><div style=""font-family:arial;color:#32C5D2;font-size:1.3em;text-align:right;padding-right:50px"">"&ob_rs("tab_4_titulo_esp")&"</div></td><td style=""text-align:justify;font-size:0.7em;font-family:arial;color:#666""><div style="""">"&ob_rs("tab_4_texto_esp")&"</div></td></tr></table>"
end if
if ob_rs("tab_5_act")="si" and ob_rs("tab_5_texto_esp")<>"" then
str = str& "<div style=""border-bottom:1px solid #32C5D2;width:670px;height:4px;margin-bottom:35px;margin-top:35px;""></div>"
str = str& "<table style=""width:670px;""><tr><td valign=""top"" style=""width:30%""><div style=""font-family:arial;color:#32C5D2;font-size:1.3em;text-align:right;padding-right:50px"">"&ob_rs("tab_5_titulo_esp")&"</div></td><td style=""text-align:justify;font-size:0.7em;font-family:arial;color:#666""><div style="""">"&ob_rs("tab_5_texto_esp")&"</div></td></tr></table>"
end if
if ob_rs("tab_6_act")="si" and ob_rs("tab_6_texto_esp")<>"" then
tab6_tit=ob_rs("tab_6_titulo_esp")
tab6_txt=ob_rs("tab_6_texto_esp")
tab6="si"
end if
ob_rs.close
Sql= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&id_item&" and id_itemSub <>0 "                  '  PRECIOS RESERVA
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tabla="on"
end if
ob_rs.close
if tabla="on"then
str = str& "<br style=""page-break-before: always"">"
str = str& "<div style=""margin-top:0px;border-bottom:1px solid #32C5D2;margin-bottom:35px;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">Cursos disponibles</div>"
str = str& " <table style=""font-family:arial;width:95%;font-size:0.9em"" align=""center"" >"
str = str& " <thead>"
str = str& " <tr style=""color:#32C5D2"">"
str = str& " <th style=""width:240px;""><div style=""padding:10px;text-align:right"">Cursos / Semanas</div></th>"
Dim col(53), sem(53)'VAMOS A SACAR COLUMNAS
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
if sem(t)<>53then
str = str& "<th>"
if t=12then
str = str& "Trimestre escolar."
end if
if t=16then
str = str& "Cuatrimestre escolar."
end if
if t=24then
str = str& "Semestre escolar."
end if
if t=52then
str = str& "Año escolar"
end if
if t<>12 and t<>24 and t<>52 then
str = str& ""&sem(t)&" sem."
end if
str = str& "</th>"
else
str = str& "<th>"
str = str& "Sem. Extra"
str = str& "</th>"
end if
end if
next
str = str& "</tr>"
str = str& "</thead>"
str = str& "<tbody  style=""text-align:center"">"
Sql= "SELECT rel.id_item, rel.id_itemSub, itemsSub.id_itemSub, itemsSub.titulo_esp FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub <>0 and rel.id_itemSub=itemsSub.id_itemSub ORDER BY itemsSub.orden_curso" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
fondo="#fafafa"
do while not ob_rs.eof
str = str& "<tr style=""background:"&fondo&";"">"
str = str& "<td  style=""text-align:right""><div style=""padding:10px;"">"&ob_rs("titulo_esp")&"</div></td>"
for t=1 to 53
if col(t)="on" and t=sem(t) then
str = str& "<td><div style=""padding:10px;text-align:right;"">"
Sql2= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs("rel.id_itemSub")&" and itemsSubSemanas.id_itemSubSemana<>0 and itemsSubSemanas.id_itemSubSemana = rel.id_itemSubSemana and itemsSubSemanas.semanas="&t&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if t<>53 then
str = str& ""&FormatNumber(ccur(ob_rs2("precio")*fluctuacion_c),2)&"&nbsp;"&mon_pdf&""
else
str = str& ""&FormatNumber(ccur(ob_rs2("precio")*fluctuacion_c),2)&"&nbsp;"&mon_pdf&""
end if
else
str = str& "-"
end if
ob_rs2.close
str = str& "</div></td>"
end if
next
str = str& "</tr>"
if fondo="#FFFFFF" then 
fondo="#fafafa"
else
if fondo="#fafafa" then 
fondo="#FFFFFF"
end if
end if
ob_rs.movenext
loop
end if
ob_rs.close
str = str& "</tbody>"
str = str& "</table>"
end if '                  FIN PRECIOS RESERVA
Sql= "SELECT id_item, id_alojamiento FROM rel WHERE id_item="&id_item&" and id_alojamiento <>0 "                  '  PRECIOS ALOJAMIENTOS
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then tabla_alo="on" end if
ob_rs.close
if tabla_alo="on"then
str = str& "<div style=""margin-top:25px;margin-bottom:35px;border-bottom:1px solid #32C5D2;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">Alojamientos disponibles<div style=""font-size:0.5em;color:#ccc;display:block;height:30px;width:100%;font-family:arial;"">*precios por semana</div></div>"
Sql= "SELECT rel.id_alo_tipo, alo_tipo.titulo_esp, alo_tipo.orden FROM rel, alo_tipo WHERE id_item="&id_item&" and rel.id_alo_tipo<>0 and rel.id_alo_tipo=alo_tipo.id_alo_tipo and rel.id_alojamiento <> 0 GROUP BY rel.id_alo_tipo, alo_tipo.titulo_esp, alo_tipo.orden ORDER BY alo_tipo.orden"           
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
str = str& "<table style=""font-family:arial;width:95%;font-size:0.9em"" align=""center"" >"
str = str& "<thead>"
str = str& "<tr style=""color:#32C5D2"">"
str = str& "<th style=""width:240px;""><div style=""padding:10px;text-align:right"">"&ob_rs("titulo_esp")&"</div></th>"
Sql2= "SELECT alo_op.titulo_esp, texto_esp FROM rel, alo_op WHERE rel.id_item="&id_item&" and alo_op.id_alo_op=rel.id_alo_op and rel.id_alojamiento<>0 and rel.id_alo_tipo<> 0 and rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" GROUP BY alo_op.id_alo_op, alo_op.titulo_esp,alo_op.orden, texto_esp ORDER BY alo_op.orden"               
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof 
str = str& "<th>"&ob_rs2("titulo_esp")&"</th>"
ob_rs2.movenext
loop
end if
ob_rs2.close
str = str& "</tr>"
str = str& "</thead>"
str = str& "<tbody>"
Sql2= "SELECT rel.id_alojamiento, alo_conceptos.titulo_esp, texto_esp FROM rel, alo_conceptos WHERE rel.id_item="&id_item& " and rel.id_alojamiento<>0 and rel.id_alojamiento=alo_conceptos.id_alojamiento and rel.id_alo_tipo<> 0 and rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" and alo_conceptos.tipo_alo="&ob_rs("id_alo_tipo")&" and rel.id_alo_opcion=0 and rel.id_suplemento=0 GROUP BY alo_conceptos.tipo_alo, rel.id_alojamiento, rel.id_alo_tipo, alo_conceptos.titulo_esp, rel.id_rel, alo_conceptos.orden, texto_esp ORDER BY alo_conceptos.orden"    
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
fondo="#fafafa"
do while not ob_rs2.eof 
str = str& "<tr style=""background:"&fondo&";"">"
str = str& "<td style=""width:240px;""><div style=""padding:10px;text-align:right"">"&ob_rs2("titulo_esp")&"</div></td>"
Sql3= "SELECT alo_op.titulo_esp, alo_op.id_alo_op FROM rel, alo_op WHERE rel.id_item="&id_item&" and alo_op.id_alo_op=rel.id_alo_op and rel.id_alo_tipo<> 0 and rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" GROUP BY alo_op.id_alo_op, alo_op.titulo_esp,alo_op.orden ORDER BY alo_op.orden"               
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof 
Sql4= "SELECT alo_opciones.precio, alo_opciones.id_alo_opcion FROM rel, alo_opciones WHERE id_item="&id_item&" AND rel.id_alo_op="&ob_rs3("id_alo_op")&" AND rel.id_alo_opcion=alo_opciones.id_alo_opcion AND id_alojamiento="&ob_rs2("id_alojamiento")&" AND alo_opciones.op_alo="&ob_rs3("id_alo_op")&""               
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof
str = str& "<td style=""text-align:center"">"&FormatNumber(ccur(ob_rs4("precio")*fluctuacion_a),2)&"&nbsp;"&mon_pdf&"</td>"
ob_rs4.movenext
loop
else
str = str& "<td>-</td>"
end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close
str = str& "</tr>"
ob_rs2.movenext
if fondo="#FFFFFF" then 
fondo="#fafafa"
else
if fondo="#fafafa" then 
fondo="#FFFFFF"
end if
end if
loop
end if
ob_rs2.close
str = str& "</tbody>"
str = str& "</table>"
ob_rs.movenext
loop
end if
ob_rs.close
end if '                  FIN PRECIOS ALOJA
'OPCIONES
Sql= "SELECT pr_medico, pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob FROM items WHERE items.id_item="&id_item&" AND (pr_medico_ob='si' OR pr_cancelacion_ob='si' OR tasas_aerop_ob='si')"                  '  PRECIOS ALOJAMIENTOS
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then tabla_opciones1="si" end if
ob_rs.close
Sql= "SELECT id_item, rel.id_itemOp, itemsOp.id_itemOp, opcion_esp,opcion_pre,opcion_ob FROM rel,itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp=itemsOp.id_itemOp AND opcion_ob='si' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then tabla_opciones2="si" end if
ob_rs.close
if tabla_opciones1="si" or tabla_opciones2="si" then
str = str& "<div style=""margin-top:55px;border-bottom:1px solid #32C5D2;margin-bottom:35px;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">Otros</div>"
str = str& "<table style=""width:670px;"">"
Sql= "SELECT pr_medico, pr_medico_ob,pr_cancelacion,pr_cancelacion_ob,tasas_aerop,tasas_aerop_ob FROM items WHERE items.id_item="&id_item&" AND (pr_medico_ob='si' OR pr_cancelacion_ob='si' OR tasas_aerop_ob='si')"                  '  PRECIOS ALOJAMIENTOS
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if ob_rs("pr_medico_ob")="si" and  ob_rs("pr_medico") <> 0 and  ob_rs("pr_medico") <>"" then
str = str& "<tr>"
str = str& "<td valign=""top"" style=""width:30%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">Seguro m&eacute;dico:</td>"
str = str& "<td valign=""top"" style=""width:1%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">"&FormatNumber(ccur(ob_rs("pr_medico")),2)&"&nbsp;"&mon_pdf&"</td>"
str = str& "</tr>"
end if
if ob_rs("pr_cancelacion_ob")="si" and  ob_rs("pr_cancelacion") <> 0 and  ob_rs("pr_cancelacion") <>"" then
str = str& "<tr>"
str = str& "<td valign=""top"" style=""width:30%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">Seguro cancelaci&oacute;n:</td>"
str = str& "<td valign=""top"" style=""width:1%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">"&FormatNumber(ccur(ob_rs("pr_cancelacion")),2)&"&nbsp;"&mon_pdf&"</td>"
str = str& "</tr>"
end if
if ob_rs("tasas_aerop_ob")="si" and  ob_rs("tasas_aerop") <> 0 and  ob_rs("tasas_aerop") <>"" then
str = str& "<tr>"
str = str& "<td valign=""top"" style=""width:30%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">Tasas aeropuerto:</td>"
str = str& "<td valign=""top"" style=""width:1%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">"&FormatNumber(ccur(ob_rs("tasas_aerop")),2)&"&nbsp;"&mon_pdf&"</td>"
str = str& "</tr>"
end if
end if
ob_rs.close
Sql= "SELECT id_item, rel.id_itemOp, itemsOp.id_itemOp, opcion_esp,opcion_pre,opcion_ob FROM rel,itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp=itemsOp.id_itemOp AND opcion_ob='si' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
str = str& "<tr>"
str = str& "<td valign=""top"" style=""width:30%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">"&ob_rs("opcion_esp")&":</td>"
str = str& "<td valign=""top"" style=""width:1%""></td><td style=""text-align:right;font-size:0.8em;font-family:arial;color:#666"">"&FormatNumber(ccur(ob_rs("opcion_pre")),2)&"&nbsp;"&mon_pdf&"</td>"
str = str& "</tr>"
ob_rs.movenext
loop
end if
ob_rs.close
str = str& "</table>"
end if
if tab6="si" then
str = str& "<div style=""border-bottom:1px solid #32C5D2;width:670px;height:4px;margin-bottom:35px;margin-top:35px;""></div>"
str = str& "<table style=""width:670px;""><tr><td valign=""top"" style=""width:30%""><div style=""font-family:arial;color:#32C5D2;font-size:1.3em;text-align:right;padding-right:50px"">"&tab6_tit&"</div></td><td style=""text-align:justify;font-size:0.7em;font-family:arial;color:#666""><div style="""">"&tab6_txt&"</div></td></tr></table>"
end if
if tabla_opciones1<>"si" and tabla_opciones2<>"si" then
str = str& "<div style=""margin-top:55px;border-bottom:1px solid #32C5D2;margin-bottom:35px;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">Adem&aacute;s incluido en este curso</div>"
else
str = str& "<div style=""border-bottom:1px solid #32C5D2;margin-bottom:35px;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">Adem&aacute;s en este curso</div>"
end if
str = str& "<ul style=""list-style-type:none;list-style=none;font-family:arial;font-size:0.7em;color:#32C5D2"">"
if tel_24="si"then
str = str& "<li style=""margin-bottom:10px;"">Tel&eacute;fono 24 h</li>"
end if
if wifi="si"then
str = str& "<li style=""margin-bottom:10px;"">Wi Fi</li>"
end if
if monitor="si"then
str = str& "<li style=""margin-bottom:10px;"">Monitor en destino</li>"
end if
if vuelo="si"then
str = str& "<li style=""margin-bottom:10px;"">Vuelo incluido</li>"
end if
if alo_fam="si"then
str = str& "<li style=""margin-bottom:10px;"">Alojamiento en familia</li>"
end if
if alo_res="si"then
str = str& "<li style=""margin-bottom:10px;"">Alojamiento en residencia</li>"
end if
if alo_apa="si"then
str = str& "<li style=""margin-bottom:10px;"">Alojamiento en apartamento</li>"
end if
if alo_hot="si"then
str = str& "<li style=""margin-bottom:10px;"">Alojamiento en hotel</li>"
end if
if multialumno="si"then
str = str& "<li style=""margin-bottom:10px;"">Programa multi-alumno</li>"
end if
if c_gene="si"then
str = str& "<li style=""margin-bottom:10px;"">Curso general</li>"
end if
if c_inten="si"then
str = str& "<li style=""margin-bottom:10px;"">Curso intensivo</li>"
end if
if c_semi="si"then
str = str& "<li style=""margin-bottom:10px;"">Curso semi intensivo</li>"
end if
if pre_medida="si"then
str = str& "<li style=""margin-bottom:10px;"">Presupuesto a medida</li>"
end if
if escuela_tam="m"then
tam="Mediana"
end if
if escuela_tam="g"then
tam="Grande"
end if
if escuela_tam="p"then
tam="Pequeña"
end if
str = str& "<li style=""margin-bottom:10px;"">Tama&ntilde;o de escuela "&tam&"</li>"
if ejecutivos="si"then
str = str& "<li style=""margin-bottom:10px;"">Programa para ejecutivos</li>"
end if
if material="si"then
str = str& "<li style=""margin-bottom:10px;"">Material acad&eacute;mico</li>"
end if
if seg_medico="si"then
str = str& "<li style=""margin-bottom:10px;"">Seguro m&eacute;dico incluido</li>"
end if
if uniforme="si"then
str = str& "<li style=""margin-bottom:10px;"">Uniforme</li>"
end if
str = str& "</ul>"
Sql= "SELECT rel.id_archivo, rel.id_item, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_item="&id_item&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_2' and archivos.campo<>'archivo_19' and archivos.campo<>'archivo_20' and archivos.campo<>'archivo_17' and archivos.campo<>'archivo_18' order by archivos.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
str = str& "<br style=""page-break-before: always"">"
n=1
str = str& "<div style=""margin-top:20px;border-bottom:1px solid #32C5D2;margin-bottom:35px;font-family:arial;color:#32C5D2;font-size:1.5em;text-align:right;"">Algunas im&aacute;genes...</div>"
do while not ob_rs.eof and n<=2
str = str& "<div style=""float:left;width:300px;height:300;overflow:hidden;margin-right:25px;padding:12px;border:solid #32C5D2 1px""><IMG SRC="""&Server.MapPath(ob_rs("nombre"))&""" width=""280"" ></div>"
ob_rs.movenext
n=n+1
loop
end if
ob_rs.close
str = str& "</HTML>"
Doc.ImportFromUrl str 
Doc.SaveHttp("attachment; filename=" & nombre_pdf & ".pdf")
Set Page = Nothing
Set Doc = Nothing  
Set Pdf = Nothing
end if
ob_conn.close
end if%>