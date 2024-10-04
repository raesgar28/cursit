<%rd="../../"
Set Upload = Server.CreateObject("Persits.Upload.1")
'Upload.CodePage = 65001
Upload.OverwriteFiles = False
Upload.SetMaxSize 1048576	' Limit files to 1MB
Upload.Save
r=upload.Form("r")
no_estil="si"%>
<link href="<%=r%>lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
<link href="<%=r%>lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/layout.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/custom.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css">
<!--#include file="../comun/menu_sup.asp"-->
<!--#include file="../../conex/conex_back.asp"--> 
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<div class="row">
<div class="col-md-12">

<%function safeSTR(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "´", "&acute;" ) '"
output = replace( output, "á", "&aacute;" ) '"
output = replace( output, "é", "&eacute;" ) '"
output = replace( output, "í", "&iacute;" ) '"
output = replace( output, "ó", "&oacute;" ) '"
output = replace( output, "ú", "&uacute;" ) '"
output = replace( output, "Á", "&Aacute;" ) '"
output = replace( output, "É", "&Eacute;" ) '"
output = replace( output, "Í", "&Iacute;" ) '"
output = replace( output, "Ó", "&Oacute;" ) '"
output = replace( output, "Ú", "&Uacute;" ) '"
output = replace( output, "ñ", "&ntilde;" ) '"
output = replace( output, "Ñ", "&Ntilde;" ) '"
output = replace( output, "`", "&#96;" ) '"
output = replace( output, "à", "&agrave;" ) '"
output = replace( output, "è", "&egrave;" ) '"
output = replace( output, "ì", "&igrave;" ) '"
output = replace( output, "ò", "&ograve;" ) '"
output = replace( output, "ù", "&ugrave;" ) '"
output = replace( output, "ü", "&uuml;" ) '"
output = replace( output, "Ü", "&Uuml;" ) '"
output = replace( output, "ö", "&ouml;" ) '"
output = replace( output, "Ö", "&Ouml;" ) '"
output = replace( output, "¿", "&iquest;" ) '"
output = replace( output, "&#34;", chr(34) ) '"
output = replace( output, chr(34), "&#34;" ) '"
output = replace( output, chr(39), "&#39;" )  '
output = replace( output, chr(63), "&#63;" ) '?
output = replace( output, "ª", "&ordf;" ) '?
output = replace( output, "º", "&deg;" ) '?
safeSTR= output
end function
function safeSTR2(str)
dim output
output = server.HTMLEncode(str)
output = str
safeSTR2=output
end function
function limpia_url(cadena_url)
nombre_lk = server.HTMLEncode(cadena_url)
nombre_lk = cadena_url
s1 = "ÁÀÉÈÍÏÓÒÚÜáàèéíïóòúüÑñ"
s2 = "AAEEIIOOUUaaeeiioouuNn"
if len(nombre_lk) <> 0 then
For i2 = 1 to Len(s1)
nombre_lk = replace(nombre_lk,mid(s1,i2,1),mid(s2,i2,1))
nombre_lk = replace(nombre_lk, " · ","-")
nombre_lk = replace(nombre_lk, " - ","-")
nombre_lk = replace(nombre_lk, " ","-")
nombre_lk = replace(nombre_lk, "&#241;","n")
nombre_lk = replace(nombre_lk, "&#209;","n")
nombre_lk = replace( nombre_lk, chr(39), "" )  '
nombre_lk = replace( nombre_lk, "&#39;", "" ) 
nombre_lk = replace(nombre_lk, "-/-","-")
nombre_lk = replace(nombre_lk, "/","-")
nombre_lk = replace(nombre_lk, ".","-")
nombre_lk = replace( nombre_lk, "´", "" ) '"
nombre_lk = replace( nombre_lk, "&aacute;", "a" ) '"
nombre_lk = replace( nombre_lk, "&eacute;", "e" ) '"
nombre_lk = replace( nombre_lk, "&iacute;", "i" ) '"
nombre_lk = replace( nombre_lk, "&oacute;", "o" ) '"
nombre_lk = replace( nombre_lk, "&uacute;", "u" ) '"
nombre_lk = replace( nombre_lk, "&Aacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Eacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Iacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Oacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&Uacute;", "" ) '"
nombre_lk = replace( nombre_lk, "&ntilde;", "n" ) '"
nombre_lk = replace( nombre_lk, "&Ntilde;", "N" ) '"
nombre_lk = replace( nombre_lk, "&#96;", "" ) '"
nombre_lk = replace( nombre_lk, "&agrave;", "a" ) '"
nombre_lk = replace( nombre_lk, "&egrave;", "e" ) '"
nombre_lk = replace( nombre_lk, "igrave;", "i" ) '"
nombre_lk = replace( nombre_lk, "&ograve;", "o" ) '"
nombre_lk = replace( nombre_lk, "&ugrave;", "u" ) '"
nombre_lk = replace( nombre_lk, "&uuml;", "u" ) '"
nombre_lk = replace( nombre_lk, "&Uuml;", "U" ) '"
nombre_lk = replace( nombre_lk, "¿", "" ) '"
nombre_lk = replace( nombre_lk, "&iquest;", "" ) '"
nombre_lk = replace( nombre_lk, "?", "" ) '"
nombre_lk = replace( nombre_lk, "&#34;", chr(34) ) '"
nombre_lk = replace( nombre_lk, chr(34), "" ) '"
nombre_lk = replace( nombre_lk, chr(63), "" ) '?
nombre_lk = replace(nombre_lk, "&","y")
nombre_lk = replace(nombre_lk, "&amp;","y")
nombre_lk = lcase(nombre_lk)
next
end if
limpia_url=nombre_lk
end function
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
output = replace( output, "Ö", "O" ) '"
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
output = replace( output, "&ntilde;", "n" ) '"
if crm="si"then deslimpia= output else deslimpia= lcase(output) end if
deslimpia= output
end function

rd=upload.Form("rd")
n=upload.Form("n")
ndos=upload.Form("ndos")
ntres=upload.Form("ntres")
ncuat=upload.Form("ncuat")
op=upload.Form("op")
cod=upload.Form("cod")
cod_cat=upload.Form("cod_cat")
mail_aviso=upload.form("mail_aviso")
mail_aviso_test=upload.form("mail_aviso_test")
id_usuario_ctrl=0%>
<!--#include file="../../conex/conex_back.asp"-->
<%titulo_esp=trim(safeSTR(upload.Form("titulo_esp")))                          '[REQUEST]
texto_esp=trim(safeSTR2(upload.Form("texto_esp")))
fecha_in=now
fecha_mod=now         
Dim id_destino_(30)
For Each Item in upload.Form
If Item.Name = "id_destino" Then
id_destino = Item.Value & "," & id_destino
End If
Next
if id_destino<>""then
id_destino = Left( id_destino, (Len(id_destino)-1))
cadena_rel = id_destino
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_destino_("&i&")=cadena_rel("&i&")")
execute("if id_destino_("&i&")="""" then id_destino_("&i&")=0")
next
end if
id_categoria_p=upload.form("id_categoria_p")
id_categoria=upload.form("id_categoria")
if id_categoria=""then id_categoria=id_categoria_p end if
Dim id_seccion_(30)
For Each Item in upload.Form
If Item.Name = "id_seccion" Then
id_seccion = Item.Value & "," & id_seccion
End If
Next
if id_seccion<>""then
id_seccion = Left( id_seccion, (Len(id_seccion)-1))
cadena_rel = id_seccion
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_seccion_("&i&")=cadena_rel("&i&")")
execute("if id_seccion_("&i&")="""" then id_seccion_("&i&")=0")
next
end if
Dim id_subseccion_(30)
For Each Item in upload.Form
If Item.Name = "id_subseccion" Then
id_subseccion = Item.Value & "," & id_subseccion
End If
Next
if id_subseccion<>""then
id_subseccion = Left( id_subseccion, (Len(id_subseccion)-1))
cadena_rel = id_subseccion
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_subseccion_("&i&")=cadena_rel("&i&")")
execute("if id_subseccion_("&i&")="""" then id_subseccion_("&i&")=0")
next
end if

Dim id_item_(30)
For Each Item in upload.Form
If Item.Name = "id_item" Then
id_item = Item.Value & "," & id_item
End If
Next
if id_item<>""then
id_item = Left( id_item, (Len(id_item)-1))
cadena_rel = id_item
cadena_rel = split(cadena_rel, ",")
for i=0 to ubound(cadena_rel)
execute("id_item_("&i&")=cadena_rel("&i&")")
execute("if id_item_("&i&")="""" then id_item_("&i&")=0")
next
end if
Dim del_(4)
del_(1)=upload.form("del_1")
del_(2)=upload.form("del_2")
del_(3)=upload.form("del_3")
del_(4)=upload.form("del_4")
'id_item  =upload.Form("id_item")     


Sql= "SELECT id_pack from packs where id_categoria ="&cod_cat&""     '[TOTAL PACKS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
num_pk=ob_rs.RecordCount
end if
ob_rs.close

                                      '[FIN REQUEST]
if op="up" then
Sql= "SELECT titulo_esp from packs where titulo_esp='"&titulo_esp&"' and id_pack<>"&cod&""     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT titulo_esp from packs where titulo_esp='"&titulo_esp&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&cod_cat="&cod_cat&"&ms=ko&cod_cat="&cod_cat)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&cod_cat="&cod_cat&"&ms=ko&cod_cat="&cod_cat) 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat="&cod_cat)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat="&cod_cat) 
end if
end if													'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in" and titulo_esp<>""then															 '[OPCION INSERTAR]
mySQL="INSERT INTO packs (titulo_esp,texto_esp,fecha_in,id_categoria)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "" & id_categoria & ""
	mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_pack) from packs") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up" and titulo_esp<>""then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE packs SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "id_categoria = " & id_categoria & ""
mySQL=mySQL & " WHERE id_pack = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
												'[METEMOS ARCHGIVOS]
For Each File in Upload.Files
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\..\up_docs\alu_packs\pack-\") & nombre  & File.ext 'NO ENTIENDO PQ SE RENOMBRA CON ALUPACKS!!!
nombre=File.FileName
arch_extension=File.Ext
arch_peso=File.Size
if arch_extension=".pdf" or arch_extension=".doc" or arch_extension=".docx" or arch_extension=".xls" or arch_extension=".txt" then tipo="documento" else tipo="imagen" end if
mySQL="INSERT INTO packs_rel_archivos (id_pack,nombre,tipo,extension,peso)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & tipo & "',"
mySQL=mySQL & "'" & arch_extension & "',"
mySQL=mySQL & "" & arch_peso & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
'set ob_rs = Ob_Connb.execute("select MAX(id_archivo) from archivos") 
'id_archivo = ob_rs(0)
Next
										     '[FIN METEMOS ARCVHVOS]
mySQL="DELETE FROM packs_rel where id_pack =" & cod & " " 
set ob_rs=Ob_connb.execute(mySQL)
if mail_aviso="si" or mail_aviso_test="si" then
cambio="La documentaci&oacute;n relativa a tu Pasaporte o NIF escaneados ha sido modificada."
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
nombre_img=ob_rs("nombre")
nombre_img=url_c&nombre_img
alt=ob_rs("alt")
end if
ob_rs.close
end if
end if
anyo_act=year(date)
anyo_nxt=year(date)+1%>

<div class="breadcrumbs">
<h1>Packs | Gestión Packs | Resultado ENvio</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncua&"&cod_cat="&cod_cat))%>
<a href="<%=r%>packs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>">Listado Packs</a></li>
<li class="active">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok"))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok")%>">Gestión Pack</a>
</li>
</ol>
</div>

<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>packs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>"><i class="icon-list"></i>Packs
<%if num_pk<>""then%><span class="baddge badge badge-default"> <%=num_pk%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
<li class="active">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok"))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok")%>"><i class="icon-pin"></i> Gestión</a></li>
</ul>
</nav>
</div>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line"><div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Packs | Resultado envío<%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div></div>
<div class="portlet-body">
<div class="col-md-12" >

<%if id_categoria<>0 and id_categoria <>"" and id_item="" and id_destino="" and id_seccion="" then  '///////  CASO ID CATEGORIA

cod_cat=id_categoria
mySQL="INSERT INTO packs_rel (id_categoria,id_pack)" 	
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_categoria & ","
mySQL=mySQL & "" & cod &""
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
'INICIO MAIL
if pack<>"si" AND (mail_aviso="si" or mail_aviso_test="si" )AND id_seccion=0 AND id_item=0 AND id_destino=0 then
Sql3= "SELECT id_usuario, id_alumno, nom_item FROM programas WHERE id_categoria = "&id_categoria&" and year(f_inicio)= '"&anyo_act&"' or year(f_inicio)= '"&anyo_nxt&"' "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
pack=""'si
tt=1
do while not ob_rs3.eof
%><div class="col-md-4"><%
cambio="Hemos remitido nuevos documentos a la secci&oacute;n PACKS para tu curso de idiomas " &ob_rs3("nom_item")& ". Por favor ve a tu zona de usuario y desc&aacute;rgalos en PACKS."
no_cambio="si"
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&ob_rs3("id_alumno")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&ob_rs3("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close
mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email
if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email and a_p_email="" then mail_2= u_email end if
if u_email=a_m_email and a_m_email="" then  mail_3= u_email end if
%><b><%=a_nombre%> <%=a_apellidos%>:</b></br><%
if mail_1<>mail_4  and mail_1<>"" then 'and mail_1<>mail_2 and mail_1<>mail_3
Mail.AddAddress mail_1
%>Mail 1: <%=mail_1%> <br><%
num=num+1
end if
if mail_2<>mail_4 and mail_2<>mail_1 and mail_2<>mail_3 and mail_2<>"" then
Mail.AddAddress mail_2
%>Mail 2: <%=mail_2%> <br><%
num=num+1
end if
if mail_3<>mail_4 and mail_3<>mail_1 and mail_3<>mail_2 and mail_3<>"" then
Mail.AddAddress mail_3
%>Mail 3: <%=mail_3%> <br><%
num=num+1
end if
if int(id_usuario_ctrl)<>int(ob_rs3("id_usuario")) then
Mail.AddAddress mail_4
%>Mail 4: <%=mail_4%> <br><%

else
id_usuario_ctrl=0
end if
num=num+1
%>Asunto:<br><%=cambio%><br><br><%
asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Datos modificados "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next'////////////////////////////OJO///////////////////////////////
if mail_aviso_test<>"si" then
Mail.Send
end if
If Err <> 0 Then env_mail_res_alu="ko"end If '////////////////////////////OJO///////////////////////////////
%></div><%
ob_rs3.movenext
if tt=3 then%>
<div class="col-md-12"></div>
<%tt=0
end if
tt=tt+1
loop
end if
ob_rs3.close
end if
'FIN MAIL
end if


for i=0 to 30 '//////////////////////////// CASO ID_SECION
if id_seccion_(i)<>0  then 

mySQL="INSERT INTO packs_rel (id_seccion,id_pack)" 	
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_seccion_(i) & ","
mySQL=mySQL & "" & cod &""
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
'INICIO MAIL
if pack<>"si" AND (mail_aviso="si" or mail_aviso_test="si") then
Sql6= "SELECT id_item FROM rel WHERE id_seccion = "&id_seccion_(i)&" and id_item<>0 GROUP BY id_item"
Set Ob_RS6 = Server.CreateObject("ADODB.Recordset")
Ob_RS6.Open Sql6, ob_conn,adOpenStatic, adCmdText
if not ob_rs6.eof then
do while not ob_rs6.eof
Sql3= "SELECT id_usuario, id_alumno, nom_item FROM programas WHERE id_item = "&ob_rs6("id_item")&" and (year(f_inicio)= '"&anyo_act&"' or year(f_inicio)= '"&anyo_nxt&"') "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
pack="" 'si
tt=1
Sql7= "SELECT titulo_esp FROM secciones WHERE id_seccion = "&id_seccion_(i)&" "
Set Ob_RS7 = Server.CreateObject("ADODB.Recordset")
Ob_RS7.Open Sql7, ob_conn,adOpenStatic, adCmdText
if not ob_rs7.eof then
cambio="Hemos remitido nuevos documentos a la sección PACKS para tu curso de idiomas incluido en la secci&oacute;n " &ob_rs7("titulo_esp")& ". Por favor ve a tu zona de usuario y desc&aacute;rgalos en el apartado PACKS."
end if
ob_rs7.close
do while not ob_rs3.eof

%><div class="col-md-4"><%

Set Mail = Server.CreateObject("Persits.MailSender")
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&ob_rs3("id_alumno")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close


%><b><%=a_nombre%> <%=a_apellidos%>:</b></br><%


Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&ob_rs3("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close

mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email
if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email and a_p_email="" then mail_2= u_email end if
if u_email=a_m_email and a_m_email="" then  mail_3= u_email end if
if mail_1<>mail_4 and mail_1<>mail_2 and mail_1<>mail_3 and mail_1<>"" then
Mail.AddAddress mail_1
%>Mail 1: <%=mail_1%> <br><%
num=num+1
end if
if mail_2<>mail_4 and mail_2<>mail_1 and mail_2<>mail_3 and mail_2<>"" then
Mail.AddAddress mail_2
%>Mail 2: <%=mail_2%> <br><%
num=num+1
end if
if mail_3<>mail_4 and mail_3<>mail_1 and mail_3<>mail_2 and mail_3<>"" then
Mail.AddAddress mail_3
%>Mail 3: <%=mail_3%> <br><%
num=num+1
end if
if int(id_usuario_ctrl)<>int(ob_rs3("id_usuario")) then
Mail.AddAddress mail_4
%>Mail 4: <%=mail_4%> <br><%
else
id_usuario_ctrl=0
end if
num=num+1
%><br><br><%

asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Documentos Modificados"
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next'////////////////////////////OJO///////////////////////////////
if mail_aviso_test<>"si" then
Mail.Send
end if
If Err <> 0 Then env_mail_res_alu="ko"end If '////////////////////////////OJO///////////////////////////////



ob_rs3.movenext%>
</div>
<%if tt=3 then%>
<div class="col-md-12"></div>
<%tt=0
end if
tt=tt+1
loop



end if
ob_rs3.close
ob_rs6.movenext
loop
end if
ob_rs6.close
end if
'FIN MAIL
end if







if id_subseccion_(i)<>0 then
mySQL="INSERT INTO packs_rel (id_subseccion,id_pack)" 	
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_subseccion_(i) & ","
mySQL=mySQL & "" & cod &""
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
'FALTA ENCVIAR MAIL A SUBSECCION
end if
if id_destino_(i)<>0 then
mySQL="INSERT INTO packs_rel (id_destino,id_pack)" 	
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_destino_(i) & ","
mySQL=mySQL & "" & cod &""
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
'INICIO MAIL
if pack<>"si" AND (mail_aviso="si" or mail_aviso_test="si") then
Sql3= "SELECT id_usuario, id_alumno, nom_item FROM programas WHERE id_destino = "&id_destino_(i)&" and (year(f_inicio)= '"&anyo_act&"' or year(f_inicio)= '"&anyo_nxt&"') "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
pack="" 'si
tt=1
do while not ob_rs3.eof
%><div class="col-md-4"><%

cambio="Hemos remitido nuevos documentos a la sección PACKS para tu curso de idiomas " &ob_rs3("nom_item")& ". Por favor ve a tu zona de usuario y desc&aacute;rgalos en el apartado PACKS."
no_cambio="si"
Set Mail = Server.CreateObject("Persits.MailSender")
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&ob_rs3("id_alumno")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&ob_rs3("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close
%><b><%=a_nombre%> <%=a_apellidos%>:</b></br><%

mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email
if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email and a_p_email="" then mail_2= u_email end if
if u_email=a_m_email and a_m_email="" then  mail_3= u_email end if
if mail_1<>mail_4 and mail_1<>mail_2 and mail_1<>mail_3 and mail_1<>"" then
Mail.AddAddress mail_1
%>Mail 1: <%=mail_1%> <br><%
num=num+1
end if
if mail_2<>mail_4 and mail_2<>mail_1 and mail_2<>mail_3 and mail_2<>"" then
Mail.AddAddress mail_2
%>Mail 2: <%=mail_2%> <br><%
num=num+1
end if
if mail_3<>mail_4 and mail_3<>mail_1 and mail_3<>mail_2 and mail_3<>"" then
Mail.AddAddress mail_3
%>Mail 3: <%=mail_3%> <br><%
num=num+1
end if
if int(id_usuario_ctrl)<>int(ob_rs3("id_usuario")) then
Mail.AddAddress mail_4
%>Mail 4: <%=mail_4%> <br><%
else
id_usuario_ctrl=0
end if
num=num+1
%><br>Asunto:<br><%=cambio%>
<br><br><%

asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Datos modificados "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next'////////////////////////////OJO///////////////////////////////
if mail_aviso_test<>"si" then
Mail.Send
end if
If Err <> 0 Then env_mail_res_alu="ko"end If '////////////////////////////OJO///////////////////////////////
ob_rs3.movenext
%></div>
<%if tt=3 then%>
<div class="col-md-12"></div>
<%tt=0
end if
tt=tt+1

loop
end if
ob_rs3.close
end if
'FIN MAIL
end if







if id_item_(i)<>0 then



mySQL="INSERT INTO packs_rel (id_item,id_pack)" 	
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_item_(i) & ","
mySQL=mySQL & "" & cod &""
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
'INICIO MAIL
if pack<>"si" AND (mail_aviso="si" or mail_aviso_test="si") then
Sql3= "SELECT id_usuario, id_alumno, nom_item FROM programas WHERE id_item = "&id_item_(i)&" and (year(f_inicio)= '"&anyo_act&"' or year(f_inicio)= '"&anyo_nxt&"') "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
pack="" 'si
tt=1
do while not ob_rs3.eof
%><div class="col-md-4"><%
cambio="Hemos remitido nuevos documentos a la sección PACKS para tu curso de idiomas " &ob_rs3("nom_item")& ". Por favor ve a tu zona de usuario y desc&aacute;rgalos en el apartado PACKS."
Set Mail = Server.CreateObject("Persits.MailSender")
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&ob_rs3("id_alumno")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&ob_rs3("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close

%><b><%=a_nombre%> <%=a_apellidos%>:</b></br><%

mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email
if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email and a_p_email="" then mail_2= u_email end if
if u_email=a_m_email and a_m_email="" then  mail_3= u_email end if
if mail_1<>mail_4 and mail_1<>mail_2 and mail_1<>mail_3 and mail_1<>"" then
Mail.AddAddress mail_1

%>

Mail 1: <%=mail_1%> <br><%
num=num+1
end if
if mail_2<>mail_4 and mail_2<>mail_1 and mail_2<>mail_3 and mail_2<>"" then
Mail.AddAddress mail_2
%>Mail 2: <%=mail_2%> <br><%
num=num+1
end if
if mail_3<>mail_4 and mail_3<>mail_1 and mail_3<>mail_2 and mail_3<>"" then
Mail.AddAddress mail_3
%>Mail 3: <%=mail_3%> <br><%
num=num+1
end if
if int(id_usuario_ctrl)<>int(ob_rs3("id_usuario")) then
Mail.AddAddress mail_4
%>Mail Usuario: <%=mail_4%> <%
else
id_usuario_ctrl=0
end if
num=num+1
%><br><br><%
asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Datos modificados "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""23"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next'////////////////////////////OJO///////////////////////////////
if mail_aviso_test<>"si" then
Mail.Send
end if
If Err <> 0 Then env_mail_res_alu="ko"end If '////////////////////////////OJO///////////////////////////////
ob_rs3.movenext
%></div>
<%if tt=3 then%>
<div class="col-md-12"></div>
<%tt=0
end if
tt=tt+1
loop
end if
ob_rs3.close
end if
'FIN MAIL
end if
next%>

<div class="col-md-12"><%if no_cambio<>"si" then%><b>Cuerpo de mensaje:</b> <br><%=cambio%> <br><br><%end if%><b>Emails enviados totales <%if mail_aviso_test="si" then%>(simulación)<%end if%> :</b> <%=num%></div>
<%for i=1 to 4
if del_(i)<> "" then
Sql= "SELECT nombre from packs_rel_archivos where id_pack_rel_archivo="&del_(i)&""                             
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_packs/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_packs/" & ob_rs("nombre")))
f2.Delete
end if
end if
end if
mySQL="DELETE FROM packs_rel_archivos where id_pack_rel_archivo =" & del_(i) & " "
set ob_rs2=Ob_Connb.execute(mySQL)
end if
next
'REDIRECCIONAMOS
if mail_aviso<>"si" then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok")%>
<%end if%>
</div>


<div class="form-body">                                                  
<div class="row">
<div class="col-md-offset-4 col-md-12">
<div class="col-md-5"><br><br>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok"))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&cod_cat="&cod_cat&"&ms=ok")%>" class="btn green" ><i class="fa fa-reply" aria-hidden="true"></i> volver a gestión</a><br><br>
</div></div>
</div>
</div>






</div>
</div>
</div>

</div></div></div></div>



<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="<%=r%>lib/app/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<style>div.dt-button-collection{position:absolute;top:0px;margin-top:-20px}@media screen and (max-width : 470px){div.dt-button-collection{position:absolute;top:0px;margin-top:-180px}}
@media screen and (min-width : 470px) and (max-width : 680px){div.dt-button-collection{position:absolute;top:0px;margin-top:-100px}}</style>
<script>
$.fn.dataTableExt.afnFiltering.push(
function( oSettings, aData, iDataIndex ) {
var iFini = document.getElementById('fini').value;
var iFfin = document.getElementById('ffin').value;
var iStartDateCol = 6;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 6;                               // INDICA COLUMNA PARA BUSCAR FECHA
iFini=iFini.substring(6,10) + iFini.substring(3,5)+ iFini.substring(0,2);
iFfin=iFfin.substring(6,10) + iFfin.substring(3,5)+ iFfin.substring(0,2);
var datofini=aData[iStartDateCol].substring(6,10) + aData[iStartDateCol].substring(3,5)+ aData[iStartDateCol].substring(0,2);
var datoffin=aData[iEndDateCol].substring(6,10) + aData[iEndDateCol].substring(3,5)+ aData[iEndDateCol].substring(0,2);
if ( iFini === "" && iFfin === "" ){return true;}
else if ( iFini <= datofini && iFfin === ""){return true;}
else if ( iFfin >= datoffin && iFini === ""){return true;}
else if (iFini <= datofini && iFfin >= datoffin){return true;}return false;});
/* EN CASO DE OTROS RANGOS DE FILTRO */
$.fn.dataTable.ext.search.push(
function( settings, data, dataIndex ) {
var min = parseInt( $('#min').val(), 10 );
var max = parseInt( $('#max').val(), 10 );
var age = parseFloat( data[3] ) || 0; // DATA[] PARA COLUMNA
if ( ( isNaN( min ) && isNaN( max ) ) ||
( isNaN( min ) && age <= max ) ||
( min <= age   && isNaN( max ) ) ||
( min <= age   && age <= max ) )
{return true;}return false;});
$(document).ready(function() {
var initTable3 = function () {
var table = $('#listado');
var oTable = table.dataTable({
"language": {
"aria": {"sortAscending": ": activate to sort column ascending","sortDescending": ": activate to sort column descending"},
"emptyTable": "No hay registros con esos criterios",
"info": "_START_ a _END_ de _TOTAL_ registros encontrados",
"infoEmpty": "No entries found",
"infoFiltered": "(de un total de _MAX_ registros)",
"lengthMenu": "_MENU_ ",
"search": "Buscar: ",
"zeroRecords": "No se encontraron registros",
"processing": "Un momento...cargando datos..." },
processing: true,//responsive: true,
columnDefs: [ 
{orderable: false, targets:   0},
{orderable: false, targets:   7},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
{ responsivePriority: 1, targets: 1 },
{ responsivePriority: 2, targets: -1 }
],
buttons: [
{extend: 'print', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'copy', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'pdf', className: 'esconde' , exportOptions: {columns: ':visible'} },
{ extend: 'excel', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'csv', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'colvis', className: 'esconde',  columns: (':not(.no_exp)')}
],
"order": [[1, 'asc']],
"lengthMenu": [[20, 50, 75, 100, -1],[20, 50, 75, 100, "Todos"]],
"pageLength": 20,
"dom": "<'row' <'col-md-12'B>><'table-scrollable't><'row' <'col-md-12'>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", 
});
$('#acciones > li > a.tool-action').on('click', function() {var action = $(this).attr('data-action');oTable.DataTable().button(action).trigger();});
$('#columnas').on('click', function() {var action = $(this).attr('data-action');oTable.DataTable().button(action).trigger();});
}
initTable3();
$('select').select2({minimumResultsForSearch: -1});
$('.date-picker').datepicker({language: 'es'});
});
$('#ffin,#fini').change( function() {$('#listado').DataTable().draw();} );//RANGOS DE FECHAS
//CHEQUEAR CHECKBOXES
<%if i<>""then%>
function marca_sup(parametro){
document.formulario.check_on_sup.value= (parseInt(document.formulario.check_on_sup.value)+parseInt(parametro));
if (document.getElementById('checkall').checked && document.formulario.check_on.value==0 )
{document.formulario.check_on.value=parseInt(document.formulario.check_on.value)+<%=i%>;}
else{
if (document.formulario.check_on.value!=0 && document.formulario.check_on_sup.value==0 ){
document.formulario.check_on.value=0;
}}
}
<%end if%>
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>