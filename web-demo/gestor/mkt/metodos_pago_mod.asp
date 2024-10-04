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
<%transferencia=request("transferencia")
tarjeta=request("tarjeta")
paypal=request("paypal")
oficina=request("oficina")
datos_transferencia=trim(safeSTR(request("datos_transferencia")))
pay_test=request("pay_test")
pay_mail=request("pay_mail")
tar_comercio=trim(request("tar_comercio"))
tar_cod_comercio=trim(safeSTR(request("tar_cod_comercio")))
tar_pass=trim(request("tar_pass"))
tar_test=request("tar_test")
                                                   '[FIN REQUEST]
Sql= "SELECT * from metodosPago where id_metodoPago IS NOT NULL  "     '[RECOGEMOS DATOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
op="up"
else
op="in"
end if
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO metodosPago (transferencia,tarjeta,paypal,oficina,datos_transferencia,pay_test,pay_mail,tar_comercio,tar_cod_comercio,tar_pass,tar_test)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & transferencia & "',"
	mySQL=mySQL & "'" & tarjeta & "',"
	mySQL=mySQL & "'" & paypal & "',"
	mySQL=mySQL & "'" & oficina & "',"
	mySQL=mySQL & "'" & datos_transferencia & "',"
	mySQL=mySQL & "'" & pay_test & "',"
	mySQL=mySQL & "'" & pay_mail & "',"
	mySQL=mySQL & "'" & tar_comercio & "',"
	mySQL=mySQL & "'" & tar_cod_comercio & "',"
	mySQL=mySQL & "'" & tar_pass & "',"
	mySQL=mySQL & "'" & tar_test & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE metodosPago SET "
mySQL=mySQL & "transferencia = '" & transferencia & "',"
mySQL=mySQL & "tarjeta = '" & tarjeta & "',"
mySQL=mySQL & "paypal = '" & paypal & "',"
mySQL=mySQL & "oficina = '" & oficina & "',"
mySQL=mySQL & "datos_transferencia = '" & datos_transferencia & "',"
mySQL=mySQL & "pay_test = '" & pay_test & "',"
mySQL=mySQL & "pay_mail = '" & pay_mail & "',"
mySQL=mySQL & "tar_comercio = '" & tar_comercio & "',"
mySQL=mySQL & "tar_cod_comercio = '" & tar_cod_comercio & "',"
mySQL=mySQL & "tar_pass = '" & tar_pass & "',"
mySQL=mySQL & "tar_test = '" & tar_test & "'"
mySQL=mySQL & " WHERE id_metodoPago = " & cod & "" 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "metodos_pago.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>