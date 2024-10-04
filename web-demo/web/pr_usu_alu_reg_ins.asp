<%rd="../"%>
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="../conex/conex.asp"-->
<!--#include file="comun/limpia.asp"-->
<%'OBTENEMOS REQUESTS
id_alumno=request("id_alumnor")
id_usuario=request("id_usuario")
if id_usuario=""then id_usuario=session("id_usuario")
id_item=request("id_item")
id_curso=request("id_curso")
alojamiento=request("alojamiento")
if alojamiento<>""then
alojamiento = Split(alojamiento, "|")
id_alo_opcion= alojamiento(0)
id_alojamiento = alojamiento(1)
end if
s_fecha=request("salida_fecha")
s_fecha=request("s_fecha")
s_mes=request("salida_mes")
id_quincena=request("id_quincena")
aero_ob=request("aero_ob")
aeropuerto=request("aeropuerto")
aeropuerto_in=request("aeropuerto")
if aeropuerto<>"" then
aeropuerto = Split(aeropuerto, "|")
id_aeropuerto= aeropuerto(0)
aeropuerto_mes = aeropuerto(1)
id_itemSubAero=aeropuerto(2)
end if
if aeropuerto_mes<>"" and IsNumeric(aeropuerto_mes) and IsNumeric(id_itemSubAero) Then
Sql= "SELECT titulo_esp, id_quincena FROM quincenas WHERE id_quincena="&aeropuerto_mes&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
aeropuerto_mes=ob_rs("titulo_esp")
id_quincena=ob_rs("id_quincena")
end if
ob_rs.close
else
s_mes=aeropuerto_mes
end if
semanas=request("semanas")
transfer=request("transfer")
pr_medico=request("pr_medico")
pr_cancelacion=request("pr_cancelacion")
tasas_aerop=request("tasas_aerop")
pr_examen=request("pr_examen")
pr_gestion_bill=request("pr_gestion_bill")
Dim opp(40),opc(40)
for i=1 to 40
opp(i)=request("opp["&i&"]") 
opc(i)=request("opc["&i&"]")
next
if id_usuario <>"" then
if id_alumno<>"" then
Sql= "SELECT * FROM alumnos_tmp WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_alumno=0
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
a_sexo=ob_rs("a_sexo")
a_nif=ob_rs("a_nif")
a_pasaporte=ob_rs("a_pasaporte")
a_pas_exp=ob_rs("a_pas_exp")
a_pas_cad=ob_rs("a_pas_cad")
a_email=ob_rs("a_email")
a_telefono=ob_rs("a_telefono")
a_movil=ob_rs("a_movil")
a_movil_sms=ob_rs("a_movil_sms")
a_direccion=ob_rs("a_direccion")
a_ciudad=ob_rs("a_ciudad")
a_c_postal=ob_rs("a_c_postal")
a_provincia=ob_rs("a_provincia")
a_pais=ob_rs("a_pais")
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
a_permiso_medico=ob_rs("a_permiso_medico")
a_vegetariano=ob_rs("a_vegetariano")
a_fuma=ob_rs("a_fuma")
a_curso_ant=ob_rs("a_curso_ant")
a_curso_ant_org=ob_rs("a_curso_ant_org")
a_talla=ob_rs("a_talla")
a_colegio=ob_rs("a_colegio")
a_conocido=ob_rs("a_conocido")
a_observaciones_curso=trim(safeSTR(request("a_observaciones_curso")))
a_cumple=ob_rs("a_cumple")
end if
ob_rs.close
Sql= "SELECT * FROM alumnos WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_alumno=ob_rs("id_alumno")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
a_sexo=ob_rs("a_sexo")
a_nif=ob_rs("a_nif")
a_pasaporte=ob_rs("a_pasaporte")
a_pas_exp=ob_rs("a_pas_exp")
a_pas_cad=ob_rs("a_pas_cad")
a_email=ob_rs("a_email")
a_telefono=ob_rs("a_telefono")
a_movil=ob_rs("a_movil")
a_movil_sms=ob_rs("a_movil_sms")
a_direccion=ob_rs("a_direccion")
a_ciudad=ob_rs("a_ciudad")
a_c_postal=ob_rs("a_c_postal")
a_provincia=ob_rs("a_provincia")
a_pais=ob_rs("a_pais")
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
a_permiso_medico=ob_rs("a_permiso_medico")
a_vegetariano=ob_rs("a_vegetariano")
a_fuma=ob_rs("a_fuma")
a_curso_ant=ob_rs("a_curso_ant")
a_curso_ant_org=ob_rs("a_curso_ant_org")
a_talla=ob_rs("a_talla")
a_colegio=ob_rs("a_colegio")
a_conocido=ob_rs("a_conocido")
a_observaciones_curso=trim(safeSTR(request("a_observaciones_curso")))
a_cumple=ob_rs("a_cumple")
if (isNull(a_p_nombre) or a_p_nombre="") and (isNull(a_m_nombre) or a_m_nombre="") then falla_dato="si" end if
if (isNull(a_p_apellidos) or a_p_apellidos="") and (isNull(a_m_apellidos) or a_m_apellidos="") then falla_dato="si" end if
if (isNull(a_p_email) or a_p_email="") and (isNull(a_m_email) or a_m_email="") then falla_dato="si" end if
if (isNull(a_p_movil) or a_p_movil="") and (isNull(a_m_movil) or a_m_movil="") then falla_dato="si" end if
end if
ob_rs.close
end if
fecha_in=date
anyo_fecha_in=year(fecha_in)%>
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<%Sql= "SELECT nifClave FROM datComunes where nifClave<>''" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nifClave=ob_rs("nifClave")
end if
ob_rs.close

if a_nif<>nifClave then

'PRIMERO VEMOS SI ESTE ALUMNO YA ESTÁ METIDO EN ALUMNOS Y ALUMNOS TMP AND id_item="&id_item&" AND year(f_inicio) = anyo_fecha_in
Sql= "SELECT id_alumno FROM alumnos_tmp WHERE  a_nif='"&a_nif&"' " 'AND a_pasaporte='"&a_pasaporte&"'trim(lcase(StrConv(a_nombre, 2, 1042))) ='"&deslimpia(a_nombre)&"' AND trim(lcase(StrConv(a_apellidos, 2, 1042))) ='"&deslimpia(a_apellidos)&"' AND
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_alumno_t=ob_rs("id_alumno")
Sql2= "SELECT id_programa FROM programas_tmp WHERE id_alumno="&id_alumno_t&" AND id_item="&id_item&" AND year(f_inicio) = '"&anyo_fecha_in&"' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
ch_nombre1="ko"
causa="pago"
end if
ob_rs2.close
end if
ob_rs.close

Sql= "SELECT id_alumno FROM alumnos WHERE a_nif='"&a_nif&"' "'AND a_pasaporte='"&a_pasaporte&"' WHERE trim(lcase(StrConv(a_nombre, 2, 1042))) ='"&deslimpia(a_nombre)&"' AND trim(lcase(StrConv(a_apellidos, 2, 1042))) ='"&deslimpia(a_apellidos)&"' AND
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_alumno_t2=ob_rs("id_alumno")
Sql2= "SELECT id_programa FROM programas WHERE id_alumno="&id_alumno_t2&" AND id_item="&id_item&" AND year(f_inicio) = '"&anyo_fecha_in&"' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
ch_nombre2="ko"
causa=""
end if
ob_rs2.close
end if
ob_rs.close
end if


'ch_nombre2=""
'ch_nombre1=""


Sql= "SELECT titulo_esp, completo, disponible, datos_familia_ob FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nom_item=ob_rs("titulo_esp")
completo_r=ob_rs("completo")
disponible_r=ob_rs("disponible")
datos_familia_ob=ob_rs("datos_familia_ob")
end if
ob_rs.close

if id_curso<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin, con_examen, disponible FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_inicio")
f_fin=ob_rs("f_fin")
con_examen=ob_rs("con_examen")
nom_curso=ob_rs("titulo_esp")
disponible_s_r=ob_rs("disponible")
end if
ob_rs.close
end if

if completo_r="" and disponible_r ="si" and disponible_s_r="si" then ' SI CURSO COMPLETO
if ch_nombre1<>"ko" or ch_nombre2<>"ko" then
'if ch_nombre1<>"ko" then
Sql2= "SELECT id_programa FROM programas_tmp WHERE id_alumno="&id_alumno&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
id_programa_t=ob_rs2("id_programa")
end if
ob_rs2.close
if id_programa_t<>""then
mySQL="DELETE FROM programasOp_tmp where id_programa =" & id_programa_t & ""
set ob_rs=Ob_Connb.execute(mySQL)
end if
if id_alumno_t<>""then
mySQL="DELETE FROM alumnos_tmp where id_alumno =" & id_alumno_t & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM programas_tmp where id_alumno =" & id_alumno_t & ""
set ob_rs=Ob_Connb.execute(mySQL)
end if
'end if

'METEMOS EN ALUMNOS_tmp
mySQL="INSERT INTO alumnos_tmp (id_alumno_r,a_nombre,a_apellidos,a_sexo,a_nif,a_pasaporte,a_pas_exp,a_pas_cad,a_email,a_cumple,a_telefono,a_movil,a_movil_sms,a_direccion,a_ciudad,a_c_postal,a_provincia,a_pais,a_p_nombre,a_p_apellidos,a_p_email,a_p_telefono,a_p_movil,a_p_profesion,a_m_nombre,a_m_apellidos,a_m_email,a_m_telefono,a_m_movil,a_m_profesion,a_permiso_medico,a_vegetariano,a_fuma,a_curso_ant,a_curso_ant_org,a_talla,a_colegio,a_conocido,fecha_in)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_alumno & ","
mySQL=mySQL & "'" & a_nombre & "',"
mySQL=mySQL & "'" & a_apellidos & "',"
mySQL=mySQL & "'" & a_sexo & "',"
mySQL=mySQL & "'" & a_nif & "',"
mySQL=mySQL & "'" & a_pasaporte & "',"
mySQL=mySQL & "'" & a_pas_exp & "',"
mySQL=mySQL & "'" & a_pas_cad & "',"
mySQL=mySQL & "'" & a_email & "',"
mySQL=mySQL & "'" & a_cumple & "',"
mySQL=mySQL & "'" & a_telefono & "',"
mySQL=mySQL & "'" & a_movil & "',"
mySQL=mySQL & "'" & a_movil_sms & "',"
mySQL=mySQL & "'" & a_direccion & "',"
mySQL=mySQL & "'" & a_ciudad & "',"
mySQL=mySQL & "'" & a_c_postal & "',"
mySQL=mySQL & "'" & a_provincia & "',"
mySQL=mySQL & "'" & a_pais & "',"
mySQL=mySQL & "'" & a_p_nombre & "',"
mySQL=mySQL & "'" & a_p_apellidos & "',"
mySQL=mySQL & "'" & a_p_email & "',"
mySQL=mySQL & "'" & a_p_telefono & "',"
mySQL=mySQL & "'" & a_p_movil & "',"
mySQL=mySQL & "'" & a_p_profesion & "',"
mySQL=mySQL & "'" & a_m_nombre & "',"
mySQL=mySQL & "'" & a_m_apellidos & "',"
mySQL=mySQL & "'" & a_m_email & "',"
mySQL=mySQL & "'" & a_m_telefono & "',"
mySQL=mySQL & "'" & a_m_movil & "',"
mySQL=mySQL & "'" & a_m_profesion & "',"
mySQL=mySQL & "'" & a_permiso_medico & "',"
mySQL=mySQL & "'" & a_vegetariano & "',"
mySQL=mySQL & "'" & a_fuma & "',"
mySQL=mySQL & "'" & a_curso_ant & "',"
mySQL=mySQL & "'" & a_curso_ant_org & "',"
mySQL=mySQL & "'" & a_talla & "',"
mySQL=mySQL & "'" & a_colegio & "',"
mySQL=mySQL & "'" & a_conocido & "',"
mySQL=mySQL & "'" & fecha_in & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_alumno) from alumnos_tmp") 
id_alumno_n = ob_rs(0)
'SACAMOS DATOS CON REQUEST OBTENIDOS

if id_itemSubAero<>""then
Sql= "SELECT f_salida, f_fin FROM itemsSubAero WHERE id_itemSubAero="&id_itemSubAero&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_salida")
f_fin=ob_rs("f_fin")' ESTO ES NUEVO MOVIDA AVILA
dias=semanas*7
if f_fin<>"01/01/1000" AND f_fin<>"" THEN f_fin=f_fin ELSE f_fin=cdate(f_inicio)+dias END IF' ESTO ES NUEVO MOVIDA AVILA
end if
ob_rs.close
else
id_itemSubAero=0
end if

if semanas<>""then
if semanas=12 then nom_semanas="Trimestre escolar." end if
if semanas=16 then nom_semanas="Cuatrimestre escolar." end if
if semanas=24 then nom_semanas="Semestre escolar." end if
if semanas=52 then nom_semanas="A&ntilde;o escolar." end if
end if

if id_quincena<>""then
Sql= "SELECT titulo_esp, f_inicio FROM quincenas WHERE id_quincena="&id_quincena&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nom_quincena=ob_rs("titulo_esp")
if f_inicio="" or f_inicio="01/01/1000" then  f_inicio=ob_rs("f_inicio") end if
if f_fin="" or f_fin="01/01/1000" then 
dias=semanas*7
f_fin=cdate(f_inicio)+dias
end if
end if
ob_rs.close
end if

if s_fecha<>"" and s_fecha<>"01/01/1000" and IsDate(s_fecha) and id_quincena="" then
f_inicio=s_fecha
dias=semanas*7
f_fin=cdate(f_inicio)+dias-1'NUEVA MOVIDA -1
end if



if semanas<>"" and id_curso <>"" then
Sql= "SELECT precio FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas="&semanas&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
precio_cur=ob_rs("precio")*fluctuacion_c
fecha_inicio_f=month(f_inicio)&"/"&day(f_inicio)&"/"&year(f_inicio)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)

Sql2= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE id_itemSub="&id_curso&" AND rel.id_suplemento<>0  AND rel.id_suplemento=preciosSUplementos.id_suplemento AND rel.id_alojamiento=0 AND((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if cdate(f_inicio)>=ob_rs2("fecha_inicio") and cdate(f_fin)<=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(f_fin) ) end if
if cdate(f_inicio)>=ob_rs2("fecha_inicio") and cdate(f_fin)>=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(ob_rs2("fecha_fin")) ) end if
if cdate(f_inicio)<=ob_rs2("fecha_inicio") and cdate(f_fin)<=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs2("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(f_inicio)<=ob_rs2("fecha_inicio") and cdate(f_fin)>=ob_rs2("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs2("fecha_inicio")) ,cdate(ob_rs2("fecha_fin")) )end if
precio_sup_dia=ob_rs2("precio")/7
precio_sup=(total_dias*precio_sup_dia)*fluctuacion_c
precio_cur=precio_cur+precio_sup
end if
ob_rs2.close

else 'SE HA ELEGID SEM EXTRA
Sql2= "SELECT precio, semanas FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas<>53 ORDER BY semanas DESC "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
precio_sem=ob_rs2("precio")
ultima_sem=ob_rs2("semanas")
end if
ob_rs2.close
Sql2= "SELECT semanas, precio FROM itemsSubSemanas, rel  WHERE id_itemSub="&id_curso&" AND itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana AND itemsSubSemanas.semanas=53 "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
precio_ext=ob_rs2("precio")
sem_extra=semanas-ultima_sem
precio_ext=precio_ext*sem_extra
precio_cur=(precio_ext+precio_sem)*fluctuacion_c
if s_fecha=""then s_fecha=f_inicio end if
fecha_inicio_f=month(s_fecha)&"/"&day(s_fecha)&"/"&year(s_fecha)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql3= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE id_itemSub="&id_curso&" AND rel.id_suplemento<>0  AND rel.id_suplemento=preciosSUplementos.id_suplemento AND rel.id_alojamiento=0 AND((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(f_fin) ) end if
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(ob_rs2("fecha_fin")) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(ob_rs3("fecha_fin")) )end if
precio_sup_dia=ob_rs3("precio")/7
precio_sup=(total_dias*precio_sup_dia)*fluctuacion_c
precio_cur=precio_cur+precio_sup
end if
ob_rs3.close
end if
ob_rs2.close
end if
ob_rs.close
end if

if id_alojamiento<>""then
Sql= "SELECT titulo_esp, tasas FROM alo_conceptos WHERE id_alojamiento="&id_alojamiento&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tasas_concepto=ob_rs("tasas")
alo_concepto=ob_rs("titulo_esp")
end if
ob_rs.close

Sql= "SELECT op_alo, precio, tasas FROM alo_opciones WHERE id_alo_opcion="&id_alo_opcion&" and op_alo<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
precio_alo=ob_rs("precio")
tasas_opciones=ob_rs("tasas")
if semanas<>""then semanas=semanas else semanas=1 end if
precio_alo=precio_alo*semanas*fluctuacion_a
Sql2= "SELECT titulo_esp FROM alo_op WHERE id_alo_op="&ob_rs("op_alo")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
alo_opcion=ob_rs2("titulo_esp")

if s_fecha<>""and s_fecha<>"01/01/1000"then f_inicio=s_fecha end if
fecha_inicio_f=month(f_inicio)&"/"&day(f_inicio)&"/"&year(f_inicio)
fecha_fin_f=month(f_fin)&"/"&day(f_fin)&"/"&year(f_fin)
Sql3= "SELECT precio, fecha_inicio, fecha_fin, preciosSuplementos.id_suplemento FROM preciosSuplementos, rel  WHERE rel.id_suplemento<>0  AND rel.id_suplemento=preciosSuplementos.id_suplemento AND rel.id_alojamiento<>0 AND rel.id_alojamiento="&id_alojamiento&" AND ((#"&fecha_inicio_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_fin_f&"# between fecha_inicio and fecha_fin) OR (#"&fecha_inicio_f&"# < fecha_inicio and #"&fecha_fin_f&"# > fecha_fin)) "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(f_fin) ) end if
if cdate(s_fecha)>=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(s_fecha) ,cdate(ob_rs3("fecha_fin")) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(s_fecha)<=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(ob_rs3("fecha_fin")) )end if
precio_sup_dia=ob_rs3("precio")/7
total_dias=total_dias+1'MOVIDA ELENA SUMAR UN DIA AL SUPLEMENTO
precio_sup_alo=(total_dias*precio_sup_dia)*fluctuacion_a
precio_alo=precio_alo+precio_sup
end if
ob_rs3.close

if tasas_concepto<>0 and tasas_concepto<>"0" then
tasas_concepto=tasas_concepto*fluctuacion_a
precio_alo=precio_alo+tasas_concepto
end if

if tasas_opciones<>0then
tasas_opciones=tasas_opciones*fluctuacion_a
precio_alo=precio_alo+tasas_opciones
end if
end if
ob_rs2.close
end if
ob_rs.close
end if

if id_aeropuerto<>""then
Sql= "SELECT ciudad FROM aeropuertos WHERE id_aeropuerto="&id_aeropuerto&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
aero_ciudad=ob_rs("ciudad")
end if
ob_rs.close
end if

if id_curso<>""then 'ESTOS SE GUARDAN EN PROGRAMAS_TMP
Sql= "SELECT pr_medico, pr_cancelacion, tasas_aerop, pr_examen, pr_gestion_bill,pr_medico_ob, pr_cancelacion_ob, tasas_aerop_ob, pr_examen_ob, pr_gestion_bill_ob FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if pr_medico="si"then
pr_medico_pr=ob_rs("pr_medico")*semanas
end if
if pr_cancelacion="si"then
pr_cancelacion_pr=ob_rs("pr_cancelacion")
end if
if tasas_aerop="si"then
tasas_aerop_pr=ob_rs("tasas_aerop")
end if
if pr_examen="si"then
pr_examen_pr=ob_rs("pr_examen")
end if
if pr_gestion_bill="si"then
pr_gestion_bill_pr=ob_rs("pr_gestion_bill")
end if
end if
ob_rs.close
end if

opciones_programa=0 'ESTOS SE GUARDAN EN PROGRAMASOP_TMP
for i=1 to 40							      		        
if opp(i)<>""  then
Sql= "SELECT opcion_esp,opcion_pre FROM itemsOp WHERE id_itemOp="&opp(i)&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_programa=opciones_programa+ob_rs("opcion_pre")
nom_opcion_prog=ob_rs("opcion_esp")
opcion_pre_prog=ob_rs("opcion_pre")
end if
ob_rs.close
end if
next

opciones_cursos=0 'ESTOS SE GUARDAN EN PROGRAMASOP_TMP
if transfer<>""then
Sql= "SELECT opcion_esp, opcion_pre FROM itemsSubOp WHERE id_itemSubOp="&transfer&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_cursos=opciones_cursos+ob_rs("opcion_pre")
nom_opcion_curso=ob_rs("opcion_esp")
opcion_pre_curso=ob_rs("opcion_pre")
end if
ob_rs.close
end if

for i=1 to 40	'ESTOS SE GUARDAN EN PROGRAMASOP_TMP						      		        
if opc(i)<>""  then
Sql= "SELECT opcion_esp, opcion_pre FROM itemsSubOp WHERE id_itemSubOp="&opc(i)&" and (transfer IS NULL or transfer='')"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_cursos=opciones_cursos+ob_rs("opcion_pre")
nom_opcion_curso=ob_rs("opcion_esp")
opcion_pre_curso=ob_rs("opcion_pre")
end if
ob_rs.close
end if
next
total_opciones=pr_medico_pr+pr_cancelacion_pr+tasas_aerop_pr+pr_examen_pr+pr_gestion_bill_pr+opciones_programa+opciones_cursos
suma_total=total_opciones+precio_cur+precio_alo
if id_quincena=""then id_quincena=0 end if
if id_alojamiento=""then id_alojamiento=0 end if
if id_alo_opcion=""then id_alo_opcion=0 end if
if id_aeropuerto=""then id_aeropuerto=0 end if
if precio_alo=""then precio_alo=0 end if
if tasas_opciones=""then tasas_opciones=0 end if
if precio_sup_alo=""then precio_sup_alo=0 end if
if pr_medico_pr=""then pr_medico_pr=0 end if
if pr_cancelacion_pr=""then pr_cancelacion_pr=0 end if
if tasas_aerop_pr=""then tasas_aerop_pr=0 end if
if pr_examen_pr=""then pr_examen_pr=0 end if
if pr_gestion_bill_pr=""then pr_gestion_bill_pr=0 end if
if suma_total=""then suma_total=0 end if
if opciones_cursos=""then opciones_cursos=0 end if
if opciones_programa=""then opciones_programa=0 end if
if total_opciones=""then total_opciones=0 end if
if precio_sup=""then precio_sup=0 end if
if f_inicio="" or f_inicio="01/01/1000" then 'f_inicio="01/01/1000"end if  ESTO SOLUCIONA PROBVLEMA DE NO METER FECHAS
anyo_plus=year(date)+1
if month(date)>10 then
f_inicio="01/07/"&anyo_plus
end if
if month(date)<7 then
f_inicio="01/07/"&year(date)
end if
end if
'METEMOS EN PROGRAMAS_TMP
if tasas_concepto=""then tasas_concepto="0" end if
mySQL="INSERT INTO programas_tmp (id_usuario,id_alumno,id_item,nom_item,id_curso,nom_curso,con_examen,f_inicio,f_fin,semanas,nom_semanas,id_quincena,nom_quincena,precio_cur,precio_sup,id_alojamiento,tasas_concepto,alo_concepto,id_alo_opcion,precio_alo,tasas_opciones,alo_opcion,precio_sup_alo,id_aeropuerto,aero_ciudad,pr_medico,pr_medico_pr,pr_cancelacion,pr_cancelacion_pr,tasas_aerop,tasas_aerop_pr,pr_examen,pr_examen_pr,pr_gestion_bill,pr_gestion_bill_pr,suma_total,factura,u_f_nombre,u_f_nif,u_f_direccion,a_observaciones_curso,opciones_cursos,opciones_programa,total_opciones,moneda,fecha_in,mail_env,bloqueada,id_itemSubAero)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "" & id_alumno_n & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "'" & nom_item & "',"
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "'" & nom_curso & "',"
mySQL=mySQL & "'" & con_examen & "',"
mySQL=mySQL & "'" & f_inicio & "',"
mySQL=mySQL & "'" & f_fin & "',"
mySQL=mySQL & "" & semanas & ","
mySQL=mySQL & "'" & nom_semanas & "',"
mySQL=mySQL & "" & id_quincena & ","
mySQL=mySQL & "'" & nom_quincena & "',"
mySQL=mySQL & "'" & precio_cur & "',"
mySQL=mySQL & "'" & precio_sup & "',"
mySQL=mySQL & "" & id_alojamiento & ","
mySQL=mySQL & "'" & tasas_concepto & "',"
mySQL=mySQL & "'" & alo_concepto & "',"
mySQL=mySQL & "" & id_alo_opcion & ","
mySQL=mySQL & "'" & precio_alo & "',"
mySQL=mySQL & "'" & tasas_opciones & "',"
mySQL=mySQL & "'" & alo_opcion & "',"
mySQL=mySQL & "'" & precio_sup_alo & "',"
mySQL=mySQL & "" & id_aeropuerto & ","
mySQL=mySQL & "'" & aero_ciudad & "',"
mySQL=mySQL & "'" & pr_medico & "',"
mySQL=mySQL & "'" & pr_medico_pr & "',"
mySQL=mySQL & "'" & pr_cancelacion & "',"
mySQL=mySQL & "'" & pr_cancelacion_pr & "',"
mySQL=mySQL & "'" & tasas_aerop & "',"
mySQL=mySQL & "'" & tasas_aerop_pr & "',"
mySQL=mySQL & "'" & pr_examen & "',"
mySQL=mySQL & "'" & pr_examen_pr & "',"
mySQL=mySQL & "'" & pr_gestion_bill & "',"
mySQL=mySQL & "'" & pr_gestion_bill_pr & "',"
mySQL=mySQL & "'" & suma_total & "',"
mySQL=mySQL & "'" & factura & "',"
mySQL=mySQL & "'" & u_f_nombre & "',"
mySQL=mySQL & "'" & u_f_nif & "',"
mySQL=mySQL & "'" & u_f_direccion & "',"
mySQL=mySQL & "'" & a_observaciones_curso & "',"
mySQL=mySQL & "'" & opciones_cursos & "',"
mySQL=mySQL & "'" & opciones_programa & "',"
mySQL=mySQL & "'" & total_opciones & "',"
mySQL=mySQL & "'" & moneda & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'no',"
mySQL=mySQL & "'si',"
mySQL=mySQL & "" & id_itemSubAero & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_programa) from programas_tmp") 
id_programa = ob_rs(0)
'METEMOS EN PROGRAMASOP_tmp
for i=1 to 40
if opp(i)<>""then
Sql= "SELECT opcion_esp,opcion_pre FROM itemsOp WHERE id_itemOp="&opp(i)&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nom_opcion_prog=ob_rs("opcion_esp")
opcion_pre_prog=ob_rs("opcion_pre")
end if
ob_rs.close
mySQL="INSERT INTO programasOp_tmp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_prog,opcion_pre_prog,id_itemOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_programa & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & id_alumno_n & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_prog & "',"
mySQL=mySQL & "'" & opcion_pre_prog & "',"
mySQL=mySQL & "" & opp(i) & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
if opc(i)<>""then
Sql= "SELECT opcion_esp, opcion_pre, transfer FROM itemsSubOp WHERE id_itemSubOp="&opc(i)&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_cursos=opciones_cursos+ob_rs("opcion_pre")
nom_opcion_curso=ob_rs("opcion_esp")
opcion_pre_curso=ob_rs("opcion_pre")
transfer=ob_rs("transfer")
end if
ob_rs.close
mySQL="INSERT INTO programasOp_tmp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_curso,opcion_pre_curso,transfer,id_itemSubOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_programa & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & id_alumno_n & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_curso & "',"
mySQL=mySQL & "'" & opcion_pre_curso & "',"
mySQL=mySQL & "'" & transfer & "',"
mySQL=mySQL & "" & opc(i) & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
next
if transfer<>""then
transfer_si="si"
Sql= "SELECT opcion_esp, opcion_pre,id_itemSubOp FROM itemsSubOp WHERE id_itemSubOp="&transfer&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
opciones_cursos=opciones_cursos+ob_rs("opcion_pre")
nom_opcion_curso=ob_rs("opcion_esp")
opcion_pre_curso=ob_rs("opcion_pre")
id_itemSubOp=ob_rs("id_itemSubOp")
end if
ob_rs.close
mySQL="INSERT INTO programasOp_tmp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_curso,opcion_pre_curso,transfer,id_itemSubOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_programa & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & id_alumno & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_curso & "',"
mySQL=mySQL & "'" & opcion_pre_curso & "',"
mySQL=mySQL & "'" & transfer_si & "',"
mySQL=mySQL & "" & id_itemSubOp & ""
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
if ch_nombre1<>"ko" then
mySQL="UPDATE alumnos_archivos_tmp SET "
mySQL=mySQL & "id_alumno = " & id_alumno_n & ","
mySQL=mySQL & "id_programa = " & id_programa & ""
mySQL=mySQL & " WHERE id_alumno = " & id_alumno & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if%>

<div class="user_in_ok"><i class="fa fa-graduation-cap" aria-hidden="true"></i><i class="fa fa-check" aria-hidden="true"></i><span>Alumno preinscrito con éxito!!</span><span>Para formalizar la reserva continua con el proceso de pago clicando en "siguiente paso"</span><i class="fa fa-arrow-right" aria-hidden="true" style="font-size:2em;color:#ddd;margin-top:15px"></i>
<%if falla_dato="si" AND datos_familia_ob="si" then%>
<div style="width:100%;margin-top:15px"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="font-size:2em;color:#F00;margin-top:15px"></i><span>Este curso requiere de datos familiares que deberás cumplimentar desde tu área de usuario</span></div>
<%end if%>
</div>
<input type="hidden" name="id_programar" value="<%=id_programa%>">
<script>activa();</script>
<%else 'ch_nombre<>"ko" si está ya metido%>
<div id="ya_registrado"><div class="user_in_ok" id="ya_registrado"><i class="fa fa-graduation-cap" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i><span style="margin-top:35px;color:#F00">Este alumno ya se encuentra preinscrito en este programa!!<%if causa="pago"then%><br /><br /><i class="fa fa-exclamation-triangle" aria-hidden="true" style="display:block"></i>Aún le falta formalizar la reserva mediante el pago de la misma. Puedes hacerlo a tavés de la zona de usuario.<script>desactiva_0();</script><%end if%></span></div>
<ul class="list-inline">
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20"  onCLick="volver_listado();"><i class="fa fa-arrow-up" aria-hidden="true" style="margin-right:8px"></i> Volver al listado </button></li></ul></div>
<%end if 'ch_nombre<>"ko"
else%>
<div class="reg_curso_completo"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Lo sentimos, el curso se encuentra COMPLETO.</div>
<%end if
else%>
*Parece que ha habido un problema con el logueo de usuario. Vuelve a introducir tus datos de acceso.
<%end if%>