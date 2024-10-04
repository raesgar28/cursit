</div><footer class="c-layout-footer c-layout-footer-3 c-bg-grey-2"><div class="c-prefooter"><div class="container"><div class="row"><div class="col-md-6"><div class="col-md-12 padding-0"><div class="c-content-title-1"><img src="<%=r%>web/lib/img/logos/logo-1.png" width="97" height="58" vspace="15"/><h3 class="c-font-uppercase c-font-bold c-font-white"><%=titulo_esp_web%><span class="c-theme-font"></span></h3><div class="c-line-left hide"></div><p class="c-text c-font-white"><%=texto_esp_web%></div></div><div class="col-md-6 padding-0"><div class="c-container c-first">
<%Sql= "SELECT menu, posicion, id_general, id_categoria FROM menus WHERE menu = 3 order by posicion" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%><ul class="c-links"><%do while not ob_rs.eof
if ob_rs("id_categoria")<>0 then
Sql2= "SELECT id_categoria, titulo_esp, url_esp, visible FROM categorias WHERE id_categoria = "&ob_rs("id_categoria")&" and visible='si' " 
else
Sql2= "SELECT id_general, titulo_esp, url_esp, visible, tipo FROM generales WHERE id_general = "&ob_rs("id_general")&"  and visible='si' " 
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if ob_rs("id_categoria")=0 then tipo=ob_rs2("tipo") end if%>
<li <%if tipo="tn"then%>id="test_nivel"<%end if%>><a href="<%=r%><%=ob_rs2("url_esp")%>"><%=ob_rs2("titulo_esp")%><%if tipo="tn"then%><i class="fa fa-pencil-square-o" aria-hidden="true"></i><%end if%><%if tipo="mp"then%>&nbsp;<i class="fa fa-map-o" aria-hidden="true"></i><%end if%></a></li>
<%end if
ob_rs2.close
ob_rs.movenext
loop%>
</ul>
<%end if
ob_rs.close%></div></div>
<div class="col-md-6 padding-0"><div class="c-container c-first">
<%Sql= "SELECT menu, posicion, id_general, id_categoria FROM menus WHERE menu = 4 order by posicion" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<ul class="c-links">
<%do while not ob_rs.eof
if ob_rs("id_categoria")<>0 then
Sql2= "SELECT id_categoria, titulo_esp, url_esp, visible FROM categorias WHERE id_categoria = "&ob_rs("id_categoria")&" and visible='si' " 
else
Sql2= "SELECT id_general, titulo_esp, url_esp, visible,tipo FROM generales WHERE id_general = "&ob_rs("id_general")&"  and visible='si' " 
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if ob_rs("id_categoria")=0 then tipo=ob_rs2("tipo") end if%>
<li <%if tipo="tn"then%>id="test_nivel"<%end if%>><a href="<%=r%><%=ob_rs2("url_esp")%>"><%=ob_rs2("titulo_esp")%><%if tipo="tn"then%><i class="fa fa-pencil-square-o" aria-hidden="true"></i><%end if%><%if tipo="mp"then%>&nbsp;<i class="fa fa-map-o" aria-hidden="true"></i><%end if%></a></li>
<%end if
ob_rs2.close
ob_rs.movenext
loop%>
<li class="c-divider"></li>
</ul>
<%end if
ob_rs.close%></div></div></div>
<div class="col-md-3">
<div class="c-container">
<%Sql= "SELECT titulo_esp, url_esp, texto_esp, id_noticia FROM noticias WHERE destacado='si' ORDER BY fecha_mod desc" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i_num=1%>
<div class="c-content-title-1"><h3 class="c-font-uppercase c-font-bold c-font-white">Últimas noticias</h3>
<div class="c-line-left hide"></div></div>
<div class="c-blog"><%do while not ob_rs.eof and i_num<=2
Sql2= "SELECT nombre FROM rel, archivos WHERE id_noticia="&ob_rs("id_noticia")&" and rel.id_archivo= archivos.id_archivo and campo='archivo_1' and tipo='img'" 
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
img_nom=ob_rs2("nombre")
else
img_nom=r&"web/lib/img/no-imagen-index.gif"
end if
ob_rs2.close%>
<div class="c-post"><div class="c-post-img"><img src="<%=img_nom%>" alt="<%=ob_rs("titulo_esp")%>" class="img-responsive" /></div>
<div class="c-post-content"><h4 class="c-post-title"><a href="<%=r%><%=ob_rs("url_esp")%>" title="<%=ob_rs("titulo_esp")%>"><%=ob_rs("titulo_esp")%></a></h4>
<p class="c-text"><%=ob_rs("texto_esp")%></p></div></div>
<%ob_rs.movenext
img_nom=""
i_num=i_num+1
loop%></div><%end if
ob_rs.close%>
</div></div>
<div class="col-md-3">
<div class="c-container c-last">
<ul class="c-address">
<li class="c-font-white"><i class="icon-pointer c-theme-font"></i><%=direccion%><br /><%=cod_postal%> - <%=ciudad%><br /><%=provincia%> - España</li>
<li class="c-font-white"><i class="icon-call-end c-theme-font"></i><%=telefono%></li>
<li class="c-font-white"><i class="icon-envelope c-theme-font"></i><%=email%></li>
</ul>
<ul class="c-address"><li><%=datos_complementarios%></li></ul>
<ul class="c-socials">
<%if rd_facebook<>""then%><li><a href="<%=rd_facebook%>"><i class="icon-social-facebook"></i></a></li><%end if%>
<%if rd_twitter<>""then%><li><a href="<%=rd_twitter%>"><i class="icon-social-twitter"></i></a></li><%end if%>
<%if rd_youtube<>""then%><li><a href="<%=rd_youtube%>"><i class="icon-social-youtube"></i></a></li><%end if%>
<%if rd_pinterest<>""then%><li><a href="<%=rd_pinterest%>"><i class="fa fa-pinterest"></i></a></li><%end if%>
<%if rd_blog<>""then%><li><a href="<%=rd_blog%>"><i class="fa fa-wordpress"></i></a></li><%end if%>
<%if rd_linkedin<>""then%><li><a href="<%=rd_linkedin%>"><i class="fa fa-linkedin"></i></a></li><%end if%>
<%if rd_instagram<>""then%><li><a href="<%=rd_instagram%>"><i class="fa fa-instagram"></i></a></li><%end if%>
<%if rd_tumblr<>""then%><li><a href="<%=rd_tumblr%>"><i class="fa fa-tumblr"></i></a></li><%end if%>
<%if rd_flickr<>""then%><li><a href="<%=rd_flickr%>"><i class="fa fa-flickr"></i></a></li><%end if%>
<%if rd_reddit<>""then%><li><a href="<%=rd_reddit%>"><i class="fa fa-reddit"></i></a></li><%end if%>
<%if rd_google_plus<>""then%><li><a href="<%=rd_google_plus%>"><i class="fa fa-google-plus"></i></a></li><%end if%>
</ul></div></div></div></div></div><div class="c-postfooter c-bg-dark"><div class="container"><div class="row"><div class="col-md-6 col-sm-12 c-col"><p class="c-copyright c-font-grey"><%=year(date)%> &copy; <%=titulo_esp_web%></p></div><div class="col-md-6 col-sm-12 c-col mosca"><p class="c-copyright c-font-grey"><a href="https://www.wishingwell.es/" title="Desarrollo y diseño web | Wishingwell - Agencia de marketing online"><span style="color:#ccc">desarrollo web</span> <span>Wishing</span> <span class="blanca">Well</span></a></p></div></div></div></div></footer><div class="c-layout-go2top"><i class="icon-arrow-up"></i></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Enviando datos...</div></div><%if session("id_usuario")="" then 'MODAL%>
<div class="modal fade" id="alerta_log" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" ><i class="fa fa-exclamation-triangle rojo_ff0 margin-r-7" aria-hidden="true"></i><span id="alerta_log_tit">Error en el campo</span></h4></div><div class="modal-body" id="alerta_log_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold" data-dismiss="modal">Ok, entendido</button></div></div></div></div>
<%end if%>
<div class="modal fade" id="alerta_busca" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" ><i class="fa fa-exclamation-triangle rojo_ff0 margin-r-7" aria-hidden="true"></i><span id="alerta_log_tit">Alerta</span></h4></div><div class="modal-body" id="alerta_log_txt"> Pues deberías introducir un término a buscar... (mínimo 5 caractéres) </div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold" data-dismiss="modal">Ok, entendido</button></div></div></div></div>
<script src="<%=r%>web/lib/js/todo.js" type="text/javascript"></script>
<script>$(document).ready(function(){App.init();});
var revealAnimate=function(){var a=function(){wow=new WOW({animateClass:"animated",offset:100,live:!0,mobile:!1})};return{init:function(){a()}}}();$(document).ready(function(){revealAnimate.init(),(new WOW).init(),setTimeout(function(){$(".wow").css("opacity","1")},100)});
<%if session("id_usuario")="" then%>
function log_usuario() {Ctrl = login.log_usuario;if (Ctrl.value == "" ) {$('#alerta_log_txt').html('Por favor, introduce tu mail o nombre de usuario.');$('#alerta_log_tit').html('Usuario no introducido.');$('#alerta_log').modal('show');return (false);} else	return (true);}
function log_pass() {Ctrl = login.log_pass;	if (Ctrl.value == "" ) {$('#alerta_log_txt').html('Por favor, introduce tu contraseña.');$('#alerta_log_tit').html('Contraseña no introducida.');$('#alerta_log').modal('show');return (false);} else return (true);}
function log_acceder(){if (!log_usuario()) return;if (!log_pass()) return;$('#spinner_back').show();$('#spinner').show();setTimeout(function(){ document.login.submit(); }, 300);return;}
<%end if%>
$(document).ready(function(){<%if session("id_usuario")="" then%>$("#logueado").hide();$("#no_logueado").show();<%else%>$("#logueado").show();$("#no_logueado").hide();<%end if%>
App.init();
var slider = $('.c-layout-revo-slider .tp-banner');var cont = $('.c-layout-revo-slider .tp-banner-container');var api = slider.show().revolution({sliderType: "standard",sliderLayout: "fullscreen",responsiveLevels: [2048, 1024, 778, 320],gridwidth: [1240, 1024, 778, 320],gridheight: [868, 768, 960, 720],delay: 6000,startwidth: 1170,startheight: App.getViewPort().height,navigationType: "hide",navigationArrows: "solo",touchenabled: "on",navigation:{keyboardNavigation: "off",keyboard_direction: "horizontal",mouseScrollNavigation: "off",onHoverStop: "off",arrows:{style: "circle",enable: true,hide_onmobile: false,hide_onleave: false,tmp: '',left:{h_align: "left",v_align: "center",h_offset: 30,v_offset: 0},right:{h_align: "right",v_align: "center",h_offset: 30,v_offset: 0}}},spinner: "spinner2",fullScreenOffsetContainer: '.c-layout-header',shadow: 0,disableProgressBar: "off",hideThumbsOnMobile: "on",hideNavDelayOnMobile: 1500,hideBulletsOnMobile: "on",hideArrowsOnMobile: "on",hideThumbsUnderResolution: 0});});
function buscar(form) {Ctrl = document.buscar.buscar_txt;if (Ctrl.value == "" || Ctrl.value.length <5) { $('#alerta_busca').modal('show');return (false);} else	
return (true);}	
function buscar_accion (form)  {if (!buscar(form)) return;document.buscar.submit();	return;}
C={cookieDuration:14,cookieName:"complianceCookie",cookieValue:"on",bannerTitle:"Cookies:",bannerMessage:"En cursit.com/web-demo (sitio con fines demostrativos) utilizamos cookies propias y de terceros para ofrecerte lo mejor de nuestra web. Si continúas navegando, consideramos que aceptas su uso.",bannerButton:"estoy de acuerdo",bannerLinkURL:"<%=r%>politica-cookies",bannerLinkText:"Leer más",alertAlign:"center",buttonClass:"btn-success btn-xs",createDiv:function(){var e=$('<div class="alert alert-info alert-dismissible text-'+this.alertAlign+' fade in" role="alert" style="color:#666;position: fixed;z-index:999999999999999999999; bottom: 0; width: 100%;background-color:#fafafa; margin-bottom: 0"><strong>'+this.bannerTitle+"</strong> "+this.bannerMessage+' <a href="'+this.bannerLinkURL+'">'+this.bannerLinkText+'</a>&nbsp;&nbsp;&nbsp;<button type="button" class="btn '+this.buttonClass+'" onclick="C.createCookie(C.cookieName, C.cookieValue, C.cookieDuration)" data-dismiss="alert" aria-label="Close">'+this.bannerButton+"</button></div>");$("body").append(e)},createCookie:function(e,t,o){var n="";if(o){var i=new Date;i.setTime(i.getTime()+24*o*60*60*1e3),n="; expires="+i.toGMTString()}document.cookie=e+"="+t+n+"; path=/"},checkCookie:function(e){for(var t=e+"=",o=document.cookie.split(";"),n=0;n<o.length;n++){for(var i=o[n];" "==i.charAt(0);)i=i.substring(1,i.length);if(0==i.indexOf(t))return i.substring(t.length,i.length)}return null},init:function(){this.checkCookie(this.cookieName)!=this.cookieValue&&this.createDiv()}},$(document).ready(function(){C.init()});

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','<%=r%>web/lib/js/analytics.js','ga');ga('create', 'UA-125405257-1', 'auto');ga('send', 'pageview');
$(document).ready(function(){var url = "<%=r%>menu.asp?r=<%=r%>";$.ajax({type: "GET",url: url,success: function(data){
$('#elmenu').hide().html(data).fadeIn("fast");
$( ".bubbles-wrapper" ).fadeOut( "fast");
$( ".bubbles-wrapper" ).hide();
$( ".pretexto" ).hide();
}});})
$('#elmenu').on('click', '.c-toggler', function(e) {e.preventDefault();e.stopPropagation();$(this).closest("li").hasClass("c-open")?$(this).closest("li").removeClass("c-open"):$(this).closest("li").addClass("c-open");});
$("#elmenu").on("click","#cierra-b",function(a){a.preventDefault(),$("body").removeClass("c-layout-quick-search-shown");})
</script>
</body>
</html>