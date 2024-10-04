<link href="web/lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="web/lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<body class="fuente2"><div class="centra_panel"><div class="panel panel-default pagos_pasarela">
<div class="panel-heading"><h3 class="panel-title" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right:10px"></i>Finalizando proceso de test de nivel</h3></div>
<div class="panel-body"><div class="nota_tpv">Un segundo, por favor. Estamos filalizando el proceso de env&iacute;o del test de nivel.</div>
<div id="progress"><div class="progress-bar"></div></div></div></div></div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<%dim cont, nivel
cont = 0
Nombre = request.form("Nombre")
Edad = request.form("edad")
eMail = request.form("email")

if request.form("Pregunta1") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 2") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 3") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 4") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 5") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 6") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 7") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 8") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 9") = 2 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 10") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 11") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 12") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 13") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 14") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 15") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 16") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 17") = 2 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 18") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 19") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 20") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 21") = 2 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 22") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 23") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 24") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 25") = 2 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 26") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 27") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 28") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 29") = 3 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 30") = 1 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 31") = 4 then
cont = cont + 1
else
cont = cont
end if

if request.form("Pregunta 32") = 4 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 33") = 3 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 34") = 2 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 35") = 4 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 36") = 3 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 37") = 4 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 38") = 3 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 39") = 4 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 40") = 2 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 41") = 3 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 42") = 3 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 43") = 2 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 44") = 3 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 45") = 2 then
cont = cont + 1
else
cont = cont
end if
if request.form("Pregunta 46") = 2 then
cont = cont + 1
else
cont = cont
end if
if cont = 0 then
nivel_idioma = "Zoquete"
end if
if cont >= 1 and cont <= 14 then
nivel_idioma = "Elementary"
end if
if cont > 14 and cont <= 26 then
nivel_idioma = "Pre-Intermediate"
end if
if cont > 26 and cont <= 32 then
nivel_idioma = "Intermediate"
end if
if cont > 32 and cont <= 43 then
nivel_idioma = "Upper-Intermediate"
end if
if cont > 43 then
nivel_idioma = "Advanced"
end if
Dim Ob_conn, ob_command
rd="../"
Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_Command = Server.CreateObject ("ADODB.Command")
Ob_Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/front.mdb")
Ob_Command.ActiveConnection = Ob_Conn
Const adCmdText = &H0001
Const adOpenStatic = 3
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
email_emp=ob_rs("email")
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
nombre_img=ob_rs("nombre")
nombre_img=url_c&nombre_img
alt=ob_rs("alt")
end if
ob_rs.close
end if
function deslimpia(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "´", "" ) '"
output = replace( output, "á", "a" ) '"
output = replace( output, "é", "e" ) '"
output = replace( output, "í", "i" ) '"
output = replace( output, "ó", "o" ) '"
output = replace( output, "ú", "u" ) '"
output = replace( output, "Á", "A" ) '"
output = replace( output, "É", "E" ) '"
output = replace( output, "Í", "I" ) '"
output = replace( output, "Ó", "O" ) '"
output = replace( output, "Ú", "U" ) '"
output = replace( output, "ñ", "n" ) '"
output = replace( output, "Ñ", "N" ) '"
output = replace( output, "`", "" ) '"
output = replace( output, "à", "a" ) '"
output = replace( output, "è", "e" ) '"
output = replace( output, "ì", "i" ) '"
output = replace( output, "ò", "o" ) '"
output = replace( output, "ù", "u" ) '"
output = replace( output, "ü", "u" ) '"
output = replace( output, "Ü", "U" ) '"
output = replace( output, "ö", "o" ) '"
output = replace( output, "Ö", "O;" ) '"
output = replace( output, "&aacute;", "a" ) '"
output = replace( output, "&eacute;", "e" ) '"
output = replace( output, "&iacute;", "i" ) '"
output = replace( output, "&oacute;", "o" ) '"
output = replace( output, "&uacute;", "u" ) '"
output = replace( output, "&Aacute;", "A" ) '"
output = replace( output, "&Eacute;", "E" ) '"
output = replace( output, "&Iacute;", "I" ) '"
output = replace( output, "&Oacute;", "O" ) '"
output = replace( output, "&Uacute;", "U" ) '"
output = replace( output, "&agrave;", "a" ) '"
output = replace( output, "&egrave;", "e" ) '"
output = replace( output, "&igrave;", "i" ) '"
output = replace( output, "&ograve;", "o" ) '"
output = replace( output, "&ugrave;", "u" ) '"
output = replace( output, "&Agrave;", "A" ) '"
output = replace( output, "&Egrave;", "E" ) '"
output = replace( output, "&Igrave;", "I" ) '"
output = replace( output, "&Ograve;", "O" ) '"
output = replace( output, "&Ugrave;", "U" ) '"
output = replace( output, "&uuml;", "u" ) '"
output = replace( output, "&Uuml;", "U" ) '"
if crm="si"then deslimpia= output else deslimpia= lcase(output) end if
end function
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = email_smtp
if email_ssl="si" then Mail.TLS = True
Mail.Port = email_puerto
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Get Up - Cursos de Idiomas"
Mail.AddAddress f_email 
Mail.AddAddress eMail 
asunto = deslimpia(nombre) &" - Test de Nivel "
Mail.Subject = Mail.EncodeHeader(asunto,  "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&nombre&"!</i></font><br><br><br><font size=""3"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">Gracias por realizar el Test de nivel de idiomas con Get Up. Tu resultado ha sido:<br><br>Nivel: "&nivel_idioma&"<br>Aciertos: "&cont&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email_emp&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email_emp&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
Mail.Send
If Err <> 0 Then
Response.Write "Ocurrió un error: " & Err.Description
End If 
'response.redirect("respuesta-test")%>
</body>
<form id="formulario_test" name="formulario_test" action="respuesta-test" method="post"></form>
<script src="web/lib/js/jquery.min.js" type="text/javascript"></script>
<script src="web/lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$('#spinner_back').fadeOut(500);
var progression = 0,
progress = setInterval(function() 
{$('#progress .progress-text').text(progression + '%');$('#progress .progress-bar').css({'width':progression+'%'});
if(progression == 100) {clearInterval(progress);//alert('done');
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){document.formulario_test.submit();}, 350);});//
} else
progression += 20;
}, 450);
</script>
