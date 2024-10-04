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
<%id_agente=request("id_agente")
If IsNumeric(id_agente) Then id_agente=id_agente else id_agente=0 end if
id_usuario=request("id_usuario")
If IsNumeric(id_usuario) Then id_usuario=id_usuario else id_usuario=0 end if
id_agente=0
id_escuela=request("id_escuela")
If IsNumeric(id_escuela) Then id_escuela=id_escuela else id_escuela=0 end if
env_mail=request("env_mail")
nom_curso_of=trim(safeSTR(request("nom_curso_of")))
f_inicio_esc=request("f_inicio")
f_fin_esc=request("f_fin")
if f_inicio_esc<>"" then
dia_f=day(f_inicio_esc)
mes_f=month(f_inicio_esc)
if len(dia_f) =1 then dia_f= "0"&dia_f end if
if len(mes_f) =1 then mes_f= "0"&mes_f end if
f_inicio_esc=dia_f&"/"&mes_f&"/"&year(f_inicio_esc)
else
f_inicio_esc="01/01/1000"
end if
if f_fin_esc<>"" then
dia_f=day(f_fin_esc)
mes_f=month(f_fin_esc)
if len(dia_f) =1 then dia_f= "0"&dia_f end if
if len(mes_f) =1 then mes_f= "0"&mes_f end if
f_fin_esc=dia_f&"/"&mes_f&"/"&year(f_fin_esc)
else
f_fin_esc="01/01/1000"
end if

tipo_cambio=trim(safeSTR(request("tipo_cambio")))

falta_pagar=request("falta_pagar")
If IsNumeric(falta_pagar) Then falta_pagar=replace(falta_pagar,".","") else falta_pagar=0 end if
precioReserva=request("precioReserva")
If IsNumeric(precioReserva) Then precioReserva=replace(precioReserva,".","") else precioReserva=0 end if
n_factura=request("n_factura")
pagado=request("pagado")
if pagado="si"then estadoPago="Aceptada"end if
ob_escuela=safeSTR2(request("ob_escuela"))
ob_interna=safeSTR(request("ob_interna"))
gen_factura=request("gen_factura")
'pr_cancelacion_pr=request("pr_cancelacion_pr")
'If IsNumeric(pr_cancelacion_pr) Then pr_cancelacion_pr=replace(pr_cancelacion_pr,".",",") else pr_cancelacion_pr=0 end if
'Sql= "SELECT suma_total, pr_cancelacion_pr, suma_total FROM programas_tmp "   '[TOTAL PREINSCRIPCIONES - RECUENTO]
'Set Ob_RS = Server.CreateObject("ADODB.Recordset")
'Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
'if not ob_rs.eof then
'pr_cancelacion_pr_r=ob_rs("pr_cancelacion_pr")
'if pr_cancelacion_pr <> 0 and FormatNumber(ccur(pr_cancelacion_pr),2)<> FormatNumber(ccur(pr_cancelacion_pr),2) then 
'pr_cancelacion_pr=pr_cancelacion_pr 
'pr_cancelacion="si"
'suma_total_n=ob_rs("suma_total")+FormatNumber(ccur(pr_cancelacion_pr),2)
'else
'pr_cancelacion_pr=pr_cancelacion_pr_r 
'end if
'end if
'ob_rs.close
'falta_pagar=request("falta_pagar")
if gen_factura="si" then n_factura=n_factura else n_factura="" end if
mySQL="UPDATE programas_tmp SET "
mySQL=mySQL & "id_agente = " & id_agente & ","
mySQL=mySQL & "id_usuario = " & id_usuario & ","
mySQL=mySQL & "id_escuela = " & id_escuela & ","
mySQL=mySQL & "env_mail = '" & env_mail & "',"
mySQL=mySQL & "f_inicio_esc = '" & f_inicio_esc & "',"
if pr_cancelacion="si" then mySQL=mySQL & "pr_cancelacion = '" & pr_cancelacion & "'," end if
mySQL=mySQL & "f_fin_esc = '" & f_fin_esc & "',"
mySQL=mySQL & "precioReserva = '" & precioReserva & "',"
'mySQL=mySQL & "pr_cancelacion_pr = '" & pr_cancelacion_pr & "',"
mySQL=mySQL & "ob_escuela = '" & ob_escuela & "',"
mySQL=mySQL & "ob_interna = '" & ob_interna & "',"
if pagado="si"then mySQL=mySQL & "estadoPago = '" & estadoPago & "'," end if
if suma_total_n<>""then mySQL=mySQL & "suma_total = '" & suma_total & "',"end if
'mySQL=mySQL & "n_factura = '" & n_factura & "',"
mySQL=mySQL & "gen_factura = '" & gen_factura & "',"
mySQL=mySQL & "falta_pagar = '" & falta_pagar & "',"
mySQL=mySQL & "tipo_cambio = '" & tipo_cambio & "',"
mySQL=mySQL & "guardado = 'si'"
mySQL=mySQL & " WHERE id_programa = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi) 
ob_conn.close%>
</body></html>