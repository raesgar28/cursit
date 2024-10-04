<%if id_item<>""then
'FLUCTUACIONES
fluctuacion_c=1
fluctuacion_a=1
'CASO CATEGORIA
Sql_R= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0 GROUP BY id_categoria" 
Set Ob_RS_R = Server.CreateObject("ADODB.Recordset")
Ob_RS_R.Open Sql_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs_R.eof then
do while not ob_rs_R.eof
if ob_rs_R("id_categoria")<>""then
Sql2_R= "SELECT fluctuacion, curso, alojamiento FROM fluctuaciones, fluctuaciones_rel WHERE fluctuaciones_rel.id_categoria="&ob_rs_R("id_categoria")&" and fluctuaciones_rel.id_fluctuacion=fluctuaciones.id_fluctuacion AND fluctuaciones.disponible='si'" 
Set Ob_RS2_R = Server.CreateObject("ADODB.Recordset")
Ob_RS2_R.Open Sql2_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs2_R.eof then
fluctua="si"
fluctuacion=ob_rs2_R("fluctuacion")
f_curso=ob_rs2_R("curso")
f_alojamiento=ob_rs2_R("alojamiento")
if f_curso="si" then fluctuacion_c = fluctuacion else fluctuacion_c=1 end if
if f_alojamiento="si" then fluctuacion_a = fluctuacion else fluctuacion_a=1 end if
else
fluctua="no"
fluctuacion=1
end if
ob_rs2_R.close
end if
ob_rs_R.movenext
loop
end if
ob_rs_R.close

'CASO SECCION
if fluctua<>"si" then
Sql_R= "SELECT id_seccion FROM rel WHERE id_item="&id_item&" and id_seccion<>0 GROUP BY id_seccion" 
Set Ob_RS_R = Server.CreateObject("ADODB.Recordset")
Ob_RS_R.Open Sql_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs_R.eof then
do while not ob_rs_R.eof
if ob_rs_R("id_seccion")<>""then
Sql2= "SELECT fluctuacion, curso, alojamiento FROM fluctuaciones, fluctuaciones_rel WHERE fluctuaciones_rel.id_seccion="&ob_rs_R("id_seccion")&" and fluctuaciones_rel.id_fluctuacion=fluctuaciones.id_fluctuacion AND fluctuaciones.disponible='si'" 
Set Ob_RS2_R = Server.CreateObject("ADODB.Recordset")
Ob_RS2_R.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2_R.eof then
fluctua="si"
fluctuacion=ob_rs2_R("fluctuacion")
f_curso=ob_rs2_R("curso")
f_alojamiento=ob_rs2_R("alojamiento")
if f_curso="si" then fluctuacion_c = fluctuacion else fluctuacion_c=1 end if
if f_alojamiento="si" then fluctuacion_a = fluctuacion else fluctuacion_a=1 end if
else
fluctua="no"
fluctuacion=1
end if
ob_rs2_R.close
end if
ob_rs_R.movenext
loop
end if
ob_rs_R.close
end if

'CASO SUBSECCION
if fluctua<>"si" then
Sql_R= "SELECT id_subseccion FROM rel WHERE id_item="&id_item&" and id_subseccion<>0 GROUP BY id_subseccion" 
Set Ob_RS_R= Server.CreateObject("ADODB.Recordset")
Ob_RS_R.Open Sql_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs_R.eof then
do while not ob_rs_R.eof
if ob_rs_R("id_subseccion")<>""then
Sql2_R= "SELECT fluctuacion, curso, alojamiento FROM fluctuaciones, fluctuaciones_rel WHERE fluctuaciones_rel.id_subseccion="&ob_rs_R("id_subseccion")&" and fluctuaciones_rel.id_fluctuacion=fluctuaciones.id_fluctuacion AND fluctuaciones.disponible='si'" 
Set Ob_RS2_R = Server.CreateObject("ADODB.Recordset")
Ob_RS2_R.Open Sql2_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs2_R.eof then
fluctua="si"
fluctuacion=ob_rs2_R("fluctuacion")
f_curso=ob_rs2_R("curso")
f_alojamiento=ob_rs2_R("alojamiento")
if f_curso="si" then fluctuacion_c = fluctuacion else fluctuacion_c=1 end if
if f_alojamiento="si" then fluctuacion_a = fluctuacion else fluctuacion_a=1 end if
else
fluctua="no"
fluctuacion=1
end if
ob_rs2_R.close
end if
ob_rs_R.movenext
loop
end if
ob_rs_R.close
end if

'CASO DESTINO
if fluctua<>"si" then
Sql_R= "SELECT id_destino FROM rel WHERE id_item="&id_item&" and id_destino<>0 GROUP BY id_destino" 
Set Ob_RS_R = Server.CreateObject("ADODB.Recordset")
Ob_RS_R.Open Sql_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs_R.eof then
if ob_rs_R("id_destino")<>""then
Sql2_R= "SELECT fluctuacion, curso, alojamiento FROM fluctuaciones, fluctuaciones_rel WHERE fluctuaciones_rel.id_destino="&ob_rs_R("id_destino")&" and fluctuaciones_rel.id_fluctuacion=fluctuaciones.id_fluctuacion AND fluctuaciones.disponible='si'" 
Set Ob_RS2_R = Server.CreateObject("ADODB.Recordset")
Ob_RS2_R.Open Sql2_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs2_R.eof then
fluctua="si"
fluctuacion=ob_rs2_R("fluctuacion")
f_curso=ob_rs2_R("curso")
f_alojamiento=ob_rs2_R("alojamiento")
if f_curso="si" then fluctuacion_c = fluctuacion else fluctuacion_c=1 end if
if f_alojamiento="si" then fluctuacion_a = fluctuacion else fluctuacion_a=1 end if
else
fluctua="no"
fluctuacion=1
end if
ob_rs2_R.close
end if
end if
ob_rs_R.close
end if

'CASO ITEMS
if fluctua<>"si" then
Sql_R= "SELECT fluctuacion, curso, alojamiento FROM fluctuaciones, fluctuaciones_rel WHERE fluctuaciones_rel.id_item="&id_item&" and fluctuaciones_rel.id_fluctuacion=fluctuaciones.id_fluctuacion AND fluctuaciones.disponible='si'" 
Set Ob_RS_R = Server.CreateObject("ADODB.Recordset")
Ob_RS_R.Open Sql_R, ob_conn,adOpenStatic, adCmdText
if not ob_rs_R.eof then
fluctua="si"
fluctuacion=ob_rs_R("fluctuacion")
f_curso=ob_rs_R("curso")
f_alojamiento=ob_rs_R("alojamiento")
if f_curso="si" then fluctuacion_c = fluctuacion else fluctuacion_c=1 end if
if f_alojamiento="si" then fluctuacion_a = fluctuacion else fluctuacion_a=1 end if
else
fluctua="no"
fluctuacion=1
end if
ob_rs_R.close
end if

'FIN FLUCTUACIONES
end if%>