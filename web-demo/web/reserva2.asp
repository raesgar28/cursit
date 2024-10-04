<!--#include file="comun/menu_sup.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<link href="<%=r%>web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%z_privada=request("z_privada")
op=request("op")%>
<%if z_privada="si" then%>
<div class="c-layout-breadcrumbs-1 c-bgimage-full c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza" style="background-image: url(<%=ruta_banner%>)"><div class="c-breadcrumbs-wrapper"><div class="container"><div class="c-page-title c-pull-left"><h1 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim "><%=titulo_esp_div%> | <%=titulo_esp_cat%> | <%=titulo_esp%></h1><h2 class="c-font-white c-font-thin c-opacity-07"><%=alt_banner%></h2></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white" title="<%=titulo_esp_web%>"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white"><%=titulo_esp%></li></ul></div></div></div>
<%else%>
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
</ul>
</div>
</div>
<%end if%>
<div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row"><div class="col-sm-12 textos_pag">
<%if z_privada="si"then%>
<div class="c-layout-sidebar-menu c-theme ">
<div class="c-sidebar-menu-toggler">
<h3 class="c-title c-font-uppercase c-font-bold">My Profile</h3><a href="javascript:;" class="c-content-toggler" data-toggle="collapse" data-target="#sidebar-menu-1"><span class="c-line"></span>
<span class="c-line"></span><span class="c-line"></span></a></div>
<ul class="c-sidebar-menu collapse " id="sidebar-menu-1">pr
<li class="c-dropdown c-open">
<a href="javascript:;" class="c-toggler">Mi zona privada<span class="c-arrow"></span></a>
<ul class="c-dropdown-menu">
<li class=""><a href="<%=r%>zona-privada"><i class="fa fa-laptop" aria-hidden="true"></i>Escritorio</a></li>
<li class=""><a href="<%=r%>inscripciones"><i class="fa fa-folder" aria-hidden="true"></i>Inscripciones</a></li>
<li class="c-active"><a href="#"><i class="fa fa-folder-o" aria-hidden="true"></i> Pre Inscripciones</a></li>
<li class=""><a href="<%=r%>modificar-datos"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Modificar datos</a></li>
<li class=""><a href="<%=r%>salir"><i class="fa fa-sign-out" aria-hidden="true"></i>Salir</a></li>
</ul>
</li>
</ul>
</div>
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1"><h3 class="">Zona Privada</h3><div class="c-line-left"></div></div>
<%end if
id_programa=request("id_programa_ok")
id_programar=request("id_programar")
id_programa_f=request("id_programa_f")
metodoPago=request("metodoPago")
metodoPago_m=request("metodoPago")
a_observaciones_curso=request("a_observaciones_curso")
if id_programa_f<>""then id_programa=id_programa_f end if
if id_programar<>""then id_programa=id_programar end if
if op="anticipo" then
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva FROM programas WHERE id_programa="&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
mail_env=ob_rs("mail_env")
nom_item=ob_rs("nom_item")
id_curso=ob_rs("id_curso")
end if
ob_rs.close
else 'ANTICIPO

Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva FROM programas_tmp WHERE id_programa="&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
mail_env=ob_rs("mail_env")
nom_item=ob_rs("nom_item")
id_curso=ob_rs("id_curso")
precioReserva=ob_rs("precioReserva")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
		Sql2= "SELECT pr_reserva, titulo_esp,gen_mail FROM items WHERE id_item="&id_item&""
		Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
		Ob_RS2.Open Sql2, Ob_Conn,adOpenStatic, adCmdText
		if not ob_rs2.eof then
		pr_reserva=ob_rs2("pr_reserva")
		titulo_esp=ob_rs2("titulo_esp")
		gen_mail=ob_rs2("gen_mail")
		end if
		ob_rs2.close
		
		Sql2= "SELECT pr_reserva FROM itemsSub WHERE id_itemSub="&id_curso&" "
		Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
		Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
		if not ob_rs2.eof then 
		if ob_rs2("pr_reserva")<>0 and ob_rs2("pr_reserva")<>"0,00" then pr_reserva=ob_rs2("pr_reserva") end if
		end if
		ob_rs2.close
		
end if
ob_rs.close
end if 'ANTICIPO

mail_env="no"
refPago_r=1
Sql= "SELECT refPago FROM refPagos_tmp order by refPago desc"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if ob_rs("refPago")<>""then 
refPago_r=ob_rs("refPago")+1
refPago=refPago_r-1000
else
	Sql2= "SELECT refPago FROM programas_tmp order by refPago desc"
	Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
	Ob_RS2.Open Sq2l, Ob_Connb,adOpenStatic, adCmdText
	if not ob_rs2.eof then
	refPago_r=ob_rs2("refPago")
	end if
	ob_rs2.close
refPago=refPago_r
end if
end if
ob_rs.close

if id_alumno<>"" then
if op="anticipo" then
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
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos_tmp WHERE id_alumno="&id_alumno&""
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
end if
else
falla_alumno="si"
end if

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
<%if metodoPago="pag_transferencia" then ' /////////////////////////////////////  PAGO TRANSFERENCIA
estadoPago="Pendiente Transferencia"
mySQL="UPDATE programas_tmp SET "
mySQL=mySQL & "metodoPago = '" & metodoPago & "',"
mySQL=mySQL & "estadoPago = '" & estadoPago & "',"
mySQL=mySQL & "refPresupuesto = '" & refPresupuesto & "',"
mySQL=mySQL & "precioReserva = '" & pr_reserva & "',"
mySQL=mySQL & "fechaPago = '" & date & "'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)%>
<div class="proceso_fin"><span><i class="fa fa-check" aria-hidden="true"></i></span> Preinscripción realizada con éxito</div>
<div class="datos_pago">Para formalizar la reserva deberás realizar una transferencia por valor de <span class="datos_pago_pr"><%=FormatNumber(ccur(valor_total),2)%>&nbsp;<%=mon%></h5></span> en concepto de <u>Reserva</u> <%if pr_cancelacion_pr<>0then%> y <u>Seguro de Cancelación</u></div>
<%end if
Sql= "SELECT datos_transferencia FROM metodosPago WHERE id_metodoPago IS NOT NULL"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
datos_transferencia=ob_rs("datos_transferencia")%>
<div class="datos_pago">Los datos para ta transferencia bancaria son:
<span class="datos_pago_dat"><%=datos_transferencia%></span></div>
<div class="datos_pago"><span class="notas_fin">*Por favor, indica el nombre y apellidos del alumno en el concepto de la transferencia. Te recordamos también que dispones de un pazo de 72 horas para realizar la transferencia. Pasado dicho tiempo la plaza quedará libre y el alumno podría quedar fuera de la inscripción.<br><br>Te recordamos también que hemos enviado esta misma información, junto con la preinscripción en formato PDF a tu dirección de email. Por favor, revisa la carpeta de spam si no lo recibieras en 5 minutos.</span></div>
<%end if
ob_rs.close
end if ' /////////////////////////////////////  FIN PAGO TRANSFERENCIA
if metodoPago="pag_oficina" then ' /////////////////////////////////////  PAGO OFICINA
estadoPago="Pendiente Pago Oficina"
mySQL="UPDATE programas_tmp SET "
mySQL=mySQL & "metodoPago = '" & metodoPago & "',"
mySQL=mySQL & "estadoPago = '" & estadoPago & "',"
mySQL=mySQL & "refPresupuesto = '" & refPresupuesto & "',"
mySQL=mySQL & "precioReserva = '" & pr_reserva & "',"
mySQL=mySQL & "fechaPago = '" & date & "'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)%>
<div class="proceso_fin"><i class="fa fa-check" aria-hidden="true"></i> Preinscripción realizada con éxito</div>
<div class="datos_pago">Para formalizar la reserva deberás realizar el pago en metálico por valor de <span class="datos_pago_pr"><%=FormatNumber(ccur(valor_total),2)%>&nbsp;<%=mon%></span> en concepto de <u>Reserva</u> <%if pr_cancelacion_pr<>0then%> y <u>Seguro de Cancelación</u><%end if%> en nuestras oficinas centrales o en cualquiera de nuestras delegaciones.<span class="notas_fin" style="padding-top:60px">*Te recordamos también que dispones de un pazo de 72 horas para realizar el abono de la reserva. Pasado dicho tiempo la plaza quedará libre y el alumno podría quedar fuera de la inscripción.<br><br>Te recordamos también que hemos enviado esta misma información, junto con la preinscripción en formato PDF a tu dirección de email. Por favor, revisa la carpeta de spam si no lo recibieras en 5 minutos.</span></div>
<%end if ' /////////////////////////////////////  FIN PAGO OFICINA

if metodoPago="pag_oficina" or metodoPago="pag_transferencia" then
if mail_env="no" then
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
end if%> 

<!--#include file="pr_pdf_preins_mail.asp"-->
<%Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
if gen_mail="si"then
if mail_1<>mail_4 and mail_1<>""  then Mail.AddAddress mail_1 end if
if mail_2<>mail_4 and mail_2<>"" then Mail.AddAddress mail_2 end if
if mail_3<>mail_4 and mail_3<>"" then Mail.AddAddress mail_3 end if
Mail.AddAddress mail_4
Mail.AddBCC f_email 
else
Mail.AddAddress f_email
end if
if email<>"" then Mail.AddCC email  end if
strPath = Server.MapPath("..\up_docs\temp")
Mail.AddAttachment strPath & "\"& archivo & ""
asunto = limpia_mail(a_nombre) &" "& limpia_mail(a_apellidos) & " - Preinscripción en curso de idiomas " & limpia_mail(titulo_esp)
Mail.Subject =  Mail.EncodeHeader(asunto, "utf-8")
texto="<br><br>"
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola, "&a_nombre&".</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Muchas gracias por realizar la preinscripción para el curso <strong>"&titulo_esp&"</strong> con "&nombre_empresa&".</i></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/><br><br>Desde este momento tu plaza queda reservada<br><br>Dispones de un plazo de <u>72 horas</u> para hacer"
if metodoPago_m="pag_transferencia" then
texto= texto& " efectiva la transferencia por valor de <strong>"&FormatNumber(ccur(valor_total),2)&" "&mon_pdf&"</strong> en concepto de <strong>Reserva</strong>"
end if
if metodoPago_m="pag_oficina" then
texto= texto& " efectivo el abono por valor de "&FormatNumber(ccur(valor_total),2)&" euros en concepto de <strong>Reserva</strong> en cualquiera de nuestras oficinas o delegaciones"
end if
if pr_cancelacion_pr<>"No incluido*" and pr_cancelacion_pr<>"0" then
texto=texto &" y <strong>Seguro de Cancelación</strong>"
end if
texto=texto &" antes de que esta quede libre."
if metodoPago_m="pag_transferencia" then
texto=texto &" Recuerda indicar en ella nombre y apellidos del alumno"
texto=texto &"<br><br><br><p align=""center"">Los datos de la cuenta bancaria en la que se debe formalizar el ingreso son:<br><br><strong>"&datos_transferencia&"</p></strong>"
end if 
texto=texto &"<br><br>También es necesario que, a la mayor brevedad posible, nos remitas a la dirección de correo "&email&": fotocopia escaneada del <strong>NIF</strong> y, en el caso de cursos realizados fuera de la UE, <strong>pasaporte</strong> del alumno inscrito."
texto=texto &"<br><br>Estas gestiones, y muchas otras, puedes realizarlas desde tu área de usuario de la web "&url&". Para acceder solo necesitas el mail y la contraseña introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema, puedes ponerte en contacto con nosotros a través del mail <strong>"&email&"</strong> o bien del teléfono "&telefono&".<br><br>En el documento adjunto encontrarás la referencia de la preisncripción.<br><br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Gracias por confiar en "&nombre_empresa&"</i></p></font>"
texto=texto &"<br><br>"

Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&"  - "&provincia&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
'On Error Resume Next
'if gen_mail="si"then
Mail.Send 
'end if 
If Err <> 0 Then%>
<ul><li>Ha ocurrido un error en el elvío del mail, aunque el alumno ha quedado preinscrito.</li></ul>
<%end If 
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../up_docs/temp/" & archivo)) then
Set f2 = fso.GetFile(Server.MapPath("../up_docs/temp/" & archivo))
f2.Delete
end if
mySQL="UPDATE programas_tmp SET "
mySQL=mySQL & "mail_env = 'si'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if 'mail_env<>"si" then%>
<%if gen_mail="si" then%><div class="descarga_pdf_fin"><a href="<%=r%>web/pr_pdf_preins.asp?id_programa=<%=id_programa%>"><i class="fa fa-download" aria-hidden="true"></i> Descargar Preinscripción</a></div><%end if%>
<%end if 'metodoPago="pag_oficina" or metodoPago="pag_transferencia"
if metodoPago="pag_tarjeta" or metodoPago="pag_paypal" then  'PAGO POR TARJETA   ////////////////////
estadoPago="Pendiente"
refPago=int(refPago+1000)
if op="anticipo" then
anticipo="Anticipo de Cliente por Web"
valor_total=request("pago")
fecha=date
mail_env="no"
valor_total=request("pago")
mySQL="INSERT INTO programasAnticipos(id_programa,anticipo, precio, fecha, estadoPago, metodoPago, refPago, mail_env)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_programa & ","
mySQL=mySQL & "'" & anticipo & "',"
mySQL=mySQL & "'" & valor_total & "',"
mySQL=mySQL & "'" & fecha & "',"
mySQL=mySQL & "'" & estadoPago & "',"
mySQL=mySQL & "'" & metodoPago & "',"
mySQL=mySQL & "'" & refPago & "',"
mySQL=mySQL & "'" & mail_env & "'"
mySQL=mySQL & ");" 
set ob_rss=Ob_Connb.execute(mySQL)
else'ANTICIPO
mySQL="UPDATE programas_tmp SET "
mySQL=mySQL & "metodoPago = '" & metodoPago & "',"
mySQL=mySQL & "estadoPago = '" & estadoPago & "',"
mySQL=mySQL & "refPago = '" & refPago & "',"
mySQL=mySQL & "refPresupuesto = '" & refPresupuesto & "',"
mySQL=mySQL & "mail_env = 'no',"
mySQL=mySQL & "fechaPago = '" & date & "'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rss=Ob_Connb.execute(mySQL)
end if'ANTICIPO
Sql= "SELECT refPago FROM refPagos_tmp ORDER BY refPago desc" 'GUARDAMOS REFERENCIA PAGO EN REFPAGOS_TMP
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
mySQL="UPDATE refPagos_tmp SET "
mySQL=mySQL & "refPago = '" & refPago & "'"
set ob_rss=Ob_Connb.execute(mySQL)
else
mySQL="INSERT INTO refPagos_tmp(refPago)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & refPago & "'"
mySQL=mySQL & ");" 
set ob_rss=Ob_Connb.execute(mySQL)
end if
ob_rs.close
if metodoPago="pag_tarjeta" then
Sql= "SELECT tar_comercio, tar_cod_comercio, tar_pass,tar_test FROM metodosPago" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tar_comercio=ob_rs("tar_comercio")
tar_cod_comercio=ob_rs("tar_cod_comercio")
tar_pass=ob_rs("tar_pass")
tar_test=ob_rs("tar_test")
end if
ob_rs.close
url_send="https://sis.redsys.es/sis/realizarPago"
if tar_test="si"then 
tar_pass="sq7HjrUOBfKmC576ILgskD5srU870gJ7" 
url_send="https://sis-t.redsys.es:25443/sis/realizarPago"
end if
if op="anticipo" then
urlMerchant="http://www.cursit.com/web/lib/tpv/tar_recibir_ant.php"
urlweb_ok="http://www.cursit.com/web/lib/tpv/tar_recibir_ant.php"
urlweb_ko="http://www.cursit.com/web/lib/tpv/tar_recibir_ant.php"
valor_total=request("pago")
else
urlMerchant="http://www.cursit.com/web/lib/tpv/tar_recibir.php"
urlweb_ok="http://www.cursit.com/web/lib/tpv/tar_recibir.php"
urlweb_ko="http://www.cursit.com/web/lib/tpv/tar_recibir.php"
end if%>

<%valor_total=FormatNumber(ccur(valor_total),2)%>
<form name="formulario_tarjeta" id="formulario_tarjeta" action="<%=r%>reserva-tar" method='post' >
<input type="hidden" name="Precio" value="<%=valor_total * 100%>" />
<input type="hidden" name="Orden"  value="<%=refPago%>" />
<input type="hidden" name="urlMerchant"  value="<%=urlMerchant%>" />
<input type="hidden" name="urlweb_ok"  value="<%=urlweb_ok%>" />
<input type="hidden" name="urlweb_ko"  value="<%=urlweb_ko%>" />
<input type="hidden" name="url_send"  value="<%=url_send%>" />
<input type="hidden" name="cl"  value="<%=tar_pass%>" />
<input type="hidden" name="kodigo"  value="<%=tar_cod_comercio%>" />
<input type="hidden" name="comercio"  value="<%=tar_comercio%>" />
</form> 
<script type="text/javascript">setTimeout(function(){document.formulario_tarjeta.submit();}, 350);</script>
<%end if
if metodoPago="pag_paypal" then '/////////// SACAR DATOS DE WEBS
Sql= "SELECT pay_mail, pay_test FROM metodosPago" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
pay_mail=ob_rs("pay_mail")
pay_test=ob_rs("pay_test")
end if
ob_rs.close
url_pay="https://www.paypal.com/cgi-bin/webscr"
if pay_test="si" then url_pay="https://www.sandbox.paypal.com/cgi-bin/webscr" end if
if pay_test="si" then 
precioReserva= valor_total'//////////////////////  OJO A LA CANTIDAD!!
else
precioReserva=valor_total
end if%>
<form id="formulario_paypal" name="formulario_paypal" method="post" action="<%=url_pay%>" target="_self" name="paypal" >
<INPUT TYPE="hidden" name="charset" value="utf-8">
<input name="cmd" value="_cart" type="hidden">
<input name="upload" value="1" type="hidden"> 
<input name="lc" value="ES" type="hidden"> 
<input name="business" value="<%=pay_mail%>" type="hidden">
<input name="shopping_url" value="https://www.getupidiomas.com" type="hidden">
<input name="currency_code" value="EUR" type="hidden">
<input name="rm" value="0" type="hidden">
<%if op="anticipo" then%>
<input name="notify_url" value="http://www.cursit.com/web/reserva2_pay_lst_ant.asp" type="hidden">   <!-- //////////////// CAMBIAR CANDO ESTÉ OK //////////////////-->
<input type="hidden" name="return" value="http://www.cursit.com/web/reserva2_pay_ant.asp"> 
<input type="hidden" name="cancel_return" value="http://www.cursit.com/web/reserva2_pay_ant.asp"> 
<%else%>
<input name="notify_url" value="http://www.cursit.com/web/reserva2_pay_lst.asp" type="hidden">   <!-- //////////////// CAMBIAR CANDO ESTÉ OK //////////////////-->
<input type="hidden" name="return" value="http://www.cursit.com/web/reserva2_pay.asp"> 
<input type="hidden" name="cancel_return" value="http://www.cursit.com/web/reserva2_pay.asp"> 
<%end if%>
<input name="custom" value="<%=refPago%>" type="hidden">
<input name="item_number_1" value="<%=id_curso%>" type="hidden">
<input name="item_name_1" value="<%=nom_item%>" type="hidden">
<%if op="anticipo" then%>
<input name="amount_1" value="<%=replace(valor_total,",",".")%>" type="hidden">
<%else%>
<input name="amount_1" value="<%=replace(precioReserva,",",".")%>" type="hidden">
<%end if%>
<input name="quantity_1" value="1" type="hidden">
</form>
<script type="text/javascript">setTimeout(function(){document.formulario_paypal.submit();}, 350);</script>
<%end if%>
<div class="redirige_tpv"><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Un momento, por favor...</div>
<%end if 'PAGO TARJETA / PAYPAL%>
</div></div></div></div>
<%if z_privada="si"then%></div><%end if%>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>$(document).ready(function(e) {$('#spinner_back').fadeOut(500);})</script>