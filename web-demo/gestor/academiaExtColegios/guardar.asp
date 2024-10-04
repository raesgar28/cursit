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
<%nombre=trim(safeSTR(request("nombre")))
persona_contacto=trim(safeSTR(request("persona_contacto")))
mail_contacto=trim(safeSTR(request("mail_contacto")))
telefono_contacto=trim(safeSTR(request("telefono_contacto")))


if op="up" then
Sql= "SELECT * from extra_colegios where nombre='"&nombre&"' and id_colegio <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT * from extra_colegios where nombre='"&nombre&"' "                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
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
mySQL="INSERT INTO extra_colegios (nombre,persona_contacto,mail_contacto,telefono_contacto)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & nombre & "',"
	mySQL=mySQL & "'" & persona_contacto & "',"
	mySQL=mySQL & "'" & mail_contacto & "',"
	mySQL=mySQL & "'" & telefono_contacto & "'"
	mySQL=mySQL & ");"
	set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_colegio) from extra_colegios") 
cod = ob_rs(0)
'ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE extra_colegios SET "
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "persona_contacto = '" & persona_contacto & "',"
mySQL=mySQL & "mail_contacto = '" & mail_contacto & "',"
mySQL=mySQL & "telefono_contacto = '" & telefono_contacto & "'"
mySQL=mySQL & " WHERE id_colegio = " & cod & ";"
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
ob_rs.close	
ob_conn.close%>
</body></html>