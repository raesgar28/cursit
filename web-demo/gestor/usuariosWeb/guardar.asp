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
<%u_nombre=trim(safeSTR(request("u_nombre")))                          '[REQUEST]
u_apellidos=trim(safeSTR(request("u_apellidos")))
u_email=trim(safeSTR(request("u_email")))
'u_usuario=trim(safeSTR(request("titulo_esp")))
u_telefono=trim(safeSTR(request("u_telefono")))
u_movil=trim(safeSTR(request("u_movil")))
u_direccion=trim(safeSTR(request("u_direccion")))
u_ciudad=trim(safeSTR(request("u_ciudad")))
u_c_postal=trim(safeSTR(request("u_c_postal")))
u_provincia=request("u_provincia")
u_pais=request("u_pais")
u_agente=request("u_agente")
habilitado=request("habilitado")
u_observaciones=trim(safeSTR(request("u_observaciones")))
u_empresa=trim(safeSTR(request("u_empresa")))
u_mail_empresa=trim(safeSTR(request("u_mail_empresa")))
u_nif=trim(safeSTR(request("u_nif")))
u_cif=trim(safeSTR(request("u_cif")))
n_letter=request("n_letter")
fecha_mod=now                                                      '[FIN REQUEST]
if op<>"cursos"  then
if op="up" then
Sql= "SELECT u_email FROM usuarios WHERE id_usuario<>"&cod&" and u_email ='"&u_email&"'"   
else
Sql= "SELECT u_email FROM usuarios WHERE u_email ='"&u_email&"'"   
end if '
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod_cat=" & cod_cat&"&ver="&ver) 
end if
end if
ob_rs.close		
if op="in"then															 '[OPCION INSERTAR]
u_agente="si"
fecha_in=date
mySQL="INSERT INTO usuarios (u_nombre,u_apellidos,u_email,u_usuario,u_telefono,u_movil,u_direccion,u_ciudad,u_c_postal,u_provincia,u_pais,fecha_in,u_agente,habilitado,u_nif,n_letter,u_observaciones,u_mail_empresa,u_cif,u_empresa)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & u_nombre & "',"
mySQL=mySQL & "'" & u_apellidos & "',"
mySQL=mySQL & "'" & u_email & "',"
mySQL=mySQL & "'" & u_email & "',"
mySQL=mySQL & "'" & u_telefono & "',"
mySQL=mySQL & "'" & u_movil & "',"
mySQL=mySQL & "'" & u_direccion & "',"
mySQL=mySQL & "'" & u_ciudad & "',"
mySQL=mySQL & "'" & u_c_postal & "',"
mySQL=mySQL & "'" & u_provincia & "',"
mySQL=mySQL & "'" & u_pais & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & u_agente & "',"
mySQL=mySQL & "'" & habilitado & "',"
mySQL=mySQL & "'" & u_nif & "',"
mySQL=mySQL & "'" & n_letter & "',"
mySQL=mySQL & "'" & u_observaciones & "',"
mySQL=mySQL & "'" & u_mail_empresa & "',"
mySQL=mySQL & "'" & u_cif & "',"
mySQL=mySQL & "'" & u_empresa & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_usuario) from usuarios") 
cod = ob_rs(0)
ob_rs.close
end if      				
if op="up"then  
mySQL="UPDATE usuarios SET "
mySQL=mySQL & "u_nombre = '" & u_nombre & "',"
mySQL=mySQL & "u_apellidos = '" & u_apellidos & "',"
mySQL=mySQL & "u_email = '" & u_email & "',"
mySQL=mySQL & "u_telefono = '" & u_telefono & "',"
mySQL=mySQL & "u_movil = '" & u_movil & "',"
mySQL=mySQL & "u_direccion = '" & u_direccion & "',"
mySQL=mySQL & "u_ciudad = '" & u_ciudad & "',"
mySQL=mySQL & "u_c_postal = '" & u_c_postal & "',"
mySQL=mySQL & "u_provincia = '" & u_provincia & "',"
mySQL=mySQL & "u_pais = '" & u_pais & "',"
mySQL=mySQL & "u_agente = '" & u_agente & "',"
mySQL=mySQL & "habilitado = '" & habilitado & "',"
mySQL=mySQL & "u_observaciones = '" & u_observaciones & "',"
mySQL=mySQL & "u_mail_empresa = '" & u_mail_empresa & "',"
mySQL=mySQL & "u_empresa = '" & u_empresa & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "u_nif = '" & u_nif & "',"
mySQL=mySQL & "u_cif = '" & u_cif & "',"
mySQL=mySQL & "n_letter = '" & n_letter & "',"
mySQL=mySQL & "u_usuario = '" & u_email & "'"
mySQL=mySQL & " WHERE id_usuario = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ok="general"
end if
end if
if op="cursos"then
mySQL="DELETE FROM agentesCursos where id_agente =" & cod & ""
set ob_rs=Ob_Connb.execute(mySQL)
fecha=date
check=request("check")
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")
For i=0 to ubound(pks)-1
if pks(i)<>""then
mySQL="INSERT INTO agentesCursos (id_agente,id_item,fecha)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & pks(i) & ","
mySQL=mySQL & "'" & fecha & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
Next
ok="cursos"
end if
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms="&ok&"&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms="&ok&"&edi="&edi) 
ob_conn.close%>
</body></html>