<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%titulo_esp=trim(safeSTR(request("titulo_esp")))                          '[REQUEST]
texto_esp=trim(safeSTR2(request("texto_esp")))
fecha_in=now
fecha_mod=now         
id_categoria=request("id_categoria")
id_seccion=request("id_seccion")
id_subseccion=request("id_subseccion")
id_destino=request("id_destino")
id_item =request("id_item")     
id_usuario=request("id_usuario")
id_agente=request("id_agente")
id_alumno=request("id_alumno")
ciudad=trim(safeSTR(request("ciudad")))
provincia=trim(safeSTR(request("provincia")))
anyo=trim(request("anyo"))
mes=request("mes")
if anyo<>""then anyo=replace(anyo," ","") end if
if mes<>""then mes=replace(mes," ","") end if
if ciudad<>""then ciudad=replace(ciudad," ","") end if
if provincia<>"" then provincia=replace(provincia,", ",",") end if
'SELECCION
if id_usuario<>"" or id_agente<>"" then
seleccion = "SELECT * FROM programas, alumnos, usuarios WHERE id_programa IS NOT NULL "
else
seleccion = "SELECT * FROM programas, alumnos WHERE id_programa IS NOT NULL "
end if
if id_categoria<>""then 
cadena_rel = split(id_categoria, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (programas.id_categoria = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR programas.id_categoria = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_seccion<>""then 
cadena_rel = split(id_seccion, ",")
for i=0 to ubound(cadena_rel)
next
end if   
if id_subseccion<>""then 
cadena_rel = split(id_subseccion, ",")
for i=0 to ubound(cadena_rel)
seleccion= seleccion &" AND programas.id_subseccion = "&cadena_rel(i)&""
next
end if  
if id_item<>""then 
seleccion= seleccion &" AND ("
cadena_rel = split(id_item, ", ")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" programas.id_item LIKE  '%"&cadena_rel(i)&"%' "
else
seleccion= seleccion &" or programas.id_item LIKE  '%"&cadena_rel(i)&"%' "
end if
next
seleccion= seleccion &")"
end if 
if id_usuario<>""then 
cadena_rel = split(id_usuario, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (usuarios.id_usuario = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR usuarios.id_usuario = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_agente<>""then 
cadena_rel = split(id_agente, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (usuarios.id_usuario = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR usuarios.id_usuario = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_destino<>""then 
cadena_rel = split(id_destino, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (programas.id_destino = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR programas.id_destino = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_alumno<>""then 
cadena_rel = split(id_alumno, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (alumnos.id_alumno = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR alumnos.id_alumno = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if ciudad<>""then 
cadena_rel = split(ciudad, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (alumnos.a_ciudad = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR alumnos.a_ciudad = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if provincia<>""then 
cadena_rel = split(provincia, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (alumnos.a_provincia = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR alumnos.a_provincia = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if anyo<>""then 
cadena_rel = split(anyo, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (year(f_inicio) = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR year(f_inicio) = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if mes<>""then 
cadena_rel = split(mes, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (month(f_inicio) = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR month(f_inicio) = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if id_usuario<>"" or id_agente<>"" then
seleccion= seleccion &" AND alumnos.id_alumno=programas.id_alumno AND usuarios.id_usuario=programas.id_usuario "'AND a_email <>'' AND a_email IS NOT NULL
else
seleccion= seleccion &" AND alumnos.id_alumno=programas.id_alumno "'AND a_email <>'' AND a_email IS NOT NULL 
end if
seleccion = replace(seleccion, "'", "jpk2") 'jpk2 SON COMILLA SIMPLE
                                      '[FIN REQUEST]
if op="up" then
Sql= "SELECT titulo_esp from mailGrupo where titulo_esp='"&titulo_esp&"' and id_mail_grupo <> "&cod&""     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT titulo_esp from mailGrupo where titulo_esp='"&titulo_esp&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko")) 
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko") 
end if
end if													'[FIN CHEQUEAMOS QUE URL NO DENTRO IN]
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO mailGrupo (titulo_esp,texto_esp,fecha_in,seleccion)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & titulo_esp & "',"
mySQL=mySQL & "'" & texto_esp & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "'" & seleccion & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_mail_grupo) from mailGrupo") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE mailGrupo SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "seleccion = '" & seleccion & "'"
mySQL=mySQL & " WHERE id_mail_grupo = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR
seleccion = replace(seleccion, "jpk2", "'")
mySQL="DELETE FROM mailGrupo_tmp where id_mail_grupo =" & cod & " " 
set ob_rs2=Ob_connb.execute(mySQL)
 'jpk2 SON COMILLA SIMPLE
Sql= seleccion
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then
if cod<>"" then id_mail_grupo=cod end if
do while not ob_rs.eof
if id_seccion<>""then
if ob_rs("id_seccion")<>"" then
cadena_bd = split(ob_rs("id_seccion"), ",")
cadena_rel = split(id_seccion, ",")
for i = 0 to ubound(cadena_bd)
for a=0 to ubound(cadena_rel)
if int(cadena_rel(a))=int(cadena_bd(i)) then
Sql3= "SELECT id_mail_grupo from mailGrupo_tmp where id_alumno="&ob_rs("alumnos.id_alumno") &" and id_mail_grupo="&id_mail_grupo&""  'REVISAMOS QUE NO ESTÉ METIDO YA
Ob_Commandb.CommandText = Sql3
SET Ob_RS3 = Ob_Commandb.Execute ()
if not ob_rs3.eof then
else
mySQL="INSERT INTO mailGrupo_tmp (id_usuario,id_alumno,id_mail_grupo,id_programa)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & ob_rs("id_usuario") & ","
mySQL=mySQL & "" & ob_rs("alumnos.id_alumno") & ","
mySQL=mySQL & "" & id_mail_grupo & ","
mySQL=mySQL & "" & ob_rs("id_programa") & ""
mySQL=mySQL & ");"
set ob_rs2=Ob_Connb.execute(mySQL)
end if
end if
next
next
end if
end if
if id_destino<>""then
if ob_rs("id_destino")<>"" then
cadena_bd = split(ob_rs("id_destino"), ",")
cadena_rel = split(id_destino, ",")
for i = 0 to ubound(cadena_bd)
for a=0 to ubound(cadena_rel)
if int(cadena_rel(a))=int(cadena_bd(i)) then
Sql3= "SELECT id_mail_grupo from mailGrupo_tmp where id_alumno="&ob_rs("alumnos.id_alumno") &" and id_mail_grupo="&id_mail_grupo&""  'REVISAMOS QUE NO ESTÉ METIDO YA
Ob_Commandb.CommandText = Sql3
SET Ob_RS3 = Ob_Commandb.Execute ()
if not ob_rs3.eof then
else
mySQL="INSERT INTO mailGrupo_tmp (id_usuario,id_alumno,id_mail_grupo,id_programa)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & ob_rs("id_usuario") & ","
mySQL=mySQL & "" & ob_rs("alumnos.id_alumno") & ","
mySQL=mySQL & "" & id_mail_grupo & ","
mySQL=mySQL & "" & ob_rs("id_programa") & ""
mySQL=mySQL & ");"
set ob_rs2=Ob_Connb.execute(mySQL)
end if
end if
next
next
end if
end if
if id_seccion="" and id_destino="" then
mySQL="INSERT INTO mailGrupo_tmp (id_usuario,id_alumno,id_mail_grupo,id_programa)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
if id_usuario<>"" or id_agente<>"" then
mySQL=mySQL & "" & ob_rs("usuarios.id_usuario") & ","
else
mySQL=mySQL & "" & ob_rs("id_usuario") & ","
end if
mySQL=mySQL & "" & ob_rs("alumnos.id_alumno") & ","
mySQL=mySQL & "" & id_mail_grupo & ","
mySQL=mySQL & "" & ob_rs("id_programa") & ""
mySQL=mySQL & ");"
set ob_rs2=Ob_Connb.execute(mySQL)
'set ob_rs2 = Ob_Connb.execute("select MAX(id_mail_grupo) from mailGrupo") 
end if
ob_rs.movenext
loop
end if
ob_rs.close
mySQL="DELETE FROM mailRel where id_mail_grupo =" & cod & " " 
set ob_rs=Ob_connb.execute(mySQL)
if id_categoria<>""then 
cadena_rel = split(id_categoria, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_categoria,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if            
if id_seccion<>""then 
cadena_rel = split(id_seccion, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_seccion,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if  
if id_subseccion<>""then 
cadena_rel = split(id_subseccion, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_subseccion,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if id_destino<>""then 
cadena_rel = split(id_destino, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_destino,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if id_item<>""then 
cadena_rel = split(id_item, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_item,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if id_usuario<>""then 
cadena_rel = split(id_usuario, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_usuario,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if id_alumno<>""then 
cadena_rel = split(id_alumno, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_alumno,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if ciudad<>""then 
cadena_rel = split(ciudad, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (ciudad,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if provincia<>""then 
cadena_rel = split(provincia, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (provincia,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if anyo<>""then 
cadena_rel = split(anyo, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (anyo,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & cadena_rel(i) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if mes<>""then 
cadena_rel = split(mes, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (mes,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if id_agente<>""then 
cadena_rel = split(id_agente, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (id_agente,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if op="up" then
estado="Grupo modificado "&date
else
estado="Grupo creado "&date
end if
mySQL3="UPDATE mail SET "
mySQL3=mySQL3 & "estado =  '"& estado &"'"
mySQL3=mySQL3 & " WHERE id_mail_grupo = " & cod & "" 
set ob_rs3=Ob_Connb.execute(mySQL3)
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&pos=grupo"))
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&pos=grupo") 
'ob_rs.close	
ob_conn.close%>
</body></html>