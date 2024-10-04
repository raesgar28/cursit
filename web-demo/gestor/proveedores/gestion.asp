<!--#include file="../comun/menu_sup.asp"--> 
<%select case ndos:
case "dl"
tit_pr="Delegados"
tipo_pr="Delegado"
titulo_nom="Nombre Delegado"
case "es"
tit_pr="Escuelas"
tipo_pr="Escuela"
titulo_nom="Nombre Escuela"
case "ag"
tit_pr="Agentes"
tipo_pr="Agente"
titulo_nom="Nombre Agente"
case "mn"
tit_pr="Monitores"
tipo_pr="Monitor"
titulo_nom="Nombre Monitor"
case "fm"
tit_pr="Familias"
tipo_pr="Familia"
titulo_nom="Nombre Familia"
case "ae"
tit_pr="Compa&ntilde;&iacute;as A&eacute;reas"
tipo_pr="C.Aerea"
titulo_nom="Compa&ntilde;&iacute;a A&eacute;rea"
case "au"
tit_pr="Autobuses"
tipo_pr="Autobus"
titulo_nom="Autob&uacute;s"
end select
if cod<>""then
Sql= "SELECT * from proveedores where id_proveedor="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp") 
direccion=ob_rs("direccion") 
provincia=ob_rs("provincia") 
pais=ob_rs("pais") 
c_postal=ob_rs("c_postal") 
email=ob_rs("email") 
telefono=ob_rs("telefono") 
persona_contacto=ob_rs("persona_contacto") 
email_p=ob_rs("email_p") 
movil=ob_rs("movil") 
otros_datos=ob_rs("otros_datos") 
tipo_pr=ob_rs("tipo_pr") 
escuela_tam=ob_rs("escuela_tam")
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Proveedores | <%=tit_pr%> | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Proveedores | <%=tit_pr%></a></li>
<li class="active">Gestión Proveedor </li>
</ol>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase"><%=tit_pr%> | Gestión Proveedor 
<%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
</div>
<div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="tipo_pr" type="hidden" value="<%=tipo_pr%>">
<input name="edi" type="hidden" value="<%=edi%>">
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Este nombre ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div>
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-8">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-4 control-label" for="titulo_esp" style="padding-right:0px;"><%=titulo_nom%>.<span class="required">*</span></label>
<div class="col-md-7" style="margin-left:9px;">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un <%=lcase(titulo_nom)%></span></div></div></div>
<%if ndos="es" then%>
<div class="form-group  form-md-line-input"><label class="col-md-4 control-label" for="form_control_1" style="padding-right:5px;">Tamaño.</label>
<div class="col-md-7" style="margin-left:15px"><div class="md-radio-inline">
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio1" value="p"  <%if escuela_tam ="p" then%>checked="checked"<%end if%>>
<label for="radio1"><span></span><span class="check"></span><span class="box"></span> Pequeña </label></div>
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio2" value="m" <%if escuela_tam ="m" then%>checked="checked"<%end if%>>
<label for="radio2"><span></span><span class="check"></span><span class="box"></span> Mediana </label></div>
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio3" value="g" <%if escuela_tam ="g" then%>checked="checked"<%end if%>><label for="radio3"><span></span><span class="check"></span><span class="box"></span> Grande </label></div>
</div></div></div>
<%end if%>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="direccion" style="padding-right:0px;">Dirección.</label>
<div class="col-md-7" style="margin-left:9px;">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="direccion" id="direccion" maxlength="160" value="<%=direccion%>"><div class="form-control-focus"> </div><i class="fa fa-street-view" aria-hidden="true"></i><span class="help-block">dirección de <%=lcase(tipo_pr)%></span></div></div></div>
</div>
<div class="col-md-8">
<div class="col-md-7">
<%Sql= "SELECT id_ciudad, titulo_esp from ciudades order by titulo_esp"   '[ASOCIAMOS CON UNA CIUDAD]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then%>
<div class="form-group form-md-line-input" >
<label class="col-md-7 control-label" for="id_ciudad" >Ciudad.</label>
<div class="col-md-5" style="margin-left:0px;padding-left:0px"><div class="input-icon" style="margin-left:0px;padding-left:8px">
<select name="id_ciudad" id="id_ciudad" class="select-100" style="margin-left:0px;padding-left:0px"  multiple="multiple">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_ciudad=ob_rs("id_ciudad")
tit_ciudad=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_ciudad, id_proveedor from rel where id_proveedor = "&cod&" and id_ciudad= "&id_ciudad&"" 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_ciudad%>" <%if sel="si" then%>Selected<%end if%>><%=tit_ciudad%>
<%ob_rs.movenext
sel=""
tit_idioma=""
id_idioma=""
%></option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i><span class="help-block">selecciona una ciudad</span></div>
</div>
</div>
<%else%>
<div class="sin_regstros" style="width:100%;margin:0 auto;margin-top:15px;text-align:right;padding-right:0px;padding-top:0px">
<a href="javascript:modal_ciudad();" class="f_red"><i class="icon-note"></i> Puedes crear una ciudad para relacionarla (opcional)</a> </div>
<div class="modal fade" id="ciudades_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Ciudad</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_ciudad(){$("#ciudades_mod iframe" ).attr('src','<%=r%>ciudades/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#ciudades_mod").modal();}</script>
<%end if
ob_rs.close
ob_conn.close%>
</div>
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-5 control-label " for="provincia">Provincia.</label>
<div class="col-md-7"><div class="input-icon">
<select name="provincia" id="provincia" multiple="multiple" placeholder="Selecciona una o varas provincias" class="select-100">
<option value="ALAVA" <%if instr(provincia,"ALAVA")then%>selected<%end if%>>ALAVA</option>
<option value="ALBACETE" <%if instr(provincia,"ALBACETE")then%>selected<%end if%>>ALBACETE</option>
<option value="ALICANTE" <%if instr(provincia,"ALICANTE")then%>selected<%end if%>>ALICANTE</option>
<option value="ALMERIA" <%if instr(provincia,"ALMERIA")then%>selected<%end if%>>ALMERIA</option>
<option value="ASTURIAS" <%if instr(provincia,"ASTURIAS")then%>selected<%end if%>>ASTURIAS</option>
<option value="AVILA" <%if instr(provincia,"AVILA")then%>selected<%end if%>>AVILA</option>
<option value="BADAJOZ" <%if instr(provincia,"BADAJOZ")then%>selected<%end if%>>BADAJOZ</option>
<option value="BARCELONA" <%if instr(provincia,"BARCELONA")then%>selected<%end if%>>BARCELONA</option>
<option value="BURGOS" <%if instr(provincia,"BURGOS")then%>selected<%end if%>>BURGOS</option>
<option value="CACERES" <%if instr(provincia,"CACERES")then%>selected<%end if%>>CACERES</option>
<option value="CADIZ" <%if instr(provincia,"CADIZ")then%>selected<%end if%>>CADIZ</option>
<option value="CANTABRIA" <%if instr(provincia,"CANTABRIA")then%>selected<%end if%>>CANTABRIA</option>
<option value="CASTELLON" <%if instr(provincia,"CASTELLON")then%>selected<%end if%>>CASTELLON</option>
<option value="CEUTA" <%if instr(provincia,"CEUTA")then%>selected<%end if%>>CEUTA</option>
<option value="CIUDAD REAL" <%if instr(provincia,"CIUDAD REAL")then%>selected<%end if%>>CIUDAD REAL</option>
<option value="CORDOBA" <%if instr(provincia,"CORDOBA")then%>selected<%end if%>>CORDOBA</option>
<option value="CORU&Ntilde;A, A" <%if instr(provincia,"CORU&Ntilde;A, A")then%>selected<%end if%>>CORU&Ntilde;A, A</option>
<option value="CUENCA" <%if instr(provincia,"CUENCA")then%>selected<%end if%>>CUENCA</option>
<option value="GIRONA" <%if instr(provincia,"GIRONA")then%>selected<%end if%>>GIRONA</option>
<option value="GRANADA" <%if instr(provincia,"GRANADA")then%>selected<%end if%>>GRANADA</option>
<option value="GUADALAJARA" <%if instr(provincia,"GUADALAJARA")then%>selected<%end if%>>GUADALAJARA</option>
<option value="GUIPUZCOA" <%if instr(provincia,"GUIPUZCOA")then%>selected<%end if%>>GUIPUZCOA</option>
<option value="HUELVA" <%if instr(provincia,"HUELVA")then%>selected<%end if%>>HUELVA</option>
<option value="HUESCA" <%if instr(provincia,"HUESCA")then%>selected<%end if%>>HUESCA</option>
<option value="ILLES BALEARS" <%if instr(provincia,"ILLES BALEARS")then%>selected<%end if%>>ILLES BALEARS</option>
<option value="JAEN" <%if instr(provincia,"JAEN")then%>selected<%end if%>>JAEN</option>
<option value="LEON" <%if instr(provincia,"LEON")then%>selected<%end if%>>LEON</option>
<option value="LLEIDA" <%if instr(provincia,"LLEIDA")then%>selected<%end if%>>LLEIDA</option>
<option value="LUGO" <%if instr(provincia,"LUGO")then%>selected<%end if%>>LUGO</option>
<option value="MADRID" <%if instr(provincia,"MADRID")then%>selected<%end if%>>MADRID</option>
<option value="MALAGA" <%if instr(provincia,"MALAGA")then%>selected<%end if%>>MALAGA</option>
<option value="MELILLA" <%if instr(provincia,"MELILLA")then%>selected<%end if%>>MELILLA</option>
<option value="MURCIA" <%if instr(provincia,"MURCIA")then%>selected<%end if%>>MURCIA</option>
<option value="NAVARRA" <%if instr(provincia,"NAVARRA")then%>selected<%end if%>>NAVARRA</option>
<option value="OURENSE" <%if instr(provincia,"OURENSE")then%>selected<%end if%>>OURENSE</option>
<option value="PALENCIA" <%if instr(provincia,"PALENCIA")then%>selected<%end if%>>PALENCIA</option>
<option value="PALMAS, LAS" <%if instr(provincia,"PALMAS, LAS")then%>selected<%end if%>>PALMAS, LAS</option>
<option value="PONTEVEDRA" <%if instr(provincia,"PONTEVEDRA")then%>selected<%end if%>>PONTEVEDRA</option>
<option value="RIOJA, LA" <%if instr(provincia,"RIOJA, LA")then%>selected<%end if%>>RIOJA, LA</option>
<option value="SALAMANCA" <%if instr(provincia,"SALAMANCA")then%>selected<%end if%>>SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE" <%if instr(provincia,"SANTA CRUZ DE TENERIFE")then%>selected<%end if%>>SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA" <%if instr(provincia,"SEGOVIA")then%>selected<%end if%>>SEGOVIA</option>
<option value="SEVILLA" <%if instr(provincia,"SEVILLA")then%>selected<%end if%>>SEVILLA</option>
<option value="SORIA" <%if instr(provincia,"SORIA")then%>selected<%end if%>>SORIA</option>
<option value="TARRAGONA" <%if instr(provincia,"TARRAGONA")then%>selected<%end if%>>TARRAGONA</option>
<option value="TERUEL" <%if instr(provincia,"TERUEL")then%>selected<%end if%>>TERUEL</option>
<option value="TOLEDO" <%if instr(provincia,"TOLEDO")then%>selected<%end if%>>TOLEDO</option>
<option value="VALENCIA" <%if instr(provincia,"VALENCIA")then%>selected<%end if%>>VALENCIA</option>
<option value="VALLADOLID" <%if instr(provincia,"VALLADOLID")then%>selected<%end if%>>VALLADOLID</option>
<option value="VIZCAYA" <%if instr(provincia,"VIZCAYA")then%>selsected<%end if%>>VIZCAYA</option>
<option value="ZAMORA" <%if instr(provincia,"ZAMORA")then%>selected<%end if%>>ZAMORA</option>
<option value="ZARAGOZA" <%if instr(provincia,"ZARAGOZA")then%>selected<%end if%>>ZARAGOZA</option>
<option value="OTRAS" <%if instr(provincia,"OTRAS")then%>selected<%end if%>>OTRAS</option></select>
<i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
</div>
</div>
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-6 control-label" for="pais" style="padding-right:0px;">País.</label>
<div class="col-md-6"><div class="input-icon" style="margin-left:15px">
<select name="pais" id="pais" multiple="multiple" class="select-100">
<option value='ad' <%if instr(pais,"ad")then%>selsected<%end if%>>Andorra</option>
<option value='ae' <%if instr(pais,"ae") then%>Selected<%end if%>>United Arab Emirates</option>
<option value='af' <%if instr(pais,"af") then%>Selected<%end if%>>Afghanistan</option>
<option value='ag' <%if instr(pais,"ag") then%>Selected<%end if%>>Antigua and Barbuda</option>
<option value='ai' <%if instr(pais,"ai") then%>Selected<%end if%>>Anguilla</option>
<option value='al' <%if instr(pais,"al") then%>Selected<%end if%>>Albania</option>
<option value='am' <%if instr(pais,"am") then%>Selected<%end if%>>Armenia</option>
<option value='an' <%if instr(pais,"an") then%>Selected<%end if%>>Netherlands Antilles</option>
<option value='ao' <%if instr(pais,"ao") then%>Selected<%end if%>>Angola</option>
<option value='aq' <%if instr(pais,"aq") then%>Selected<%end if%>>Antarctica</option>
<option value='ar' <%if instr(pais,"ar") then%>Selected<%end if%>>Argentina</option>
<option value='as' <%if instr(pais,"as") then%>Selected<%end if%>>American Samoa</option>
<option value='at' <%if instr(pais,"at") then%>Selected<%end if%>>Austria</option>
<option value='au' <%if instr(pais,"au") then%>Selected<%end if%>>Australia</option>
<option value='aw' <%if instr(pais,"aw") then%>Selected<%end if%>>Aruba</option>
<option value='ax' <%if instr(pais,"ax") then%>Selected<%end if%>>Aland Islands</option>
<option value='az' <%if instr(pais,"az") then%>Selected<%end if%>>Azerbaijan</option>
<option value='ba' <%if instr(pais,"ba") then%>Selected<%end if%>>Bosnia and Herzegovina</option>
<option value='bb' <%if instr(pais,"bb") then%>Selected<%end if%>>Barbados</option>
<option value='bd' <%if instr(pais,"bd") then%>Selected<%end if%>>Bangladesh</option>
<option value='be' <%if instr(pais,"be") then%>Selected<%end if%>>Belgium</option>
<option value='bf' <%if instr(pais,"bf") then%>Selected<%end if%>>Burkina Faso</option>
<option value='bg' <%if instr(pais,"bg") then%>Selected<%end if%>>Bulgaria</option>
<option value='bh' <%if instr(pais,"bh") then%>Selected<%end if%>>Bahrain</option>
<option value='bi' <%if instr(pais,"bi") then%>Selected<%end if%>>Burundi</option>
<option value='bj' <%if instr(pais,"bj") then%>Selected<%end if%>>Benin</option>
<option value='bm' <%if instr(pais,"bm") then%>Selected<%end if%>>Bermuda</option>
<option value='bn' <%if instr(pais,"bn") then%>Selected<%end if%>>Brunei Darussalam</option>
<option value='bo' <%if instr(pais,"bo") then%>Selected<%end if%>>Bolivia</option>
<option value='br' <%if instr(pais,"br") then%>Selected<%end if%>>Brazil</option>
<option value='bs' <%if instr(pais,"bs") then%>Selected<%end if%>>Bahamas</option>
<option value='bt' <%if instr(pais,"bt") then%>Selected<%end if%>>Bhutan</option>
<option value='bv' <%if instr(pais,"bv") then%>Selected<%end if%>>Bouvet Island</option>
<option value='bw' <%if instr(pais,"bw") then%>Selected<%end if%>>Botswana</option>
<option value='by' <%if instr(pais,"by") then%>Selected<%end if%>>Belarus</option>
<option value='bz' <%if instr(pais,"bz") then%>Selected<%end if%>>Belize</option>
<option value='ca' <%if instr(pais,"ca") then%>Selected<%end if%>>Canada</option>
<option value='cc' <%if instr(pais,"cc") then%>Selected<%end if%>>Cocos (Keeling) Islands</option>
<option value='cd' <%if instr(pais,"cd") then%>Selected<%end if%>>Democratic Republic of the Congo</option>
<option value='cf' <%if instr(pais,"cf") then%>Selected<%end if%>>Central African Republic</option>
<option value='cg' <%if instr(pais,"cg") then%>Selected<%end if%>>Congo</option>
<option value='ch' <%if instr(pais,"ch") then%>Selected<%end if%>>Switzerland</option>
<option value='ci' <%if instr(pais,"ci") then%>Selected<%end if%>>Cote D'Ivoire (Ivory Coast)</option>
<option value='ck' <%if instr(pais,"ck") then%>Selected<%end if%>>Cook Islands</option>
<option value='cl' <%if instr(pais,"cl") then%>Selected<%end if%>>Chile</option>
<option value='cm' <%if instr(pais,"cm") then%>Selected<%end if%>>Cameroon</option>
<option value='cn' <%if instr(pais,"cn") then%>Selected<%end if%>>China</option>
<option value='co' <%if instr(pais,"co") then%>Selected<%end if%>>Colombia</option>
<option value='cr' <%if instr(pais,"cr") then%>Selected<%end if%>>Costa Rica</option>
<option value='cs' <%if instr(pais,"cs") then%>Selected<%end if%>>Serbia and Montenegro</option>
<option value='cu' <%if instr(pais,"cu") then%>Selected<%end if%>>Cuba</option>
<option value='cv' <%if instr(pais,"cv") then%>Selected<%end if%>>Cape Verde</option>
<option value='cx' <%if instr(pais,"cx") then%>Selected<%end if%>>Christmas Island</option>
<option value='cy' <%if instr(pais,"cy") then%>Selected<%end if%>>Cyprus</option>
<option value='cz' <%if instr(pais,"cz") then%>Selected<%end if%>>Czech Republic</option>
<option value='de' <%if instr(pais,"de") then%>Selected<%end if%>>Germany</option>
<option value='dj' <%if instr(pais,"dj") then%>Selected<%end if%>>Djibouti</option>
<option value='dk' <%if instr(pais,"dk") then%>Selected<%end if%>>Denmark</option>
<option value='dm' <%if instr(pais,"dm") then%>Selected<%end if%>>Dominica</option>
<option value='do' <%if instr(pais,"do") then%>Selected<%end if%>>Dominican Republic</option>
<option value='dz' <%if instr(pais,"dz") then%>Selected<%end if%>>Algeria</option>
<option value='ec' <%if instr(pais,"ec") then%>Selected<%end if%>>Ecuador</option>
<option value='ee' <%if instr(pais,"ee") then%>Selected<%end if%>>Estonia</option>
<option value='eg' <%if instr(pais,"eg") then%>Selected<%end if%>>Egypt</option>
<option value='eh' <%if instr(pais,"eh") then%>Selected<%end if%>>Western Sahara</option>
<option value='er' <%if instr(pais,"er") then%>Selected<%end if%>>Eritrea</option>
<option value='es' <%if instr(pais,"es") then%>Selected<%end if%>>Espana / Spain</option>
<option value='et' <%if instr(pais,"et") then%>Selected<%end if%>>Ethiopia</option>
<option value='fi' <%if instr(pais,"fi") then%>Selected<%end if%>>Finland</option>
<option value='fj' <%if instr(pais,"fj") then%>Selected<%end if%>>Fiji</option>
<option value='fk' <%if instr(pais,"fk") then%>Selected<%end if%>>Falkland Islands (Malvinas)</option>
<option value='fm' <%if instr(pais,"fm") then%>Selected<%end if%>>Federated States of Micronesia</option>
<option value='fo' <%if instr(pais,"fo") then%>Selected<%end if%>>Faroe Islands</option>
<option value='fr' <%if instr(pais,"fr") then%>Selected<%end if%>>France</option>
<option value='fx' <%if instr(pais,"fx") then%>Selected<%end if%>>France, Metropolitan</option>
<option value='ga' <%if instr(pais,"ga") then%>Selected<%end if%>>Gabon</option>
<option value='gb' <%if instr(pais,"gb") then%>Selected<%end if%>>Great Britain (UK)</option>
<option value='gd' <%if instr(pais,"gd") then%>Selected<%end if%>>Grenada</option>
<option value='ge' <%if instr(pais,"ge") then%>Selected<%end if%>>Georgia</option>
<option value='gf' <%if instr(pais,"gf") then%>Selected<%end if%>>French Guiana</option>
<option value='gh' <%if instr(pais,"gh") then%>Selected<%end if%>>Ghana</option>
<option value='gi' <%if instr(pais,"gi") then%>Selected<%end if%>>Gibraltar</option>
<option value='gl' <%if instr(pais,"gl") then%>Selected<%end if%>>Greenland</option>
<option value='gm' <%if instr(pais,"gm") then%>Selected<%end if%>>Gambia</option>
<option value='gn' <%if instr(pais,"gn") then%>Selected<%end if%>>Guinea</option>
<option value='gp' <%if instr(pais,"gp") then%>Selected<%end if%>>Guadeloupe</option>
<option value='gq' <%if instr(pais,"gq") then%>Selected<%end if%>>Equatorial Guinea</option>
<option value='gr' <%if instr(pais,"gr") then%>Selected<%end if%>>Greece</option>
<option value='gs' <%if instr(pais,"gs") then%>Selected<%end if%>>S. Georgia and S. Sandwich Islands</option>
<option value='gt' <%if instr(pais,"gt") then%>Selected<%end if%>>Guatemala</option>
<option value='gu' <%if instr(pais,"gu") then%>Selected<%end if%>>Guam</option>
<option value='gw' <%if instr(pais,"gw") then%>Selected<%end if%>>Guinea-Bissau</option>
<option value='gy' <%if instr(pais,"gy") then%>Selected<%end if%>>Guyana</option>
<option value='hk' <%if instr(pais,"hk") then%>Selected<%end if%>>Hong Kong</option>
<option value='hm' <%if instr(pais,"hm") then%>Selected<%end if%>>Heard Island and McDonald Islands</option>
<option value='hn' <%if instr(pais,"hn") then%>Selected<%end if%>>Honduras</option>
<option value='hr' <%if instr(pais,"hr") then%>Selected<%end if%>>Croatia (Hrvatska)</option>
<option value='ht' <%if instr(pais,"ht") then%>Selected<%end if%>>Haiti</option>
<option value='hu' <%if instr(pais,"hu") then%>Selected<%end if%>>Hungary</option>
<option value='id' <%if instr(pais,"id") then%>Selected<%end if%>>Indonesia</option>
<option value='ie' <%if instr(pais,"ie") then%>Selected<%end if%>>Ireland</option>
<option value='il' <%if instr(pais,"il") then%>Selected<%end if%>>Israel</option>
<option value='in' <%if instr(pais,"in") then%>Selected<%end if%>>India</option>
<option value='io' <%if instr(pais,"io") then%>Selected<%end if%>>British Indian Ocean Territory</option>
<option value='iq' <%if instr(pais,"iq") then%>Selected<%end if%>>Iraq</option>
<option value='ir' <%if instr(pais,"ir") then%>Selected<%end if%>>Iran</option>
<option value='is' <%if instr(pais,"is") then%>Selected<%end if%>>Iceland</option>
<option value='it' <%if instr(pais,"it") then%>Selected<%end if%>>Italy</option>
<option value='jm' <%if instr(pais,"jm") then%>Selected<%end if%>>Jamaica</option>
<option value='jo' <%if instr(pais,"jo") then%>Selected<%end if%>>Jordan</option>
<option value='jp' <%if instr(pais,"jp") then%>Selected<%end if%>>Japan</option>
<option value='ke' <%if instr(pais,"ke") then%>Selected<%end if%>>Kenya</option>
<option value='kg' <%if instr(pais,"kg") then%>Selected<%end if%>>Kyrgyzstan</option>
<option value='kh' <%if instr(pais,"kh") then%>Selected<%end if%>>Cambodia</option>
<option value='ki' <%if instr(pais,"ki") then%>Selected<%end if%>>Kiribati</option>
<option value='km' <%if instr(pais,"km") then%>Selected<%end if%>>Comoros</option>
<option value='kn' <%if instr(pais,"kn") then%>Selected<%end if%>>Saint Kitts and Nevis</option>
<option value='kp' <%if instr(pais,"kp") then%>Selected<%end if%>>Korea (North)</option>
<option value='kr' <%if instr(pais,"kr") then%>Selected<%end if%>>Korea (South)</option>
<option value='kw' <%if instr(pais,"kw") then%>Selected<%end if%>>Kuwait</option>
<option value='ky' <%if instr(pais,"ky") then%>Selected<%end if%>>Cayman Islands</option>
<option value='kz' <%if instr(pais,"kz") then%>Selected<%end if%>>Kazakhstan</option>
<option value='la' <%if instr(pais,"la") then%>Selected<%end if%>>Laos</option>
<option value='lb' <%if instr(pais,"lb") then%>Selected<%end if%>>Lebanon</option>
<option value='lc' <%if instr(pais,"lc") then%>Selected<%end if%>>Saint Lucia</option>
<option value='li' <%if instr(pais,"li") then%>Selected<%end if%>>Liechtenstein</option>
<option value='lk' <%if instr(pais,"lk") then%>Selected<%end if%>>Sri Lanka</option>
<option value='lr' <%if instr(pais,"lr") then%>Selected<%end if%>>Liberia</option>
<option value='ls' <%if instr(pais,"ls") then%>Selected<%end if%>>Lesotho</option>
<option value='lt' <%if instr(pais,"lt") then%>Selected<%end if%>>Lithuania</option>
<option value='lu' <%if instr(pais,"lu") then%>Selected<%end if%>>Luxembourg</option>
<option value='lv' <%if instr(pais,"lv") then%>Selected<%end if%>>Latvia</option>
<option value='ly' <%if instr(pais,"ly") then%>Selected<%end if%>>Libya</option>
<option value='ma' <%if instr(pais,"ma") then%>Selected<%end if%>>Morocco</option>
<option value='mc' <%if instr(pais,"mc") then%>Selected<%end if%>>Monaco</option>
<option value='md' <%if instr(pais,"md") then%>Selected<%end if%>>Moldova</option>
<option value='mg' <%if instr(pais,"mg") then%>Selected<%end if%>>Madagascar</option>
<option value='mh' <%if instr(pais,"mh") then%>Selected<%end if%>>Marshall Islands</option>
<option value='mk' <%if instr(pais,"mk") then%>Selected<%end if%>>Macedonia</option>
<option value='ml' <%if instr(pais,"ml") then%>Selected<%end if%>>Mali</option>
<option value='mm' <%if instr(pais,"mm") then%>Selected<%end if%>>Myanmar</option>
<option value='mn' <%if instr(pais,"mn") then%>Selected<%end if%>>Mongolia</option>
<option value='mo' <%if instr(pais,"mo") then%>Selected<%end if%>>Macao</option>
<option value='mp' <%if instr(pais,"mp") then%>Selected<%end if%>>Northern Mariana Islands</option>
<option value='mq' <%if instr(pais,"mq") then%>Selected<%end if%>>Martinique</option>
<option value='mr' <%if instr(pais,"mr") then%>Selected<%end if%>>Mauritania</option>
<option value='ms' <%if instr(pais,"ms") then%>Selected<%end if%>>Montserrat</option>
<option value='mt' <%if instr(pais,"mt") then%>Selected<%end if%>>Malta</option>
<option value='mu' <%if instr(pais,"mu") then%>Selected<%end if%>>Mauritius</option>
<option value='mv' <%if instr(pais,"mv") then%>Selected<%end if%>>Maldives</option>
<option value='mw' <%if instr(pais,"mw") then%>Selected<%end if%>>Malawi</option>
<option value='mx' <%if instr(pais,"mx") then%>Selected<%end if%>>Mexico</option>
<option value='my' <%if instr(pais,"my") then%>Selected<%end if%>>Malaysia</option>
<option value='mz' <%if instr(pais,"mz") then%>Selected<%end if%>>Mozambique</option>
<option value='na' <%if instr(pais,"na") then%>Selected<%end if%>>Namibia</option>
<option value='nc' <%if instr(pais,"nc") then%>Selected<%end if%>>New Caledonia</option>
<option value='ne' <%if instr(pais,"ne") then%>Selected<%end if%>>Niger</option>
<option value='nf' <%if instr(pais,"nf") then%>Selected<%end if%>>Norfolk Island</option>
<option value='ng' <%if instr(pais,"ng") then%>Selected<%end if%>>Nigeria</option>
<option value='ni' <%if instr(pais,"ni") then%>Selected<%end if%>>Nicaragua</option>
<option value='nl' <%if instr(pais,"nl") then%>Selected<%end if%>>Netherlands</option>
<option value='no' <%if instr(pais,"no") then%>Selected<%end if%>>Norway</option>
<option value='np' <%if instr(pais,"np") then%>Selected<%end if%>>Nepal</option>
<option value='nr' <%if instr(pais,"nr") then%>Selected<%end if%>>Nauru</option>
<option value='nu' <%if instr(pais,"nu") then%>Selected<%end if%>>Niue</option>
<option value='nz' <%if instr(pais,"nz") then%>Selected<%end if%>>New Zealand (Aotearoa)</option>
<option value='om' <%if instr(pais,"om") then%>Selected<%end if%>>Oman</option>
<option value='pa' <%if instr(pais,"pa") then%>Selected<%end if%>>Panama</option>
<option value='pe' <%if instr(pais,"pe") then%>Selected<%end if%>>Peru</option>
<option value='pf' <%if instr(pais,"pf") then%>Selected<%end if%>>French Polynesia</option>
<option value='pg' <%if instr(pais,"pg") then%>Selected<%end if%>>Papua New Guinea</option>
<option value='ph' <%if instr(pais,"ph") then%>Selected<%end if%>>Philippines</option>
<option value='pk' <%if instr(pais,"pk") then%>Selected<%end if%>>Pakistan</option>
<option value='pl' <%if instr(pais,"pl") then%>Selected<%end if%>>Poland</option>
<option value='pm' <%if instr(pais,"pm") then%>Selected<%end if%>>Saint Pierre and Miquelon</option>
<option value='pn' <%if instr(pais,"pn") then%>Selected<%end if%>>Pitcairn</option>
<option value='pr' <%if instr(pais,"pr") then%>Selected<%end if%>>Puerto Rico</option>
<option value='ps' <%if instr(pais,"ps") then%>Selected<%end if%>>Palestinian Territory</option>
<option value='pt' <%if instr(pais,"pt") then%>Selected<%end if%>>Portugal</option>
<option value='pw' <%if instr(pais,"pw") then%>Selected<%end if%>>Palau</option>
<option value='py' <%if instr(pais,"py") then%>Selected<%end if%>>Paraguay</option>
<option value='qa' <%if instr(pais,"qa") then%>Selected<%end if%>>Qatar</option>
<option value='re' <%if instr(pais,"re") then%>Selected<%end if%>>Reunion</option>
<option value='ro' <%if instr(pais,"ro") then%>Selected<%end if%>>Romania</option>
<option value='ru' <%if instr(pais,"ru") then%>Selected<%end if%>>Russian Federation</option>
<option value='rw' <%if instr(pais,"rw") then%>Selected<%end if%>>Rwanda</option>
<option value='sa' <%if instr(pais,"sa") then%>Selected<%end if%>>Saudi Arabia</option>
<option value='sb' <%if instr(pais,"sb") then%>Selected<%end if%>>Solomon Islands</option>
<option value='sc' <%if instr(pais,"sc") then%>Selected<%end if%>>Seychelles</option>
<option value='sd' <%if instr(pais,"sd") then%>Selected<%end if%>>Sudan</option>
<option value='se' <%if instr(pais,"se") then%>Selected<%end if%>>Sweden</option>
<option value='sg' <%if instr(pais,"sg") then%>Selected<%end if%>>Singapore</option>
<option value='sh' <%if instr(pais,"sh") then%>Selected<%end if%>>Saint Helena</option>
<option value='si' <%if instr(pais,"si") then%>Selected<%end if%>>Slovenia</option>
<option value='sj' <%if instr(pais,"sj") then%>Selected<%end if%>>Svalbard and Jan Mayen</option>
<option value='sk' <%if instr(pais,"sk") then%>Selected<%end if%>>Slovakia</option>
<option value='sl' <%if instr(pais,"sl") then%>Selected<%end if%>>Sierra Leone</option>
<option value='sm' <%if instr(pais,"sm") then%>Selected<%end if%>>San Marino</option>
<option value='sn' <%if instr(pais,"sn") then%>Selected<%end if%>>Senegal</option>
<option value='so' <%if instr(pais,"so") then%>Selected<%end if%>>Somalia</option>
<option value='sr' <%if instr(pais,"sr") then%>Selected<%end if%>>Suriname</option>
<option value='st' <%if instr(pais,"st") then%>Selected<%end if%>>Sao Tome and Principe</option>
<option value='su' <%if instr(pais,"su") then%>Selected<%end if%>>USSR (former)</option>
<option value='sv' <%if instr(pais,"sv") then%>Selected<%end if%>>El Salvador</option>
<option value='sy' <%if instr(pais,"sy") then%>Selected<%end if%>>Syria</option>
<option value='sz' <%if instr(pais,"sz") then%>Selected<%end if%>>Swaziland</option>
<option value='tc' <%if instr(pais,"tc") then%>Selected<%end if%>>Turks and Caicos Islands</option>
<option value='td' <%if instr(pais,"td") then%>Selected<%end if%>>Chad</option>
<option value='tf' <%if instr(pais,"tf") then%>Selected<%end if%>>French Southern Territories</option>
<option value='tg' <%if instr(pais,"tg") then%>Selected<%end if%>>Togo</option>
<option value='th' <%if instr(pais,"th") then%>Selected<%end if%>>Thailand</option>
<option value='tj' <%if instr(pais,"tj") then%>Selected<%end if%>>Tajikistan</option>
<option value='tk' <%if instr(pais,"tk") then%>Selected<%end if%>>Tokelau</option>
<option value='tl' <%if instr(pais,"tl") then%>Selected<%end if%>>Timor-Leste</option>
<option value='tm' <%if instr(pais,"tm") then%>Selected<%end if%>>Turkmenistan</option>
<option value='tn' <%if instr(pais,"tn") then%>Selected<%end if%>>Tunisia</option>
<option value='to' <%if instr(pais,"to") then%>Selected<%end if%>>Tonga</option>
<option value='tp' <%if instr(pais,"tp") then%>Selected<%end if%>>East Timor</option>
<option value='tr' <%if instr(pais,"tr") then%>Selected<%end if%>>Turkey</option>
<option value='tt' <%if instr(pais,"tt") then%>Selected<%end if%>>Trinidad and Tobago</option>
<option value='tv' <%if instr(pais,"tv") then%>Selected<%end if%>>Tuvalu</option>
<option value='tw' <%if instr(pais,"tw") then%>Selected<%end if%>>Taiwan</option>
<option value='tz' <%if instr(pais,"tz") then%>Selected<%end if%>>Tanzania</option>
<option value='ua' <%if instr(pais,"ua") then%>Selected<%end if%>>Ukraine</option>
<option value='ug' <%if instr(pais,"ug") then%>Selected<%end if%>>Uganda</option>
<option value='uk' <%if instr(pais,"uk") then%>Selected<%end if%>>United Kingdom</option>
<option value='um' <%if instr(pais,"um") then%>Selected<%end if%>>United States Minor Outlying Islands</option>
<option value='us' <%if instr(pais,"us") then%>Selected<%end if%>>United States</option>
<option value='uy' <%if instr(pais,"uy") then%>Selected<%end if%>>Uruguay</option>
<option value='uz' <%if instr(pais,"uz") then%>Selected<%end if%>>Uzbekistan</option>
<option value='va' <%if instr(pais,"va") then%>Selected<%end if%>>Vatican City State (Holy See)</option>
<option value='vc' <%if instr(pais,"vc") then%>Selected<%end if%>>Saint Vincent and the Grenadines</option>
<option value='ve' <%if instr(pais,"ve") then%>Selected<%end if%>>Venezuela</option>
<option value='vg' <%if instr(pais,"vg") then%>Selected<%end if%>>Virgin Islands (British)</option>
<option value='vi' <%if instr(pais,"vi") then%>Selected<%end if%>>Virgin Islands (U.S.)</option>
<option value='vn' <%if instr(pais,"vn") then%>Selected<%end if%>>Viet Nam</option>
<option value='vu' <%if instr(pais,"vu") then%>Selected<%end if%>>Vanuatu</option>
<option value='wf' <%if instr(pais,"wf") then%>Selected<%end if%>>Wallis and Futuna</option>
<option value='ws' <%if instr(pais,"ws") then%>Selected<%end if%>>Samoa</option>
<option value='ye' <%if instr(pais,"ye") then%>Selected<%end if%>>Yemen</option>
<option value='yt' <%if instr(pais,"yt") then%>Selected<%end if%>>Mayotte</option>
<option value='yu' <%if instr(pais,"yu") then%>Selected<%end if%>>Yugoslavia (former)</option>
<option value='za' <%if instr(pais,"za") then%>Selected<%end if%>>South Africa</option>
<option value='zm' <%if instr(pais,"zm") then%>Selected<%end if%>>Zambia</option>
<option value='zr' <%if instr(pais,"zr") then%>Selected<%end if%>>Zaire (former)</option>
<option value='zw' <%if instr(pais,"zw") then%>Selected<%end if%>>Zimbabwe</option></select>
<div class="form-control-focus"> </div>
<i class="fa fa-globe" aria-hidden="true"></i></div>
</div>
</div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="c_postal" >C. Postal.</label>
<div class="col-md-4">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="c_postal" id="c_postal"  maxlength="160" value="<%=c_postal%>"><div class="form-control-focus"> </div><i class="fa fa-envelope-square" aria-hidden="true"></i></div></div></div>
</div>
</div>
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input" id="email_a">
<label class="col-md-6 control-label" for="email" style="padding-right:0px;">eMail.</label>
<div class="col-md-6">
<div class="input-icon" style="margin-left:15px"><input type="text" class="form-control" placeholder="" name="email" id="email"  maxlength="160" value="<%=email%>" onKeyUp="resetea_error('email_a');"><div class="form-control-focus"> </div><i class="fa fa-envelope-o" aria-hidden="true"></i><span class="help-block">en blanco o correcto</span></div></div></div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="telefono" >Teléfono.</label>
<div class="col-md-4">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="telefono" id="telefono"  maxlength="160" value="<%=telefono%>"><div class="form-control-focus"> </div><i class="fa fa-phone" aria-hidden="true"></i></div></div></div>
</div>
</div>
<div class="col-md-8">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="persona_contacto" style="padding-right:15px;">Persona contacto.</label>
<div class="col-md-7" style="margin-left:0px;">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="persona_contacto" id="persona_contacto"  maxlength="160" value="<%=persona_contacto%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">persona de contacto</span></div></div></div>
</div>
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-6 control-label" for="email_p" id="email_p_a" style="padding-right:0px;">eMail.</label>
<div class="col-md-6">
<div class="input-icon" style="margin-left:15px"><input type="text" class="form-control" placeholder="" name="email_p" id="email_p" onKeyUp="resetea_error('email_p_a');" maxlength="160" value="<%=email_p%>"><div class="form-control-focus"> </div><i class="fa fa-envelope-o" aria-hidden="true"></i><span class="help-block">en blanco o correcto</span></div></div></div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="movil" >Móvil.</label>
<div class="col-md-4">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="movil" id="movil"  maxlength="160" value="<%=movil%>"><div class="form-control-focus"> </div><i class="fa fa-mobile" aria-hidden="true"></i></div></div></div>
</div>
</div>
<div class="col-md-10">
<div class="form-group form-md-line-input"><label class="col-md-3 control-label magin-left-25" for="texto_esp">Otros datos.</label>
<div class="col-md-7"><div class="input-icon"><textarea class="form-control" name="otros_datos" id="otros_datos" rows="3"><%=otros_datos%></textarea><div class="form-control-focus"> </div>
<i class="fa fa-quote-right" aria-hidden="true"></i>
</div></div>
</div>
</div><!--col-md-10-->
</div>
</div><!--row-->
</div><!--form-body-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_proveedores(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<button type="reset" class="btn default"><i class="fa fa-eraser" aria-hidden="true"></i> resetear formulario</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos))%>
<%if edi="" then%><a href="<%=r%>proveedores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--form-body-->
</form>
</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div>
</div>
</div><!--page-content-row-->
</div><!--page-content-container-->
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});})
var limita=function(){var a=function(){$("#titulo_esp").maxlength({limitReachedClass:"label label-danger"})};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
</script>