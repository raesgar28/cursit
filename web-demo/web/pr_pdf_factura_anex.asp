<%rd="../"
s=request("s")%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="comun/moneda.asp"-->
<%rd="../"
id_factura=request("id_factura")
Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument
if (id_factura<>"" and id_factura<>0) then

Sql= "SELECT id_programa, precio1, concepto1, precio2, concepto2,precio2, concepto2, precio3, concepto3, forma_pago, n_factura,fecha_pago, fecha_emision, total, pagado, estadoPago, metodoPago, fac_ajuste, gen_ajuste FROM facturas WHERE id_factura="&id_factura&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_programa=ob_rs("id_programa")
precio1=ob_rs("precio1")
if precio1<>"" and precio1<>0 then precio1 =FormatNumber(ccur(precio1),2) & "&nbsp;"&mon_pdf&"" else precio1= 0  end if
concepto1=ob_rs("concepto1")
precio2=ob_rs("precio2")
if precio2<>"" and precio2<>0 then precio2 =FormatNumber(ccur(precio2),2) & "&nbsp;"&mon_pdf&"" else precio2= 0  end if
concepto2=ob_rs("concepto2")
precio3=ob_rs("precio3")
if precio3<>"" and precio3<>0 then precio3 =FormatNumber(ccur(precio3),2) & "&nbsp;"&mon_pdf&"" else precio3= 0  end if
concepto3=ob_rs("concepto3")
forma_pago=ob_rs("forma_pago")
n_factura=ob_rs("n_factura")
fechaPago=ob_rs("fecha_pago")
fechaEmision=ob_rs("fecha_emision")
suma_total=ob_rs("total")
if suma_total<>"" and suma_total<>0 then suma_total =FormatNumber(ccur(suma_total),2) & "&nbsp;"&mon_pdf&"" else suma_total= 0  end if
pagado=ob_rs("pagado")
estadoPago=ob_rs("estadoPago")
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

ajuste=ob_rs("fac_ajuste")
if ajuste<>"" and ajuste<>0 then ajuste =FormatNumber(ccur(ajuste),2) & "&nbsp;"&mon_pdf&"" else ajuste= "0,00" & "&nbsp;"&mon_pdf&"" end if
pr_ajuste=ob_rs("gen_ajuste")
end if
ob_rs.close

Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre, u_f_nif, u_f_direccion, id_itemSubAero, id_quincena, nom_quincena,s_mes, n_factura, id_usuario,fechaPago,fechaEmision, ajuste, pr_ajuste,precioReserva FROM programas WHERE id_programa="&id_programa&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
id_usuario=ob_rs("id_usuario")
factura=ob_rs("factura")
u_f_nombre=ob_rs("u_f_nombre")
u_f_nif=ob_rs("u_f_nif") 
u_f_direccion=ob_rs("u_f_direccion")
nombre_pdf=n_factura&"-"&u_f_nombre &"-"&u_f_apellidos
nombre_pdf_sec=u_f_nombre
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
if nombre_pdf_sec=""then nombre_pdf=n_factura&"-"&a_nombre &"-"&a_apellidos
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
str = str& "</td><td style=""text-align:right;font-size:0.7em;font-family:arial;color:#999"">c/ Daniel de Balaciart, 6 Entlo.<br>46020 - Valencia<br>+34 961 93 96 94<br>sat@cursit.com</td></tr></table>"
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
if fechaEmision="01/01/1000" then fechaEmision="" end if
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
str = str& "<td colspan=""3"" align=""left"" style=""color:#000000;font-family:arial;font-size:0.8em;"">"&u_f_nombre&" <br /> "&u_f_nif&" <br /> "&u_f_direccion&"</td>"
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
if concepto1<>"" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&concepto1&"</td><td style=""text-align:center"">"&precio1&"</td></tr>" end if
if concepto2<>"" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&concepto2&"</td><td style=""text-align:center"">"&precio2&"</td></tr>" end if
if concepto3<>"" then str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td>"&concepto3&"</td><td style=""text-align:center"">"&precio3&"</td></tr>" end if
str = str& "<tr><td colspan=""2"">&nbsp;</td></tr>"
str = str& "<tr><td height=""1"" colspan=""2"" bgcolor=""#fafafa""></td></tr>"
if pr_ajuste="si"then suma_total=ajuste end if
str = str& "<tr style=""color:#000;font-size:0.8em;font-family:arial;""><td align=""right"">Total</td><td style=""text-align:center"">"&suma_total&"</td></tr>"
str = str& "<tr><td height=""1"" colspan=""2"" bgcolor=""#fafafa""></td></tr>"
str = str& "</table>"
str = str& "<p>&nbsp;</p>"
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