<!--#include file="comun/menu_sup.asp"-->
<!--#include file="comun/z_check_user.asp"-->
<%op=request("op")%>
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" style="background-image: url(<%=ruta_banner%>)">
<div class="container"><div class="c-page-title c-pull-left"><h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07"> Zona de usuario</h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white">Usuario</li></ul></div></div><div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row">
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%if form_op="loginSup" then%>
<div class="col-md-12" ><div class="col-md-12 alert alert-danger alert-dismissible" role="alert"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> <%=msg%></div></div>
<%else%>
<div class="col-md-12" id="usuario_new_ko"><div class="col-md-12 alert alert-danger alert-dismissible" role="alert"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Este usuario parece estar ya registrado. Revisa el mail, el nombre y los apellidos, y el NIF, o intenta recuperar tu contraseña.</div></div>
<%end if%>
<div class="col-md-12 acceso reserva_check" id="usuario_reg">
<div class="col-md-6"><div class="acceso_in"><div class="acceso_in_in nuevo_user"><a href="javascript:sh_usuario_new();" class="a_nuevo_user"><h5><i class="fa fa-user-plus" aria-hidden="true"></i> Soy nuevo usuario </h5></a></div></div></div>
<div class="col-md-6">
<form class="form" role="form" method="post" action="<%=r%>login" id="login_p" name="login_p">
<input name="form_op" type="hidden" value="loginSup">
<div class="acceso_in">
<div class="acceso_in_in">
<div class="form-group"><i class="fa fa-user"></i><input type="text" placeholder="Usuario*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Usuario*'" class="form-control c-square c-theme input-lg inp" name="log_usuario" id="log_usuario"></div>
<div class="form-group">
<i class="fa fa-key" aria-hidden="true"></i>
<input type="password" placeholder="Contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Contraseña*'" class="form-control c-square c-theme input-lg inp" name="log_pass" id="log_pass"></div>
<span class="btn_acceso"><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold" onCLick="javascript:log_acceder_p();">Acceder<i class="fa fa-sign-in" aria-hidden="true" style="margin-left:8px"></i></button></span>
<span class="btn_recuperar"><a href="<%=r%>recuperar-pass" class="a_recuperar"><i class="fa fa-question-circle" aria-hidden="true"></i>  contraseña</a></span>
<span class="error_acceso_span" id="fallo_pass"></span>
</div>
</div>
</form>
</div>
</div>
<!--NUEVO USUARIO-->
<div id="usuario_new" class="col-md-12 reserva_check">
<form action="reserva-check"  name="f_reserva" id="f_reserva" method="post"><input name="form_op" type="hidden" value="regi">
<a href="javascript:sh_usuario_reg();" id="a_usuario_reg"><h5 style="text-align:right"><i class="fa fa-user" aria-hidden="true"></i> Soy usuario registrado <i class="fa fa-arrow-up" aria-hidden="true" style="float:right;margin-left:15px"></i></h5></a>
<div class="col-md-12"></div>
<div class="col-md-12" id="datos_usuario">
<div class="col-md-12">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-user-plus" aria-hidden="true" style="margin-right:10px"></i>Datos de Usuario</h3>
</div>
<div class="panel-body">Introduce la información correspondiente a los datos del usuario. Por ejemplo, padre o madre de un alumno o, en caso de adultos, los datos del propio alumno. </div>
</div></div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Nombre*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre*'" class="form-control c-square c-theme input-lg inp" name="u_nombre" id="u_nombre"></div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Apellidos*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos*'" class="form-control c-square c-theme input-lg inp" name="u_apellidos" id="u_apellidos"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="email*" onclick="this.placeholder = ''" onblur="this.placeholder = 'email*'" class="form-control c-square c-theme input-lg inp"  name="u_email" id="u_email"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="repetir email*" onclick="this.placeholder = ''" onblur="this.placeholder = 'repetir email*'" class="form-control c-square c-theme input-lg inp" name="u_email_r" id="u_email_r"></div>
<div class="form-group"><i class="fa fa-key" aria-hidden="true"></i><input type="password" placeholder="contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'contraseña*'" class="form-control c-square c-theme input-lg inp" name="u_pass" id="u_pass" ></div>
<div class="form-group"><i class="fa fa-key" aria-hidden="true"></i><input type="password" placeholder="repetir contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'repetir contraseña*'" class="form-control c-square c-theme input-lg inp" name="u_pass_r" id="u_pass_r"></div>
<div class="form-group"><i class="fa fa-id-card" aria-hidden="true"></i><input type="u_nif" placeholder="NIF*" onclick="this.placeholder = ''" onblur="this.placeholder = 'NIF*'" class="form-control c-square c-theme input-lg inp" name="u_nif" id="u_nif"></div>
<div class="c-checkbox-list agente inp_n" data-toggle="tooltip" data-placement="top" title="Solo agentes Cursit Idiomas" style="display:none">
<div class="c-checkbox" style="margin:0;margin-top:5px" >
<input type="checkbox" class="c-check" name="u_agente" id="u_agente" autocomplete="off">
<label for="u_agente" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span> Soy agente de Cursit Idiomas</label>
</div>
</div>
</div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono*'" class="form-control c-square c-theme input-lg inp" name="u_telefono" id="u_telefono"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Móvil*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Móvil*'" class="form-control c-square c-theme input-lg inp" name="u_movil" id="u_movil"></div>
<div class="form-group"><i class="fa fa-street-view" aria-hidden="true"></i><input type="text" placeholder="Dirección*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Dirección*'" class="form-control c-square c-theme input-lg inp" name="u_direccion" id="u_direccion"></div>
<div class="form-group"><i class="fa fa-map-marker" aria-hidden="true"></i><input type="text" placeholder="Ciudad / Localidad*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Ciudad / Localidad*'" class="form-control c-square c-theme input-lg inp" name="u_ciudad" id="u_ciudad"></div>
<div class="form-group"><i class="fa fa-envelope-open-o" aria-hidden="true"></i><input type="text" placeholder="Código Postal" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código Postal'" class="form-control c-square c-theme input-lg inp" name="u_c_postal" id="u_c_postal"></div>
<div class="col-md-5 form-group" style="margin:0px;padding:0;margin-bottom:11px;" id="prov" ><i class="fa fa-map-pin" aria-hidden="true"></i>
<select name="u_provincia" id="u_provincia" style="margin-right:16px;width:100%;" class="select-provincia inp">
<option value="" selected="selected">Selecciona Provncia*</option>
<option value="ALAVA">ALAVA</option>
<option value="ALBACETE">ALBACETE</option>
<option value="ALICANTE">ALICANTE</option>
<option value="ALMERIA">ALMERIA</option>
<option value="ASTURIAS">ASTURIAS</option>
<option value="AVILA">AVILA</option>
<option value="BADAJOZ">BADAJOZ</option>
<option value="BARCELONA">BARCELONA</option>
<option value="BURGOS">BURGOS</option>
<option value="CACERES">CACERES</option>
<option value="CADIZ">CADIZ</option>
<option value="CANTABRIA">CANTABRIA</option>
<option value="CASTELLON">CASTELLON</option>
<option value="CEUTA">CEUTA</option>
<option value="CIUDAD REAL">CIUDAD REAL</option>
<option value="CORDOBA">CORDOBA</option>
<option value="CORU&Ntilde;A, A">CORU&Ntilde;A, A</option>
<option value="CUENCA">CUENCA</option>
<option value="GIRONA">GIRONA</option>
<option value="GRANADA">GRANADA</option>
<option value="GUADALAJARA">GUADALAJARA</option>
<option value="GUIPUZCOA">GUIPUZCOA</option>
<option value="HUELVA">HUELVA</option>
<option value="HUESCA">HUESCA</option>
<option value="ILLES BALEARS">ILLES BALEARS</option>
<option value="JAEN">JAEN</option>
<option value="LEON">LEON</option>
<option value="LLEIDA">LLEIDA</option>
<option value="LUGO">LUGO</option>
<option value="MADRID">MADRID</option>
<option value="MALAGA">MALAGA</option>
<option value="MELILLA">MELILLA</option>
<option value="MURCIA">MURCIA</option>
<option value="NAVARRA">NAVARRA</option>
<option value="OURENSE">OURENSE</option>
<option value="PALENCIA">PALENCIA</option>
<option value="PALMAS, LAS">PALMAS, LAS</option>
<option value="PONTEVEDRA">PONTEVEDRA</option>
<option value="RIOJA, LA">RIOJA, LA</option>
<option value="SALAMANCA">SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE">SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA">SEGOVIA</option>
<option value="SEVILLA">SEVILLA</option>
<option value="SORIA">SORIA</option>
<option value="TARRAGONA">TARRAGONA</option>
<option value="TERUEL">TERUEL</option>
<option value="TOLEDO">TOLEDO</option>
<option value="VALENCIA">VALENCIA</option>
<option value="VALLADOLID">VALLADOLID</option>
<option value="VIZCAYA">VIZCAYA</option>
<option value="ZAMORA">ZAMORA</option>
<option value="ZARAGOZA">ZARAGOZA</option>
<option value="OTRAS">OTRAS</option>
</select>
</div>
<div class="col-md-7 form-group select-pais" style="margin:0px;padding:0px;padding-left:25px;margin-bottom:11px;" id="pais_sel">
<select name="u_pais" id="u_pais" class="selects" style="width:100%;">
<option value='ad' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ad" data-title="Andorra">Andorra</option>
  <option value='ae' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ae" data-title="United Arab Emirates">United Arab Emirates</option>
  <option value='af' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag af" data-title="Afghanistan">Afghanistan</option>
  <option value='ag' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ag" data-title="Antigua and Barbuda">Antigua and Barbuda</option>
  <option value='ai' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ai" data-title="Anguilla">Anguilla</option>
  <option value='al' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag al" data-title="Albania">Albania</option>
  <option value='am' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag am" data-title="Armenia">Armenia</option>
  <option value='an' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag an" data-title="Netherlands Antilles">Netherlands Antilles</option>
  <option value='ao' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ao" data-title="Angola">Angola</option>
  <option value='aq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aq" data-title="Antarctica">Antarctica</option>
  <option value='ar' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ar" data-title="Argentina">Argentina</option>
  <option value='as' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag as" data-title="American Samoa">American Samoa</option>
  <option value='at' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag at" data-title="Austria">Austria</option>
  <option value='au' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag au" data-title="Australia">Australia</option>
  <option value='aw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aw" data-title="Aruba">Aruba</option>
  <option value='ax' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ax" data-title="Aland Islands">Aland Islands</option>
  <option value='az' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag az" data-title="Azerbaijan">Azerbaijan</option>
  <option value='ba' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ba" data-title="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
  <option value='bb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bb" data-title="Barbados">Barbados</option>
  <option value='bd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bd" data-title="Bangladesh">Bangladesh</option>
  <option value='be' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag be" data-title="Belgium">Belgium</option>
  <option value='bf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bf" data-title="Burkina Faso">Burkina Faso</option>
  <option value='bg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bg" data-title="Bulgaria">Bulgaria</option>
  <option value='bh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bh" data-title="Bahrain">Bahrain</option>
  <option value='bi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bi" data-title="Burundi">Burundi</option>
  <option value='bj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bj" data-title="Benin">Benin</option>
  <option value='bm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bm" data-title="Bermuda">Bermuda</option>
  <option value='bn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bn" data-title="Brunei Darussalam">Brunei Darussalam</option>
  <option value='bo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bo" data-title="Bolivia">Bolivia</option>
  <option value='br' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag br" data-title="Brazil">Brazil</option>
  <option value='bs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bs" data-title="Bahamas">Bahamas</option>
  <option value='bt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bt" data-title="Bhutan">Bhutan</option>
  <option value='bv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bv" data-title="Bouvet Island">Bouvet Island</option>
  <option value='bw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bw" data-title="Botswana">Botswana</option>
  <option value='by' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag by" data-title="Belarus">Belarus</option>
  <option value='bz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bz" data-title="Belize">Belize</option>
  <option value='ca' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ca" data-title="Canada">Canada</option>
  <option value='cc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cc" data-title="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
  <option value='cd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cd" data-title="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
  <option value='cf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cf" data-title="Central African Republic">Central African Republic</option>
  <option value='cg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cg" data-title="Congo">Congo</option>
  <option value='ch' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ch" data-title="Switzerland">Switzerland</option>
  <option value='ci' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ci" data-title="Cote D'Ivoire (Ivory Coast)">Cote D'Ivoire (Ivory Coast)</option>
  <option value='ck' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ck" data-title="Cook Islands">Cook Islands</option>
  <option value='cl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cl" data-title="Chile">Chile</option>
  <option value='cm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cm" data-title="Cameroon">Cameroon</option>
  <option value='cn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cn" data-title="China">China</option>
  <option value='co' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag co" data-title="Colombia">Colombia</option>
  <option value='cr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cr" data-title="Costa Rica">Costa Rica</option>
  <option value='cs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cs" data-title="Serbia and Montenegro">Serbia and Montenegro</option>
  <option value='cu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cu" data-title="Cuba">Cuba</option>
  <option value='cv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cv" data-title="Cape Verde">Cape Verde</option>
  <option value='cx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cx" data-title="Christmas Island">Christmas Island</option>
  <option value='cy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cy" data-title="Cyprus">Cyprus</option>
  <option value='cz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cz" data-title="Czech Republic">Czech Republic</option>
  <option value='de' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag de" data-title="Germany">Germany</option>
  <option value='dj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dj" data-title="Djibouti">Djibouti</option>
  <option value='dk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dk" data-title="Denmark">Denmark</option>
  <option value='dm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dm" data-title="Dominica">Dominica</option>
  <option value='do' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag do" data-title="Dominican Republic">Dominican Republic</option>
  <option value='dz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dz" data-title="Algeria">Algeria</option>
  <option value='ec' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ec" data-title="Ecuador">Ecuador</option>
  <option value='ee' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ee" data-title="Estonia">Estonia</option>
  <option value='eg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eg" data-title="Egypt">Egypt</option>
  <option value='eh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eh" data-title="Western Sahara">Western Sahara</option>
  <option value='er' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag er" data-title="Eritrea">Eritrea</option>
  <option value='es' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag es" data-title="Spain" selected="selected">España / Spain</option>
  <option value='et' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag et" data-title="Ethiopia">Ethiopia</option>
  <option value='fi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fi" data-title="Finland">Finland</option>
  <option value='fj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fj" data-title="Fiji">Fiji</option>
  <option value='fk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fk" data-title="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
  <option value='fm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fm" data-title="Federated States of Micronesia">Federated States of Micronesia</option>
  <option value='fo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fo" data-title="Faroe Islands">Faroe Islands</option>
  <option value='fr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fr" data-title="France">France</option>
  <option value='fx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fx" data-title="France, Metropolitan">France, Metropolitan</option>
  <option value='ga' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ga" data-title="Gabon">Gabon</option>
  <option value='gd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gd" data-title="Grenada">Grenada</option>
  <option value='ge' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ge" data-title="Georgia">Georgia</option>
  <option value='gf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gf" data-title="French Guiana">French Guiana</option>
  <option value='gh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gh" data-title="Ghana">Ghana</option>
  <option value='gi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gi" data-title="Gibraltar">Gibraltar</option>
  <option value='gl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gl" data-title="Greenland">Greenland</option>
  <option value='gm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gm" data-title="Gambia">Gambia</option>
  <option value='gn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gn" data-title="Guinea">Guinea</option>
  <option value='gp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gp" data-title="Guadeloupe">Guadeloupe</option>
  <option value='gq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gq" data-title="Equatorial Guinea">Equatorial Guinea</option>
  <option value='gr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gr" data-title="Greece">Greece</option>
  <option value='gs' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gs" data-title="S. Georgia and S. Sandwich Islands">S. Georgia and S. Sandwich Islands</option>
  <option value='gt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gt" data-title="Guatemala">Guatemala</option>
  <option value='gu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gu" data-title="Guam">Guam</option>
  <option value='gw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gw" data-title="Guinea-Bissau">Guinea-Bissau</option>
  <option value='gy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gy" data-title="Guyana">Guyana</option>
  <option value='hk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hk" data-title="Hong Kong">Hong Kong</option>
  <option value='hm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hm" data-title="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
  <option value='hn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hn" data-title="Honduras">Honduras</option>
  <option value='hr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hr" data-title="Croatia (Hrvatska)">Croatia (Hrvatska)</option>
  <option value='ht' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ht" data-title="Haiti">Haiti</option>
  <option value='hu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hu" data-title="Hungary">Hungary</option>
  <option value='id' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag id" data-title="Indonesia">Indonesia</option>
  <option value='ie' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ie" data-title="Ireland">Ireland</option>
  <option value='il' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag il" data-title="Israel">Israel</option>
  <option value='in' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag in" data-title="India" >India</option>
  <option value='io' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag io" data-title="British Indian Ocean Territory">British Indian Ocean Territory</option>
  <option value='iq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag iq" data-title="Iraq">Iraq</option>
  <option value='ir' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ir" data-title="Iran">Iran</option>
  <option value='is' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag is" data-title="Iceland">Iceland</option>
  <option value='it' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag it" data-title="Italy">Italy</option>
  <option value='jm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jm" data-title="Jamaica">Jamaica</option>
  <option value='jo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jo" data-title="Jordan">Jordan</option>
  <option value='jp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jp" data-title="Japan">Japan</option>
  <option value='ke' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ke" data-title="Kenya">Kenya</option>
  <option value='kg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kg" data-title="Kyrgyzstan">Kyrgyzstan</option>
  <option value='kh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kh" data-title="Cambodia">Cambodia</option>
  <option value='ki' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ki" data-title="Kiribati">Kiribati</option>
  <option value='km' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag km" data-title="Comoros">Comoros</option>
  <option value='kn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kn" data-title="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
  <option value='kp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kp" data-title="Korea (North)">Korea (North)</option>
  <option value='kr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kr" data-title="Korea (South)">Korea (South)</option>
  <option value='kw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kw" data-title="Kuwait">Kuwait</option>
  <option value='ky' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ky" data-title="Cayman Islands">Cayman Islands</option>
  <option value='kz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kz" data-title="Kazakhstan">Kazakhstan</option>
  <option value='la' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag la" data-title="Laos">Laos</option>
  <option value='lb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lb" data-title="Lebanon">Lebanon</option>
  <option value='lc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lc" data-title="Saint Lucia">Saint Lucia</option>
  <option value='li' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag li" data-title="Liechtenstein">Liechtenstein</option>
  <option value='lk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lk" data-title="Sri Lanka">Sri Lanka</option>
  <option value='lr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lr" data-title="Liberia">Liberia</option>
  <option value='ls' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ls" data-title="Lesotho">Lesotho</option>
  <option value='lt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lt" data-title="Lithuania">Lithuania</option>
  <option value='lu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lu" data-title="Luxembourg">Luxembourg</option>
  <option value='lv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lv" data-title="Latvia">Latvia</option>
  <option value='ly' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ly" data-title="Libya">Libya</option>
  <option value='ma' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ma" data-title="Morocco">Morocco</option>
  <option value='mc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mc" data-title="Monaco">Monaco</option>
  <option value='md' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag md" data-title="Moldova">Moldova</option>
  <option value='mg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mg" data-title="Madagascar">Madagascar</option>
  <option value='mh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mh" data-title="Marshall Islands">Marshall Islands</option>
  <option value='mk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mk" data-title="Macedonia">Macedonia</option>
  <option value='ml' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ml" data-title="Mali">Mali</option>
  <option value='mm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mm" data-title="Myanmar">Myanmar</option>
  <option value='mn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mn" data-title="Mongolia">Mongolia</option>
  <option value='mo' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mo" data-title="Macao">Macao</option>
  <option value='mp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mp" data-title="Northern Mariana Islands">Northern Mariana Islands</option>
  <option value='mq' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mq" data-title="Martinique">Martinique</option>
  <option value='mr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mr" data-title="Mauritania">Mauritania</option>
  <option value='ms' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ms" data-title="Montserrat">Montserrat</option>
  <option value='mt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mt" data-title="Malta">Malta</option>
  <option value='mu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mu" data-title="Mauritius">Mauritius</option>
  <option value='mv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mv" data-title="Maldives">Maldives</option>
  <option value='mw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mw" data-title="Malawi">Malawi</option>
  <option value='mx' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mx" data-title="Mexico">Mexico</option>
  <option value='my' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag my" data-title="Malaysia">Malaysia</option>
  <option value='mz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mz" data-title="Mozambique">Mozambique</option>
  <option value='na' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag na" data-title="Namibia">Namibia</option>
  <option value='nc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nc" data-title="New Caledonia">New Caledonia</option>
  <option value='ne' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ne" data-title="Niger">Niger</option>
  <option value='nf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nf" data-title="Norfolk Island">Norfolk Island</option>
  <option value='ng' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ng" data-title="Nigeria">Nigeria</option>
  <option value='ni' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ni" data-title="Nicaragua">Nicaragua</option>
  <option value='nl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nl" data-title="Netherlands">Netherlands</option>
  <option value='no' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag no" data-title="Norway">Norway</option>
  <option value='np' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag np" data-title="Nepal">Nepal</option>
  <option value='nr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nr" data-title="Nauru">Nauru</option>
  <option value='nu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nu" data-title="Niue">Niue</option>
  <option value='nz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nz" data-title="New Zealand (Aotearoa)">New Zealand (Aotearoa)</option>
  <option value='om' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag om" data-title="Oman">Oman</option>
  <option value='pa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pa" data-title="Panama">Panama</option>
  <option value='pe' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pe" data-title="Peru">Peru</option>
  <option value='pf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pf" data-title="French Polynesia">French Polynesia</option>
  <option value='pg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pg" data-title="Papua New Guinea">Papua New Guinea</option>
  <option value='ph' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ph" data-title="Philippines">Philippines</option>
  <option value='pk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pk" data-title="Pakistan">Pakistan</option>
  <option value='pl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pl" data-title="Poland">Poland</option>
  <option value='pm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pm" data-title="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
  <option value='pn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pn" data-title="Pitcairn">Pitcairn</option>
  <option value='pr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pr" data-title="Puerto Rico">Puerto Rico</option>
  <option value='ps' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ps" data-title="Palestinian Territory">Palestinian Territory</option>
  <option value='pt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pt" data-title="Portugal">Portugal</option>
  <option value='pw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pw" data-title="Palau">Palau</option>
  <option value='py' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag py" data-title="Paraguay">Paraguay</option>
  <option value='qa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag qa" data-title="Qatar">Qatar</option>
  <option value='re' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag re" data-title="Reunion">Reunion</option>
  <option value='ro' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ro" data-title="Romania">Romania</option>
  <option value='ru' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ru" data-title="Russian Federation">Russian Federation</option>
  <option value='rw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag rw" data-title="Rwanda">Rwanda</option>
  <option value='sa' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sa" data-title="Saudi Arabia">Saudi Arabia</option>
  <option value='sb' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sb" data-title="Solomon Islands">Solomon Islands</option>
  <option value='sc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sc" data-title="Seychelles">Seychelles</option>
  <option value='sd' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sd" data-title="Sudan">Sudan</option>
  <option value='se' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag se" data-title="Sweden">Sweden</option>
  <option value='sg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sg" data-title="Singapore">Singapore</option>
  <option value='sh' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sh" data-title="Saint Helena">Saint Helena</option>
  <option value='si' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag si" data-title="Slovenia">Slovenia</option>
  <option value='sj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sj" data-title="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
  <option value='sk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sk" data-title="Slovakia">Slovakia</option>
  <option value='sl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sl" data-title="Sierra Leone">Sierra Leone</option>
  <option value='sm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sm" data-title="San Marino">San Marino</option>
  <option value='sn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sn" data-title="Senegal">Senegal</option>
  <option value='so' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag so" data-title="Somalia">Somalia</option>
  <option value='sr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sr" data-title="Suriname">Suriname</option>
  <option value='st' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag st" data-title="Sao Tome and Principe">Sao Tome and Principe</option>
  <option value='su' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag su" data-title="USSR (former)">USSR (former)</option>
  <option value='sv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sv" data-title="El Salvador">El Salvador</option>
  <option value='sy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sy" data-title="Syria">Syria</option>
  <option value='sz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sz" data-title="Swaziland">Swaziland</option>
  <option value='tc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tc" data-title="Turks and Caicos Islands">Turks and Caicos Islands</option>
  <option value='td' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag td" data-title="Chad">Chad</option>
  <option value='tf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tf" data-title="French Southern Territories">French Southern Territories</option>
  <option value='tg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tg" data-title="Togo">Togo</option>
  <option value='th' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag th" data-title="Thailand">Thailand</option>
  <option value='tj' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tj" data-title="Tajikistan">Tajikistan</option>
  <option value='tk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tk" data-title="Tokelau">Tokelau</option>
  <option value='tl' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tl" data-title="Timor-Leste">Timor-Leste</option>
  <option value='tm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tm" data-title="Turkmenistan">Turkmenistan</option>
  <option value='tn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tn" data-title="Tunisia">Tunisia</option>
  <option value='to' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag to" data-title="Tonga">Tonga</option>
  <option value='tp' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tp" data-title="East Timor">East Timor</option>
  <option value='tr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tr" data-title="Turkey">Turkey</option>
  <option value='tt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tt" data-title="Trinidad and Tobago">Trinidad and Tobago</option>
  <option value='tv' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tv" data-title="Tuvalu">Tuvalu</option>
  <option value='tw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tw" data-title="Taiwan">Taiwan</option>
  <option value='tz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tz" data-title="Tanzania">Tanzania</option>
  <option value='ua' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ua" data-title="Ukraine">Ukraine</option>
  <option value='ug' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ug" data-title="Uganda">Uganda</option>
    <option value='uk' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gb" data-title="Great Britain (UK)">United Kingdom</option>
  <option value='um' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag um" data-title="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
  <option value='us' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag us" data-title="United States">United States</option>
  <option value='uy' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uy" data-title="Uruguay">Uruguay</option>
  <option value='uz' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uz" data-title="Uzbekistan">Uzbekistan</option>
  <option value='va' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag va" data-title="Vatican City State (Holy See)">Vatican City State (Holy See)</option>
  <option value='vc' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vc" data-title="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
  <option value='ve' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ve" data-title="Venezuela">Venezuela</option>
  <option value='vg' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vg" data-title="Virgin Islands (British)">Virgin Islands (British)</option>
  <option value='vi' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vi" data-title="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
  <option value='vn' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vn" data-title="Viet Nam">Viet Nam</option>
  <option value='vu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vu" data-title="Vanuatu">Vanuatu</option>
  <option value='wf' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag wf" data-title="Wallis and Futuna">Wallis and Futuna</option>
  <option value='ws' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ws" data-title="Samoa">Samoa</option>
  <option value='ye' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ye" data-title="Yemen">Yemen</option>
  <option value='yt' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yt" data-title="Mayotte">Mayotte</option>
  <option value='yu' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yu" data-title="Yugoslavia (former)">Yugoslavia (former)</option>
  <option value='za' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag za" data-title="South Africa">South Africa</option>
  <option value='zm' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zm" data-title="Zambia">Zambia</option>
  <option value='zr' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zr" data-title="Zaire (former)">Zaire (former)</option>
  <option value='zw' data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zw" data-title="Zimbabwe">Zimbabwe</option>
</select>
</div>



</div>
<div class="col-md-12">
<div class="c-checkbox">
<input type="checkbox" class="c-check" name="acp_info" id="acp_info" autocomplete="off">
<label for="acp_info" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leido y acepto <a href="javascript:tratamiento_datos();" class="check_a">La Cláusula Informativa y Autorización al Tratamiento de los Datos</a></label>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i>
 <span><%=titulo_td%></span></h4>
</div>
<div class="modal-body"><p><span><%=texto_td%></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
</div>
<div class="c-checkbox">
<input name="n_letter" type="checkbox" class="c-check" id="n_letter" autocomplete="off" value="si">
<label for="n_letter" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-envelope-o" aria-hidden="true" style="color:#999"></i>Sí, quiero formar parte de la base de datos para el envío de Newsletters de Cursit </label>
</div>
</div>
<ul class="list-inline pull-right">
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right" onCLick="javascript:usuario_new_reg();"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i> Dar alta de usuario <i class="fa fa-user-plus" aria-hidden="true" style="margin-left:8px"></i></button></li></ul>
</div>
</form>
</div>
<!--FIN NUEVO USUARIO-->
<div id="spinner_back_usu" style="display:none" ><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Comprobando datos...</div></div>
<div id="usuario_new_ok" style="min-height:350px;height:350px;">
<div class="user_in_ok"><i class="fa fa-user" aria-hidden="true"></i><i class="fa fa-check" aria-hidden="true"></i><span>Usuario registrado con éxito!!</span><span>Accede a tu área de usuario </span><a href="<%=r%>zona-privada">desde aquí<i class="fa fa-arrow-right" aria-hidden="true" style="font-size:1.2em;color:#ddd;margin-top:15px;margin-left:10px"></i></a></div>
</div>
</div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<!--#include file="comun/menu_inf.asp"-->
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/dd.css" />
<script src="<%=r%>web/lib/js/jquery.dd.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/flags.css" />
<script>$(document).ready(function(e) {
$("body select").msDropDown();

<%if op<>"registro" then%>$('#usuario_new').hide();<%else%>$('#usuario_reg').hide();<%end if%>
$('#usuario_new_ok').hide();
$('#usuario_new_ko').hide();
})
function sh_usuario_new(){
$("#usuario_new").slideToggle( "slow" );
$("#usuario_reg").slideToggle( "slow" );};
function sh_usuario_reg(){
$("#usuario_reg").slideToggle( "slow" );
$("#usuario_new").slideToggle( "slow" );};
//$("#reg_nuevo").slideToggle( "slow" );
function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
function u_nombre() {Ctrl = f_reserva.u_nombre;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del usuario.');$('#alerta_tit').html('Nombre del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_apellidos() {Ctrl = f_reserva.u_apellidos;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce los apellidos del usuario.');$('#alerta_tit').html('Apellidos del usuario no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_email() {Ctrl = f_reserva.u_email;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el mail del usuario.');$('#alerta_tit').html('eMail del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_pass() {Ctrl = f_reserva.u_pass;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la contraseña del usuario.');$('#alerta_tit').html('Contraseña del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_telefono() {Ctrl = f_reserva.u_telefono;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el teléfono del usuario.');$('#alerta_tit').html('Teléfono del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_movil() {Ctrl = f_reserva.u_movil;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil del usuario.');$('#alerta_tit').html('Móvil del usuario no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_direccion() {Ctrl = f_reserva.u_direccion;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la dirección del usuario.');$('#alerta_tit').html('Dirección del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_ciudad() {Ctrl = f_reserva.u_ciudad;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la ciudad del usuario.');$('#alerta_tit').html('Ciudad del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_provincia() {Ctrl = f_reserva.u_provincia;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona la provincia del usuario.');$('#alerta_tit').html('Provincia del usuario no seleccionada.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function u_nif() {Ctrl = f_reserva.u_direccion;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la dirección del usuario.');$('#alerta_tit').html('Dirección del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}

function u_nif_ok(form) {
<%Sql= "SELECT nifClave FROM datComunes where nifClave<>''" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nifClave=ob_rs("nifClave")
end if
ob_rs.close%>
var numero, let, letra;
var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;
dni = document.f_reserva.u_nif.value.toUpperCase();
if(dni=="<%=nifClave%>" && dni!=''){
return true;
}else{
if(expresion_regular_dni.test(dni) === true){
numero = dni.substr(0,dni.length-1);
numero = numero.replace('X', 0);
numero = numero.replace('Y', 1);
numero = numero.replace('Z', 2);
let = dni.substr(dni.length-1, 1);
numero = numero % 23;
letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
letra = letra.substring(numero, numero+1);
if (letra != let) {
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del usuario no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del usuario incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.u_nif).css('border', '2px solid #FF0000');$(document.f_reserva.u_nif).click(function() {$(document.f_reserva.u_nif).css('border', '1px solid #D0D7DE');})
return false;}else{return true;}}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del usuario no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del usuario incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.u_nif).css('border', '2px solid #FF0000');$(document.f_reserva.u_nif).click(function() {$(document.f_reserva.u_nif).css('border', '1px solid #D0D7DE');})
return false;
}}}

function u_email_ok(form){
var resultado
var str=document.f_reserva.u_email.value;
var Ctrl=document.f_reserva.u_email;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del usuario no es correcto.');$('#alerta_tit').html('eMail del usuario incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}
return (resultado)
}
function u_compara(form)	     {
var Ctrl=document.f_reserva.u_email_r;
if(document.f_reserva.u_email.value == document.f_reserva.u_email_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del usuario repetido no es correcto.');$('#alerta_tit').html('eMail del usuario repetido incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})}
function u_compara_pass(form){
var Ctrl=document.f_reserva.u_pass_r;
if(document.f_reserva.u_pass.value == document.f_reserva.u_pass_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> La Contraseña del usuario repetida no coincide.');$('#alerta_tit').html('Contraseña del usuario incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})}
function acp_info(){
if (document.getElementById("acp_info").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function usuario_new_reg(){
if (!u_nombre()) return;
if (!u_apellidos()) return;
if (!u_email()) return;
if (!u_email_ok()) return;
if (!u_compara()) return;
if (!u_pass()) return;
if (!u_compara_pass()) return;
if (!u_nif_ok()) return;
if (!u_telefono()) return;
if (!u_movil()) return;
if (!u_direccion()) return;
if (!u_ciudad()) return;
if (!u_provincia()) return;
if (!acp_info()) return;
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_new_reg.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#usuario_new').fadeOut(50);
$('#usuario_new_ok').fadeIn(400);
$('#usuario_new_ok').html(data);
$('#spinner_back_usu').fadeOut(800, function(){});
}
});
return false;
}
<%if session("id_usuario")="" then%>
function log_usuario_p() {Ctrl = login_p.log_usuario;if (Ctrl.value == "" ) {$('#alerta_log_txt').html('Por favor, introduce tu mail o nombre de usuario.');$('#alerta_log_tit').html('Usuario no introducido.');$('#alerta_log').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);
} else	return (true);}
function log_pass_p() {Ctrl = login_p.log_pass;	if (Ctrl.value == "" ) {$('#alerta_log_txt').html('Por favor, introduce tu contraseña.');$('#alerta_log_tit').html('Contraseña no introducida.');$('#alerta_log').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function log_acceder_p(){if (!log_usuario_p()) return;if (!log_pass_p()) return;$('#spinner_back').show();$('#spinner_back_usu').show();setTimeout(function(){ document.login_p.submit(); }, 300);return;}
<%end if%>
function reg_ko(){$('#spinner_back_usu').fadeOut(500, function(){$('#usuario_new_ko').fadeIn(500);});}
function reg_ok(){$('#spinner_back_usu').fadeOut(500, function(){$('#usuario_new_ok').fadeIn(500);$('#usuario_new_ko').fadeOut(500);});
$('#usuario_new').fadeOut(500, function(){$("#reg_nuevo").fadeIn( "slow" )});}
function reg_dentro3(usu){};
</script>