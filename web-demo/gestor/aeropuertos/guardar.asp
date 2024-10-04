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
<!--#include file="../lib/asp/comun.asp"-->
<%ciudad=trim(safeSTR(request("ciudad")))                          '[REQUEST]
nacional=request("nacional")
texto_esp=trim(safeSTR2(request("texto_esp")))
fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]
if op="up" then
Sql= "SELECT * from aeropuertos where ciudad='"&ciudad&"' and id_aeropuerto <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT * from aeropuertos where ciudad='"&ciudad&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
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
mySQL="INSERT INTO aeropuertos (ciudad,texto_esp,nacional,fecha_in)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & ciudad & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & nacional & "',"
	mySQL=mySQL & "'" & fecha_in & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_aeropuerto) from aeropuertos") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE aeropuertos SET "
mySQL=mySQL & "ciudad = '" & ciudad & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "nacional = '" & nacional & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "'"
mySQL=mySQL & " WHERE id_aeropuerto = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
ob_rs.close	
ob_conn.close%>
</body></html>