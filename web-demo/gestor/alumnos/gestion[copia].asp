<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<%dup_factura=request("dup_factura")
if dup_factura ="" then dup_factura = request_equerystring("dup_factura")
n_fac_w=request("n_fac")
if n_fac_w ="" then n_fac_w = request_equerystring("n_fac")
'[RECOGEMOS DATOS ALUMNO]
if cod<>""then
Sql= "SELECT * from alumnos where id_alumno="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
a_email=ob_rs("a_email")
a_sexo=ob_rs("a_sexo")
a_nif=ob_rs("a_nif")
a_pasaporte=ob_rs("a_pasaporte")
a_pas_exp=ob_rs("a_pas_exp")
a_pas_cad=ob_rs("a_pas_cad")
a_cumple=ob_rs("a_cumple")
a_telefono=ob_rs("a_telefono")
a_movil=ob_rs("a_movil")
a_movil_sms=ob_rs("a_movil_sms")
a_direccion=ob_rs("a_direccion")
a_ciudad=ob_rs("a_ciudad")
a_c_postal=ob_rs("a_c_postal")
a_provincia=ob_rs("a_provincia")
a_pais=ob_rs("a_pais")
a_permiso_medico=ob_rs("a_permiso_medico")
a_vegetariano=ob_rs("a_vegetariano")
a_fuma=ob_rs("a_fuma")
a_curso_ant=ob_rs("a_curso_ant")
a_curso_ant_org=ob_rs("a_curso_ant_org")
a_talla=ob_rs("a_talla")
a_colegio=ob_rs("a_colegio")
a_conocido=ob_rs("a_conocido")
a_enfermedades=ob_rs("a_enfermedades")
a_medicamentos=ob_rs("a_medicamentos")
fecha_in=ob_rs("fecha_in")
a_p_nombre=ob_rs("a_p_nombre")
a_p_apellidos=ob_rs("a_p_apellidos")
a_p_email=ob_rs("a_p_email")
a_p_telefono=ob_rs("a_p_telefono")
a_p_movil=ob_rs("a_p_movil")
a_p_profesion=ob_rs("a_p_profesion")
a_m_nombre=ob_rs("a_m_nombre")
a_m_apellidos=ob_rs("a_m_apellidos")
a_m_email=ob_rs("a_m_email")
a_m_telefono=ob_rs("a_m_telefono")
a_m_movil=ob_rs("a_m_movil")
a_m_profesion=ob_rs("a_m_profesion")
end if
ob_rs.close
end if
Sql= "SELECT id_agente, id_usuario, nom_categoria, id_categoria,suma_total_p,cod_descuento,id_agente_cod from programas where id_programa="&cod_prog&" order by id_programa desc"     '[DATOS AGENTE]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
nom_cat=ob_rs("nom_categoria")
cod_cat=ob_rs("id_categoria")
suma_total_p=ob_rs("suma_total_p")
id_agente_cod=ob_rs("id_agente_cod")
cod_descuento=ob_rs("cod_descuento")
if ob_rs("id_agente") <>0 AND ob_rs("id_agente")<>"" then id_usuario=ob_rs("id_agente") else id_usuario=ob_rs("id_usuario") end if
Sql2= "SELECT u_nombre, u_apellidos, u_email, u_agente from usuarios where id_usuario="&id_usuario&""     
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
u_nombre=ob_rs2("u_nombre")
u_apellidos=ob_rs2("u_apellidos")
u_email=ob_rs2("u_email")
u_agente=ob_rs2("u_agente")
end if
ob_rs2.close
end if
ob_rs.close
if id_usuario<>"" then
Sql= "SELECT id_programa FROM programas_tmp WHERE id_usuario="&id_usuario&" or id_agente="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
num_al_age_tmp=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas WHERE id_usuario="&id_usuario&" or id_agente="&id_usuario&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
num_al_age=ob_rs.RecordCount
end if
ob_rs.close
end if%>
<div class="breadcrumbs">
<h1>Gestión Alumnos |  <%=nom_cat%></h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>">Listado Alumnos</a></li>
<li class="active">Gestión Alumnos</li>
</ol>
</div>
<%'VALORES COMUNES DE SELECTS
Sql0= "SELECT id_programa, nom_curso, id_item, f_inicio, nom_item, id_curso, nom_destino FROM programas WHERE id_programa="&cod_prog&"" 
Set Ob_RS0 = Server.CreateObject("ADODB.Recordset")
Ob_RS0.Open Sql0, ob_connb,adOpenStatic, adCmdText
if not ob_rs0.eof then
a=1
nom_item=ob_rs0("nom_item")
nom_curso=ob_rs0("nom_curso")
cod_prog=ob_rs0("id_programa")
id_item=ob_rs0("id_item")
id_itemSub=ob_rs0("id_curso")
nom_destino=ob_rs0("nom_destino")
end if
ob_rs0.close
if id_itemSub<>""then
Sql2= "SELECT pr_medico, pr_cancelacion, tasas_aerop, pr_examen, pr_gestion_bill, con_examen FROM itemsSub WHERE id_itemSub="&id_itemSub&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if pr_medico="si"then pr_medico_pr=FormatNumber(ccur(ob_rs2("pr_medico")),2) end if
if pr_cancelacion="si"then pr_cancelacion_pr=FormatNumber(ccur(ob_rs2("pr_cancelacion")),2) end if
if ob_rs2("pr_gestion_bill") <> 0 then pr_gestion_bill_ext="si" end if
if pr_gestion_bill="si" then pr_gestion_bill_pr=FormatNumber(ccur(ob_rs2("pr_gestion_bill")),2) end if
if ob_rs2("tasas_aerop") <> 0 then tasas_aerop_ext="si" end if
if tasas_aerop="si" then tasas_aerop_pr=FormatNumber(ccur(ob_rs2("tasas_aerop")),2) end if
if ob_rs2("con_examen") <> "" and not isnull(ob_rs2("con_examen")) then examen_ext="si" end if
con_examen=ob_rs2("con_examen")
if pr_examen="si" then pr_examen_pr=FormatNumber(ccur(ob_rs2("pr_examen")),2) end if
end if
ob_rs2.close
end if
'Respuestas
if ms<>""then
select case ms
case 1:
ms_t="Datos de programa modificados con éxito."
tab1="active"
tab1_1="active"
case 2:
ms_t="Datos de contabilidad modificados con éxito."
tab1="active"
tab1_2="active"
case 3:
ms_t="Factura modificada con éxito."
tab1="active"
tab1_3="active"
case 4:
ms_t="Datos del alumno modificados con éxito."
tab2="active"
tab2_1="in"
tab22_1="collapsed"
tab22_2="collapsed"
tab22_3="collapsed"
tab22_4="collapsed"
tab1_1="active"
case 5:
ms_t="Datos de familiares / otros datos modificados."
tab2="active"
tab2_2="in"
tab22_1="collapsed"
tab22_2="collapsed"
tab22_3="collapsed"
tab22_4="collapsed"
tab1_1="active"
case 6:
ms_t="Datos de usuario modificadios con éxito."
tab2="active"
tab2_3="in"
tab22_1="collapsed"
tab22_2="collapsed"
tab22_3="collapsed"
tab22_4="collapsed"
tab1_1="active"
case 7:
ms_t="Datos de documentación modificadios con éxito."
tab2="active"
tab2_4="in"
tab22_1="collapsed"
tab22_2="collapsed"
tab22_3="collapsed"
tab22_4="collapsed"
tab1_1="active"
case 8:
ms_t="Envío de mail para documentación realizado con éxito."
tab1="active"
tab1_4="active"
case 9:
ms_t="Hubo algún error en el reenvío del mail."
tab1="active"
tab1_1="active"
case 10:
ms_t="Reenvío de mail realizado con éxito."
tab1="active"
tab1_1="active"
case 11:
ms_t="El email del alumno pertenece a otro alumno."
tab2="active"
tab2_1="in"
tab22_1="collapsed"
tab22_2="collapsed"
tab22_3="collapsed"
tab22_4="collapsed"
tab1_1="active"
case 12:
ms_t="Documentación del alumno modificada."
tab1="active"
tab1_5="active"
case else
ms_t="Datos modificados con éxito."
tab1="active"
tab1_1="active"
end select
else
tab1="active"
tab1_1="active"
end if%>
<div class="page-content-container"><div class="page-content-row"><div class="page-content-col"><div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line"><div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Alumno &nbsp;|&nbsp;<span style="color:#999"><%=a_nombre%>&nbsp;<%=a_apellidos%>&nbsp;|&nbsp;<i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i><%=nom_item%>&nbsp;·&nbsp;<%=nom_curso%></span></span></div>
<ul class="nav nav-tabs"><li class="<%=tab1%>"><a href="#tab_1" data-toggle="tab"> Programa </a></li>
<li class="<%=tab2%>"><a href="#tab_2" data-toggle="tab"> Datos Generales <%if num_img_tot<>""then%><span class="badge badge-success" style="margin-left:5px""> <%=num_img_tot%> </span><%end if%></a></li>
<div class="actions btn-set pull-right" style="margin-left:15px">
<div class="btn-group">
<a class="btn green-haze btn-outline dropdown-toggle" style="padding-top:4px;padding-bottom:4px;margin-top:5px" href="javascript:;" data-toggle="dropdown">
<i class="fa fa-wrench" aria-hidden="true"></i> herramientas <i class="fa fa-angle-down"></i></a>
<div class="dropdown-menu pull-right"><!--NAV TABS & BREADS-->
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&accion=env_mail&ver="&ver&"&cod_cat="&cod_cat&"&check="&cod_prog))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&accion=env_mail&ver="&ver&"&cod_cat="&cod_cat)&"&proc=gest&cod="&cod&"&check="&cod_prog%>&"><i class="fa fa-envelope-o"></i> Reenviar mail inscripción</a></li>
<li><a href="../<%=r%>web/pr_pdf_preins.asp?id_programa=<%=cod_prog%>&s=crm&cod_cat=<%=cod_cat%>&proc=gest&cod=<%=cod%>" ><i class="fa fa-download" aria-hidden="true"></i> Descargar inscripción </a></li>
<li class="divider hidden"></li>
<li class="hidden"><a href="javascript:modal_cambioCurso();"><i class="fa fa-exchange" aria-hidden="true"></i> Cambiar alumno de curso</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarPrograma();"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar programa</a></li>
<li><a href="javascript:eliminarAlumno();"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar alumno</a></li>
</div>
</div>
</div>
</ul>
</div><!--NAV TABS & BREADS-->
<div class="portlet-body">
<div class="form-body no_pad"><%if ms_t<>""then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> <%=ms_t%></div><%end if%>

<%if dup_factura="si" then 'CHEQUEAMOS FACTURAS
Sql= "SELECT id_programa, id_alumno FROM programas WHERE n_factura='"&n_fac_w&"' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa")))%>
<div class="alert-warning" style="padding:17px"><i class="fa fa-check" aria-hidden="true"></i> Factura no generada. El programa <a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa"))%>">[<%=ob_rs("id_programa")%>]</a> ya tiene generada la factura [<%=n_fac_w%>]</div>
<%else
Sql2= "SELECT n_factura, id_programa FROM facturas WHERE n_factura='"&n_fac_w&"' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
Sql3= "SELECT id_programa, id_alumno FROM programas WHERE id_programa="&ob_rs2("id_programa")&" "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs3("id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs3("id_programa")))%>
<div class="alert-warning" style="padding:17px"><i class="fa fa-check" aria-hidden="true"></i> Factura no generada. El programa <a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs3("id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs3("id_programa"))%>">[<%=ob_rs3("id_programa")%>]</a> ya tiene generada la factura [<%=n_fac_w%>]</div>
<%end if
ob_rs3.close
end if
ob_rs2.close
end if
ob_rs.close
end if%>

</div><!--RESPUESTAS-->
<div class="tab-content" >
<!--tab_Sup_1 PROGRAMAS-->
<div class="tab-pane <%=tab1%>" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<%Sql0= "SELECT id_programa, nom_curso, id_item, f_inicio, nom_item, id_curso FROM programas WHERE id_programa="&cod_prog&"" 
Set Ob_RS0 = Server.CreateObject("ADODB.Recordset")
Ob_RS0.Open Sql0, ob_connb,adOpenStatic, adCmdText
if not ob_rs0.eof then
a=1 'RECORREMOS PROGRAMAS CON ALUMNO%>
<div class="panel panel-default" style="border:none">
<div class="panel-body"><div class="col-md-12">
<%'RECOGEMOS DATOS DE PROGRAMA
Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, gen_fac, u_f_nombre,u_f_nif,u_f_direccion,a_observaciones_curso,falta_pagar, id_itemSubAero, nom_quincena, id_aeropuerto, id_quincena, pr_gestion_bill, id_alo_opcion, precioReserva, fechaPago,env_mail_docs, fechaEmision, ajuste, pr_ajuste, n_factura FROM programas WHERE id_programa="&cod_prog&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_programa=ob_rs("id_programa")
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
pr_cancelacion=ob_rs("pr_cancelacion")
'if pr_cancelacion="si" then pr_cancelacion="S&iacute;" else pr_cancelacion="No" end if
con_examen=ob_rs("con_examen")
pr_medico=ob_rs("pr_medico")
'if pr_medico="si" then pr_medico="S&iacute;" else pr_medico="No" end if
f_inicio=ob_rs("f_inicio")
f_fin=ob_rs("f_fin")
fecha_in=ob_rs("fecha_in")
semanas=ob_rs("semanas")
refPresupuesto=ob_rs("refPresupuesto")
aero_ciudad=ob_rs("aero_ciudad")
precio_cur=ob_rs("precio_cur")
precio_sup=ob_rs("precio_sup")
estadoPago=ob_rs("estadoPago")
factura=ob_rs("factura")
gen_fac=ob_rs("gen_fac")
u_f_nombre=ob_rs("u_f_nombre")
u_f_nif=ob_rs("u_f_nif")
u_f_direccion=ob_rs("u_f_direccion")
a_observaciones_curso=ob_rs("a_observaciones_curso")
n_factura=ob_rs("n_factura")
precio_cur_a=precio_cur-precio_sup
id_itemSubAero=ob_rs("id_ItemSubAero")
if precio_cur<>"" and precio_cur<>0 then precio_cur =FormatNumber(ccur(precio_cur),2) else precio_cur= "" end if
if precio_cur_a<>"" and precio_cur_a<>0 then precio_cur_a =FormatNumber(ccur(precio_cur_a),2) else precio_cur_a= "" end if
if precio_sup<>"" and precio_sup<>0 then precio_sup =FormatNumber(ccur(precio_sup),2) else precio_sup= ""  end if
id_alojamiento=ob_rs("id_alojamiento")
pr_medico_pr=ob_rs("pr_medico_pr")
if pr_medico_pr<>"" and pr_medico_pr<>0 then pr_medico_pr =FormatNumber(ccur(pr_medico_pr),2) else pr_medico_pr= ""  end if
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>0 then pr_cancelacion_pr =FormatNumber(ccur(pr_cancelacion_pr),2) else pr_cancelacion_pr= ""  end if
tasas_aerop_pr=ob_rs("tasas_aerop_pr")
if tasas_aerop_pr<>"" and tasas_aerop_pr<>0 then tasas_aerop_pr =FormatNumber(ccur(tasas_aerop_pr),2) else tasas_aerop_pr= "" end if
pr_examen_pr=ob_rs("pr_examen_pr")
if pr_examen_pr<>"" and pr_examen_pr<>0 then pr_examen_pr =FormatNumber(ccur(pr_examen_pr),2) else pr_examen_pr= ""  end if
pr_gestion_bill_p=ob_rs("pr_gestion_bill")
pr_gestion_bill_pr=ob_rs("pr_gestion_bill_pr")
if pr_gestion_bill_pr<>"" and pr_gestion_bill_pr<>0 then pr_gestion_bill_pr =FormatNumber(ccur(pr_gestion_bill_pr),2) else pr_gestion_bill_pr= ""  end if
suma_total=ob_rs("suma_total")
if suma_total<>"" and suma_total<>0 then suma_total =FormatNumber(ccur(suma_total),2) else suma_total= "" end if
metodoPago_rs_p=ob_rs("metodoPago")
Select case (metodoPago_rs)
case "pag_transferencia"
metodoPago="Transferencia bancaria"
case "pag_tarjeta"
metodoPago="Tarjeta de cr&eacute;dito"
case "pag_paypal"
metodoPago="PayPal"
case "pag_oficina"
metodoPago="Pago en oficina"
end select
id_alojamiento=ob_rs("id_alojamiento")
id_alo_opcion=ob_rs("id_alo_opcion")
tasas_concepto=ob_rs("tasas_concepto")
alo_concepto=ob_rs("alo_concepto")
precio_alo=ob_rs("precio_alo")
tasas_opciones=ob_rs("tasas_opciones")
alo_opcion=ob_rs("alo_opcion")
precio_sup_alo=ob_rs("precio_sup_alo")
precio_alo_a=precio_alo-precio_sup_alo-tasas_concepto-tasas_opciones
if precio_alo_a<>"" and precio_alo_a<>0 then precio_alo_a =FormatNumber(ccur(precio_alo_a),2) else precio_alo_a= "" end if
if precio_alo<>"" and precio_alo<>0 then precio_alo =FormatNumber(ccur(precio_alo),2) else precio_alo= ""  end if
if precio_sup_alo<>"" and precio_sup_alo<>0 then precio_sup_alo =FormatNumber(ccur(precio_sup_alo),2) else precio_sup_alo= "" end if
if tasas_concepto<>"" and tasas_concepto<>0 then tasas_concepto =FormatNumber(ccur(tasas_concepto),2) else tasas_concepto= "" end if
if tasas_opciones<>"" and tasas_opciones<>0 then tasas_opciones =FormatNumber(ccur(tasas_opciones),2) else tasas_opciones= "" end if
falta_pagar=ob_rs("falta_pagar")
if falta_pagar<>"" then falta_pagar =FormatNumber(ccur(falta_pagar),2) end if
nom_quincena=ob_rs("nom_quincena")
id_aeropuerto=ob_rs("id_aeropuerto")
id_itemSubAero=ob_rs("id_itemSubAero")
id_quincena_p=ob_rs("id_quincena")
precioReserva=ob_rs("precioReserva")
fechaPago=ob_rs("fechaPago")
fechaEmision=ob_rs("fechaEmision")
env_mail_docs=ob_rs("env_mail_docs")
ajuste=ob_rs("ajuste")
if ajuste<>"" and ajuste<>0 then ajuste =FormatNumber(ccur(ajuste),2) else ajuste= "" end if
pr_ajuste=ob_rs("pr_ajuste")
if precioReserva<>"" and precioReserva<>0 then precioReserva =FormatNumber(ccur(precioReserva),2) end if
end if
ob_rs.close
Sql= "SELECT nom_opcion_curso, opcion_pre_curso, id_programaOp,id_itemSubOp FROM programasOp WHERE id_programa="&cod_prog&" and transfer='si' "   ' TRANSFER
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
opcion_transfer=ob_rs("nom_opcion_curso")
opcion_pre_curso=ob_rs("opcion_pre_curso")
id_programaOp_p=ob_rs("id_programaOp")
id_itemSubOp_p=ob_rs("id_itemSubOp")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_transfer_pr =FormatNumber(ccur(opcion_pre_curso),2) else opcion_transfer_pr= "" end if
end if
ob_rs.close
Sql= "SELECT rel.id_categoria, categorias.id_categoria, rel.id_destino, titulo_esp FROM rel, categorias WHERE rel.id_item="&id_item&" and rel.id_categoria<>0 and rel.id_categoria=categorias.id_categoria and rel.id_destino<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_categoria=ob_rs("titulo_esp")
id_destino=ob_rs("id_destino")
end if
ob_rs.close
if id_destino<>""then
Sql= "SELECT titulo_esp FROM destinos WHERE id_destino="&id_destino&"" '////////////////ITEM
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
destino=ob_rs("titulo_esp")
end if
ob_rs.close
end if
if id_item<>"" then
Sql= "SELECT campamento, gestion_aeropuertos FROM items WHERE id_item ="&id_item&" "   '[CAMPAMENTOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
campamento=ob_rs("campamento")
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
end if
ob_rs.close
end if%>
<div class="portlet-title tabbable-line"><ul class="nav nav-tabs" style="margin-bottom:5px;border-bottom:1px solid #ddd;width:100%;">
<li class="<%=tab1_1%>"><a href="#portlet_tab1_<%=a%>" data-toggle="tab"> Programa </a></li>
<%if pr_contabilidad_ad="si"then%><li class="<%=tab1_2%>"><a href="#portlet_tab2_<%=a%>" data-toggle="tab"> Contabilidad </a></li><%end if%>
<li class="<%=tab1_4%>"><a href="#portlet_tab3_<%=a%>" data-toggle="tab"> Packs informativos</a></li>
<li class="<%=tab1_5%>"><a href="#portlet_tab5_<%=a%>" data-toggle="tab"> Documentación alumno</a></li>
<%if pr_factura_ad="si"then%><li class="<%=tab1_3%>"><a href="#portlet_tab4_<%=a%>" data-toggle="tab"> Facturas </a></li><%end if%></ul></div><!-- TABS & TOOLS-->
<div class="portlet-body"><div class="tab-content">
<!--TAB 1 PROGRAMA-->
<div class="tab-pane <%=tab1_1%>" id="portlet_tab1_<%=a%>">
<form action="guardar.asp" class="form-horizontal" id="op_programa" name="op_programa" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="cod" type="hidden" value="<%=cod%>"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><input name="form_op" type="hidden" value="programa"><input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<div class="scroller" style="height: 200px;"><div class="panel-body">
<!--PRIMERA COLUMNA--><div class="col-md-6" style="padding:0px">
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="titulo_esp_of" >Categoría.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="nom_cat" id="nom_cat" maxlength="160" value="<%=nom_cat%>" readonly><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="nom_item" >Programa.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="nom_item" id="nom_item"  maxlength="160" value="<%=nom_item%>" readonly><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i></div></div></div>
<!--AEROPUERTOS--><%if gestion_aeropuertos="si" then%><div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="aeropuerto"><%if campamento="si" then%>Grupo.<%else%>Aeropuerto.<%end if%></label>
<div class="col-md-6"><div class="input-icon">
<%if id_itemSub<>""then
if campamento="si" then
Sql2= "SELECT rel.id_itemsubAero, rel.id_itemSub, itemsSubAero.id_aeropuerto, itemsSubAero.id_itemsubAero from rel,itemsSubAero where rel.id_itemSub="&id_itemSub&" and rel.id_itemsubAero= itemsSubAero.id_itemsubAero and rel.grupo='si'"
else
Sql2= "SELECT itemsSubAero.plazas, itemsSubAero.mes, itemsSubAero.completo, itemsSubAero.id_aeropuerto, aeropuertos.ciudad, rel.id_itemSubAero,aeropuertos.id_aeropuerto FROM itemsSubAero, rel, aeropuertos WHERE rel.id_itemSub="&id_itemSub&" and rel.id_itemSubAero=itemsSubAero.id_itemSubAero and itemsSubAero.id_aeropuerto=aeropuertos.id_aeropuerto ORDER BY orden_aer"
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<select name="aeropuerto" id="aeropuerto" class="select-100" style="width:100%;" autocomplete="off">
<option value="">Aeropuerto de Salida</option>
<%do while not ob_rs2.eof
'CASO QUINCENA
if campamento="si" then
Sql3= "SELECT id_quincena, id_itemSubAero FROM itemsSubAero WHERE id_itemSubAero="&ob_rs2("itemsSubAero.id_itemSubAero")&" and id_quincena<>0"
else
Sql3= "SELECT id_quincena, id_itemSubAero FROM itemsSubAero WHERE id_itemSubAero="&ob_rs2("id_itemSubAero")&" and id_quincena<>0"
end if
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
id_quincena=ob_rs3("id_quincena")
Sql4= "SELECT titulo_esp FROM quincenas WHERE id_quincena="&id_quincena&""
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
tit_quincena=ob_rs4("titulo_esp")
end if
ob_rs4.close
end if
ob_rs3.close
'CASO MES 
if campamento="si" then
Sql3= "SELECT mes, id_itemSubAero FROM itemsSubAero WHERE id_itemSubAero="&ob_rs2("itemsSubAero.id_itemSubAero")&" and mes<>''"
else
Sql3= "SELECT mes, id_itemSubAero FROM itemsSubAero WHERE id_itemSubAero="&ob_rs2("id_itemSubAero")&" and mes<>''"
end if
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
tit_mes=ob_rs3("mes")
end if
ob_rs3.close%>
<%if tit_quincena<>""then
if campamento="si" then%>
<option value="0|<%=id_quincena%>|<%=ob_rs2("itemsSubAero.id_itemSubAero")%>" autocomplete="off" <%if int(id_quincena_p)=int(id_quincena) then%>selected<%end if%>><%=tit_quincena%></option>
<%else%>
<option value="<%=ob_rs2("aeropuertos.id_aeropuerto")%>|<%=id_quincena%>|<%=ob_rs2("id_itemSubAero")%>" autocomplete="off" <%if int(id_aeropuerto)=int(ob_rs2("aeropuertos.id_aeropuerto")) and int(id_quincena_p)=int(id_quincena) then%>selected<%end if%>><%=ob_rs2("ciudad")%> - <%=tit_quincena%></option>
<%end if
else
if tit_mes=""then tit_mes="Mes sin determinar"%>
<option value="<%=ob_rs2("aeropuertos.id_aeropuerto")%>|<%=tit_mes%>|<%=ob_rs2("id_itemSubAero")%>" <%if id_itemSubAero=ob_rs2("id_itemSubAero")then%>selected<%end if%>><%=ob_rs2("ciudad")%> - <%=tit_mes%></option>
<%end if
id_quincena=""
tit_quincena=""
tit_mes=""
ob_rs2.movenext
loop%>
</select>
<%else
end if
ob_rs2.close
end if%><i class="fa fa-plane" aria-hidden="true"></i></div></div></div><%end if%>

<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="nom_destino" >Destino.</label><div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="nom_destino" id="nom_destino" maxlength="160" value="<%=nom_destino%>" ><div class="form-control-focus"> </div><i class="fa fa-globe" aria-hidden="true"></i></div></div></div>
<div class="form-group form-md-line-input">
  <label class="col-md-3 control-label" for="f_inicio" >Fecha de Salida.</label>
  <div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="f_inicio" id="f_inicio"  maxlength="160" value="<%if f_inicio<>"01/01/1000" and f_inicio<>"08/01/1111" then%><%=f_inicio%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-check-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="f_fin" >Fecha de regreso.</label><div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="f_fin" id="f_fin" maxlength="160" value="<%if f_fin<>"01/01/1000" and f_fin<>"08/01/1111" then%><%=f_fin%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-times-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<!--SEMANAS-->
<%if id_itemSub<>"" then
Sql1= "SELECT salidas, salida_dia, salida_mes, salida_fecha, salida_quincena0,salida_quincena1,salida_quincena2,salida_quincena3,salida_quincena4, pr_medico, pr_medico_ob, pr_cancelacion, pr_cancelacion_ob,tasas_aerop, tasas_aerop_ob, pr_examen, pr_examen_ob, con_examen, con_examen_act, pr_gestion_bill, pr_gestion_bill_ob, txt_aviso FROM itemsSub WHERE id_itemSub="&id_itemSub&" "
Set Ob_RS1 = Server.CreateObject("ADODB.Recordset")
Ob_RS1.Open Sql1, ob_conn,adOpenStatic, adCmdText
if not ob_rs1.eof then
op=1
if id_itemSub<>"" and semanas<>"" then 'CASO DE QUE SEA SIN SEMANA EXTRA%>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="semanas">Semanas.</label>
<div class="col-md-4"><div class="input-icon">
<select name="semanas" id="semanas" autocomplete="off" class="select-100" style="width:100%;">
<%do while op<=52%>
<option value="<%=op%>" <%if int(op)=int(semanas) then%>selected<%end if%>>
<%if int(op)=12 then%>Trimestre escolar.<%end if%>
<%if int(op)=24 then%>Semestre escolar.<%end if%>
<%if int(op)=52 then%>Año escolar.<%end if%>
<%if int(op)<>12 and int(op)<>24 and int(op)<>52then%>
<%=op%> semana<%if int(op)>1then%>s<%end if%>
<%end if%>
</option>
<%op=op+1
loop%></select><i class="fa fa-calendar-plus-o" aria-hidden="true"></i></div></div></div>
<%end if
'INICIO FECHA
if ob_rs1("salidas")="salida_fecha" then 'salida_fecha%>
<div class="form-group form-md-line-input" >
  <label class="col-md-3 control-label" for="salida_fecha" >Fecha de salida.</label>
  <div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="salida_fecha" id="salida_fecha" maxlength="160" value="<%=ob_rs1("salida_fecha")%>"><div class="form-control-focus"> </div>
<i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<%end if
if ob_rs1("salidas")="salida_meses" then 'salida_mes%>
<select name="salida_mes" id="salida" autocomplete="off">
<option value="0" title="">Selecciona Mes de Inicio</option>
<%if instr(ob_rs1("salida_mes"),"Enero") then%><option value="Enero">Enero</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Febrero") then%><option value="Febrero">Febrero</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Marzo") then%><option value="Marzo">Marzo</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Abril") then%><option value="Abril">Abril</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Mayo") then%><option value="Mayo">Mayo</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Junio") then%><option value="Junio">Junio</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Julio") then%><option value="Julio">Julio</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Agosto") then%><option value="Agosto">Agosto</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Septiembre") then%><option value="Septiembre">Septiembre</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Noviembre") then%><option value="Noviembre">Noviembre</option><%end if%>
<%if instr(ob_rs1("salida_mes"),"Diciembre") then%><option value="Diciembre">Diciembre</option><%end if%>
</select>
<%end if
if nom_quincena<>"" and id_aeropuerto="" then 'CASO QUINCENAS%>
<div class="form-group form-md-line-input" id="titulo_of_esp_a">
<label class="col-md-3 control-label" for="titulo_esp_of" >Inicio.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_of_esp" id="titulo_of_esp" onKeyUp="resetea_error('titulo_of_esp_a');" maxlength="160" value="<%=nom_quincena%>" readonly><div class="form-control-focus"> </div>
<i class="fa fa-calendar-o" aria-hidden="true"></i><span class="help-block">nombre del programa en la escuela</span></div></div></div>
<%if ob_rs1("salidas")="salida_quincenas" then
if ob_rs1("salida_quincena0")<>0 then
Sql2= "SELECT titulo_esp, f_inicio, f_fin, id_quincena FROM quincenas WHERE id_quincena="&ob_rs1("salida_quincena0")&" or id_quincena="&ob_rs1("salida_quincena1")&"  or id_quincena="&ob_rs1("salida_quincena2")&"  or id_quincena="&ob_rs1("salida_quincena3")&" or id_quincena="&ob_rs1("salida_quincena4")&" ORDER BY titulo_esp"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<select name="salida_quincena" id="salida" autocomplete="off">
<option value="">Selecciona Quincena</option>
<%do while not ob_rs2.eof%>
<option value="<%=ob_rs2("id_quincena")%>"><%=ob_rs2("titulo_esp")%></option>
<%ob_rs2.movenext
loop%>
</select>
<%end if
ob_rs2.close
end if
end if
end if
ob_rs1.close
else%>

<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="f_inicio" >Semanas.</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="semanas" id="semanas"  maxlength="160" value="<%if semanas<>0 then%><%=semanas%><%else%>Sin especificar<%end if%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i><span class="help-block">número de semanas</span></div></div></div>

<%end if
end if%>
</div>
<!--SEGUNDA COLUMNA--><div class="col-md-6">
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="nom_item_of" >Nombre oficial.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="nom_item_of" id="nom_item_of" maxlength="160" value="<%=nom_item_of%>" readonly><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">nombre del programa en la escuela</span></div></div></div>

<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="nom_curso">Curso.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="nom_curso" id="nom_curso" maxlength="160" value="<%=nom_curso%>" readonly><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i></div></div></div>

<!--TRANSFER--><%if itemSub<>""then
Sql2= "SELECT opcion_esp, opcion_ob, rel.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub="&id_itemSub&" AND rel.id_itemSubOp<>0 AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp AND itemsSubOp.transfer='si' ORDER BY opcion_orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="transfer">Traslados aeropuerto.</label><div class="col-md-8"><div class="input-icon">
<select name="transfer" id="transfer" style="width:100%" autocomplete="off" class="selects">
<option value="">Traslado Aeropuertos</option><%if opcion_transfer <>""then%><option value="<%=id_programaOp_p%>|<%=opcion_transfer%>" selected><%=opcion_transfer%></option><%end if%><%do while not ob_rs2.eof%><%if opcion_transfer <> ob_rs2("opcion_esp")then%><option value="<%=ob_rs2("id_itemSubOp")%>|<%=ob_rs2("opcion_esp")%>"><%=ob_rs2("opcion_esp")%></option><%end if%>
<%ob_rs2.movenext
loop%>
</select><i class="fa fa-bus" aria-hidden="true"></i></div></div></div>
<%end if
ob_rs2.close
end if%>

<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="pr_medico">Seguro médico.</label><div class="col-md-7"><div class="md-checkbox-list"><div class="md-checkbox"><input name="pr_medico" type="checkbox" class="md-check" id="pr_medico" value="si" <%if pr_medico="si"then%>checked="checked"<%end if%>>
<label for="pr_medico"></label></div></div></div></div>

<%if con_examen<>""then%><div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="pr_examen"><%=con_examen%>.</label><div class="col-md-7"><div class="md-checkbox-list"><div class="md-checkbox"><input name="pr_examen" type="checkbox" class="md-check" id="pr_examen" value="si" <%if pr_examen="si"then%>checked="checked"<%end if%>><label for="pr_examen"></label></div></div></div></div><%end if%>

<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="pr_cancelacion">Seguro cancelación.</label><div class="col-md-7"><div class="md-checkbox-list"><div class="md-checkbox"><input name="pr_cancelacion" type="checkbox" class="md-check" id="pr_cancelacion" value="si" <%if pr_cancelacion="si"then%>checked="checked"<%end if%>><label for="pr_cancelacion"></label></div></div></div></div>

<%if pr_gestion_bill_ext="si" then%><div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="pr_gestion_bill">Gestión Billete.</label>
<div class="col-md-7"><div class="md-checkbox-list"><div class="md-checkbox"><input name="pr_gestion_bill" type="checkbox" class="md-check" id="pr_gestion_bill" value="si" <%if pr_gestion_bill_p="si"then%>checked="checked"<%end if%>><label for="pr_gestion_bill"></label></div></div></div></div><%end if%>

<!--ALOJAMIENTOS--><%Sql= "SELECT rel.id_alo_tipo, alo_tipo.titulo_esp FROM rel, alo_tipo WHERE rel.id_item="&id_item&" and rel.id_alojamiento <>0 and rel.id_alo_tipo=alo_tipo.id_alo_tipo GROUP BY rel.id_alo_tipo, alo_tipo.titulo_esp,  alo_tipo.orden ORDER BY alo_tipo.orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="alojamiento">Alojamiento.</label>
<div class="col-md-8"><div class="input-icon"><select name="alojamiento" id="alojamiento" class="select-100" style="width:100%;"><option value="">Selecciona Alojamiento</option>
<%do while not ob_rs.eof%>
<optgroup value="" label="<%=ob_rs("titulo_esp")%>">
<%Sql2= "SELECT alo_conceptos.titulo_esp, alo_op.titulo_esp, rel.id_alo_op, rel.id_alo_opcion, rel.id_alojamiento FROM alo_conceptos, rel, alo_op WHERE rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" AND rel.id_item="&id_item&" AND rel.id_alo_op=alo_op.id_alo_op AND rel.id_alojamiento=alo_conceptos.id_alojamiento ORDER BY alo_conceptos.orden, alo_op.orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%if alo_concepto <>"" and alo_opcion<>"" then%><option value="<%=id_alo_opcion%>|<%=id_alojamiento%>" selected ><%=alo_concepto%> / <%=alo_opcion%></option><%end if%>
<%do while not ob_rs2.eof
if alo_concepto <> ob_rs2("alo_conceptos.titulo_esp") or alo_opcion<> ob_rs2("alo_op.titulo_esp")then%>
<option value="<%=ob_rs2("id_alo_opcion")%>|<%=ob_rs2("id_alojamiento")%>"><%=ob_rs2("alo_conceptos.titulo_esp")%> / <%=ob_rs2("alo_op.titulo_esp")%></option>
<%end if
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</optgroup>
<%ob_rs.movenext
loop%>
</select>
<i class="fa fa-home" aria-hidden="true"></i></div></div></div>
<%end if
ob_rs.close

if cod_descuento<>"" then%>
<div class="col-md-6 col-md-offset-1"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" style="padding-right:21px" for="cod_descuento" >Código desc.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="cod_descuento" id="cod_descuento" value="<%=cod_descuento%>" readonly><div class="form-control-focus"> </div><i class="fa fa-tag" aria-hidden="true"></i></div></div></div></div>
<%if suma_total_p<>"" or suma_total_p<>0 then%>
<div class="col-md-5"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="sum_total_p" readonly>€ original.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="sum_total_p" id="sum_total_p" value="<%=FormatNumber(ccur(suma_total_p),2)%>" readonly><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i></div></div></div></div>
<%end if%>
<%if id_agente_cod<>0 and id_agente_cod<>"" then
Sql_d= "SELECT u_nombre, u_apellidos,u_empresa,u_email from usuarios where id_usuario="&id_agente_cod&""   '[ASOCIAMOS CON UNA ESCUELA]
Ob_Commandb.CommandText = Sql_d
SET Ob_RS_d = Ob_Commandb.Execute ()
if not ob_rs_d.eof then
nom_agen_cob=ob_rs_d("u_nombre")&"&nbsp;"&ob_rs_d("u_apellidos")&" - "&ob_rs_d("u_empresa")
u_email_ag_cod=ob_rs_d("u_email")
end if
ob_rs_d.close%>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="id_agente_cod" >Agente descuento.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="id_agente_cod" id="id_agente_cod" value="<%=nom_agen_cob%>" readonly><div class="form-control-focus"> </div><i class="fa fa-suitcase" aria-hidden="true"></i></div></div></div>
<%end if
end if%>

</div>
<!--OPCIONES--><div class="col-md-12">
<div class="portlet light">
<div class="portlet-title"><div class="caption font-green-sharp"><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="caption-subject bold uppercase"> Opciones</span><span class="caption-helper"> cotejar datos en contabilidad...</span></div></div>
<div class="portlet-body campos_opciones">

<!--OPCIONES PROGRAMA-->
<div class="col-md-12" style="border-bottom:1px solid #efefef">
<%Sql= "SELECT opcion_esp, opcion_ob, rel.id_itemOp FROM rel, itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp<>0 AND rel.id_itemOp=itemsOp.id_itemOp ORDER BY opcion_orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<div class="form-group form-md-checkboxes"><div class="md-checkbox-inline">
<%do while not ob_rs.eof


'VEMOS SI LO HEMOS SELECCIONADO
Sql2= "SELECT opcion_pre_prog, nom_opcion_prog, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&" AND trim(lcase(StrConv(nom_opcion_prog, 2, 1042)))='"&ob_rs("opcion_esp")&"' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
op_prog_sel="si"
end if
ob_rs2.close%>
<div class="md-checkbox">
<input type="checkbox" id="opp[<%=i%>]" class="c-check" value="<%=ob_rs("id_itemOp")%>|<%=ob_rs("opcion_esp")%>" name="opp[<%=i%>]" autocomplete="off" <%if op_prog_sel="si"then%>Checked<%end if%> class="md-check">
<label for="opp[<%=i%>]"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("opcion_esp")%></label>
</div>
<%ob_rs.movenext
op_prog_sel=""
i=i+1
loop
'VEMOS SI HEMOS ELEGIDO OPCION Y LUEGO SE HA CAMBIADO EN PROGRAMA
Sql2= "SELECT opcion_pre_prog, nom_opcion_prog, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&"  AND nom_opcion_prog<>''"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
i=i+1
do while not ob_rs2.eof
Sql3= "SELECT opcion_esp, opcion_ob, rel.id_itemOp FROM rel, itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp<>0 AND rel.id_itemOp=itemsOp.id_itemOp AND trim(lcase(StrConv(opcion_esp, 2, 1042)))='"&ob_rs2("nom_opcion_prog")&"'"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
else%>
<div class="md-checkbox">
<input type="checkbox" id="opp[<%=i%>]" class="c-check" value="<%=ob_rs2("id_programaOp")%>|<%=ob_rs2("nom_opcion_prog")%>" name="opp[<%=i%>]" autocomplete="off" Checked class="md-check">
<label for="opp[<%=i%>]"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs2("nom_opcion_prog")%></label>
</div>
<%end if
ob_rs3.close
ob_rs2.movenext
i=i+1
loop
end if
ob_rs2.close%>
</div>
</div>
<%end if
ob_rs.close%>
</div>

<!--OPCIONES CURSO-->
<div class="col-md-12">
<%if id_itemSub<>"" then
Sql= "SELECT opcion_esp, opcion_ob, rel.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub="&id_itemSub&" AND rel.id_itemSubOp<>0 AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp  AND transfer <>'si' ORDER BY opcion_orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<div class="form-group form-md-checkboxes"><div class="md-checkbox-inline">
<%do while not ob_rs.eof
'VEMOS SI LO HEMOS SELECCIONADO
Sql2= "SELECT opcion_pre_curso, nom_opcion_curso, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&" AND trim(StrConv(nom_opcion_curso, 2, 1042))='"&ob_rs("opcion_esp")&"'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
op_curso_sel="si"
end if
ob_rs2.close%>
<div class="md-checkbox">
<input type="checkbox" id="opc[<%=i%>]" class="c-check" value="<%=ob_rs("id_itemSubOp")%>|<%=ob_rs("opcion_esp")%>" name="opc[<%=i%>]" autocomplete="off" <%if op_curso_sel="si"then%>Checked<%end if%> class="md-check">
<label for="opc[<%=i%>]"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("opcion_esp")%></label>
</div>
<%ob_rs.movenext
op_curso_sel=""
i=i+1
loop

'VEMOS SI HEMOS ELEGIDO OPCION Y LUEGO SE HA CAMBIADO EN PROGRAMA
Sql2= "SELECT opcion_pre_curso, nom_opcion_curso, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&" AND nom_opcion_curso<>'' AND transfer IS NULL "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
i=i+1
do while not ob_rs2.eof
Sql3= "SELECT opcion_esp, opcion_ob, rel.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub="&id_itemSub&" AND rel.id_itemSubOp<>0 AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp AND trim(StrConv(opcion_esp, 2, 1042))='"&ob_rs2("nom_opcion_curso")&"' "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
else%>
<div class="md-checkbox">
<input type="checkbox" id="opc[<%=i%>]" class="c-check" value="<%=ob_rs2("id_programaOp")%>|<%=ob_rs2("nom_opcion_curso")%>" name="opc[<%=i%>]" autocomplete="off" Checked class="md-check">
<label for="opc[<%=i%>]"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs2("nom_opcion_curso")%></label>
</div>
<%end if
ob_rs3.close
ob_rs2.movenext
i=i+1
loop
end if
ob_rs2.close%>
</div>
</div>
<%end if
ob_rs.close
end if%>
</div>
</div></div></div>
<!--BOOTONES--><div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions"><div class="row">
<div class="col-md-offset-4 col-md-12">
<div class="col-md-5"><button type="submit" class="btn green" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a></div>
<div class="col-md-3"><div class="form-group form-md-checkboxes-inline"><div class="col-md-1"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso" value="si"><label for="mail_aviso"></label></div></div></div><label class="col-md-7 control-label" for="mail_aviso"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>
Mail aviso.</label></div></div>
</div></div></div></div></div>
<!--INSCRIPCIONES PREVIAS-->
<%anyo_item=year(f_inicio)
Sql= "SELECT nom_item, nom_curso, f_inicio, id_item, id_categoria, id_programa from programas where id_alumno="&id_alumno&" "     '[DATOS AGENTE]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if  (ob_rs("id_item")<> id_item) then
cod_prog_p=ob_rs("id_programa")
id_categoria=ob_rs("id_categoria")%>
<div class="portlet">
<div class="portlet-title"><div class="caption" style="color:#32C5D2"><i class="fa fa-file-text-o" style="color:#32C5D2;font-size:1.1em"></i>Otras Inscripciones </div></div>
<div class="col-md-12"><div class="portlet-body">
<table class="table table-striped table-bordered ">
<thead>
<tr style="color:#999">
<th><i class="fa fa-graduation-cap"></i> Programa </th>
<th><i class="fa ffa-graduation-cap"></i> Curso </th>
<th style="text-align:center;max-width:50px;"><i class="fa fa-calendar-check-o"></i> Año </th>
<th style="width:50px"> </th>
</tr>
</thead>
<tbody>
<tr>
<td> <%=ob_rs("nom_item")%> </td>
<td><%=ob_rs("nom_curso")%></td>
<td style="text-align:center;max-width:50px;"><%=year(ob_rs("f_inicio"))%></td>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&cod&"&cod_prog="&cod_prog_p&"&cod_cat="&id_categoria))%><td><a class="btn btn-sm green" href="<%=r%>alumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&cod&"&cod_prog="&cod_prog_p&"&cod_cat="&id_categoria)%>"> Ver datos</a></td>
</tr>
</tbody>
</table>
</div></div></div>
<%end if
ob_rs.movenext
loop
end if
ob_rs.close%>
</div></div></form></div><!--FIN TAB 1 PROGRAMA-->
<!--TAB 2 CONTABILIDAD-->
<div class="tab-pane <%=tab1_2%>" id="portlet_tab2_<%=a%>"><form action="guardar.asp" class="form-horizontal" id="op_contabilidad" name="op_contabilidad" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><input name="form_op" type="hidden" value="contabilildad"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><div class="scroller"><div class="panel-body"><div class="col-md-12">
<!--PRIMERA COLUMNA--><div class="col-md-6">
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="precio_cur_a" >Precio curso.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="precio_cur" id="precio_cur" maxlength="160" value="<%=precio_cur_a%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio en euros del curso</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_medico_pr" >Seguro médico.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_medico_pr" id="pr_medico_pr" maxlength="160" value="<%=pr_medico_pr%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio del seguro médico</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_examen_pr" >Examen.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_examen_pr" id="pr_examen_pr"  maxlength="160" value="<%=pr_examen_pr%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio del examen</span></div></div></div>
<div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="tasas_aerop_pr" >Tasas aeropuerto.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_aerop_pr" id="tasas_aerop_pr" maxlength="160" value="<%=tasas_aerop_pr%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">tasas aeropuerto</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="precio_alo_a" >Precio alojamiento.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="precio_alo_a" id="precio_alo_a" maxlength="160" value="<%=precio_alo_a%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio alojamiento</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="tasas_concepto" >Tasas <%=alo_concepto%>.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_concepto" id="tasas_concepto" maxlength="160" value="<%=tasas_concepto%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">tasas si las hubiera</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="precioReserva" >Reserva.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="precioReserva" id="precioReserva" maxlength="160" value="<%=precioReserva%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio de la reserva</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="fechaEmision" >Fecha emisión.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="fechaEmision" id="fechaEmision" maxlength="160" value="<%if fechaEmision<>"01/01/1000"then%><%=fechaEmision%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<div class="col-md-12">
<div class="form-group form-md-line-input col-md-7"><label class="col-md-5 control-label" for="ajuste" >Ajuste.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="ajuste" id="ajuste"  maxlength="160" value="<%=ajuste%>"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">ajuste de factura</span></div></div></div>
<div class="form-group form-md-checkboxes col-md-5"><label class="col-md-6 control-label" for="pr_ajuste">Ajuste en factura.</label><div class="col-md-6"><div class="md-checkbox-list"><div class="md-checkbox"><input name="pr_ajuste" type="checkbox" class="md-check" id="pr_ajuste" value="si" <%if pr_ajuste="si"then%>checked<%end if%>><label for="pr_ajuste"></label></div></div></div></div>
</div>
</div>
<!--SEGUNDA COLUMNA--><div class="col-md-6">
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="precio_sup" >Suplemento temporada (curso).</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="precio_sup" id="precio_sup" value="<%=precio_sup%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">suplemento por temporada</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_cancelacion_pr" >Seguro cancelación.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_cancelacion_pr" id="pr_cancelacion_pr" value="<%=pr_cancelacion_pr%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio seguro cancelación</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="opcion_transfer_pr" >Traslados aeropuerto.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="opcion_transfer_pr" id="opcion_transfer_pr"value="<%=opcion_transfer_pr%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio transfer</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_gestion_bill_pr" >Gestión billete.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_gestion_bill_pr" id="pr_gestion_bill_pr" value="<%=pr_gestion_bill_pr%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">getión billete avión</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="precio_sup_alo" >Suplemento temporada (alojamiento).</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="precio_sup_alo" id="precio_sup_alo"value="<%=precio_sup_alo%>" onKeyUp="suma();"><div class="form-control-focus"> </div>
<i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">suplemento alojamiento</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="tasas_opciones" >Tasas <%=alo_opcion%>.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_opciones" id="tasas_opciones" maxlength="160" value="<%=tasas_opciones%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">tasas</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="fechaPago" >Fecha Vence.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="fechaPago" id="fechaPago" maxlength="160" value="<%if fechaPago<>"01/01/1000"then%><%=fechaPago%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<!--#include file="../comun/facturas.asp"--> 
<%if gen_fac<>"si" then%>
<%'if n_factura<>""then n_factura=n_factura else n_factura=n_factura_p end if '[FIN SACAMOS FACTURA]%>
<%end if%>
<div class="col-md-12">
<div class="form-group form-md-line-input col-md-7"><label class="col-md-5 control-label" for="n_factura" >Nº Factura.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="<%'=n_factura_p%>" name="n_factura" id="n_factura" maxlength="160" value="<%=n_factura%>" <%if gen_fac<>"si" then%>disabled<%end if%>><div class="form-control-focus"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">número correlativo <%=n_factura_p%></span></div></div></div>
<%if pr_factura_ad="si"then%><div class="form-group form-md-checkboxes col-md-5">
  <label class="col-md-6 control-label" for="gen_fac" onChange="codename<%=a%>()" >Generada.</label>
  <div class="col-md-6"><div class="md-checkbox-list"><div class="md-checkbox"><input name="gen_fac" type="checkbox" class="md-check" id="gen_fac" value="si" onChange="codename<%=a%>()" <%if gen_fac="si" then%>checked<%end if%>><label for="pr_ajuste"></label></div></div></div></div><%end if%>
<SCRIPT LANGUAGE="JavaScript"><!--
function codename<%=a%>() {if(document.op_contabilidad.gen_fac.checked){document.op_contabilidad.n_factura.disabled=false;}else{document.op_contabilidad.n_factura.disabled=true;}}//--></SCRIPT>
</div>
<div class="form-group form-md-line-input col-md-7"></div><a class="btn default pull-left" onClick="ver_last_factura();"><i class="fa fa-search" style="margin-right:8px"></i>Ver número última factura<i class="fa fa-sort-numeric-desc" aria-hidden="true" style="margin-left:7px;"></i></a>
</div>
<!--OPCIONES CURSO/PROGRAMA--><div class="col-md-12"><div class="portlet light"><div class="portlet-title"><div class="caption font-green-sharp"><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="caption-subject bold uppercase"> Opciones</span><span class="caption-helper"> cotejar datos en programa...</span></div></div><div class="portlet-body campos_opciones">
<!--OPCIONES PROGRAMA--><div class="col-md-12" style="border-bottom:1px solid #efefef">
<%Sql= "SELECT opcion_esp, opcion_ob, rel.id_itemOp, opcion_pre FROM rel, itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp<>0 AND rel.id_itemOp=itemsOp.id_itemOp ORDER BY opcion_orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
'VEMOS SI LO HEMOS SELECCIONADO CAMBIA PRECIO
Sql2= "SELECT opcion_pre_prog, nom_opcion_prog, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&" AND trim(StrConv(nom_opcion_prog, 2, 1042))='"&ob_rs("opcion_esp")&"' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
opcion_pre_prog=ob_rs2("opcion_pre_prog")
op_prog_sel="si"
end if
ob_rs2.close%>
<div class="col-md-6"><div class="form-group form-md-line-input col-md-9" ><label class="col-md-5 control-label" for="opp_p[<%=i%>]" ><%=ob_rs("opcion_esp")%>.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="opp_p[<%=i%>]" id="opp_p<%=i%>" maxlength="160" value="<%if opcion_pre_prog <>"" then%><%=FormatNumber(ccur(opcion_pre_prog),2)%><%end if%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio opción</span></div></div></div><div class="md-checkbox col-md-3" style="margin-top:15px"><input type="checkbox" id="oppc[<%=i%>]" class="c-check" value="<%=ob_rs("id_itemOp")%>|<%=ob_rs("opcion_esp")%>" name="oppc[<%=i%>]" autocomplete="off" <%if op_prog_sel="si"then%>Checked<%end if%> class="md-check"><label for="oppc[<%=i%>]"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-arrow-right" aria-hidden="true"></i> sí</label>
</div></div>
<%ob_rs.movenext
opcion_pre_prog=""
op_prog_sel=""
i=i+1
loop
'VEMOS SI HEMOS ELEGIDO OPCION Y LUEGO SE HA CAMBIADO EN PROGRAMA
Sql2= "SELECT opcion_pre_prog, nom_opcion_prog, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&"  AND nom_opcion_prog<>''"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
nom_opcion_prog=ob_rs2("nom_opcion_prog")
i=i+1
do while not ob_rs2.eof
'opcion_pre_prog=ob_rs2("opcion_pre_prog")
Sql3= "SELECT opcion_esp, opcion_ob, rel.id_itemOp FROM rel, itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp<>0 AND rel.id_itemOp=itemsOp.id_itemOp AND trim(StrConv(opcion_esp, 2, 1042))='"&ob_rs2("nom_opcion_prog")&"'"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
else%>
<div class="col-md-6"><div class="form-group form-md-line-input col-md-9" ><label class="col-md-5 control-label" for="opp_p[<%=i%>]" ><%=ob_rs2("nom_opcion_prog")%>.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="opp_p[<%=i%>]" id="opp_p<%=i%>" maxlength="160" value="<%if ob_rs2("opcion_pre_prog")<>0 then%><%=FormatNumber(ccur(ob_rs2("opcion_pre_prog")),2)%><%end if%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio opción</span></div></div></div><div class="md-checkbox col-md-3" style="margin-top:15px">
<input type="checkbox" id="oppc[<%=i%>]" class="c-check" value="<%=ob_rs2("id_programaOp")%>|<%=ob_rs2("nom_opcion_prog")%>" name="oppc[<%=i%>]" autocomplete="off" Checked class="md-check">
<label for="oppc[<%=i%>]"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-arrow-right" aria-hidden="true"></i> sí</label></div></div>
<%end if
ob_rs3.close
ob_rs2.movenext
i=i+1
loop
end if
ob_rs2.close
end if
ob_rs.close%>
</div>
<!--OPCIONES CURSO--><div class="col-md-12">
<%if id_itemSub<>""then
Sql= "SELECT opcion_esp, opcion_ob, opcion_pre, rel.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub="&id_itemSub&" AND rel.id_itemSubOp<>0 AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp  AND transfer <>'si' ORDER BY opcion_orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
'VEMOS SI LO HEMOS SELECCIONADO
Sql2= "SELECT opcion_pre_curso, nom_opcion_curso, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&" AND trim(StrConv(nom_opcion_curso, 2, 1042))='"&ob_rs("opcion_esp")&"' AND (transfer is null or transfer<>'si')"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
op_curso_sel="si"
opcion_pre_curso_2=ob_rs2("opcion_pre_curso")
end if
ob_rs2.close%>
<div class="col-md-6"><div class="form-group form-md-line-input col-md-9" ><label class="col-md-5 control-label" for="opc_p[<%=i%>]" ><%=ob_rs("opcion_esp")%>.</label><div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="opc_p[<%=i%>]" id="opc_p<%=i%>" maxlength="160" value="<%if opcion_pre_curso_2<>0 then%><%=FormatNumber(ccur(opcion_pre_curso_2),2)%><%end if%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio opción</span></div></div></div><div class="md-checkbox col-md-3" style="margin-top:15px">
<input type="checkbox" id="opcc[<%=i%>]" class="c-check" value="<%=ob_rs("id_itemSubOp")%>|<%=ob_rs("opcion_esp")%>" name="opcc[<%=i%>]" autocomplete="off" <%if op_curso_sel="si"then%>Checked<%end if%> class="md-check"><label for="opcc[<%=i%>]"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-arrow-right" aria-hidden="true"></i> sí</label>
</div></div>
<%ob_rs.movenext
op_curso_sel=""
opcion_pre_curso=""
i=i+1
loop
'VEMOS SI HEMOS ELEGIDO OPCION Y LUEGO SE HA CAMBIADO EN PROGRAMA
Sql2= "SELECT opcion_pre_curso, nom_opcion_curso, id_programaOp FROM programasOp WHERE id_programa ="&cod_prog&"  AND nom_opcion_curso<>'' AND transfer IS NULL "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
i=i+1
do while not ob_rs2.eof
Sql3= "SELECT opcion_esp, opcion_ob, rel.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub="&id_itemSub&" AND rel.id_itemSubOp<>0 AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp AND trim(StrConv(opcion_esp, 2, 1042))='"&ob_rs2("nom_opcion_curso")&"' "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
else%>
<div class="col-md-6"><div class="form-group form-md-line-input col-md-9" ><label class="col-md-5 control-label" for="opc_p[<%=i%>]" ><%=ob_rs2("nom_opcion_curso")%>.</label><div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="opc_p[<%=i%>]" id="opc_p<%=i%>" maxlength="160" value="<%if ob_rs2("opcion_pre_curso")<>0 then%><%=FormatNumber(ccur(ob_rs2("opcion_pre_curso")),2)%><%end if%>" onKeyUp="suma();"><div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio opción</span></div></div></div><div class="md-checkbox col-md-3" style="margin-top:15px">
<input type="checkbox" id="opcc[<%=i%>]" class="c-check" value="<%=ob_rs2("id_programaOp")%>|<%=ob_rs2("nom_opcion_curso")%>" name="opcc[<%=i%>]" autocomplete="off" Checked class="md-check"><label for="opcc[<%=i%>]"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-arrow-right" aria-hidden="true"></i> sí</label>
</div></div>
<%end if
ob_rs3.close
ob_rs2.movenext
i=i+1
loop
end if
ob_rs2.close
end if
ob_rs.close
end if%></div></div></div></div>
<!--CONCEPTOS--><div class="col-md-12">
<div class="campos_conceptos_<%=a%> form-group form-md-line-input campos_conceptos"><div class="col-md-12" style="border-top:2px solid #ddd;padding-top:20px;margin-bottom:20px;"><button class="inserta_concepto_<%=a%> btn green" <%if gen_fac="si" then%> disabled<%end if%>><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Concepto</button></div>
<%i_conceptos=1
if cod_prog<>"" then
Sql= "SELECT * FROM programasOpAdd WHERE id_programa="&cod_prog&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_con=ob_rs.RecordCount 
if tot_con=""then tot_con=1
do while not ob_rs.eof
concepto_b=ob_rs("concepto")
concepto_pre_b=ob_rs("precio")
if concepto_pre_b <>"" and concepto_pre_b<>"0" then concepto_pre_b=FormatNumber(ccur(concepto_pre_b),2) else concepto_pre_b=""  end if
concepto_orden_b=ob_rs("orden")%>
<div class="col-md-12 concepto_lst_<%=a%>">
<div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_[<%=i_conceptos%>]">Concepto <span class="orden_con"><%=i_conceptos%></span>.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" id="concepto_[<%=i_conceptos%>]" name="concepto_[<%=i_conceptos%>]" value="<%=concepto_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div>
<input name="concepto_orden_[<%=i_opciones%>]" id="concepto_orden_[<%=i_conceptos%>]" type="hidden" value="<%=i_conceptos%>"></div></div>
<div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_pre_<%=i_conceptos%>">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto_pre_[<%=i_conceptos%>]" id="concepto_pre_<%=i_conceptos%>" value="<%=concepto_pre_b%>" onKeyUp="suma();"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div>
<div class="col-md-2"><div class="form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="concepto_del_[<%=i_conceptos%>]" id="concepto_del_[<%=i_conceptos%>]" class="md-check" value="si" onClick="javascript:document.all.concepto_pre_<%=i_conceptos%>.value=0;suma();"><label for="concepto_del_[<%=i_conceptos%>]"><span></span><span class="check"></span><span class="box"></span> Eliminar.<%=i_conceptos%> </label></div></div></div></div></div>
<%i_conceptos=i_conceptos+1
ob_rs.movenext
loop
else
i_conceptos=0%>
<div class="col-md-12 concepto_lst_<%=a%>"></div>
<%end if
ob_rs.close
end if%>
</div></div>
<!--ANTICIPOS--><div class="col-md-12">



<div class="campos_anticipos_<%=a%> form-group form-md-line-input campos_anticipos">
<div class="col-md-12" style="border-top:2px solid #ddd;padding-top:20px;margin-bottom:20px;"><button class="inserta_anticipo_<%=a%> btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Anticipos / Pagos</button></div>
<%i_anticipos=1
if cod_prog<>"" then
Sql= "SELECT * FROM programasAnticipos WHERE id_programa="&cod_prog&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_ant=ob_rs.RecordCount 
if tot_ant=""then tot_ant=1
do while i_anticipos<=tot_ant and not ob_rs.eof
anticipo_b=ob_rs("anticipo")
anticipo_pre_b=ob_rs("precio")
if anticipo_pre_b <>"" and anticipo_pre_b<>"0" then anticipo_pre_b=FormatNumber(ccur(anticipo_pre_b),2) else anticipo_pre_b=""  end if
anticipo_fec_b=ob_rs("fecha")
anticipo_orden_b=ob_rs("orden")
pagado_b=ob_rs("pagado")
metodoPago_rs=ob_rs("metodoPago")
anticipo_estadoPago_b=ob_rs("estadoPago")%>
<div class="col-md-12 anticipo_lst_<%=a%>">
<div class="col-md-6">
<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="anticipo_[<%=i_anticipos%>]">Anticipo <span class="orden_ant_<%=a%>"><%=i_anticipos%></span>.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" id="anticipo_[<%=i_anticipos%>]" name="anticipo_[<%=i_anticipos%>]" value="<%=anticipo_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div>
<input name="concepto_orden_[<%=i_anticipos%>]" id="concepto_orden_[<%=i_anticipos%>]" type="hidden" value="<%=i_anticipos%>">
</div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="anticipo_pre_<%=i_anticipos%>">Precio.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="anticipo_pre_[<%=i_anticipos%>]" id="anticipo_pre_<%=i_anticipos%>" value="<%=anticipo_pre_b%>" onKeyUp="suma();"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
</div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="anticipo_fec_[<%=i_anticipos%>]">Fecha.</label>
<div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="anticipo_fec_[<%=i_anticipos%>]" id="anticipo_fec_[<%=i_anticipos%>]" value="<%=anticipo_fec_b%>"><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div>
</div></div>
<div class="col-md-12" style="border-bottom:1px solid #ddd;padding-bottom:10px">
<div class="col-md-6"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="anticipo_estadoPago_[<%=i_anticipos%>]">Estado.</label><div class="col-md-7" ><div class="input-icon"><select name="anticipo_estadoPago_[<%=i_anticipos%>]" id="anticipo_estadoPago_[<%=i_anticipos%>]" >
<option value="" <%if estadoPago="" then%>Selected<%end if%>>Selecciona Estado</option>
<option value="Pendiente Transferencia" <%if anticipo_estadoPago_b="Pendiente Transferencia" then%>Selected<%end if%>>Pendiente Transferencia</option>
<option value="Pendiente Pago Oficina" <%if anticipo_estadoPago_b="Pendiente Pago Oficina" then%>Selected<%end if%>>Pendiente pago Oficina</option>
<option value="Pendiente" <%if anticipo_estadoPago_b="Pendiente" then%>Selected<%end if%>>Pendiente Pago PayPal o Tarjeta</option>
<option value="Denegada" <%if anticipo_estadoPago_b="Denegada" then%>Selected<%end if%>>Denegada Pago PayPal o Tarjeta</option>
<option value="Aceptada" <%if anticipo_estadoPago_b="Aceptada" then%>Selected<%end if%>>Operación Aceptada</option>
</select><i class="fa fa-clock-o" aria-hidden="true"></i></div></div></div></div>
<div class="col-md-6"><div class="form-group form-md-line-input col-md-10"><label class="col-md-3 control-label" for="metodo_pag_[<%=i_anticipos%>]">Método.</label>
<div class="col-md-8" ><div class="input-icon"><select name="metodo_pag_[<%=i_anticipos%>]" id="metodo_pag_[<%=i_anticipos%>]" >
<%Sql2= "SELECT transferencia, tarjeta, paypal, oficina FROM metodosPago"   '[METODOS PAGO]
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if ob_rs2("transferencia")="si" then%><option value="pag_transferencia" <%if metodoPago_rs="pag_transferencia" then%>Selected<%end if%>>Transferencia bancaria</option>
<%end if
if ob_rs2("tarjeta")="si" then%><option value="pag_tarjeta" <%if metodoPago_rs="pag_tarjeta" then%>Selected<%end if%>>Tarjeta de cr&eacute;dito</option>
<%end if
if ob_rs2("paypal")="si" then%><option value="pag_paypal" <%if metodoPago_rs="pag_paypal" then%>Selected<%end if%>>PayPal</option>
<%end if
if ob_rs2("oficina")="si" then%><option value="pag_oficina" <%if metodoPago_rs="pag_oficina" then%>Selected<%end if%>>Pago en metálico</option>
<%end if
end if
ob_rs2.close%></select><i class="fa fa-money" aria-hidden="true"></i></div></div></div>
<div class="form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="anticipo_pag_[<%=i_anticipos%>]" id="anticipo_pag_[<%=i_anticipos%>]" class="md-check" value="si" <%if pagado_b="si"then%>checked<%end if%>><label for="anticipo_pag_[<%=i_anticipos%>]"><span></span><span class="check"></span><span class="box"></span> Pagado. </label></div>
<div class="md-checkbox"><input type="checkbox" name="anticipo_del_[<%=i_anticipos%>]" id="anticipo_del_[<%=i_anticipos%>]" class="md-check" value="si" onClick="borra_<%=i_anticipos%>();"><label for="anticipo_del_[<%=i_anticipos%>]" onClick="borra_<%=i_anticipos%>();"><span></span><span class="check"></span><span class="box"></span> Eliminar. </label></div>
</div></div></div></div></div>
<script>function borra_<%=i_anticipos%>(){$('#modal_borra_<%=i_anticipos%>').modal();}
function borra2_<%=i_anticipos%>(){$('#anticipo_pre_<%=i_anticipos%>').val("");suma();}</script>
<div class="modal fade" id="modal_borra_<%=i_anticipos%>" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Eliminar Anticipo</h4></div><div class="modal-body"> Seguro que quieres elimiar este concepto? Resuerda que debes modificar datos dejando marcada la casillla "eliminar". <br>Comprueba siempre la cantidad que FALTA PAGAR. <br><br>En caso de desmarcar la casilla "eliminar" vuelve a introducir manualmente el precio.</div><div class="modal-footer"><button type="button" class="btn green" data-dismiss="modal" onClick=" borra2_<%=i_anticipos%>();">Aceptar</button><button type="button" class="btn default" data-dismiss="modal" >Cancelar</button></div></div></div></div>
<%i_anticipos=i_anticipos+1
ob_rs.movenext
loop
else
i_anticipos=0%>
<div class="anticipo_lst_<%=a%>"></div>
<%end if
ob_rs.close
end if%>
</div></div>
<!--SUMAS--><div class="col-md-12">
<div style="width:100%;max-width:550px;border:1px solid #32C5D2;text-align:center;margin:0 auto;padding:20px;margin-top:25px;margin-bottom:0px">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="suma_total" style="font-size:1.2em;color:#32C5D2">Suma total.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="suma_total" id="suma_total" maxlength="160" value="<%=suma_total%>" style="font-size:1.2em;color:#32C5D2"><div class="form-control-focus"> </div>
<i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">suma total del curso</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="falta_pagar" style="font-size:1.5em;color:#F00">Falta pagar.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="falta_pagar" id="falta_pagar" maxlength="160" value="<%=falta_pagar%>" style="font-size:1.5em;color:#F00"><div class="form-control-focus"> </div>
<i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">importe restante a pagar</span></div></div></div>
</div>
</div>
<!--BOTONES--><div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions"><div class="row">
<div style="width:100%;max-width:750px;text-align:center;margin:0 auto;padding-left:20px">
<div class="col-md-9">
<button type="submit" class="btn green" value="enviar datos" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
<a href="../<%=r%>web/pr_pdf_factura.asp?id_programa=<%=cod_prog%>&s=crm&cod_cat=<%=cod_cat%>&proc=gest&cod=<%=cod%>" class="btn green btn-outline" ><i class="fa fa-print" aria-hidden="true"></i> imprimir factura </a></div><div class="col-md-3"><div class="form-group form-md-checkboxes-inline"><div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso2" value="si"></div></div></div><label class="col-md-8 control-label" for="mail_aviso2"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>
Mail aviso.</label></div></div></div></div></div></div></div>
<!--OTROS DATOS--><div class="portlet">
<div class="portlet-title"><div class="caption" style="color:#32C5D2"><i class="fa fa-file-text-o" style="color:#32C5D2;font-size:1.1em"></i>Otros datos </div></div>
<div class="col-md-12 col-sm-12">
<div class="col-md-6 col-sm-6">
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="metodoPago">Método de pago.</label>
<div class="col-md-6" ><div class="input-icon"><select name="metodoPago" id="metodoPago" style="width:100%;">
<%Sql= "SELECT transferencia, tarjeta, paypal, oficina FROM metodosPago"   '[METODOS PAGO]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if ob_rs("transferencia")="si" then%><option value="pag_transferencia" <%if metodoPago_rs_p="pag_transferencia" then%>Selected<%end if%>>Transferencia bancaria</option>
<%end if
if ob_rs("tarjeta")="si" then%><option value="pag_tarjeta" <%if metodoPago_rs_p="pag_tarjeta" then%>Selected<%end if%>>Tarjeta de cr&eacute;dito</option>
<%end if
if ob_rs("paypal")="si" then%><option value="pag_paypal" <%if metodoPago_rs_p="pag_paypal" then%>Selected<%end if%>>PayPal</option>
<%end if
if ob_rs("oficina")="si" then%><option value="pag_oficina" <%if metodoPago_rs_p="pag_oficina" then%>Selected<%end if%>>Pago en metálico</option>
<%end if
end if
ob_rs.close%>
</select><i class="fa fa-money" aria-hidden="true"></i></div>
</div></div></div>
<div class="col-md-6 col-sm-6"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="estadoPago">Estado de pago.</label>
<div class="col-md-8" ><div class="input-icon">
<select name="estadoPago" id="estadoPago" >
<option value="Pendiente Transferencia" <%if estadoPago="Pendiente Transferencia" then%>Selected<%end if%>>Pendiente Transferencia</option>
<option value="Pendiente Pago Oficina" <%if estadoPago="Pendiente Pago Oficina" then%>Selected<%end if%>>Pendiente pago Oficina</option>
<option value="Pendiente" <%if estadoPago="Pendiente" then%>Selected<%end if%>>Pendiente Pago PayPal o Tarjeta</option>
<option value="Denegada" <%if estadoPago="Denegada" then%>Selected<%end if%>>Denegada Pago PayPal o Tarjeta</option>
<option value="Aceptada" <%if estadoPago="Aceptada" then%>Selected<%end if%>>Operación Aceptada</option>
</select><i class="fa fa-clock-o" aria-hidden="true"></i></div>
</div></div></div></div>

<%'if factura="si"then%>
<div class="col-md-6 col-sm-6"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="u_f_nombre" >Nombre facturación.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_f_nombre" id="u_f_nombre" maxlength="160" value="<%=u_f_nombre%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">nombre para facturación</span></div></div></div></div>

<div class="col-md-6 col-sm-6"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="u_f_nif" >NIF/CIF facuración.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_f_nif" id="u_f_nif" maxlength="160" value="<%=u_f_nif%>"><div class="form-control-focus"></div><i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">NIF/CIF para factura</span></div></div></div></div>

<div class="col-md-6 col-sm-6"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="u_f_direccion" >Dirección facuración.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_f_direccion" id="u_f_direccion" maxlength="160" value="<%=u_f_direccion%>"><div class="form-control-focus"></div>
<i class="fa fa-map-marker" aria-hidden="true"></i><span class="help-block">dirección para factura</span></div></div></div></div>
<%'end if%>

<div class="col-md-6 col-sm-6"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="a_observaciones_curso" >Observaciones alumno..</label><div class="col-md-8"><div class="input-icon"><textarea name="a_observaciones_curso" class="form-control" id="a_observaciones_curso" placeholder=""><%=a_observaciones_curso%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">observaciones del alumno</span></div></div></div></div></div>
</div></div></div></form></div>
<!--TAB 3 PACKS-->
<div class="tab-pane <%=tab1_4%>" id="portlet_tab3_<%=a%>">
<div class="scroller" style="height: 200px;"><div class="panel-body"><div class="col-md-12">
<div id="f_upload">
<form id="fileupload" action="server/php/index.php" method="POST" enctype="multipart/form-data">
<div class="row fileupload-buttonbar"><div class="col-lg-12"><span class="btn btn-success fileinput-button"><i class="glyphicon glyphicon-plus"></i><span>Añadir archivos...</span><input type="file" name="files[]" multiple></span><button type="submit" class="btn btn-primary start" style="margin-left:7px;"><i class="glyphicon glyphicon-upload"></i><span>Comenzar subida</span></button><button type="reset" class="btn btn-warning cancel" style="margin-left:7px;"><i class="glyphicon glyphicon-ban-circle"></i><span>Cancelar subida</span></button><button type="button" class="btn btn-danger delete" style="margin-left:7px;"><i class="glyphicon glyphicon-trash"></i><span>Eliminar</span></button><button type="button" class="btn btn-info env_mail" style="margin-left:4px;"><i class="fa fa-share" aria-hidden="true"></i><i class="fa fa-envelope-o" aria-hidden="true"></i><span>Mail aviso <%if env_mail_docs<>0 or env_mail_docs<>""then%>(<%=env_mail_docs%>)<%end if%></span></button>
<div class="md-checkbox" style="width:100%;max-width:150px;display:inline;margin-left:15px"><input type="checkbox" name="concepto_del_[<%=i_conceptos%>]" id="concepto_del_[<%=i_conceptos%>]" class="toggle md-check" value="si"><label for="concepto_del_[<%=i_conceptos%>]"><span></span><span class="check"></span><span class="box"></span> Seleccionar todos. </label></div><span class="fileupload-process"></span></div>
<div class="col-lg-5 fileupload-progress fade"><div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
<div class="progress-bar progress-bar-success" style="width:0%;"></div></div><div class="progress-extended">&nbsp;</div></div></div><table role="presentation" class="table table-striped"><tbody class="files"></tbody></table></form>
    </div>
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even"><div class="slides"></div><h3 class="title"></h3><a class="prev">‹</a><a class="next">›</a><a class="close">×</a><a class="play-pause"></a><ol class="indicator"></ol></div>
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
<tr class="template-upload fade">
<td>
<span class="preview"></span>
</td>
<td>
<p class="name">{%=file.name%}</p>
<strong class="error text-danger"></strong>
</td>
<td>
<p class="size">Procesando...</p>
<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
</td>
<td>
{% if (!i && !o.options.autoUpload) { %}
<button class="btn btn-primary start" disabled><i class="glyphicon glyphicon-upload"></i><span>Empezar</span></button>
{% } %}
{% if (!i) { %}
<button class="btn btn-warning cancel"><i class="glyphicon glyphicon-ban-circle"></i><span>Cancel</span></button>
{% } %}
</td>
</tr>
{% } %}
</script>
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
<tr class="template-download fade">
<td>
<span class="preview">
{% if (file.thumbnailUrl) { %}
<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
{% }else{ %}
<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}><img src="../images/doc.png" width="32" height="32"></a>
{% } %}
</span>
</td>
<td>
<p class="name">
{% if (file.url) { %}
<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
{% } else { %}
<span>{%=file.name%}</span>
{% } %}
</p>
{% if (file.error) { %}
<div><span class="label label-danger">Error</span> {%=file.error%}</div>
{% } %}
</td>
<td>
<span class="size">{%=o.formatFileSize(file.size)%}</span>
</td>
<td>
{% if (file.deleteUrl) { %}
<button class="btn btn-danger delete del_archivo" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}&carpeta=<%=cod_prog%>"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %} style="float:left"><i class="glyphicon glyphicon-trash"></i><span>Eliminar</span></button>
<div style="float:left;margin-top:-12px;padding-top:-20px;height:25px;"><div class="form-group form-md-line-input"><div class="md-checkbox"><input type="checkbox" name="delete" id="delete{%=file.name%}" value="1" class="md-check toggle check-up" class="" value="si" ><label for="delete{%=file.name%}"><span></span><span class="check"></span><span class="box"></span>&nbsp;</label></div></div></div>
{% } else { %}
<button class="btn btn-warning cancel">
<i class="glyphicon glyphicon-ban-circle"></i>
<span>Cancel</span>
</button>
{% } %}
</td>
</tr>
{% } %}
</script>
<script>
$(function () {//PACKS A CARPETAS
'use strict';
$('#f_upload #fileupload').fileupload({url: 'server/php/index.php?carpeta=<%=cod_prog%>'});
$('#f_upload #fileupload').fileupload('option','redirect',window.location.href.replace(/\/[^\/]*$/,'/cors/result.html?%s'));
if (window.location.hostname === 'blueimp.github.io') {
} else {
$('#f_upload #fileupload').addClass('fileupload-processing');
$.ajax({url: $('#f_upload #fileupload').fileupload('option', 'url'),
dataType: 'json',
context: $('#f_upload #fileupload')[0]
}).always(function () {
$(this).removeClass('fileupload-processing');
}).done(function (result) {
$(this).fileupload('option', 'done')
.call(this, $.Event('done'), {result: result});
});
}
});
$('#f_upload #fileupload').bind('fileuploaddestroy', function (e, data) {});//ale eliminar se elimina de la BBDD
$('#f_upload #fileupload').bind('fileuploaddone', function (e, data) {$.each(data.files, function (index, file) {fileName = file.name;});});//TENEMOS QUE INSERTAR EN LA BBDD EL NOMBRE, PESO ETC...
var fileName = "";
$('#f_upload_<%=a%> .fileinput-button').click(function(){
<%Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FolderExists(Server.MapPath("..\..\up_docs\alu_packs\"&cod_prog)) Then 
else
Set objFolder = fso.CreateFolder(Server.MapPath("..\..\up_docs\alu_packs\"&cod_prog))
end if%>
});
</script>
</div>
</div>
</div>
</div>
<form id="docus" name="docus" action="guardar.asp" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><input name="form_op" type="hidden" value="docus_op"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="mail_aviso_docs" type="hidden" value="si"></form>

<!--TAB 5 DOCUMENTACION-->
<div class="tab-pane <%=tab1_5%>" id="portlet_tab5_<%=a%>">
<%if id_item<>0 then%>
<%Sql2= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_categoria=ob_rs2("id_categoria")
end if
ob_rs2.close
Sql2= "SELECT id_destino FROM rel WHERE id_item="&id_item&" and id_destino<>0 "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_destino=ob_rs2("id_destino")
end if
ob_rs2.close
Sql2= "SELECT id_seccion FROM rel WHERE id_item="&id_item&" and id_seccion<>0"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_seccion=ob_rs2("id_seccion")
end if
ob_rs2.close
Sql2= "SELECT catDocumentacion.id_catDocumentacion FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&id_alumno&" OR id_item="&id_item&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
num_arch_in=0
do while not ob_rs2.eof
'VEMOS SI EL ALUMNO TIENE ESTA DOCUMENTACION SUBIDA
Sql3= "SELECT id_catDocumentacion, id_alumno,archivo FROM alumnosDocumentacion WHERE id_alumno="&id_alumno&" AND id_catDocumentacion="&ob_rs2("id_catDocumentacion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
num_arch_in=num_arch_in+1
end if
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT titulo_esp, texto_esp, email, catDocumentacion.id_catDocumentacion,id_catDocumentacion_rel FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&id_alumno&" OR id_item="&id_item&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
doc=1
num_arch=ob_rs2.recordcount
num_arch_in=num_arch-num_arch_in%>
<table class="table table-striped table-bordered ">
<thead>
<tr style="color:#999">
<th><i class="fa fa-folder-open-o" aria-hidden="true"></i> Documentación </th>
<th style="text-align:center"><i class="fa fa-upload"></i> Archivo subido </th>
<th style="text-align:center;width:180px"><i class="fa fa-trash-o"></i> Eliminar </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs2.eof
id_catDocumentacion_rel=ob_rs2("id_catDocumentacion_rel")%>
<%'VEMOS SI EL ALUMNO TIENE ESTA DOCUMENTACION SUBIDA
Sql3= "SELECT id_catDocumentacion, id_alumno,archivo FROM alumnosDocumentacion WHERE id_alumno="&id_alumno&" AND id_catDocumentacion="&ob_rs2("id_catDocumentacion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<tr>
<td><%=ob_rs2("titulo_esp")%></td>
<td style="text-align:center"><%if ob_rs3("archivo")<>""then%><a href="../../up_docs/alu_docs/<%=ob_rs3("archivo")%>" target="_blank"> <%=ob_rs3("archivo")%><i class="fa fa-external-link" aria-hidden="true" style="font-size:0.8em;margin-top:6px;margin-left:7px"></i></a><%else%><i class="fa fa-times" aria-hidden="true" style="color:#F00"></i><%end if%></td>
<td style="text-align:center">
<a href="guardar.asp?op=del_doc&r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=ndos%>&ntres=<%=ntres%>&ncuat=<%=ncuat%>&cod=<%=cod%>&cod_prog=<%=cod_prog%>&form_op=del_doc&cod_cat=<%=cod_cat%>&id_catDocumentacion_rel=<%=ob_rs2("id_catDocumentacion_rel")%>" class="btn red"><i class="fa fa-trash" style="margin-right:8px"></i>eliminar</a>
</td>
</tr>
<%else%>
<tr>
<td><%=ob_rs2("titulo_esp")%></td>
<td style="text-align:center"><i class="fa fa-times" aria-hidden="true" style="color:#F00"></i></td>
<td style="text-align:center"></td>
</tr>
<%end if
ob_rs3.close
id_catDocumentacion_rel=""
ob_rs2.movenext
doc=doc+1
loop%>
<%end if
ob_rs2.close
'VEMOS SI EL ALUMNO TIENE ESTA DOCUMENTACION SUBIDA
Sql3= "SELECT id_catDocumentacion, id_alumno,archivo,nombreCatDocumentacion FROM alumnosDocumentacion WHERE id_alumno="&id_alumno&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
id_catDocumentacion=ob_rs3("id_catDocumentacion")
Sql4= "SELECT id_catDocumentacion FROM catDocumentacion WHERE id_catDocumentacion="&id_catDocumentacion&""
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
else%>
<tr>
<td><%=ob_rs3("nombreCatDocumentacion")%></td>
<td style="text-align:center"><a href="../../up_docs/alu_docs/<%=ob_rs3("archivo")%>" target="_blank"> <%=ob_rs3("archivo")%><i class="fa fa-external-link" aria-hidden="true" style="font-size:0.8em;margin-top:6px;margin-left:7px"></i></a></td>
<td style="text-align:center">
<a href="guardar.asp?op=del_doc_o&r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=ndos%>&ntres=<%=ntres%>&ncuat=<%=ncuat%>&cod=<%=cod%>&cod_prog=<%=cod_prog%>&form_op=del_doc_o&cod_cat=<%=cod_cat%>&id_catDocumentacion=<%=ob_rs3("id_catDocumentacion")%>" class="btn red"><i class="fa fa-trash" style="margin-right:8px"></i>eliminar</a>
</td>
</tr>
<%end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close%>
</tbody>
</table>
<%end if%>
</div><!--FIN TAB 5 DOCUMENTACION-->
<!--TAB 4 FACTURAS-->
<div class="tab-pane <%=tab1_3%>" id="portlet_tab4_<%=a%>"><div class="scroller" style="height: 200px;"><div class="panel-body"><div class="col-md-12">
<div class="col-md-offset-2 col-md-7" >
<div class="note note-info magin-top-0" style="margin-bottom:30px;margin-top:10px"><h4 class="block">Facturas anexas</h4>
<p><i class="fa fa-info-circle" aria-hidden="true"></i> Las factura anexas no figuran en el TOTAL ni en la cantidad que resta por pagar en el área cliente. Sí figura la factura, la cual se puede descargar. El pago ha de realizarse mediante transferencia o presencialmente en las oficinas.
</p></div>
</div>
<div class="col-md-12 campos_facturas_<%=a%> campos_fac">
<div class="col-md-12" style="margin-bottom:15px"> <button class="inserta_factura_<%=a%> btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir factura anexa<i class="fa fa-calculator" aria-hidden="true" style="margin-left:7px;"></i></button> <button class="btn default pull-right" onClick="ver_last_factura();"><i class="fa fa-search" style="margin-right:8px"></i>Ver número última factura<i class="fa fa-sort-numeric-desc" aria-hidden="true" style="margin-left:7px;"></i></button></div>
<div class="col-md-12">
<div class="panel-group accordion scrollable" id="acordeon_f" >
<%i_facturas=1
if cod_prog<>"" then
Sql= "SELECT * FROM facturas WHERE id_programa="&cod_prog&" order by n_factura"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_fac=ob_rs.RecordCount 
if tot_fac=""then tot_fac=1
do while i_facturas<=tot_fac and not ob_rs.eof
id_factura_b=ob_rs("id_factura")
concepto1_b=ob_rs("concepto1")
concepto1_pre_b=ob_rs("precio1")
if concepto1_pre_b <>"" and concepto1_pre_b<>"0" then concepto1_pre_b=FormatNumber(ccur(concepto1_pre_b),2) else concepto1_pre_b="" end if
concepto2_b=ob_rs("concepto2")
concepto2_pre_b=ob_rs("precio2")
if concepto2_pre_b <>"" and concepto2_pre_b<>"0" then concepto2_pre_b=FormatNumber(ccur(concepto2_pre_b),2) else concepto2_pre_b="" end if
concepto3_b=ob_rs("concepto3")
concepto3_pre_b=ob_rs("precio3")
if concepto3_pre_b <>"" and concepto3_pre_b<>"0" then concepto3_pre_b=FormatNumber(ccur(concepto3_pre_b),2) else concepto3_pre_b="" end if
n_factura_b=ob_rs("n_factura")
n_factura_c=ob_rs("n_factura")
fecha_pago_b=ob_rs("fecha_pago")
if fecha_pago_b<>"01/01/1000"then fecha_pago_b=fecha_pago_b else fecha_pago_b= "" end if
fecha_emision_b=ob_rs("fecha_emision")
if fecha_emision_b<>"01/01/1000"then fecha_emision_b=fecha_emision_b else fecha_emision_b= "" end if
total_b=ob_rs("total")
if total_b <>"" and total_b<>"0" then total_b=FormatNumber(ccur(total_b),2) else total_b=""  end if
fecha_creacion_b=ob_rs("fecha_creacion")
if fecha_creacion_b<>"01/01/1000"then fecha_creacion_b=fecha_creacion_b else fecha_creacion_b= "" end if
fac_ajuste_b=ob_rs("fac_ajuste")
if fac_ajuste_b <>"" and fac_ajuste_b<>"0" then fac_ajuste_b=FormatNumber(ccur(fac_ajuste_b),2) else fac_ajuste_b=""  end if
gen_ajuste_b=ob_rs("gen_ajuste")
metodoPago_f=ob_rs("metodoPago")
estadoPago_f=ob_rs("estadoPago")
if n_factura_b<>"" or Not isNull(n_factura_b) then 
gen_fac="si"
end if   '[FIN SACAMOS FACTURA]%>
<!--#include file="../comun/facturas.asp"--> 
<%n_factura_c=n_factura_p%>

<div class="factura_lst_<%=a%>">

<form action="guardar.asp" class="form-horizontal" id="facturas_<%=i_facturas%>" name="facturas_<%=i_facturas%>" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod" type="hidden" value="<%=cod%>"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><input name="form_op" type="hidden" value="facturas"><input name="id_factura" type="hidden" value="<%=id_factura_b%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<div class="panel panel-default" style="border:none;margin-bottom:5px"><div class="panel-heading"><h4 class="panel-title acordeon_in"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon_f" href="#acordeon_fac_<%=i_facturas%>"><i class="fa fa-tags" aria-hidden="true" style="margin-right:4px;"></i><%if n_factura_b<>""then%><%=n_factura_b%><%else%>Factura. <%end if%></a></h4></div><div id="acordeon_fac_<%=i_facturas%>" class="panel-collapse collapse"><div class="panel-body">
<div class="col-md-7"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="concepto1_fac_[<%=i_facturas%>]">Concepto <span class="orden_ant">1</span>.</label>
<div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" id="concepto1_fac_[<%=i_facturas%>]" name="concepto1_fac_[<%=i_facturas%>]" value="<%=concepto1_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto1_fac_orden_[<%=i_facturas%>]" id="concepto1_fac_orden_[<%=i_facturas%>]" type="hidden" value="<%=i_facturas%>"></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="concepto1_fac_pre_[<%=i_facturas%>]">Precio.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto1_fac_pre_[<%=i_facturas%>]" id="concepto1_fac_pre_[<%=i_facturas%>]" value="<%=concepto1_pre_b%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div>
<div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto2_fac_[<%=i_facturas%>]">Concepto <span class="orden_ant">2</span>.</label>
<div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" id="concepto2_fac_[<%=i_facturas%>]" name="concepto2_fac_[<%=i_facturas%>]" value="<%=concepto2_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto2_fac_orden_[<%=i_facturas%>]" id="concepto2_fac_orden_[<%=i_facturas%>]" type="hidden" value="<%=i_facturas%>"></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="concepto2_fac_pre_[<%=i_facturas%>]">Precio.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto2_fac_pre_[<%=i_facturas%>]" id="concepto2_fac_pre_[<%=i_facturas%>]" value="<%=concepto2_pre_b%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div>
<div class="col-md-7"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="concepto3_fac_[<%=i_facturas%>]">Concepto <span class="orden_ant">3</span>.</label>
<div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" id="concepto3_fac_[<%=i_facturas%>]" name="concepto3_fac_[<%=i_facturas%>]" value="<%=concepto3_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto3_fac_orden_[<%=i_facturas%>]" id="concepto3_fac_orden_[<%=i_facturas%>]" type="hidden" value="<%=i_facturas%>"></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="concepto3_fac_pre_[<%=i_facturas%>]">Precio.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto3_fac_pre_[<%=i_facturas%>]" id="concepto3_fac_pre_[<%=i_facturas%>]" value="<%=concepto3_pre_b%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div>
<div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="fecha_emision_fac_[<%=i_facturas%>]">F. emisión.</label><div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="fecha_emision_fac_[<%=i_facturas%>]" id="fecha_emision_fac_[<%=i_facturas%>]" value="<%=fecha_emision_b%>"><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa.</span></div></div></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="fecha_pago_fac_[<%=i_facturas%>]">F. vence.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="fecha_pago_fac_[<%=i_facturas%>]" id="fecha_pago_fac_[<%=i_facturas%>]" value="<%=fecha_pago_b%>"><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa.</span></div></div></div></div>
<div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="n_fac_<%=i_facturas%>">Nº Factura.</label><div class="col-md-7">
<div class="input-icon"><input  name="n_fac_<%=i_facturas%>" type="text" <%if gen_fac<>"si"then%>disabled<%end if%> class="form-control" id="n_fac_<%=i_facturas%>" placeholder="" value="<%=n_factura_b%>" maxlength="8"><div class="form-control-focus"></div><i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><span class="help-block">correlativo <%if n_factura_c<>""then%><%=n_factura_c%><%else%>Fnnnn-aa<%end if%>.</span></div></div></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="total_fac_[<%=i_facturas%>]">Total.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="total_fac_[<%=i_facturas%>]" id="total_fac_[<%=i_facturas%>]" value="<%=total_b%>"><div class="form-control-focus"></div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">precio total.</span></div></div></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-7 control-label" for="fac_ajuste_[<%=i_facturas%>]">Importe ajuste.</label><div class="col-md-5">
<div class="input-icon"><input  name="fac_ajuste_[<%=i_facturas%>]" type="text" class="form-control" id="fac_ajuste_<%=i_facturas%>" placeholder="" value="<%=fac_ajuste_b%>" maxlength="8"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio total con ajuste.</span></div></div></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input"><div class="col-md-12"><div class="md-checkbox"><input type="checkbox" name="gen_ajuste_[<%=i_facturas%>]" id="gen_ajuste_<%=i_facturas%>" class="md-check" value="si"  autocomplete="off" <%if gen_ajuste_b="si" then%>checked<%end if%>><label for="gen_ajuste_<%=i_facturas%>"><span></span><span class="check"></span><span class="box"></span> Incluir importe ajuste. </label></div></div></div></div>
<div class="col-md-12" style="border-bottom:1px solid #ddd;border-top:1px dashed #ddd;margin-top:12px">
<div class="col-md-5 form-group form-md-checkboxes">
<div class="md-checkbox-inline">
<div class="md-checkbox"><input type="checkbox" name="gen_fac_[<%=i_facturas%>]" id="gen_fac_<%=i_facturas%>" class="md-check" value="si" onClick="codename_<%=i_facturas%>()" autocomplete="off" <%if gen_fac="si"then%>checked<%end if%>>
<label for="gen_fac_<%=i_facturas%>"><span></span><span class="check"></span><span class="box"></span> Factura generada. </label></div><div class="md-checkbox"><input type="checkbox" name="factura_del_[<%=i_facturas%>]" id="factura_del_[<%=i_facturas%>]" class="md-check" value="si"><label for="factura_del_[<%=i_facturas%>]"><span></span><span class="check"></span><span class="box"></span> Eliminar. </label></div>
<a href="../<%=r%>web/pr_pdf_factura_anex.asp?id_factura=<%=id_factura_b%>&s=crm&cod_cat=<%=cod_cat%>&proc=gest&cod=<%=cod%>" class="btn default"><i class="fa fa-print" aria-hidden="true" style="margin-right:6px"></i>Imprimir.</a>
</div>
</div>
<script>function codename_<%=i_facturas%>() {if(document.facturas_<%=i_facturas%>.gen_fac_<%=i_facturas%>.checked){document.facturas_<%=i_facturas%>.n_fac_<%=i_facturas%>.disabled=false;}
else{document.facturas_<%=i_facturas%>.n_fac_<%=i_facturas%>.disabled=true;}}</script>
<div class="col-md-7">
<div class="form-group form-md-line-input col-md-6"><label class="col-md-3 control-label" for="estadoPago_f_[<%=i_facturas%>]">Estado.</label>
<div class="col-md-9" ><div class="input-icon"><select name="estadoPago_f_[<%=i_facturas%>]" id="estadoPago_f_[<%=i_facturas%>]" >
<option value="" <%if estadoPago_f="" then%>Selected<%end if%>>Selecciona Estado</option>
<option value="Pendiente Transferencia" <%if estadoPago_f="Pendiente Transferencia" then%>Selected<%end if%>>Pendiente Transferencia</option>
<option value="Pendiente Pago Oficina" <%if estadoPago_f="Pendiente Pago Oficina" then%>Selected<%end if%>>Pendiente pago Oficina</option>
<option value="Pendiente" <%if estadoPago_f="Pendiente" then%>Selected<%end if%>>Pendiente Pago PayPal o Tarjeta</option>
<option value="Denegada" <%if estadoPago_f="Denegada" then%>Selected<%end if%>>Denegada Pago PayPal o Tarjeta</option>
<option value="Aceptada" <%if estadoPago_f="Aceptada" then%>Selected<%end if%>>Operación Aceptada</option>
<option value="Aceptada" <%if estadoPago_f="Pagada" then%>Selected<%end if%>>Pagada</option>
</select><i class="fa fa-clock-o" aria-hidden="true"></i></div></div></div>
<div class="form-group form-md-line-input col-md-6" ><label class="col-md-3 control-label" for="metodoPago_f_[<%=i_facturas%>]">Método.</label>
<div class="col-md-9" ><div class="input-icon"><select name="metodoPago_f_[<%=i_facturas%>]" id="metodoPago_f_[<%=i_facturas%>]" >
<%Sql2= "SELECT transferencia, tarjeta, paypal, oficina FROM metodosPago"   '[METODOS PAGO]
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if ob_rs2("transferencia")="si" then%><option value="pag_transferencia" <%if metodoPago_f="pag_transferencia" then%>Selected<%end if%>>Transferencia bancaria</option>
<%end if
if ob_rs2("tarjeta")="si" then%><option value="pag_tarjeta" <%if metodoPago_f="pag_tarjeta" then%>Selected<%end if%>>Tarjeta de cr&eacute;dito</option>
<%end if
if ob_rs2("paypal")="si" then%><option value="pag_paypal" <%if metodoPago_f="pag_paypal" then%>Selected<%end if%>>PayPal</option>
<%end if
if ob_rs2("oficina")="si" then%><option value="pag_oficina" <%if metodoPago_f="pag_oficina" then%>Selected<%end if%>>Pago en metálico</option>
<%end if
end if
ob_rs2.close%></select><i class="fa fa-money" aria-hidden="true"></i></div>
</div>
</div>
</div>
</div>
<!--BOTONES--><div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12">
<div class="col-md-5">
<button type="submit" class="btn green"  value="enviar datos" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
<div class="col-md-3"><div class="form-group form-md-checkboxes-inline"><div class="col-md-3"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso3" value="si"></div></div></div><label class="col-md-7 control-label" for="mail_aviso3"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>
Mail aviso.</label></div></div></div></div></div></div></div></div></div></div></form></div>
<%gen_fac=""
ob_rs.movenext
i_facturas=i_facturas+1
loop
else
i_facturas=2%>
<div class="factura_lst_<%=a%>"></div>
<%end if
ob_rs.close
end if%>
</div></div></div>
<!--#include file="../comun/facturas.asp"--> 
<%n_factura_c=n_factura_p '[FIN SACAMOS FACTURA]%>
<script>
$('.inserta_factura_<%=a%>').one('click',function(){
}).click(function(){
var n = $('.factura_lst_<%=a%>').length + 1;
if( <%=i_facturas%> < n ) {$('#alerta_facturas').modal();return false;}
x=n;
var box_htmle = $('<div class="factura_lst_<%=a%>"><form action="guardar.asp" class="form-horizontal" id="facturas_<%=i_facturas%>" name="facturas_<%=i_facturas%>" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="cod" type="hidden" value="<%=cod%>"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><input name="form_op" type="hidden" value="facturas"><div class="panel panel-default" style="border:none;margin-bottom:5px"><div class="panel-heading"><h4 class="panel-title acordeon_in"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon_f" href="#acordeon_fac_n_'+x+'"><i class="fa fa-tags" aria-hidden="true" style="margin-right:4px;"></i>Factura.</a></h4></div><div id="acordeon_fac_n_'+x+'" class="panel-collapse collapse"><div class="panel-body"><div class="col-md-12"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto1_fac_['+x+']">Concepto <span class="orden_ant">1</span>.</label><div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" id="concepto1_fac_['+x+']" name="concepto1_fac_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto1_fac_orden_['+x+']" id="concepto1_fac_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="concepto1_fac_pre_['+x+']">Precio.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto1_fac_pre_['+x+']" id="concepto1_fac_pre_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div></div><div class="col-md-12"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto2_fac_['+x+']">Concepto <span class="orden_ant">2</span>.</label><div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" id="concepto2_fac_['+x+']" name="concepto2_fac_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto2_fac_orden_['+x+']" id="concepto2_fac_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="concepto2_fac_pre_['+x+']">Precio.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto2_fac_pre_['+x+']" id="concepto2_fac_pre_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div></div><div class="col-md-12"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto3_fac_['+x+']">Concepto <span class="orden_ant">3</span>.</label><div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" id="concepto3_fac_['+x+']" name="concepto3_fac_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto3_fac_orden_['+x+']" id="concepto3_fac_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="concepto3_fac_pre_['+x+']">Precio.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto3_fac_pre_['+x+']" id="concepto3_fac_pre_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div></div><div class="col-md-12"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="fecha_emision_fac_['+x+']">F. emisión.</label><div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="fecha_emision_fac_['+x+']" id="fecha_emision_fac_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa.</span></div></div></div></div><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="fecha_pago_fac_['+x+']">F. vence.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="fecha_pago_fac_['+x+']" id="fecha_pago_fac_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa.</span></div></div></div></div></div><div class="col-md-12"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="n_fac_'+x+'">Nº Factura.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="n_fac_'+x+'" id="n_fac_'+x+'" value="" maxlength="8"><div class="form-control-focus"></div><i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><span class="help-block">correlativo <%if n_factura_c<>""then%><%=n_factura_c%><%else%>Fnnnn-aa<%end if%>.</span></div></div></div></div><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="total_fac_['+x+']">Total.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="total_fac_['+x+']" id="total_fac_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">precio total.</span></div></div></div></div></div><div class="col-md-12"><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-7 control-label" for="fac_ajuste_['+x+']">Importe ajuste.</label><div class="col-md-5"><div class="input-icon"><input  name="fac_ajuste_['+x+']" type="text" class="form-control" id="fac_ajuste_'+x+'" placeholder="" value="" maxlength="8"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio total si ajuste.</span></div></div></div></div><div class="col-md-5"><div class="form-group form-md-line-input" ><div class="col-md-12"><div class="md-checkbox"><input type="checkbox" name="gen_ajuste_['+x+']" id="gen_ajuste_'+x+'" class="md-check" value="si" autocomplete="off"><label for="gen_ajuste_'+x+'"><span></span><span class="check"></span><span class="box"></span> Incluir importe ajuste. </label></div></div></div></div></div><div class="col-md-12" style="border-bottom:1px solid #ddd;border-top:1px dashed #ddd;margin-top:12px"><div class="col-md-4 form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="gen_fac_['+x+']" id="gen_fac_'+x+'" class="md-check" value="si" autocomplete="off"><label for="gen_fac_'+x+'"><span></span><span class="check"></span><span class="box"></span> Generar Factura. </label></div><button class="elimina_factura btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></div><div class="col-md-8"><div class="form-group form-md-line-input col-md-6" ><label class="col-md-3 control-label" for="estadoPago_f_['+x+']">Estado.</label><div class="col-md-9" ><div class="input-icon"><select name="estadoPago_f_['+x+']" id="estadoPago_f_['+x+']" ><option value="" selected>Selecciona Estado</option><option value="Pendiente Transferencia" >Pendiente Transferencia</option><option value="Pendiente Pago Oficina" >Pendiente pago Oficina</option><option value="Pendiente">Pendiente Pago PayPal o Tarjeta</option><option value="Denegada">Denegada Pago PayPal o Tarjeta</option><option value="Aceptada" >Operación Aceptada</option></select><i class="fa fa-clock-o" aria-hidden="true"></i></div></div></div><div class="form-group form-md-line-input col-md-6" ><label class="col-md-3 control-label" for="metodoPago_f_['+x+']">Método.</label><div class="col-md-9" ><div class="input-icon"><select name="metodoPago_f_['+x+']" id="metodoPago_f_['+x+']" ><%Sql2= "SELECT transferencia, tarjeta, paypal, oficina FROM metodosPago"%>\
<%Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs2.eof then%>\
<%if ob_rs2("transferencia")="si" then%><option value="pag_transferencia">Transferencia bancaria</option>\
<%end if%>\
<%if ob_rs2("tarjeta")="si" then%><option value="pag_tarjeta">Tarjeta de cr&eacute;dito</option>\
<%end if%>\
<%if ob_rs2("paypal")="si" then%><option value="pag_paypal">PayPal</option>\
<%end if%>\
<%if ob_rs2("oficina")="si" then%><option value="pag_oficina">Pago en metálico</option>\
<%end if%>\
<%end if%>\
<%ob_rs2.close%>\
</select><i class="fa fa-money" aria-hidden="true"></i></div></div></div></div></div><div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px"><div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12"><button type="submit" class="btn green"  value="enviar datos" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i>modificar datos</button><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%><%if edi="" then%><a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%></div></div></div></div></div></div></div></div></form></div>');
box_htmle.hide();
$('.campos_facturas_<%=a%> div.factura_lst_<%=a%>:last').after(box_htmle);
$('select').select2({minimumResultsForSearch: -1,language: "es"})
box_htmle.fadeIn('slow');
return false;});
$('.campos_facturas_<%=a%>').on('click', '.elimina_factura', function(){
if( $('.factura_lst_<%=a%>').length >1){
$(this).closest('.factura_lst_<%=a%>').css( 'background-color', '#32C5D2' );
$(this).closest('.factura_lst_<%=a%>').fadeOut("slow", function() {
$(this).closest('.factura_lst_<%=a%>').remove();//$(".orden_fac_<%=a%>").each(function(index){$(this).text( index + 1 );});
});
};return false;
});
</script>
</div></div></div>
</div></div></div></div></div></div>
<%a=a+1
end if
ob_rs0.close%></div></div></div></div>
<!--tab_Sup_2 DATOS GENERALES-->
<div class="tab-pane <%=tab2%>" id="tab_2"><div class="form-body"><div class="row"><div class="col-md-12"><div class="panel-group accordion scrollable" id="acordeon_c">
<!--DATOS ALUMNO--><div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled <%=tab22_1%>" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_a1"><i class="fa fa-user-circle-o margin-right-8"></i> Datos del Alumno </a></h4></div>
<div id="acordeon_a1" class="panel-collapse collapse <%=tab2_1%>"><div class="panel-body"><div class="col-md-12"><div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="alumno" name="alumno" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="form_op" type="hidden" value="alumno"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><div class="scroller" style="height: 200px;"><div class="panel-body">
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input" id="a_nombre_a">
<label class="col-md-4 control-label" for="a_nombre" >Nombre.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_nombre" id="a_nombre" onKeyUp="resetea_error('a_nombre_a');" maxlength="160" value="<%=a_nombre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="a_apellidos_a"><label class="col-md-4 control-label" for="a_apellidos" >Apellidos.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_apellidos" id="a_apellidos" onKeyUp="resetea_error('a_apellidos_a');" maxlength="160" value="<%=a_apellidos%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input" id="a_email_a">
<label class="col-md-4 control-label" for="a_email" >Email.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_email" id="a_email" onKeyUp="resetea_error('a_email_a');" maxlength="160" value="<%=a_email%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_telefono" >Teléfono.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_telefono" id="a_telefono" maxlength="160" value="<%=a_telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_movil" >Móvil.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_movil" id="a_movil" onKeyUp="resetea_error('a_movil_a');" maxlength="160" value="<%=a_movil%>"><div class="form-control-focus"> </div>
<i class="fa fa-mobile" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono móvil</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_movil_sms" >Móvil SMS.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_movil_sms" id="a_movil_sms" maxlength="160" value="<%=a_movil_sms%>"><div class="form-control-focus"> </div>
<i class="fa fa-mobile" aria-hidden="true"></i><span class="help-block">teléfono móvil para envío SMS</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_nif" >NIF/NIE.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_nif" id="a_nif" maxlength="160" value="<%=a_nif%>"><div class="form-control-focus"> </div><i class="fa fa-id-badge" aria-hidden="true"></i><span class="help-block">debes introducir un NIF/NIE</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_cumple" >Fecha cumpleaños.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_cumple" id="a_cumple" maxlength="160" value="<%=a_cumple%>"><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">debes introducir una fecha dd/mm/aaaa</span></div></div></div>
<div class="form-group form-md-checkboxes"><label class="col-md-4 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-8">
<div class="md-checkbox-inline">
<div class="md-checkbox"><input name="a_permiso_medico" type="checkbox" class="md-check" id="a_permiso_medico" value="si" <%if a_permiso_medico="si"then%>checked="checked"<%end if%> onchange="" autocomplete="off"><label for="a_permiso_medico" autocomplete="off">Per. Médico </label></div>
<div class="md-checkbox"><input name="a_fuma" type="checkbox" class="md-check" id="a_fuma"  value="si" <%if a_fuma="si"then%>checked="checked"<%end if%> ><label for="a_fuma"> Fuma </label></div>
<div class="md-checkbox"><input name="a_vegetariano" type="checkbox" class="md-check" id="a_vegetariano" value="si" <%if a_vegetariano="si"then%>checked="checked"<%end if%> onchange="" autocomplete="off"><label for="a_vegetariano" autocomplete="off">Vegetariano </label></div>
<div class="md-checkbox"><input name="a_curso_ant" type="checkbox" class="md-check" id="a_curso_ant" value="si" <%if a_curso_ant="si"then%>checked="checked"<%end if%> onchange="" autocomplete="off"><label for="a_curso_ant" autocomplete="off">Curso Anterior </label></div></div></div>
</div>
</div><!--col-md-5-->
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_direccion" >Dirección.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_direccion" id="a_direccion" maxlength="160" value="<%=a_direccion%>"><div class="form-control-focus"> </div>
<i class="fa fa-street-view" aria-hidden="true"></i><span class="help-block">debes introducir una dirección</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_ciudad" >Ciudad.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_ciudad" id="a_ciudad"  maxlength="160" value="<%=a_ciudad%>"><div class="form-control-focus"> </div>
<i class="fa fa-map-marker" aria-hidden="true"></i><span class="help-block">debes introducir una ciudad</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label " for="a_provincia">Provincia.</label>
<div class="col-md-6"><div class="input-icon">
<select name="a_provincia" id="a_provincia" placeholder="Selecciona una o varias provincias" >
<option value="ALAVA" <%if instr(a_provincia,"ALAVA")then%>selected<%end if%>>ALAVA</option>
<option value="ALBACETE" <%if instr(a_provincia,"ALBACETE")then%>selected<%end if%>>ALBACETE</option>
<option value="ALICANTE" <%if instr(a_provincia,"ALICANTE")then%>selected<%end if%>>ALICANTE</option>
<option value="ALMERIA" <%if instr(a_provincia,"ALMERIA")then%>selected<%end if%>>ALMERIA</option>
<option value="ASTURIAS" <%if instr(a_provincia,"ASTURIAS")then%>selected<%end if%>>ASTURIAS</option>
<option value="AVILA" <%if instr(a_provincia,"AVILA")then%>selected<%end if%>>AVILA</option>
<option value="BADAJOZ" <%if instr(a_provincia,"BADAJOZ")then%>selected<%end if%>>BADAJOZ</option>
<option value="BARCELONA" <%if instr(a_provincia,"BARCELONA")then%>selected<%end if%>>BARCELONA</option>
<option value="BURGOS" <%if instr(a_provincia,"BURGOS")then%>selected<%end if%>>BURGOS</option>
<option value="CACERES" <%if instr(a_provincia,"CACERES")then%>selected<%end if%>>CACERES</option>
<option value="CADIZ" <%if instr(a_provincia,"CADIZ")then%>selected<%end if%>>CADIZ</option>
<option value="CANTABRIA" <%if instr(a_provincia,"CANTABRIA")then%>selected<%end if%>>CANTABRIA</option>
<option value="CASTELLON" <%if instr(a_provincia,"CASTELLON")then%>selected<%end if%>>CASTELLON</option>
<option value="CEUTA" <%if instr(a_provincia,"CEUTA")then%>selected<%end if%>>CEUTA</option>
<option value="CIUDAD REAL" <%if instr(a_provincia,"CIUDAD REAL")then%>selected<%end if%>>CIUDAD REAL</option>
<option value="CORDOBA" <%if instr(a_provincia,"CORDOBA")then%>selected<%end if%>>CORDOBA</option>
<option value="CORU&Ntilde;A, A" <%if instr(a_provincia,"CORU&Ntilde;A, A")then%>selected<%end if%>>CORU&Ntilde;A, A</option>
<option value="CUENCA" <%if instr(a_provincia,"CUENCA")then%>selected<%end if%>>CUENCA</option>
<option value="GIRONA" <%if instr(a_provincia,"GIRONA")then%>selected<%end if%>>GIRONA</option>
<option value="GRANADA" <%if instr(a_provincia,"GRANADA")then%>selected<%end if%>>GRANADA</option>
<option value="GUADALAJARA" <%if instr(a_provincia,"GUADALAJARA")then%>selected<%end if%>>GUADALAJARA</option>
<option value="GUIPUZCOA" <%if instr(a_provincia,"GUIPUZCOA")then%>selected<%end if%>>GUIPUZCOA</option>
<option value="HUELVA" <%if instr(a_provincia,"HUELVA")then%>selected<%end if%>>HUELVA</option>
<option value="HUESCA" <%if instr(a_provincia,"HUESCA")then%>selected<%end if%>>HUESCA</option>
<option value="ILLES BALEARS" <%if instr(a_provincia,"ILLES BALEARS")then%>selected<%end if%>>ILLES BALEARS</option>
<option value="JAEN" <%if instr(a_provincia,"JAEN")then%>selected<%end if%>>JAEN</option>
<option value="LEON" <%if instr(a_provincia,"LEON")then%>selected<%end if%>>LEON</option>
<option value="LLEIDA" <%if instr(a_provincia,"LLEIDA")then%>selected<%end if%>>LLEIDA</option>
<option value="LUGO" <%if instr(a_provincia,"LUGO")then%>selected<%end if%>>LUGO</option>
<option value="MADRID" <%if instr(a_provincia,"MADRID")then%>selected<%end if%>>MADRID</option>
<option value="MALAGA" <%if instr(a_provincia,"MALAGA")then%>selected<%end if%>>MALAGA</option>
<option value="MELILLA" <%if instr(a_provincia,"MELILLA")then%>selected<%end if%>>MELILLA</option>
<option value="MURCIA" <%if instr(a_provincia,"MURCIA")then%>selected<%end if%>>MURCIA</option>
<option value="NAVARRA" <%if instr(a_provincia,"NAVARRA")then%>selected<%end if%>>NAVARRA</option>
<option value="OURENSE" <%if instr(a_provincia,"OURENSE")then%>selected<%end if%>>OURENSE</option>
<option value="PALENCIA" <%if instr(a_provincia,"PALENCIA")then%>selected<%end if%>>PALENCIA</option>
<option value="PALMAS, LAS" <%if instr(a_provincia,"PALMAS, LAS")then%>selected<%end if%>>PALMAS, LAS</option>
<option value="PONTEVEDRA" <%if instr(a_provincia,"PONTEVEDRA")then%>selected<%end if%>>PONTEVEDRA</option>
<option value="RIOJA, LA" <%if instr(a_provincia,"RIOJA, LA")then%>selected<%end if%>>RIOJA, LA</option>
<option value="SALAMANCA" <%if instr(a_provincia,"SALAMANCA")then%>selected<%end if%>>SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE" <%if instr(a_provincia,"SANTA CRUZ DE TENERIFE")then%>selected<%end if%>>SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA" <%if instr(a_provincia,"SEGOVIA")then%>selected<%end if%>>SEGOVIA</option>
<option value="SEVILLA" <%if instr(a_provincia,"SEVILLA")then%>selected<%end if%>>SEVILLA</option>
<option value="SORIA" <%if instr(a_provincia,"SORIA")then%>selected<%end if%>>SORIA</option>
<option value="TARRAGONA" <%if instr(a_provincia,"TARRAGONA")then%>selected<%end if%>>TARRAGONA</option>
<option value="TERUEL" <%if instr(a_provincia,"TERUEL")then%>selected<%end if%>>TERUEL</option>
<option value="TOLEDO" <%if instr(a_provincia,"TOLEDO")then%>selected<%end if%>>TOLEDO</option>
<option value="VALENCIA" <%if instr(a_provincia,"VALENCIA")then%>selected<%end if%>>VALENCIA</option>
<option value="VALLADOLID" <%if instr(a_provincia,"VALLADOLID")then%>selected<%end if%>>VALLADOLID</option>
<option value="VIZCAYA" <%if instr(a_provincia,"VIZCAYA")then%>selsected<%end if%>>VIZCAYA</option>
<option value="ZAMORA" <%if instr(a_provincia,"ZAMORA")then%>selected<%end if%>>ZAMORA</option>
<option value="ZARAGOZA" <%if instr(a_provincia,"ZARAGOZA")then%>selected<%end if%>>ZARAGOZA</option>
<option value="OTRAS" <%if instr(a_provincia,"OTRAS")then%>selected<%end if%>>OTRAS</option></select>
<i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_pais" >País.</label>
<div class="col-md-7"><div class="input-icon" >
<select name="a_pais" id="a_pais" >
<option value='ad' <%if instr(a_pais,"ad")then%>selsected<%end if%>>Andorra</option>
<option value='ae' <%if instr(a_pais,"ae") then%>Selected<%end if%>>United Arab Emirates</option>
<option value='af' <%if instr(a_pais,"af") then%>Selected<%end if%>>Afghanistan</option>
<option value='ag' <%if instr(a_pais,"ag") then%>Selected<%end if%>>Antigua and Barbuda</option>
<option value='ai' <%if instr(a_pais,"ai") then%>Selected<%end if%>>Anguilla</option>
<option value='al' <%if instr(a_pais,"al") then%>Selected<%end if%>>Albania</option>
<option value='am' <%if instr(a_pais,"am") then%>Selected<%end if%>>Armenia</option>
<option value='an' <%if instr(a_pais,"an") then%>Selected<%end if%>>Netherlands Antilles</option>
<option value='ao' <%if instr(a_pais,"ao") then%>Selected<%end if%>>Angola</option>
<option value='aq' <%if instr(a_pais,"aq") then%>Selected<%end if%>>Antarctica</option>
<option value='ar' <%if instr(a_pais,"ar") then%>Selected<%end if%>>Argentina</option>
<option value='as' <%if instr(a_pais,"as") then%>Selected<%end if%>>American Samoa</option>
<option value='at' <%if instr(a_pais,"at") then%>Selected<%end if%>>Austria</option>
<option value='au' <%if instr(a_pais,"au") then%>Selected<%end if%>>Australia</option>
<option value='aw' <%if instr(a_pais,"aw") then%>Selected<%end if%>>Aruba</option>
<option value='ax' <%if instr(a_pais,"ax") then%>Selected<%end if%>>Aland Islands</option>
<option value='az' <%if instr(a_pais,"az") then%>Selected<%end if%>>Azerbaijan</option>
<option value='ba' <%if instr(a_pais,"ba") then%>Selected<%end if%>>Bosnia and Herzegovina</option>
<option value='bb' <%if instr(a_pais,"bb") then%>Selected<%end if%>>Barbados</option>
<option value='bd' <%if instr(a_pais,"bd") then%>Selected<%end if%>>Bangladesh</option>
<option value='be' <%if instr(a_pais,"be") then%>Selected<%end if%>>Belgium</option>
<option value='bf' <%if instr(a_pais,"bf") then%>Selected<%end if%>>Burkina Faso</option>
<option value='bg' <%if instr(a_pais,"bg") then%>Selected<%end if%>>Bulgaria</option>
<option value='bh' <%if instr(a_pais,"bh") then%>Selected<%end if%>>Bahrain</option>
<option value='bi' <%if instr(a_pais,"bi") then%>Selected<%end if%>>Burundi</option>
<option value='bj' <%if instr(a_pais,"bj") then%>Selected<%end if%>>Benin</option>
<option value='bm' <%if instr(a_pais,"bm") then%>Selected<%end if%>>Bermuda</option>
<option value='bn' <%if instr(a_pais,"bn") then%>Selected<%end if%>>Brunei Darussalam</option>
<option value='bo' <%if instr(a_pais,"bo") then%>Selected<%end if%>>Bolivia</option>
<option value='br' <%if instr(a_pais,"br") then%>Selected<%end if%>>Brazil</option>
<option value='bs' <%if instr(a_pais,"bs") then%>Selected<%end if%>>Bahamas</option>
<option value='bt' <%if instr(a_pais,"bt") then%>Selected<%end if%>>Bhutan</option>
<option value='bv' <%if instr(a_pais,"bv") then%>Selected<%end if%>>Bouvet Island</option>
<option value='bw' <%if instr(a_pais,"bw") then%>Selected<%end if%>>Botswana</option>
<option value='by' <%if instr(a_pais,"by") then%>Selected<%end if%>>Belarus</option>
<option value='bz' <%if instr(a_pais,"bz") then%>Selected<%end if%>>Belize</option>
<option value='ca' <%if instr(a_pais,"ca") then%>Selected<%end if%>>Canada</option>
<option value='cc' <%if instr(a_pais,"cc") then%>Selected<%end if%>>Cocos (Keeling) Islands</option>
<option value='cd' <%if instr(a_pais,"cd") then%>Selected<%end if%>>Democratic Republic of the Congo</option>
<option value='cf' <%if instr(a_pais,"cf") then%>Selected<%end if%>>Central African Republic</option>
<option value='cg' <%if instr(a_pais,"cg") then%>Selected<%end if%>>Congo</option>
<option value='ch' <%if instr(a_pais,"ch") then%>Selected<%end if%>>Switzerland</option>
<option value='ci' <%if instr(a_pais,"ci") then%>Selected<%end if%>>Cote D'Ivoire (Ivory Coast)</option>
<option value='ck' <%if instr(a_pais,"ck") then%>Selected<%end if%>>Cook Islands</option>
<option value='cl' <%if instr(a_pais,"cl") then%>Selected<%end if%>>Chile</option>
<option value='cm' <%if instr(a_pais,"cm") then%>Selected<%end if%>>Cameroon</option>
<option value='cn' <%if instr(a_pais,"cn") then%>Selected<%end if%>>China</option>
<option value='co' <%if instr(a_pais,"co") then%>Selected<%end if%>>Colombia</option>
<option value='cr' <%if instr(a_pais,"cr") then%>Selected<%end if%>>Costa Rica</option>
<option value='cs' <%if instr(a_pais,"cs") then%>Selected<%end if%>>Serbia and Montenegro</option>
<option value='cu' <%if instr(a_pais,"cu") then%>Selected<%end if%>>Cuba</option>
<option value='cv' <%if instr(a_pais,"cv") then%>Selected<%end if%>>Cape Verde</option>
<option value='cx' <%if instr(a_pais,"cx") then%>Selected<%end if%>>Christmas Island</option>
<option value='cy' <%if instr(a_pais,"cy") then%>Selected<%end if%>>Cyprus</option>
<option value='cz' <%if instr(a_pais,"cz") then%>Selected<%end if%>>Czech Republic</option>
<option value='de' <%if instr(a_pais,"de") then%>Selected<%end if%>>Germany</option>
<option value='dj' <%if instr(a_pais,"dj") then%>Selected<%end if%>>Djibouti</option>
<option value='dk' <%if instr(a_pais,"dk") then%>Selected<%end if%>>Denmark</option>
<option value='dm' <%if instr(a_pais,"dm") then%>Selected<%end if%>>Dominica</option>
<option value='do' <%if instr(a_pais,"do") then%>Selected<%end if%>>Dominican Republic</option>
<option value='dz' <%if instr(a_pais,"dz") then%>Selected<%end if%>>Algeria</option>
<option value='ec' <%if instr(a_pais,"ec") then%>Selected<%end if%>>Ecuador</option>
<option value='ee' <%if instr(a_pais,"ee") then%>Selected<%end if%>>Estonia</option>
<option value='eg' <%if instr(a_pais,"eg") then%>Selected<%end if%>>Egypt</option>
<option value='eh' <%if instr(a_pais,"eh") then%>Selected<%end if%>>Western Sahara</option>
<option value='er' <%if instr(a_pais,"er") then%>Selected<%end if%>>Eritrea</option>
<option value='es' <%if instr(a_pais,"es") then%>Selected<%end if%>>Espana / Spain</option>
<option value='et' <%if instr(a_pais,"et") then%>Selected<%end if%>>Ethiopia</option>
<option value='fi' <%if instr(a_pais,"fi") then%>Selected<%end if%>>Finland</option>
<option value='fj' <%if instr(a_pais,"fj") then%>Selected<%end if%>>Fiji</option>
<option value='fk' <%if instr(a_pais,"fk") then%>Selected<%end if%>>Falkland Islands (Malvinas)</option>
<option value='fm' <%if instr(a_pais,"fm") then%>Selected<%end if%>>Federated States of Micronesia</option>
<option value='fo' <%if instr(a_pais,"fo") then%>Selected<%end if%>>Faroe Islands</option>
<option value='fr' <%if instr(a_pais,"fr") then%>Selected<%end if%>>France</option>
<option value='fx' <%if instr(a_pais,"fx") then%>Selected<%end if%>>France, Metropolitan</option>
<option value='ga' <%if instr(a_pais,"ga") then%>Selected<%end if%>>Gabon</option>
<option value='gb' <%if instr(a_pais,"gb") then%>Selected<%end if%>>Great Britain (UK)</option>
<option value='gd' <%if instr(a_pais,"gd") then%>Selected<%end if%>>Grenada</option>
<option value='ge' <%if instr(a_pais,"ge") then%>Selected<%end if%>>Georgia</option>
<option value='gf' <%if instr(a_pais,"gf") then%>Selected<%end if%>>French Guiana</option>
<option value='gh' <%if instr(a_pais,"gh") then%>Selected<%end if%>>Ghana</option>
<option value='gi' <%if instr(a_pais,"gi") then%>Selected<%end if%>>Gibraltar</option>
<option value='gl' <%if instr(a_pais,"gl") then%>Selected<%end if%>>Greenland</option>
<option value='gm' <%if instr(a_pais,"gm") then%>Selected<%end if%>>Gambia</option>
<option value='gn' <%if instr(a_pais,"gn") then%>Selected<%end if%>>Guinea</option>
<option value='gp' <%if instr(a_pais,"gp") then%>Selected<%end if%>>Guadeloupe</option>
<option value='gq' <%if instr(a_pais,"gq") then%>Selected<%end if%>>Equatorial Guinea</option>
<option value='gr' <%if instr(a_pais,"gr") then%>Selected<%end if%>>Greece</option>
<option value='gs' <%if instr(a_pais,"gs") then%>Selected<%end if%>>S. Georgia and S. Sandwich Islands</option>
<option value='gt' <%if instr(a_pais,"gt") then%>Selected<%end if%>>Guatemala</option>
<option value='gu' <%if instr(a_pais,"gu") then%>Selected<%end if%>>Guam</option>
<option value='gw' <%if instr(a_pais,"gw") then%>Selected<%end if%>>Guinea-Bissau</option>
<option value='gy' <%if instr(a_pais,"gy") then%>Selected<%end if%>>Guyana</option>
<option value='hk' <%if instr(a_pais,"hk") then%>Selected<%end if%>>Hong Kong</option>
<option value='hm' <%if instr(a_pais,"hm") then%>Selected<%end if%>>Heard Island and McDonald Islands</option>
<option value='hn' <%if instr(a_pais,"hn") then%>Selected<%end if%>>Honduras</option>
<option value='hr' <%if instr(a_pais,"hr") then%>Selected<%end if%>>Croatia (Hrvatska)</option>
<option value='ht' <%if instr(a_pais,"ht") then%>Selected<%end if%>>Haiti</option>
<option value='hu' <%if instr(a_pais,"hu") then%>Selected<%end if%>>Hungary</option>
<option value='id' <%if instr(a_pais,"id") then%>Selected<%end if%>>Indonesia</option>
<option value='ie' <%if instr(a_pais,"ie") then%>Selected<%end if%>>Ireland</option>
<option value='il' <%if instr(a_pais,"il") then%>Selected<%end if%>>Israel</option>
<option value='in' <%if instr(a_pais,"in") then%>Selected<%end if%>>India</option>
<option value='io' <%if instr(a_pais,"io") then%>Selected<%end if%>>British Indian Ocean Territory</option>
<option value='iq' <%if instr(a_pais,"iq") then%>Selected<%end if%>>Iraq</option>
<option value='ir' <%if instr(a_pais,"ir") then%>Selected<%end if%>>Iran</option>
<option value='is' <%if instr(a_pais,"is") then%>Selected<%end if%>>Iceland</option>
<option value='it' <%if instr(a_pais,"it") then%>Selected<%end if%>>Italy</option>
<option value='jm' <%if instr(a_pais,"jm") then%>Selected<%end if%>>Jamaica</option>
<option value='jo' <%if instr(a_pais,"jo") then%>Selected<%end if%>>Jordan</option>
<option value='jp' <%if instr(a_pais,"jp") then%>Selected<%end if%>>Japan</option>
<option value='ke' <%if instr(a_pais,"ke") then%>Selected<%end if%>>Kenya</option>
<option value='kg' <%if instr(a_pais,"kg") then%>Selected<%end if%>>Kyrgyzstan</option>
<option value='kh' <%if instr(a_pais,"kh") then%>Selected<%end if%>>Cambodia</option>
<option value='ki' <%if instr(a_pais,"ki") then%>Selected<%end if%>>Kiribati</option>
<option value='km' <%if instr(a_pais,"km") then%>Selected<%end if%>>Comoros</option>
<option value='kn' <%if instr(a_pais,"kn") then%>Selected<%end if%>>Saint Kitts and Nevis</option>
<option value='kp' <%if instr(a_pais,"kp") then%>Selected<%end if%>>Korea (North)</option>
<option value='kr' <%if instr(a_pais,"kr") then%>Selected<%end if%>>Korea (South)</option>
<option value='kw' <%if instr(a_pais,"kw") then%>Selected<%end if%>>Kuwait</option>
<option value='ky' <%if instr(a_pais,"ky") then%>Selected<%end if%>>Cayman Islands</option>
<option value='kz' <%if instr(a_pais,"kz") then%>Selected<%end if%>>Kazakhstan</option>
<option value='la' <%if instr(a_pais,"la") then%>Selected<%end if%>>Laos</option>
<option value='lb' <%if instr(a_pais,"lb") then%>Selected<%end if%>>Lebanon</option>
<option value='lc' <%if instr(a_pais,"lc") then%>Selected<%end if%>>Saint Lucia</option>
<option value='li' <%if instr(a_pais,"li") then%>Selected<%end if%>>Liechtenstein</option>
<option value='lk' <%if instr(a_pais,"lk") then%>Selected<%end if%>>Sri Lanka</option>
<option value='lr' <%if instr(a_pais,"lr") then%>Selected<%end if%>>Liberia</option>
<option value='ls' <%if instr(a_pais,"ls") then%>Selected<%end if%>>Lesotho</option>
<option value='lt' <%if instr(a_pais,"lt") then%>Selected<%end if%>>Lithuania</option>
<option value='lu' <%if instr(a_pais,"lu") then%>Selected<%end if%>>Luxembourg</option>
<option value='lv' <%if instr(a_pais,"lv") then%>Selected<%end if%>>Latvia</option>
<option value='ly' <%if instr(a_pais,"ly") then%>Selected<%end if%>>Libya</option>
<option value='ma' <%if instr(a_pais,"ma") then%>Selected<%end if%>>Morocco</option>
<option value='mc' <%if instr(a_pais,"mc") then%>Selected<%end if%>>Monaco</option>
<option value='md' <%if instr(a_pais,"md") then%>Selected<%end if%>>Moldova</option>
<option value='mg' <%if instr(a_pais,"mg") then%>Selected<%end if%>>Madagascar</option>
<option value='mh' <%if instr(a_pais,"mh") then%>Selected<%end if%>>Marshall Islands</option>
<option value='mk' <%if instr(a_pais,"mk") then%>Selected<%end if%>>Macedonia</option>
<option value='ml' <%if instr(a_pais,"ml") then%>Selected<%end if%>>Mali</option>
<option value='mm' <%if instr(a_pais,"mm") then%>Selected<%end if%>>Myanmar</option>
<option value='mn' <%if instr(a_pais,"mn") then%>Selected<%end if%>>Mongolia</option>
<option value='mo' <%if instr(a_pais,"mo") then%>Selected<%end if%>>Macao</option>
<option value='mp' <%if instr(a_pais,"mp") then%>Selected<%end if%>>Northern Mariana Islands</option>
<option value='mq' <%if instr(a_pais,"mq") then%>Selected<%end if%>>Martinique</option>
<option value='mr' <%if instr(a_pais,"mr") then%>Selected<%end if%>>Mauritania</option>
<option value='ms' <%if instr(a_pais,"ms") then%>Selected<%end if%>>Montserrat</option>
<option value='mt' <%if instr(a_pais,"mt") then%>Selected<%end if%>>Malta</option>
<option value='mu' <%if instr(a_pais,"mu") then%>Selected<%end if%>>Mauritius</option>
<option value='mv' <%if instr(a_pais,"mv") then%>Selected<%end if%>>Maldives</option>
<option value='mw' <%if instr(a_pais,"mw") then%>Selected<%end if%>>Malawi</option>
<option value='mx' <%if instr(a_pais,"mx") then%>Selected<%end if%>>Mexico</option>
<option value='my' <%if instr(a_pais,"my") then%>Selected<%end if%>>Malaysia</option>
<option value='mz' <%if instr(a_pais,"mz") then%>Selected<%end if%>>Mozambique</option>
<option value='na' <%if instr(a_pais,"na") then%>Selected<%end if%>>Namibia</option>
<option value='nc' <%if instr(a_pais,"nc") then%>Selected<%end if%>>New Caledonia</option>
<option value='ne' <%if instr(a_pais,"ne") then%>Selected<%end if%>>Niger</option>
<option value='nf' <%if instr(a_pais,"nf") then%>Selected<%end if%>>Norfolk Island</option>
<option value='ng' <%if instr(a_pais,"ng") then%>Selected<%end if%>>Nigeria</option>
<option value='ni' <%if instr(a_pais,"ni") then%>Selected<%end if%>>Nicaragua</option>
<option value='nl' <%if instr(a_pais,"nl") then%>Selected<%end if%>>Netherlands</option>
<option value='no' <%if instr(a_pais,"no") then%>Selected<%end if%>>Norway</option>
<option value='np' <%if instr(a_pais,"np") then%>Selected<%end if%>>Nepal</option>
<option value='nr' <%if instr(a_pais,"nr") then%>Selected<%end if%>>Nauru</option>
<option value='nu' <%if instr(a_pais,"nu") then%>Selected<%end if%>>Niue</option>
<option value='nz' <%if instr(a_pais,"nz") then%>Selected<%end if%>>New Zealand (Aotearoa)</option>
<option value='om' <%if instr(a_pais,"om") then%>Selected<%end if%>>Oman</option>
<option value='pa' <%if instr(a_pais,"pa") then%>Selected<%end if%>>Panama</option>
<option value='pe' <%if instr(a_pais,"pe") then%>Selected<%end if%>>Peru</option>
<option value='pf' <%if instr(a_pais,"pf") then%>Selected<%end if%>>French Polynesia</option>
<option value='pg' <%if instr(a_pais,"pg") then%>Selected<%end if%>>Papua New Guinea</option>
<option value='ph' <%if instr(a_pais,"ph") then%>Selected<%end if%>>Philippines</option>
<option value='pk' <%if instr(a_pais,"pk") then%>Selected<%end if%>>Pakistan</option>
<option value='pl' <%if instr(a_pais,"pl") then%>Selected<%end if%>>Poland</option>
<option value='pm' <%if instr(a_pais,"pm") then%>Selected<%end if%>>Saint Pierre and Miquelon</option>
<option value='pn' <%if instr(a_pais,"pn") then%>Selected<%end if%>>Pitcairn</option>
<option value='pr' <%if instr(a_pais,"pr") then%>Selected<%end if%>>Puerto Rico</option>
<option value='ps' <%if instr(a_pais,"ps") then%>Selected<%end if%>>Palestinian Territory</option>
<option value='pt' <%if instr(a_pais,"pt") then%>Selected<%end if%>>Portugal</option>
<option value='pw' <%if instr(a_pais,"pw") then%>Selected<%end if%>>Palau</option>
<option value='py' <%if instr(a_pais,"py") then%>Selected<%end if%>>Paraguay</option>
<option value='qa' <%if instr(a_pais,"qa") then%>Selected<%end if%>>Qatar</option>
<option value='re' <%if instr(a_pais,"re") then%>Selected<%end if%>>Reunion</option>
<option value='ro' <%if instr(a_pais,"ro") then%>Selected<%end if%>>Romania</option>
<option value='ru' <%if instr(a_pais,"ru") then%>Selected<%end if%>>Russian Federation</option>
<option value='rw' <%if instr(a_pais,"rw") then%>Selected<%end if%>>Rwanda</option>
<option value='sa' <%if instr(a_pais,"sa") then%>Selected<%end if%>>Saudi Arabia</option>
<option value='sb' <%if instr(a_pais,"sb") then%>Selected<%end if%>>Solomon Islands</option>
<option value='sc' <%if instr(a_pais,"sc") then%>Selected<%end if%>>Seychelles</option>
<option value='sd' <%if instr(a_pais,"sd") then%>Selected<%end if%>>Sudan</option>
<option value='se' <%if instr(a_pais,"se") then%>Selected<%end if%>>Sweden</option>
<option value='sg' <%if instr(a_pais,"sg") then%>Selected<%end if%>>Singapore</option>
<option value='sh' <%if instr(a_pais,"sh") then%>Selected<%end if%>>Saint Helena</option>
<option value='si' <%if instr(a_pais,"si") then%>Selected<%end if%>>Slovenia</option>
<option value='sj' <%if instr(a_pais,"sj") then%>Selected<%end if%>>Svalbard and Jan Mayen</option>
<option value='sk' <%if instr(a_pais,"sk") then%>Selected<%end if%>>Slovakia</option>
<option value='sl' <%if instr(a_pais,"sl") then%>Selected<%end if%>>Sierra Leone</option>
<option value='sm' <%if instr(a_pais,"sm") then%>Selected<%end if%>>San Marino</option>
<option value='sn' <%if instr(a_pais,"sn") then%>Selected<%end if%>>Senegal</option>
<option value='so' <%if instr(a_pais,"so") then%>Selected<%end if%>>Somalia</option>
<option value='sr' <%if instr(a_pais,"sr") then%>Selected<%end if%>>Suriname</option>
<option value='st' <%if instr(a_pais,"st") then%>Selected<%end if%>>Sao Tome and Principe</option>
<option value='su' <%if instr(a_pais,"su") then%>Selected<%end if%>>USSR (former)</option>
<option value='sv' <%if instr(a_pais,"sv") then%>Selected<%end if%>>El Salvador</option>
<option value='sy' <%if instr(a_pais,"sy") then%>Selected<%end if%>>Syria</option>
<option value='sz' <%if instr(a_pais,"sz") then%>Selected<%end if%>>Swaziland</option>
<option value='tc' <%if instr(a_pais,"tc") then%>Selected<%end if%>>Turks and Caicos Islands</option>
<option value='td' <%if instr(a_pais,"td") then%>Selected<%end if%>>Chad</option>
<option value='tf' <%if instr(a_pais,"tf") then%>Selected<%end if%>>French Southern Territories</option>
<option value='tg' <%if instr(a_pais,"tg") then%>Selected<%end if%>>Togo</option>
<option value='th' <%if instr(a_pais,"th") then%>Selected<%end if%>>Thailand</option>
<option value='tj' <%if instr(a_pais,"tj") then%>Selected<%end if%>>Tajikistan</option>
<option value='tk' <%if instr(a_pais,"tk") then%>Selected<%end if%>>Tokelau</option>
<option value='tl' <%if instr(a_pais,"tl") then%>Selected<%end if%>>Timor-Leste</option>
<option value='tm' <%if instr(a_pais,"tm") then%>Selected<%end if%>>Turkmenistan</option>
<option value='tn' <%if instr(a_pais,"tn") then%>Selected<%end if%>>Tunisia</option>
<option value='to' <%if instr(a_pais,"to") then%>Selected<%end if%>>Tonga</option>
<option value='tp' <%if instr(a_pais,"tp") then%>Selected<%end if%>>East Timor</option>
<option value='tr' <%if instr(a_pais,"tr") then%>Selected<%end if%>>Turkey</option>
<option value='tt' <%if instr(a_pais,"tt") then%>Selected<%end if%>>Trinidad and Tobago</option>
<option value='tv' <%if instr(a_pais,"tv") then%>Selected<%end if%>>Tuvalu</option>
<option value='tw' <%if instr(a_pais,"tw") then%>Selected<%end if%>>Taiwan</option>
<option value='tz' <%if instr(a_pais,"tz") then%>Selected<%end if%>>Tanzania</option>
<option value='ua' <%if instr(a_pais,"ua") then%>Selected<%end if%>>Ukraine</option>
<option value='ug' <%if instr(a_pais,"ug") then%>Selected<%end if%>>Uganda</option>
<option value='uk' <%if instr(a_pais,"uk") then%>Selected<%end if%>>United Kingdom</option>
<option value='um' <%if instr(a_pais,"um") then%>Selected<%end if%>>United States Minor Outlying Islands</option>
<option value='us' <%if instr(a_pais,"us") then%>Selected<%end if%>>United States</option>
<option value='uy' <%if instr(a_pais,"uy") then%>Selected<%end if%>>Uruguay</option>
<option value='uz' <%if instr(a_pais,"uz") then%>Selected<%end if%>>Uzbekistan</option>
<option value='va' <%if instr(a_pais,"va") then%>Selected<%end if%>>Vatican City State (Holy See)</option>
<option value='vc' <%if instr(a_pais,"vc") then%>Selected<%end if%>>Saint Vincent and the Grenadines</option>
<option value='ve' <%if instr(a_pais,"ve") then%>Selected<%end if%>>Venezuela</option>
<option value='vg' <%if instr(a_pais,"vg") then%>Selected<%end if%>>Virgin Islands (British)</option>
<option value='vi' <%if instr(a_pais,"vi") then%>Selected<%end if%>>Virgin Islands (U.S.)</option>
<option value='vn' <%if instr(a_pais,"vn") then%>Selected<%end if%>>Viet Nam</option>
<option value='vu' <%if instr(a_pais,"vu") then%>Selected<%end if%>>Vanuatu</option>
<option value='wf' <%if instr(a_pais,"wf") then%>Selected<%end if%>>Wallis and Futuna</option>
<option value='ws' <%if instr(a_pais,"ws") then%>Selected<%end if%>>Samoa</option>
<option value='ye' <%if instr(a_pais,"ye") then%>Selected<%end if%>>Yemen</option>
<option value='yt' <%if instr(a_pais,"yt") then%>Selected<%end if%>>Mayotte</option>
<option value='yu' <%if instr(a_pais,"yu") then%>Selected<%end if%>>Yugoslavia (former)</option>
<option value='za' <%if instr(a_pais,"za") then%>Selected<%end if%>>South Africa</option>
<option value='zm' <%if instr(a_pais,"zm") then%>Selected<%end if%>>Zambia</option>
<option value='zr' <%if instr(a_pais,"zr") then%>Selected<%end if%>>Zaire (former)</option>
<option value='zw' <%if instr(a_pais,"zw") then%>Selected<%end if%>>Zimbabwe</option></select>
<div class="form-control-focus"> </div>
<i class="fa fa-globe" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_c_postal" >Código Postal.</label>
<div class="col-md-6">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_c_postal" id="a_c_postal" maxlength="160" value="<%=a_c_postal%>"><div class="form-control-focus"> </div><i class="fa fa-envelope-open-o" aria-hidden="true"></i><span class="help-block">debes introducir un código postal</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_pasaporte" >Pasaporte.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_pasaporte" id="a_pasaporte" maxlength="160" value="<%=a_pasaporte%>"><div class="form-control-focus"> </div><i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">debes introducir un Pasaporte</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_pas_exp" >Expedición Pasaporte.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_pas_exp" id="a_pas_exp" maxlength="160" value="<%=a_pas_exp%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-check-o" aria-hidden="true"></i><span class="help-block">expedición del Pasaporte</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_pas_cad" >Caducidad Pasaporte.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_pas_cad" id="a_pas_cad" maxlength="160" value="<%=a_pas_cad%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-times-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label " for="a_sexo">Sexo.</label>
<div class="col-md-6"><div class="input-icon">
<select name="a_sexo" id="a_sexo" style="width:100%;" >
<option value="hombre" <%if instr(a_sexo,"hombre")then%>selected<%end if%>>Hombre</option>
<option value="mujer" <%if instr(a_sexo,"mujer")then%>selected<%end if%>>Mujer</option></select>
<i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
</div><!--col-md-5-->
</div>
<!--BOTONES--><div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_op_alumno(this.form);" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%><a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
<div class="col-md-3"><div class="form-group form-md-checkboxes-inline"><div class="col-md-3"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso4" value="si"></div></div></div><label class="col-md-6 control-label" for="mail_aviso4"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>
Mail aviso.</label></div></div>
</div></div></div></div></div></div></div></form></div></div></div></div></div>
<!--DATOS FAMILIARES / OTROS DATOS--><div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled <%=tab22_2%>" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_a2"><i class="fa fa-users" style="margin-right:4px"></i> Datos Familiares  / Otros datos </a></h4></div>
<div id="acordeon_a2" class="panel-collapse collapse <%=tab2_2%>"><div class="panel-body"><div class="col-md-12"><div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="op_datos" name="op_datos" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><input name="form_op" type="hidden" value="familiares"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="cod_prog" type="hidden" value="<%=cod_prog%>">
<div class="scroller" style="height: 200px;"><div class="panel-body">
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input" id="a_p_nombre_a">
<label class="col-md-4 control-label" for="a_p_nombre" >Nombre padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_p_nombre" id="a_p_nombre"  maxlength="160" value="<%=a_p_nombre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="a_p_apellidos_a">
<label class="col-md-4 control-label" for="a_p_apellidos" >Apellidos padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_p_apellidos" id="a_p_apellidos" maxlength="160" value="<%=a_p_apellidos%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input" id="a_p_email_a">
<label class="col-md-4 control-label" for="a_p_email" >Email padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_p_email" id="a_p_email" maxlength="160" value="<%=a_p_email%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>
<div class="form-group form-md-line-input" id="a_p_telefono_a">
<label class="col-md-4 control-label" for="a_p_telefono" >Teléfono padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_p_telefono" id="a_p_telefono" maxlength="160" value="<%=a_p_telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>
<div class="form-group form-md-line-input" id="a_p_movil_a">
<label class="col-md-4 control-label" for="a_p_movil" >Móvil padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_p_movil" id="a_p_movil" maxlength="160" value="<%=a_p_movil%>"><div class="form-control-focus"> </div>
<i class="fa fa-mobile" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono móvil</span></div></div></div>
<div class="form-group form-md-line-input" id="a_p_profesion_a">
<label class="col-md-4 control-label" for="a_p_profesion" >Profesión padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_p_profesion" id="a_p_profesion" maxlength="160" value="<%=a_p_profesion%>"><div class="form-control-focus"> </div>
<i class="fa fa-wrench" aria-hidden="true"></i><span class="help-block">profesión</span></div></div></div>
</div><!--col-md-5-->
<div class="col-md-5">
<div class="form-group form-md-line-input" id="a_m_nombre_a">
<label class="col-md-4 control-label" for="a_m_nombre" >Nombre madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_m_nombre" id="a_m_nombre"  maxlength="160" value="<%=a_m_nombre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="a_p_apellidos_a">
<label class="col-md-4 control-label" for="a_m_apellidos" >Apellidos madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_m_apellidos" id="a_m_apellidos" maxlength="160" value="<%=a_m_apellidos%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input" id="a_m_email_a">
<label class="col-md-4 control-label" for="a_m_email" >Email madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_m_email" id="a_m_email" maxlength="160" value="<%=a_m_email%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>
<div class="form-group form-md-line-input" id="a_m_telefono_a">
<label class="col-md-4 control-label" for="a_m_telefono" >Teléfono madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_m_telefono" id="a_m_telefono" maxlength="160" value="<%=a_m_telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>
<div class="form-group form-md-line-input" id="a_m_movil_a">
<label class="col-md-4 control-label" for="a_m_movil" >Móvil madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_m_movil" id="a_m_movil" maxlength="160" value="<%=a_m_movil%>"><div class="form-control-focus"> </div>
<i class="fa fa-mobile" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono móvil</span></div></div></div>
<div class="form-group form-md-line-input" id="a_m_profesion_a">
<label class="col-md-4 control-label" for="a_m_profesion" >Profesión madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_m_profesion" id="a_m_profesion" maxlength="160" value="<%=a_m_profesion%>"><div class="form-control-focus"> </div>
<i class="fa fa-wrench" aria-hidden="true"></i><span class="help-block">profesión</span></div></div></div>
</div><!--col-md-5-->
</div>
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_p_nombre" >Curso anterior.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_curso_ant_org" id="a_curso_ant_org"  maxlength="160" value="<%=a_curso_ant_org%>"><div class="form-control-focus"> </div><i class="fa fa-building-o" aria-hidden="true"></i><span class="help-block">agencia</span></div></div></div>
</div>
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="a_colegio" >Colegio.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="a_colegio" id="a_colegio"  maxlength="160" value="<%=a_colegio%>"><div class="form-control-focus"> </div><i class="fa fa-building-o" aria-hidden="true"></i><span class="help-block">colegio</span></div></div></div>
</div><!--col-md-5-->
</div>
<div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px"><!--BOTONES-->
<div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12">

<div class="col-md-5">
<button type="submit" class="btn green" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
<div class="col-md-3"><div class="form-group form-md-checkboxes-inline"><div class="col-md-3"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso5" value="si"></div></div></div><label class="col-md-6 control-label" for="mail_aviso5"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>Mail aviso.</label></div></div>
</div></div></div></div></div></div></div></form></div></div></div></div></div>
<!--DOCUMENTOS--><div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled <%=tab22_4%>" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_a3"><i class="fa fa-folder-open-o" style="margin-right:4px"></i> Documentos del Alumno  </a></h4></div>
<div id="acordeon_a3" class="panel-collapse collapse <%=tab2_4%>"><div class="panel-body"><div class="col-md-12"><div class="portlet-body">
<form action="guardar_docs.asp" class="form-horizontal" id="op_documentos" name="op_documentos" method="post" enctype="multipart/form-data">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><input name="form_op" type="hidden" value="documentos"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="cod_prog" type="hidden" value="<%=cod_prog%>">
<div class="scroller" style="height: 200px;"><div class="panel-body documentos">
<div class="col-md-12 col-sm-12" >
<%Sql2= "SELECT nombre, tipo FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno= "&cod&" and alumnos_archivos.id_archivo=archivos.id_archivo and tipo='Pasaporte'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="col-md-6 col-sm-6" style="margin-top:30px;margin-bottom:20px"><div class="row static-info"><div class="col-md-12 name"><i class="fa fa-address-book-o" aria-hidden="true" style="font-size:1.5em;color:#ccc;margin-right:10px"></i> <%=ob_rs2("tipo")%> scaneado: <i class="fa fa-arrow-down" aria-hidden="true" style="color:#ccc"></i></div><div class="col-md-12 value">
<div class="col-md-12" style="margin-top:15px"><a href="../../up_docs/alu_docs/<%=ob_rs2("nombre")%>" target="_blank"> <%=ob_rs2("nombre")%></a> </div></div><div class="md-checkbox col-md-9" style="margin-top:15px;margin-left:30px"><input type="checkbox" id="del_pass" class="c-check" value="si" name="del_pass" autocomplete="off" class="md-check"><label for="del_pass"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div></div>
<%else%>
<div class="col-md-6 col-sm-6" style="margin-top:30px;margin-bottom:20px"><div class="row static-info" style="margin-bottom:25px"><div class="col-md-5 name"><i class="fa fa-id-card-o" aria-hidden="true" style="font-size:1.5em;color:#ccc;margin-right:10px"></i> Pasaporte scaneado: <i class="fa fa-arrow-right" aria-hidden="true" style="color:#ccc"></i></div><div class="col-md-7 value"><i class="fa fa-times" aria-hidden="true" style="color:#F00;font-size:2em"></i></div></div>
<div class="col-md-9" style="padding:0"><input type="file" class="filestyle" id="archivo_pass" name="archivo_pass" data-buttonName="btn-primary" ></div>
<button type="button" class="btn default" id="limpia_archivo_pass" language="javascript"><i class="fa fa-trash" aria-hidden="true"></i></button>
</div>
<%end if
ob_rs2.close%>
<%Sql2= "SELECT nombre, tipo FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno= "&cod&" and alumnos_archivos.id_archivo=archivos.id_archivo and tipo='NIF'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="col-md-6 col-sm-6" style="margin-top:30px;margin-bottom:20px"><div class="row static-info"><div class="col-md-5 name"><i class="fa fa-id-card-o" aria-hidden="true" style="font-size:1.5em;color:#ccc;margin-right:10px"></i> <%=ob_rs2("tipo")%> scaneado: <i class="fa fa-arrow-down" aria-hidden="true" style="color:#ccc"></i></div><div class="col-md-12 value"><div class="col-md-12" style="margin-top:15px"><a href="../../up_docs/alu_docs/<%=ob_rs2("nombre")%>" target="_blank"> <%=ob_rs2("nombre")%></a> </div></div><div class="md-checkbox col-md-9" style="margin-top:15px;margin-left:30px"><input type="checkbox" id="del_nif" class="c-check" value="si" name="del_nif" autocomplete="off" class="md-check"><label for="del_nif"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div></div>
<%else%>
<div class="col-md-6 col-sm-6" style="margin-top:30px;margin-bottom:20px"><div class="row static-info" style="margin-bottom:25px"><div class="col-md-5 name"><i class="fa fa-id-card-o" aria-hidden="true" style="font-size:1.5em;color:#ccc;margin-right:10px"></i> NIF scaneado: <i class="fa fa-arrow-right" aria-hidden="true" style="color:#ccc"></i></div><div class="col-md-7 value"><i class="fa fa-times" aria-hidden="true" style="color:#F00;font-size:2em"></i></div></div>
<div class="col-md-9" style="padding:0"><input type="file" class="filestyle" id="archivo_nif" name="archivo_nif" data-buttonName="btn-primary" ></div><button type="button" class="btn default" id="limpia_archivo_nif" language="javascript"><i class="fa fa-trash" aria-hidden="true"></i></button></div>
<%end if
ob_rs2.close%>
</div>
<div class="col-md-12 col-sm-12" >
</div>
<!--BOTONES--><div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12">
<div class="col-md-5">
<button type="submit" class="btn green" value="enviar datos" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
<div class="col-md-5"><div class="form-group form-md-checkboxes-inline"><div class="col-md-1"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso7" value="si"></div></div></div><label class="col-md-5 control-label" for="mail_aviso7"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>Mail aviso.</label></div></div>

</div></div></div></div></div>
</div></div></form></div></div></div></div></div>
<!--DATOS USUARIO--><div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled <%=tab22_3%>" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_a4"><i class="fa fa-user margin-right-10"></i> Datos de Usuario  </a></h4></div>
<div id="acordeon_a4" class="panel-collapse collapse <%=tab2_3%>"><div class="panel-body"><div class="col-md-12"><div class="portlet-body">
<%if (id_usuario<>"" and id_usuario<>0) or (id_usuario_cod<>0 and id_usuario_cod<>"") then%>
<table class="table table-striped table-bordered ">
<thead>
<tr style="color:#999">
<th><i class="fa fa-user-o"></i> Nombre </th>
<th style="text-align:center"><i class="fa fa-briefcase"></i> ¿Agente? </th>
<th style="text-align:center"><i class="fa fa-graduation-cap"></i> Alumnos </th>
<th><i class="fa fa-envelope"></i> Email </th>
<th style="width:50px"> </th>
</tr>
</thead>
<tbody>
<%if u_nombre<>"" then%>
<tr>
<td><%=u_nombre%>&nbsp;<%=u_apellidos%> </td>
<td style="text-align:center"><%if u_agente="si"then%><i class="fa fa-check"></i> <%end if%></td>
<td style="text-align:center"> <%if num_al_age_tmp<>"" or num_al_age_tmp<>0 then%><span style="color:#bbb">(<%=num_al_age_tmp%>)</span>&nbsp;<%end if%> <%=num_al_age%></td>
<td> <a href="mailto:<%=u_email%>"><%=u_email%></a></td>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&id_usuario))%><td><a class="btn btn-sm green" href="<%=r%>usuariosWeb/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&id_usuario)%>"> Ver datos</a></td>
</tr>
<%end if%>
<%if nom_agen_cob<>"" then%>
<tr>
<td><%=nom_agen_cob%> </td>
<td style="text-align:center"><i class="fa fa-check" style="color:#999;margin-right:4px;"></i><i class="fa fa-tag" aria-hidden="true" style="color:#999"></i></td>
<td style="text-align:center"></td>
<td><a href="mailto:<%=u_email_ag_cod%>"><%=u_email_ag_cod%></td>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=ag&ntres=ag&ncuat=&cod="&id_agente_cod))%>
<td><a class="btn btn-sm green" href="<%=r%>usuariosWeb/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=ag&ntres=ag&ncuat=&cod="&id_agente_cod)%>"> Ver datos</a></td>
</tr>
<%end if%>
</tbody>
</table>
<%else%>
<div style="width:100;text-align:center;margin-top:25px;margin-bottom:35px"><i class="fa fa-user-times" aria-hidden="true" style="font-size:2em;color:#F00"></i> Ningún usuario adjudicado</div>
<%end if%>
<form action="guardar.asp" class="form-horizontal" id="op_alumno" name="op_alumno" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>">
<input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="form_op" type="hidden" value="usuario"><input name="cod_prog" type="hidden" value="<%=cod_prog%>"><div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="id_usuario" >Cambiar usuario.</label>
<div class="col-md-4"><div class="input-icon">
<%Sql= "SELECT u_nombre, id_usuario, id_usuario, u_agente, u_apellidos, u_empresa from usuarios where u_nombre<>'' order by u_apellidos, u_nombre" 
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then%>
<select name="id_usuario" id="id_usuario" class="select-100" style="width:100%;">
<option value="" >Cambiar usuario / agente</option>
<%do while not ob_rs.eof
if ob_rs("id_usuario")=id_usuario then sel_usuario="si" end if%>
<option value="<%=ob_rs("id_usuario")%>" <%if sel_usuario="si"then%>selected<%end if%>><%=ob_rs("u_apellidos")%>&nbsp;<%=ob_rs("u_nombre")%><%if ob_rs("u_agente")="si"then%>&nbsp;(<%if ob_rs("u_empresa") <>""then%><%=ob_rs("u_empresa")%><%else%>agente<%end if%>*)<%end if%></option>
<%ob_rs.movenext
sel_usuario=""
loop%>
</select>
<%end if
ob_rs.close%><div class="form-control-focus"> </div><i class="fa fa-user-o" aria-hidden="true"></i><span class="help-block">selecciona un agente</span></div></div></div>
<div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions"><div class="row">
<div style="width:100%;max-width:750px;text-align:center;margin:0 auto;padding-left:20px">
<div class="col-md-6">
<button type="submit" class="btn green" value="enviar datos" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>alumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
<div class="col-md-5"><div class="form-group form-md-checkboxes-inline"><div class="col-md-2"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso6" value="si"></div></div></div><label class="col-md-6 control-label" for="mail_aviso6"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>Mail aviso.</label></div></div>
</div></div></div></div></div>
</form>
</div></div></div></div></div>
</div></div></div></div></div></div></div></div></div></div></div>
<!--MODALES-->
<div class="modal fade" id="last_factura" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-file-text-o " aria-hidden="true"></i>  Última factura </h4></div><div class="modal-body" style="text-align:center;color:#F00;font-size:2em"> <%=last_fac%> </div><div class="modal-footer"><button type="button" class="btn green btn-outline" data-dismiss="modal">Ok, visto</button></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div class="modal fade" id="alerta_conceptos" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más conceptos</h4></div><div class="modal-body"> No se pueden añadir más conceptos. Si necesitas más, contacta con el administrador del sistema. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div class="modal fade" id="alerta_facturas" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más facturas</h4></div><div class="modal-body"> No se puede añadir más de 1 factura antes de modificarla y guardarla.</div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<div class="modal fade" id="modal_cambioCurso" tabindex="-1" role="dialog" aria-hidden="true" ><div class="modal-dialog modal-full"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title" style="color:#09C"><i class="fa fa-exchange" aria-hidden="true"></i> Cambiar alumno de curso </h4></div><div class="modal-body" ><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap&cod_cat="&cod_cat&"&cod_prog="&cod_prog&"&cod="&cod))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto" id="cat_cam"></iframe> </div><div class="modal-footer"><button type="button" class="btn green" data-dismiss="modal">Cerrar</button></div></div></div></div>
<script>function modal_cambioCurso(){$("#modal_cambioCurso iframe" ).attr('src','<%=r%>alumnos/cambioCurso.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap&cod_cat="&cod_cat&"&cod_prog="&cod_prog&"&cod="&cod)%>');$("#modal_cambioCurso").modal();}</script>
<div class="modal fade" id="eliminarPrograma" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar este programa?<br><br>Ten en cuenta que ya no podrás recuperarlo.</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaPrograma();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarPrograma(){$('#eliminarPrograma').modal('show');}
function confirmarEliminaPrograma(){$('#eliminarPrograma').modal('hide');$('#spinner_back').show();$('#spinner').show();
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&cod_prog=<%=cod_prog%>&accion=del_prog&cod_cat=<%=cod_cat%>&check=<%=cod_prog%>&cod=<%=cod%>';}</script>
<div class="modal fade" id="eliminarAlumno" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar este alumno?<br><br>Ten en cuenta que ya no podrás recuperarlo y se eliminarán todos sus programas asociados.</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminarAlumno();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarAlumno(){$('#eliminarAlumno').modal('show');}
function confirmarEliminarAlumno(){$('#eliminarAlumno').modal('hide');$('#spinner_back').show();$('#spinner').show();
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&cod_prog=<%=cod_prog%>&accion=del_alum&cod_cat=<%=cod_cat%>&check=<%=cod_prog%>&cod=<%=cod%>';}</script>
<!--#include file="../comun/menu_inf.asp"--> 
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<script type="text/javascript" src="<%=r%>lib/js/bootstrap-filestyle.min.js"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/upload/vendor/jquery.ui.widget.js"></script><script src="<%=r%>lib/js/upload/jquery.iframe-transport.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-process.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-image.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-validate.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-ui.js"></script><!--[if (gte IE 8)&(lt IE 10)]><script src="<%=r%>lib/js/upload/cors/jquery.xdr-transport.js"></script><![endif]--><link rel="stylesheet" href="<%=r%>lib/css/upload/style.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload-ui.css"><!--<script src="<%'=r%>lib/js/upload/main.js">--></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
function ver_last_factura(){$('#last_factura').modal();}
$("#archivo_pass").filestyle('buttonText', '&nbsp;Subir Pasaporte');
$("#archivo_pass").filestyle('placeholder', 'Elegir pasaporte escaneado');
$("#archivo_nif").filestyle('buttonText', '&nbsp;Subir NIF/CIF');
$("#archivo_nif").filestyle('placeholder', 'Elegir NIF/CIF escaneado');
$("#limpia_archivo_pass").click(function() {$("#archivo_pass").filestyle('clear');});
$("#limpia_archivo_nif").click(function() {$("#archivo_nif").filestyle('clear');});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$("[name='pr_medico'],[name='con_examen'],[name='pr_cancelacion'],[name='pr_ajuste'],[name='gen_fac'],[name='a_permiso_medico'],[name='a_fuma'],[name='a_vegetariano'],[name='a_curso_ant'],[name='mail_aviso']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});})
<%for a=1 to a-1%>
//CONCEPTO
$('.inserta_concepto_<%=a%>').one('click',function(){
}).click(function(){<%if i_conceptos=0then%>var n = $('.concepto_lst_<%=a%>').length;<%else%>var n = $('.concepto_lst_<%=a%>').length + 1;<%end if%>
if( 25 < n ) {$('#alerta_conceptos').modal();return false;}
x=n;
var box_htmle = $('<div class="col-md-12 concepto_lst_<%=a%>"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_['+x+']">Concepto <span class="orden_con_<%=a%>">'+x+'</span>.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" id="concepto_['+x+']" name="concepto_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto_orden_['+x+']" id="concepto_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_pre_['+x+']">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="concepto_pre_['+x+']" id="concepto_pre_'+x+'" value="" onKeyUp="suma();"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div><div class="col-md-2"><button class="elimina_campo btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></div>');
box_htmle.hide();
$('.campos_conceptos_<%=a%> div.concepto_lst_<%=a%>:last').after(box_htmle);
box_htmle.fadeIn('slow');
return false;});
$('.campos_conceptos_<%=a%>').on('click', '.elimina_campo', function(){
if( $('.concepto_lst_<%=a%>').length >1){
$(this).closest('.concepto_lst_<%=a%>').css( 'background-color', '#32C5D2' );
$(this).closest('.concepto_lst_<%=a%>').fadeOut("slow", function() {
$(this).closest('.concepto_lst_<%=a%>').remove();suma();
$(".orden_con_<%=a%>").each(function(index){
$(this).text( index + 1 );});
});
};return false;
});
//ANTICIPOS
$('.inserta_anticipo_<%=a%>').one('click',function(){
}).click(function(){
<%if i_anticipos=0then%>var n = $('.anticipo_lst_<%=a%>').length;<%else%>var n = $('.anticipo_lst_<%=a%>').length + 1;<%end if%>
if( 25 < n ) {$('#alerta_conceptos_<%=a%>').modal();return false;}
x=n;
var box_htmle = $('<div class="col-md-12 anticipo_lst_<%=a%>"><div class="col-md-6"><div class="form-group form-md-line-input" ><label class="col-md-4 control-label" for="anticipo_['+x+']">Anticipo <span class="orden_ant_<%=a%>">'+x+'</span>.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" id="anticipo_['+x+']" name="anticipo_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto_orden_['+x+']" id="concepto_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="anticipo_pre_'+x+'">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="anticipo_pre_['+x+']" id="anticipo_pre_'+x+'" value="" onKeyUp="suma();"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div><div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="anticipo_fec_['+x+']">Fecha.</label><div class="col-md-9"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="anticipo_fec_['+x+']" id="anticipo_fec_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div></div><div class="col-md-12" style="border-bottom:1px solid #ddd;padding-bottom:10px"><div class="col-md-6"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="anticipo_estadoPago_['+x+']">Estado.</label><div class="col-md-7" ><div class="input-icon"><select name="anticipo_estadoPago_['+x+']" id="anticipo_estadoPago_['+x+']" ><option value="" Selected>Selecciona Estado</option><option value="Pendiente Transferencia" >Pendiente Transferencia</option><option value="Pendiente Pago Oficina" >Pendiente pago Oficina</option><option value="Pendiente">Pendiente Pago PayPal o Tarjeta</option><option value="Denegada">Denegada Pago PayPal o Tarjeta</option><option value="Aceptada">Operación Aceptada</option></select><i class="fa fa-clock-o" aria-hidden="true"></i></div></div></div></div><div class="col-md-6"><div class="form-group form-md-line-input col-md-10" ><label class="col-md-3 control-label" for="metodoPago_['+x+']">Método.</label><div class="col-md-8" ><div class="input-icon"><select name="metodoPago_['+x+']" id="metodoPago_['+x+']" ><%Sql2= "SELECT transferencia, tarjeta, paypal, oficina FROM metodosPago"%>\
<%Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs2.eof then%>\
<%if ob_rs2("transferencia")="si" then%><option value="pag_transferencia">Transferencia bancaria</option>\
<%end if%>\
<%if ob_rs2("tarjeta")="si" then%><option value="pag_tarjeta">Tarjeta de cr&eacute;dito</option>\
<%end if%>\
<%if ob_rs2("paypal")="si" then%><option value="pag_paypal">PayPal</option>\
<%end if%>\
<%if ob_rs2("oficina")="si" then%><option value="pag_oficina">Pago en metálico</option>\
<%end if%>\
<%end if%>\
<%ob_rs2.close%></select><i class="fa fa-money" aria-hidden="true"></i></div></div></div><div class="form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="anticipo_pag_['+x+']" id="anticipo_pag_['+x+']" class="md-check" value="si"><label for="anticipo_pag_['+x+']"><span></span><span class="check"></span><span class="box"></span> Pagado. </label></div><button class="elimina_anticipo btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></div></div></div></div>');
box_htmle.hide();
$('.campos_anticipos_<%=a%> div.anticipo_lst_<%=a%>:last').after(box_htmle);
$('select').select2({minimumResultsForSearch: -1,language: "es"})
box_htmle.fadeIn('slow');
return false;});
$('.campos_anticipos_<%=a%>').on('click', '.elimina_anticipo', function(){
if( $('.anticipo_lst_<%=a%>').length >1){
$(this).closest('.anticipo_lst_<%=a%>').css( 'background-color', '#32C5D2' );
$(this).closest('.anticipo_lst_<%=a%>').fadeOut("slow", function() {
$(this).closest('.anticipo_lst_<%=a%>').remove();suma();
$(".orden_ant_<%=a%>").each(function(index){
$(this).text( index + 1 );});
});
};return false;
});
<%next%>
$(".env_mail").click(function() {setTimeout(function(){ document.docus.submit(); }, 300)});

//SUMA
function formatea (num) {return num.toFixed(2).replace(".", ",").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")}
function suma(){
var vresult=0; 
var vresult_r=0;
vtemp1=parseFloat(document.all.precio_cur.value.replace('.','').replace(',','.') );
if(!document.all.pr_medico_pr){vtemp2=0;}else{if(isNaN(parseFloat(document.all.pr_medico_pr.value.replace('.','').replace(',','.'))) ){vtemp2=0;}else{vtemp2=parseFloat(document.all.pr_medico_pr.value.replace('.','').replace(',','.'))}}
if(!document.all.pr_examen_pr){vtemp3=0;}else{if(isNaN(parseFloat(document.all.pr_examen_pr.value.replace('.','').replace(',','.'))) ){vtemp3=0;}else{vtemp3=parseFloat(document.all.pr_examen_pr.value.replace('.','').replace(',','.'))}}
if(!document.all.tasas_aerop_pr){vtemp4=0;}else{if(isNaN(parseFloat(document.all.tasas_aerop_pr.value.replace('.','').replace(',','.'))) ){vtemp4=0;}else{vtemp4=parseFloat(document.all.tasas_aerop_pr.value.replace('.','').replace(',','.'))}}
if(!document.all.precio_alo_a){vtemp5=0;}else{if(isNaN(parseFloat(document.all.precio_alo_a.value.replace('.','').replace(',','.'))) ){vtemp5=0;}else{vtemp5=parseFloat(document.all.precio_alo_a.value.replace('.','').replace(',','.'))}}
if(!document.all.tasas_concepto){vtemp6=0;}else{if(isNaN(parseFloat(document.all.tasas_concepto.value.replace('.','').replace(',','.'))) ){vtemp6=0;}else{vtemp6=parseFloat(document.all.tasas_concepto.value.replace('.','').replace(',','.'))}}
if(!document.all.tasas_concepto){vtemp6=0;}else{if(isNaN(parseFloat(document.all.tasas_concepto.value.replace('.','').replace(',','.'))) ){vtemp6=0;}else{vtemp6=parseFloat(document.all.tasas_concepto.value.replace('.','').replace(',','.'))}}
if(!document.all.precio_sup){vtemp7=0;}else{if(isNaN(parseFloat(document.all.precio_sup.value.replace('.','').replace(',','.'))) ){vtemp7=0;}else{vtemp7=parseFloat(document.all.precio_sup.value.replace('.','').replace(',','.'));}}
if(!document.all.pr_cancelacion_pr){vtemp8=0;}else{if(isNaN(parseFloat(document.all.pr_cancelacion_pr.value.replace('.','').replace(',','.'))) ){vtemp8=0;}else{vtemp8=parseFloat(document.all.pr_cancelacion_pr.value.replace('.','').replace(',','.'))}}
if(!document.all.opcion_transfer_pr){vtemp9=0;}else{if(isNaN(parseFloat(document.all.opcion_transfer_pr.value.replace('.','').replace(',','.'))) ){vtemp9=0;}else{vtemp9=parseFloat(document.all.opcion_transfer_pr.value.replace('.','').replace(',','.'))}}
if(!document.all.pr_gestion_bill_pr){vtemp10=0;}else{if(isNaN(parseFloat(document.all.pr_gestion_bill_pr.value.replace('.','').replace(',','.'))) ){vtemp10=0;}else{vtemp10=parseFloat(document.all.pr_gestion_bill_pr.value.replace('.','').replace(',','.'))}}
if(!document.all.precio_sup_alo){vtemp11=0;}else{if(isNaN(parseFloat(document.all.precio_sup_alo.value.replace('.','').replace(',','.'))) ){vtemp11=0;}else{vtemp11=parseFloat(document.all.precio_sup_alo.value.replace('.','').replace(',','.'))}}
if(!document.all.tasas_opciones){vtemp12=0;}else{if(isNaN(parseFloat(document.all.tasas_opciones.value.replace('.','').replace(',','.'))) ){vtemp12=0;}else{vtemp12=parseFloat(document.all.tasas_opciones.value.replace('.','').replace(',','.'))}}
<%if pr_cancelacion="si" and  pr_cancelacion_pr >"0" then%>
vtemp_c= <%=replace(pr_cancelacion_pr,",",".")%>
vresult = vtemp1 + vtemp2 + vtemp3 + vtemp4 + vtemp5 + vtemp6 + vtemp7 + vtemp8 + vtemp9 + vtemp10 + vtemp11 + vtemp12 - vtemp_c
<%else%>
vresult = vtemp1 + vtemp2 + vtemp3 + vtemp4 + vtemp5 + vtemp6 + vtemp7 + vtemp8 + vtemp9 + vtemp10 + vtemp11 + vtemp12
<%end if%>
//+ CONCEPTO
v=13;
for (i = 1; i < 25; i++) {
v=v+1;
if(!document.getElementById("concepto_pre_"+i+"")){eval("vtemp"+v+"=0");}else{if(isNaN(parseFloat(document.getElementById("concepto_pre_"+i+"").value.replace('.','').replace(',','.'))) ){eval("vtemp"+v+"=0");}else{eval("vtemp"+v+"="+parseFloat(document.getElementById("concepto_pre_"+i+"").value.replace('.','').replace(',','.')))}}
vresult=vresult + eval("vtemp"+v);
};

//+ OPCIONES PROGRAMAS
v=1;
for (i = 1; i < 25; i++) {
v=v+1;
if(!document.getElementById("opp_p"+i+"")){eval("otemp"+v+"=0");}else{if(isNaN(parseFloat(document.getElementById("opp_p"+i+"").value.replace('.','').replace(',','.'))) ){eval("otemp"+v+"=0");}else{eval("otemp"+v+"="+parseFloat(document.getElementById("opp_p"+i+"").value.replace('.','').replace(',','.')))}}
vresult=vresult + eval("otemp"+v);
};


//+ OPCIONES CURSOS
v=1;
for (i = 1; i < 25; i++) {
v=v+1;
if(!document.getElementById("opc_p"+i+"")){eval("otemp"+v+"=0");}else{if(isNaN(parseFloat(document.getElementById("opc_p"+i+"").value.replace('.','').replace(',','.'))) ){eval("otemp"+v+"=0");}else{eval("otemp"+v+"="+parseFloat(document.getElementById("opc_p"+i+"").value.replace('.','').replace(',','.')))}}
vresult=vresult + eval("otemp"+v);
};


//- RESERVA
if(!document.all.precioReserva){reserva=0;}else{if(isNaN(parseFloat(document.all.precioReserva.value.replace('.','').replace(',','.'))) ){reserva=0;}else{reserva=parseFloat(document.all.precioReserva.value.replace('.','').replace(',','.'))}}
if (vresult_r==0){vresult_r=vresult}
vresult_r=vresult_r - reserva;
document.all.suma_total.value=formatea(vresult);
document.all.falta_pagar.value=formatea(vresult_r);



//- ANTICIPOS
v=1;
for (i = 1; i < 25; i++) {
v=v+1;
if(!document.getElementById("anticipo_pre_"+i+"")){ant2=0;}else{if(isNaN(parseFloat(document.getElementById("anticipo_pre_"+i+"").value.replace('.','').replace(',','.'))) ){ant2=0;}else{ant2=parseFloat(document.getElementById("anticipo_pre_"+i+"").value.replace('.','').replace(',','.'))}}
if (vresult_r==0 && ant2!=0){vresult_r=vresult}
vresult_r=vresult_r - ant2;
document.all.suma_total.value=formatea(vresult);
document.all.falta_pagar.value=formatea(vresult_r);
};
}







function a_nombre(form) {		////////////////////////////////////   COMÚN 
Ctrl = form.a_nombre;if (Ctrl.value == "") {id_txt=	"#a_nombre_a";
validatePrompt (Ctrl, "Debes introducir un nombre.",id_txt);
return (false);	
} 
else		
return (true);
}
function a_apellidos(form) {		////////////////////////////////////   COMÚN 
Ctrl = form.a_apellidos;if (Ctrl.value == "") {id_txt=	"#a_apellidos_a";
validatePrompt (Ctrl, "Debes introducir los apellidos.",id_txt);
return (false);	
} 
else		
return (true);
}
function Enviar_op_alumno (form) {if (!a_nombre(form)) return;if (!a_apellidos(form)) return;$('#spinner_back').show();	$('#spinner').show();setTimeout(function(){ document.alumno.submit(); }, 300);return;}
function validatePrompt (Ctrl, PromptStr, id_txt) {$(id_txt).addClass( "has-error" );$( ""+id_txt+" .help-block" ).removeClass( "help-block" ).addClass( "help-block-error" );$( ""+id_txt+" .form-control-focus" ).addClass( "display-hide" );$("#form_errors").removeClass( "display-hide" );$("#alerta").modal();$("#alerta_txt").text(PromptStr);return;}
function resetea_error(id_txt){$("#"+id_txt).removeClass( "has-error" );$( "#"+id_txt+" .help-block-error" ).removeClass( "help-block-error" ).addClass( "help-block" );$( "#"+id_txt+" .form-control-focus" ).removeClass( "display-hide" );$("#form_errors").fadeOut( "slow" );}
</script>