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

temporada=request("temporada")
meses=request("meses")
curso=request("curso")
tipo=request("tipo")
forma_pago=request("forma_pago")
dias=request("dias")
estado=request("estado")
profesores=request("profesores")




'SELECCION


seleccion = "SELECT * FROM academia_clases INNER JOIN academia_alumnos ON academia_clases.id_alumno = academia_alumnos.id_alumno WHERE academia_clases.id_clase <> null "







'TEMPORADA
if temporada<>""then 
cadena_rel = split(temporada, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (academia_clases.id_precio = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR academia_clases.id_precio = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if   



'PROFESORES
if profesores<>""then 
cadena_rel = split(profesores, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (academia_clases.id_profesor = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR academia_clases.id_profesor = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 

'DIAS
if dias<>""then 
cadena_rel = split(dias, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND ("

if cadena_rel(i)="Lunes" then  
seleccion= seleccion & " academia_clases.lunes='si' " 
end if
if cadena_rel(i)="Martes" then  
seleccion= seleccion & " academia_clases.martes='si' " 
end if
if cadena_rel(i)="Miercoles" then  
seleccion= seleccion & " academia_clases.miercoles='si' " 
end if
if cadena_rel(i)="Jueves" then  
seleccion= seleccion & " academia_clases.jueves='si' " 
end if
if cadena_rel(i)="Viernes" then  
seleccion= seleccion & " academia_clases.viernes='si' " 
end if
if cadena_rel(i)="Sabado" then  
seleccion= seleccion & " academia_clases.sabado='si' " 
end if

else

if trim(cadena_rel(i))="Lunes" then
seleccion= seleccion &" OR academia_clases.lunes = 'si' "
end if
if trim(cadena_rel(i))="Martes" then 
seleccion= seleccion &" OR academia_clases.martes = 'si' "
end if
if trim(cadena_rel(i))="Miercoles" then 
seleccion= seleccion &" OR academia_clases.miercoles = 'si' "
end if
if trim(cadena_rel(i))="Jueves" then
seleccion= seleccion &" OR academia_clases.jueves = 'si' "
end if
if trim(cadena_rel(i))="Viernes" then 
seleccion= seleccion &" OR academia_clases.viernes = 'si' "
end if
if trim(cadena_rel(i))="Sabado" then 
seleccion= seleccion &" OR academia_clases.sabado = 'si' "
end if
end if
next
seleccion= seleccion&")"
end if 



























'MESES
if meses<>""then 
cadena_rel = split(meses, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND ("
if cadena_rel(i)="septiembre" then  
seleccion= seleccion & " academia_clases.septiembre='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.septiembre_p = '"&forma_pago&"')"end if 
septiembre_cuenta="si"
end if
if cadena_rel(i)="octubre" then  
seleccion= seleccion & " academia_clases.octubre='si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.octubre_p = '"&forma_pago&"')" end if
octubre_cuenta="si"
end if
if cadena_rel(i)="noviembre" then  
seleccion= seleccion & " academia_clases.noviembre='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.noviembre_p = '"&forma_pago&"')" end if
noviembre_cuenta="si"
end if
if cadena_rel(i)="diciembre" then  
seleccion= seleccion & " academia_clases.diciembre='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.diciembre_p = '"&forma_pago&"')" end if
diciembre_cuenta="si"
end if
if cadena_rel(i)="enero" then  
seleccion= seleccion & " academia_clases.enero='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.enero_p = '"&forma_pago&"')" end if
enero_cuenta="si"
end if
if cadena_rel(i)="febrero" then  
seleccion= seleccion & " academia_clases.febrero='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.febrero_p = '"&forma_pago&"')" end if
febrero_cuenta="si"
end if
if cadena_rel(i)="marzo" then  
seleccion= seleccion & " academia_clases.marzo='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.marzo_p = '"&forma_pago&"')" end if
marzo_cuenta="si"
end if
if cadena_rel(i)="abril" then  
seleccion= seleccion & " academia_clases.abril='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.abril_p = '"&forma_pago&"')" end if
abril_cuenta="si"
end if
if cadena_rel(i)="mayo" then  
seleccion= seleccion & " academia_clases.mayo='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.mayo_p = '"&forma_pago&"')" end if
mayo_cuenta="si"
end if
if cadena_rel(i)="junio" then  
seleccion= seleccion & " academia_clases.junio='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.junio_p = '"&forma_pago&"')" end if
junio_cuenta="si"
end if
if cadena_rel(i)="julio" then  
seleccion= seleccion & " academia_clases.julio='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.julio_p = '"&forma_pago&"')" end if
julio_cuenta="si"
end if
if cadena_rel(i)="agosto" then  
seleccion= seleccion & " academia_clases.agosto='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.agosto_p = '"&forma_pago&"')" end if
agosto_cuenta="si"
end if
else
if trim(cadena_rel(i))="septiembre" then 
seleccion= seleccion &" OR academia_clases.septiembre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.septiembre_p = '"&forma_pago&"')" end if 
septiembre_cuenta="si"
end if
if trim(cadena_rel(i))="octubre" then 
seleccion= seleccion &" OR academia_clases.octubre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.octubre_p = '"&forma_pago&"')" end if 
octubre_cuenta="si"
end if
if trim(cadena_rel(i))="noviembre" then 
seleccion= seleccion &" OR academia_clases.noviembre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.noviembre_p = '"&forma_pago&"')" end if 
noviembre_cuenta="si"
end if
if trim(cadena_rel(i))="diciembre" then 
seleccion= seleccion &" OR academia_clases.diciembre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.diciembre_p = '"&forma_pago&"')" end if 
diciembre_cuenta="si"
end if
if trim(cadena_rel(i))="enero" then 
seleccion= seleccion &" OR academia_clases.enero = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.enero_p = '"&forma_pago&"')" end if 
enero_cuenta="si"
end if
if trim(cadena_rel(i))="febrero" then 
seleccion= seleccion &" OR academia_clases.febrero = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.febrero_p = '"&forma_pago&"')" end if 
febrero_cuenta="si"
end if
if trim(cadena_rel(i))="marzo" then 
seleccion= seleccion &" OR academia_clases.marzo = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.marzo_p = '"&forma_pago&"')" end if 
marzo_cuenta="si"
end if
if trim(cadena_rel(i))="abril" then 
seleccion= seleccion &" OR academia_clases.abril = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.abril_p = '"&forma_pago&"')" end if 
abril_cuenta="si"
end if
if trim(cadena_rel(i))="mayo" then 
seleccion= seleccion &" OR academia_clases.mayo = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.mayo_p = '"&forma_pago&"')" end if 
mayo_cuenta="si"
end if
if trim(cadena_rel(i))="junio" then 
seleccion= seleccion &" OR academia_clases.junio = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.junio_p = '"&forma_pago&"')" end if 
junio_cuenta="si"
end if
if trim(cadena_rel(i))="julio" then 
seleccion= seleccion &" OR academia_clases.julio = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.julio_p = '"&forma_pago&"')" end if 
julio_cuenta="si"
end if
if trim(cadena_rel(i))="agosto" then 
seleccion= seleccion &" OR academia_clases.agosto = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.agosto_p = '"&forma_pago&"')" end if 
agosto_cuenta="si"
end if
end if
next
seleccion= seleccion&")"
end if 

























'ESTADO
if estado<>""then 
seleccion= seleccion &" AND (year(academia_clases.fecha_baja) <> 1000 AND year(academia_clases.fecha_baja) <> 2001 AND academia_clases.fecha_baja <> null)"
end if


'CURSOS 
if curso<>""then 
cadena_rel = split(curso, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (academia_alumnos.grupo = '"&trim(cadena_rel(i))&"'"
else
seleccion= seleccion &" OR academia_alumnos.grupo = '"&trim(cadena_rel(i))&"'"
end if
next
seleccion= seleccion&")"
end if 

'PAGOS
if forma_pago<>"" and meses="" then 
seleccion= seleccion &" AND (academia_clases.septiembre_p = '"&forma_pago&"' OR academia_clases.octubre_p = '"&forma_pago&"' OR academia_clases.noviembre_p = '"&forma_pago&"' OR academia_clases.diciembre_p = '"&forma_pago&"' OR academia_clases.enero_p = '"&forma_pago&"' OR academia_clases.febrero_p = '"&forma_pago&"' OR academia_clases.marzo_p = '"&forma_pago&"' OR academia_clases.abril_p = '"&forma_pago&"' OR academia_clases.mayo_p = '"&forma_pago&"' OR academia_clases.junio_p = '"&forma_pago&"' OR academia_clases.julio_p = '"&forma_pago&"' OR academia_clases.agosto_p = '"&forma_pago&"')"
end if 


seleccion = replace(seleccion, "'", "jpk2") 'jpk2 SON COMILLA SIMPLE



                                      '[FIN REQUEST]
if op="up" then
Sql= "SELECT titulo_esp from mailGrupo where titulo_esp='"&titulo_esp&"' and id_mail_grupo <> "&cod&""     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT titulo_esp from mailGrupo where titulo_esp='"&titulo_esp&"'"                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText




if not ob_rs.eof then
if op="up" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko")) 
'Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko&cod="&cod&"&ms=ko") 
end if
if op="in" then 
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko")) 
'Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ms=ko") 
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
set ob_rs=Ob_Connc.execute(mySQL)
set ob_rs = Ob_Connc.execute("select MAX(id_mail_grupo) from mailGrupo") 
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
set ob_rs=Ob_Connc.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR




seleccion = replace(seleccion, "jpk2", "'")
mySQL="DELETE FROM mailGrupo_tmp where id_mail_grupo =" & cod & " " 
set ob_rs2=Ob_connc.execute(mySQL)
 'jpk2 SON COMILLA SIMPLE
Sql= seleccion
Set ob_rs = Server.CreateObject("ADODB.Recordset")

%><%=seleccion%> kl<%


ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText




if not ob_rs.eof then
if cod<>"" then id_mail_grupo=cod end if
do while not ob_rs.eof
mySQL="INSERT INTO mailGrupo_tmp (id_alumno,id_mail_grupo,id_programa)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & ob_rs("academia_alumnos.id_alumno") & ","
mySQL=mySQL & "" & id_mail_grupo & ","
mySQL=mySQL & "" & ob_rs("id_clase") & ""
mySQL=mySQL & ");"
set ob_rs2=Ob_Connc.execute(mySQL)
ob_rs.movenext
loop
end if
ob_rs.close
mySQL="DELETE FROM mailRel where id_mail_grupo =" & cod & " " 
set ob_rs=Ob_connc.execute(mySQL)
      





      

if temporada<>""then 
cadena_rel = split(temporada, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (temporada,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
next
end if 

if profesores<>"" then 
cadena_rel = split(profesores, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (profesores,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
next
end if 

if dias<>"" then
cadena_rel = split(dias, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (dias,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
next
end if 


if meses<>"" then
cadena_rel = split(meses, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (meses,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
next
end if 

if estado<>"" then
cadena_rel = split(estado, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (estado,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
next
end if 


if curso<>"" then
cadena_rel = split(curso, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (curso,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
next
end if


if forma_pago<>"" then
cadena_rel = split(forma_pago, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO mailRel (forma_pago,id_mail_grupo)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connc.execute(mySQL)
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
set ob_rs3=Ob_Connc.execute(mySQL3)






'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&pos=grupo"))
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&pos=grupo") 
'ob_rs.close	
ob_conn.close%>
</body></html>