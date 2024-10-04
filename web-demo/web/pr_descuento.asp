<%rd="../"%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%id_programa=request("id_programa_desc")
if id_programa="" then id_programa=request("id_programar") end if
if id_programa="" then id_programa=request("id_programa") end if
cod_descuento=request("cod_descuento")

pasa="si"
Sql= "SELECT cod_descuento FROM programas_tmp WHERE id_programa="&id_programa&" and (cod_descuento<>'' OR cod_descuento IS NOT NULL) "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
descuento_ya="si"
end if
if id_programa<>"" and cod_descuento<>"" and descuento_ya="" then
Sql= "SELECT id_alumno FROM programas_tmp WHERE id_programa="&id_programa&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_alumno=ob_rs("id_alumno")
f_inicio=date
end if
ob_rs.close


Sql= "SELECT a_provincia, a_ciudad, id_alumno_r FROM alumnos_tmp WHERE id_alumno="&id_alumno&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
a_provincia=ob_rs("a_provincia")
a_ciudad=ob_rs("a_ciudad")
id_alumno_r=ob_rs("id_alumno_r")
end if
ob_rs.close

if id_alumno_r<>"" and (a_provincia="" or a_ciudad="") then
Sql= "SELECT a_provincia, a_ciudad FROM alumnos WHERE id_alumno="&id_alumno_r&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
a_provincia=ob_rs("a_provincia")
a_ciudad=ob_rs("a_ciudad")
end if
ob_rs.close
end if

Sql= "SELECT id_descuento, n_cupones, fecha_inicio, fecha_fin,d_fijo, d_porcentaje,id_agente_s,canjes FROM descuentos WHERE codigo='"&cod_descuento&"' and activo='si' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_descuento=ob_rs("id_descuento")
fecha_inicio=ob_rs("fecha_inicio")
fecha_fin=ob_rs("fecha_fin")
n_cupones=ob_rs("n_cupones")
d_fijo=ob_rs("d_fijo")
d_porcentaje=ob_rs("d_porcentaje")
id_agente_s=ob_rs("id_agente_s")
canjes=ob_rs("canjes")
end if
ob_rs.close




if fecha_inicio<>"01/01/1000" AND fecha_fin <>"01/01/1000" then
if cdate(f_inicio)>=cdate(fecha_inicio) and cdate(f_inicio)<=cdate(fecha_fin) then pasa_fecha="si"
end if
if fecha_inicio="01/01/1000" AND fecha_fin <>"01/01/1000" then
if cdate(f_inicio)<=cdate(fecha_fin) then pasa_fecha="si"
end if
if fecha_inicio<>"01/01/1000" AND fecha_fin ="01/01/1000" then
if cdate(f_inicio)>=cdate(fecha_inicio) then pasa_fecha="si"
end if
if fecha_inicio="01/01/1000" AND fecha_fin ="01/01/1000" then pasa_fecha="si" end if

if n_cupones= 0 then pasa_n="si" end if

if n_cupones<>0 then
Sql= "SELECT cod_descuento FROM programas WHERE cod_descuento='"&cod_descuento&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
cod_desc=0
do while not ob_rs.eof
cod_desc=cod_desc+1
ob_rs.movenext
loop
end if
ob_rs.close
Sql= "SELECT cod_descuento FROM programas_tmp WHERE cod_descuento='"&cod_descuento&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
cod_desc_t=0
do while not ob_rs.eof
cod_desc_t=cod_desc_t+1
ob_rs.movenext
loop
end if
ob_rs.close
if cod_desc + cod_desc_t<n_cupones then pasa_n="si" end if
end if 'N cupones

if id_descuento<>"" and pasa_n="si" and pasa_fecha="si" then 
Sql= "SELECT id_descuento FROM descuentosRel WHERE id_alumno="&id_alumno&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close

if a_provincia<>"" then
Sql= "SELECT provincia FROM descuentosRel WHERE provincia='"&a_provincia&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if

if a_ciudad<>"" then
Sql= "SELECT ciudad FROM descuentosRel WHERE ciudad='"&a_ciudad&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
end if
end if' id_programa<>"" and cod_descuento<>"" then
if pasa="si" and id_descuento<>"" then
Sql= "SELECT suma_total FROM programas_tmp WHERE id_programa="&id_programa&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
suma_total_p=ob_rs("suma_total")
if d_fijo<>0 then
suma_total=ob_rs("suma_total")-d_fijo
else
if d_porcentaje<>0 then
suma_total=ob_rs("suma_total") - ((ob_rs("suma_total") * d_porcentaje) / 100 )
end if
end if
end if
ob_rs.close
if id_agente_s="" then id_agente_s=0 end if
mySQL="UPDATE programas_tmp SET "
mySQL=mySQL & "suma_total = '" & suma_total & "',"
mySQL=mySQL & "suma_total_p = '" & suma_total_p & "',"
mySQL=mySQL & "cod_descuento = '" & cod_descuento & "',"
mySQL=mySQL & "id_agente_cod = " & id_agente_s & ""
mySQL=mySQL & " WHERE id_programa = " & id_programa & "" 
set ob_rs=Ob_Connb.execute(mySQL)
canjes_n=canjes + 1
mySQL="UPDATE descuentos SET "
mySQL=mySQL & "canjes = " & canjes_n & ""
mySQL=mySQL & " WHERE id_descuento = " & id_descuento & "" 
set ob_rs=Ob_Connb.execute(mySQL)
mon="€"%>
<span class="respuesta_cod"><i class="fa fa-info-circle" style="font-size:3em;color:#CCC"></i><br />Precio total con descuento: <%=FormatNumber(ccur(suma_total),2)&"&nbsp;"&mon%></span>
<%end if'pasa si
if id_descuento="" then pasa="" end if
if pasa="" and descuento_ya="" then%>
<span class="cod_txt" style="color:#F00"><i class="fa fa-exclamation-triangle" style="margin-right:8px"></i>Código erróneo</span>
<div class="form-group"><i class="fa fa-barcode" aria-hidden="true"></i><input type="text" placeholder="Código agente" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código agente'" class="form-control c-square c-theme input-lg inp"  name="cod_descuento" id="cod_descuento"></div>
<button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-10" onClick="ap_descuento();"><i class="fa fa-edit" aria-hidden="true"></i> Aplicar código </button>
<%end if
if descuento_ya="si" then%>
<span class="respuesta_cod"><i class="fa fa-info-circle" style="font-size:3em;color:#CCC"></i><br />Código  ya aplicado anteriormente</span>
<%end if%>