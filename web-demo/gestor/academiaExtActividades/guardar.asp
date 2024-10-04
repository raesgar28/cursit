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
<%fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]

nombre=trim(safeSTR(request("nombre")))
id_colegio=trim(safeSTR(request("id_colegio")))
id_monitor=trim(safeSTR(request("id_monitor")))
precio=trim(safeSTR(request("precio")))

'if op="up" then
'Sql= "SELECT * from extra_actividades where nombre='"&nombre&"'and id_actividad <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
'else
'Sql= "SELECT * from extra_actividades where nombre='"&nombre&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
'end if
'Ob_Commandc.CommandText = Sql
'SET Ob_RS = Ob_Commandc.Execute ()
'if not ob_rs.eof then
'if op="up" then 
'Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko")) 
'Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
'end if
'if op="in" then 
'Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko")) 
'Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko") 
'end if
'end if													'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO extra_actividades (nombre,id_colegio,id_monitor,precio)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & nombre & "',"
	mySQL=mySQL & "" & id_colegio & ","
	mySQL=mySQL & "" & id_monitor & ","
	mySQL=mySQL & "'" & precio & "'"
	mySQL=mySQL & ");"
	set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_actividad) from extra_actividades") 
cod = ob_rs(0)
'ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]


if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE extra_actividades SET "
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "id_colegio = " & id_colegio & ","
mySQL=mySQL & "id_monitor = " & id_monitor & ","
mySQL=mySQL & "precio = '" & precio & "'"
mySQL=mySQL & " WHERE id_actividad = " & cod & ";"
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
ob_rs.close	
ob_conn.close%>
</body></html>