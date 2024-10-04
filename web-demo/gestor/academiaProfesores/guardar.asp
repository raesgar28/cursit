<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%ciudad=trim(safeSTR(request("ciudad")))                          '[REQUEST]
nacional=request("nacional")
observaciones=trim(safeSTR2(request("texto_esp")))
fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]

nombre=trim(safeSTR(request("nombre")))
apellidos=trim(safeSTR(request("apellidos")))
idioma=trim(safeSTR(request("idioma")))
mail=trim(safeSTR(request("mail")))
telefono=trim(safeSTR(request("telefono")))
direccion=trim(safeSTR(request("direccion")))
borrado=request("borrado")
observaciones=safeSTR(request("texto_esp"))

if op="up" then
if ndos="prof" then
Sql= "SELECT * from academia_profesores where nombre='"&nombre&"' and apellidos='"&apellidos&"' and id_profesor <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT * from extra_monitores where nombre='"&nombre&"' and apellidos='"&apellidos&"' and id_profesor <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
end if
else
if ndos="prof" then
Sql= "SELECT * from academia_profesores where nombre='"&nombre&"' and apellidos='"&apellidos&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
else
Sql= "SELECT * from extra_monitores where nombre='"&nombre&"' and apellidos='"&apellidos&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
end if
Ob_Commandc.CommandText = Sql
SET Ob_RS = Ob_Commandc.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko") 
end if
end if													'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
if ndos="prof" then
mySQL="INSERT INTO academia_profesores (nombre,apellidos,mail,telefono,direccion,idioma,observaciones)"
else
mySQL="INSERT INTO extra_monitores (nombre,apellidos,mail,telefono,direccion,idioma,observaciones)"
end if
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & nombre & "',"
	mySQL=mySQL & "'" & apellidos & "',"
	mySQL=mySQL & "'" & mail & "',"
	mySQL=mySQL & "'" & telefono & "',"
	mySQL=mySQL & "'" & direccion & "',"
	if ndos="prof" then mySQL=mySQL & "'" & idioma & "'," end if
	mySQL=mySQL & "'" & observaciones & "'"
	mySQL=mySQL & ");"
	set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_profesor) from academia_profesores") 
cod = ob_rs(0)
'ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
if ndos="prof" then
mySQL="UPDATE academia_profesores SET "
else
mySQL="UPDATE extra_monitores SET "
end if
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "apellidos = '" & apellidos & "',"
mySQL=mySQL & "mail = '" & mail & "',"
mySQL=mySQL & "telefono = '" & telefono & "',"
mySQL=mySQL & "direccion = '" & direccion & "',"
if ndos="prof" then mySQL=mySQL & "idioma = '" & idioma & "'," end if
mySQL=mySQL & "observaciones = '" & observaciones & "'"
mySQL=mySQL & " WHERE id_profesor = " & cod & ";"
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
ob_rs.close	
ob_conn.close%>
</body></html>