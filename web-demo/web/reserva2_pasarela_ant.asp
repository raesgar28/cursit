<!--#include file="comun/menu_sup.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<link href="<%=r%>web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%if session("id_usuario")<>"" then
Sql= "SELECT u_telefono,u_email,u_movil,u_direccion,u_ciudad, u_provincia, u_pais,u_empresa from usuarios where id_usuario= "&session("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
u_empresa=ob_rs("u_empresa")
end if
ob_rs.close
else
response.redirect(r&"zona-privada")
end if%>
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza" style="background-image: url(<%=ruta_banner%>)">
<div class="container">
<div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07"> <%=texto_esp_web%></h4>
</div>
<ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">
<li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li>
<li class="c-font-white">/</li>
<li class="c-state_active c-font-white"><%=titulo_esp%></li>
</ul></div></div>
<div class="c-content-box c-size-md c-bg-white">
<div class="container reserva_check">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1">
<h3 class="">Pago anticipo</h3>
<div class="c-line-left"></div>
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<!--#include file="comun/limpia.asp"-->
<%metodoPago=request("metodoPago")
'refPago=request("refPago")
refPagoPay=request("refPagoPay")
estadoPago=request("estadoPago")'Completed
precio= request("ds_amount") 
precio=FormatNumber(ccur(precio),2)
if IsNumeric(precio) then precio=FormatNumber(ccur(precio),2) end if'/100
'refPagoPay=Request("txn_id")
refPago=request("custom")
if refPagoPay<>"" then 
metodoPago="Paypal" 
refPago=request("refPago")
Sql= "SELECT estadoPago,precio FROM programasAnticipos WHERE refPagoPay='"&refPagoPay&"' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
estadoPago=ob_rs("estadoPago")
if estadoPago="Completed" then estadoPago="Aceptada" end if
precio=ob_rs("precio")
precio_p=FormatNumber(ccur(precio),2)
ob_rs.close
end if
end if
if metodoPago="Tarjeta" then        '//////////////////////////  PAGO TARJETA
refPago= request("ds_order")
respuesta=request("ds_response")
if respuesta <>"" then respuesta=int(respuesta) else respuesta = 9999 end if
if int(respuesta) <> "" then'9915 >  CANCELADA '0180 > NO VALIDA TARJETA '9051 > REPETIDO PEDIDO 913   >> PEDIDO REPETIDO 9998  >>  Operación en proceso de solicitud de datos de tarjeta
if int(respuesta) >= int(0000) and int(respuesta) <= (0099)then estadoPago="Aceptada" end if
if int(respuesta) = int(0051) then estadoPago="Denegada" end if
if int(respuesta) >= int(100) and int(respuesta) <= (9997)then estadoPago="Denegada" end if
if int(respuesta) =int(9999) then estadoPago="Denegada" end if
if int(respuesta) = int(9998) then estadoPago="Denegada" end if
else
estadoPago="Denegada"
end if
Sql= "SELECT * FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_empresa=ob_rs("titulo_esp")
id_web=ob_rs("id_web")
f_smtp=ob_rs("f_smtp")
f_usuario=ob_rs("f_usuario")
f_pass=ob_rs("f_pass")
f_email=ob_rs("f_email")
f_puerto=ob_rs("f_puerto")
f_texto_legal=ob_rs("f_texto_legal")
email=ob_rs("email")
direccion=ob_rs("direccion")
cod_postal=ob_rs("cod_postal")
ciudad=ob_rs("ciudad")
provincia=ob_rs("provincia")
pais=ob_rs("pais")
if pais="es" then pais="España" end if
telefono=ob_rs("telefono")
url=ob_rs("url")
url_c=ob_rs("url")
if url <>"" then
url=replace(url,"https://","")
url=replace(url,"http://","")
end if
end if
ob_rs.close
if id_web<>""then
Sql= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
nombre=url_c&nombre
alt=ob_rs("alt")
end if
ob_rs.close
end if
if estadoPago="Aceptada" then
Sql= "SELECT id_programa, mail_env, precio FROM programasAnticipos WHERE refPago='"&refPago&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
mail_env=ob_rs("mail_env")
id_programa=ob_rs("id_programa")
precio=FormatNumber(ccur(ob_rs("precio")),2)
end if
ob_rs.close

mySQL="UPDATE programasAnticipos SET "
mySQL=mySQL & "pagado = 'si'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & " and refPago='"&refPago&"'" 
set ob_rs=Ob_Connb.execute(mySQL)
if mail_env<>"si" or isnull(mail_env)then
mySQL="UPDATE programasAnticipos SET "
mySQL=mySQL & "estadoPago = '"&estadoPago&"'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & " and refPago='"&refPago&"'" 
set ob_rs=Ob_Connb.execute(mySQL)

Sql= "SELECT falta_pagar, id_alumno, id_usuario, nom_item FROM programas WHERE id_programa="&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
'precio=FormatNumber(ccur(precio/10),2)
falta_pagar=ob_rs("falta_pagar")-precio
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
titulo_esp=ob_rs("nom_item")
end if
ob_rs.close
mySQL="UPDATE programas SET "
mySQL=mySQL & "falta_pagar = '"&falta_pagar&"'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if

if id_alumno<>"" and mail_env<>"si" or isnull(mail_env) then ' //////////////OJO
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
else
falla_alumno_tmp="si"
end if
ob_rs.close
else
falla_alumno="si"
end if
'precio=FormatNumber(ccur(precio/10),2)
if id_usuario<>"" then
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close
else
falla_usuario="si"
end if
mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email
if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email then mail_1= u_email end if
if u_email=a_m_email then mail_1= u_email end if
if u_email=a_email then mail_2= u_email end if
if u_email=a_p_email then mail_2= u_email end if
if u_email=a_m_email then mail_2= u_email end if
if u_email=a_email then mail_3= u_email end if
if u_email=a_p_email then mail_3= u_email end if
if u_email=a_m_email then mail_3= u_email end if
valor_total= pr_reserva+ pr_cancelacion_pr
refPresupuesto=id_programa
if len(refPresupuesto) = 6 then ceros = "0"
if len(refPresupuesto) = 5 then ceros = "00"
if len(refPresupuesto) = 4 then ceros = "000"
if len(refPresupuesto) = 3 then ceros = "0000"
if len(refPresupuesto) = 2 then ceros = "00000"
if len(refPresupuesto) = 1 then ceros = "000000"
refPresupuesto = "P" &ceros & refPresupuesto &"-" &year(date)%>
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<!--#include file="comun/limpia.asp"-->
<%if mail_env="no" then
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
if IsNumeric(f_puerto) then f_puerto=f_puerto else f_puerto="587" end if
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
if mail_1<>mail_4 and mail_1<>""  then Mail.AddAddress mail_1 end if
if mail_2<>mail_4 and mail_2<>"" then Mail.AddAddress mail_2 end if
if mail_3<>mail_4 and mail_3<>"" then Mail.AddAddress mail_3 end if
Mail.AddAddress mail_4
Mail.AddBCC f_email 
if email<>"" then Mail.AddCC email  end if
asunto = limpia_mail(a_nombre) &" "& limpia_mail(a_apellidos) & " - Pago de anticipo en Curso de Idiomas " & limpia_mail(titulo_esp)
Mail.Subject =  Mail.EncodeHeader(asunto, "utf-8")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Muchas gracias por realizar el pago de <strong>"&precio&" euros</strong> para el curso <strong>"&titulo_esp&"</strong> con "&nombre_empresa&".</i></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a través del mail <strong>"&email&"</strong> o bien del teléfono "&telefono&".<br><br>En el documento adjunto encontrarás la referencia de la preisncripción.<br><br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" - "&provincia&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
If Err <> 0 Then%>
<ul><li>Ha ocurrido un error en el elvío del mail, aunque el alumno ha quedado preinscrito.</li></ul>
<%end If 
mySQL="UPDATE programasAnticipos SET "
mySQL=mySQL & "mail_env = 'si'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if 'mail_env<>"si" then%>
<div class="proceso_fin"><i class="fa fa-check" aria-hidden="true"></i> Pago de anticipo finzalizado</div>
<div class="datos_pago">Has realizado correctamente el pago de <%=precio%> € con <%=nombre_empresa%>.<br><br><span class="notas_fin">*Te recordamos también que hemos enviado esta misma información a tu dirección de email. Por favor, revisa la carpeta de spam si no lo recibieras en 5 minutos.</span></div>
<%else 'estadoPago="Aceptada"%>
<div class="proceso_fin"><i class="fa fa-times" aria-hidden="true"></i> Error en proceso de pago</div>
<div class="datos_pago">Ha habido un error en el proceso de pago de la preinscripción.<br><br>Por favor, vuelve a "formalizar" la reserva desde tu área de usuario o ponte en contacto con nosotros a través del mail <strong><%=email%></strong> o bien del teléfono <strong><%=telefono%></strong>.<br></div>
<%end if 'estadoPago="Aceptada" 
end if ' METODO PAGO TARJETA
if metodoPago="Paypal" then
if estadoPago="Aceptada" or estadoPago="Completed" then%>
<div class="proceso_fin"><i class="fa fa-check" aria-hidden="true"></i> Pago de anticipo finzalizado</div>
<div class="datos_pago">Desde este momento queda confirmado el pago de <%=precio_p%> € con Cursit Idiomas.<br><br><span class="notas_fin">*Te recordamos también que esta información aparece reflejada en los datos de pago de tu inscripción.</span></div>
<%else%>
<div class="proceso_fin"><i class="fa fa-times" aria-hidden="true"></i> Error en proceso de pago</div>
<div class="datos_pago">Ha habido un error en el proceso de pago.<br><br>Por favor, vuelve a intentarlo desde tu área de usuario o ponte en contacto con nosotros a través del mail <strong><%=email%></strong> o bien del teléfono <strong><%=telefono%></strong>.<br></div>
<%end if
end if
if metodoPago=""then%>
<div class="proceso_fin"><i class="fa fa-times" aria-hidden="true"></i> Error en proceso de pago</div>
<div class="datos_pago">Ha habido un error en el proceso de pago de pago.<br><br>Por favor, vuelve a intentarlo desde tu área de usuario o ponte en contacto con nosotros a través del mail <strong><%=email%></strong> o bien del teléfono <strong><%=telefono%></strong>.<br></div>
<%end if
if refPago<>""then%><div class="descarga_pdf_fin"><a href="<%=r%>web/pr_pdf_preins.asp?refPago=<%=refPago%>&s=crm&id_programa=<%=id_programa%>"><i class="fa fa-download" aria-hidden="true"></i> Descargar Inscripción</a></div><%end if%>
</div></div></div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>$(document).ready(function(e) {$('#spinner_back').fadeOut(500);})</script>