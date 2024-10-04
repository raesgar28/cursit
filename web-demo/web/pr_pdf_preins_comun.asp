<%rd="../"
if id_programa=""then id_programa=request("id_programa") end if
refPago_2=request("refPago")
if refPago_2<>""then refPago=refPago_2 end if
Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument
if (id_programa<>"" and id_programa<>0) or refPago<>"" then
if s<>"crm" then
if id_programa<>"" and id_programa<>0 then
Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre, u_f_nif, u_f_direccion, id_itemSubAero, id_quincena, nom_quincena,s_mes,nom_destino, suma_total_p, cod_descuento FROM programas_tmp WHERE id_programa="&id_programa&"" 
else
Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre, u_f_nif, u_f_direccion, id_itemSubAero, id_quincena, nom_quincena,s_mes,nom_destino, suma_total_p, cod_descuento FROM programas_tmp WHERE refPago='"&refPago&"'" 
end if
else
if id_programa<>"" and id_programa<>0 then
Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre, u_f_nif, u_f_direccion, id_itemSubAero, id_quincena, nom_quincena,s_mes,nom_destino, suma_total_p, cod_descuento FROM programas WHERE id_programa="&id_programa&"" 
else
Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre, u_f_nif, u_f_direccion, id_itemSubAero, id_quincena, nom_quincena,s_mes,nom_destino, suma_total_p, cod_descuento FROM programas WHERE refPago='"&refPago&"'" 
end if
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if estadoPago="" then
if ob_rs("estadoPago")<>""then estadoPago=ob_rs("estadoPago") else estadoPago=estadoPago end if
end if
id_programa=ob_rs("id_programa")
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
pr_cancelacion=ob_rs("pr_cancelacion")
if pr_cancelacion="si" then pr_cancelacion="S&iacute;" else pr_cancelacion="No" end if
con_examen=ob_rs("con_examen")
pr_medico=ob_rs("pr_medico")
if pr_medico="si" then pr_medico="S&iacute;" else pr_medico="No" end if
f_inicio=ob_rs("f_inicio")
f_fin=ob_rs("f_fin")
fecha_in=ob_rs("fecha_in")
semanas=ob_rs("semanas")
refPresupuesto=ob_rs("refPresupuesto")
aero_ciudad=ob_rs("aero_ciudad")
precio_cur=ob_rs("precio_cur")
precio_sup=ob_rs("precio_sup")
id_itemSubAero=ob_rs("id_itemSubAero")
id_quincena=ob_rs("id_quincena")
nom_quincena=ob_rs("nom_quincena")
destino=ob_rs("nom_destino")
suma_total_p=ob_rs("suma_total_p")
cod_descuento=ob_rs("cod_descuento")
'destino=nom_destino
s_mes=ob_rs("s_mes")
precio_cur_a=precio_cur-precio_sup%>
<!--#include file="comun/moneda.asp"-->
<%if precio_cur<>"" and precio_cur<>0 then precio_cur =FormatNumber(ccur(precio_cur),2) & "&nbsp;"&mon_pdf&"" else precio_cur= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_cur_a<>"" and precio_cur_a<>0 then precio_cur_a =FormatNumber(ccur(precio_cur_a),2) & "&nbsp;"&mon_pdf&"" else precio_cur_a= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_sup<>"" and precio_sup<>0 then precio_sup =FormatNumber(ccur(precio_sup),2) & "&nbsp;"&mon_pdf&"" else precio_sup= "No incluido*"  end if
id_alojamiento=ob_rs("id_alojamiento")
pr_medico_pr=ob_rs("pr_medico_pr")
if pr_medico_pr<>"" and pr_medico_pr<>0 then pr_medico_pr =FormatNumber(ccur(pr_medico_pr),2) & "&nbsp;"&mon_pdf&"" else pr_medico_pr= "No incluido*"  end if
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>0 then pr_cancelacion_pr =FormatNumber(ccur(pr_cancelacion_pr),2) & "&nbsp;"&mon_pdf&"" else pr_cancelacion_pr= "No incluido*"  end if
tasas_aerop_pr=ob_rs("tasas_aerop_pr")
if tasas_aerop_pr<>"" and tasas_aerop_pr<>0 then tasas_aerop_pr =FormatNumber(ccur(tasas_aerop_pr),2) & "&nbsp;"&mon_pdf&"" else tasas_aerop_pr= "0,00" & "&nbsp;"&mon_pdf&"" end if
pr_examen_pr=ob_rs("pr_examen_pr")
if pr_examen_pr<>"" and pr_examen_pr<>0 then pr_examen_pr =FormatNumber(ccur(pr_examen_pr),2) & "&nbsp;"&mon_pdf&"" else pr_examen_pr= "No incluido*"  end if
pr_gestion_bill_pr=ob_rs("pr_gestion_bill_pr")
if pr_gestion_bill_pr<>"" and pr_gestion_bill_pr<>0 then pr_gestion_bill_pr =FormatNumber(ccur(pr_gestion_bill_pr),2) & "&nbsp;"&mon_pdf&"" else pr_gestion_bill_pr= "No incluido*"  end if
suma_total=ob_rs("suma_total")
suma_total_num=ob_rs("suma_total")
if suma_total<>"" and suma_total<>0 then suma_total =FormatNumber(ccur(suma_total),2) & "&nbsp;"&mon_pdf&"" else suma_total= "0,00" & "&nbsp;"&mon_pdf&""  end if
metodoPago=ob_rs("metodoPago")
Select case (metodoPago)
case "pag_transferencia"
metodoPago="Transferencia bancaria"
case "pag_tarjeta"
metodoPago="Tarjeta de cr&eacute;dito"
case "pag_paypal"
metodoPago="PayPal"
case "pag_oficina"
metodoPago="Pago en oficina"
end select
factura=ob_rs("factura")
u_f_nombre=ob_rs("u_f_nombre")
u_f_nif=ob_rs("u_f_nif") 
u_f_direccion=ob_rs("u_f_direccion")
id_alojamiento=ob_rs("id_alojamiento")
tasas_concepto=ob_rs("tasas_concepto")
alo_concepto=ob_rs("alo_concepto")
precio_alo=ob_rs("precio_alo")
tasas_opciones=ob_rs("tasas_opciones")
alo_opcion=ob_rs("alo_opcion")
precio_sup_alo=ob_rs("precio_sup_alo")
precio_alo_a=precio_alo-precio_sup_alo-tasas_concepto-tasas_opciones
if precio_alo_a<>"" and precio_alo_a<>0 then precio_alo_a =FormatNumber(ccur(precio_alo_a),2) & "&nbsp;"&mon_pdf&"" else precio_alo_a= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_alo<>"" and precio_alo<>0 then precio_alo =FormatNumber(ccur(precio_alo),2) & "&nbsp;"&mon_pdf&"" else precio_alo= "0,00"  end if
if precio_sup_alo<>"" and precio_sup_alo<>0 then precio_sup_alo =FormatNumber(ccur(precio_sup_alo),2) & "&nbsp;"&mon_pdf&"" else precio_sup_alo= "0,00" & "&nbsp;"&mon_pdf&"" end if
if tasas_concepto<>"" and tasas_concepto<>0 then tasas_concepto =FormatNumber(ccur(tasas_concepto),2) & "&nbsp;"&mon_pdf&"" else tasas_concepto= "0,00" & "&nbsp;"&mon_pdf&"" end if
if tasas_opciones<>"" and tasas_opciones<>0 then tasas_opciones =FormatNumber(ccur(tasas_opciones),2) & "&nbsp;"&mon_pdf&"" else tasas_opciones= "0,00" & "&nbsp;"&mon_pdf&"" end if
end if
ob_rs.close
if s<>"crm"then
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp_tmp WHERE id_programa="&id_programa&" and transfer='si' " 
else
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp WHERE id_programa="&id_programa&" and transfer='si' " 
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
opcion_transfer=ob_rs("nom_opcion_curso")
opcion_pre_curso=ob_rs("opcion_pre_curso")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_transfer_pr =FormatNumber(ccur(opcion_pre_curso),2) & "&nbsp;"&mon_pdf&"" else opcion_transfer_pr= ""  end if
end if
ob_rs.close

if s<>"crm" then
Sql= "SELECT * FROM alumnos_tmp WHERE id_alumno="&id_alumno&"" '////////////////ALUMNO
else
Sql= "SELECT * FROM alumnos WHERE id_alumno="&id_alumno&"" '////////////////ALUMNO
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
a_nif=ucase(ob_rs("a_nif"))
nombre_pdf=a_nombre &"-"&a_apellidos&"-"&nom_item
a_pasaporte=ucase(ob_rs("a_pasaporte"))
a_pas_exp=ob_rs("a_pas_exp")
a_pas_cad=ob_rs("a_pas_cad")
datos_pasaporte=a_pasaporte&" - "&a_pas_exp&" - "&a_pas_cad
a_email=ob_rs("a_email")
a_telefono=ob_rs("a_telefono")
if a_telefono<>""then a_telefono=a_telefono&" - " end if
a_movil=ob_rs("a_movil")
a_movil_sms=ob_rs("a_movil_sms")
a_direccion=ob_rs("a_direccion")
a_ciudad=ob_rs("a_ciudad")
a_provincia=ob_rs("a_provincia")
a_pais=ob_rs("a_pais")
if a_pais="es"then a_pais="Espa&ntilde;a"
aa_direccion =a_direccion&" - "&a_ciudad &" - "&a_provincia&" - ("&a_pais&")"
a_conocido=ob_rs("a_conocido")
a_p_nombre=ob_rs("a_p_nombre")
a_m_nombre=ob_rs("a_m_nombre")
a_p_apellidos=ob_rs("a_p_apellidos")
a_m_apellidos=ob_rs("a_m_apellidos")
a_p_telefono=ob_rs("a_p_telefono")
if a_p_telefono<>""then a_p_telefono=a_p_telefono&" - " end if
a_m_telefono=ob_rs("a_m_telefono")
if a_m_telefono<>""then a_m_telefono=a_m_telefono&" - " end if
a_p_movil=ob_rs("a_p_movil")
a_m_movil=ob_rs("a_m_movil")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_permiso_medico=ob_rs("a_permiso_medico")
a_vegetariano=ob_rs("a_vegetariano")
if a_vegetariano="si" then a_vegetariano="S&iacute;" else a_vegetariano="No" end if
a_fuma=ob_rs("a_fuma")
if a_fuma="si" then a_fuma="S&iacute;" else a_fuma="No" end if
a_curso_ant=ob_rs("a_curso_ant")
if a_curso_ant="si" then a_curso_ant="S&iacute;" else a_curso_ant="No" end if
a_curso_ant_org=ob_rs("a_curso_ant_org")
a_enfermedades=ob_rs("a_enfermedades")
a_medicamentos=ob_rs("a_medicamentos")
end if
ob_rs.close
Sql= "SELECT datos_familia_ob, gestion_aeropuertos FROM items WHERE id_item="&id_item&"" '////////////////ITEM
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
datos_familia_ob=ob_rs("datos_familia_ob")
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
end if
ob_rs.close
 '////////////////CATEGORIA
Sql= "SELECT rel.id_categoria, categorias.id_categoria, rel.id_destino, titulo_esp FROM rel, categorias WHERE rel.id_item="&id_item&" and rel.id_categoria<>0 and rel.id_categoria=categorias.id_categoria and rel.id_destino<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_categoria=ob_rs("titulo_esp")
id_destino=ob_rs("id_destino")
end if
ob_rs.close
if id_destino<>""then
Sql= "SELECT titulo_esp,id_destino FROM destinos WHERE id_destino="&id_destino&"" '////////////////ITEM
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if destino ="" then
destino=ob_rs("titulo_esp") 
else 
if len(destino)>=2 then destino=destino else destino=ob_rs("titulo_esp") end if
end if
if destino="" then destino="Sin especificar" end if
end if
ob_rs.close
end if
'function safeSTR(str)
'dim output
output = nombre_pdf
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
output = replace( output,"´","" ) '"
output = replace( output, "á","a" ) '"
output = replace( output, "é","e"  ) '"
output = replace( output,"í","i"  ) '"
output = replace( output,"ó","o"  ) '"
output = replace( output,"ú","u"  ) '"
output = replace( output, "Á","A"  ) '"
output = replace( output,"É","E"  ) '"
output = replace( output, "Í","I"  ) '"
output = replace( output,"Ó","O"  ) '"
output = replace( output,"Ú","U"  ) '"
output = replace( output,"ñ","n"  ) '"
output = replace( output,"Ñ","N"  ) '"
'safeSTR= output
'end function
nombre_pdf=output'safeSTR(nombre_pdf)
Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument
Set Page = Doc.Pages.Add
Set Font = Doc.Fonts("Helvetica")
str = "<HTML>"
if crm="si" then rd_crm="../../"
str = str& "<table style=""width:670px;""><tr><td valign=""top"">"
if crm="si"then
str = str& "<IMG SRC="""&Server.MapPath(rd_crm&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
else
str = str& "<IMG SRC="""&Server.MapPath(rd&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
end if
if t="insc" then tit="Inscripci&oacute;n" else tit="Preinscripci&oacute;n" end if
str = str& "</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999""><b>Oficina Central</b><br>c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>sat@cursit.com</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999"">-</td></tr></table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:1.2em;text-align:right;padding-bottom:10px"">"&tit&" | "&tit_categoria&"</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:110px"">Programa</td>"
str = str& "<td style=""color:#000;"">"&nom_item&"</td>"
str = str& "<td style=""width:140px"">Traslados Aeropuerto</td>"
str = str& "<td style=""color:#000;"">"&opcion_transfer&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td>Curso</td>"
str = str& "<td style=""color:#000;"">"&nom_curso&"</td>"
str = str& "<td>Examen</td>"
str = str& "<td style=""color:#000;"">"&con_examen&"</td>"
str = str& "</tr>"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td>Destino</td>"
str = str& "<td style=""color:#000;"">"&destino&"</td>"
str = str& "<td>"
if pr_medico<>"No"then
str = str& "Seguro M&eacute;dico"
end if
str = str& "</td>"
str = str& "<td style=""color:#000;"">"
if pr_medico<>"No"then
str = str& pr_medico
end if
str = str& "</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td>Fecha de Inicio</td>"
if f_inicio="01/01/1000" then f_inicio = "" end if
if f_inicio="01/01/1000" then f_inicio_sup = "" else f_inicio_sup=f_inicio end if
if nom_quincena<>"" then f_inicio_sup= nom_quincena end if
if s_mes<>"" and nom_quincena="" then f_inicio_sup =s_mes end if
str = str& "<td style=""color:#000;"">"&f_inicio_sup&" - "&semanas&" semanas</td>"
str = str& "<td>Seguro de cancelaci&oacute;n</td>"
str = str& "<td style=""color:#000;"">"&pr_cancelacion&"</td>"
str = str& "</tr>"
str = str& "</table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:0.8em;text-align:right;padding-bottom:10px"">Datos del Estudiante : <span style=""color:#000"">"&a_nif&"</span></div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:125px"">Apellidos</td>"
str = str& "<td style=""color:#000;"">"&a_apellidos&"</td>"
str = str& "<td style=""width:95px"">Nombre</td>"
str = str& "<td style=""color:#000;"">"&a_nombre&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td >Direcci&oacute;n completa</td>"
str = str& "<td colspan=""3"" style=""color:#000;"">"&aa_direccion&"</td>"
str = str& "</tr>"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td>Tel&eacute;fonos</td>"
str = str& "<td style=""color:#000;"">"&a_telefono&""&a_movil&"</td>"
str = str& "<td>eMail</td>"
str = str& "<td style=""color:#000;"">"&a_email&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td >Datos pasaporte</td>"
str = str& "<td colspan=""3"" style=""color:#000;"">"&datos_pasaporte&"</td>"
str = str& "</tr>"
str = str& "</table>"
if datos_familia_ob="si" and id_alojamiento= 0 then '/////////////////////////   DATOS FAMILIARES O ALOJAMIENTO
str = str& "<div style=""margin-top:0px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:0.8em;text-align:right;padding-bottom:10px"">Datos Familiares</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td>Padre</td>"
str = str& "<td style=""color:#000;"">"&a_p_nombre&"&nbsp;"&a_p_apellidos&"</td>"
str = str& "<td>Tel&eacute;fonos</td>"
str = str& "<td style=""color:#000;"">"&a_p_telefono&""&a_p_movil&"</td>"
str = str& "<td>eMail</td>"
str = str& "<td style=""color:#000;"">"&a_p_email&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td>Madre</td>"
str = str& "<td style=""color:#000;"">"&a_m_nombre&"&nbsp;"&a_m_apellidos&"</td>"
str = str& "<td>Tel&eacute;fonos</td>"
str = str& "<td style=""color:#000;"">"&a_m_telefono&""&a_m_movil&"</td>"
str = str& "<td>eMail</td>"
str = str& "<td style=""color:#000;"">"&a_m_email&"</td>"
str = str& "</tr>"
str = str& "</table>"
else
if id_alojamiento<> 0 then
str = str& "<div style=""margin-top:0px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:0.8em;text-align:right;padding-bottom:10px"">Datos del Alojamiento </div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:120px"">Alojamiento</td>"
str = str& "<td style=""color:#000;"">"&alo_concepto&"</td>"
str = str& "<td style=""width:150px"">Modalidad alojamiento</td>"
str = str& "<td style=""color:#000;"">"&alo_opcion&"</td>"
str = str& "</tr>"
str = str& "</table>"
end if
end if 'DATOS FAMILIA O ALOJAMIENTO
 '/////////////////////////   DATOS PERSONALES
 str = str& "<div style=""margin-top:25px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:0.8em;text-align:right;padding-bottom:10px"">Datos Personales</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:110px"">Fumador</td>"
str = str& "<td style=""color:#000;"">"&a_fuma&"</td>"
str = str& "<td style=""width:140px"">C&oacute;mo nos has conocido?</td>"
str = str& "<td style=""color:#000;"">"&a_conocido&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td>Vegetariano</td>"
str = str& "<td style=""color:#000;"">"&a_vegetariano&"</td>"
str = str& "<td>Curso anterior</td>"
str = str& "<td style=""color:#000;"">"&a_curso_ant&"</td>"
str = str& "</tr>"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td>Enfermedades</td>"
str = str& "<td style=""color:#000;"">"&a_enfermedades&"</td>"
str = str& "<td>Medicamentos a tomar</td>"
str = str& "<td style=""color:#000;"">"&a_medicamentos&"</td>"
str = str& "</tr>"
str = str& "</table>"
str = str& "<div style=""margin-top:10px;border-bottom:1px solid #32C5D2;margin-bottom:5px;padding-bottom:10px""></div>"
'CODICIONES CONTRATACION / ACEPTACIONES
if a_permiso_medico="si"then
str = str& "<div style=""margin-top:20px;margin-bottom:10px;font-family:arial;color:#999;font-size:0.6em;text-align:left;""><IMG SRC="""&Server.MapPath(rd&"web/lib/img/checked.png")&""" width=""10"" height=""10"" style=""margin-right:7px"">Estoy de acuerdo en autorizar a Cursit, la organizaci&oacute;n con la que colabora en el pa&iacute;s de destino o a la familia en la que me hospede, a actuar por mi en caso de emergencia, accidente o enfermedad durante el tiempo que dure el programa a realizar.</div>"
end if
str = str& "<div style=""margin-top:4px;margin-bottom:10px;font-family:arial;color:#999;font-size:0.6em;text-align:left;""><IMG SRC="""&Server.MapPath(rd&"web/lib/img/checked.png")&""" width=""10"" height=""10"" style=""margin-right:7px"">S&iacute;, he leido y acepto Las condiciones de contrataci&oacute;n</div>"
str = str& "<div style=""margin-top:5px;margin-bottom:10px;font-family:arial;color:#999;font-size:0.6em;text-align:left;""><IMG SRC="""&Server.MapPath(rd&"web/lib/img/checked.png")&""" width=""10"" height=""10"" style=""margin-right:7px"">S&iacute;, he leido y acepto La Cl&aacute;usula Informativa y Autorizaci&oacute;n al Tratamiento de los Datos</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;margin-top:8px"">"
str = str& "<tr>"
str = str& "<td style=""width:110px"">Referencia</td>"
str = str& "<td style=""color:#000;width:420px"">"&refPresupuesto&"</td>"
str = str& "<td style=""width:80px"">Fecha</td>"
str = str& "<td style=""color:#000;"">"&fecha_in&"</td>"
str = str& "</tr>"
str = str& "</table>"

'/////////////////////  OPCIONES
str = str& "<br style=""page-break-before: always"">"
str = str& "<table style=""width:670px;""><tr><td valign=""top"">"
if crm="si" then rd_crm="../../" end if
if crm="si"then
str = str& "<IMG SRC="""&Server.MapPath(rd_crm&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
else
str = str& "<IMG SRC="""&Server.MapPath(rd&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
end if
str = str& "</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999""><b>c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>sat@cursit.com</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999""><b>-</td></tr></table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:1.2em;text-align:right;padding-bottom:10px"">Presupuesto | "&tit_categoria&"</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:110px"">Programa</td>"
str = str& "<td style=""color:#000;"">"&nom_item&"</td>"
str = str& "<td style=""width:140px"">Salida</td>"
str = str& "<td style=""color:#000;"">"&f_inicio&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td>Curso</td>"
str = str& "<td style=""color:#000;"">"&nom_curso&"</td>"
str = str& "<td>Regreso</td>"
if f_fin="01/01/1000" or f_inicio="" then f_fin="" end if
str = str& "<td style=""color:#000;"">"&f_fin&"</td>"
str = str& "</tr>"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td>Semanas</td>"
str = str& "<td style=""color:#000;"">"&semanas&"</td>"
str = str& "<td>Aeropuerto</td>"
str = str& "<td style=""color:#000;"">"&aero_ciudad&"</td>"
str = str& "</tr>"
str = str& "</table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:1em;text-align:right;padding-bottom:10px"">Desglose</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:140px"">Precio Curso</td>"
str = str& "<td style=""color:#000;width:200px"">"&precio_cur_a&"</td>"
if pr_cancelacion_pr<>"No incluido*"then
str = str& "<td style=""width:140px"">Seguro cancelaci&oacute;n</td>"
str = str& "<td style=""color:#000;"">"&pr_cancelacion_pr&"</td>"
else
str = str& "<td style=""width:140px""></td>"
str = str& "<td style=""color:#000;""></td>"
end if
str = str& "</tr>"
str = str& "<tr>"
if pr_medico_pr<>"No incluido*"then
str = str& "<td style=""width:140px"">Seguro m&eacute;dico</td>"
str = str& "<td style=""color:#000;width:200px"">"&pr_medico_pr&"</td>"
else
str = str& "<td style=""width:140px""></td>"
str = str& "<td style=""color:#000;width:200px""></td>"
end if
if precio_sup<>"No incluido*"then
str = str& "<td style=""width:140px"">Suplemento Temporada</td>"
str = str& "<td style=""color:#000;"">"&precio_sup&"</td>"
else
str = str& "<td style=""width:140px""></td>"
str = str& "<td style=""color:#000;""></td>"
end if
str = str& "</tr>"
str = str& "<tr style=""background:#fafafa"">"
if pr_examen_pr<>"No incluido*"then
str = str& "<td style=""width:140px"">Examen</td>"
str = str& "<td style=""color:#000;"">"&pr_examen_pr&"</td>"
else
str = str& "<td style=""width:140px""></td>"
str = str& "<td style=""color:#000;width:200px""></td>"
end if
if opcion_transfer_pr<>""then
	if opcion_transfer <>"" then
	str = str& "<td style=""width:140px"">"&opcion_transfer&"</td>"
	else
	str = str& "<td style=""width:140px"">Traslado Aeropuerto</td>"
	end if
str = str& "<td style=""color:#000;"">"&opcion_transfer_pr&"</td>"
else
str = str& "<td style=""width:140px""></td>"
str = str& "<td style=""color:#000;""></td>"
end if
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td style=""width:140px"">Tasas Aeropuerto</td>"
str = str& "<td style=""color:#000;"">"&tasas_aerop_pr&"</td>"
if pr_gestion_bill_pr<>"No incluido*"then
str = str& "<td style=""width:140px"">Gesti&oacute;n billete</td>"
str = str& "<td style=""color:#000;"">"&pr_gestion_bill_pr&"</td>"
else
str = str& "<td style=""width:140px""></td>"
str = str& "<td style=""color:#000;""></td>"
end if
str = str& "</tr>"
if id_alojamiento<>0 then
str = str& "<tr style=""background:#fafafa"">"
str = str& "<td style=""width:140px"">Precio Alojamiento</td>"
str = str& "<td style=""color:#000;width:200px"">"&precio_alo_a&"</td>"
str = str& "<td style=""width:140px"">Suplemento Temporada</td>"
str = str& "<td style=""color:#000;"">"&precio_sup_alo&"</td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td style=""width:140px"">Tasas "&alo_concepto&"</td>"
str = str& "<td style=""color:#000;width:200px"">"&tasas_concepto&"</td>"
str = str& "<td style=""width:140px"">Tasas "&alo_opcion&"</td>"
str = str& "<td style=""color:#000;"">"&tasas_opciones&"</td>"
str = str& "</tr>"
end if
str = str& "<tr>"

if s="crm" then
Sql= "SELECT nom_opcion_prog, opcion_pre_prog FROM programasOp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_prog<>'' " 
else
Sql= "SELECT nom_opcion_prog, opcion_pre_prog FROM programasOp_tmp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_prog<>'' " 
end if

Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
str = str& "<td colspan=""2"" valign=""top"">"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:1em;"">"
do while not ob_rs.eof
opcion_pre_prog=ob_rs("opcion_pre_prog")
if opcion_pre_prog<>"" and opcion_pre_prog<>0 then opcion_pre_prog =FormatNumber(ccur(opcion_pre_prog),2) & "&nbsp;"&mon_pdf&""else opcion_pre_prog= "0,00" & "&nbsp;"&mon_pdf&""  end if
str = str& "<tr>"
str = str& "<td style=""width:140px;padding-top:4px;padding-bottom:4px;"">"&ob_rs("nom_opcion_prog")&"</td>"
str = str& "<td style=""color:#000;padding-left:6px"">"&opcion_pre_prog&"</td>"
str = str& "</tr>"
ob_rs.movenext
loop
str = str& "</table>"
str = str& "</td>"
end if
ob_rs.close


if s="crm" then
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_curso<>'' " 
else
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp_tmp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_curso<>'' " 
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
str = str& "<td colspan=""2"" valign=""top"">"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:1em;"">"
do while not ob_rs.eof
opcion_pre_curso=ob_rs("opcion_pre_curso")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_pre_curso =FormatNumber(ccur(opcion_pre_curso),2) & "&nbsp;"&mon_pdf&"" else opcion_pre_curso= "0,00" & "&nbsp;"&mon_pdf&""  end if
str = str& "<tr>"
str = str& "<td style=""width:140px;padding-top:4px;padding-bottom:4px;"">"&ob_rs("nom_opcion_curso")&"</td>"
str = str& "<td style=""color:#000;padding-left:6px"">"&opcion_pre_curso&"</td>"
str = str& "</tr>"
ob_rs.movenext
loop
str = str& "</table>"
str = str& "</td>"
end if
ob_rs.close
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td colspan=""4""></td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td colspan=""3""></td>"
str = str& "<td style=""color:#000;text-align:right;padding-right:12px;font-size:1.2em;background:#fafafa""><span style=""color:#32C5D2;"">Total:&nbsp;&nbsp;</span>"&suma_total&"</td>"
str = str& "</tr>"
if suma_total_p<>"" or suma_total_p<>0 then
descuento_tot=suma_total_p-suma_total_num
descuento_tot=FormatNumber(ccur(descuento_tot),2) & "&nbsp;"&mon_pdf&""
str = str& "<tr>"
str = str& "<td colspan=""3""></td>"
str = str& "<td style=""color:#000;text-align:right;padding-right:12px;font-size:1.2em;background:#fafafa""><span style=""color:#32C5D2;"">Descuento "&cod_descuento&":&nbsp;&nbsp;</span>-"&descuento_tot&"</td>"
str = str& "</tr>"
end if
str = str& "<tr>"
str = str& "<td colspan=""4""></td>"
str = str& "</tr>"
str = str& "<tr>"
str = str& "<td colspan=""3"" style=""color:#999;text-align:left;font-size:0.8em;"">(*) En algunos cursos este concepto est&aacute; ya inclu&iacute;do. En otro caso, el alumno no ha seleccionado la opci&oacute;n. En cualquiera de los dos, el alumno ha sido informado.</td>"
str = str& "<td ></td>"
str = str& "</tr>"
str = str& "</table>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;margin-top:15px"">"
str = str& "<tr>"
str = str& "<td style=""width:110px"">M&eacute;todo de pago</td>"
str = str& "<td style=""color:#000;width:400px"">"&metodoPago&" - "&estadoPago&"</td>"
str = str& "</tr>"
str = str& "</table>"
if metodoPago="Transferencia bancaria"then
Sql= "SELECT datos_transferencia FROM metodosPago WHERE id_metodoPago IS NOT NULL"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
datos_transferencia=ob_rs("datos_transferencia")
str = str& "<div style=""margin-top:15px;border-bottom:1px solid #32C5D2;margin-bottom:15px;font-family:arial;color:#32C5D2;font-size:0.9em;text-align:right;padding-bottom:10px"">Datos Transferencia Bancaria</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""4"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;margin-top:0px"">"
str = str& "<tr>"
str = str& "<td style=""color:#000;width:400px"">"&datos_transferencia&"</td>"
str = str& "</tr>"
str = str& "</table>"
end if
ob_rs.close
end if
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;margin-top:40px"">"
str = str& "<tr>"
str = str& "<td style=""width:110px;padding-left:10px"">Referencia</td>"
str = str& "<td style=""color:#000;width:420px"">"&refPresupuesto&"</td>"
str = str& "<td style=""width:80px"">Fecha</td>"
str = str& "<td style=""color:#000;"">"&date&"</td>"
str = str& "</tr>"
str = str& "</table>"
if factura="si" then
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;margin-top:10px"">"
str = str& "<tr>"
str = str& "<td style=""width:110px;padding-left:10px"">Datos Factura</td>"
str = str& "<td style=""color:#000;width:420px"">"&u_f_nombre&" - "&u_f_nif&" - "&u_f_direccion&"</td>"
str = str& "</tr>"
str = str& "</table>"
end if
Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='cc'" '////////////////CONDICIONES CONTRATACION
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof and ob_rs("titulo_esp") <>"" then
str = str& "<br style=""page-break-before: always"">"
str = str& "<table style=""width:670px;""><tr><td valign=""top"">"
if crm="si" then rd_crm="../../" end if
if crm="si"then
str = str& "<IMG SRC="""&Server.MapPath(rd_crm&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
else
str = str& "<IMG SRC="""&Server.MapPath(rd&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
end if
str = str& "</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999"">-</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999""><b>Oficina Valencia</b><br>c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>sat@cursit.com</td></tr></table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:1.2em;text-align:right;padding-bottom:10px"">"&ob_rs("titulo_esp")&"</div>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#333;font-size:0.6em;padding-bottom:10px"">"&ob_rs("texto_esp")&"</div>"
end if
ob_rs.close
Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'" '////////////////CLAUSULA INFORMATIVA
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof and ob_rs("titulo_esp") <>"" then
str = str& "<br style=""page-break-before: always"">"
str = str& "<table style=""width:670px;""><tr><td valign=""top"">"
if crm="si" then rd_crm="../../" end if
if crm="si"then
str = str& "<IMG SRC="""&Server.MapPath(rd_crm&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
else
str = str& "<IMG SRC="""&Server.MapPath(rd&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
end if
str = str& "</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999""><b>-d</b>-</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999""><b>Oficina Valencia</b><br>c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>sat@cursit.com</td></tr></table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#32C5D2;font-size:1.2em;text-align:right;padding-bottom:10px"">"&ob_rs("titulo_esp")&"</div>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#333;font-size:0.6em;padding-bottom:10px"">"&ob_rs("texto_esp")&"</div>"
end if
ob_rs.close
'FIN CODICIONES CONTRATACION / ACEPTACIONES
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:0.7em;"">"
str = str& "<tr>"
str = str& "<td style=""width:110px"">Referencia</td>"
str = str& "<td style=""color:#000;"">"&refPresupuesto&"</td>"
str = str& "<td style=""width:140px"">Fecha</td>"
str = str& "<td style=""color:#000;"">"&date&"</td>"
str = str& "</tr>"
str = str& "</table>"
str = str& "</HTML>"
Doc.ImportFromUrl str 
if crm="si"then
Set Image = Doc.OpenImage( Server.MapPath( rd&"../web/lib/img/nota_pdf.jpg") )
else
Set Image = Doc.OpenImage( Server.MapPath( rd&"web/lib/img/nota_pdf.jpg") )
end if
For Each Page in Doc.Pages
str = Page.Index & " de " & Doc.Pages.Count
Page.Canvas.DrawText str, "x=10, y=20", Doc.Fonts("Arial")
Set Param = Pdf.CreateParam
Param("x") = 10
Param("y") = 70
Param("ScaleX") = 0.7
Param("ScaleY") = 0.7
Page.Canvas.DrawImage Image, Param
Next%>