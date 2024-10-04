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
edi=request("edi")
completado_r=request("completado")
tip=request("tip")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%form_op=request("form_op")
cod=request("cod")
cod_prog=request("cod_prog")
cod_cat=request("cod_cat")
mail_aviso=request("mail_aviso")
mail_aviso_docs=request("mail_aviso_docs")
 '[id_item,... SACAMOS ALGUNOS VALORES COMUNES NECESARIOS]
Sql= "SELECT * FROM programas WHERE id_programa="&cod_prog&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_item=ob_rs("id_item") 
id_programa=ob_rs("id_programa")
id_curso=ob_rs("id_curso")
id_agente=ob_rs("id_agente")
id_usuario=ob_rs("id_usuario")
id_alumno=ob_rs("id_alumno")
env_mail_docs=ob_rs("env_mail_docs")
hay_fac=ob_rs("n_factura")
completado=ob_rs("completado")
mail_aviso_bd=ob_rs("mail_aviso")
precio_cur_prev=ob_rs("precio_cur")
precio_sup_prev=ob_rs("precio_sup")
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
'tasas_concepto_prev=ob_rs("tasas_concepto")'ALOJAMIENTO
'tasas_opciones_prev=ob_rs("tasas_opciones")'ALOJAMIENTO
'precio_sup_alo_prev=ob_rs("precio_sup_alo")'ALOJAMIENTO
if completado="" then completado=0 end if
if completado="" or isnull(completado) or completado=0 then completado=0 end if
if mail_aviso_bd="" or isnull(mail_aviso_bd) or mail_aviso_bd=0 then mail_aviso_bd=0 end if
end if
ob_rs.close
if completado_r<>""then completado=completado+1 end if
if mail_aviso<>""then mail_aviso_bd=mail_aviso_bd+1 end if
if form_op="programa" then  'CASO PROGRAMA ///////////////////////////////////////////////
Sql= "SELECT campamento FROM items WHERE id_item ="&id_item&" "   '[CAMPAMENTOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then campamento=ob_rs("campamento") end if
ob_rs.close
'RECOGEMOS Y SACAMOS VALORES
nom_cat=request("nom_cat")
cod_cat=request("cod_cat")
nom_item=request("nom_item")
pr_medico=request("pr_medico")
pr_examen=request("pr_examen")
pr_cancelacion=request("pr_cancelacion")
pr_gestion_bill=request("pr_gestion_bill")
nom_destino=request("nom_destino")
if nom_destino <>"" then nom_destino=trim(safeSTR(nom_destino))end if
tipo_cambio=request("tipo_cambio")
if tipo_cambio <>"" then tipo_cambio=trim(safeSTR(tipo_cambio))end if
aeropuerto=request("aeropuerto")
if aeropuerto<>"" then
aeropuerto = Split(aeropuerto, "|")
id_aeropuerto= aeropuerto(0)
if IsNumeric(id_aeropuerto) and id_aeropuerto<>"" then id_aeropuerto=id_aeropuerto else id_aeropuerto=0 end if
aeropuerto_mes = aeropuerto(1)
id_itemSubAero=aeropuerto(2)
if IsNumeric(id_itemSubAero) and id_itemSubAero<>"" then id_itemSubAero=id_itemSubAero else id_itemSubAero=0 end if
else
id_aeropuerto=0
id_itemSubAero=0
end if
if id_aeropuerto<>"" and id_aeropuerto<>0 then
Sql= "SELECT ciudad FROM aeropuertos WHERE id_aeropuerto ="&id_aeropuerto&" "   '[AEROPUERTOS NOMBRE]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then ciudad=ob_rs("ciudad") end if
ob_rs.close
end if
f_inicio=request("f_inicio")
if IsDate(f_inicio) then f_inicio=f_inicio else f_inicio="01/01/1000" end if
f_fin=request("f_fin")
if IsDate(f_fin) then f_fin=f_fin else f_fin="01/01/1000" end if
semanas=request("semanas")
if IsNumeric(semanas) and semanas<>"0" then semanas=semanas else semanas=0 end if
salida_fecha=request("salida_fecha")
if IsDate(salida_fecha) then salida_fecha=salida_fecha else salida_fecha="01/01/1000" end if
salida_mes=request("salida_mes")
salida_quincena=request("salida_quincena")
nom_quincena=request("nom_quincena")
nom_curso=trim(safeSTR(request("nom_curso")))
alojamiento=request("alojamiento")
if alojamiento<>"" then
alojamiento = Split(alojamiento, "|")
id_alo_opcion= alojamiento(0)
id_alojamiento = alojamiento(1)
Sql= "SELECT titulo_esp FROM alo_conceptos WHERE id_alojamiento ="&id_alojamiento&" "   '[ALOJAMIENTO CONCEPTO]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
alo_concepto=ob_rs("titulo_esp")
end if
ob_rs.close
Sql= "SELECT op_alo FROM alo_opciones WHERE id_alo_opcion ="&id_alo_opcion&" "   '[ALOJAMIENTO OPCION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
op_alo=ob_rs("op_alo")
if op_alo<>"" then
Sql2= "SELECT titulo_esp FROM alo_op WHERE id_alo_op ="&op_alo&" "   '[ALOJAMIENTO OPCION]
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then alo_opcion=ob_rs2("titulo_esp") end if
ob_rs2.close
end if
end if
ob_rs.close
else
id_alo_opcion=0
id_alojamiento=0
end if


'UPDATEAMOS OPCIONES DE PROGRAMA
Dim opp(40),opc(40)
for i=1 to 40
opp(i)=request("opp["&i&"]") 
opc(i)=request("opc["&i&"]")
next
mySQL="DELETE FROM programasOp where id_programa =" & cod_prog & " and id_itemOp <> 0"
set ob_rs=Ob_Connb.execute(mySQL)
for i=1 to 40							      		        
if opp(i)<>"" then
opp_ = Split(opp(i), "|")
id_itemOp= opp_(0)
nom_opcion_prog=trim(safeSTR(opp_(1)))
mySQL="INSERT INTO programasOp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_prog,id_itemOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_prog & "',"
mySQL=mySQL & "" & id_itemOp & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
next
'UPDATEAMOS OPCIONES DE CURSO
mySQL="DELETE FROM programasOp where id_programa =" & cod_prog & " and id_itemSubOp <> 0 and (transfer IS NULL or transfer='')"
set ob_rs=Ob_Connb.execute(mySQL)
for i=1 to 40							      		        
if opc(i)<>"" then
opc_ = Split(opc(i), "|")
id_itemSubOp= opc_(0)
nom_opcion_cur=trim(safeSTR(opc_(1)))
mySQL="INSERT INTO programasOp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_curso,id_itemSubOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_cur & "',"
mySQL=mySQL & "" & id_itemSubOp & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
next

mySQL="DELETE FROM programasOp where id_programa =" & cod_prog & " and transfer='si'"
set ob_rs=Ob_Connb.execute(mySQL)
transfer=request("transfer")
if transfer<>"" then
transfer_ = Split(transfer, "|")
id_itemSubOp= transfer_(0)
nom_opcion_cur=trim(safeSTR(transfer_(1)))
transfer_si="si"
mySQL="INSERT INTO programasOp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_curso,id_itemSubOp,transfer)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_cur & "',"
mySQL=mySQL & "" & id_itemSubOp & ","
mySQL=mySQL & "'" & transfer_si & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
'UPDATEAMOS PROGRAMAS
mySQL="UPDATE programas SET "
mySQL=mySQL & "s_mes = '" & aeropuerto_mes & "',"
mySQL=mySQL & "id_aeropuerto = " & id_aeropuerto & ","
mySQL=mySQL & "id_itemSubAero = " & id_itemSubAero & ","
mySQL=mySQL & "aero_ciudad = '" & ciudad & "',"
mySQL=mySQL & "f_inicio = '" & f_inicio & "',"
mySQL=mySQL & "f_fin = '" & f_fin & "',"
mySQL=mySQL & "pr_medico = '" & pr_medico & "',"
mySQL=mySQL & "pr_examen = '" & pr_examen & "',"
mySQL=mySQL & "pr_cancelacion = '" & pr_cancelacion & "',"
mySQL=mySQL & "pr_gestion_bill = '" & pr_gestion_bill & "',"
mySQL=mySQL & "alo_concepto = '" & alo_concepto & "',"
mySQL=mySQL & "alo_opcion = '" & alo_opcion & "',"
mySQL=mySQL & "id_alo_opcion = " & id_alo_opcion & ","
mySQL=mySQL & "id_alojamiento = " & id_alojamiento & ","
mySQL=mySQL & "nom_destino = '" & nom_destino & "',"
mySQL=mySQL & "semanas = '" & semanas & "',"
mySQL=mySQL & "tipo_cambio = '" & tipo_cambio & "'"
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ok=1
end if  'FIN  CASO PROGRAMA ///////////////////////////////////////////////////////////////////////////////////////

if form_op = "contabilildad" then  '  CASO CONTABILIDAD ///////////////////////////////////////////////////////////////////////////////////////
'RECOGEMOS VALORES
a_observaciones_crm=request("a_observaciones_crm")
precio_cur=trim(request("precio_cur"))
if IsNumeric (precio_cur) and precio_cur<>"" then precio_cur=precio_cur else precio_cur=0 end if
pr_medico_pr=trim(request("pr_medico_pr"))
if IsNumeric (pr_medico_pr) and pr_medico_pr<>"" then pr_medico_pr=pr_medico_pr else pr_medico_pr=0 end if
pr_examen_pr=trim(request("pr_examen_pr"))
if IsNumeric (pr_examen_pr) and pr_examen_pr<>"" then pr_examen_pr=pr_examen_pr else pr_examen_pr=0 end if
tasas_aerop_pr=trim(request("tasas_aerop_pr"))
if IsNumeric (tasas_aerop_pr) and tasas_aerop_pr<>"" then tasas_aerop_pr=tasas_aerop_pr else tasas_aerop_pr=0 end if
precio_alo=trim(request("precio_alo_a"))
if IsNumeric (precio_alo) and precio_alo<>"" then precio_alo=precio_alo else precio_alo=0 end if
tasas_concepto=trim(request("tasas_concepto"))
if IsNumeric (tasas_concepto) and tasas_concepto<>"" then tasas_concepto=tasas_concepto else tasas_concepto=0 end if
precio_alo=CDbl(precio_alo)+CDbl(tasas_concepto)
precio_sup_alo=trim(request("precio_sup_alo"))
if IsNumeric (precio_sup_alo) and precio_sup_alo<>"" then precio_sup_alo=precio_sup_alo else precio_sup_alo=0 end if
precio_alo=CDbl(precio_alo)+CDbl(precio_sup_alo)
tasas_opciones=trim(request("tasas_opciones"))
if IsNumeric (tasas_opciones) and tasas_opciones<>"" then tasas_opciones=tasas_opciones else tasas_opciones=0 end if
precio_alo=CDbl(precio_alo)+CDbl(tasas_opciones)
ajuste=trim(request("ajuste"))
if IsNumeric (ajuste) and ajuste<>"" then ajuste=ajuste else ajuste=0 end if
pr_ajuste=trim(request("pr_ajuste"))
precio_sup=trim(request("precio_sup"))
if IsNumeric (precio_sup) and precio_sup<>"" then precio_sup=precio_sup else precio_sup=0 end if
if precio_sup_prev="" or ISNULL(precio_sup_prev) then precio_sup_prev=0 end if
precio_sup_prev=FormatNumber(ccur(precio_sup_prev),2)
if precio_sup_prev=0 and precio_sup="" then precio_cur=precio_cur-precio_sup_prev end if
if precio_sup_prev=0 and precio_sup<>"" then precio_cur=CDbl(precio_cur)+CDbl(precio_sup) end if
if precio_sup_prev>0 and precio_sup_prev <> precio_sup then precio_cur=CDbl(precio_cur)+CDbl(precio_sup) end if
if precio_sup_prev>0 and precio_sup_prev = precio_sup then precio_cur=CDbl(precio_cur)+CDbl(precio_sup) end if
pr_cancelacion_pr=trim(request("pr_cancelacion_pr"))
if IsNumeric (pr_cancelacion_pr) and pr_cancelacion_pr<>"" then pr_cancelacion_pr=pr_cancelacion_pr else pr_cancelacion_pr=0 end if
opcion_transfer_pr=trim(request("opcion_transfer_pr"))
if IsNumeric (opcion_transfer_pr) and opcion_transfer_pr<>"" then opcion_transfer_pr=opcion_transfer_pr else opcion_transfer_pr=0 end if
pr_gestion_bill_pr=trim(request("pr_gestion_bill_pr"))
if IsNumeric (pr_gestion_bill_pr) and pr_gestion_bill_pr<>"" then pr_gestion_bill_pr=pr_gestion_bill_pr else pr_gestion_bill_pr=0 end if
n_fac=trim(request("n_factura"))
gen_fac=trim(request("gen_fac"))
metodoPago=trim(safeSTR(request("metodoPago")))
estadoPago=trim(request("estadoPago"))
u_f_direccion=trim(request("u_f_direccion"))
if u_f_direccion<>"" then u_f_direccion=safeSTR(u_f_direccion)end if
u_f_nombre=trim(request("u_f_nombre"))
if u_f_nombre<>"" then u_f_nombre=safeSTR(u_f_nombre)end if
u_f_nif=trim(request("u_f_nif"))
a_observaciones_curso=trim(request("a_observaciones_curso"))
if a_observaciones_curso<>"" then a_observaciones_curso=safeSTR(a_observaciones_curso)end if
precioReserva=trim(request("precioReserva"))
if IsNumeric (precioReserva) and precioReserva<>"" then precioReserva=precioReserva else precioReserva=0 end if
suma_total=trim(request("suma_total"))
if IsNumeric (suma_total) and suma_total<>"" then suma_total=suma_total else suma_total=0 end if
falta_pagar=trim(request("falta_pagar"))
if IsNumeric (falta_pagar) and falta_pagar<>"" then falta_pagar=falta_pagar else falta_pagar=0 end if
fechaPago=trim(request("fechaPago"))
if IsDate(fechaPago) then fechaPago=fechaPago else fechaPago="01/01/1000" end if
fechaEmision=trim(request("fechaEmision"))
if IsDate(fechaEmision) then fechaEmision=fechaEmision else fechaEmision="01/01/1000" end if


'METEMOS OPCIONES
Dim opp_p(40),oppc(40),opc_p(40),opcc(40)
for i=1 to 40
opp_p(i)=request("opp_p["&i&"]")'PRECIO
oppc(i)=request("oppc["&i&"]")'id_programaOp | Nombre
opc_p(i)=request("opc_p["&i&"]")'CASO CURSO
opcc(i)=request("opcc["&i&"]")'CASO CURSO
%><%=opc_p(i)%> op<br><%

next

'OP PROGRAMA
mySQL="DELETE FROM programasOp where id_programa =" & cod_prog & " and id_itemOp <> 0 and (transfer IS NULL or transfer='')"
set ob_rs=Ob_Connb.execute(mySQL)
for i=1 to 40							      		        
if oppc(i)<>"" then
oppc_ = Split(oppc(i), "|")
id_itemOp= oppc_(0)
nom_opcion_prog=trim(safeSTR(oppc_(1)))
precio_op_p=opp_p(i)
if IsNumeric (precio_op_p) and precio_op_p<>"" then precio_op_p=precio_op_p else precio_op_p=0 end if
mySQL="INSERT INTO programasOp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_prog,opcion_pre_prog,id_itemOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_prog & "',"
mySQL=mySQL & "'" & precio_op_p & "',"
mySQL=mySQL & "" & id_itemOp & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
next

'OP CURSO
'mySQL="DELETE FROM programasOp where id_programa =" & cod_prog & " and id_itemSubOp <> 0 and (transfer IS NULL or transfer='')"
'set ob_rs=Ob_Connb.execute(mySQL)


mySQL="UPDATE programasOp SET "
mySQL=mySQL & "id_itemSubOp =  '0'"
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)



for i=1 to 40							      		        
if opcc(i)<>"" then
opcc_ = Split(opcc(i), "|")
id_itemSubOp= opcc_(0)
nom_opcion_cur=trim(safeSTR(opcc_(1)))
precio_op_c=opc_p(i)
if IsNumeric (precio_op_c) and precio_op_c<>"" then precio_op_c=precio_op_c else precio_op_c=0 end if


mySQL="DELETE FROM programasOp where id_programa =" & cod_prog & " and id_itemSubOp = 0 and nom_opcion_curso = '"&safeSTR(nom_opcion_cur)&"' and (transfer IS NULL or transfer='')"
set ob_rs=Ob_Connb.execute(mySQL)

mySQL="INSERT INTO programasOp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_curso,opcion_pre_curso,id_itemSubOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & cod & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_cur & "',"
mySQL=mySQL & "'" & precio_op_c & "',"
mySQL=mySQL & "" & id_itemSubOp & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
next

'METEMOS CONCEPTOS
Dim concepto_(40),concepto_pre_(40),concepto_del_(40)
for i=1 to 40
concepto_(i)=request("concepto_["&i&"]")
concepto_pre_(i)=request("concepto_pre_["&i&"]")
concepto_del_(i)=request("concepto_del_["&i&"]")
next
mySQL="DELETE FROM programasOpAdd where id_programa =" & cod_prog & ""
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
mySQL="INSERT INTO programasOpAdd (id_programa,concepto,precio,fecha)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "'" & concepto & "',"
mySQL=mySQL & "'" & precio & "',"
mySQL=mySQL & "'" & fecha & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
end if
next

'METEMOS ANTICIPOS
Dim anticipo_(40),anticipo_pre_(40),anticipo_fec_(40),anticipo_pag_(40),anticipo_estadoPago_(40),metodo_pag_(40),anticipo_del_(40),anticipo_ref_(40),anticipo_ref_pay_(40)
for i=1 to 40
anticipo_(i)=request("anticipo_["&i&"]") 
anticipo_pre_(i)=request("anticipo_pre_["&i&"]")
anticipo_fec_(i)=request("anticipo_fec_["&i&"]")
anticipo_pag_(i)=request("anticipo_pag_["&i&"]")
anticipo_estadoPago_(i)=request("anticipo_estadoPago_["&i&"]")
metodo_pag_(i)=request("metodo_pag_["&i&"]")
anticipo_del_(i)=request("anticipo_del_["&i&"]")
anticipo_ref_(i)=request("anticipo_ref_["&i&"]")
anticipo_ref_pay_(i)=request("anticipo_ref_pay_["&i&"]")
next

mySQL="DELETE FROM programasAnticipos where id_programa =" & cod_prog & ""
set ob_rs=Ob_Connb.execute(mySQL)
for i=1 to 40							      		        
if anticipo_(i)<>"" then
anticipo=trim(safeSTR(anticipo_(i)))
anticipo_pre=anticipo_pre_(i)
if IsNumeric (anticipo_pre) and anticipo_pre<>"" then anticipo_pre=anticipo_pre else anticipo_pre=0 end if
anticipo_fec=anticipo_fec_(i)
if IsDate (anticipo_fec) and anticipo_fec<>"" then anticipo_fec=anticipo_fec else anticipo_fec=date end if
anticipo_pag=anticipo_pag_(i)
anticipo_estadoPago=anticipo_estadoPago_(i)
metodo_pag=metodo_pag_(i)
anticipo_del=anticipo_del_(i)
anticipo_ref=anticipo_ref_(i)
anticipo_ref_pay=anticipo_ref_pay_(i)

if anticipo_del<>"si" then
mySQL="INSERT INTO programasAnticipos (id_programa,anticipo,precio,fecha,pagado,estadoPago,metodoPago,refPago,refPagoPay)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "'" & anticipo & "',"
mySQL=mySQL & "'" & anticipo_pre & "',"
mySQL=mySQL & "'" & anticipo_fec & "',"
mySQL=mySQL & "'" & anticipo_pag & "',"
mySQL=mySQL & "'" & anticipo_estadoPago & "',"
mySQL=mySQL & "'" & metodo_pag & "',"
mySQL=mySQL & "'" & anticipo_ref & "',"
mySQL=mySQL & "'" & anticipo_ref_pay & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
end if
next

'UPDATEAMOS PROGRAMA
mySQL="UPDATE programas SET "
mySQL=mySQL & "precio_cur = '" & precio_cur & "',"
mySQL=mySQL & "pr_medico_pr = '" & pr_medico_pr & "',"
mySQL=mySQL & "pr_examen_pr = '" & pr_examen_pr & "',"
mySQL=mySQL & "tasas_aerop_pr = '" & tasas_aerop_pr & "',"
mySQL=mySQL & "precio_alo = '" & precio_alo & "',"
mySQL=mySQL & "tasas_concepto = '" & tasas_concepto & "',"
mySQL=mySQL & "precio_sup = '" & precio_sup & "',"
mySQL=mySQL & "pr_cancelacion_pr = '" & pr_cancelacion_pr & "',"
mySQL=mySQL & "pr_gestion_bill_pr = '" & pr_gestion_bill_pr & "',"
mySQL=mySQL & "precio_sup_alo = '" & precio_sup_alo & "',"
mySQL=mySQL & "tasas_opciones = '" & tasas_opciones & "',"
mySQL=mySQL & "completado = " & completado & ","
mySQL=mySQL & "mail_aviso = " & mail_aviso_bd & ","

'COMPROBAMOS QUE FACYURA NO ESTÉ YA METIDA
if gen_fac="si" and n_fac<>"" then 
Sql= "SELECT n_factura FROM programas WHERE id_programa<>"&cod_prog&" and n_factura='"&n_fac&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
dup_factura="si"
n_fac_w=n_fac
else
	Sql2= "SELECT n_factura FROM facturas WHERE id_programa<>"&cod_prog&" and n_factura='"&n_fac&"'"
	Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
	Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
	if not ob_rs2.eof then 
	dup_factura="si"
	n_fac_w=n_fac
	gen_fac=""
	else
	mySQL=mySQL & "n_factura = '" & n_fac & "',"
	end if
	ob_rs2.close
end if
ob_rs.close
end if

if gen_fac="si" and n_fac="" then 
dup_factura=""
gen_fac=""
mySQL=mySQL & "n_factura = '',"
end if

mySQL=mySQL & "gen_fac = '" & gen_fac & "',"
mySQL=mySQL & "metodoPago = '" & metodoPago & "',"
mySQL=mySQL & "estadoPago = '" & estadoPago & "',"
mySQL=mySQL & "u_f_direccion = '" & u_f_direccion & "',"
mySQL=mySQL & "u_f_nombre = '" & u_f_nombre & "',"
mySQL=mySQL & "u_f_nif = '" & u_f_nif & "',"
mySQL=mySQL & "a_observaciones_curso = '" & a_observaciones_curso & "',"
mySQL=mySQL & "precioReserva = '" & precioReserva & "',"
mySQL=mySQL & "suma_total = '" & suma_total & "',"
mySQL=mySQL & "falta_pagar = '" & falta_pagar & "',"
mySQL=mySQL & "fechaPago = '" & fechaPago & "',"
mySQL=mySQL & "fechaEmision = '" & fechaEmision & "',"
mySQL=mySQL & "ajuste = '" & ajuste & "',"
mySQL=mySQL & "pr_ajuste = '" & pr_ajuste & "',"
mySQL=mySQL & "a_observaciones_crm = '" & a_observaciones_crm & "'"
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)


'if opcion_transfer_pr<>"" and opcion_transfer_pr<>0 then
Sql= "SELECT id_programa FROM programasOp WHERE id_programa="&cod_prog&" and transfer='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 

'UPDATEAMOS SI CAMBIA TRANSFER
mySQL="UPDATE programasOp SET "
mySQL=mySQL & "opcion_pre_curso = '" & opcion_transfer_pr & "'"
mySQL=mySQL & " WHERE id_programa = " & cod_prog & " and transfer='si'" 
set ob_rs1=Ob_Connb.execute(mySQL)
else

'INSERTAMOS SI NO HABIA TRANSFER
mySQL="INSERT INTO programasOp (opcion_pre_curso,transfer,id_programa)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & opcion_transfer_pr & "',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "" & cod_prog & ""
mySQL=mySQL & ");" 
set ob_rs1=Ob_Connb.execute(mySQL)
ob_rs.close
end if
'end if

if completado_r<>"" then'ENVIAMOS MAIL DICIENDO QUE PAGO COMPLETADO
Sql= "SELECT * FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_empresa=ob_rs("titulo_esp")
id_web=ob_rs("id_web")
f_smtp=ob_rs("f_smtp")
f_usuario=ob_rs("f_usuario")
f_pass=ob_rs("f_pass")
f_email=ob_rs("f_email")
f_puerto=ob_rs("f_puerto")
f_texto_legal=ob_rs("f_texto_legal")
email=ob_rs("email")
direccion=ob_rs("direccion")
cod_postal=ob_rs("cod_postal")
ciudad=ob_rs("ciudad")
provincia=ob_rs("provincia")
pais=ob_rs("pais")
if pais="es" then pais="España" end if
telefono=ob_rs("telefono")
url=ob_rs("url")
url_c=ob_rs("url")
if url <>"" then
url=replace(url,"https://","")
url=replace(url,"http://","")
end if
end if
ob_rs.close
if id_web<>""then
Sql= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_img=ob_rs("nombre")
nombre_img=url_c&nombre_img
alt=ob_rs("alt")
end if
ob_rs.close
end if
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close
Mail.AddAddress f_email%>
<!--#include file="../../web/comun/limpia.asp"-->
<%asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Pago completado "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br><b>Nota interna de CRM:</b>"
texto=texto &"<br><br>El pago del curso "&nom_item&" en la modalidad "&nom_curso&" del alumno <b>"&a_nombre&" "&a_apellidos&"</b> ha sido COMPLETADO."
texto=texto &"<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
end if'FIN ENVIAMOS MAIL DICIENDO QUE PAGO COMPLETADO
ok=2
end if  ' FIN CASO CONTABILIDAD ///////////////////////////////////////////////////////////////////////////////////////


if form_op = "facturas" then  '  CASO FACTURAS ///////////////////////////////////////////////////////////////////////////////////////
id_factura=request("id_factura")
Dim concepto1_fac_(40),concepto1_fac_pre_(40),concepto2_fac_(40),concepto2_fac_pre_(40),concepto3_fac_(40),concepto3_fac_pre_(40),n_fac_(40),fecha_emision_fac_(40),fecha_pago_fac_(40),total_fac_(40),fac_ajuste_(40),gen_ajuste_(40),gen_fac_(40),factura_del_(40),estadoPago_f_(40),metodoPago_f_(40)
for i=1 to 40
concepto1_fac_(i)=request("concepto1_fac_["&i&"]")
if concepto1_fac_(i)<>"" then concepto1_fac_(i)=trim(safeSTR(concepto1_fac_(i)))
concepto1_fac_pre_(i)=request("concepto1_fac_pre_["&i&"]")
concepto2_fac_(i)=request("concepto2_fac_["&i&"]")
if concepto2_fac_(i)<>"" then concepto2_fac_(i)=trim(safeSTR(concepto2_fac_(i)))
concepto2_fac_pre_(i)=request("concepto2_fac_pre_["&i&"]")
concepto3_fac_(i)=request("concepto3_fac_["&i&"]")
if concepto3_fac_(i)<>"" then concepto3_fac_(i)=trim(safeSTR(concepto3_fac_(i)))
concepto3_fac_pre_(i)=request("concepto3_fac_pre_["&i&"]")
fecha_emision_fac_(i)=request("fecha_emision_fac_["&i&"]")
fecha_pago_fac_(i)=request("fecha_pago_fac_["&i&"]")
total_fac_(i)=request("total_fac_["&i&"]")
fac_ajuste_(i)=request("fac_ajuste_["&i&"]")
gen_ajuste_(i)=request("gen_ajuste_["&i&"]")
gen_fac_(i)=request("gen_fac_["&i&"]")
factura_del_(i)=request("factura_del_["&i&"]")
estadoPago_f_(i)=request("estadoPago_f_["&i&"]")
metodoPago_f_(i)=request("metodoPago_f_["&i&"]")
n_fac_(i)=request("n_fac_"&i&"")
next
if id_factura<>""then
mySQL="DELETE FROM facturas where id_programa =" & cod_prog & " and id_factura="&id_factura&""
set ob_rs=Ob_Connb.execute(mySQL)
end if
for i=1 to 40							      		        
if concepto1_fac_(i)<>"" then
concepto1=concepto1_fac_(i)
precio1=concepto1_fac_pre_(i)
concepto2=concepto2_fac_(i)
precio2=concepto2_fac_pre_(i)
concepto3=concepto3_fac_(i)
precio3=concepto3_fac_pre_(i)
if IsNumeric (precio1) and precio1<>"" then precio1=precio1 else precio1=0 end if
if IsNumeric (precio2) and precio2<>"" then precio2=precio2 else precio2=0 end if
if IsNumeric (precio3) and precio3<>"" then precio3=precio3 else precio3=0 end if
fecha_emision_fac=fecha_emision_fac_(i)
if IsDate(fecha_emision_fac) and fecha_emision_fac<>""then fecha_emision_fac=fecha_emision_fac else fecha_emision_fac="01/01/1000" end if
fecha_pago_fac=fecha_pago_fac_(i)
if IsDate(fecha_pago_fac) and fecha_pago_fac<>""then fecha_pago_fac=fecha_pago_fac else fecha_pago_fac="01/01/1000" end if
total_fac=total_fac_(i)
if IsNumeric (total_fac) and total_fac<>"" then total_fac=total_fac else total_fac=0 end if
fac_ajuste=fac_ajuste_(i)
if IsNumeric (fac_ajuste) and fac_ajuste<>"" then fac_ajuste=fac_ajuste else fac_ajuste=0 end if
gen_ajuste=gen_ajuste_(i)
gen_fac=gen_fac_(i)
factura_del=factura_del_(i)
estadoPago_f=estadoPago_f_(i)
metodoPago_f=metodoPago_f_(i)
n_fac=n_fac_(i)
if gen_fac="si" then n_fac=n_fac else n_fac="" end if
fecha_creacion=date
if factura_del<>"si" then
'COMPROBAMOS QUE FACYURA NO ESTÉ YA METIDA
if gen_fac="si" and n_fac<>"" then 
Sql= "SELECT n_factura FROM programas WHERE id_programa<>"&cod_prog&" and n_factura='"&n_fac&"' and n_factura<>''"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
dup_factura="si"
n_fac_w=n_fac
else
	Sql2= "SELECT n_factura FROM facturas WHERE id_programa<>"&cod_prog&" and n_factura='"&n_fac&"'"
	Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
	Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
	if not ob_rs2.eof then 
	dup_factura="si"
	n_fac_w=n_fac
	n_fac=""
	gen_fac=""
	else
	n_fac=n_fac
	n_fac_w=n_fac
	end if
	ob_rs2.close
end if
ob_rs.close
end if
if gen_fac="si" and n_fac="" then 
dup_factura=""
gen_fac=""
n_fac=""
end if
mySQL="INSERT INTO facturas (id_programa,concepto1,precio1,concepto2,precio2,concepto3,precio3,fecha_emision,fecha_pago,total,fac_ajuste,gen_ajuste,estadoPago,metodoPago,n_factura,fecha_creacion)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & cod_prog & ","
mySQL=mySQL & "'" & concepto1 & "',"
mySQL=mySQL & "'" & precio1 & "',"
mySQL=mySQL & "'" & concepto2 & "',"
mySQL=mySQL & "'" & precio2 & "',"
mySQL=mySQL & "'" & concepto3 & "',"
mySQL=mySQL & "'" & precio3 & "',"
mySQL=mySQL & "'" & fecha_emision_fac & "',"
mySQL=mySQL & "'" & fecha_pago_fac & "',"
mySQL=mySQL & "'" & total_fac & "',"
mySQL=mySQL & "'" & fac_ajuste & "',"
mySQL=mySQL & "'" & gen_ajuste & "',"
mySQL=mySQL & "'" & estadoPago_f & "',"
mySQL=mySQL & "'" & metodoPago_f & "',"
mySQL=mySQL & "'" & n_fac & "',"
mySQL=mySQL & "'" & fecha_creacion & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
end if
next
ok=3
end if '        FIN  CASO FACTURAS ///////////////////////////////////////////////////////////////////////////////////////



if form_op = "alumno" then  '  CASO ALUMNO ///////////////////////////////////////////////////////////////////////////////////////
a_nombre=trim(safeSTR(request("a_nombre")))
a_apellidos=trim(safeSTR(request("a_apellidos")))
a_email=trim(safeSTR(request("a_email")))
a_telefono=trim(safeSTR(request("a_telefono")))
a_movil=trim(safeSTR(request("a_movil")))
a_movil_sms=trim(safeSTR(request("a_movil_sms")))
a_nif=trim(safeSTR(request("a_nif")))
a_cumple=trim(safeSTR(request("a_cumple")))
if IsDate(a_cumple) and a_cumple<>""then a_cumple=a_cumple else a_cumple="01/01/1000" end if
a_permiso_medico=request("a_permiso_medico")
a_fuma=request("a_fuma")
a_vegetariano=request("a_vegetariano")
a_curso_ant=request("a_curso_ant")
a_direccion=trim(safeSTR(request("a_direccion")))
a_ciudad=trim(safeSTR(request("a_ciudad")))
a_provincia=request("a_provincia")
a_pais=request("a_pais")
a_c_postal=trim(safeSTR(request("a_c_postal")))
a_pasaporte=trim(safeSTR(request("a_pasaporte")))
a_pas_exp=trim(safeSTR(request("a_pas_exp")))
a_pas_cad=trim(safeSTR(request("a_pas_cad")))
if IsDate(a_pas_cad) and a_pas_cad<>""then a_pas_cad=a_pas_cad else a_pas_cad="01/01/1000" end if
a_sexo=request("a_sexo")
if a_email<>""then 'PERMITE PONER EN BLANCO EL MAIL
Sql= "SELECT a_email FROM alumnos WHERE id_alumno<>"&id_alumno&" and a_email ='"&a_email&"'"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&ms=11&cod_cat=" & cod_cat&"&cod_prog="&cod_prog)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&ms=11&cod_cat=" & cod_cat&"&cod_prog="&cod_prog) 
end if
ob_rs.close	
end if	

mySQL="UPDATE alumnos SET "
mySQL=mySQL & "a_nombre = '" & a_nombre & "',"
mySQL=mySQL & "a_apellidos = '" & a_apellidos & "',"
mySQL=mySQL & "a_email = '" & a_email & "',"
mySQL=mySQL & "a_telefono = '" & a_telefono & "',"
mySQL=mySQL & "a_movil = '" & a_movil & "',"
mySQL=mySQL & "a_movil_sms = '" & a_movil_sms & "',"
mySQL=mySQL & "a_nif = '" & a_nif & "',"
mySQL=mySQL & "a_cumple = '" & a_cumple & "',"
mySQL=mySQL & "a_permiso_medico = '" & a_permiso_medico & "',"
mySQL=mySQL & "a_fuma = '" & a_fuma & "',"
mySQL=mySQL & "a_vegetariano = '" & a_vegetariano & "',"
mySQL=mySQL & "a_curso_ant = '" & a_curso_ant & "',"
mySQL=mySQL & "a_direccion = '" & a_direccion & "',"
mySQL=mySQL & "a_ciudad = '" & a_ciudad & "',"
mySQL=mySQL & "a_provincia = '" & a_provincia & "',"
mySQL=mySQL & "a_pais = '" & a_pais & "',"
mySQL=mySQL & "a_c_postal = '" & a_c_postal & "',"
mySQL=mySQL & "a_pasaporte = '" & a_pasaporte & "',"
mySQL=mySQL & "a_pas_exp = '" & a_pas_exp & "',"
mySQL=mySQL & "a_pas_cad = '" & a_pas_cad & "',"
mySQL=mySQL & "a_sexo = '" & a_sexo & "'"
mySQL=mySQL & " WHERE id_alumno = " & id_alumno & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ok=4
end if 'FIN  CASO ALUMNO ///////////////////////////////////////////////////////////////////////////////////////


if form_op = "familiares" then  '  CASO FAMILIARES ///////////////////////////////////////////////////////////////////////////////////////
a_p_nombre=trim(safeSTR(request("a_p_nombre")))
a_p_apellidos=trim(safeSTR(request("a_p_apellidos")))
a_p_email=trim(safeSTR(request("a_p_email")))
a_p_telefono=trim(safeSTR(request("a_p_telefono")))
a_p_movil=trim(safeSTR(request("a_p_movil")))
a_p_profesion=trim(safeSTR(request("a_p_profesion")))
a_m_nombre=trim(safeSTR(request("a_m_nombre")))
a_m_apellidos=trim(safeSTR(request("a_m_apellidos")))
a_m_email=trim(safeSTR(request("a_m_email")))
a_m_telefono=trim(safeSTR(request("a_m_telefono")))
a_m_movil=trim(safeSTR(request("a_m_movil")))
a_m_profesion=trim(safeSTR(request("a_m_profesion")))
a_curso_ant_org=trim(safeSTR(request("a_curso_ant_org")))
a_colegio=trim(safeSTR(request("a_colegio")))
a_medicamentos=trim(safeSTR(request("a_medicamentos")))
a_enfermedades=trim(safeSTR(request("a_enfermedades")))
mySQL="UPDATE alumnos SET "
mySQL=mySQL & "a_p_nombre = '" & a_p_nombre & "',"
mySQL=mySQL & "a_p_apellidos = '" & a_p_apellidos & "',"
mySQL=mySQL & "a_p_email = '" & a_p_email & "',"
mySQL=mySQL & "a_p_telefono = '" & a_p_telefono & "',"
mySQL=mySQL & "a_p_movil = '" & a_p_movil & "',"
mySQL=mySQL & "a_p_profesion = '" & a_p_profesion & "',"
mySQL=mySQL & "a_m_nombre = '" & a_m_nombre & "',"
mySQL=mySQL & "a_colegio = '" & a_colegio & "',"
mySQL=mySQL & "a_m_apellidos = '" & a_m_apellidos & "',"
mySQL=mySQL & "a_m_email = '" & a_m_email & "',"
mySQL=mySQL & "a_m_telefono = '" & a_m_telefono & "',"
mySQL=mySQL & "a_m_movil = '" & a_m_movil & "',"
mySQL=mySQL & "a_m_profesion = '" & a_m_profesion & "',"
mySQL=mySQL & "a_curso_ant_org = '" & a_curso_ant_org & "',"
mySQL=mySQL & "a_enfermedades = '" & a_enfermedades & "',"
mySQL=mySQL & "a_medicamentos = '" & a_medicamentos & "'"
mySQL=mySQL & " WHERE id_alumno = " & id_alumno & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ok=5
end if 'FIN  CASO FAMILIARES ///////////////////////////////////////////////////////////////////////////////////////
if form_op = "usuario" then  '  CASO AGENTE/USUARIO ///////////////////////////////////////////////////////////////////////////////////////
id_usuario=request("id_usuario")
if id_usuario<>""then id_usuario=id_usuario else id_usuario=0 end if
mySQL="UPDATE programas SET "
mySQL=mySQL & "id_usuario = " & id_usuario & ""
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)
ok=6
end if  ' FIN CASO AGENTE/USUARIO ///////////////////////////////////////////////////////////////////////////////////////



if form_op = "docus_op" then  '  CASO ENV MAIL DOCS ///////////////////////////////////////////////////////////////////////////////////////
ok=8
env_mail_docs=env_mail_docs+1
mySQL="UPDATE programas SET "
mySQL=mySQL & "env_mail_docs = " & env_mail_docs & ""
mySQL=mySQL & " WHERE id_programa = " & cod_prog & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if  ' FIN CASO ENV MAIL DOCS ///////////////////////////////////////////////////////////////////////////////////////



' ENVIAMOS MAIL SELECTIVO

if mail_aviso="si" or mail_aviso_docs="si" then
if ok=1 then cambio="Datos modificados en tu programa." end if
if ok=2 then 
if completado_r="si"then
cambio="Pago completado." 
else
cambio="Datos de contabilidad modificados en tu programa." 
end if
end if

if ok=3 then cambio="Una de tus facturas ha sido modificada." end if
if ok=4 then cambio="Tus datos han sido modificados." end if
if ok=5 then cambio="Datos familiares modificados." end if
if ok=6 then cambio="Datos de usuario/agente modificados." end if
if ok=8 then cambio="Hay nueva documentaci&oacute;n en la secci&oacute;n de packs de tu &aacute;rea de usuario" end if

Sql= "SELECT * FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_empresa=ob_rs("titulo_esp")
id_web=ob_rs("id_web")
f_smtp=ob_rs("f_smtp")
f_usuario=ob_rs("f_usuario")
f_pass=ob_rs("f_pass")
f_email=ob_rs("f_email")
f_puerto=ob_rs("f_puerto")
f_texto_legal=ob_rs("f_texto_legal")
email=ob_rs("email")
direccion=ob_rs("direccion")
cod_postal=ob_rs("cod_postal")
ciudad=ob_rs("ciudad")
provincia=ob_rs("provincia")
pais=ob_rs("pais")
if pais="es" then pais="España" end if
telefono=ob_rs("telefono")
url=ob_rs("url")
url_c=ob_rs("url")
if url <>"" then
url=replace(url,"https://","")
url=replace(url,"http://","")
end if
end if
ob_rs.close
if id_web<>""then
Sql= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre_img=ob_rs("nombre")
nombre_img=url_c&nombre_img
alt=ob_rs("alt")
end if
ob_rs.close
end if
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
end if
ob_rs.close
Sql= "SELECT u_email FROM usuarios WHERE id_usuario="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
else
falla_usuario="si"
end if
ob_rs.close
mail_1=a_email
mail_2=a_p_email
mail_3=a_m_email
mail_4=u_email


'if u_email=a_email then mail_1= u_email end if
'if u_email=a_p_email then mail_1= u_email end if
'if u_email=a_m_email then mail_1= u_email end if
'if u_email=a_email then mail_2= u_email end if
'if u_email=a_p_email then mail_2= u_email end if
'if u_email=a_m_email then mail_2= u_email end if
'if u_email=a_email then mail_3= u_email end if
'if u_email=a_p_email then mail_3= u_email end if
'if u_email=a_m_email then mail_3= u_email end if


'if mail_1<>mail_4 and mail_1<>""  then Mail.AddAddress mail_1 end if
'if mail_2<>mail_4 and mail_2<>"" then Mail.AddAddress mail_2 end if
'if mail_3<>mail_4 and mail_3<>"" then Mail.AddAddress mail_3 end if

if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email and a_p_email="" then mail_2= u_email end if
if u_email=a_m_email and a_m_email="" then  mail_3= u_email end if

if mail_1<>mail_4 and  mail_1<>"" then 
Mail.AddAddress mail_1 
%> mail 1 = <%=mail_1%><br> <%
end if
if mail_2<>mail_4 and mail_2<>mail_1 and mail_2<>mail_3 and mail_2<>"" then 
Mail.AddAddress mail_2 
%> mail 2 = <%=mail_2%><br> <%
end if
if mail_3<>mail_4 and mail_3<>mail_1 and mail_3<>mail_2 and mail_3<>"" then 
%> mail 3 = <%=mail_3%><br> <%
Mail.AddAddress mail_3 
end if
Mail.AddAddress mail_4

%> mail 4 = <%=mail_4%><br> <%

'Mail.AddBCC f_email 
if email<>"" then Mail.AddCC email  end if%>
<!--#include file="../../web/comun/limpia.asp"-->


<%asunto = deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & " - Datos modificados "
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""20"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"&cambio&"</font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Te recordamos que puedes realizar varias gestiones desde el &aacute;rea de usuario, con el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre_img&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
If Err <> 0 Then env_mail_res_alu="ko"end If 
end if
'FIN ENVIO MAIL
if form_op="del_doc" then
id_catDocumentacion_rel=request("id_catDocumentacion_rel")
if id_catDocumentacion_rel<>"" then
Sql= "SELECT id_catDocumentacion FROM catDocumentacion_rel WHERE id_catDocumentacion_rel= "&id_catDocumentacion_rel&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
id_catDocumentacion=ob_rs("id_catDocumentacion")
end if
ob_rs.close
Sql= "SELECT archivo FROM alumnosDocumentacion WHERE id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
archivete=ob_rs("archivo")
end if
ob_rs.close
mySQL="DELETE FROM alumnosDocumentacion where id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&" "
set ob_rs=Ob_Connb.execute(mySQL)
if  archivete <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_docs/" & archivete)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_docs/" & archivete))
f2.Delete
end if
end if
end if
ok=12
end if
if form_op="del_doc_o" then
id_catDocumentacion=request("id_catDocumentacion")
if id_catDocumentacion<>"" then
Sql= "SELECT archivo FROM alumnosDocumentacion WHERE id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
archivete=ob_rs("archivo")
end if
ob_rs.close
mySQL="DELETE FROM alumnosDocumentacion where id_catDocumentacion= "&id_catDocumentacion&" and id_alumno="&id_alumno&" "
set ob_rs=Ob_Connb.execute(mySQL)
if  archivete <> "" then
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath("../../up_docs/alu_docs/" & archivete)) then
Set f2 = fso.GetFile(Server.MapPath("../../up_docs/alu_docs/" & archivete))
f2.Delete
end if
end if
ok=12
end if
end if
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms="&ok&"&cod_cat=" & cod_cat&"&cod="&cod&"&cod_prog="&cod_prog&"&dup_factura="&dup_factura&"&n_fac="&n_fac_w&"&tip="&tip)) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms="&ok&"&cod_cat=" & cod_cat&"&cod="&cod&"&cod_prog="&cod_prog&"&dup_factura="&dup_factura&"&n_fac="&n_fac_w&"&tip="&tip)%>