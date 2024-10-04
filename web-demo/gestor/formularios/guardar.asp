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
email=trim(safeSTR(request("email")))
asunto=trim(safeSTR(request("asunto")))
a_nl=request("a_nl")
a_bd=request("a_bd")
texto_esp=trim(safeSTR(request("texto_esp")))
fecha_in=date
fecha_mod=date
	Dim nombre_(60),nombre_nombre_(60),valor_(60),longitud_(60),tipo_input_(60),tipo_dato_(60),dato_(60),orden_(60),obligatorio_(60),del_(60)
	for i=1 to 60
	nombre_(i) = trim(safeSTR(request("nombre_[" & i &"]")))
	nombre_nombre_(i) = trim(safeSTR(request("nombre_nombre_[" & i &"]")))
	valor_(i) = trim(safeSTR(request("valor_[" & i &"]")))
	longitud_(i) = request("longitud_[" & i &"]")
	valor_(i) = trim(safeSTR(request("valor_[" & i &"]")))
	tipo_input_(i) = trim(safeSTR(request("tipo_input_[" & i &"]")))
	tipo_dato_(i) = trim(safeSTR(request("tipo_dato_[" & i &"]")))
	dato_(i) = trim(safeSTR(request("dato_[" & i &"]")))
	orden_(i) = trim(request("orden_[" & i &"]"))
	obligatorio_(i) = request("obligatorio_[" & i &"]")
	del_(i) = request("del_[" & i &"]")
	next                                                     '[FIN REQUEST]
	
if op="up" then                          ' CHEQUEAMOS URL ESP
Sql= "SELECT titulo_esp FROM formularios WHERE titulo_esp ='"&titulo_esp&"' and id_formulario <> "&cod&""   
else
Sql= "SELECT titulo_esp FROM formularios WHERE titulo_esp ='"&titulo_esp&"'"   
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)
end if
ob_rs.close
								'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO formularios (titulo_esp,texto_esp,email,a_nl,a_bd,asunto,fecha_in)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & titulo_esp & "',"
	mySQL=mySQL & "'" & texto_esp & "',"
	mySQL=mySQL & "'" & email & "',"
	mySQL=mySQL & "'" & a_nl & "',"
	mySQL=mySQL & "'" & a_bd & "',"
	mySQL=mySQL & "'" & asunto & "',"
	mySQL=mySQL & "'" & fecha_in & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_formulario) from formularios") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE formularios SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "email = '" & email & "',"
mySQL=mySQL & "a_nl = '" & a_nl & "',"
mySQL=mySQL & "a_bd = '" & a_bd & "',"
mySQL=mySQL & "asunto = '" & asunto & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "'"
mySQL=mySQL & " WHERE id_formulario = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]

mySQL="DELETE FROM formulariosCampos where id_formulario =" & cod & ""
set ob_rs=Ob_Conn.execute(mySQL)
for i=1 to 60							      		        
if nombre_(i)<>"" and del_(i)<>"si" then 
opcion_orden=i 
mySQL="INSERT INTO formulariosCampos (nombre,nombre_nombre,valor,tipo_input,tipo_dato,dato,id_formulario,orden,longitud,obligatorio)" '[INSERTAMOS]
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & nombre_(i) & "',"
	mySQL=mySQL & "'" & nombre_nombre_(i) & "',"
	mySQL=mySQL & "'" & valor_(i) & "',"
	mySQL=mySQL & "'" & tipo_input_(i) & "',"
	mySQL=mySQL & "'" & tipo_dato_(i) & "',"
	mySQL=mySQL & "'" & dato_(i) & "',"
	mySQL=mySQL & "" & cod & ","
	mySQL=mySQL & "" & orden_(i) & ","
	mySQL=mySQL & "" & longitud_(i) & ","
	mySQL=mySQL & "'" & obligatorio_(i) & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
del_(i)=""    
end if                    
next										
              '[FIN REESCRITURA]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)
ob_conn.close%>
</body></html>