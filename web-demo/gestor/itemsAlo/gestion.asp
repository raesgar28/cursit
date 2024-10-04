<!--#include file="../comun/menu_sup.asp"-->  <br>
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<%Sql= "SELECT titulo_esp,id_item from items where id_item="&cod&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_programa=ob_rs("titulo_esp")
end if
ob_rs.close


if cod<>""then
Dim id_alojamiento_(20),titulo_esp_(20),texto_esp_(20),orden_(20),tasas_(20),tipo_alo_(20)
'ALOJAMIENTOS////////////////////////////////////////////////////
Sql= "SELECT id_item, id_alojamiento, id_alo_opcion, id_suplemento from rel where id_item="&cod&" and id_alojamiento<>0 and id_alo_opcion=0 and id_suplemento=0"    
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
id_alojamiento=ob_rs("id_alojamiento")
if id_alojamiento<>""then
Sql2= "SELECT id_alojamiento, titulo_esp, texto_esp, orden, tasas, tipo_alo from alo_conceptos where id_alojamiento="&id_alojamiento&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("orden")=i then 
execute("id_alojamiento_"& i & "= ob_rs2(""id_alojamiento"")")
execute("titulo_esp_"& i & "= ob_rs2(""titulo_esp"")")
execute("texto_esp_"& i & "= ob_rs2(""texto_esp"")")
execute("orden_"& i & "= ob_rs2(""orden"")")
execute("tasas_"& i & "= ob_rs2(""tasas"")")
execute("tipo_alo_"& i & "= ob_rs2(""tipo_alo"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close    'FIN ALOJAMIENTOS////////////////////////////////////////////////////
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>

<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión  Alojamientos | <%=tit_programa%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&cod_cat="&cod_cat))%><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&cod_cat="&cod_cat)%>"><i class="fa fa-undo" aria-hidden="true"></i> Volver al Programa </a></li>
<li class="active">Gestión Alojamientos </li>
</ol>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar">
<span class="sr-only">Toggle navigation</span>
<span class="toggle-icon">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</span>
</button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Alojamiento</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat="))%>
<a href="<%=r%>subSecciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=")%>"><i class="icon-note"></i> Subsecciones Cursos 
<%if num_ss<>""then%><span class="baddge badge badge-default"> <%=num_ss%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat))%><a href="<%=r%>categorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat)%>"><i class="icon-note"></i> Gestión Categorías<%if num_c<>""then%><span class="baddge badge badge-default"> <%=num_c%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat="))%>
<a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat=")%>"><i class="icon-note"></i> Gestión Webs <%if num_w<>""then%><span class="baddge badge badge-default"> <%=num_w%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
</ul>
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&cod_cat="&cod_cat))%><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&cod_cat="&cod_cat)%>"><i class="fa fa-undo" aria-hidden="true"></i> Volver al Programa </a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión  Alojamiento | <%=tit_programa%></span></div>
<!--NAV TABS-->
</div>
<div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="edi" type="hidden" value="<%=edi%>">
<input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Este nombre de alojamiento ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->


<div class="tab-pane" id="tab_4">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="cursos_alo form-group form-md-line-input">
<div class="col-md-12"> <button class="in_alo btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir alojamiento <i class="fa fa-home" aria-hidden="true" style="margin-left:7px;"></i></button></div>
</div>
<div class="panel-group accordion scrollable" id="acordeon" >
<%i_alojamientos=1
if cod<>"" then
Sql= "SELECT rel.id_item, rel.id_alojamiento, alo_conceptos.id_alojamiento,rel.id_alo_opcion, rel.id_suplemento from rel, alo_conceptos  where id_item="&cod&" and rel.id_alojamiento=alo_conceptos.id_alojamiento and rel.id_alojamiento<>0 and id_item="&cod&" and rel.id_alojamiento<>0 and rel.id_alo_opcion=0 and rel.id_suplemento=0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_alo=ob_rs.RecordCount
end if
ob_rs.close
if tot_alo=""then tot_alo=1
do while i_alojamientos<=tot_alo
execute("id_alojamiento_b=id_alojamiento_"&i_alojamientos)
execute("alo_con_titulo_esp_b=titulo_esp_"&i_alojamientos)
execute("texto_esp_alo_b=texto_esp_"&i_alojamientos)
execute("orden_alo_con_b=orden_"&i_alojamientos)
execute("tasas_alo_con_b=tasas_"&i_alojamientos)
execute("id_tipo_alo_con_b=tipo_alo_"&i_alojamientos)
z=i_alojamientos%>
<div class="panel panel-default fila_alo" style="border:none;margin-bottom:5px" >
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_<%=z%>"><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i><%if alo_con_titulo_esp_b<>""then%><%=alo_con_titulo_esp_b%><%else%>Alojamiento.<%end if%></a></h4></div>
<div id="acordeon_<%=z%>" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-12" >
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="alo_con_titulo_esp_1" >Alojamiento.<span class="required">*</span></label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="alo_con_titulo_esp_[<%=z%>]" id="alo_con_titulo_esp_1"  maxlength="160" value="<%=alo_con_titulo_esp_b%>"><div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true"></i><span class="help-block">Concepto (Familia Estándard i.e.)</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="texto_esp_alo_1">Nota.</label>
<div class="col-md-7"><div class="input-icon"><textarea class="form-control" name="texto_esp_alo_[<%=z%>]" id="texto_esp_alo_[<%=z%>]" rows="2"><%=texto_esp_alo_b%></textarea><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">nota informativa</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="orden_alo_con_1" >Orden.</label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="orden_alo_con form-control" placeholder="" name="orden_alo_con_[<%=z%>]" id="orden_alo_con_1" <%if cod<>"" and orden_alo_con_b <>""then%>value="<%=orden_alo_con_b%>"<%else%>value="<%=z%>" <%end if%> maxlength="160" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block" >introduce un número</span></div></div></div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_tipo_alo_con_1" >Tipo.<span class="required">*</span></label>
<div class="col-md-7">
<div class="input-icon">
<select id="id_tipo_alo_con_<%=z%>" name="id_tipo_alo_con_[<%=z%>]" style="width:100%">
<option value="" >&nbsp;</option>
<%Sql= "SELECT id_alo_tipo, titulo_esp from alo_tipo "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText

if not ob_rs.eof then
do while not ob_rs.eof
id_tipo_alo_a=ob_rs("id_alo_tipo")
if id_tipo_alo_a<>"" and id_alojamiento_b <>"" then
Sql2= "SELECT id_alojamiento, tipo_alo from alo_conceptos where tipo_alo="&id_tipo_alo_a&" and id_alojamiento="&id_alojamiento_b&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel_tipo_alo="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("id_alo_tipo")%>" <%if sel_tipo_alo="si"then%>selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
sel_tipo_alo=""
id_tipo_alo_a=""
loop
end if
ob_rs.close%>
</select>
<div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="titulo_esp" >Tasas.</label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_alo_con_[<%=z%>]" id="tasas_alo_con_1"  maxlength="160" value="<%=tasas_alo_con_b%>" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block" style="max-width:120px">precio</span></div></div></div>
<%'if alo_op_titulo_esp_b<>""then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="alo_con_titulo_esp_<%=z%>" >Eliminar.</label>
<div class="col-md-7">
<div class="md-checkbox" style="margin-top:4px"><input type="checkbox" name="alo_del_[<%=z%>]" id="alo_del_<%=z%>" class="md-check pull-right" value="si"><label for="alo_del_<%=z%>"><span></span><span class="check"></span><span class="box"></span></label></div><script>$("[name='alo_del_[<%=z%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script></div></div>
<%'end if%>
</div>
<!--OPCIONES ALOJAMIENTOS-->
<div class="col-md-12" style="text-align:left">
<div style="width:100%;overflow:auto">
<div class="form-group form-md-line-input col-md-12" style="border-top:1px solid #ddd;padding-top:20px"><button class="in_alo_concept_<%=z%> btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Opción <i class="fa fa-bed" aria-hidden="true" style="margin-left:8px"></i></button></div>
<table class="table table-striped table-bordered table-hover" style="min-width:750px;">
<thead>
<tr>
<th width="20%">Opción.</th>
<th width="10%">Precio /sem.</th>
<th width="10%">Coste real.</th>
<th width="7%">Tasas.</th>
<th width="30%">Resumen.</th>
<th width="8%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<%if id_alojamiento_b<>""then
Sql2= "SELECT rel.id_item, rel.id_alojamiento, rel.id_alo_opcion, rel.id_suplemento, alo_opciones.id_alo_opcion, alo_opciones.titulo_esp, alo_opciones.tasas, alo_opciones.precio, alo_opciones.precio_coste, alo_opciones.orden, alo_opciones.texto_esp, alo_opciones.op_alo from rel, alo_opciones  where rel.id_item="&cod&" and rel.id_alojamiento<>0 and rel.id_alo_opcion<>0 and rel.id_alojamiento="&id_alojamiento_b&" and rel.id_suplemento=0 and rel.id_alo_opcion=alo_opciones.id_alo_opcion order by alo_opciones.orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
i_alo_opciones=1
do while not ob_rs2.eof%>
<tbody class="cursos_alo_concept_in_<%=z%>">
<tr class="fila_alo_concept_<%=z%>">

<td>
<select id="id_op_alo_con_<%=z%>" name="id_op_alo_con_[<%=z%>,<%=i_alo_opciones%>]" style="width:100%">
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<option value="0" >&nbsp;</option>
<%do while not ob_rs.eof
id_op_alo_a=ob_rs("id_alo_op")
if id_op_alo_a<>""  then
Sql3= "SELECT id_alo_opcion, op_alo from alo_opciones where op_alo="&id_op_alo_a&" and id_alo_opcion="&ob_rs2("alo_opciones.id_alo_opcion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
sel_op_alo="si"
end if
ob_rs3.close
end if%>
<option value="<%=ob_rs("id_alo_op")%>" <%if sel_op_alo="si"then%>selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
sel_op_alo=""
id_op_alo_a=""
loop
end if
ob_rs.close%>
</select>
</td>

<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_[<%=z%>,<%=i_alo_opciones%>]" id="precio_alo_op_1" value="<%=ob_rs2("precio")%>"></td>
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_[<%=z%>,<%=i_alo_opciones%>]" id="precio_alo_op_r_1" value="<%=ob_rs2("precio_coste")%>"></td>
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_[<%=z%>,<%=i_alo_opciones%>]" id="tasas_alo_op_1" value="<%=ob_rs2("tasas")%>"></td>
<input type="hidden" class="form-control orden_alo_op_<%=z%>" placeholder="" name="orden_alo_op_[<%=z%>,<%=i_alo_opciones%>]" id="orden_alo_op_1" <%if cod="" then%>value="1"<%else%>value="<%=ob_rs2("orden")%>"<%end if%>>
<td><textarea class="form-control" name="texto_esp_alo_op_[<%=z%>,<%=i_alo_opciones%>]" id="texto_esp_alo_op_[<%=z%>,<%=i_alo_opciones%>]" rows="1"><%=replace(ob_rs2("texto_esp"),"<br />",vbCrLf)%></textarea></td>
<td style="padding-top:15px;text-align:center;"><%if ob_rs2("op_alo")<>""then%><div class="md-checkbox"><input type="checkbox" name="alo_del_op_[<%=z%>,<%=i_alo_opciones%>]" id="alo_del_op_[<%=z%>,<%=i_alo_opciones%>]" class="md-check" value="si"><label for="alo_del_op_[<%=z%>,<%=i_alo_opciones%>]"><span></span><span class="check"></span><span class="box"></span></label></div><script>$("[name='alo_del_op_[<%=z%>,<%=i_alo_opciones%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script><%end if%></td>
</tr>
</tbody>
<%ob_rs2.movenext
i_alo_opciones=i_alo_opciones+1
loop
else%>
<tbody class="cursos_alo_concept_in_<%=z%>">
<tr class="fila_alo_concept_<%=z%>">

<td>
<select id="id_op_alo_con_1" name="id_op_alo_con_[<%=z%>,1]" style="width:100%">
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_alo_op")%>"><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
</td>

<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_[<%=z%>,1]" id="precio_alo_op_1" value=""></td>
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_[<%=z%>,1]" id="precio_alo_op_r_1" value=""></td>
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_[<%=z%>,1]" id="tasas_alo_op_1" value=""></td>
<input type="hidden" class="form-control orden_alo_op_<%=z%>" placeholder="" name="orden_alo_op_[<%=z%>,1]" id="orden_alo_op_1" value="1">
<td><textarea class="form-control" name="texto_esp_alo_op_[<%=z%>,1]" id="texto_esp_alo_op_[<%=z%>,1]" rows="1"></textarea></td>
<td style="padding-top:15px;text-align:center;"></td>
</tr>
</tbody>
<%end if
ob_rs2.close
else%>
<tbody class="cursos_alo_concept_in_<%=z%>">
<tr class="fila_alo_concept_<%=z%>">

<td>
<select id="id_op_alo_con_1" name="id_op_alo_con_[<%=z%>,1]" style="width:100%">
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_alo_op")%>"><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
</td>

<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_[<%=z%>,1]" id="precio_alo_op_1" value=""></td>
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_[<%=z%>,1]" id="precio_alo_op_r_1" value=""></td>
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_[<%=z%>,1]" id="tasas_alo_op_1" value=""></td>
<input type="hidden" class="form-control orden_alo_op_<%=z%>" placeholder="" name="orden_alo_op_[<%=z%>,1]" id="orden_alo_op_1" value="1">
<td><textarea class="form-control" name="texto_esp_alo_op_[<%=z%>,1]" id="texto_esp_alo_op_[<%=z%>,1]" rows="1"></textarea></td>
<td style="padding-top:15px;text-align:center;"></td>
</tr>
</tbody>
<%end if%>
<script>
$('.in_alo_concept_<%=z%>').one('click',function(){}).click(function(){
var n = $('.fila_alo_concept_<%=z%>').length + 1;
if( 16 < n ) {$('#alerta_cursos_alo').modal();return false;}
x=n;
var box_htmlF = $('<tr class="fila_alo_concept_<%=z%>">\
<td><select id="id_op_alo_con_'+x+'" name="id_op_alo_con_[<%=z%>,'+x+']" style="width:100%">\
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%>\
<%do while not ob_rs.eof%>\
<option value="<%=ob_rs("id_alo_op")%>"><%=ob_rs("titulo_esp")%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%>\
</select>\
</td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_[<%=z%>,'+x+']" id="precio_alo_op_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_[<%=z%>,'+x+']" id="precio_alo_op_r_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_[<%=z%>,'+x+']" id="tasas_alo_op_'+x+'" value=""></td>\
<input type="hidden" class="form-control orden_alo_op_<%=z%>" placeholder="" name="orden_alo_op_[<%=z%>,'+x+']" id="orden_alo_op_'+x+'" value="'+x+'">\
<td><textarea class="form-control" name="texto_esp_alo_op_[<%=z%>,'+x+']" id="texto_esp_alo_op_[<%=z%>,'+x+']" rows="1"></textarea></td>\
<td style="text-align:center;"><button class="alo_del_op btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmlF.hide();
$('.fila_alo_concept_<%=z%>:last').after(box_htmlF);
box_htmlF.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false;});

$('.cursos_alo_concept_in_<%=z%>').on('click', '.alo_del_op', function(){
if( $('.fila_alo_concept_<%=z%>').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();
$(".orden_alo_op_<%=z%>").each(function(index){$(this).val( index + 1);});});
};return false;
});
</script>
</table>
</div>
</div>
<!--OPCIONES ALOJAMIENTOS SUPLEMENTOS-->
<div class="col-md-12" style="text-align:left">
<div style="width:100%;overflow:auto">

<div class="form-group col-md-12">
<button class="in_alo_tem_<%=z%> btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir suplemento por temporada <i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-left:8px"></i>
</button></div>
<table class="table table-striped table-bordered table-hover" style="min-width:750px">
<thead>
<tr>
<th width="15%">Fecha inicio.</th>
<th width="15%">Fecha final.</th>
<th width="30%">Suplemento (semana).</th>
<th width="30%">Suplemento real (semana).</th>
<th width="10%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<%if id_alojamiento_b<>""then
Sql2= "SELECT rel.id_item, rel.id_alojamiento, rel.id_alo_opcion, rel.id_suplemento, preciosSuplementos.id_suplemento, preciosSuplementos.fecha_inicio, preciosSuplementos.fecha_fin, preciosSuplementos.precio, preciosSuplementos.precio_coste from rel, preciosSuplementos where rel.id_item="&cod&" and rel.id_alojamiento<>0 and rel.id_suplemento<>0 and rel.id_alojamiento="&id_alojamiento_b&" and rel.id_alo_opcion=0 and rel.id_suplemento=preciosSuplementos.id_suplemento"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
i_alo_alojamientos=1
do while not ob_rs2.eof%>
<tbody class="cursos_tem_alo_in_<%=z%>">
<tr class="fila_alo_tem_<%=z%>">
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_<%=i_alo_alojamientos%>" name="f_inicio_alo_[<%=z%>,<%=i_alo_alojamientos%>]" placeholder="desde" value="<%=ob_rs2("fecha_inicio")%>"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_<%=i_alo_alojamientos%>" name="f_fin_alo_[<%=z%>,<%=i_alo_alojamientos%>]" placeholder="hasta"  value="<%=ob_rs2("fecha_fin")%>"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_[<%=z%>,<%=i_alo_alojamientos%>]" id="suplemento_alo_<%=i_alo_alojamientos%>" value="<%=ob_rs2("precio")%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_<%=i_alo_alojamientos%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_[<%=z%>,<%=i_alo_alojamientos%>]" id="suplemento_r_alo_<%=i_alo_alojamientos%>" value="<%=ob_rs2("precio_coste")%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_<%=i_alo_alojamientos%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td style="padding-top:15px;text-align:center;"><div class="md-checkbox"><input type="checkbox" name="alo_tem_del_[<%=z%>,<%=i_alo_alojamientos%>]" id="alo_tem_del_[<%=z%>,<%=i_alo_alojamientos%>]" class="md-check" value="si"><label for="alo_tem_del[<%=z%>,<%=i_alo_alojamientos%>]"><span></span><span class="check"></span><span class="box"></span></label></div></td>
<script>$("[name='alo_tem_del_[<%=z%>,<%=i_alo_alojamientos%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
</tr>
</tbody>
<%ob_rs2.movenext
i_alo_alojamientos=i_alo_alojamientos+1
loop
else%>
<tbody class="cursos_tem_alo_in_<%=z%>">
<tr class="fila_alo_tem_<%=z%>">
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_1" name="f_inicio_alo_[<%=z%>,1]" placeholder="desde" value=""><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_1" name="f_fin_alo_[<%=z%>,1]" placeholder="hasta"  value=""><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_[<%=z%>,1]" id="suplemento_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_[<%=z%>,1]" id="suplemento_r_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td style="padding-top:15px;text-align:center;"><div class="md-checkbox alo_tem_del"><input type="checkbox" name="alo_tem_del_[<%=z%>,1]" id="alo_tem_del_[<%=z%>,1]" class="md-check" value="si"><label for="alo_tem_del_[<%=z%>,1]"><span></span><span class="check"></span><span class="box"></span></label></div></td>
</tr>
<%end if
ob_rs2.close
else%>
<tbody class="cursos_tem_alo_in_<%=z%>">
<tr class="fila_alo_tem_<%=z%>">
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_1" name="f_inicio_alo_[<%=z%>,1]" placeholder="desde" value=""><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_1" name="f_fin_alo_[<%=z%>,1]" placeholder="hasta"  value=""><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_[<%=z%>,1]" id="suplemento_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_[<%=z%>,1]" id="suplemento_r_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td style="padding-top:15px;text-align:center;"><div class="md-checkbox alo_tem_del"><input type="checkbox" name="alo_tem_del_[<%=z%>,1]" id="alo_tem_del_[<%=z%>,1]" class="md-check" value="si"><label for="alo_tem_del_[<%=z%>,1]"><span></span><span class="check"></span><span class="box"></span></label></div></td>
</tr>
</tbody>
<%end if%>
<script>
$('.in_alo_tem_<%=z%>').one('click',function(){}).click(function(){
var n = $('.fila_alo_concept_<%=z%>').length + 1;
if( 16 < n ) {$('#alerta_cursos_alo_tem').modal();return false;}
x=n;
var box_htmlG = $('<tr class="fila_alo_tem_<%=z%>">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_'+x+'" name="f_inicio_alo_[<%=z%>,'+x+']" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_'+x+'" name="f_fin_alo_[<%=z%>,'+x+']" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_[<%=z%>,'+x+']" id="suplemento_alo_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_'+x+'" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_[<%=z%>,'+x+']" id="suplemento_r_alo_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_'+x+'" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td style="text-align:center;"><button class="alo_tem_del btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmlG.hide();
$('.fila_alo_tem_<%=z%>:last').after(box_htmlG);
box_htmlG.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('.date-picker').datepicker({language: 'es'});
return false;});
$('.cursos_tem_alo_in_<%=z%>').on('click', '.alo_tem_del', function(){
if( $('.fila_alo_tem_<%=z%>').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();});
};return false;
});
</script>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
<%i_alojamientos=i_alojamientos+1
loop%>
<script>
<%'z=2%>
var z=2;
<%z=z+1%>
$('.in_alo').one('click',function(){
$('select').select2({minimumResultsForSearch: -1,language: "es"});}).click(function(){
var n = $('.fila_alo').length + 1;
if( 16 < n ) {$('#alerta_cursos_alo').modal();return false;}
var x=n;
var box_htmlC = $('<div class="panel panel-default fila_alo" style="border:none" >\
<div class="panel-heading">\
<h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_'+x+'"><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i> Alojamiento '+x+'</a></h4></div>\
<div id="acordeon_'+x+'" class="panel-collapse collapse">\
<div class="panel-body">\
<div class="col-md-12" >\
<div class="col-md-6">\
<div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="alo_con_titulo_esp_'+x+'" >Alojamiento.<span class="required">*</span></label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alo_con_titulo_esp_['+x+']" id="alo_con_titulo_esp_'+x+'"  maxlength="160" value=""><div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true"></i><span class="help-block">Concepto (Familia Estándard i.e.)</span></div></div></div><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="texto_esp_alo_'+x+'">Notas.</label><div class="col-md-7"><div class="input-icon"><textarea class="form-control" name="texto_esp_alo_['+x+']" id="texto_esp_alo_['+x+']" rows="2"></textarea><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">nota informativa</span></div></div></div><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="orden_alo_con_'+x+'" >Orden.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="orden_alo_con form-control" placeholder="" name="orden_alo_con_['+x+']" id="orden_alo_con_'+x+'" value="'+x+'" maxlength="160" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block" >introduce un número</span></div></div></div></div><div class="col-md-6"><div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="id_tipo_alo_con_1" >Tipo.</label><div class="col-md-7"><div class="input-icon"><select id="id_tipo_alo_con_1" name="id_tipo_alo_con_[<%=z%>]" style="width:100%"><%Sql= "SELECT id_alo_tipo, titulo_esp from alo_tipo "%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%>\
<%do while not ob_rs.eof%>\
<option value="<%=ob_rs("id_alo_tipo")%>" ><%=ob_rs("titulo_esp")%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%>\
</select><div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div><div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="titulo_esp" >Tasas.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_alo_con_['+x+']" id="tasas_alo_con_1"  maxlength="160" value="" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block" style="max-width:120px">precio</span></div></div></div><%if alo_op_titulo_esp_1=""then%><div class="form-group form-md-line-input"><button class="del_acordeon'+x+' btn red pull-right" onClick="javascript:del_acordeon('+x+');"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div><%end if%></div>\
<div class="form-group form-md-line-input col-md-12" style="border-top:1px solid #ddd;padding-top:20px"><button class="in_alo_concept_C btn green" onClick="javascript:sum_alo_concept('+x+');" style="margin-left:16px"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Opción <i class="fa fa-bed" aria-hidden="true" style="margin-left:8px"></i></button></div>\
<div class="col-md-12" style="text-align:left">\
<div style="width:100%;overflow:auto">\
<table class="table table-striped table-bordered table-hover" style="min-width:750px">\
<thead>\
<tr>\
<th width="20%">Opción.</th>\
<th width="10%">Precio /sem.</th>\
<th width="10%">Coste real.</th>\
<th width="7%">Tasas.</th>\
<th width="30%">Resumen.</th>\
<th width="8%" style="text-align:center;">Eliminar.</th>\
</tr>\
</thead>\
<tbody class="cursos_alo_concept_in'+x+'<%=z%>">\
<tr class="fila_alo_concept'+x+'<%=z%>">\
<td><select id="id_op_alo_con_'+x+'" name="id_op_alo_con_['+x+',1]" style="width:100%">\
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%>\
<%do while not ob_rs.eof%>\
<option value="<%=ob_rs("id_alo_op")%>"><%=ob_rs("titulo_esp")%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%>\
</select>\
</td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_['+x+',1]" id="precio_alo_op_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_['+x+',1]" id="precio_alo_op_r_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_['+x+',1]" id="tasas_alo_op_'+x+'" value=""></td>\
<input type="hidden" class="orden_alo_'+x+'  form-control" placeholder="" name="orden_alo_op_['+x+',1]" id="orden_alo_op_1" value="1">\
<td><textarea class="form-control" name="texto_esp_alo_op_['+x+',1]" id="texto_esp_alo_op_['+x+',1]" rows="1"></textarea></td>\
<td style="padding-top:15px;text-align:center;"></td>\
</tr>\
</tbody>\
</table>\
</div></div>\
<div class="form-group col-md-12">\
<button class="in_alo_tem_C btn green" onClick="javascript:sum_alo_tem('+x+');" style="margin-left:16px"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir suplemento por temporada <i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-left:8px"></i>\
</button></div>\
<div class="col-md-12" style="text-align:left">\
<div style="width:100%;overflow:auto">\
<table class="table table-striped table-bordered table-hover" style="min-width:750px">\
<thead>\
<tr>\
<th width="15%">Fecha inicio.</th>\
<th width="15%">Fecha final.</th>\
<th width="30%">Suplemento (semana).</th>\
<th width="30%">Suplemento real (semana).</th>\
<th width="10%" style="text-align:center;">Eliminar.</th>\
</tr>\
</thead>\
<tbody class="cursos_tem_alo_in'+x+'<%=z%>">\
<tr class="fila_alo_tem'+x+'<%=z%>">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_1" name="f_inicio_alo_['+x+',1]" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_1" name="f_fin_alo_['+x+',1]" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_['+x+',1]" id="suplemento_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_['+x+',1]" id="suplemento_r_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td style="padding-top:15px;text-align:center;"><div class="md-checkbox alo_tem_del"><input type="checkbox" name="tem_del_['+x+',1]" id="alo_tem_del_1" class="md-check" value="si"><label for="aer_del_1"><span></span><span class="check"></span><span class="box"></span></label></div></td>\
</tr>\
</tbody>\
</table>\
</div>\
</div>\
</div>\
');
box_htmlC.hide();
$('.fila_alo:last').after(box_htmlC);
box_htmlC.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('.date-picker').datepicker({language: 'es'});
return false;});
function del_acordeon(esto){
if( $('.fila_alo').length >1){
$('.del_acordeon'+esto).closest('div.fila_alo').css( 'background-color', '#efefef' );
$('.del_acordeon'+esto).closest('div.fila_alo').fadeOut("slow", function() {
$('.del_acordeon'+esto).closest('div.fila_alo').remove();
$('.orden_alo_con').each(function(index){$(this).val( index + 1);})
;});
return false;
}
}
function sum_alo_concept(esto){
var n = $('.fila_alo_concept'+esto+'<%=z%>').length + 1;
var box_htmlD = $('<tr class="fila_alo_concept'+esto+'<%=z%>">\
<td><select id="id_op_alo_con_<%=z%>" name="id_op_alo_con_['+esto+','+n+']" style="width:100%">\
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%>\
<%do while not ob_rs.eof%>\
<option value="<%=ob_rs("id_alo_op")%>"><%=ob_rs("titulo_esp")%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%>\
</select>\
</td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_['+esto+','+n+']" id="precio_alo_op_<%=z%>" value="">\</td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_['+esto+','+n+']" id="precio_alo_op_r_<%=z%>" value="">\</td>\
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_['+esto+','+n+']" id="tasas_alo_op_<%=z%>" value="">\</td>\
<input type="hidden" class="orden_alo_'+esto+' form-control " placeholder="" name="orden_alo_op_['+esto+','+n+']" id="orden_alo_op_'+n+'" value="'+n+'">\
<td><textarea class="form-control" name="texto_esp_alo_op_['+esto+','+n+']" id="texto_esp_alo_op_<%=z%>" rows="1"></textarea></td>\
<td style="padding-top:15px;text-align:center;"><button class="del_alo_'+esto+n+' btn red" onClick="javascript:del_alo_concept('+esto+','+n+');"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>\
');
box_htmlD.hide();
$('.fila_alo_concept'+esto+'<%=z%>:last').after(box_htmlD);
box_htmlD.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false; 
}
function sum_alo_tem(esto){
var n = $('.fila_alo_tem'+esto+'<%=z%>').length + 1;
var box_htmlR = $('<tr class="fila_alo_tem'+esto+'<%=z%>">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_<%=z%>" name="f_inicio_alo_['+esto+','+n+']" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_<%=z%>" name="f_fin_alo_['+esto+','+n+']" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_['+esto+','+n+']" id="suplemento_alo_<%=z%>" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_['+esto+','+n+']" id="suplemento_r_alo_<%=z%>" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td style="padding-top:15px;text-align:center;"><button class="tem_del_'+esto+n+' btn red" onClick="javascript:tem_del_('+esto+','+n+');"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>\
');
box_htmlR.hide();
$('.fila_alo_tem'+esto+'<%=z%>:last').after(box_htmlR);
box_htmlR.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('.date-picker').datepicker({language: 'es'});
return false; 
}
function del_alo_concept(esto,n){
if( $('.fila_alo_concept'+esto+'<%=z%>').length >1){
$('.del_alo_'+esto+n).closest('tr').css( 'background-color', '#32C5D2' );
$('.del_alo_'+esto+n).closest('tr').fadeOut("slow", function() {
	$('.del_alo_'+esto+n).closest('tr').remove();
	$('.orden_alo_'+esto).each(function(index){$(this).val( index + 1);})
	;});
	return false;
}
}
function tem_del_(esto,n){
if( $('.fila_alo_tem'+esto+'<%=z%>').length >1){
$('.tem_del_'+esto+n).closest('tr').css( 'background-color', '#32C5D2' );
$('.tem_del_'+esto+n).closest('tr').fadeOut("slow", function() {
	$('.tem_del_'+esto+n).closest('tr').remove();
	;});
	return false;
}
}
$(document).ready(function(){<!--CHAPUZA QUE HAY QUE ARREGLAR PARA QUE NO ENVIE FORMULAIRO SI UNO NO QUIERE-->
$("form").submit(function() {
return false;
});
});
</script>
<%else
do while i_alojamientos<=1%>
<div class="panel panel-default fila_alo" style="border:none" >
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_1"><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i> Alojamiento</a></h4></div>
<%z=1%>
<div id="acordeon_1" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-12" >
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="alo_con_titulo_esp_1" >Alojamiento.<span class="required">*</span></label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="alo_con_titulo_esp_[<%=z%>]" id="alo_con_titulo_esp_1"  maxlength="160" value="<%=alo_con_titulo_esp_1%>"><div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true"></i><span class="help-block">Concepto (Familia Estándard i.e.)</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="texto_esp_alo_1">Nota.</label>
<div class="col-md-7"><div class="input-icon"><textarea class="form-control" name="texto_esp_alo_[<%=z%>]" id="texto_esp_alo_[<%=z%>]" rows="2"><%=texto_esp_alo_1%></textarea><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">nota informativa</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="orden_alo_con_1" >Orden.</label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="orden_alo_con form-control" placeholder="" name="orden_alo_con_[<%=z%>]" id="orden_alo_con_1" <%if cod<>""then%>value="orden_alo_con_1"<%else%>value="<%=z%>" <%end if%> maxlength="160" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block" >introduce un número</span></div></div></div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_tipo_alo_con_1" >Tipo.</label>
<div class="col-md-7">
<div class="input-icon">
<select id="id_tipo_alo_con_1" name="id_tipo_alo_con_[<%=z%>]" style="width:100%">
<%Sql= "SELECT id_alo_tipo, titulo_esp from alo_tipo "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="" >&nbsp;</option><option value="<%=ob_rs("id_alo_tipo")%>" ><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
<div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="titulo_esp" >Tasas.</label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_alo_con_[<%=z%>]" id="tasas_alo_con_1"  maxlength="160" value="<%=tasas_alo_con_1%>" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block" style="max-width:120px">precio</span></div></div></div>
<%if alo_op_titulo_esp_1<>""then%>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="alo_con_titulo_esp_1" >Eliminar.</label>
<div class="col-md-7">
<div class="md-checkbox" style="margin-top:4px"><input type="checkbox" name="alo_del_[<%=z%>]" id="alo_del_1" class="md-check pull-right" value=""><label for="alo_del_1"><span></span><span class="check"></span><span class="box"></span></label></div><script>$("[name='alo_del_[<%=z%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script></div></div>
<%end if%>
</div>

<!--OPCIONES ALOJAMIENTOS-->
<div class="col-md-12" style="text-align:left">
<div style="width:100%;overflow:auto">
<div class="form-group form-md-line-input col-md-12" style="border-top:1px solid #ddd;padding-top:20px"><button class="in_alo_concept_1 btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Opción <i class="fa fa-bed" aria-hidden="true" style="margin-left:8px"></i></button></div>
<table class="table table-striped table-bordered table-hover" style="min-width:750px;">
<thead>
<tr>
<th width="20%">Opción.</th>
<th width="10%">Precio /sem.</th>
<th width="10%">Coste real.</th>
<th width="7%">Tasas.</th>
<th width="7%">Orden.</th>
<th width="30%">Resumen.</th>
<th width="8%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<tbody class="cursos_alo_concept_in_1">
<tr class="fila_alo_concept_1">
<td><input type="text" class="form-control" placeholder="(i.e. hab. individual)" name="alo_op_titulo_esp_[<%=z%>,1]" id="alo_op_titulo_esp_1" value="<%=alo_op_titulo_esp_1%>"></td>

<td>
<select id="id_op_alo_con_1" name="id_op_alo_con_[<%=z%>,1]" style="width:100%">
<%Sql= "SELECT id_alo_op, titulo_esp from alo_op "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_op_alo_a=ob_rs("id_alo_op")
if id_op_alo_a<>""  then
Sql3= "SELECT id_alo_opcion, op_alo from alo_opciones where op_alo="&id_op_alo_a&" and id_alo_opcion="&ob_rs2("alo_opciones.id_alo_opcion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
sel_op_alo="si"
end if
ob_rs3.close
end if%>
<option value="<%=ob_rs("id_alo_op")%>" <%if sel_op_alo="si"then%>selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
sel_op_alo=""
id_op_alo_a=""
loop
end if
ob_rs.close%>
</select></td>


<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_[<%=z%>,1]" id="precio_alo_op_1" value="<%=precio_alo_op_1%>"></td>
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_[<%=z%>,1]" id="precio_alo_op_r_1" value="<%=precio_alo_op_r_1%>"></td>
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_[<%=z%>,1]" id="tasas_alo_op_1" value="<%=tasas_alo_op_1%>"></td>
<td><input type="text" class="form-control orden_alo_op" placeholder="" name="orden_alo_op_[<%=z%>,1]" id="orden_alo_op_1" <%if cod="" then%>value="1"<%else%>value="<%=orden_alo_op_1%>"<%end if%>></td>
<td><textarea class="form-control" name="texto_esp_alo_op_[<%=z%>,1]" id="texto_esp_alo_op_[<%=z%>,1]" rows="1"><%=texto_esp_alo_op_1%></textarea></td>
<td style="padding-top:15px;text-align:center;"><%if alo_op_titulo_esp_1<>""then%><div class="md-checkbox"><input type="checkbox" name="alo_del_op_[<%=z%>,1]" id="alo_del_op_1" class="md-check" value="si"><label for="alo_del_1"><span></span><span class="check"></span><span class="box"></span></label></div><script>$("[name='alo_del_op_[<%=z%>,1]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script><%end if%></td>
</tr>
</tbody>
</table>
</div>
</div>

<script>
$('.in_alo_concept_<%=z%>').one('click',function(){}).click(function(){
var n = $('.fila_alo_concept_<%=z%>').length + 1;
if( 16 < n ) {$('#alerta_cursos_alo').modal();return false;}
x=n;
var box_htmlF = $('<tr class="fila_alo_concept_<%=z%>">\
<td><input type="text" class="form-control" placeholder="(i.e. hab. compartida)" name="alo_op_titulo_esp_[<%=z%>,'+x+']" id="alo_op_titulo_esp_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_[<%=z%>,'+x+']" id="precio_alo_op_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_[<%=z%>,'+x+']" id="precio_alo_op_r_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_[<%=z%>,'+x+']" id="tasas_alo_op_'+x+'" value=""></td>\
<td><input type="text" class="form-control orden_alo_op" placeholder="" name="orden_alo_op_[<%=z%>,'+x+']" id="orden_alo_op_'+x+'" value="'+x+'"></td>\
<td><textarea class="form-control" name="texto_esp_alo_op_'+x+'" id="texto_esp_alo_op_[<%=z%>,'+x+']" rows="1"></textarea></td>\
<td style="text-align:center;"><button class="alo_del_op btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmlF.hide();
$('.fila_alo_concept_<%=z%>:last').after(box_htmlF);
box_htmlF.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false;});
$('.cursos_alo_concept_in_<%=z%>').on('click', '.alo_del_op', function(){
if( $('.fila_alo_concept_<%=z%>').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();
$(".orden_alo_op").each(function(index){$(this).val( index + 1);});});
};return false;
});
</script>
<!--OPCIONES ALOJAMIENTOS SUPLEMENTOS-->
<div class="col-md-12" style="text-align:left">
<div style="width:100%;overflow:auto">

<div class="form-group col-md-12">
<button class="in_alo_tem_1 btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir suplemento por temporada <i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-left:8px"></i>
</button></div>
<table class="table table-striped table-bordered table-hover" style="min-width:750px" >
<thead>
<tr>
<th width="15%">Fecha inicio.</th>
<th width="15%">Fecha final.</th>
<th width="30%">Suplemento (semana).</th>
<th width="30%">Suplemento real (semana).</th>
<th width="10%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<tbody class="cursos_tem_alo_in_1">
<tr class="fila_alo_tem_1">
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_1" name="f_inicio_alo_[<%=z%>,1]" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_1" name="f_fin_alo_[<%=z%>,1]" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_[<%=z%>,1]" id="suplemento_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_[<%=z%>,1]" id="suplemento_r_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td style="padding-top:15px;text-align:center;"><div class="md-checkbox alo_tem_del"><input type="checkbox" name="alo_tem_del_[<%=z%>,1]" id="alo_tem_del_1" class="md-check" value="si"><label for="aer_del_1"><span></span><span class="check"></span><span class="box"></span></label></div></td>
</tr>
</tbody>
</table>
</div>
</div>
<script>
$('.in_alo_tem_<%=z%>').one('click',function(){}).click(function(){
var n = $('.fila_alo_concept_<%=z%>').length + 1;
if( 16 < n ) {$('#alerta_cursos_alo_tem').modal();return false;}
x=n;
var box_htmlG = $('<tr class="fila_alo_tem_<%=z%>">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_'+x+'" name="f_inicio_alo_[<%=z%>,'+x+']" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_'+x+'" name="f_fin_alo_[<%=z%>,'+x+']" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_[<%=z%>,'+x+']" id="suplemento_alo_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_'+x+'" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_[<%=z%>,'+x+']" id="suplemento_r_alo_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_'+x+'" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td style="text-align:center;"><button class="alo_tem_del btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmlG.hide();
$('.fila_alo_tem_<%=z%>:last').after(box_htmlG);
box_htmlG.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('.date-picker').datepicker({language: 'es'});
return false;});
$('.cursos_tem_alo_in_1').on('click', '.alo_tem_del', function(){
if( $('.fila_alo_tem_<%=z%>').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();});
};return false;
});
</script>
</div>
</div>
</div>
</div>
<script>
//var x=1;
<%z=2%>
var z=2;
$('.in_alo').one('click',function(){
$('select').select2({minimumResultsForSearch: -1,language: "es"});}).click(function(){
var n = $('.fila_alo').length + 1;
if( 16 < n ) {$('#alerta_cursos_alo').modal();return false;}
var x=n;
var box_htmlC = $('<div class="panel panel-default fila_alo" style="border:none" >\
<div class="panel-heading">\
<h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_'+x+'"><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i> Alojamiento '+x+'</a></h4></div>\
<div id="acordeon_'+x+'" class="panel-collapse collapse">\
<div class="panel-body">\
<div class="col-md-12" >\
<div class="col-md-6">\
<div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="alo_con_titulo_esp_'+x+'" >Alojamiento.<span class="required">*</span></label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alo_con_titulo_esp_['+x+']" id="alo_con_titulo_esp_1"  maxlength="160" value=""><div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true"></i><span class="help-block">Concepto (Familia Estándard i.e.)</span></div></div></div><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="texto_esp_alo_'+x+'">Nota.</label><div class="col-md-7"><div class="input-icon"><textarea class="form-control" name="texto_esp_alo_'+x+'" id="texto_esp_alo_['+x+']" rows="2"></textarea><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">nota informativa</span></div></div></div><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="orden_alo_con_'+x+'" >Orden.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="orden_alo_con form-control" placeholder="" name="orden_alo_con_['+x+']" id="orden_alo_con_'+x+'" value="'+x+'" maxlength="160" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block" >introduce un número</span></div></div></div></div><div class="col-md-6"><div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="id_tipo_alo_con_1" >Tipo.</label><div class="col-md-7"><div class="input-icon"><select id="id_tipo_alo_con_1" name="id_tipo_alo_con_[<%=z%>]" style="width:100%"><%Sql= "SELECT id_alo_tipo, titulo_esp from alo_tipo "%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%>\
<%do while not ob_rs.eof%>\
<option value="" >&nbsp;</option><option value="<%=ob_rs("id_alo_tipo")%>" ><%=ob_rs("titulo_esp")%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%>\
</select><div class="form-control-focus"></div><i class="fa fa-home" aria-hidden="true" style="margin-right:4px;"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div><div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="titulo_esp" >Tasas.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_alo_con_['+x+']" id="tasas_alo_con_1"  maxlength="160" value="" style="max-width:120px"><div class="form-control-focus" style="max-width:120px"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block" style="max-width:120px">precio</span></div></div></div><%if alo_op_titulo_esp_1=""then%><div class="form-group form-md-line-input"><button class="del_acordeon'+x+' btn red pull-right" onClick="javascript:del_acordeon('+x+');"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div><%end if%></div>\
<div class="form-group form-md-line-input col-md-12" style="border-top:1px solid #ddd;padding-top:20px"><button class="in_alo_concept_C btn green" onClick="javascript:sum_alo_concept('+x+');" style="margin-left:16px"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Opción <i class="fa fa-bed" aria-hidden="true" style="margin-left:8px"></i></button></div>\
<div class="col-md-12" style="text-align:left">\
<div style="width:100%;overflow:auto">\
<table class="table table-striped table-bordered table-hover" style="min-width:750px">\
<thead>\
<tr>\
<th width="20%">Opción.</th>\
<th width="10%">Precio /sem.</th>\
<th width="10%">Coste real.</th>\
<th width="7%">Tasas.</th>\
<th width="7%">Orden.</th>\
<th width="30%">Resumen.</th>\
<th width="8%" style="text-align:center;">Eliminar.</th>\
</tr>\
</thead>\
<tbody class="cursos_alo_concept_in'+x+'<%=z%>">\
<tr class="fila_alo_concept'+x+'<%=z%>">\
<td><input type="text" class="form-control" placeholder="(i.e. hab. individual)" id="alo_op_titulo_esp_'+x+'" name="alo_op_titulo_esp_['+x+',1]" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_['+x+',1]" id="precio_alo_op_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_['+x+',1]" id="precio_alo_op_r_'+x+'" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_['+x+',1]" id="tasas_alo_op_'+x+'" value=""></td>\
<td><input type="text" class="orden_alo_'+x+'  form-control" placeholder="" name="orden_alo_op_['+x+',1]" id="orden_alo_op_1" value="1"></td>\
<td><textarea class="form-control" name="texto_esp_alo_op_['+x+',1]" id="texto_esp_alo_op_['+x+',1]" rows="1"></textarea></td>\
<td style="padding-top:15px;text-align:center;"></td>\
</tr>\
</tbody>\
</table>\
</div></div>\
<div class="form-group col-md-12">\
<button class="in_alo_tem_C btn green" onClick="javascript:sum_alo_tem('+x+');" style="margin-left:16px"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir suplemento por temporada <i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-left:8px"></i>\
</button></div>\
<div class="col-md-12" style="text-align:left">\
<div style="width:100%;overflow:auto">\
<table class="table table-striped table-bordered table-hover" style="min-width:750px">\
<thead>\
<tr>\
<th width="15%">Fecha inicio.</th>\
<th width="15%">Fecha final.</th>\
<th width="30%">Suplemento (semana).</th>\
<th width="30%">Suplemento real (semana).</th>\
<th width="10%" style="text-align:center;">Eliminar.</th>\
</tr>\
</thead>\
<tbody class="cursos_tem_alo_in'+x+'<%=z%>">\
<tr class="fila_alo_tem'+x+'<%=z%>">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_1" name="f_inicio_alo_['+x+',1]" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_1" name="f_fin_alo_['+x+',1]" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_['+x+',1]" id="suplemento_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_['+x+',1]" id="suplemento_r_alo_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td style="padding-top:15px;text-align:center;"><div class="md-checkbox alo_tem_del"><input type="checkbox" name="tem_del_['+x+',1]" id="alo_tem_del_1" class="md-check" value="si"><label for="aer_del_1"><span></span><span class="check"></span><span class="box"></span></label></div></td>\
</tr>\
</tbody>\
</table>\
</div>\
</div>\
</div>\
');
box_htmlC.hide();
$('.fila_alo:last').after(box_htmlC);
box_htmlC.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('.date-picker').datepicker({language: 'es'});
return false;});
function del_acordeon(esto){
if( $('.fila_alo').length >1){
$('.del_acordeon'+esto).closest('div.fila_alo').css( 'background-color', '#efefef' );
$('.del_acordeon'+esto).closest('div.fila_alo').fadeOut("slow", function() {
$('.del_acordeon'+esto).closest('div.fila_alo').remove();
$('.orden_alo_con').each(function(index){$(this).val( index + 1);})
;});
return false;
}
}
function sum_alo_concept(esto){
var n = $('.fila_alo_concept'+esto+'<%=z%>').length + 1;
var box_htmlD = $('<tr class="fila_alo_concept'+esto+'<%=z%>">\
<td><input type="text" class="form-control" placeholder="(i.e. hab. compartida)" id="alo_op_titulo_esp_<%=z%>" name="alo_op_titulo_esp_['+esto+','+n+']" value=""></td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_['+esto+','+n+']" id="precio_alo_op_<%=z%>" value="">\</td>\
<td><input type="text" class="form-control" placeholder="" name="precio_alo_op_r_['+esto+','+n+']" id="precio_alo_op_r_<%=z%>" value="">\</td>\
<td><input type="text" class="form-control" placeholder="" name="tasas_alo_op_['+esto+','+n+']" id="tasas_alo_op_<%=z%>" value="">\</td>\
<td><input type="text" class="orden_alo_'+esto+' form-control " placeholder="" name="orden_alo_op_['+esto+','+n+']" id="orden_alo_op_'+n+'" value="'+n+'">\</td>\
<td><textarea class="form-control" name="texto_esp_alo_op_['+esto+','+n+']" id="texto_esp_alo_op_<%=z%>" rows="1"></textarea></td>\
<td style="padding-top:15px;text-align:center;"><button class="del_alo_'+esto+n+' btn red" onClick="javascript:del_alo_concept('+esto+','+n+');"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>\
');
box_htmlD.hide();
$('.fila_alo_concept'+esto+'<%=z%>:last').after(box_htmlD);
box_htmlD.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false; 
}
function sum_alo_tem(esto){
var n = $('.fila_alo_tem'+esto+'<%=z%>').length + 1;
var box_htmlR = $('<tr class="fila_alo_tem'+esto+'<%=z%>">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio_alo_<%=z%>" name="f_inicio_alo_['+esto+','+n+']" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_alo_<%=z%>" name="f_fin_alo_['+esto+','+n+']" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_alo_['+esto+','+n+']" id="suplemento_alo_<%=z%>" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_r_alo_['+esto+','+n+']" id="suplemento_r_alo_<%=z%>" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td style="padding-top:15px;text-align:center;"><button class="tem_del_'+esto+n+' btn red" onClick="javascript:tem_del_('+esto+','+n+');"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>\
');
box_htmlR.hide();
$('.fila_alo_tem'+esto+'<%=z%>:last').after(box_htmlR);
box_htmlR.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('.date-picker').datepicker({language: 'es'});
return false; 
}
function del_alo_concept(esto,n){
if( $('.fila_alo_concept'+esto+'<%=z%>').length >1){
$('.del_alo_'+esto+n).closest('tr').css( 'background-color', '#32C5D2' );
$('.del_alo_'+esto+n).closest('tr').fadeOut("slow", function() {
	$('.del_alo_'+esto+n).closest('tr').remove();
	$('.orden_alo_'+esto).each(function(index){$(this).val( index + 1);})
	;});
	return false;
}
}
function tem_del_(esto,n){
if( $('.fila_alo_tem'+esto+'<%=z%>').length >1){
$('.tem_del_'+esto+n).closest('tr').css( 'background-color', '#32C5D2' );
$('.tem_del_'+esto+n).closest('tr').fadeOut("slow", function() {
	$('.tem_del_'+esto+n).closest('tr').remove();
	;});
	return false;
}
}

$(document).ready(function(){<!--CHAPUZA QUE HAY QUE ARREGLAR PARA QUE NO ENVIE FORMULAIRO SI UNO NO QUIERE-->
$("form").submit(function() {
return false;
});
});
</script>
<%i_alojamientos=i_alojamientos+1
loop
end if%>
</div>
</div>
</div>
</div>
</div>

<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-10">
<%if edi="" then%><button type="button" class="btn green" onclick="Enviar_alojamientos(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
</form>
</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div><!--page-content-col-->
</div><!--page-content-row-->
</div><!--page-content-container-->
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<script>
$( ".acord_txt" ).hide();
$(".acord_link_lab").click(function() {	var panel = $(this).parent().next('div');$(".acord_txt" ).not(panel).slideUp();panel.slideToggle({direction: "up"}, 100);});
$('.date-picker').datepicker({language: 'es'});
$(document).ready(function() {
<%if edi="rap"then%>parent.sav_gest_aloja_on();//BOTON GUARDAR DESDE MODAL<%end if%>
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='visible'],[name='destacado'],[name='disponible'],[name='privado'],[name='pre_medida'],[name='oferta'],[name='completo'],[name='pr_actualizado'],[name='alo_fam'],[name='alo_res'],[name='alo_apa'],[name='wifi'],[name='tel_24'],[name='vuelo'],[name='c_inten'],[name='ini_lunes'],[name='c_semi'],[name='c_gene'],[name='monitor'],[name='campamento'],[name='quincena'],[name='visible'],[name='disponible']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});

function recargar() {location.reload();}
</script>
<%ob_conn.close%>