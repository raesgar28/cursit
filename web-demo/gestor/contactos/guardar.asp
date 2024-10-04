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
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%nombre=trim(safeSTR(request("nombre")))                        '[REQUEST]
apellidos=trim(safeSTR(request("apellidos")))
telefono=trim(safeSTR(request("telefono")))
eMail=trim(safeSTR(request("eMail")))
comentario=trim(safeSTR(request("comentario")))
obs_internas=trim(safeSTR(request("obs_internas")))
n_letter=trim(safeSTR(request("n_letter")))
id_categoria=request("id_categoria")
id_item=request("id_item")
id_admin=request("id_admin")
estado=request("estado")
id_contactoCategoria=request("id_contactoCategoria")
If IsNumeric(id_categoria) Then id_categoria=id_categoria else id_categoria=0 end if
If IsNumeric(id_contactoCategoria) Then id_contactoCategoria=id_contactoCategoria else id_contactoCategoria=0 end if
If IsNumeric(id_item) Then id_item=id_item else id_item=0 end if
If IsNumeric(id_admin) Then id_admin=id_admin else id_admin=0 end if
fecha_in=request("fecha_in")
If IsDate(fecha_in) Then fecha_in=fecha_in else fecha_in="01/01/1000" end if
fecha_nxt=request("fecha_nxt")
If IsDate(fecha_nxt) Then fecha_nxt=fecha_nxt else fecha_nxt="01/01/1000" end if
                                                      '[FIN REQUEST]
if op="up" then                          ' CHEQUEAMOS URL ESP
Sql= "SELECT apellidos, email FROM contactos WHERE (apellidos ='"&apellidos&"' AND email ='"&email&"') and id_contacto <> "&cod&""   
else
Sql= "SELECT apellidos, email FROM contactos WHERE apellidos ='"&apellidos&"' AND email ='"&email&"'"   
end if
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 

Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
ob_rs.close		'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]

if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO contactos (nombre,apellidos,telefono,eMail,comentario,obs_internas,n_letter,id_categoria,id_item,fecha_in,fecha_nxt,id_contactoCategoria,estado,id_admin)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & nombre & "',"
	mySQL=mySQL & "'" & apellidos & "',"
	mySQL=mySQL & "'" & telefono & "',"
	mySQL=mySQL & "'" & eMail & "',"
	mySQL=mySQL & "'" & comentario & "',"
	mySQL=mySQL & "'" & obs_internas & "',"
	mySQL=mySQL & "'" & n_letter & "',"
	mySQL=mySQL & "" & id_categoria & ","
	mySQL=mySQL & "" & id_item & ","
	mySQL=mySQL & "'" & fecha_in & "',"
	mySQL=mySQL & "'" & fecha_nxt & "',"
	mySQL=mySQL & "" & id_contactoCategoria & ","
	mySQL=mySQL & "'" & estado & "',"
	mySQL=mySQL & "'" & id_admin & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_contacto) from contactos") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE contactos SET "
mySQL=mySQL & "nombre = '" & nombre & "',"
mySQL=mySQL & "apellidos = '" & apellidos & "',"
mySQL=mySQL & "telefono = '" & telefono & "',"
mySQL=mySQL & "eMail = '" & eMail & "',"
mySQL=mySQL & "comentario = '" & comentario & "',"
mySQL=mySQL & "obs_internas = '" & obs_internas & "',"
mySQL=mySQL & "id_categoria = " & id_categoria & ","
mySQL=mySQL & "id_item = " & id_item & ","
mySQL=mySQL & "fecha_in = '" & fecha_in & "',"
mySQL=mySQL & "fecha_nxt = '" & fecha_nxt & "',"
mySQL=mySQL & "id_contactoCategoria = " & id_contactoCategoria & ","
mySQL=mySQL & "estado = '" & estado & "',"
mySQL=mySQL & "id_admin = " & id_admin & ""
mySQL=mySQL & " WHERE id_contacto = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]

'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi))

Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>