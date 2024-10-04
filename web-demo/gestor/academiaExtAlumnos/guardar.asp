<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
acc=request("acc")
if acc="" then acc= request_equerystring("acc")
if r ="" then r = request_equerystring("r")
if rd ="" then rd = request_equerystring("rd")
if n ="" then n = request_equerystring("n")
if ndos ="" then ndos = request_equerystring("ndos")
if ntres ="" then ntres = request_equerystring("ntres")
if ncuat ="" then ncuat = request_equerystring("ncuat")
if op ="" then op = request_equerystring("op")
cod=request("cod")
if cod ="" then cod = request_equerystring("cod")
form_op=request("form_op")
if form_op ="" then form_op = request_equerystring("form_op")
cod_clase=request("cod_extra")
if cod_clase ="" then cod_clase = request_equerystring("cod_clase")
fecha=date%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->

<%function safeSTR_c(str)
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
output = replace( output, "¿", "&iquest;" ) '"
output = replace( output, "&#34;", chr(34) ) '"
output = replace( output, chr(34), "&#34;" ) '"
output = replace( output, chr(39), "&#39;" )  '
output = replace( output, chr(63), "&#63;" ) '?
'output = replace( output, "ª", "&ordf;" ) '?
'output = replace( output, "º", "&deg;" ) '?
safeSTR_c= ucase(output)
end function

id_colegio=request("id_colegio")
If IsNumeric(id_colegio) Then id_colegio=id_colegio else id_colegio=0 end if
nombre=trim(safeSTR_c(request("nombre")))
apellidos=trim(safeSTR_c(request("apellidos")))
mail_alumno=trim(safeSTR_c(request("mail_alumno")))
curso=trim(safeSTR_c(request("curso")))
dni=trim(safeSTR_c(request("dni")))
grupo=trim(safeSTR_c(request("grupo")))
nombre_padre=trim(safeSTR_c(request("nombre_padre")))
nombre_madre=trim(safeSTR_c(request("nombre_madre")))
apellidos_padre=trim(safeSTR_c(request("apellidos_padre")))
apellidos_madre=trim(safeSTR_c(request("apellidos_madre")))
telefono_contacto=trim(safeSTR_c(request("telefono_contacto")))
movil_contacto=trim(safeSTR_c(request("movil_contacto")))
nombre_titular=trim(safeSTR_c(request("nombre_titular")))
apellidos_titular=trim(safeSTR_c(request("apellidos_titular")))
DNI_titular=trim(safeSTR_c(request("DNI_titular")))
numero_cuenta=trim(safeSTR_c(request("numero_cuenta")))
entidad_bancaria=trim(safeSTR_c(request("entidad_bancaria")))
observaciones=trim(safeSTR_c(request("observaciones")))
borrado=trim(safeSTR_c(request("borrado")))
fecha_in=date

id_actividad=request("id_actividad")
If IsNumeric(id_actividad) Then id_actividad=id_actividad else id_actividad=0 end if
anyo=trim(safeSTR_c(request("anyo")))
grupo=trim(safeSTR_c(request("grupo")))
fecha_alta=trim(safeSTR_c(request("fecha_alta")))
If IsDate(fecha_alta) then fecha_alta=fecha_alta else fecha_alta="01/01/1000" end if
fecha_baja=trim(safeSTR_c(request("fecha_baja")))
If IsDate(fecha_baja) then fecha_baja=fecha_baja else fecha_baja="01/01/1000" end if
descuento_ampa=request("descuento_ampa")
If IsNumeric(descuento_ampa) Then descuento_ampa=descuento_ampa else descuento_ampa=0 end if
observaciones=request("observaciones")
lunes = request("lunes")
hora_lunes = request("hora_lunes")
martes = request("martes")
hora_martes = request("hora_martes")
miercoles = request("miercoles")
hora_miercoles = request("hora_miercoles")
jueves = request("jueves")
hora_jueves = request("hora_jueves")
viernes = request("viernes")
hora_viernes = request("hora_viernes")
sabado = request("sabado")
hora_sabado = request("hora_sabado")
septiembre = request("septiembre")
octubre = request("octubre")
noviembre = request("noviembre")
diciembre = request("diciembre")
enero = request("enero")
febrero = request("febrero")
marzo = request("marzo")
abril = request("abril")
mayo = request("mayo")
junio = request("junio")
julio = request("julio")
agosto = request("agosto")

septiembre_op= request("septiembre")
if septiembre_op = "" then septiembre_op = 0 end if
octubre_op= request("octubre")
if octubre_op = "" then octubre_op = 0 end if
noviembre_op= request("noviembre")
if noviembre_op = "" then noviembre_op = 0 end if
diciembre_op= request("diciembre")
if diciembre_op = "" then diciembre_op = 0 end if
enero_op= request("enero")
if enero_op = "" then enero_op = 0 end if
febrero_op= request("febrero")
if febrero_op = "" then febrero_op = 0 end if
marzo_op= request("marzo")
if marzo_op = "" then marzo_op = 0 end if
abril_op= request("abril")
if abril_op = "" then abril_op = 0 end if
mayo_op= request("mayo")
if mayo_op = "" then mayo_op = 0 end if
junio_op= request("junio")
if junio_op = "" then junio_op = 0 end if
julio_op= request("julio")
if julio_op = "" then julio_op = 0 end if
agosto_op= request("agosto")
if agosto_op = "" then agosto_op = 0 end if


if form_op<>"alumno" then
Sql= "SELECT id_monitor, precio, id_colegio FROM extra_actividades where id_actividad = "&id_actividad&" "
Ob_Commandc.CommandText = Sql
SET Ob_RS = Ob_Commandc.Execute ()
if not ob_rs.eof then
id_monitor = ob_rs("id_monitor")
precio = ob_rs("precio")
id_colegio = ob_rs("id_colegio")
end if
ob_rs.close
end if






                                                   '[FIN REQUEST]
''                                                    [ALUMNO]												   
if form_op="alumno" then												   
if op="up" then
Sql= "SELECT nombre, apellidos from extra_alumnos WHERE nombre ='"&nombre&"' and apellidos = '"&apellidos&"' and mail_contacto ='"&mail_contacto&"' and id_alumno <>"&cod&""
else
Sql= "SELECT nombre, apellidos from extra_alumnos WHERE nombre ='"&nombre&"' and apellidos = '"&apellidos&"' and mail_contacto ='"&mail_contacto&"'"
end if
Ob_Commandc.CommandText = Sql
SET Ob_RS = Ob_Commandc.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi) 
end if
end if
ob_rs.close														'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]

if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO extra_alumnos (id_colegio,nombre,apellidos,mail_alumno,dni,curso,grupo,mail_contacto,nombre_padre,nombre_madre,telefono_contacto,movil_contacto,nombre_titular,apellidos_titular,dni_titular,numero_cuenta,entidad_bancaria,observaciones,fecha_in)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_colegio & ","
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & apellidos & "',"
mySQL=mySQL & "'" & mail_alumno & "',"
mySQL=mySQL & "'" & dni & "',"
mySQL=mySQL & "'" & curso & "',"
mySQL=mySQL & "'" & grupo & "',"
mySQL=mySQL & "'" & mail_contacto & "',"
mySQL=mySQL & "'" & nombre_padre & "',"
mySQL=mySQL & "'" & nombre_madre & "',"
mySQL=mySQL & "'" & telefono_contacto & "',"
mySQL=mySQL & "'" & movil_contacto & "',"
mySQL=mySQL & "'" & nombre_titular & "',"
mySQL=mySQL & "'" & apellidos_titular & "',"
mySQL=mySQL & "'" & dni_titular & "',"
mySQL=mySQL & "'" & numero_cuenta & "',"
mySQL=mySQL & "'" & entidad_bancaria & "',"
mySQL=mySQL & "'" & observaciones & "'"
mySQL=mySQL & "'" & fecha_in & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_alumno) from extra_alumnos") 
cod = ob_rs(0)
end if                                                            '[FIN OPCION INSERTAR]

if op="up"then                                                    '[OPCION MODIFICAR ALUMNO]
mySQL=" UPDATE extra_alumnos SET "
mySQL=mySQL & "id_colegio = '" & id_colegio & "',"
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "apellidos = '" & apellidos & "',"
mySQL=mySQL & "mail_alumno = '" & mail_alumno & "',"
mySQL=mySQL & "dni = '" & dni & "',"
mySQL=mySQL & "curso = '" & curso & "',"
mySQL=mySQL & "grupo = '" & grupo & "',"
mySQL=mySQL & "mail_contacto = '" & mail_contacto & "',"
mySQL=mySQL & "nombre_padre = '" & nombre_padre & "',"
mySQL=mySQL & "nombre_madre = '" & nombre_madre & "',"
mySQL=mySQL & "telefono_contacto = '" & telefono_contacto & "',"
mySQL=mySQL & "movil_contacto = '" & movil_contacto & "',"
mySQL=mySQL & "nombre_titular = '" & nombre_titular & "',"
mySQL=mySQL & "apellidos_titular = '" & apellidos_titular & "',"
mySQL=mySQL & "dni_titular = '" & dni_titular & "',"
mySQL=mySQL & "numero_cuenta = '" & numero_cuenta & "',"
mySQL=mySQL & "entidad_bancaria = '" & entidad_bancaria & "',"
mySQL=mySQL & "observaciones = '" & observaciones & "'"
mySQL=mySQL & " WHERE id_alumno = " & cod & "" 
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR ALUMNO]

end if                                                            '[FORM_OP ALUMNO]

''                                                                 [INSCRIBIR CLASE]												   
if form_op="inscribir" then	
mySQL="INSERT INTO extra_programas (id_alumno,id_actividad,id_monitor,id_colegio,anyo,fecha_alta,precio,descuento_ampa,lunes,hora_lunes,martes,hora_martes,miercoles,hora_miercoles,jueves,hora_jueves,viernes,hora_viernes,sabado,hora_sabado,observaciones,grupo)"			
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_actividad & ","
mySQL=mySQL & "" & id_monitor & ","
mySQL=mySQL & "" & id_colegio & ","
mySQL=mySQL & "'" & anyo & "',"
mySQL=mySQL & "'" & fecha_alta & "',"
mySQL=mySQL & "'" & precio & "',"
mySQL=mySQL & "'" & descuento_ampa & "',"
'mySQL=mySQL & "'" & precio_total & "',"
mySQL=mySQL & "'" & lunes & "',"
mySQL=mySQL & "'" & hora_lunes & "',"
mySQL=mySQL & "'" & martes & "',"
mySQL=mySQL & "'" & hora_martes & "',"
mySQL=mySQL & "'" & miercoles & "',"
mySQL=mySQL & "'" & hora_miercoles & "',"
mySQL=mySQL & "'" & jueves & "',"
mySQL=mySQL & "'" & hora_jueves & "',"
mySQL=mySQL & "'" & viernes & "',"
mySQL=mySQL & "'" & hora_viernes & "',"
mySQL=mySQL & "'" & sabado & "',"
mySQL=mySQL & "'" & hora_sabado & "',"
mySQL=mySQL & "'" & observaciones & "',"
mySQL=mySQL & "'" & grupo & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_extraescolar) from extra_programas") 
cod_clase = ob_rs(0)
end if                                                            '[FORM_OP INSCRIBIR]

''                                                                 [MODIFICAR CLASE]	

if form_op="modificar" then
mySQL="UPDATE extra_programas SET "
mySQL=mySQL & "id_alumno = " & cod & ","
mySQL=mySQL & "id_actividad = " & id_actividad & ","
mySQL=mySQL & "id_monitor = " & id_monitor & ","
mySQL=mySQL & "id_colegio = " & id_colegio & ","
mySQL=mySQL & "precio = " & precio & ","
mySQL=mySQL & "anyo = '" & anyo & "',"
mySQL=mySQL & "fecha_alta = '" & fecha_alta & "',"
mySQL=mySQL & "fecha_baja = '" & fecha_baja & "',"
mySQL=mySQL & "descuento_ampa = " & descuento_ampa & ","
mySQL=mySQL & "lunes = '" & lunes & "',"
mySQL=mySQL & "hora_lunes = '" & hora_lunes & "',"
mySQL=mySQL & "martes = '" & martes & "',"
mySQL=mySQL & "hora_martes = '" & hora_martes & "',"
mySQL=mySQL & "miercoles = '" & miercoles & "',"
mySQL=mySQL & "hora_miercoles = '" & hora_miercoles & "',"
mySQL=mySQL & "jueves = '" & jueves & "',"
mySQL=mySQL & "hora_jueves = '" & hora_jueves & "',"
mySQL=mySQL & "viernes = '" & viernes & "',"
mySQL=mySQL & "hora_viernes = '" & hora_viernes & "',"
mySQL=mySQL & "sabado = '" & sabado & "',"
mySQL=mySQL & "hora_sabado = '" & hora_sabado & "',"
mySQL=mySQL & "septiembre = '" & septiembre & "',"
mySQL=mySQL & "octubre = '" & octubre & "',"
mySQL=mySQL & "noviembre = '" & noviembre & "',"
mySQL=mySQL & "diciembre = '" & diciembre & "',"
mySQL=mySQL & "enero = '" & enero & "',"
mySQL=mySQL & "febrero = '" & febrero & "',"
mySQL=mySQL & "marzo = '" & marzo & "',"
mySQL=mySQL & "abril = '" & abril & "',"
mySQL=mySQL & "mayo = '" & mayo & "',"
mySQL=mySQL & "junio = '" & junio & "',"
mySQL=mySQL & "julio = '" & julio & "',"
mySQL=mySQL & "agosto = '" & agosto & "',"
mySQL=mySQL & "observaciones = '" & observaciones & "',"
mySQL=mySQL & "grupo = '"& grupo & "'"
						
mySQL=mySQL & " WHERE id_extraescolar = " & cod_clase & ";" 
set ob_rs=Ob_Connc.execute(mySQL)
end if 'modificar 
''                                                                 [FIN MODIFICAR CLASE]	

if acc="del" then    '[ELIMINAR ACTIVIDAD
mySQL="DELETE FROM extra_programas where id_extraescolar =" & cod_clase & " "
set ob_rs=Ob_Connc.execute(mySQL)
form_op="modificar"
end if    '[FIN ELIMINAR ACTIVIDAD

'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_clase="&cod_clase&"&form_op="&form_op&"&acc="&acc)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_clase="&cod_clase&"&form_op="&form_op&"&acc="&acc) 
ob_conn.close%>
</body></html>