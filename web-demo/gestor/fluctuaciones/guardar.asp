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
<%titulo_esp=trim(safeSTR(request("titulo_esp")))                          '[REQUEST]
texto_esp=trim(safeSTR2(request("texto_esp")))
fluctuacion=trim(request("fluctuacion"))
If IsNumeric(fluctuacion) Then fluctuacion=replace(fluctuacion,".","") else fluctuacion=0 end if
curso=request("curso")
alojamiento=request("alojamiento")
disponible=request("disponible")
fecha_in=now
fecha_mod=now         
id_categoria=request("id_categoria")
id_seccion=request("id_seccion")
id_subseccion=request("id_subseccion")
id_destino=request("id_destino")
id_item  =request("id_item")                                           '[FIN REQUEST]
if op="up" then
Sql= "SELECT titulo_esp from fluctuaciones where titulo_esp='"&titulo_esp&"'"     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT titulo_esp from fluctuaciones where titulo_esp='"&titulo_esp&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
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
if op="in" and fluctuacion<>0then															 '[OPCION INSERTAR]
mySQL="INSERT INTO fluctuaciones (titulo_esp,texto_esp,fluctuacion,disponible,curso,alojamiento,fecha_in)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & fluctuacion & "',"
	mySQL=mySQL & "'" & disponible & "',"
	mySQL=mySQL & "'" & curso & "',"
	mySQL=mySQL & "'" & alojamiento & "',"
	mySQL=mySQL & "'" & fecha_in & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_fluctuacion) from fluctuaciones") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up" and fluctuacion<>0then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE fluctuaciones SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "fluctuacion = '" & fluctuacion & "',"
mySQL=mySQL & "disponible = '" & disponible & "',"
mySQL=mySQL & "curso = '" & curso & "',"
mySQL=mySQL & "alojamiento = '" & alojamiento & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "'"
mySQL=mySQL & " WHERE id_fluctuacion = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
mySQL="DELETE FROM fluctuaciones_rel where id_fluctuacion =" & cod & " " 
set ob_rs=Ob_conn.execute(mySQL)
if id_categoria<>""then 
cadena_rel = split(id_categoria, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO fluctuaciones_rel (id_categoria,id_fluctuacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if            
if id_seccion<>""then 
cadena_rel = split(id_seccion, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO fluctuaciones_rel (id_seccion,id_fluctuacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if  
if id_subseccion<>""then 
cadena_rel = split(id_subseccion, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO fluctuaciones_rel (id_subseccion,id_fluctuacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if 


if id_destino<>""then 
cadena_rel = split(id_destino, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO fluctuaciones_rel (id_destino,id_fluctuacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if 



if id_item<>""then 
cadena_rel = split(id_item, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO fluctuaciones_rel (id_item,id_fluctuacion)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if 
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
'ob_rs.close	
ob_conn.close%>
</body></html>