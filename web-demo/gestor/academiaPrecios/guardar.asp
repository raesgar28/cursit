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
fecha_mod=now 
anyo=trim(safeSTR(request("anyo")))
precio_septiembre=trim(safeSTR(request("precio_septiembre")))
precio_octubre=trim(safeSTR(request("precio_octubre")))
precio_noviembre=trim(safeSTR(request("precio_noviembre")))
precio_diciembre=trim(safeSTR(request("precio_diciembre")))
precio_enero=trim(safeSTR(request("precio_enero")))
precio_febrero=trim(safeSTR(request("precio_febrero")))
precio_marzo=trim(safeSTR(request("precio_marzo")))
precio_abril=trim(safeSTR(request("precio_abril")))
precio_mayo=trim(safeSTR(request("precio_mayo")))
precio_junio=trim(safeSTR(request("precio_junio")))
precio_julio=trim(safeSTR(request("precio_julio")))
precio_agosto=trim(safeSTR(request("precio_agosto")))
borrado=trim(safeSTR(request("borrado")))

If IsNumeric(precio_septiembre) Then precio_septiembre=precio_septiembre else precio_septiembre=0 end if
If IsNumeric(precio_octubre) Then precio_octubre=precio_octubre else precio_octubre=0 end if
If IsNumeric(precio_noviembre) Then precio_noviembre=precio_noviembre else precio_noviembre=0 end if
If IsNumeric(precio_diciembre) Then precio_diciembre=precio_diciembre else precio_diciembre=0 end if
If IsNumeric(precio_enero) Then precio_enero=precio_enero else precio_enero=0 end if
If IsNumeric(precio_febrero) Then precio_febrero=precio_febrero else precio_febrero=0 end if
If IsNumeric(precio_marzo) Then precio_marzo=precio_marzo else precio_marzo=0 end if
If IsNumeric(precio_abril) Then precio_abril=precio_abril else precio_abril=0 end if
If IsNumeric(precio_mayo) Then precio_mayo=precio_mayo else precio_mayo=0 end if
If IsNumeric(precio_junio) Then precio_junio=precio_junio else precio_junio=0 end if
If IsNumeric(precio_julio) Then precio_julio=precio_julio else precio_julio=0 end if
If IsNumeric(precio_agosto) Then precio_agosto=precio_agosto else precio_agosto=0 end if

if op="up" then
Sql= "SELECT * from academia_precios where anyo='"&anyo&"' and id_precio <> "&cod&" "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT * from academia_precios where anyo='"&anyo&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
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
mySQL="INSERT INTO academia_precios (anyo,precio_septiembre,precio_octubre,precio_noviembre,precio_diciembre,precio_enero,precio_febrero,precio_marzo,precio_abril,precio_mayo,precio_junio,precio_julio,precio_agosto)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & anyo & "',"
	mySQL=mySQL & "'" & precio_septiembre & "',"
	mySQL=mySQL & "'" & precio_octubre & "',"
	mySQL=mySQL & "'" & precio_noviembre & "',"
	mySQL=mySQL & "'" & precio_diciembre & "',"
	mySQL=mySQL & "'" & precio_enero & "',"
	mySQL=mySQL & "'" & precio_febrero & "',"
	mySQL=mySQL & "'" & precio_marzo & "',"
	mySQL=mySQL & "'" & precio_abril & "',"
	mySQL=mySQL & "'" & precio_mayo & "',"
	mySQL=mySQL & "'" & precio_junio & "',"
	mySQL=mySQL & "'" & precio_julio & "',"
	mySQL=mySQL & "'" & precio_agosto & "'"
	mySQL=mySQL & ");"
	set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_precio) from academia_precios") 
cod = ob_rs(0)
'ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE academia_precios SET "
mySQL=mySQL & "anyo = '" & anyo & "',"
mySQL=mySQL & "precio_septiembre = '" & precio_septiembre & "',"
mySQL=mySQL & "precio_octubre = '" & precio_octubre & "',"
mySQL=mySQL & "precio_noviembre = '" & precio_noviembre & "',"
mySQL=mySQL & "precio_diciembre = '" & precio_diciembre & "',"
mySQL=mySQL & "precio_enero = '" & precio_enero & "',"
mySQL=mySQL & "precio_febrero = '" & precio_febrero & "',"
mySQL=mySQL & "precio_marzo = '" & precio_marzo & "',"
mySQL=mySQL & "precio_abril = '" & precio_abril & "',"
mySQL=mySQL & "precio_mayo = '" & precio_mayo & "',"
mySQL=mySQL & "precio_junio = '" & precio_junio & "',"
mySQL=mySQL & "precio_julio = '" & precio_julio & "',"
mySQL=mySQL & "precio_agosto = '" & precio_agosto & "'"
mySQL=mySQL & " WHERE id_precio = " & cod & ";"
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
ob_rs.close	
ob_conn.close%>
</body></html>