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
ren_mail=request("ren_mail")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%precio_cur_a=trim(request("precio_cur_a"))
pr_cancelacion_pr=trim(request("pr_cancelacion_pr2"))
pr_medico=trim(request("pr_medico"))
pr_cancelacion=trim(request("pr_cancelacion"))
pr_medico_pr=trim(request("pr_medico_pr"))
f_inicio=trim(request("f_inicio2"))
semanas=trim(request("semanas"))
f_fin=trim(request("f_fin2"))
con_examen=trim(safeSTR(request("con_examen")))
pr_gestion_bill_pr=trim(request("pr_gestion_bill_pr"))
tasas_aerop_pr=trim(request("tasas_aerop_pr"))
precio_sup=trim(request("precio_sup"))
suma_total=trim(request("suma_total2"))
pr_examen_pr=trim(request("pr_examen_pr"))
a_observaciones_curso=trim(safeSTR(request("a_observaciones_curso")))
mail_aviso=request("mail_aviso")
mail_aviso_txt=request("mail_aviso")
mail_aviso_final=request("mail_aviso_final")
mail_aviso_final_txt=request("mail_aviso_final")
fin_presupuesto=request("fin_presupuesto")
mail_presup=request("mail_presup")
mail_presup_txt=request("mail_presup")
hab_pago=request("hab_pago")
hab_descarga=request("hab_descarga")
if precio_cur_a<>"" then precio_cur_a=replace(precio_cur_a,",",".") end if
if IsNumeric (precio_cur_a) and precio_cur_a<>"" then precio_cur_a=precio_cur_a else precio_cur_a="" end if


if pr_cancelacion_pr<>"" then pr_cancelacion_pr=replace(pr_cancelacion_pr,",",".") end if
if IsNumeric (pr_cancelacion_pr) and pr_cancelacion_pr<>"" then pr_cancelacion_pr=pr_cancelacion_pr else pr_cancelacion_pr="" end if

pr_cancelacion_pr_txt=trim(request("pr_cancelacion_pr"))
if pr_cancelacion_pr_txt<>"" then
pr_cancelacion_pr_si="si"
else
pr_cancelacion_pr_si=""
end if

if pr_medico_pr<>"" then pr_medico_pr=replace(pr_medico_pr,",",".") end if
if IsNumeric (pr_medico_pr) and pr_medico_pr<>"" then pr_medico_pr=pr_medico_pr else pr_medico_pr="" end if
if IsDate(f_inicio) then f_inicio=f_inicio else f_inicio="01/01/1000" end if
if IsNumeric (semanas) and semanas<>"" then semanas=semanas else semanas="" end if
if IsDate(f_fin) then f_fin=f_fin else f_fin="01/01/1000" end if
if pr_gestion_bill_pr<>"" then pr_gestion_bill_pr=replace(pr_gestion_bill_pr,",",".") end if
if IsNumeric (pr_gestion_bill_pr) and pr_gestion_bill_pr<>"" then pr_gestion_bill_pr=pr_gestion_bill_pr else pr_gestion_bill_pr="" end if
if tasas_aerop_pr<>"" then tasas_aerop_pr=replace(tasas_aerop_pr,",",".") end if
if IsNumeric (tasas_aerop_pr) and tasas_aerop_pr<>"" then tasas_aerop_pr=tasas_aerop_pr else tasas_aerop_pr="" end if
if precio_sup<>"" then precio_sup=replace(precio_sup,",",".") end if
if IsNumeric (precio_sup) and precio_sup<>"" then precio_sup=precio_sup else precio_sup="" end if
if suma_total<>"" then suma_total=replace(suma_total,",",".") end if
if IsNumeric (suma_total) and suma_total<>"" then suma_total=suma_total else suma_total="" end if
if pr_examen_pr<>"" then pr_examen_pr=replace(pr_examen_pr,",",".") end if
if IsNumeric (pr_examen_pr) and pr_examen_pr<>"" then pr_examen_pr=pr_examen_pr else pr_examen_pr="" end if
if pr_medico<>"si" and pr_medico<>"no" then pr_medico="" end if
Sql= "SELECT mail_aviso, mail_aviso_final,mail_presup FROM programas_tmp where id_programa="&cod&""   '[TOTAL PREINSCRIPCIONES - RECUENTO]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if mail_aviso="si" then mail_aviso=ob_rs("mail_aviso")+1 else mail_aviso=ob_rs("mail_aviso") end if
if mail_aviso_final="si" then mail_aviso_final=ob_rs("mail_aviso_final")+1 else mail_aviso_final=ob_rs("mail_aviso_final") end if
if mail_presup="si" then mail_presup=ob_rs("mail_presup")+1 else mail_presup=ob_rs("mail_presup") end if
end if
ob_rs.close
id_programa=cod


Sql= "SELECT pr_cancelacion_pr FROM programas_tmp WHERE id_programa="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pr_cancelacion_pr_txt=ob_rs("pr_cancelacion_pr")
if pr_cancelacion_pr_txt=0 then
pr_cancelacion_pr_si="no" 
else
pr_cancelacion_pr_si="si"
end if
end if
ob_rs.close


if ren_mail<>"enviado" then


'UPDATEAMOS PROGRAMA
mySQL="UPDATE programas_tmp SET "
if precio_cur_a<>"" then mySQL=mySQL & "precio_cur = " & precio_cur_a & "," end if
if pr_cancelacion_pr<>"" then mySQL=mySQL & "pr_cancelacion_pr = " & pr_cancelacion_pr & ","
if pr_medico<>"" then mySQL=mySQL & "pr_medico = '" & pr_medico & "'," end if
if pr_cancelacion<>"" then mySQL=mySQL & "pr_cancelacion = '" & pr_cancelacion & "'," end if
if pr_medico_pr<>"" then mySQL=mySQL & "pr_medico_pr = " & pr_medico_pr & "," end if
if f_inicio<>"" and f_inicio<>"01/01/1000" then mySQL=mySQL & "f_inicio = '" & f_inicio & "'," end if
if semanas<>"" then mySQL=mySQL & "semanas = " & semanas & "," end if
if f_fin<>"" and f_fin<>"01/01/1000" then mySQL=mySQL & "f_fin = '" & f_fin & "'," end if
if pr_gestion_bill_pr<>"" then mySQL=mySQL & "pr_gestion_bill_pr = " & pr_gestion_bill_pr & "," end if
if tasas_aerop_pr<>"" then mySQL=mySQL & "tasas_aerop_pr = '" & tasas_aerop_pr & "'," end if
'mySQL=mySQL & "precio_sup_alo = '" & precio_sup_alo & "',"
if precio_sup<>"" then mySQL=mySQL & "precio_sup = " & precio_sup & "," end if
if suma_total<>"" then mySQL=mySQL & "suma_total = " & suma_total & "," end if
if pr_examen_pr<>"" then mySQL=mySQL & "pr_examen_pr = " & pr_examen_pr & "," end if
if mail_aviso<>"" then mySQL=mySQL & "mail_aviso = " & mail_aviso & "," end if
if mail_presup<>"" then mySQL=mySQL & "mail_presup = " & mail_presup & "," end if
if pr_cancelacion_pr_si<>"" then mySQL=mySQL & "pr_cancelacion = '" & pr_cancelacion_pr_si & "'," end if
if mail_aviso_final<>"" then mySQL=mySQL & "mail_aviso_final = " & mail_aviso_final & "," end if
if fin_presupuesto="si" then
mySQL=mySQL & "estadoPago = 'Presupuesto Finalizado',"
else
mySQL=mySQL & "estadoPago = 'Esperando Presupuesto',"
end if
if a_observaciones_curso<>"" then mySQL=mySQL & "a_observaciones_curso = '" & a_observaciones_curso & "'," end if
if con_examen<>"" then mySQL=mySQL & "con_examen = '" & con_examen & "'," end if
mySQL=mySQL & "fin_presupuesto = '" & fin_presupuesto & "',"
mySQL=mySQL & "hab_pago = '" & hab_pago & "',"
mySQL=mySQL & "hab_descarga = '" & hab_descarga & "'"
mySQL=mySQL & " WHERE id_programa = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)

Dim concepto_(40),concepto_pre_(40),concepto_del_(40)
for i=1 to 40
concepto_(i)=trim(safeSTR(request("concepto_["&i&"]")))
concepto_pre_(i)=request("concepto_pre_["&i&"]")
concepto_del_(i)=request("concepto_del_["&i&"]")
next
mySQL="DELETE FROM programasOpAdd_tmp where id_programa =" & cod & ""
set ob_rs=Ob_Connb.execute(mySQL)
for i=1 to 40							      		        
if concepto_(i)<>"" or concepto_pre_(i)<>"" then
concepto=concepto_(i)
if concepto="" then concepto="Sin especificar" end if
precio=concepto_pre_(i)
if IsNumeric (precio) and precio<>"" then precio=precio else precio=0 end if
concepto_del=concepto_del_(i)
fecha=date
if concepto_del<>"si" then
mySQL="INSERT INTO programasOpAdd_tmp (id_programa,concepto,precio,fecha)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "'" & concepto & "',"
mySQL=mySQL & "'" & precio & "',"
mySQL=mySQL & "'" & fecha & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
end if
next

end if 'REENVIADO

if mail_aviso_txt="si" or mail_aviso_final_txt="si" then
if ren_mail<>"enviado" then
response.redirect("ren_mail_presup.asp?accion=env_mail&id_programa="&cod&"&r="&r&"&rd="&rd&"&mail_aviso_txt="&mail_aviso_txt&"&mail_aviso_final_txt="&mail_aviso_final_txt&"&mail_presup_txt="&mail_presup_txt)
end if
end if


ok="ok"
rd="../../"
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms="&ok&"&cod=" & cod&"&cod="&cod&"&show=presup")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms="&ok&"&cod=" & cod&"&cod="&cod&"&show=presup")%>