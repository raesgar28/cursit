<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
edi=request("edi")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%titulo_esp=trim(safeSTR(request("titulo_esp")))                          '[REQUEST]
direccion=trim(safeSTR(request("direccion"))) 
id_ciudad=request("id_ciudad")
'If IsNumeric(id_ciudad) Then id_ciudad=id_ciudad else id_ciudad=0 end if
provincia=trim(safeSTR(request("provincia"))) 
pais=trim(safeSTR(request("pais"))) 
c_postal=trim(safeSTR(request("c_postal"))) 
email=trim(safeSTR(request("email"))) 
telefono=trim(safeSTR(request("telefono"))) 
persona_contacto=trim(safeSTR(request("persona_contacto"))) 
email_p=trim(safeSTR(request("email_p"))) 
movil=trim(safeSTR(request("movil"))) 
otros_datos=trim(safeSTR(request("otros_datos"))) 
tipo_pr=request("tipo_pr")
escuela_tam=request("escuela_tam")
fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]
if op="up" then
Sql= "SELECT * from proveedores where titulo_esp='"&titulo_esp&"' and id_proveedor <> "&cod&" and tipo_pr='"&tipo_pr&"' "     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT * from proveedores where titulo_esp='"&titulo_esp&"' and tipo_pr='"&tipo_pr&"' "                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&edi="&edi) 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&edi="&edi) 
end if
end if
ob_rs.close														'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO proveedores (titulo_esp,direccion,provincia,pais,c_postal,email,telefono,persona_contacto,email_p,movil,otros_datos,tipo_pr,fecha_in,escuela_tam)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & direccion & "',"
	mySQL=mySQL & "'" & provincia & "',"
	mySQL=mySQL & "'" & pais & "',"
	mySQL=mySQL & "'" & c_postal & "',"
	mySQL=mySQL & "'" & email & "',"
	mySQL=mySQL & "'" & telefono & "',"
	mySQL=mySQL & "'" & persona_contacto & "',"
	mySQL=mySQL & "'" & email_p & "',"
	mySQL=mySQL & "'" & movil & "',"
	mySQL=mySQL & "'" & otros_datos & "',"
	mySQL=mySQL & "'" & tipo_pr & "',"
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & escuela_tam & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_proveedor) from proveedores") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE proveedores SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "direccion = '" & direccion & "',"
mySQL=mySQL & "provincia = '" & provincia & "',"
mySQL=mySQL & "pais = '" & pais & "',"
mySQL=mySQL & "c_postal = '" & c_postal & "',"
mySQL=mySQL & "email = '" & email & "',"
mySQL=mySQL & "telefono = '" & telefono & "',"
mySQL=mySQL & "persona_contacto = '" & persona_contacto & "',"
mySQL=mySQL & "email_p = '" & email_p & "',"
mySQL=mySQL & "otros_datos = '" & otros_datos & "',"
mySQL=mySQL & "tipo_pr = '" & tipo_pr & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "escuela_tam = '" & escuela_tam & "'"
mySQL=mySQL & " WHERE id_proveedor = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]

mySQL="DELETE FROM rel where id_proveedor =" & cod & " and id_ciudad <> 0" 'ELIMINAMOS PRIMERO
set ob_rs=Ob_conn.execute(mySQL)
if id_ciudad<>""then                                              '[RELACIONAMOS EN REL ID_SECCION]
cadena_rel = split(id_ciudad, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO rel (id_ciudad,id_proveedor)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "" & cadena_rel(i) & ","
	mySQL=mySQL & "'" & cod & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
next
end if         

'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>