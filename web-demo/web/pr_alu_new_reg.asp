<meta charset="utf-8" />
<%rd="../"%>
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="../conex/conex.asp"-->
<!--#include file="comun/limpia.asp"-->
<%function capit(thetext)'FUNCION CAPITALIZAR PALABRAS
outtext=""
intext=(lcase(thetext))
do while instr(intext," ")>0
chunk = left(intext, instr(intext," "))
outtext=outtext & " " & left(ucase(chunk),1) & right(chunk,len(chunk)-1)
intext= right(intext,len(intext)-instr(intext," "))
loop
outtext=outtext & " " & left(ucase(intext),1) & right(intext,len(intext)-1)
capit=outtext
end function 'FIN FUNCION CAPITALIZAR PALABRAS
Set Upload = Server.CreateObject("Persits.Upload.1")
'Upload.CodePage = 65001
Upload.OverwriteFiles = False
Upload.SetMaxSize 1048576	' Limit files to 1MB
Contador = Upload.Save'(Server.MapPath("..\up_docs\alu_docs\"))
'OBTENEMOS REQUESTS
id_usuario=upload.Form("id_usuario")
if id_usuario=""then id_usuario = session("id_usuario")end if
if id_usuario<>""then
id_item=upload.Form("id_item")
id_curso=upload.Form("id_curso")
alojamiento=upload.Form("alojamiento")
if alojamiento<>""then
alojamiento = Split(alojamiento, "|")
id_alo_opcion= alojamiento(0)
id_alojamiento = alojamiento(1)
end if
s_fecha=upload.Form("s_fecha")
s_mes=upload.Form("salida_mes")
id_quincena=upload.Form("id_quincena")
aero_ob=upload.Form("aero_ob")
aeropuerto=upload.Form("aeropuerto")
aeropuerto_in=upload.Form("aeropuerto")
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
semanas=upload.Form("semanas")
transfer=upload.Form("transfer")
pr_medico=upload.Form("pr_medico")
pr_cancelacion=upload.Form("pr_cancelacion")
tasas_aerop=upload.Form("tasas_aerop")
pr_examen=upload.Form("pr_examen")
pr_gestion_bill=upload.Form("pr_gestion_bill")
Dim opp(40),opc(40)
for i=1 to 40
opp(i)=upload.Form("opp["&i&"]") 
opc(i)=upload.Form("opc["&i&"]")
next
a_nombre=trim(safeSTR(upload.Form("a_nombre")))
a_apellidos=trim(safeSTR(upload.Form("a_apellidos")))
a_sexo=upload.Form("a_sexo")
a_nif=upload.Form("a_nif")
a_pasaporte=upload.Form("a_pasaporte")
a_pas_exp=upload.Form("a_pas_exp")
a_pas_cad=upload.Form("a_pas_cad")
a_email=upload.Form("a_email")
a_telefono=trim(safeSTR(upload.Form("a_telefono")))
a_movil=trim(safeSTR(upload.Form("a_movil")))
a_movil_sms=trim(safeSTR(upload.Form("a_movil_sms")))
a_direccion=trim(safeSTR(upload.Form("a_direccion")))
a_ciudad=trim(safeSTR(upload.Form("a_ciudad")))
a_c_postal=trim(safeSTR(upload.Form("a_c_postal")))
a_provincia=upload.Form("a_provincia")
a_pais=upload.Form("a_pais")
a_p_nombre=trim(safeSTR(upload.Form("a_p_nombre")))
a_p_apellidos=trim(safeSTR(upload.Form("a_p_apellidos")))
a_p_email=trim(safeSTR(upload.Form("a_p_email")))
a_p_telefono=trim(safeSTR(upload.Form("a_p_telefono")))
a_p_movil=trim(safeSTR(upload.Form("a_p_movil")))
a_p_profesion=trim(safeSTR(upload.Form("a_p_profesion")))
a_m_nombre=trim(safeSTR(upload.Form("a_m_nombre")))
a_m_apellidos=trim(safeSTR(upload.Form("a_m_apellidos")))
a_m_email=trim(safeSTR(upload.Form("a_m_email")))
a_m_telefono=trim(safeSTR(upload.Form("a_m_telefono")))
a_m_movil=trim(safeSTR(upload.Form("a_m_movil")))
a_m_profesion=trim(safeSTR(upload.Form("a_m_profesion")))
a_permiso_medico=upload.Form("a_permiso_medico")
a_vegetariano=upload.Form("a_vegetariano")
a_fuma=upload.Form("a_fuma")
a_curso_ant=upload.Form("a_curso_ant")
a_curso_ant_org=trim(safeSTR(upload.Form("a_curso_ant_org")))
a_talla=upload.Form("a_talla")
a_colegio=trim(safeSTR(upload.Form("a_colegio")))
a_conocido=upload.Form("a_conocido")
a_observaciones_curso=trim(safeSTR(upload.Form("a_observaciones_curso_n")))
a_dia=upload.Form("a_cumple_dia")
a_mes=upload.Form("a_cumple_mes")
a_ano=upload.Form("a_cumple_ano")
a_cumple=a_dia&"/"&a_mes&"/"&a_ano
a_enfermedades=upload.Form("a_enfermedades")
a_medicamentos=upload.Form("a_medicamentos")
factura=trim(safeSTR(upload.Form("factura")))
u_f_nombre=trim(safeSTR(upload.Form("u_f_nombre")))
u_f_nif=trim(safeSTR(upload.Form("u_f_nif")))
u_f_direccion=trim(safeSTR(upload.Form("u_f_direccion")))
if Not IsDate(a_cumple) then a_cumple="01/01/1000" end if
fecha_in=date
'FUNCION CAPITALIZAR PALABRAS
if a_nombre<>"" then a_nombre=trim(capit(a_nombre)) end if
if a_apellidos<>"" then a_apellidos=trim(capit(a_apellidos)) end if
if a_p_nombre<>"" then a_p_nombre=trim(capit(a_p_nombre)) end if
if a_p_apellidos<>"" then a_p_apellidos=trim(capit(a_p_apellidos)) end if
if a_m_nombre<>"" then a_m_nombre=trim(capit(a_m_nombre)) end if
if a_m_apellidos<>"" then a_m_apellidos=trim(capit(a_m_apellidos)) end if
if a_nombre<>"" then a_nombre=replace(a_nombre,"  "," ") end if
if a_apellidos<>"" then a_apellidos=replace(a_apellidos,"  "," ") end if
if a_p_nombre<>"" then a_p_nombre=replace(a_p_nombre,"  "," ") end if
if a_p_apellidos<>"" then a_p_apellidos=replace(a_p_apellidos,"  "," ") end if
if a_m_nombre<>"" then a_m_nombre=replace(a_m_nombre,"  "," ") end if
if a_m_apellidos<>"" then a_m_apellidos=replace(a_m_apellidos,"  "," ") end if
a_email=lcase(a_email)
a_p_email=lcase(a_p_email)
a_m_email=lcase(a_m_email)
a_nif=ucase(a_nif)
if u_f_nif<>""then u_f_nif=ucase(u_f_nif) end if%>
<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
<%'PRIMERO VEMOS SI ESTE ALUMNO YA ESTÁ METIDO EN ALUMNOS Y ALUMNOS TMP
Sql= "SELECT nifClave FROM datComunes where nifClave<>''" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nifClave=ob_rs("nifClave")
end if
ob_rs.close
if a_nif<>nifClave then
Sql= "SELECT a_nombre, a_apellidos, a_nif, a_pasaporte FROM alumnos_tmp WHERE  a_nif='"&a_nif&"'" 'trim(lcase(StrConv(a_nombre, 2, 1042))) ='"&deslimpia(a_nombre)&"' AND trim(lcase(StrConv(a_apellidos, 2, 1042))) ='"&deslimpia(a_apellidos)&"' AND
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
ch_nombre1="ko"
end if
ob_rs.close
Sql= "SELECT a_nombre, a_apellidos, a_nif, a_pasaporte FROM alumnos WHERE  a_nif='"&a_nif&"'" 'trim(lcase(StrConv(a_nombre, 2, 1042))) ='"&deslimpia(a_nombre)&"' AND trim(lcase(StrConv(a_apellidos, 2, 1042))) ='"&deslimpia(a_apellidos)&"' AND
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
ch_nombre2="ko"
end if
ob_rs.close
end if
'ch_nombre1=""
'ch_nombre2=""
Sql= "SELECT titulo_esp, completo, disponible FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nom_item=ob_rs("titulo_esp")
completo_r=ob_rs("completo")
disponible_r=ob_rs("disponible")
end if
ob_rs.close
if id_curso<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin, con_examen, disponible FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_inicio")
'f_fin=ob_rs("f_fin")
con_examen=ob_rs("con_examen")
nom_curso=ob_rs("titulo_esp")
disponible_s_r=ob_rs("disponible")
end if
ob_rs.close
end if
if completo_r="" and disponible_r ="si" and disponible_s_r="si" then ' SI CURSO COMPLETO
if ch_nombre1<>"ko" and ch_nombre2<>"ko" then'METEMOS EN ALUMNOS_tmp
mySQL="INSERT INTO alumnos_tmp (a_nombre,a_apellidos,a_sexo,a_nif,a_pasaporte,a_pas_exp,a_pas_cad,a_email,a_cumple,a_telefono,a_movil,a_movil_sms,a_direccion,a_ciudad,a_c_postal,a_provincia,a_pais,a_p_nombre,a_p_apellidos,a_p_email,a_p_telefono,a_p_movil,a_p_profesion,a_m_nombre,a_m_apellidos,a_m_email,a_m_telefono,a_m_movil,a_m_profesion,a_permiso_medico,a_vegetariano,a_fuma,a_curso_ant,a_curso_ant_org,a_talla,a_colegio,a_conocido,fecha_in,a_enfermedades,a_medicamentos)"
mySQL=mySQL & "VALUES ("
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
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & a_enfermedades & "',"
mySQL=mySQL & "'" & a_medicamentos & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_alumno) from alumnos_tmp") 
id_alumno = ob_rs(0)
'SACAMOS DATOS CON REQUEST OBTENIDOS
Sql= "SELECT titulo_esp FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nom_item=ob_rs("titulo_esp")
end if
ob_rs.close
if id_curso<>""then
Sql= "SELECT titulo_esp, f_inicio, f_fin, con_examen FROM itemsSub WHERE id_itemSub="&id_curso&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
f_inicio=ob_rs("f_inicio")
'f_fin=ob_rs("f_fin")
con_examen=ob_rs("con_examen")
nom_curso=ob_rs("titulo_esp")
end if
ob_rs.close
end if
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
Sql= "SELECT titulo_esp, f_inicio, f_fin FROM quincenas WHERE id_quincena="&id_quincena&""
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
f_fin=cdate(f_inicio)+dias-1'(-1 NUEVA MOVIDA )
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
if cdate(f_inicio)>=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(f_fin) ) end if
if cdate(f_inicio)>=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(f_inicio) ,cdate(ob_rs3("fecha_fin")) ) end if
if cdate(f_inicio)<=ob_rs3("fecha_inicio") and cdate(f_fin)<=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(f_fin) ) end if
if cdate(f_inicio)<=ob_rs3("fecha_inicio") and cdate(f_fin)>=ob_rs3("fecha_fin") then total_dias=DateDiff("d",cdate(ob_rs3("fecha_inicio")) ,cdate(ob_rs3("fecha_fin")) )end if
precio_sup_dia=ob_rs3("precio")/7
total_dias=total_dias+1'MOVIDA ELENA SUMAR UN DIA AL SUPLEMENTO
precio_sup_alo=(total_dias*precio_sup_dia)*fluctuacion_a
precio_alo=precio_alo+precio_sup_alo
end if
ob_rs3.close
if tasas_concepto<>0then
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
if precio_sup=""then precio_sup=0 end if
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
if tasas_concepto=""then tasas_concepto="0" end if
'METEMOS EN PROGRAMAS_TMP
if f_inicio="" or f_inicio="01/01/1000" then 'f_inicio="01/01/1000"end if   ESTO SOLUCIONA PROBVLEMA DE NO METER FECHAS
anyo_plus=year(date)+1
if month(date)>10 then
f_inicio="01/07/"&anyo_plus
end if
if month(date)<7 then
f_inicio="01/07/"&year(date)
end if
end if
if f_fin="" then f_fin="01/01/1000"end if
mySQL="INSERT INTO programas_tmp (id_usuario,id_alumno,id_item,nom_item,id_curso,nom_curso,con_examen,f_inicio,f_fin,semanas,nom_semanas,id_quincena,nom_quincena,precio_cur,precio_sup,id_alojamiento,tasas_concepto,alo_concepto,id_alo_opcion,precio_alo,tasas_opciones,alo_opcion,precio_sup_alo,id_aeropuerto,aero_ciudad,pr_medico,pr_medico_pr,pr_cancelacion,pr_cancelacion_pr,tasas_aerop,tasas_aerop_pr,pr_examen,pr_examen_pr,pr_gestion_bill,pr_gestion_bill_pr,suma_total,factura,u_f_nombre,u_f_nif,u_f_direccion,a_observaciones_curso,opciones_cursos,opciones_programa,total_opciones,moneda,fecha_in,mail_env,bloqueada,id_itemSubAero,s_mes)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "" & id_alumno & ","
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
mySQL=mySQL & "" & id_itemSubAero & ","
mySQL=mySQL & "'" & s_mes & "'"
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
mySQL=mySQL & "" & id_alumno & ","
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
opcion_pre_curso=ob_rs("opcion_pre")'transfer=ob_rs("transfer")
end if
ob_rs.close
mySQL="INSERT INTO programasOp_tmp (id_programa,id_item,id_curso,id_alumno,id_usuario,nom_opcion_curso,opcion_pre_curso,id_itemSubOp)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_programa & ","
mySQL=mySQL & "" & id_item & ","
mySQL=mySQL & "" & id_curso & ","
mySQL=mySQL & "" & id_alumno & ","
mySQL=mySQL & "" & id_usuario & ","
mySQL=mySQL & "'" & nom_opcion_curso & "',"
mySQL=mySQL & "'" & opcion_pre_curso & "',"
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
function limpia_url(cadena_url)
'nombre_lk = server.HTMLEncode(cadena_url)
nombre_lk = cadena_url
s1 = "ÁÀÉÈÍÏÓÒÚÜáàèéíïóòúüÑñ"
s2 = "AAEEIIOOUUaaeeiioouuNn"
if len(nombre_lk) <> 0 then
For i2 = 1 to Len(s1)
nombre_lk = replace(nombre_lk,mid(s1,i2,1),mid(s2,i2,1))
nombre_lk = replace(nombre_lk, " · ","-")
nombre_lk = replace(nombre_lk, " - ","-")
nombre_lk = replace(nombre_lk, " ","-")
nombre_lk = replace(nombre_lk, "&#241;","n")
nombre_lk = replace(nombre_lk, "&#209;","n")
nombre_lk = replace( nombre_lk, chr(39), "" )  '
nombre_lk = replace( nombre_lk, "&#39;", "" ) 
nombre_lk = replace(nombre_lk, "-/-","-")
nombre_lk = replace(nombre_lk, "/","-")
nombre_lk = replace(nombre_lk, ".","-")
nombre_lk = replace( nombre_lk, "´", "" ) '"
nombre_lk = replace( nombre_lk, "&aacute;", "a" ) '"
nombre_lk = replace( nombre_lk, "&eacute;", "e" ) '"
nombre_lk = replace( nombre_lk, "&iacute;", "i" ) '"
nombre_lk = replace( nombre_lk, "&oacute;", "o" ) '"
nombre_lk = replace( nombre_lk, "&uacute;", "u" ) '"
nombre_lk = replace( nombre_lk, "&Aacute;", "A" ) '"
nombre_lk = replace( nombre_lk, "&Eacute;", "E" ) '"
nombre_lk = replace( nombre_lk, "&Iacute;", "I" ) '"
nombre_lk = replace( nombre_lk, "&Oacute;", "O" ) '"
nombre_lk = replace( nombre_lk, "&Uacute;", "U" ) '"
nombre_lk = replace( nombre_lk, "&ntilde;", "n" ) '"
nombre_lk = replace( nombre_lk, "&Ntilde;", "N" ) '"
nombre_lk = replace( nombre_lk, "&#96;", "" ) '"
nombre_lk = replace( nombre_lk, "&agrave;", "a" ) '"
nombre_lk = replace( nombre_lk, "&egrave;", "e" ) '"
nombre_lk = replace( nombre_lk, "igrave;", "i" ) '"
nombre_lk = replace( nombre_lk, "&ograve;", "o" ) '"
nombre_lk = replace( nombre_lk, "&ugrave;", "u" ) '"
nombre_lk = replace( nombre_lk, "&uuml;", "u" ) '"
nombre_lk = replace( nombre_lk, "&Uuml;", "U" ) '"
output = replace( output, "&ccedil", "c" ) '?
output = replace( output, "&Ccedil;", "C" ) '?
nombre_lk = replace( nombre_lk, "´", "" ) '"
nombre_lk = replace( nombre_lk, "á", "a" ) '"
nombre_lk = replace( nombre_lk, "é", "e" ) '"
nombre_lk = replace( nombre_lk, "í", "i" ) '"
nombre_lk = replace( nombre_lk, "ó", "o" ) '"
nombre_lk = replace( nombre_lk, "ú", "u" ) '"
nombre_lk = replace( nombre_lk, "Á", "A" ) '"
nombre_lk = replace( nombre_lk, "É", "E" ) '"
nombre_lk = replace( nombre_lk, "Í", "I" ) '"
nombre_lk = replace( nombre_lk, "Ó", "O" ) '"
nombre_lk = replace( nombre_lk, "Ú", "U" ) '"
nombre_lk = replace( nombre_lk, "ñ", "n" ) '"
nombre_lk = replace( nombre_lk, "Ñ", "N" ) '"
nombre_lk = replace( nombre_lk, "`", "" ) '"
nombre_lk = replace( nombre_lk, "à", "a" ) '"
nombre_lk = replace( nombre_lk, "è", "e" ) '"
nombre_lk = replace( nombre_lk, "ì", "i" ) '"
nombre_lk = replace( nombre_lk, "ò", "o" ) '"
nombre_lk = replace( nombre_lk, "ù", "u" ) '"
nombre_lk = replace( nombre_lk, "ü", "u" ) '"
nombre_lk = replace( nombre_lk, "Ü", "U" ) '"
nombre_lk = replace( nombre_lk, "ö", "o" ) '"
nombre_lk = replace( nombre_lk, "Ö", "O" ) '"
nombre_lk = replace( nombre_lk, "¿", "" ) '"
output = replace( output, "ç", "c" ) '?
output = replace( output, "Ç", "c" ) '?
nombre_lk = replace( nombre_lk, "&iquest;", "" ) '"
nombre_lk = replace( nombre_lk, "?", "" ) '"
nombre_lk = replace( nombre_lk, "&#34;", chr(34) ) '"
nombre_lk = replace( nombre_lk, chr(34), "" ) '"
nombre_lk = replace( nombre_lk, chr(63), "" ) '?
nombre_lk = replace(nombre_lk, "&","y")
nombre_lk = replace(nombre_lk, "&amp;","y")
nombre_lk = lcase(nombre_lk)
next
end if
limpia_url=nombre_lk
end function
For Each File in Upload.Files'METEMOS EN ARCHIVOS_tmp
arch_nombre=File.Name
if arch_nombre="a_pass_adj[]"then tipo="Pasaporte" end if
if arch_nombre="a_nif_adj[]"then tipo="NIF" end if
nombre=limpia_url(File.FileName)
File.SaveAs  Server.MapPath("..\up_docs\alu_docs\doc-\") & nombre  & id_programa & File.ext 'NO ENTIENDO PQ SE RENOMBRA CON ALUPACKS!!!
nombre=File.FileName
arch_extension=File.Ext
arch_peso=File.Size
if alto=""then alto=0 end if
if ancho=""then ancho=0 end if
mySQL="INSERT INTO archivos_tmp (nombre,tipo,alto,ancho,peso,extension)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & nombre & "',"
mySQL=mySQL & "'" & tipo & "',"
mySQL=mySQL & "" & alto & ","
mySQL=mySQL & "" & ancho & ","
mySQL=mySQL & "" & arch_peso & ","
mySQL=mySQL & "'" & arch_extension & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_archivo) from archivos_tmp") 
id_archivo = ob_rs(0)
mySQL="INSERT INTO alumnos_archivos_tmp (id_alumno,id_archivo,id_programa,fecha_in)"'METEMOS EN ALUMNOS_ARCHIVOS_tmp
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "" & id_alumno & ","
mySQL=mySQL & "" & id_archivo & ","
mySQL=mySQL & "" & id_programa & ","
mySQL=mySQL & "'" & fecha_in & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
Next%>
<input id="id_programa" name="id_programa" value="<%=id_programa%>" type="hidden">
<input id="id_alumno" name="id_alumno" value="<%=id_alumno%>" type="hidden">
<div class="col-md-12 alu_new_res">
<div class="user_in_ok"><i class="fa fa-graduation-cap" aria-hidden="true"></i><i class="fa fa-check" aria-hidden="true"></i><span>Alumno preinscrito con éxito!!</span><span>Para formalizar la reserva continua con el proceso de pago clicando en "siguiente paso"</span><i class="fa fa-arrow-right" aria-hidden="true" style="font-size:2em;color:#ddd;margin-top:15px;display:block"></i>
</div>
</div>
<script>dis_boton_preins();activa();desactiva3();desactiva4();</script>
<%else 'ch_nombre<>"ko"%>
<div class="col-md-12 alu_new_res">
<div class="user_in_ok"><i class="fa fa-graduation-cap" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i><span style="margin-top:35px;color:#F00">Este alumno ya se encuentra registrado!!<br /><br /><i class="fa fa-exclamation-triangle" aria-hidden="true" style="display:block"></i>Debes preinscribirlo con el usuario asociado.</span></div>
</div>
<%end if 'ch_nombre<>"ko"
else%>
<div class="reg_curso_completo"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Lo sentimos, el curso se encuentra COMPLETO.</div>
<%end if%>
<ul class="list-inline alu_new_res" style="text-align:left;"><li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20"  onCLick="ver_datos_alumno();" style="float:left;"><i class="fa fa-eye" aria-hidden="true" style="margin-right:8px"></i> Ver datos alumno <i class="fa fa-arrow-left" aria-hidden="true" style="margin-left:8px"></i></button></li></ul>
<%else 'IF ID_USUARIO%>
Parece que algo ha ido mal con el loguo de usuario. Por favor, vuelve a loguearte.
<%end if%>