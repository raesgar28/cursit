<%rd="../"
s=request("s")%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%rd="../"
if id_programa=""then id_programa=request("id_programa") end if
refPago_2=request("refPago")
if refPago_2<>""then refPago=refPago_2 end if
Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument
if (id_programa<>"" and id_programa<>0) or refPago<>"" then
Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre, u_f_nif, u_f_direccion, id_itemSubAero, id_quincena, nom_quincena,s_mes, n_factura, id_usuario,fechaPago,fechaEmision, ajuste, pr_ajuste,precioReserva FROM programas WHERE id_programa="&id_programa&"" 
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
s_mes=ob_rs("s_mes")
n_factura=ob_rs("n_factura")
id_usuario=ob_rs("id_usuario")
fechaEmision=ob_rs("fechaEmision")
if fechaEmision="01/01/1000" then fechaEmision="Sin especificar"end if
fechaPago=ob_rs("fechaPago")
ajuste=ob_rs("ajuste")
if ajuste<>"" and ajuste<>0 then ajuste =FormatNumber(ccur(ajuste),2) & "&nbsp;"&mon_pdf&"" else ajuste= "0,00" & "&nbsp;"&mon_pdf&"" end if
pr_ajuste=ob_rs("pr_ajuste")
precio_cur_a=precio_cur-precio_sup%>
<!--#include file="comun/moneda.asp"-->
<%if precio_cur<>"" and precio_cur<>0 then precio_cur =FormatNumber(ccur(precio_cur),2) & "&nbsp;"&mon_pdf&"" else precio_cur= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_cur_a<>"" and precio_cur_a<>0 then precio_cur_a =FormatNumber(ccur(precio_cur_a),2) & "&nbsp;"&mon_pdf&"" else precio_cur_a= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_sup<>"" and precio_sup<>0 then precio_sup =FormatNumber(ccur(precio_sup),2) & "&nbsp;"&mon_pdf&"" else precio_sup= 0  end if
id_alojamiento=ob_rs("id_alojamiento")
pr_medico_pr=ob_rs("pr_medico_pr")
if pr_medico_pr<>"" and pr_medico_pr<>0 then pr_medico_pr =FormatNumber(ccur(pr_medico_pr),2) & "&nbsp;"&mon_pdf&"" else pr_medico_pr= 0  end if
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
pr_cancelacion_pr_n=ob_rs("pr_cancelacion_pr")
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>0 then pr_cancelacion_pr =FormatNumber(ccur(pr_cancelacion_pr),2) & "&nbsp;"&mon_pdf&"" else pr_cancelacion_pr= 0  end if
tasas_aerop_pr=ob_rs("tasas_aerop_pr")
if tasas_aerop_pr<>"" and tasas_aerop_pr<>0 then tasas_aerop_pr =FormatNumber(ccur(tasas_aerop_pr),2) & "&nbsp;"&mon_pdf&"" else tasas_aerop_pr= 0 end if
pr_examen_pr=ob_rs("pr_examen_pr")
if pr_examen_pr<>"" and pr_examen_pr<>0 then pr_examen_pr =FormatNumber(ccur(pr_examen_pr),2) & "&nbsp;"&mon_pdf&"" else pr_examen_pr= 0  end if
pr_gestion_bill_pr=ob_rs("pr_gestion_bill_pr")
if pr_gestion_bill_pr<>"" and pr_gestion_bill_pr<>0 then pr_gestion_bill_pr =FormatNumber(ccur(pr_gestion_bill_pr),2) & "&nbsp;"&mon_pdf&"" else pr_gestion_bill_pr= 0  end if
precioReserva=ob_rs("precioReserva")
precioReserva_n=ob_rs("precioReserva")+pr_cancelacion_pr_n
if precioReserva<>"" and precioReserva<>0 then precioReserva =FormatNumber(ccur(precioReserva_n),2) & "&nbsp;"&mon_pdf&"" else precioReserva= 0  end if'OJO RETOCADO
suma_total=ob_rs("suma_total")
suma_total_n=ob_rs("suma_total")
ajuste_n=ob_rs("ajuste")
if suma_total<>"" and suma_total<>0 then suma_total =FormatNumber(ccur(suma_total),2) & "&nbsp;"&mon_pdf&"" else suma_total= 0  end if
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
nombre_pdf=n_factura &"-"& u_f_nombre &"-"&u_f_apellidos
nombre_pdf_sec=u_f_nombre
id_alojamiento=ob_rs("id_alojamiento")
tasas_concepto=ob_rs("tasas_concepto")
alo_concepto=ob_rs("alo_concepto")
precio_alo=ob_rs("precio_alo")
tasas_opciones=ob_rs("tasas_opciones")
alo_opcion=ob_rs("alo_opcion")
precio_sup_alo=ob_rs("precio_sup_alo")
precio_alo_a=precio_alo-precio_sup_alo-tasas_concepto-tasas_opciones
if precio_alo_a<>"" and precio_alo_a<>0 and precio_alo_a>0 then precio_alo_a =FormatNumber(ccur(precio_alo_a),2) & "&nbsp;"&mon_pdf&"" else precio_alo_a= 0 end if
if precio_alo<>"" and precio_alo<>0 then precio_alo =FormatNumber(ccur(precio_alo),2) & "&nbsp;"&mon_pdf&"" else precio_alo= 0 end if
if precio_sup_alo<>"" and precio_sup_alo<>0 then precio_sup_alo =FormatNumber(ccur(precio_sup_alo),2) & "&nbsp;"&mon_pdf&"" else precio_sup_alo= 0 end if
if tasas_concepto<>"" and tasas_concepto<>0 and tasas_concepto>0  then tasas_concepto =FormatNumber(ccur(tasas_concepto),2) & "&nbsp;"&mon_pdf&"" else tasas_concepto= 0 end if
if tasas_opciones<>"" and tasas_opciones<>0  and tasas_opciones>0 then tasas_opciones =FormatNumber(ccur(tasas_opciones),2) & "&nbsp;"&mon_pdf&"" else tasas_opciones= 0 end if
end if
ob_rs.close
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp WHERE id_programa="&id_programa&" and transfer='si' " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
opcion_transfer=ob_rs("nom_opcion_curso")
opcion_pre_curso=ob_rs("opcion_pre_curso")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_transfer_pr =FormatNumber(ccur(opcion_pre_curso),2) & "&nbsp;"&mon_pdf&"" else opcion_transfer_pr= 0 end if
end if
ob_rs.close
if id_usuario<>""then
Sql= "SELECT * FROM usuarios WHERE id_usuario="&id_usuario&"" '////////////////USUARIO
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_nombre=ob_rs("u_nombre")
u_apellidos=ob_rs("u_apellidos")
u_nif=ucase(ob_rs("u_nif"))
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
if u_pais="es"then u_pais="Espa&ntilde;a"
u_c_postal=ob_rs("u_c_postal")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
'nombre_pdf=u_nombre &"-"&u_apellidos&"-"&n_factura
direccion_com= u_direccion&" - "&u_ciudad&" - ("&u_c_postal&") - "&u_provincia&" - "&u_pais
end if
ob_rs.close
end if
Sql= "SELECT * FROM alumnos WHERE id_alumno="&id_alumno&"" '////////////////ALUMNO
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
a_nif=ucase(ob_rs("a_nif"))
if nombre_pdf_sec=""then nombre_pdf=n_factura &"-"&a_nombre &"-"&a_apellidos
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
if n_factura<>""then nfactura=n_factura else n_factura="Proforma" end if
str = str& "<table style=""width:670px;""><tr><td valign=""top"">"
if crm="si"then
str = str& "<IMG SRC="""&Server.MapPath(rd_crm&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
else
str = str& "<IMG SRC="""&Server.MapPath(rd&"web/lib/img/logos/logo_pdf.png")&""" width=""105"">"
end if
str = str& "</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999"">c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>Cursit</td></tr></table>"
str = str& "<div style=""margin-top:35px;border-bottom:1px solid #32C5D2;margin-bottom:25px;font-family:arial;color:#333;font-size:1.2em;text-align:left;padding-bottom:10px"">Factura | "&n_factura&"</div>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" >"
str = str& "<tr><td valign=""top""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" ><tr>"
str = str& "<td style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">N&deg; Factura.</td>"
str = str& "</tr>"
str = str& "<tr><td style=""color:#000000;font-family:arial;font-size:0.8em;"">"&n_factura&"</td></tr>"
str = str& "</table>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0""><tr>"
str = str& "<td style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Fecha Emisi&oacute;n.</td>"
str = str& "</tr>"
str = str& "<tr><td style=""color:#000000;font-family:arial;font-size:0.8em;"">"&fechaEmision&"</td></tr>"
str = str& "</table>"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" ><tr>"
str = str& "<td style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Fecha Vencimiento.</td>"
str = str& "</tr>"
if fechaPago<>"01/01/1000" then
str = str& "<tr><td style=""color:#000000;font-family:arial;font-size:0.8em;"">"&fechaPago&"</td></tr>"
else
str = str& "<tr><td style=""color:#000000;font-family:arial;font-size:0.8em;""></td></tr>"
end if
str = str& "</table>"
str = str& "</td>"
str = str& "<td><table width=""100%"" border=""0"" cellpadding=""2"" cellspacing=""2"" ><tr>"
str = str& "<td colspan=""3"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Datos de cliente/facturaci&oacute;n.</td></tr>"
str = str& "<tr><td colspan=""3"" height=""3"" ></td></tr>"
str = str& "<tr>"
if u_f_nombre<>"" and u_f_nif<>""and u_f_direccion<>"" then
'str = str& "<td colspan=""3"" align=""left"" style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_f_nombre&" <br /> "&u_f_nif&" <br /> "&u_f_direccion&"</td>"
'str = str& "<td width=""13%"" align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Nombre.</td>"
'str = str& "<td width=""2%"" rowspan=""4""></td>"
'str = str& "<td width=""85%"" style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_f_nombre&" </td>"
'str = str& "</tr>"
'str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">NIF/CIF.</td><td style=""color:#000000;font-family:arial;font-size:0.8em;"">'"&u_f_nif&"</td>"
str = str& "<td width=""13%"" align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Nombre.</td>"
str = str& "<td width=""2%"" rowspan=""4""></td>"
str = str& "<td width=""85%"" style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_f_nombre&" </td>"
str = str& "</tr>"
str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">NIF/CIF.</td><td style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_f_nif&"</td></tr>"
str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Direcci&oacute;n.</td><td style=""color:#000000;font-family:arial;font-size:0.9em;"">"&u_f_direccion&"</td></tr>"
str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"" valign=""top""></td><td style=""color:#000000;font-family:arial;font-size:0.8em;""></td>"
else
str = str& "<td width=""13%"" align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Apellidos.</td>"
str = str& "<td width=""2%"" rowspan=""4""></td>"
str = str& "<td width=""85%"" style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_apellidos&" </td>"
str = str& "</tr>"
str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">Nombre.</td><td style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_nombre&"</td></tr>"
str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"">DNI/CIF.</td><td style=""color:#000000;font-family:arial;font-size:0.9em;"">"&u_nif&"</td></tr>"
str = str& "<tr><td align=""right"" style=""color:#32C5D2;font-family:arial;font-size:0.8em;"" valign=""top"">Direcci&oacute;n.</td><td style=""color:#000000;font-family:arial;font-size:0.8em;"">"&direccion_com&"</td>"
end if
str = str& "</tr>"
str = str& "</table></td>"
str = str& "</tr>"
str = str& "</table>"
str = str& "<p>&nbsp;</p>"
str = str& "<table width=""100%"" border=""0"" cellspacing=""2"" cellpadding=""2"">"
str = str& "<tr style=""color:#000;padding-right:12px;font-size:0.8em;background:#fafafa;font-family:arial;""><td style=""padding-top:5px;padding-bottom:5px"">Concepto.</td><td style=""text-align:center"">Total.</td></tr>"
str = str& "<tr><td colspan=""2"" height=""4""></td></tr>"
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&nom_item&" - "&nom_curso&" - "&semanas&" semana(s)</td><td style=""text-align:center"">"&precio_cur_a&"</td></tr>"
if precio_sup<>"" and precio_sup<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Suplemento temporada</td><td style=""text-align:center"">"&precio_sup&"</td></tr>" end if
if pr_medico_pr<>"" and pr_medico_pr<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Seguro m&eacute;dico.</td><td style=""text-align:center"">"&pr_medico_pr&"</td></tr>" end if
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Seguro cancelaci&oacute;n.</td><td style=""text-align:center"">"&pr_cancelacion_pr&"</td></tr>" end if
if pr_examen_pr<>"" and pr_examen_pr<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Examen.</td><td style=""text-align:center"">"&pr_examen_pr&"</td></tr>" end if
if opcion_transfer_pr<>"" and opcion_transfer_pr<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Traslado aeropuerto.</td><td style=""text-align:center"">"&opcion_transfer_pr&"</td></tr>" end if
if tasas_aerop_pr<>"" and tasas_aerop_pr<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Tasas aeropuerto.</td><td style=""text-align:center"">"&tasas_aerop_pr&"</td></tr>" end if
if pr_gestion_bill_pr<>"" and pr_gestion_bill_pr<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Gesti&oacute;n billete.</td><td style=""text-align:center"">"&pr_gestion_bill_pr&"</td></tr>" end if
if precio_alo_a<>"" and precio_alo_a<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Precio alojamiento.</td><td style=""text-align:center"">"&precio_alo_a&"</td></tr>" end if
if precio_sup_alo<>"" and precio_sup_alo<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Suplemento temporada alojamiento.</td><td style=""text-align:center"">"&precio_sup_alo&"</td></tr>" end if
if tasas_concepto<>"" and tasas_concepto<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Tasas "&alo_concepto&".</td><td style=""text-align:center"">"&tasas_concepto&"</td></tr>" end if
if tasas_opciones<>"" and tasas_opciones<>0 then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>Tasas "&alo_opcion&".</td><td style=""text-align:center"">"&tasas_opciones&"</td></tr>" end if
'OPCIONES PROGRAMA
Sql= "SELECT nom_opcion_prog, opcion_pre_prog FROM programasOp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_prog<>'' " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
opcion_pre_prog=ob_rs("opcion_pre_prog")
if opcion_pre_prog<>"" and opcion_pre_prog<>0 then opcion_pre_prog =FormatNumber(ccur(opcion_pre_prog),2) & "&nbsp;"&mon_pdf&""else opcion_pre_prog= 0 end if
if opcion_pre_prog<>"" and opcion_pre_prog<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&ob_rs("nom_opcion_prog")&".</td><td style=""text-align:center"">"&opcion_pre_prog&"</td></tr>" end if
ob_rs.movenext
loop
end if
ob_rs.close
'OPCIONES CURSO
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_curso<>'' " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
opcion_pre_curso=ob_rs("opcion_pre_curso")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_pre_curso =FormatNumber(ccur(opcion_pre_curso),2) & "&nbsp;"&mon_pdf&""else opcion_pre_curso= 0 end if
if opcion_pre_curso<>"" and opcion_pre_curso<>"0" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&ob_rs("nom_opcion_curso")&".</td><td style=""text-align:center"">"&opcion_pre_curso&"</td></tr>" end if
ob_rs.movenext
loop
end if
ob_rs.close
'CONCEPTOS
Sql= "SELECT concepto, precio FROM programasOpAdd WHERE id_programa="&id_programa&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
precio=ob_rs("precio")
if precio<>"" and precio<>0 then precio =FormatNumber(ccur(precio),2) & "&nbsp;"&mon_pdf&""else precio= 0 end if
if ob_rs("concepto")<>"" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&ob_rs("concepto")&".</td><td style=""text-align:center"">"&precio&"</td></tr>" end if
ob_rs.movenext
loop
end if
ob_rs.close
str = str& "<tr><td colspan=""2"">&nbsp;</td></tr>"
str = str& "<tr><td height=""1"" colspan=""2"" bgcolor=""#fafafa""></td></tr>"
if pr_ajuste="si"then suma_total=ajuste end if
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td align=""right"">Total</td><td style=""text-align:center"">"&suma_total&"</td></tr>"
str = str& "<tr><td height=""1"" colspan=""2"" bgcolor=""#fafafa""></td></tr>"
str = str& "</table>"
str = str& "<p>&nbsp;</p>"
if precioReserva_n<>"" or precioReserva_n<>0 then pr_Reserva="si" end if
if pr_ajuste="si" then suma_total=ajuste_n end if
'ANTICIPOS
Sql= "SELECT anticipo, precio,fecha  FROM programasAnticipos WHERE id_programa="&id_programa&" AND pagado='si' order by fecha desc" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
anticipos="si"
end if
ob_rs.close
if anticipos="si" or pr_Reserva="si" then
str = str& "<table width=""100%"" border=""0"" cellspacing=""2"" cellpadding=""2"">"
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;padding-right:12px;background:#fafafa;"">"
str = str& "<td style=""padding-top:6px;padding-bottom:6px;text-align:center"">Fecha.</td>"
str = str& "<td>Anticipo.</td>"
str = str& "<td style=""text-align:center"">Precio.</td>"
str = str& "<td style=""text-align:center"">Importe pendiente.</td>"
str = str& "</tr>"
str = str& "<tr><td colspan=""4"">&nbsp;</td></tr>"
end if
if precioReserva_n<>"" or precioReserva_n<>0 then 
imp_pendiente=suma_total_n-precioReserva_n
if precioReserva_n<>"" and precioReserva_n<>0 then imp_pendiente =FormatNumber(ccur(imp_pendiente),2) & "&nbsp;"&mon_pdf&""else precio= 0 end if
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;"">"
str = str& "<td style=""text-align:center"">"&fecha_in&"</td>"
str = str& "<td>Reserva.</td>"
str = str& "<td style=""text-align:center"">"&precioReserva&"</td>"
str = str& "<td style=""text-align:center"">"&imp_pendiente&"</td>"
str = str& "</tr>"
else
precioReserva_n=0
end if
Sql= "SELECT anticipo, precio,fecha  FROM programasAnticipos WHERE id_programa="&id_programa&" AND pagado='si' order by fecha" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
precio=ob_rs("precio")
precio_n=precio+precio_n
if precio<>"" and precio<>0 then precio =FormatNumber(ccur(precio),2) & "&nbsp;"&mon_pdf&""else precio= 0 end if
imp_pendiente=suma_total_n-precio_n-precioReserva_n
if precio_n<>"" and precio_n<>0 then imp_pendiente =FormatNumber(ccur(imp_pendiente),2) & "&nbsp;"&mon_pdf&""else precio= 0 end if
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;"">"
str = str& "<td style=""text-align:center"">"&ob_rs("fecha")&"</td>"
str = str& "<td>"&ob_rs("anticipo")&"</td>"
str = str& "<td style=""text-align:center"">"&precio&"</td>"
str = str& "<td style=""text-align:center"">"&imp_pendiente&"</td>"
str = str& "</tr>"
ob_rs.movenext
loop
end if
ob_rs.close
if anticipos="si" or pr_Reserva="si" then str = str& "</table>" end if
str = str& "<p>&nbsp;</p>"
str = str& "<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"">"
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td style=""text-align:right"">Forma de pago. "&metodoPago&"</td></tr>"
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
Next
Doc.SaveHttp("attachment; filename=" & nombre_pdf & ".pdf")
Set Page = Nothing
Set Doc = Nothing  
Set Pdf = Nothing
end if
ob_conn.close%>