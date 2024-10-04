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
<!--#include file="../../conex/conex.asp"--><!--#include file="../../conex/conex_back.asp"--><!--#include file="../lib/asp/comun.asp"-->
<%titulo_esp=trim(safeSTR(request("titulo_esp")))                          '[REQUEST]
texto_esp=trim(safeSTR2(request("texto_esp")))
fecha_in=now
fecha_mod=now 
d_fijo=request("d_fijo")
if IsNumeric(d_fijo) Then d_fijo=d_fijo else d_fijo=0 end if
if d_fijo<>0 then d_fijo=replace(d_fijo,".",",") end if
d_porcentaje=request("d_porcentaje")
if IsNumeric(d_porcentaje) Then d_porcentaje=d_porcentaje else d_porcentaje=0 end if
if d_porcentaje<>0 then d_porcentaje=replace(d_porcentaje,".",",") end if
fecha_inicio=trim(request("fecha_inicio"))
if IsDate(fecha_inicio) Then fecha_inicio=fecha_inicio else fecha_inicio="01/01/1000" end if
fecha_fin=trim(request("fecha_fin"))
if IsDate(fecha_fin) Then fecha_fin=fecha_fin else fecha_fin="01/01/1000" end if
repetible=request("repetible")
id_agente_s=request("id_agente_s")
if IsNumeric(id_agente_s) Then id_agente_s=id_agente_s else id_agente_s=0 end if
'canjeado
n_cupones=request("n_cupones")
if IsNumeric(n_cupones) Then n_cupones=n_cupones else n_cupones=0 end if
codigo=trim(safeSTR(request("codigo")))
activo=request("activo")
evento=trim(safeSTR(request("evento")))
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
if provincia<>""then provincia=replace(provincia," ","") end if
if op="up" then
Sql= "SELECT titulo_esp, codigo from descuentos where (titulo_esp='"&titulo_esp&"' or codigo = '"&codigo&"') and id_descuento <> "&cod&""     '[CHEQUEAMOS QUE URL NO DENTRO UP]
else
Sql= "SELECT titulo_esp, codigo from descuentos where titulo_esp='"&titulo_esp&"' or codigo = '"&codigo&"' "                              '[CHEQUEAMOS QUE URL NO DENTRO IN]
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
'SELECCION
                                      '[FIN REQUEST]
if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO descuentos (titulo_esp,texto_esp,fecha_in,d_fijo,d_porcentaje,fecha_inicio,fecha_fin,repetible,id_agente_s,n_cupones,codigo,activo,evento)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & titulo_esp & "',"
mySQL=mySQL & "'" & texto_esp & "',"
mySQL=mySQL & "'" & fecha_in & "',"
mySQL=mySQL & "" & d_fijo & ","
mySQL=mySQL & "" & d_porcentaje & ","
mySQL=mySQL & "'" & fecha_inicio & "',"
mySQL=mySQL & "'" & fecha_fin & "',"
mySQL=mySQL & "'" & repetible & "',"
mySQL=mySQL & "" & id_agente_s & ","
mySQL=mySQL & "" & n_cupones & ","
mySQL=mySQL & "'" & codigo & "',"
mySQL=mySQL & "'" & activo & "',"
mySQL=mySQL & "'" & evento & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
set ob_rs = Ob_Connb.execute("select MAX(id_descuento) from descuentos") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]


if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE descuentos SET "
mySQL=mySQL & "titulo_esp = '" & titulo_esp & "',"
mySQL=mySQL & "texto_esp = '" & texto_esp & "',"
mySQL=mySQL & "fecha_mod = '" & fecha_mod & "',"
mySQL=mySQL & "d_fijo = '" & d_fijo & "',"
mySQL=mySQL & "d_porcentaje = '" & d_porcentaje & "',"
mySQL=mySQL & "fecha_inicio = '" & fecha_inicio & "',"
mySQL=mySQL & "fecha_fin = '" & fecha_fin & "',"
mySQL=mySQL & "repetible = '" & repetible & "',"
mySQL=mySQL & "id_agente_s = " & id_agente_s & ","
mySQL=mySQL & "n_cupones = " & n_cupones & ","
mySQL=mySQL & "codigo = '" & codigo & "',"
mySQL=mySQL & "activo = '" & activo & "',"
mySQL=mySQL & "evento = '" & evento & "'"
mySQL=mySQL & " WHERE id_descuento = " & cod & "" 
set ob_rs=Ob_Connb.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR
seleccion = replace(seleccion, "jpk2", "'")
'mySQL="DELETE FROM mailGrupo_tmp where id_mail_grupo =" & cod & " " 
'set ob_rs2=Ob_connb.execute(mySQL)
mySQL="DELETE FROM descuentosRel where id_descuento =" & cod & " " 
set ob_rs=Ob_connb.execute(mySQL)
if id_categoria<>""then 
cadena_rel = split(id_categoria, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO descuentosRel (id_categoria,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (id_seccion,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (id_subseccion,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (id_destino,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (id_item,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (id_usuario,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (id_alumno,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (ciudad,id_descuento)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & trim(safeSTR(cadena_rel(i))) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if provincia<>""then 
mySQL="INSERT INTO descuentosRel (provincia,id_descuento)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & provincia & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
end if 
if anyo<>""then 
cadena_rel = split(anyo, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO descuentosRel (anyo,id_descuento)" 				
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
mySQL="INSERT INTO descuentosRel (mes,id_descuento)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "'" & cadena_rel(i) & "',"
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
if id_agente<>""then 
cadena_rel = split(id_agente, ",")
for i=0 to ubound(cadena_rel)
mySQL="INSERT INTO descuentosRel (id_agente,id_descuento)" 				
mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
mySQL=mySQL & "" & cadena_rel(i) & ","
mySQL=mySQL & "'" & cod & "'"
mySQL=mySQL & ");"
set ob_rs=Ob_Connb.execute(mySQL)
next
end if 
'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&pos=grupo"))
Response.Redirect "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&pos=grupo") 
'ob_rs.close	
ob_conn.close%>
</body></html>