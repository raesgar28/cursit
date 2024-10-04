<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<div class="page-content-container">
<%id_agente=request("id_agente")
If IsNumeric(id_agente) Then id_agente=id_agente else id_agente=0 end if
id_usuario=request("id_usuario")
If IsNumeric(id_usuario) Then id_usuario=id_usuario else id_usuario=0 end if
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
falta_pagar=request("falta_pagar")
If IsNumeric(falta_pagar) Then falta_pagar=replace(falta_pagar,".","") else falta_pagar=0 end if
precioReserva=request("precioReserva")
If IsNumeric(precioReserva) Then precioReserva=replace(precioReserva,".","") else precioReserva=0 end if
n_factura=request("n_factura")
gen_factura=request("gen_factura")
pagado=request("pagado")
if pagado="si"then estadoPago="Aceptada"end if
ob_escuela=safeSTR2(request("ob_escuela"))
ob_interna=safeSTR(request("ob_interna"))
'CHEQUEAMOS QUE ALUMNO NO ESTE YA EN PROGRAMA PARA ESTE AÑO 
Sql= "SELECT id_alumno, f_inicio, id_item FROM programas_tmp WHERE id_programa="&cod&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_alumno_t2=ob_rs("id_alumno")
f_inicio=ob_rs("f_inicio")
anyo_fecha_in=year(f_inicio)
id_item=ob_rs("id_item")
Sql2= "SELECT a_nif FROM alumnos_tmp WHERE id_alumno="&id_alumno_t2&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
a_nif=ob_rs2("a_nif")
end if
ob_rs2.close
end if
ob_rs.close
'SACAR ID_CXATEGORIA Y NOMBRE CAT Y METER EN PROGRAMAS | Y DESTINO | Y SECCION | Y SUBSECCION
if id_item<>"" then
Sql= "SELECT categorias.id_categoria, titulo_esp, titulo_crm_esp FROM rel, categorias WHERE id_item="&id_item&" AND rel.id_categoria=categorias.id_categoria"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_categoria=ob_rs("id_categoria")
nom_categoria=ob_rs("titulo_esp")
end if
ob_rs.close
Sql= "SELECT rel.id_destino, titulo_esp FROM rel, destinos WHERE id_item="&id_item&" AND rel.id_destino=destinos.id_destino and rel.id_destino<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_destino=ob_rs("id_destino")
nom_destino=ob_rs("titulo_esp")
end if
ob_rs.close
Sql= "SELECT rel.id_seccion FROM rel, secciones WHERE id_item="&id_item&" AND rel.id_seccion=secciones.id_seccion and rel.id_seccion<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
do while not ob_rs.eof
id_seccion=ob_rs("id_seccion")
seccion=seccion &id_seccion&","
ob_rs.movenext
loop
seccion=seccion&"0"
end if
ob_rs.close
Sql2= "SELECT pr_reserva, titulo_esp,gen_mail FROM items WHERE id_item="&id_item&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
gen_mail=ob_rs2("gen_mail")
end if
ob_rs2.close
Sql= "SELECT rel.id_subseccion FROM rel, subsecciones WHERE id_item="&id_item&" AND rel.id_subseccion=subsecciones.id_subseccion and rel.id_subseccion<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
do while not ob_rs.eof
id_subseccion=ob_rs("id_subseccion")
subseccion=subseccion &id_subseccion&","
ob_rs.movenext
loop
subseccion=subseccion&"0"
end if
ob_rs.close
end if
Sql= "SELECT nifClave FROM datComunes where nifClave<>''" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nifClave=ob_rs("nifClave")
end if
ob_rs.close
Sql2= "SELECT id_alumno FROM alumnos WHERE a_nif='"&a_nif&"' and a_nif<>'"&nifClave&"'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
id_alumno_t3=ob_rs2("id_alumno")
end if
ob_rs2.close
if id_alumno_t3<>"" and id_item<>"" then
Sql2= "SELECT id_programa FROM programas WHERE id_alumno="&id_alumno_t3&" AND id_item="&id_item&" AND year(f_inicio) = '"&anyo_fecha_in&"' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi))
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ko&edi="&edi) 
end if
ob_rs2.close
end if
if id_alumno_t2<>""then 
'METEMOS DATOS EN PROGRAMAS
Ob_Connb.execute "INSERT INTO programas (id_usuario,id_alumno,id_item,nom_item,id_curso,nom_curso,con_examen,f_inicio,f_fin,semanas,nom_semanas,id_quincena,nom_quincena,precio_cur,precio_sup,id_alojamiento,tasas_concepto,alo_concepto,id_alo_opcion,precio_alo,tasas_opciones,alo_opcion,precio_sup_alo,id_aeropuerto,aero_ciudad,pr_medico,pr_medico_pr,pr_cancelacion,pr_cancelacion_pr,tasas_aerop,tasas_aerop_pr,pr_examen,pr_examen_pr,pr_gestion_bill,pr_gestion_bill_pr,suma_total,factura,u_f_nombre,u_f_nif,u_f_direccion,a_observaciones_curso,opciones_cursos,opciones_programa,total_opciones,moneda,fecha_in,refPago,estadoPago,refPresupuesto,fechaPago,precioReserva,refPagoPay,id_agente,id_escuela,ob_escuela,ob_interna,f_inicio_esc,f_fin_esc,metodoPago,id_itemSubAero,s_mes,gen_fac,suma_total_p,cod_descuento,id_agente_cod,duracion,tipo_cambio) SELECT id_usuario,id_alumno,id_item,nom_item,id_curso,nom_curso,con_examen,f_inicio,f_fin,semanas,nom_semanas,id_quincena,nom_quincena,precio_cur,precio_sup,id_alojamiento,tasas_concepto,alo_concepto,id_alo_opcion,precio_alo,tasas_opciones,alo_opcion,precio_sup_alo,id_aeropuerto,aero_ciudad,pr_medico,pr_medico_pr,pr_cancelacion,pr_cancelacion_pr,tasas_aerop,tasas_aerop_pr,pr_examen,pr_examen_pr,pr_gestion_bill,pr_gestion_bill_pr,suma_total,factura,u_f_nombre,u_f_nif,u_f_direccion,a_observaciones_curso,opciones_cursos,opciones_programa,total_opciones,moneda,fecha_in,refPago,estadoPago,refPresupuesto,fechaPago,precioReserva,refPagoPay,id_agente,id_escuela,ob_escuela,ob_interna,f_inicio_esc,f_fin_esc,metodoPago,id_itemSubAero,s_mes,gen_factura,suma_total_p,cod_descuento,id_agente_cod,duracion,tipo_cambio FROM programas_tmp WHERE id_programa = "&cod&" "
set ob_rs=Ob_Connb.execute("select MAX(id_programa) from programas")
id_programa = ob_rs(0)

'UPDATEAMOS FACTURA
if gen_factura="si" and n_factura<>""then
Sql= "SELECT n_factura FROM programas WHERE n_factura='"&n_factura&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
dup_factura="si"
else
	Sql2= "SELECT n_factura FROM facturas WHERE n_factura='"&n_factura&"'"
	Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
	Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
	if not ob_rs2.eof then 
	dup_factura="si"
	mySQL="UPDATE programas SET "
	mySQL=mySQL & "gen_fac = ''"
	mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
	set ob_rs3=Ob_Connb.execute(mySQL)
	else
	mySQL="UPDATE programas SET "
	mySQL=mySQL & "n_factura = '" & n_factura & "',"
	mySQL=mySQL & "gen_fac = '" & gen_factura & "'"
	mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
	set ob_rs3=Ob_Connb.execute(mySQL)
	end if
	ob_rs2.close
end if
ob_rs.close
end if
'UPDATEAMOS CATEGORIA Y DESTINOS
if id_categoria<>""then
mySQL="UPDATE programas SET "
mySQL=mySQL & "id_categoria = '" & id_categoria & "',"
mySQL=mySQL & "id_seccion = '" & seccion & "',"
mySQL=mySQL & "id_subseccion = '" & subseccion & "',"
mySQL=mySQL & "nom_categoria = '" & nom_categoria & "',"
mySQL=mySQL & "id_destino = '" & id_destino & "',"
mySQL=mySQL & "nom_destino = '" & nom_destino & "'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
'UPDATEAMOS ESTADO PAGO
if pagado="si" then
fechaPago=date
mySQL="UPDATE programas SET "
mySQL=mySQL & "estadoPago = '" & estadoPago & "',"
mySQL=mySQL & "fechaPago = '" & fechaPago & "'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if
'UPDATEAMOS FALTA PAGAR
if falta_pagar<>0 then
mySQL="UPDATE programas SET "
mySQL=mySQL & "falta_pagar = '" & falta_pagar & "'"
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if


'CONCEPTOS DE PROGRAMA
Sql= "SELECT id_programa FROM programasOpAdd_tmp WHERE id_programa="&cod&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
Ob_Connb.execute "INSERT INTO programasOpAdd (id_programa,concepto,precio,fecha) SELECT id_programa,concepto,precio,fecha FROM programasOpAdd_tmp WHERE id_programa = "&cod&" "
'UPDATEAMOS CON NUEVO ID PROGRAMA
mySQL2="UPDATE programasOpAdd SET "
mySQL2=mySQL2 & "id_programa = '" & id_programa & "'"
mySQL2=mySQL2 & " WHERE id_programa = " & cod & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if
ob_rs.close

'OPCIONES DE PROGRAMA
Sql= "SELECT id_programaOp FROM programasOp_tmp WHERE id_programa="&cod&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
Ob_Connb.execute "INSERT INTO programasOp (id_programa,nom_opcion_curso,opcion_pre_curso,transfer,id_item,id_curso,id_alumno,id_usuario,nom_opcion_prog,opcion_pre_prog,id_itemOp,id_itemSubOp) SELECT id_programa,nom_opcion_curso,opcion_pre_curso,transfer,id_item,id_curso,id_alumno,id_usuario,nom_opcion_prog,opcion_pre_prog,id_itemOp,id_itemSubOp FROM programasOp_tmp WHERE id_programa = "&cod&" "
'UPDATEAMOS CON NUEVO ID PROGRAMA
mySQL2="UPDATE programasOp SET "
mySQL2=mySQL2 & "id_programa = '" & id_programa & "'"
mySQL2=mySQL2 & " WHERE id_programa = " & cod & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if
ob_rs.close

'METEMOS O MODIFICAMOS ALUMNO
Sql= "SELECT id_alumno, id_aeropuerto,id_curso,f_inicio,nom_item,nom_curso,aero_ciudad,id_itemSubAero FROM programas_tmp WHERE id_programa="&cod&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_alumno=ob_rs("id_alumno")
id_aeropuerto=ob_rs("id_aeropuerto")
id_curso=ob_rs("id_curso")
f_inicio=ob_rs("f_inicio")
anyo_act=year(f_inicio)
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
aero_ciudad=ob_rs("aero_ciudad")
id_itemSubAero=ob_rs("id_itemSubAero")
Sql2= "SELECT id_alumno_r FROM alumnos_tmp WHERE id_alumno="&id_alumno&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_alumno_r=ob_rs2("id_alumno_r")
end if
ob_rs2.close

if id_alumno_r=0then
Ob_Connb.execute "INSERT INTO alumnos (a_nombre,a_apellidos,a_sexo,a_nif,a_pasaporte,a_pas_exp,a_pas_cad,u_usuario,a_email,u_pass,a_cumple,a_telefono,a_movil,a_movil_sms,a_direccion,a_ciudad,a_c_postal,a_provincia,a_pais,a_p_nombre,a_p_apellidos,a_p_email,a_p_telefono,a_p_movil,a_p_profesion,a_m_nombre,a_m_apellidos,a_m_email,a_m_telefono,a_m_movil,a_m_profesion,a_permiso_medico,a_vegetariano,a_fuma,a_curso_ant_org,a_talla,a_colegio,a_conocido,fecha_in,a_enfermedades,a_medicamentos) SELECT a_nombre,a_apellidos,a_sexo,a_nif,a_pasaporte,a_pas_exp,a_pas_cad,u_usuario,a_email,u_pass,a_cumple,a_telefono,a_movil,a_movil_sms,a_direccion,a_ciudad,a_c_postal,a_provincia,a_pais,a_p_nombre,a_p_apellidos,a_p_email,a_p_telefono,a_p_movil,a_p_profesion,a_m_nombre,a_m_apellidos,a_m_email,a_m_telefono,a_m_movil,a_m_profesion,a_permiso_medico,a_vegetariano,a_fuma,a_curso_ant_org,a_talla,a_colegio,a_conocido,fecha_in,a_enfermedades,a_medicamentos FROM alumnos_tmp WHERE id_alumno = "&id_alumno&" "
set ob_rs2=Ob_Connb.execute("select MAX(id_alumno) from alumnos")
id_alumno_n = ob_rs2(0)
Sql2= "SELECT id_alumno, id_archivo, id_programa, fecha_in FROM alumnos_archivos_tmp WHERE id_alumno="&id_alumno&"" 'ARCHIVOS DEL ALUMNO
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
fecha_in_arc=ob_rs2("fecha_in")
id_archivo=ob_rs2("id_archivo")
if id_archivo<>""then
Sql3= "SELECT * FROM archivos_tmp WHERE id_archivo="&id_archivo&"" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
nombre_arc=ob_rs3("nombre")
tipo_arc=ob_rs3("tipo")
alto=ob_rs3("alto")
ancho=ob_rs3("ancho")
peso=ob_rs3("peso")
extension=ob_rs3("extension")
mySQL="INSERT INTO archivos (nombre,tipo,alto,ancho,peso,extension)"
mySQL=mySQL & "VALUES ("
mySQL=mySQL & "'" & nombre_arc & "',"
mySQL=mySQL & "'" & tipo_arc & "',"
mySQL=mySQL & "" & alto & ","
mySQL=mySQL & "" & ancho & ","
mySQL=mySQL & "" & peso & ","
mySQL=mySQL & "'" & extension & "'"
mySQL=mySQL & ");" 
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_archivo) from archivos") 
id_archivo = ob_rs(0)
end if
ob_rs3.close
end if
mySQL4="INSERT INTO alumnos_archivos (id_alumno,id_archivo,id_programa,fecha_in)"
mySQL4=mySQL4 & "VALUES ("
mySQL4=mySQL4 & "'" & id_alumno_n & "',"
mySQL4=mySQL4 & "'" & id_archivo & "',"
mySQL4=mySQL4 & "" & id_programa & ","
mySQL4=mySQL4 & "'" & fecha_in_arc & "'"
mySQL4=mySQL4 & ");" 
set ob_rs4=Ob_Connb.execute(mySQL4)
ob_rs2.movenext
loop
end if
ob_rs2.close
else
id_alumno_n = id_alumno_r
end if
mySQL2="UPDATE programas SET " 'UPDATEAMOS EL ALUMNO EN CUESTION CON EL PROGRAMA EN CUESTION
mySQL2=mySQL2 & "id_alumno = '" & id_alumno_n & "'"
mySQL2=mySQL2 & " WHERE id_programa = " & id_programa & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if
ob_rs.close

mySQL2="UPDATE programasOp SET "
mySQL2=mySQL2 & "id_alumno = '" & id_alumno_n & "'"
mySQL2=mySQL2 & " WHERE id_programa = " & id_programa & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
'ob_rs2.close

res_inscr="ok"
'MAILS ENVIOS
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
Sql= "SELECT nombre, alt FROM rel, archivos WHERE id_web="&id_web&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
nombre=url_c&nombre
alt=ob_rs("alt")
end if
ob_rs.close
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = f_smtp
Mail.Port = f_puerto
Mail.Username = f_usuario
Mail.Password = f_pass
Mail.From = f_email
Mail.FromName = "Cursit - Cursos de Idiomas"
'MANDAMOS MAIL A ESCUELA
if env_mail="si" and id_escuela<>""then
Sql= "SELECT titulo_esp,email,email_p FROM proveedores WHERE tipo_pr='Escuela'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
email_=ob_rs("email")
email_p=ob_rs("email_p")
end if
ob_rs.close
if email_<>""then Mail.AddAddress email_ end if
if email_p<>""then Mail.AddAddress email_p end if
Mail.AddBCC f_email 
asunto = "Cursit Idiomas - Solicitud Plaza "&titulo_esp
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto=ob_escuela
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
If Err <> 0 Then 
env_mail_esc="ko" 
env_mail_res="ko"
else
env_mail_esc="ok" 
env_mail_res="ok"
end If 
mySQL2="UPDATE programas SET " 'UPDATEAMOS EL ALUMNO EN CUESTION CON EL PROGRAMA EN CUESTION
mySQL2=mySQL2 & "mail_env = '" & env_mail_res & "'"
mySQL2=mySQL2 & " WHERE id_programa = " & id_programa & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)
end if 'env_mail
'MAMDAMOS MAIL A ALUMNO
Sql= "SELECT id_item, nom_item, id_curso, id_alumno, pr_cancelacion_pr, id_usuario, mail_env, nom_item, id_curso, precioReserva,refPresupuesto, refPago, nom_item FROM programas_tmp WHERE id_programa="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
id_usuario=ob_rs("id_usuario")
mail_env=ob_rs("mail_env")
nom_item=ob_rs("nom_item")
id_curso=ob_rs("id_curso")
precioReserva=ob_rs("precioReserva")
refPresupuesto=ob_rs("refPresupuesto")
refPago=ob_rs("refPago")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
titulo_esp=ob_rs("nom_item")
end if
ob_rs.close
Sql= "SELECT a_email, a_p_email, a_m_email, a_nombre, a_apellidos FROM alumnos_tmp WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Connb,adOpenStatic, adCmdText
if not ob_rs.eof then
a_email=ob_rs("a_email")
a_p_email=ob_rs("a_p_email")
a_m_email=ob_rs("a_m_email")
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
else
falla_alumno_tmp="si"
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
if gen_mail="si" then

if u_email=a_email then mail_1= u_email end if
if u_email=a_p_email then mail_1= u_email end if
if u_email=a_m_email then mail_1= u_email end if
if u_email=a_email then mail_2= u_email end if
if u_email=a_p_email then mail_2= u_email end if
if u_email=a_m_email then mail_2= u_email end if
if u_email=a_email then mail_3= u_email end if
if u_email=a_p_email then mail_3= u_email end if
if u_email=a_m_email then mail_3= u_email end if
if mail_1<>mail_4 and mail_1<>""  then Mail.AddAddress mail_1 end if
if mail_2<>mail_4 and mail_2<>"" then Mail.AddAddress mail_2 end if
if mail_3<>mail_4 and mail_3<>"" then Mail.AddAddress mail_3 end if
Mail.AddAddress mail_4


Mail.AddBCC f_email 
else
Mail.AddAddress f_email
end if
if email<>"" then Mail.AddCC email  end if%>
<!--#include file="../../web/comun/limpia.asp"-->
<%asunto = "Plaza confirmada en curso de idiomas" '& deslimpia(titulo_esp)deslimpia(a_nombre) &" "& deslimpia(a_apellidos) & 
Mail.Subject =  Mail.EncodeHeader(asunto, "Windows-1250")
texto="<br><br>"
texto=texto& "<font size=""16"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Hola "&a_nombre&"&nbsp;"&a_apellidos&"!</i></font><br><br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><i>Te informamos de que tu plaza en el curso <strong>"&titulo_esp&"</strong> con "&nombre_empresa&" queda confirmada</i></font><br><br><hr color=""#999999"" align=""center"" width=""100%""/>"
texto=texto &"<br><br>Recuerda que desde tu &aacute;rea de usuario de la web "&url&" puedes realizar diferentes gestiones. Para acceder solo necesitas el mail y la contrase&ntilde;a introducidos en el registro."
texto=texto &"<br><br>Ante cualquier duda o problema ponte en contacto con nosotros a trav&eacute;s del mail <strong>"&email&"</strong> o bien del tel&eacute;fono "&telefono&".<br><br><hr color=""#32C5D2"" align=""center"" width=""20%""/>"
texto=texto &"<br><br><font size=""4"" face=""Arial, Helvetica, sans-serif"" color=""#999999""><p align=""center""><i>Muchas gracias por confiar en "&nombre_empresa&" y muy feliz viaje!!!</i></p></font>"
texto=texto &"<br><br>"
Mail.Body = "<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""1"" bgcolor=""#CCCCCC""><tr><td width=""80%"" valign=""top"" bgcolor=""#FFFFFF""><img src="""&nombre&""" alt="""&alt&"""  width=""127"" height=""69"" hspace=""8"" vspace=""12"" /><br /></td><td width=""20%"" align=""right"" bgcolor=""#FFFFFF""><font size=""1.5"" face=""Arial, Helvetica, sans-serif"">"&direccion&"<br>"&cod_postal&" - "&ciudad&" <br>Tel. "&telefono&"<br>"&email&"&nbsp;&nbsp; //&nbsp; "& url &" </fo nt></td></tr></table><br><font size=""2"" face=""Arial, Helvetica, sans-serif"" color=""#333333"">"& texto &"</font><br><br><font size=""1"" face=""Arial, Helvetica, sans-serif"" color=""#999999"">"&f_texto_legal&"</font><br />"
Mail.IsHTML = True 
On Error Resume Next
Mail.Send
If Err <> 0 Then env_mail_res_alu="ko"end If 
env_mail_res_alu="ok"
'CONFIRMAMOS PASO A PASO QUE SE HA HECHO TODO LO ANTERIOR%>
<div class="col-md-12" style="margin-top:25px;border-top:1px solid #ddd;padding-top:30px">
<div class="portlet "><div class="portlet-title">
<div class="caption"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-top:2px;"></i>Resultado del alta de alumno:</div></div>
<div class="portlet-body">
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Alumno: </div><div class="col-md-7 value"><%=a_nombre%>&nbsp;<%=a_apellidos%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Programa: </div><div class="col-md-7 value"><%=nom_item%> - <%=nom_curso%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Alumno Inscrito en programa: </div><div class="col-md-7 value"><%if res_inscr="ok"then%><i class="fa fa-check" aria-hidden="true" style="color:#0CF"></i><%else%><i class="fa fa-times" aria-hidden="true" style="color:#F00"></i><%end if%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Factura <%=n_factura%> generada: </div><div class="col-md-7 value"><%if dup_factura<>"si"then%><i class="fa fa-check" aria-hidden="true" style="color:#0CF"></i><%else%><i class="fa fa-times" aria-hidden="true" style="color:#F00"></i><%end if%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Mail enviado a escuela: </div><div class="col-md-7 value"><%if env_mail_res="ok"then%><i class="fa fa-check" aria-hidden="true" style="color:#0CF"></i><%else%><i class="fa fa-times" aria-hidden="true" style="color:#F00"></i><%end if%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Mail enviado a alumno: </div><div class="col-md-7 value"><%if env_mail_res_alu="ok"then%><i class="fa fa-check" aria-hidden="true" style="color:#0CF"></i><%else%><i class="fa fa-times" aria-hidden="true" style="color:#F00"></i><%end if%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Fecha de alta: </div><div class="col-md-7 value"><%=date%> </div></div></div>
</div></div></div>
<%'HACEMOS RECUENTO DE PLAZAS
if id_aeropuerto<>0 or id_itemSubAero<>0 then
Sql= "SELECT mes, plazas,f_salida,id_quincena FROM itemsSubAero WHERE id_itemSUbAero="&id_itemSUbAero&"  AND year(f_salida) = '"&anyo_act&"'"   '[PLAZAS TOTALES]
'Sql= "SELECT mes, plazas,f_salida,id_quincena FROM rel, itemsSubAero WHERE rel.id_itemSub="&id_curso&" AND rel.id_itemSUbAero=itemsSUbAero.id_itemSUbAero  AND year(f_salida) = '"&anyo_act&"'" 
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
plazas_totales=ob_rs("plazas")
mes=ob_rs("mes")
f_salida=ob_rs("f_salida")
id_quincena=ob_rs("id_quincena")
end if
ob_rs.close
if id_quincena<>0then
Sql= "SELECT titulo_esp FROM quincenas WHERE id_quincena="&id_quincena&" "   '[CASO QUINCENAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
quincena=ob_rs("titulo_esp")
end if
ob_rs.close
end if
Sql= "SELECT id_programa FROM programas_tmp WHERE id_curso="&id_curso&" AND bloqueada='si' AND year(f_inicio) = '"&anyo_act&"'"   '[PLAZAS BLOQUEADAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
plazas_bloqueadas=ob_rs.RecordCount
else
plazas_bloqueadas=0
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas WHERE id_curso="&id_curso&" AND year(f_inicio) = '"&anyo_act&"'"   '[PLAZAS VENDIDAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
plazas_vendidas=ob_rs.RecordCount
else
plazas_vendidas=0
end if
ob_rs.close
plazas_libres=plazas_totales-plazas_bloqueadas-plazas_vendidas
if quincena<>"" then fecha_concept=quincena else fecha_concept=mes end if%>
<div class="col-md-12" style="margin-top:25px;border-top:1px solid #ddd;padding-top:30px;margin-bottom:65px">
<div class="portlet "><div class="portlet-title">
<div class="caption"><i class="fa fa-users" aria-hidden="true" style="margin-top:2px;"></i>Recuento de plazas</div></div>
<div class="portlet-body">
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Programa: </div><div class="col-md-7 value"><%=nom_item%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Curso: </div><div class="col-md-7 value"> <%=nom_curso%></div></div></div>
<%if id_aeropuerto<>0then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Aeropuerto: </div><div class="col-md-7 value"><%=aero_ciudad%> </div></div></div><%end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Fecha: </div><div class="col-md-7 value"><%=fecha_concept%> - <%=f_salida%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas totales: </div><div class="col-md-7 value"> <%=plazas_totales%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas bloqueadas: </div><div class="col-md-7 value"> <%=plazas_bloqueadas%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas vendidas: </div><div class="col-md-7 value"> <%=plazas_vendidas%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas libres: </div><div class="col-md-7 value"> <%=plazas_libres%></div></div></div>
</div>
</div>
<%if plazas_libres<=3 then%>
<div class="col-md-12"><div class="alert-danger" id="form_errors" style="padding:20px;margin-top:25px"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:7px"></i> Atención, quedan <%=plazas_libres%> plazas (incluyendo este alta). Vigila la opción de poner el curso como "COMPLETO".</div></div>
<%end if%>
</div>
<%end if
'ELIMINAR DATOS DE PROGRAMAS TMP , OPCIONES_TMP
mySQL="DELETE FROM programas_tmp where id_programa =" & cod & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM programasOp_tmp where id_programa =" & cod & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM alumnos_tmp where id_alumno =" & id_alumno & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM programasOpAdd_tmp where id_programa =" & cod & ""
set ob_rs=Ob_Connb.execute(mySQL)
Sql= "SELECT id_archivo FROM alumnos_archivos_tmp WHERE id_programa="&cod&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_archivo=ob_rs("id_archivo")
mySQL="DELETE FROM archivos_tmp where id_archivo =" & id_archivo & ""
set ob_rs2=Ob_Connb.execute(mySQL)
ob_rs.movenext
loop
end if
ob_rs.close
mySQL="DELETE FROM alumnos_archivos_tmp where id_programa =" & cod & ""
set ob_rs=Ob_Connb.execute(mySQL)
ob_conn.close
else 'id_alumno%>
<div class="col-md-offset-5 col-md-12"  style="padding-top:55px;padding-bottom:65px;padding-left:60px"><i class="fa fa-exclamation" aria-hidden="true" style="font-size:2em;color:#F00;margin-right:12px"></i>Ups. Algo ha ido mal...</div>
<%end if%>
<div class="col-md-offset-5 col-md-12" style="margin-bottom:105px">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver a preinscripciones</a><%end if%>
<%if id_alumno_n<>""then
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"cod_cat="&id_categoria&"&cod="&id_alumno_n&"&cod_prog="&id_programa))%>
<a href="<%=r%>alumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"cod_cat="&id_categoria&"&cod="&id_alumno_n&"&cod_prog="&id_programa)%>" class="btn green btn-green"><i class="fa fa-eye" aria-hidden="true"></i> ver datos alumno</a>
<%end if%>
</div>
</div>
<!--#include file="../comun/menu_inf.asp"-->  