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
cod_clase=request("cod_clase")
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

nombre=trim(safeSTR_c(request("nombre"))) 
apellidos=trim(safeSTR_c(request("apellidos")))
mail_contacto=trim(safeSTR(request("mail_contacto")))
telefono_contacto=trim(safeSTR(request("telefono_contacto")))
sexo=request("sexo")
nombre_padre=trim(safeSTR(request("nombre_padre")))
nombre_madre=trim(safeSTR(request("nombre_madre")))
grupo=request("grupo")
fecha_nacimiento=request("fecha_nacimiento")
If IsDate(fecha_nacimiento) then fecha_nacimiento=fecha_nacimiento else fecha_nacimiento="01/01/1000" end if
domicilio=trim(safeSTR(request("domicilio")))
colegio=trim(safeSTR(request("colegio")))
viajado_schola=request("viajado_schola")
observaciones=trim(safeSTR(request("observaciones")))
titular_cuenta=trim(safeSTR(request("titular_cuenta")))
n_cuenta=trim(safeSTR(request("n_cuenta")))

id_profesor=request("id_profesor")
If IsNumeric(id_profesor) Then id_profesor=id_profesor else id_profesor=0 end if
forma_pago=request("forma_pago")
id_precio=request("id_precio")
If IsNumeric(id_precio) Then id_precio=id_precio else id_precio=0 end if
fecha_alta=request("fecha_alta")
If IsDate(fecha_alta) then fecha_alta=fecha_alta else fecha_alta="01/01/1000" end if
fecha_baja=request("fecha_baja")
If IsDate(fecha_baja) then fecha_baja=fecha_baja else fecha_baja="01/01/1000" end if
n_reserva=request("n_reserva")
genera_factura_m =request("genera_factura_m")
observaciones=trim(safeSTR(request("observaciones")))

acp_imagen = request("acp_imagen")
if acp_imagen="" then acp_imagen="no" end if

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

septiembre_op= request("septiembre_op")
if septiembre_op = "" then septiembre_op = 0 end if
octubre_op= request("octubre_op")
if octubre_op = "" then octubre_op = 0 end if
noviembre_op= request("noviembre_op")
if noviembre_op = "" then noviembre_op = 0 end if
diciembre_op= request("diciembre_op")
if diciembre_op = "" then diciembre_op = 0 end if
enero_op= request("enero_op")
if enero_op = "" then enero_op = 0 end if
febrero_op= request("febrero_op")
if febrero_op = "" then febrero_op = 0 end if
marzo_op= request("marzo_op")
if marzo_op = "" then marzo_op = 0 end if
abril_op= request("abril_op")
if abril_op = "" then abril_op = 0 end if
mayo_op= request("mayo_op")
if mayo_op = "" then mayo_op = 0 end if
junio_op= request("junio_op")
if junio_op = "" then junio_op = 0 end if
julio_op= request("julio_op")
if julio_op = "" then julio_op = 0 end if
agosto_op= request("agosto_op")
if agosto_op = "" then agosto_op = 0 end if

septiembre_p = request("septiembre_p")
octubre_p = request("octubre_p")
noviembre_p = request("noviembre_p")
diciembre_p = request("diciembre_p")
enero_p = request("enero_p")
febrero_p = request("febrero_p")
marzo_p = request("marzo_p")
abril_p = request("abril_p")
mayo_p = request("mayo_p")
junio_p = request("junio_p")
julio_p = request("julio_p")
agosto_p = request("agosto_p")
                                                   '[FIN REQUEST]
''                                                    [ALUMNO]												   
if form_op="alumno" then												   
if op="up" then
Sql= "SELECT nombre, apellidos from academia_alumnos WHERE nombre ='"&nombre&"' and apellidos = '"&apellidos&"' and mail_contacto ='"&mail_contacto&"' and id_alumno <>"&cod&""
else
Sql= "SELECT nombre, apellidos from academia_alumnos WHERE nombre ='"&nombre&"' and apellidos = '"&apellidos&"' and mail_contacto ='"&mail_contacto&"'"
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
mySQL="INSERT INTO academia_alumnos (nombre,apellidos,mail_contacto,telefono_contacto,grupo,nombre_padre,nombre_madre,n_cuenta,titular_cuenta,observaciones,sexo,fecha_nacimiento,colegio,viajado_schola,domicilio,fecha_in,acp_imagen)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & apellidos & "',"
mySQL=mySQL & "'" & mail_contacto & "',"
mySQL=mySQL & "'" & telefono_contacto & "',"
mySQL=mySQL & "'" & grupo & "',"
mySQL=mySQL & "'" & nombre_padre & "',"
mySQL=mySQL & "'" & nombre_madre & "',"
mySQL=mySQL & "'" & n_cuenta & "',"
mySQL=mySQL & "'" & titular_cuenta & "',"
mySQL=mySQL & "'" & observaciones & "',"
mySQL=mySQL & "'" & sexo & "',"
mySQL=mySQL & "'" & fecha_nacimiento & "',"
mySQL=mySQL & "'" & colegio & "',"
mySQL=mySQL & "'" & viajado_schola & "',"
mySQL=mySQL & "'" & domicilio & "',"
mySQL=mySQL & "'" & fecha & "',"
mySQL=mySQL & "'" & acp_imagen & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_alumno) from academia_alumnos") 
cod = ob_rs(0)
end if                                                            '[FIN OPCION INSERTAR]

if op="up"then                                                    '[OPCION MODIFICAR ALUMNO]
mySQL=" UPDATE academia_alumnos SET "
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "apellidos = '" & apellidos & "',"
mySQL=mySQL & "mail_contacto = '" & mail_contacto & "',"
mySQL=mySQL & "telefono_contacto = '" & telefono_contacto & "',"
mySQL=mySQL & "nombre_padre = '" & nombre_padre & "',"
mySQL=mySQL & "nombre_madre = '" & nombre_madre & "',"
mySQL=mySQL & "n_cuenta = '" & n_cuenta & "',"
mySQL=mySQL & "titular_cuenta = '" & titular_cuenta & "',"
mySQL=mySQL & "observaciones = '" & observaciones & "',"
mySQL=mySQL & "grupo = '" & grupo & "',"
mySQL=mySQL & "sexo = '" & sexo & "',"
mySQL=mySQL & "fecha_nacimiento = '" & fecha_nacimiento & "',"
mySQL=mySQL & "colegio = '" & colegio & "',"
mySQL=mySQL & "viajado_schola = '" & viajado_schola & "',"
mySQL=mySQL & "domicilio = '" & domicilio & "',"
mySQL=mySQL & "acp_imagen = '" & acp_imagen & "'"
mySQL=mySQL & " WHERE id_alumno = " & cod & ";" 
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR ALUMNO]

end if                                                            '[FORM_OP ALUMNO]

''                                                                 [INSCRIBIR CLASE]												   
if form_op="inscribir" then	
mySQL="INSERT INTO academia_clases (id_alumno,id_profesor,id_precio,fecha_alta,lunes,hora_lunes,martes,hora_martes,miercoles,hora_miercoles,jueves,hora_jueves,viernes,hora_viernes,sabado,hora_sabado,observaciones,n_reserva, forma_pago)"			
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_profesor & ","
mySQL=mySQL & "" & id_precio & ","
mySQL=mySQL & "'" & fecha_alta & "',"
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
mySQL=mySQL & "'" & n_reserva & "',"
mySQL=mySQL & "'" & forma_pago & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_clase) from academia_clases") 
cod_clase = ob_rs(0)
end if                                                            '[FORM_OP INSCRIBIR]

''                                                                 [MODIFICAR CLASE]	
if form_op="modificar" then
mySQL="UPDATE academia_clases SET "
mySQL=mySQL & "id_alumno = " & cod & ","
mySQL=mySQL & "id_profesor = " & id_profesor & ","
mySQL=mySQL & "id_precio = " & id_precio & ","
mySQL=mySQL & "fecha_alta = '" & fecha_alta & "',"
mySQL=mySQL & "fecha_baja = '" & fecha_baja & "',"
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
mySQL=mySQL & "septiembre_op = '" & septiembre_op & "',"
mySQL=mySQL & "octubre_op = '" & octubre_op & "',"
mySQL=mySQL & "noviembre_op = '" & noviembre_op & "',"
mySQL=mySQL & "diciembre_op = '" & diciembre_op & "',"
mySQL=mySQL & "enero_op = '" & enero_op & "',"
mySQL=mySQL & "febrero_op = '" & febrero_op & "',"
mySQL=mySQL & "marzo_op = '" & marzo_op & "',"
mySQL=mySQL & "abril_op = '" & abril_op & "',"
mySQL=mySQL & "mayo_op = '" & mayo_op & "',"
mySQL=mySQL & "junio_op = '" & junio_op & "',"
mySQL=mySQL & "julio_op = '" & julio_op & "',"
mySQL=mySQL & "agosto_op = '" & agosto_op & "',"
mySQL=mySQL & "n_reserva = '" & n_reserva & "',"
mySQL=mySQL & "forma_pago = '" & forma_pago & "',"

mySQL=mySQL & "septiembre_p = '" & septiembre_p & "',"
mySQL=mySQL & "octubre_p = '" & octubre_p & "',"
mySQL=mySQL & "noviembre_p = '" & noviembre_p & "',"
mySQL=mySQL & "diciembre_p = '" & diciembre_p & "',"
mySQL=mySQL & "enero_p = '" & enero_p & "',"
mySQL=mySQL & "febrero_p = '" & febrero_p & "',"
mySQL=mySQL & "marzo_p = '" & marzo_p & "',"
mySQL=mySQL & "abril_p = '" & abril_p & "',"
mySQL=mySQL & "mayo_p = '" & mayo_p & "',"
mySQL=mySQL & "junio_p = '" & junio_p & "',"
mySQL=mySQL & "julio_p = '" & julio_p & "',"
mySQL=mySQL & "agosto_p = '" & agosto_p & "'"

mySQL=mySQL & " WHERE id_clase = " & cod_clase & ";" 
set ob_rs=Ob_Connc.execute(mySQL)
end if 'modificar 
''                                                                 [FIN MODIFICAR CLASE]	

if acc="del" then    '[ELIMINAR ACTIVIDAD
mySQL="DELETE FROM academia_clases where id_clase =" & cod_clase & " "
set ob_rs=Ob_Connc.execute(mySQL)
form_op="modificar"
end if    '[FIN ELIMINAR ACTIVIDAD

'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_clase="&cod_clase&"&form_op="&form_op&"&acc="&acc)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&cod_clase="&cod_clase&"&form_op="&form_op&"&acc="&acc) 
ob_conn.close%>
</body></html>