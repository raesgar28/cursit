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
check=request("check")
accion=request("accion")
cod_cat=request("cod_cat")
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
if cod_cat ="" then cod_cat = request_equerystring("cod_cat")
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&op="&op&"&check="&check&"&accion="&accion&"&cod_cat="&cod_cat))
check=check&", 0"  'EL CERO LO PONGO PARA QUE FUNCIONE EL SPLIT
pks = split(check,",")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%For i=0 to ubound(pks)-1
if accion="del"then                            '////////////   SI ELEGIMOS ELIMINAR
Sql= "SELECT nombre from packs_rel_archivos where id_pack="&pks(i)&""                             
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if  ob_rs("nombre") <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_packs/" & ob_rs("nombre"))) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_packs/" & ob_rs("nombre")))
f2.Delete
end if
end if
ob_rs.movenext
loop
end if
ob_rs.close
mySQL="DELETE FROM packs_rel_archivos where id_pack =" & pks(i) & " "
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM packs_rel where id_pack =" & pks(i) & " "
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM packs where id_pack =" & pks(i) & " "
set ob_rs=Ob_Connb.execute(mySQL)
end if                                      '////////////   FIN SI ELEGIMOS ELIMINAR
Next
ob_conn.close
'[REDIRECCIONAMOS]
if accion="del"then
Encryption_String = "?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ok_del&cod_cat="&cod_cat 
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len(Encryption_String)) 
redirecciona = "enc=" & EnCrypt(Encryption_String) 
Response.Redirect "listado.jpk2?" & redirecciona%>
</body></html>