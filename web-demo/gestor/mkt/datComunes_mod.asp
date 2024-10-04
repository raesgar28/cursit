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
<%nifClave=request("nifClave")
                                                   '[FIN REQUEST]
Sql= "SELECT * from datComunes where id_datComun IS NOT NULL  "     '[RECOGEMOS DATOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
op="up"
else
op="in"
end if
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO datComunes (nifClave)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & nifClave & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE datComunes SET "
mySQL=mySQL & "nifClave = '" & nifClave & "'"
mySQL=mySQL & " WHERE id_datComun = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "datComunes.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>