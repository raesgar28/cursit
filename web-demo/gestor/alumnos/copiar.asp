<%r="../"
rd="../../"%>
<!--#include file="../../conex/conex_back.asp"-->
<%Dim Ob_connc, ob_commandc
Set Ob_Connc = Server.CreateObject ("ADODB.Connection")
Set Ob_Commandc = Server.CreateObject ("ADODB.Command")
Ob_Connc.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"../crm/data/datos.mdb")
Ob_Commandc.ActiveConnection = Ob_Connc
function safeSTR(str)
dim output'output =server.HTMLEncode(str)
output = str
output = replace( output, "´", "&acute;" ) '"
output = replace( output, "á", "&aacute;" ) '"
output = replace( output, "é", "&eacute;" ) '"
output = replace( output, "í", "&iacute;" ) '"
output = replace( output, "ó", "&oacute;" ) '"
output = replace( output, "ú", "&uacute;" ) '"
output = replace( output, "Á", "&Aacute;" ) '"
output = replace( output, "É", "&Eacute;" ) '"
output = replace( output, "Í", "&Iacute;" ) '"
output = replace( output, "Ó", "&Oacute;" ) '"
output = replace( output, "Ú", "&Uacute;" ) '"
output = replace( output, "ñ", "&ntilde;" ) '"
output = replace( output, "Ñ", "&Ntilde;" ) '"
output = replace( output, "`", "&#96;" ) '"
output = replace( output, "à", "&agrave;" ) '"
output = replace( output, "è", "&egrave;" ) '"
output = replace( output, "ì", "&igrave;" ) '"
output = replace( output, "ò", "&ograve;" ) '"
output = replace( output, "ù", "&ugrave;" ) '"
output = replace( output, "ü", "&uuml;" ) '"
output = replace( output, "Ü", "&Uuml;" ) '"
output = replace( output, "ö", "&ouml;" ) '"
output = replace( output, "Ö", "&Ouml;" ) '"
output = replace( output, "¿", "&iquest;" ) '"
output = replace( output, "&#34;", chr(34) ) '"
output = replace( output, chr(34), "&#34;" ) '"
output = replace( output, chr(39), "&#39;" )  '
output = replace( output, chr(63), "&#63;" ) '?
output = replace( output, "ª", "&ordf;" ) '?
output = replace( output, "º", "&deg;" ) '?
output = replace( output, "Ã±", "&ntilde;" ) '?
output = replace( output, " · ", " " ) '?
safeSTR= output
end function
function capit(thetext)
outtext=""
intext=(lcase(thetext))
do while instr(intext," ")>0
chunk = left(intext, instr(intext," "))
outtext=outtext & " " & left(ucase(chunk),1) & right(chunk,len(chunk)-1)
intext= right(intext,len(intext)-instr(intext," "))
loop
outtext=outtext & " " & left(ucase(intext),1) & right(intext,len(intext)-1)
capit=outtext
end function 

Sql= "SELECT * from alumnos where dni <>'' AND dni IS NOT NULL AND email <>'' AND email IS NOT NULL AND year(fecha) >= 2014 ORDER BY id_alumno DESC"                    
Ob_Commandc.CommandText = Sql
SET Ob_RS = Ob_Commandc.Execute ()
if not ob_rs.eof then
j=1
do while not ob_rs.eof' and j<=5

dni=ob_rs("dni")
tipo=ob_rs("tipo")

'COMPROBAMOS QUE NO LO HAYAMOS METIDO YA

Sql2= "SELECT a_nif from alumnos where a_nif ='"&dni&"' order by id_alumno DESC"                    
Ob_Commandb.CommandText = Sql2
SET Ob_RS2 = Ob_Commandb.Execute ()
if not ob_rs2.eof then
'SI LO ENCUENTRA...
id_alumno=ob_rs("id_alumno")
tipo=ob_rs("tipo")
if ob_rs("nombre")<>""then nombre=trim(safeSTR(ob_rs("nombre"))) end if
if nombre<>""then nombre=capit(nombre)end if
if nombre<>""then nombre=trim(nombre)end if
if nombre<>""then nombre=replace(nombre,"  "," ")end if
if ob_rs("apellidos")<>""then apellidos=trim(safeSTR(ob_rs("apellidos"))) end if
if apellidos<>""then apellidos=capit(apellidos)end if
if apellidos<>""then apellidos=trim(apellidos)end if
if apellidos<>""then apellidos=replace(apellidos,"  "," ")end if
if ob_rs("calle")<>""then calle=trim(safeSTR(ob_rs("calle"))) end if
if ob_rs("localidad")<>""then localidad=trim(safeSTR(ob_rs("localidad"))) end if
if ob_rs("provincia")<>""then provincia=trim(safeSTR(ob_rs("provincia"))) end if
pais="es"
numero=ob_rs("numero")
piso=ob_rs("piso")
puerta=ob_rs("puerta")
codigo_postal=ob_rs("codigo_postal")
if ob_rs("email")<>""then email=trim(safeSTR(ob_rs("email"))) end if
telefono=ob_rs("telefono")
movil_alumno=ob_rs("movil_alumno")
movil_sms=ob_rs("movil_sms")
fecha_nacimiento=ob_rs("fecha_nacimiento")
pasaporte=ob_rs("pasaporte")
expira=ob_rs("expira")
expedido=ob_rs("expedido")
if ob_rs("padre")<>""then padre=trim(safeSTR(ob_rs("padre"))) end if
if padre<>""then padre=capit(padre)end if
if padre<>""then padre=trim(padre)end if
if padre<>""then padre=replace(padre,"  "," ")end if
if ob_rs("madre")<>""then madre=trim(safeSTR(ob_rs("madre"))) end if
if madre<>""then madre=capit(madre)end if
if madre<>""then madre=trim(madre)end if
if madre<>""then madre=replace(madre,"  "," ")end if
if ob_rs("email_padre")<>""then email_padre=trim(safeSTR(ob_rs("email_padre"))) end if
if ob_rs("email_madre")<>""then email_madre=trim(safeSTR(ob_rs("email_madre"))) end if
telefono_padre=ob_rs("telefono_padre")
telefono_madre=ob_rs("telefono_madre")
if ob_rs("como_conocido")<>""then como_conocido=trim(safeSTR(ob_rs("como_conocido"))) end if
if ob_rs("como_otro")<>""then como_otro=trim(safeSTR(ob_rs("como_otro"))) end if
if ob_rs("observaciones")<>""then observaciones=trim(safeSTR(ob_rs("observaciones"))) end if
fecha=ob_rs("fecha")
if ob_rs("tipo_text")<>""then tipo_text=trim(safeSTR(ob_rs("tipo_text"))) end if
sexo=ob_rs("sexo")
if ob_rs("enfermedades_resenables")<>""then enfermedades_resenables=trim(safeSTR(ob_rs("enfermedades_resenables"))) end if
if ob_rs("vegetariano")<>""then vegetariano=trim(safeSTR(ob_rs("vegetariano"))) end if
if ob_rs("fumas")<>""then fumas=trim(safeSTR(ob_rs("fumas"))) end if
if ob_rs("curso_anterior")<>""then curso_anterior=trim(safeSTR(ob_rs("curso_anterior"))) end if
if ob_rs("organizacion")<>""then organizacion=trim(safeSTR(ob_rs("organizacion")))
if ob_rs("apellidos_padre")<>""then apellidos_padre=trim(safeSTR(ob_rs("apellidos_padre"))) end if
if apellidos_padre<>""then apellidos_padre=capit(apellidos_padre)end if
if apellidos_padre<>""then apellidos_padre=trim(apellidos_padre)end if
if apellidos_padre<>""then apellidos_padre=replace(apellidos_padre,"  "," ")end if
if ob_rs("apellidos_madre")<>""then apellidos_madre=trim(safeSTR(ob_rs("apellidos_madre"))) end if
if apellidos_madre<>""then apellidos_madre=capit(apellidos_madre)end if
if apellidos_madre<>""then apellidos_madre=trim(apellidos_madre)end if
if apellidos_madre<>""then apellidos_madre=replace(apellidos_madre,"  "," ")end if
if ob_rs("profesion_padre")<>""then profesion_padre=trim(safeSTR(ob_rs("profesion_padre"))) end if
if ob_rs("profesion_madre")<>""then profesion_madre=trim(safeSTR(ob_rs("profesion_madre"))) end if
movil_padre=ob_rs("movil_padre")
movil_madre=ob_rs("movil_madre")
if ob_rs("medicamentos")<>""then medicamentos=trim(safeSTR(ob_rs("medicamentos"))) end if
if ob_rs("colegio")<>""then colegio=trim(safeSTR(ob_rs("colegio"))) end if
if ob_rs("pref_contacto")<>""then pref_contacto=trim(safeSTR(ob_rs("pref_contacto"))) end if
a_direccion=calle &","&numero&" - "&piso&" - "&puerta
permiso="si"
if fecha_nacimiento=""then fecha_nacimiento="01/01/1000" end if
if enfermedades_resenables<>""then enfermedades_resenables=left((enfermedades_resenables),250) end if
else'SI NO LO ENCUENTRA
id_alumno=ob_rs("id_alumno")
tipo=ob_rs("tipo")
if ob_rs("nombre")<>""then nombre=trim(safeSTR(ob_rs("nombre"))) end if
if nombre<>""then nombre=capit(nombre)end if
if nombre<>""then nombre=trim(nombre)end if
if nombre<>""then nombre=replace(nombre,"  "," ")end if
if ob_rs("apellidos")<>""then apellidos=trim(safeSTR(ob_rs("apellidos"))) end if
if apellidos<>""then apellidos=capit(apellidos)end if
if apellidos<>""then apellidos=trim(apellidos)end if
if apellidos<>""then apellidos=replace(apellidos,"  "," ")end if
if ob_rs("calle")<>""then calle=trim(safeSTR(ob_rs("calle"))) end if
if ob_rs("localidad")<>""then localidad=trim(safeSTR(ob_rs("localidad"))) end if
if ob_rs("provincia")<>""then provincia=trim(safeSTR(ob_rs("provincia"))) end if
pais="es"
numero=ob_rs("numero")
piso=ob_rs("piso")
puerta=ob_rs("puerta")
codigo_postal=ob_rs("codigo_postal")
if ob_rs("email")<>""then email=trim(safeSTR(ob_rs("email"))) end if
telefono=ob_rs("telefono")
movil_alumno=ob_rs("movil_alumno")
movil_sms=ob_rs("movil_sms")
fecha_nacimiento=ob_rs("fecha_nacimiento")
pasaporte=ob_rs("pasaporte")
expira=ob_rs("expira")
expedido=ob_rs("expedido")
if ob_rs("padre")<>""then padre=trim(safeSTR(ob_rs("padre"))) end if
if padre<>""then padre=capit(padre)end if
if padre<>""then padre=trim(padre)end if
if padre<>""then padre=replace(padre,"  "," ")end if
if ob_rs("madre")<>""then madre=trim(safeSTR(ob_rs("madre"))) end if
if madre<>""then madre=capit(madre)end if
if madre<>""then madre=trim(madre)end if
if madre<>""then madre=replace(madre,"  "," ")end if
if ob_rs("email_padre")<>""then email_padre=trim(safeSTR(ob_rs("email_padre"))) end if
if ob_rs("email_madre")<>""then email_madre=trim(safeSTR(ob_rs("email_madre"))) end if
telefono_padre=ob_rs("telefono_padre")
telefono_madre=ob_rs("telefono_madre")
if ob_rs("como_conocido")<>""then como_conocido=trim(safeSTR(ob_rs("como_conocido"))) end if
if ob_rs("como_otro")<>""then como_otro=trim(safeSTR(ob_rs("como_otro"))) end if
if ob_rs("observaciones")<>""then observaciones=trim(safeSTR(ob_rs("observaciones"))) end if
fecha=ob_rs("fecha")
if ob_rs("tipo_text")<>""then tipo_text=trim(safeSTR(ob_rs("tipo_text"))) end if
sexo=ob_rs("sexo")
if ob_rs("enfermedades_resenables")<>""then enfermedades_resenables=trim(safeSTR(ob_rs("enfermedades_resenables"))) end if
if ob_rs("vegetariano")<>""then vegetariano=trim(safeSTR(ob_rs("vegetariano"))) end if
if ob_rs("fumas")<>""then fumas=trim(safeSTR(ob_rs("fumas"))) end if
if ob_rs("curso_anterior")<>""then curso_anterior=trim(safeSTR(ob_rs("curso_anterior"))) end if
if ob_rs("organizacion")<>""then organizacion=trim(safeSTR(ob_rs("organizacion")))
if ob_rs("apellidos_padre")<>""then apellidos_padre=trim(safeSTR(ob_rs("apellidos_padre"))) end if
if apellidos_padre<>""then apellidos_padre=capit(apellidos_padre)end if
if apellidos_padre<>""then apellidos_padre=trim(apellidos_padre)end if
if apellidos_padre<>""then apellidos_padre=replace(apellidos_padre,"  "," ")end if
if ob_rs("apellidos_madre")<>""then apellidos_madre=trim(safeSTR(ob_rs("apellidos_madre"))) end if
if apellidos_madre<>""then apellidos_madre=capit(apellidos_madre)end if
if apellidos_madre<>""then apellidos_madre=trim(apellidos_madre)end if
if apellidos_madre<>""then apellidos_madre=replace(apellidos_madre,"  "," ")end if
if ob_rs("profesion_padre")<>""then profesion_padre=trim(safeSTR(ob_rs("profesion_padre"))) end if
if ob_rs("profesion_madre")<>""then profesion_madre=trim(safeSTR(ob_rs("profesion_madre"))) end if
movil_padre=ob_rs("movil_padre")
movil_madre=ob_rs("movil_madre")
if ob_rs("medicamentos")<>""then medicamentos=trim(safeSTR(ob_rs("medicamentos"))) end if
if ob_rs("colegio")<>""then colegio=trim(safeSTR(ob_rs("colegio"))) end if
if ob_rs("pref_contacto")<>""then pref_contacto=trim(safeSTR(ob_rs("pref_contacto"))) end if
a_direccion=calle &","&numero&" - "&piso&" - "&puerta
permiso="si"
if fecha_nacimiento=""then fecha_nacimiento="01/01/1000" end if
if enfermedades_resenables<>""then enfermedades_resenables=left((enfermedades_resenables),250) end if

'GUARDAMOS EN ALUMNOS Y RECUPERAMOS ULTIMA ID
mySQL="INSERT INTO alumnos (a_nombre,a_apellidos,a_sexo,a_nif,a_pasaporte,a_pas_exp,a_pas_cad,a_email,a_telefono,a_movil,a_movil_sms,a_direccion,a_ciudad,a_c_postal,a_provincia,a_pais,a_p_nombre,a_p_apellidos,a_p_email,a_p_movil,a_p_profesion,a_m_nombre,a_m_apellidos,a_m_email,a_m_movil,a_m_profesion,a_colegio,a_enfermedades,a_medicamentos,a_cumple)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & nombre & "',"
	mySQL=mySQL & "'" & apellidos & "',"
	mySQL=mySQL & "'" & sexo & "',"
	mySQL=mySQL & "'" & dni & "',"
	mySQL=mySQL & "'" & pasaporte & "',"
	mySQL=mySQL & "'" & expedido & "',"
	mySQL=mySQL & "'" & expira & "',"
	mySQL=mySQL & "'" & email & "',"
	'mySQL=mySQL & "'" & fecha_nacimiento & "',"
	mySQL=mySQL & "'" & telefono & "',"
	mySQL=mySQL & "'" & movil_alumno & "',"	
	mySQL=mySQL & "'" & movil_sms & "',"	
	mySQL=mySQL & "'" & a_direccion & "',"	
	mySQL=mySQL & "'" & localidad & "',"	
	mySQL=mySQL & "'" & codigo_postal & "',"	
	mySQL=mySQL & "'" & provincia & "',"	
	mySQL=mySQL & "'" & pais & "',"	
	mySQL=mySQL & "'" & padre & "',"	
	mySQL=mySQL & "'" & apellidos_padre & "',"	
	mySQL=mySQL & "'" & email_padre & "',"	
	mySQL=mySQL & "'" & movil_padre & "',"	
	mySQL=mySQL & "'" & profesion_padre & "',"
	mySQL=mySQL & "'" & madre & "',"	
	mySQL=mySQL & "'" & apellidos_madre & "',"	
	mySQL=mySQL & "'" & email_madre & "',"	
	mySQL=mySQL & "'" & movil_madre & "',"	
	mySQL=mySQL & "'" & profesion_madre & "',"
	mySQL=mySQL & "'" & colegio & "',"
	mySQL=mySQL & "'" & enfermedades_resenables & "',"
	mySQL=mySQL & "'" & medicamentos & "',"
	mySQL=mySQL & "'" & fecha_nacimiento & "'"
	mySQL=mySQL & ");"
set ob_rs3=Ob_Connb.execute(mySQL)
set ob_rs3 = Ob_Connb.execute("select MAX(id_alumno) from alumnos") 
id_alumno_new = ob_rs3(0)

end if
ob_rs2.close

'RECUPERAMOS ALGUNOSDATOS DE PROGRAMAS
Sql3= "SELECT * from programas where id_alumno ="&id_alumno&" order by id_programa desc"                    
Ob_Commandc.CommandText = Sql3
SET Ob_RS3 = Ob_Commandc.Execute ()
if not ob_rs3.eof then
dato_entrada=ob_rs3("dato_entrada")
if dato_entrada=""then dato_entrada="01/01/1000" end if
fecha_inicio=ob_rs3("fecha_inicio")
fecha_fin=ob_rs3("fecha_fin")
ano=ob_rs3("ano")
n_semanas=ob_rs3("n_semanas")
id_programa=ob_rs3("id_programa")

mes=ob_rs3("mes")
if mes<>""then
Select case mes
case "Julio"
mes="07"
case "Agosto"
mes="08"
case "Septiembre"
mes="09"
case "Abril"
mes="04"
case "Marzo"
mes="03"
case"nada"
mes="06"
case else
mes="07"
end select
end if

if fecha_inicio="01/01/1111" or fecha_inicio="01/01/2222" or fecha_inicio="03/03/2003" then
fecha_inicio= "01/"&mes&"/"&ano
n_semanas=n_semanas*7
fecha_fin=fecha_fin + n_semanas
end if

importe_total=ob_rs3("importe_total")
if ob_rs3("concepto_programa")<>""then concepto_programa=trim(safeSTR(ob_rs3("concepto_programa"))) end if
if ob_rs3("concepto_curso")<>""then concepto_curso=trim(safeSTR(ob_rs3("concepto_curso"))) end if
pais="es"
end if
ob_rs3.close


'RECUPERAMOS PARA USUARIO

if tipo=2 then ' CASO ADULTOS
u_nombre=nombre
u_apellidos=apellidos
u_email=email
u_usuario=email
u_pass="ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb" '(a)
u_telefono=telefono
u_movil=movil_alumno
u_direccion=calle &","&numero&" - "&piso&" - "&puerta
u_ciudad=localidad
u_c_postal=codigo_postal
u_provincia=provincia
u_pais=pais
fecha_in=fecha
habilitado="si"
u_nif=dni
n_letter="si"
end if
if tipo=1  or tipo=6 then' CASO JOVENES Y ADULTOS
if padre<>"" and apellidos_padre<>"" and email_padre<>"" and movil_padre<>"" then 
u_nombre=padre
u_apellidos=apellidos_padre
u_email=email_padre
u_usuario=email_padre
u_telefono=telefono_padre
u_movil=movil_padre
else
u_nombre=madre
u_apellidos=apellidos_madre
u_email=email_madre
u_usuario=email_madre
u_telefono=telefono_madre
u_movil=movil_madre
end if
u_pass="ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb" '(a)
u_direccion=calle &","&numero&" - "&piso&" - "&puerta
u_ciudad=localidad
u_c_postal=codigo_postal
u_provincia=provincia
u_pais=pais
fecha_in=fecha
'u_agente=
habilitado="si"
u_nif=dni
n_letter="si"
end if


Sql3= "SELECT u_nif, id_usuario from usuarios where u_nif ='"&u_nif&"' or u_usuario ='"&u_usuario&"'"                    
Ob_Commandb.CommandText = Sql3
SET Ob_RS3 = Ob_Commandb.Execute ()
if not ob_rs3.eof then
id_usuario_new=ob_rs3("id_usuario")
else
mySQL="INSERT INTO usuarios (u_nombre,u_apellidos,u_email,u_usuario,u_pass,u_telefono,u_movil,u_direccion,u_ciudad,u_c_postal,u_provincia,u_pais,fecha_in,u_observaciones,u_empresa,u_nif,n_letter,habilitado)"
mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "'" & u_nombre & "',"
	mySQL=mySQL & "'" & u_apellidos & "',"
	mySQL=mySQL & "'" & u_email & "',"
	mySQL=mySQL & "'" & u_usuario & "',"
	mySQL=mySQL & "'" & u_pass & "',"
	mySQL=mySQL & "'" & u_telefono & "',"
	mySQL=mySQL & "'" & u_movil & "',"
	mySQL=mySQL & "'" & u_direccion & "',"
	mySQL=mySQL & "'" & u_ciudad & "',"
	mySQL=mySQL & "'" & u_c_postal & "',"
	mySQL=mySQL & "'" & u_provincia & "',"	
	mySQL=mySQL & "'" & u_pais & "',"	
	mySQL=mySQL & "'" & fecha_in & "',"		
	mySQL=mySQL & "'" & u_observaciones & "',"	
	mySQL=mySQL & "'" & u_empresa & "',"	
	mySQL=mySQL & "'" & u_nif & "',"	
	mySQL=mySQL & "'" & n_letter & "',"	
	mySQL=mySQL & "'" & habilitado & "'"
	mySQL=mySQL & ");"
set ob_rs3=Ob_Connb.execute(mySQL)
set ob_rs3 = Ob_Connb.execute("select MAX(id_usuario) from usuarios") 
id_usuario_new = ob_rs3(0)
end if

if id_usuario_new<>"" and id_alumno_new<>"" then
estado_pago="Aceptada"
falta_pagar="0"
if tipo=1 then id_categoria= 39 end if
if tipo=2 then id_categoria= 40 end if
if tipo=6 then id_categoria= 41 end if
if id_categoria="" then id_categoria=39 end if



if importe_total="" then importe_total=0 end if
if estado_pago="" then estado_pago=0 end if
if falta_pagar="" then falta_pagar=0 end if


%><%=id_alumno%>  // <%=id_programa%> // <%=apellidos%><%=nombre%> // <%=importe_total%><br /><%

if tipo=6 then tipo_text="Acad&eacute;mico" end if
mySQL="INSERT INTO programas (id_alumno,id_usuario,nom_item,nom_curso,nom_destino,id_categoria,fecha_in,f_inicio,f_fin,suma_total,estadoPago,falta_pagar,nom_categoria)"
mySQL=mySQL & "VALUES ("
	mySQL=mySQL & "" & id_alumno_new & ","
	mySQL=mySQL & "" & id_usuario_new & ","
	mySQL=mySQL & "'" & concepto_programa & "',"
	mySQL=mySQL & "'" & concepto_curso & "',"
	mySQL=mySQL & "'" & pais & "',"
	mySQL=mySQL & "" & id_categoria & ","
	mySQL=mySQL & "'" & dato_entrada & "',"
	mySQL=mySQL & "'" & fecha_inicio & "',"
	mySQL=mySQL & "'" & fecha_fin & "',"
	mySQL=mySQL & "'" & importe_total & "',"
	mySQL=mySQL & "'" & estado_pago & "',"
	mySQL=mySQL & "'" & falta_pagar & "',"
	mySQL=mySQL & "'" & tipo_text & "'"
	mySQL=mySQL & ");"
set ob_rs3=Ob_Connb.execute(mySQL)
end if

id_usuario_new=""
id_alumno_new=""

nombre=""
apellidos=""
calle=""
localidad=""
provincia=""
pais=""
numero=""
piso=""
puerta=""
codigo_postal=""
email=""
telefono=""
movil_alumno=""
movil_sms=""
fecha_nacimiento=""
pasaporte=""
expira=""
expedido=""
padre=""
madre=""
email_padre=""
email_madre=""
telefono_padre=""
telefono_madre=""
como_conocido=""
como_otro=""
observaciones=""
fecha=""
tipo_text=""
sexo=""
enfermedades_resenables=""
vegetariano=""
fumas=""
curso_anterior=""
organizacion=""
apellidos_padre=""
apellidos_madre=""
profesion_padre=""
profesion_madre=""
movil_padre=""
movil_madre=""
medicamentos=""
colegio=""
pref_contacto=""
a_direccion=""
permiso=""
fecha_nacimiento=""
enfermedades_resenables=""

u_nombre=""
u_apellidos=""
u_email=""
u_usuario=""
u_pass=""
u_telefono=""
u_movil=""
u_direccion=""
u_ciudad=""
u_c_postal=""
u_provincia=""
u_pais=""
fecha_in=""
habilitado="si"
u_nif=""
n_letter="si"



importe_total=""
estado_pago=""
falta_pagar=""



ob_rs.movenext
j=j+1
loop
end if%>