<%rd="../"%>
<!--#include file="../conex/conex.asp"-->
<%id_item=request("id_item")
id_itemSub=request("id_itemSub")
semanas_p=request("semanas_p")
Sql= "SELECT gestion_aeropuertos FROM items WHERE id_item ="&id_item&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
end if
ob_rs.close
if id_itemSub<>""  then
Sql= "SELECT id_rel FROM rel WHERE id_itemSub ="&id_itemSub&" and id_itemSubAero<>0 "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
if gestion_aeropuertos<>"si" then gestion_grupos="si" end if
end if
ob_rs.close
Sql= "SELECT salidas, salida_dia, salida_mes, salida_fecha, salida_quincena0,salida_quincena1,salida_quincena2,salida_quincena3,salida_quincena4, pr_medico, pr_medico_ob, pr_cancelacion, pr_cancelacion_ob,tasas_aerop, tasas_aerop_ob, pr_examen, pr_examen_ob, con_examen, con_examen_act, pr_gestion_bill, pr_gestion_bill_ob, txt_aviso FROM itemsSub WHERE id_itemSub="&id_itemSub&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<h4><i class="fa fa-graduation-cap" aria-hidden="true"></i> Opciones del Curso <i class="fa fa-arrow-down" aria-hidden="true" style="float:right;"></i></h4>
<%if id_itemSub<>"" then
Sql2= "SELECT semanas FROM rel, itemsSubSemanas WHERE id_itemSub ="&id_itemSub&" AND rel.id_itemSubSemana=itemsSubSemanas.id_itemSubSemana AND itemsSubSemanas.semanas=53 "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
hay_extra="si"
end if
ob_rs2.close
end if
if semanas_p="" then semanas_p=0 end if
if id_itemSub<>"" and semanas_p<>"" and hay_extra<>"si" then 'CASO DE QUE SEA SIN SEMANA EXTRA
Sql2= "SELECT semanas FROM rel, itemsSubSemanas WHERE id_itemSub ="&id_itemSub&" AND rel.id_itemSubSemana=itemsSubSemanas.id_itemSubSemana AND rel.id_itemSubSemana<>0 ORDER BY semanas "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<select name="semanas" id="semanas" onChange="suma_total();" style="width:100%" autocomplete="off" class="selects">
<%do while not ob_rs2.eof%>
<option value="<%=ob_rs2("semanas")%>" <%if int(ob_rs2("semanas"))=int(semanas_p) then%>selected<%end if%>>
<%if int(ob_rs2("semanas"))=12 then%>Trimestre escolar.<%end if%>
<%if int(ob_rs2("semanas"))=16 then%>Cuatrimestre escolar.<%end if%>
<%if int(ob_rs2("semanas"))=24 then%>Semestre escolar.<%end if%>
<%if int(ob_rs2("semanas"))=52 then%>Año escolar.<%end if%>
<%if int(ob_rs2("semanas"))<>12 and int(ob_rs2("semanas"))<>24 and int(ob_rs2("semanas"))<>52then%>
<%=ob_rs2("semanas")%> semana<%if int(ob_rs2("semanas"))>1then%>s<%end if%>
<%end if%>
</option>
<%ob_rs2.movenext
loop%>
</select>
<%end if
ob_rs2.close
end if
if id_itemSub<>"" and semanas_p<>"" and hay_extra="si" then 'CASO DE QUE HAYA SEMANA EXTRA
Sql2= "SELECT semanas FROM rel, itemsSubSemanas WHERE id_itemSub ="&id_itemSub&" AND rel.id_itemSubSemana=itemsSubSemanas.id_itemSubSemana AND rel.id_itemSubSemana<>0 AND itemsSubSemanas.semanas<>53 ORDER BY semanas "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<span class="semanicas"><select name="semanas" id="semanas" onChange="suma_total();" style="width:100%" autocomplete="off" class="selects" >
<%do while not ob_rs2.eof%>
<option value="<%=ob_rs2("semanas")%>" <%if int(ob_rs2("semanas"))=int(semanas_p) then%>selected<%end if%>>
<%if int(ob_rs2("semanas"))=12 then%>Trimestre escolar.<%end if%>
<%if int(ob_rs2("semanas"))=16 then%>Cuatrimestre escolar.<%end if%>
<%if int(ob_rs2("semanas"))=24 then%>Semestre escolar.<%end if%>
<%if int(ob_rs2("semanas"))=52 then%>Año escolar.<%end if%>
<%if int(ob_rs2("semanas"))<>12 and int(ob_rs2("semanas"))<>24 and int(ob_rs2("semanas"))<>52then%>
<%=ob_rs2("semanas")%> semana<%if int(ob_rs2("semanas"))>1then%>s<%end if%>
<%end if%>
</option>
<%ultima_sem=ob_rs2("semanas")+1
ob_rs2.movenext
loop
do while ultima_sem<=52%>
<option value="<%=ultima_sem%>" >
<%if ultima_sem=12 then%>Trimestre escolar.<%end if%>
<%if ultima_sem=16 then%>Cuatrimestre escolar.<%end if%>
<%if ultima_sem=24 then%>Semestre escolar.<%end if%>
<%if ultima_sem=52 then%>Año escolar.<%end if%>
<%if ultima_sem<>12 and ultima_sem<>24 and ultima_sem<>52then%><%=ultima_sem%> semanas<%end if%>
</option>
<%ultima_sem=ultima_sem+1
loop%>
</select>
</span>
<style>.semanicas .dd .ddChild li{height:35px;}</style>
<%end if
ob_rs2.close
end if
if gestion_aeropuertos<>"si" and gestion_grupos<>"si" then
if ob_rs("salidas")="salida_fecha" then 'salida_fecha%>
<div class="input-group" style="margin-bottom:5px">
<input type="text" class="form-control"  aria-describedby="iconito" placeholder="Fecha de salida" style="min-height:40px" name="salida_fecha" value="<%=ob_rs("salida_fecha")%>" id="salida" onchange="fecheja();" readonly="readonly">
<span class="input-group-addon" id="iconito"><i class="fa fa-calendar"></i></span>
</div><input name="aero_ob" type="hidden" value="no"/><input name="quincena_ob" type="hidden" value="no"/><input name="salida_fecha_ob" type="hidden" value="si"/><input name="grupo_ob" type="hidden" value="no"/>
<%end if
if ob_rs("salidas")="salida_dias" then  'salida_dia%>
<div class="input-group" style="margin-bottom:5px">
<input type="text" class="form-control date-picker" aria-describedby="iconito" placeholder="Selecciona una fecha" style="min-height:40px" name="salida_fecha" id="salida_fecha" onchange="suma_total();" autocomplete="off">
<span class="input-group-addon" id="iconito"><i class="fa fa-calendar"></i></span>
</div><input name="aero_ob" type="hidden" value="no"/><input name="quincena_ob" type="hidden" value="no"/><input name="salida_fecha_ob" type="hidden" value="si"/><input name="grupo_ob" type="hidden" value="no"/>
<%if instr(ob_rs("salida_dia"),"Lunes") then datea_dia="1" end if
if instr(ob_rs("salida_dia"),"Martes") then datea_dia=datea_dia&"2" end if
if instr(ob_rs("salida_dia"),"Miercoles") then datea_dia=datea_dia&"3" end if
if instr(ob_rs("salida_dia"),"Jueves") then datea_dia=datea_dia&"4" end if
if instr(ob_rs("salida_dia"),"Viernes") then datea_dia=datea_dia&"5" end if
if instr(ob_rs("salida_dia"),"Sabado") then datea_dia=datea_dia&"6" end if
if instr(ob_rs("salida_dia"),"Domingo") then datea_dia=datea_dia&"7" end if
else%><input name="aero_ob" type="hidden" value="no"/><input name="grupo_ob" type="hidden" value="no"/><input name="quincena_ob" type="hidden" value="no"/><input name="salida_fecha_ob" type="hidden" value="no"/><%
end if
if ob_rs("salidas")="salida_meses" then 'salida_mes%>
<select name="salida_mes" id="salida" onChange="suma_total();" style="width:100%" class="selects" autocomplete="off">
<option value="0" title="">Selecciona Mes de Inicio</option>
<%if instr(ob_rs("salida_mes"),"Enero") then%><option value="Enero">Enero</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Febrero") then%><option value="Febrero">Febrero</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Marzo") then%><option value="Marzo">Marzo</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Abril") then%><option value="Abril">Abril</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Mayo") then%><option value="Mayo">Mayo</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Junio") then%><option value="Junio">Junio</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Julio") then%><option value="Julio">Julio</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Agosto") then%><option value="Agosto">Agosto</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Septiembre") then%><option value="Septiembre">Septiembre</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Noviembre") then%><option value="Noviembre">Noviembre</option><%end if%>
<%if instr(ob_rs("salida_mes"),"Diciembre") then%><option value="Diciembre">Diciembre</option><%end if%>
</select>
<input name="aero_ob" type="hidden" value="no"/><input name="salida_fecha_ob" type="hidden" value="no"/><input name="grupo_ob" type="hidden" value="no"/>
<%end if
if ob_rs("salidas")="salida_quincenas" then
if ob_rs("salida_quincena0")<>0 then
Sql2= "SELECT titulo_esp, f_inicio, f_fin, id_quincena FROM quincenas WHERE id_quincena="&ob_rs("salida_quincena0")&" or id_quincena="&ob_rs("salida_quincena1")&"  or id_quincena="&ob_rs("salida_quincena2")&"  or id_quincena="&ob_rs("salida_quincena3")&" or id_quincena="&ob_rs("salida_quincena4")&" ORDER BY titulo_esp"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<select name="salida_quincena" id="salida" onChange="suma_total();" style="width:100%" class="selects" autocomplete="off">
<option value="">Selecciona Quincena</option>
<%do while not ob_rs2.eof%>
<option value="<%=ob_rs2("id_quincena")%>"><%=ob_rs2("titulo_esp")%></option>
<%ob_rs2.movenext
loop%>
</select>
<input name="quincena_ob" type="hidden" value="si"/><input name="aero_ob" type="hidden" value="no"/><input name="salida_fecha_ob" type="hidden" value="no"/><input name="grupo_ob" type="hidden" value="no"/>
<%end if
ob_rs2.close
end if
end if
else'AEROPUERTOS
if gestion_aeropuertos="si"then
Sql2= "SELECT itemsSubAero.plazas, itemsSubAero.mes, itemsSubAero.completo, itemsSubAero.id_aeropuerto, aeropuertos.ciudad, rel.id_itemSubAero,aeropuertos.id_aeropuerto FROM itemsSubAero, rel, aeropuertos WHERE rel.id_itemSub="&id_itemSub&" and rel.id_itemSubAero=itemsSubAero.id_itemSubAero and itemsSubAero.id_aeropuerto=aeropuertos.id_aeropuerto ORDER BY orden_aer"
end if
if gestion_grupos="si"then
Sql2= "SELECT itemsSubAero.plazas, itemsSubAero.mes, itemsSubAero.completo, rel.id_itemSubAero FROM itemsSubAero, rel WHERE rel.id_itemSub="&id_itemSub&" and rel.id_itemSubAero=itemsSubAero.id_itemSubAero ORDER BY orden_aer"
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%if gestion_aeropuertos="si"then%><input name="aero_ob" type="hidden" value="si"/><input name="grupo_ob" type="hidden" value="no"/><%else%><input name="aero_ob" type="hidden" value="no"/><input name="grupo_ob" type="hidden" value="si"/><%end if%>
<select name="aeropuerto"<%if gestion_aeropuertos="si"then%> id="aeropuerto" <%else%> id="grupo" <%end if%>onChange="suma_total();" style="width:100%" class="selects" autocomplete="off">
<%if gestion_aeropuertos="si"then%><option value="">Aeropuerto de Salida</option><%else%><option value="">Selecciona grupo</option><%end if%>
<%do while not ob_rs2.eof
'CASO QUINCENA
Sql3= "SELECT id_quincena, id_itemSubAero FROM itemsSubAero WHERE id_itemSubAero="&ob_rs2("id_itemSubAero")&" and id_quincena<>0"
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
Sql3= "SELECT mes, id_itemSubAero FROM itemsSubAero WHERE id_itemSubAero="&ob_rs2("id_itemSubAero")&" and mes<>''"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
tit_mes=ob_rs3("mes")
end if
ob_rs3.close%>
<%if tit_quincena<>""then
if gestion_aeropuertos="si"then%>
<option value="<%=ob_rs2("aeropuertos.id_aeropuerto")%>|<%=id_quincena%>|<%=ob_rs2("id_itemSubAero")%>" <%if ob_rs2("completo")="si"then%>disabled="disabled"<%end if%> autocomplete="off">
<%=ob_rs2("ciudad")%> - <%=tit_quincena%></option>
<%end if
if gestion_grupos="si"then%>
<option value="0|<%=id_quincena%>|<%=ob_rs2("id_itemSubAero")%>" <%if ob_rs2("completo")="si"then%>disabled="disabled"<%end if%> autocomplete="off"><%=tit_quincena%></option>
<%end if
else
if tit_mes=""then tit_mes="Mes sin determinar"
if gestion_aeropuertos="si"then%>
<option value="<%=ob_rs2("aeropuertos.id_aeropuerto")%>|<%=tit_mes%>|<%=ob_rs2("id_itemSubAero")%>"><%=ob_rs2("ciudad")%> - <%=tit_mes%></option>
<%end if
if gestion_grupos="si"then%>
<option value="0|<%=tit_mes%>|<%=ob_rs2("id_itemSubAero")%>"><%=tit_mes%></option>
<%end if
end if
id_quincena=""
tit_quincena=""
tit_mes=""
ob_rs2.movenext
loop%>
</select>
<input name="quincena_ob" type="hidden" value="no"/>
<input name="salida_fecha_ob" type="hidden" value="no"/>
<%else%>
<input name="aero_ob" type="hidden" value="no"/>
<input name="grupo_ob" type="hidden" value="no"/>
<input name="quincena_ob" type="hidden" value="no"/>
<input name="salida_fecha_ob" type="hidden" value="no"/>
<%end if
ob_rs2.close
Sql2= "SELECT opcion_esp, opcion_ob, rel.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub="&id_itemSub&" AND rel.id_itemSubOp<>0 AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp AND itemsSubOp.transfer='si' ORDER BY opcion_orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<select name="transfer" id="transfer" onChange="suma_total();" style="width:100%" autocomplete="off" class="selects">
<option value="">Traslado Aeropuertos</option>
<%do while not ob_rs2.eof%>
<option value="<%=ob_rs2("id_itemSubOp")%>"><%=ob_rs2("opcion_esp")%></option>
<%ob_rs2.movenext
loop%>
</select>
<%end if
ob_rs2.close
end if%>
<div class="c-checkbox-list" >
<%if ob_rs("pr_medico")<>0 then%>
<div class="c-checkbox">
<%if ob_rs("pr_medico_ob")="si"then%>
<input type="checkbox" id="no" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Seguro médico</label>
<input type="hidden" name="pr_medico" value="si" />
<%else%>
<input type="checkbox" id="pr_medico" class="c-check" onclick="suma_total();" value="si" name="pr_medico" autocomplete="off">
<label for="pr_medico" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Seguro médico</label>
<%end if%>
</div>
<%end if
if ob_rs("pr_cancelacion")<>0 then%>
<div class="c-checkbox">
<%if ob_rs("pr_cancelacion_ob")="si"then%>
<input type="checkbox" id="no" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Seguro cancelación</label>
<input type="hidden" name="pr_cancelacion" value="si" />
<%else%>
<input type="checkbox" id="pr_cancelacion" class="c-check" onclick="suma_total();" value="si" name="pr_cancelacion" autocomplete="off">
<label for="pr_cancelacion" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Seguro cancelación</label>
<%end if%>
</div>
<%end if
if ob_rs("tasas_aerop")<>0 then%>
<div class="c-checkbox">
<%if ob_rs("tasas_aerop_ob")="si"then%>
<input type="checkbox" id="no" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Tasas aeropuerto</label>
<input type="hidden" name="tasas_aerop" value="si" />
<%else%>
<input type="checkbox" id="tasas_aerop" class="c-check" onclick="suma_total();" value="si" name="tasas_aerop" autocomplete="off">
<label for="tasas_aerop" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Tasas aeropuerto</label>
<%end if%>
</div>
<%end if
if ob_rs("pr_examen")<>0 and ob_rs("con_examen_act")="si"then%>
<div class="c-checkbox">
<%if ob_rs("pr_examen_ob")="si"then%>
<input type="checkbox" id="no" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no" class="check_txt"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("con_examen")%></label>
<input type="hidden" name="pr_examen" value="si" />
<%else%>
<input type="checkbox" id="pr_examen" class="c-check" onclick="suma_total();" value="si" name="pr_examen" autocomplete="off">
<label for="pr_examen" class="check_txt"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("con_examen")%></label>
<%end if%>
</div>
<%end if
if ob_rs("pr_gestion_bill")<>0 then%>
<div class="c-checkbox">
<%if ob_rs("pr_gestion_bill_ob")="si"then%>
<input type="checkbox" id="no" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Gestión billete avuón</label>
<input type="hidden" name="pr_gestion_bill" value="si" />
<%else%>
<input type="checkbox" id="pr_gestion_bill" class="c-check" onclick="suma_total();" value="si" name="pr_gestion_bill" autocomplete="off">
<label for="pr_gestion_bill" class="check_txt"><span></span><span class="check"></span><span class="box"></span> Gestión billete avión</label>
<%end if%>
</div>
<%end if%>
</div>
<%Sql2= "SELECT opcion_esp, opcion_pre, opcion_ob, itemsSubOp.id_itemSubOp FROM rel, itemsSubOp WHERE id_itemSub ="&id_itemSub&" AND rel.id_itemSubOp=itemsSubOp.id_itemSubOp AND transfer<>'si' ORDER BY opcion_orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
i=1%>
<div class="c-checkbox-list" >
<%do while not ob_rs2.eof%>
<div class="c-checkbox">
<%if ob_rs2("opcion_ob")="si"then%>
<input type="checkbox" id="no<%=i%>" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no<%=i%>" class="check_txt"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs2("opcion_esp")%></label>
<input type="hidden" name="opc[<%=i%>]" value="<%=ob_rs2("id_itemSubOp")%>" />
<%else%>
<input type="checkbox" id="opc[<%=i%>]" class="c-check" onclick="suma_total();" value="<%=ob_rs2("id_itemSubOp")%>" name="opc[<%=i%>]" autocomplete="off">
<label for="opc[<%=i%>]" class="check_txt" onclick="suma_total();"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs2("opcion_esp")%></label>
<%end if%>
</div>
<%ob_rs2.movenext
i=i+1
loop%>
</div>
<%end if
ob_rs2.close
if ob_rs("txt_aviso")<>""then%>
<div class="aviso_curso"><div style="height:auto;min-height:45px;float:left;width:30px"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></div><div><%=ob_rs("txt_aviso")%></div></div>
<%end if
end if
ob_rs.close
end if%>
<script language="Javascript" type="text/javascript">
$(".selects").msDropDown();<%if datea_dia<>""then%>datea('<%=datea_dia%>');<%end if%>suma_total();
</script>