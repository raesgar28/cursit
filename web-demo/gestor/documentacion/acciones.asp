<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("check")
doc=request("check")
check=request("check")
accion=request("accion")
if r ="" then r = request_equerystring("r")
if rd ="" then rd = request_equerystring("rd")
if n ="" then n = request_equerystring("n")
if ndos ="" then ndos = request_equerystring("ndos")
if ntres ="" then ntres = request_equerystring("ntres")
if ncuat ="" then ncuat = request_equerystring("ncuat")
if op ="" then op = request_equerystring("op")
if cod ="" then cod = request_equerystring("check")
if check ="" then check = request_equerystring("check")
if accion ="" then accion = request_equerystring("accion")
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<%For i=0 to ubound(pks)-1
if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
mySQL="DELETE FROM catDocumentacion where id_catDocumentacion =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
mySQL="DELETE FROM catDocumentacion_rel where id_catDocumentacion =" & pks(i) & " "
set ob_rs=Ob_Conn.execute(mySQL)
Sql= "SELECT nombre FROM catDocumentacion_arch WHERE id_catDocumentacion= "&pks(i)&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
archivete=ob_rs("nombre")
mySQL2="DELETE FROM catDocumentacion_arch where id_catDocumentacion= "&pks(i)&""
set ob_rs2=Ob_Connb.execute(mySQL2)
if  archivete <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_docs/" & archivete)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_docs/" & archivete))
f2.Delete
end if
end if
ob_rs.movenext
loop
end if
end if
                                      '////////////   FIN SI ELEGIMOS ELIMINAR
if accion="dis"then                            '////////////   SI ELEGIMOS DISPONIBLE
mySQL3="UPDATE catDocumentacion SET "
mySQL3=mySQL3 & "disponible =  'si' "
mySQL3=mySQL3 & " WHERE id_catDocumentacion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS DISPONIBLE
if accion="dis_no"then                            '////////////   SI ELEGIMOS NO DISPONIBLE
mySQL3="UPDATE catDocumentacion SET "
mySQL3=mySQL3 & "disponible =  'no' "
mySQL3=mySQL3 & " WHERE id_catDocumentacion = " & pks(i) & "" 
set ob_rs=Ob_Conn.execute(mySQL3)
end if                                   '////////////   FIN SI ELEGIMOS NO DISPONIBLE
Next
'SI ELEGIMOS ELIMINAR DOCUMENTACION
if accion="del_doc"then
Sql= "SELECT archivo, fecha_in,id_alumnoDocumentacion FROM alumnosDocumentacion WHERE id_catDocumentacion= "&doc&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if DateDiff("d",  ob_rs("fecha_in"),date) >=365 then
id_alumnoDocumentacion=ob_rs("id_alumnoDocumentacion")
archivete=ob_rs("archivo")
mySQL2="DELETE FROM alumnosDocumentacion where id_alumnoDocumentacion= "&id_alumnoDocumentacion&""
set ob_rs2=Ob_Connb.execute(mySQL2)
if  archivete <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_docs/" & archivete)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_docs/" & archivete))
f2.Delete
end if
end if
end if
ob_rs.movenext
loop
end if
end if
ob_conn.close
'[REDIRECCIONAMOS]
if accion="del_doc"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del" 
end if
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del" 
end if
if accion="dis"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis" 
end if
if accion="dis_no"then 
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_dis" 
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>