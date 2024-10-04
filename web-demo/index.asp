<!--#include file="web/comun/menu_sup.asp"--><%Sql= "SELECT archivos.tipo, nombre, alt, generales.titulo_esp, texto_esp, texto_esp2, generales.destacado, url_esp  FROM generales, rel, archivos WHERE rel.id_general=generales.id_general AND generales.tipo='bh' AND visible='si' AND rel.id_archivo=archivos.id_archivo AND archivos.tipo<>'vid_enl' ORDER BY generales.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%><section class="c-layout-revo-slider c-layout-revo-slider-2" dir="ltr" ><div class="tp-banner-container tp-fullscreen tp-fullscreen-mobile"><div class="tp-banner rev_slider" data-version="5.0"><ul>
<%do while not ob_rs.eof%>
<li data-transition="fade" data-slotamount="1" data-masterspeed="1000">
<%if ob_rs("tipo")="fil"then%>
<img src="<%=r%>web/lib/img/tras-video.jpg" alt="">
<div class="rs-background-video-layer fulllscreenvideo tp-videolayer" data-forcerewind="on" data-volume="mute" data-videowidth="100%" data-videoheight="100%" data-videomp4="<%=ob_rs("nombre")%>" data-videopreload="preload" data-videoloop="loop" data-forceCover="1" data-aspectratio="16:9" data-autoplay="true" data-autoplayonlyfirsttime="false" data-nextslideatend="true"></div>
<%else%>
<img alt="" src="<%=ob_rs("nombre")%>" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
<%end if%>
<div class="tp-caption customin customout tp-resizeme" data-x="center" data-y="center" data-hoffset="0" data-voffset="-70" data-speed="500" data-start="1000" data-transform_in="x:0;y:0;z:0;rotationX:0.5;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;s:500;e:Back.easeInOut;"
data-transform_out="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;s:600;e:Back.easeInOut;" data-splitin="none" data-splitout="none" data-elementdelay="0.1" data-endelementdelay="0.1"
data-endspeed="600"><h2 class="c-main-title c-font-60 c-font-bold c-font-uppercase c-font-white c-center"><%=ob_rs("titulo_esp")%></h2></div>
<%if ob_rs("texto_esp")<>""then%>
<div class="tp-caption customin customout" data-x="center" data-y="center" data-hoffset="0" data-voffset="10" data-speed="500" data-start="1500" data-transform_in="x:0;y:0;z:0;rotationX:0.5;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;s:500;e:Back.easeInOut;"
data-transform_out="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;s:600;e:Back.easeInOut;" data-splitin="none" data-splitout="none" data-elementdelay="0.1" data-endelementdelay="0.1" data-endspeed="600"><p class="c-font-20 c-line-height-28 c-font-white c-opacity-07 c-font-thin c-center c-sub-title"> <%=ob_rs("texto_esp")%></p>
</div>
<%end if
if ob_rs("texto_esp2")<>""then%><div class="tp-caption randomrotateout" data-x="center" data-y="center" data-hoffset="0" data-voffset="100" data-speed="500" data-start="2000" data-transform_in="x:0;y:0;z:0;rotationX:0.5;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;s:500;e:Back.easeInOut;" data-transform_out="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;s:500;e:Back.easeInOut;"><a href="<%=ob_rs("url_esp")%>" <%if ob_rs("destacado")="si" then%>target="_blank"<%end if%> class="c-action-btn btn btn-lg c-btn-square c-btn-border-2x c-btn-white c-btn-bold c-btn-uppercase"><%=ob_rs("texto_esp2")%></a></div><%end if%></li>
<%ob_rs.movenext
loop%></ul></div></div></section>
<%end if
ob_rs.close%>
<%Function RemoveHTML(strText)
Dim RegEx
Set RegEx = New RegExp
RegEx.Pattern = "<[^>]*>"
RegEx.Global = True
RemoveHTML = RegEx.Replace(strText, "")
End Function%>
<div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="c-content-feature-2-grid"><div class="c-content-title-1"><h2 class="c-font-uppercase c-center c-font-bold h2_index">Cursos de idiomas en el extranjero</h2><div class="c-line-center"></div><p class="c-center c-font-uppercase c-font-17">Una plataforma íntegramente pensada para satisfacer las necesidades específicas de agencias de cursos de idiomas en el extranjero. Con infinitas funcionalidades, capz de ser escalable y programado cuantas veces sea necesario para cumplir con las espectativas de nuestrs clientes.</p></div><div class="row"><div class="col-md-4 col-sm-6"><div class="c-content-feature-2 c-option-2 c-theme-bg-parent-hover"><div class="c-icon-wrapper c-theme-bg-on-parent-hover"><div class="icono-home2"><i class="fa fa-user-o" aria-hidden="true"></i></div></div><h3 class="c-font-uppercase c-title">Atención personalizada</h3><p>Orientación según las necesidades e intereses de cada alumno</p></div></div><div class="col-md-4 col-sm-6"><div class="c-content-feature-2 c-option-2 c-theme-bg-parent-hover"><div class="c-icon-wrapper c-theme-bg-on-parent-hover"><div class="icono-home"><i class="fa fa-phone" aria-hidden="true"></i></div></div><h3 class="c-font-uppercase c-title">Teléfono 24 h / 7 días</h3><p>Atendido por personal de CURSIT los 365 días del año</p></div></div><div class="col-md-4 col-sm-6"><div class="c-content-feature-2 c-option-2 c-theme-bg-parent-hover"><div class="c-icon-wrapper c-theme-bg-on-parent-hover"><div class="icono-home2"><i class="fa fa-certificate" aria-hidden="true"></i></div></div><h3 class="c-font-uppercase c-title">Normativa Aseproce</h3><p>Miembros de la Asociación Española de Promotores de Cursos en el Extranjero</p></div></div><div class="col-md-4 col-sm-6"><div class="c-content-feature-2 c-option-2 c-theme-bg-parent-hover"><div class="c-icon-wrapper c-theme-bg-on-parent-hover"><div class="icono-home3"><i class="fa fa-search" aria-hidden="true"></i></div></div><h3 class="c-font-uppercase c-title">seguimiento continuo</h3><p>Apoyo de un asesor antes, durante y después de la realización del programa</p></div></div><div class="col-md-4 col-sm-6"><div class="c-content-feature-2 c-option-2 c-theme-bg-parent-hover"><div class="c-icon-wrapper c-theme-bg-on-parent-hover"><div class="icono-home3"><i class="fa fa-arrows-alt" aria-hidden="true"></i></div></div><h3 class="c-font-uppercase c-title">variedad de cursos</h3><p>Amplia oferta de escuelas, programas y destinos</p></div></div><div class="col-md-4 col-sm-6"><div class="c-content-feature-2 c-option-2 c-theme-bg-parent-hover"><div class="c-icon-wrapper c-theme-bg-on-parent-hover"><div class="icono-home3"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div></div><h3 class="c-font-uppercase c-title">tutor en destino</h3><p>Los alumnos cuentan con la supervisión de un coordinador en destino</p></div></div></div></div></div></div>
<%Sql= "SELECT id_item, destacado, titulo_esp,resumen_esp, url_esp, texto_esp, inc_cat, inc_sec, inc_sub, oferta FROM items WHERE destacado='si' AND visible='si' AND (eliminado<>'si' or eliminado IS NULL ) ORDER BY orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="c-content-box c-size-md back_news"><div class="container"><div class="c-content-blog-post-card-1-slider" data-slider="owl">
<div class="c-content-title-1">
  <h2 class="c-center c-font-uppercase c-font-bold h2_index">Cursos de idiomas destacados</h2><div class="c-line-center c-theme-bg"></div><p class="c-center c-font-uppercase c-font-17">Disponemos de una amplia oferta en nuestro catálogo de cursos de idiomas en el extranjero. Sea cual sea tu nivel o edad, te proponemos soluciones a medida para ofrecerte el curso de idiomas que necesitas.</p></div>
<div class="owl-carousel owl-theme c-theme c-owl-nav-center" data-items="3" data-slide-speed="8000" data-rtl="false">
<%do while not ob_rs.eof
id_item=ob_rs("id_item")
Sql3= "SELECT id_categoria, id_seccion, id_destino FROM rel, items WHERE rel.id_item="&id_item&" AND rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and  (privado IS NULL or privado='') and id_categoria<>0 and id_seccion<>0 ORDER BY items.orden "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
id_categoria=ob_rs3("id_categoria")
id_seccion=ob_rs3("id_seccion")
id_destino=ob_rs3("id_destino")
if id_categoria<>"" then
Sql2= "SELECT url_esp, titulo_esp FROM categorias WHERE id_categoria="&id_categoria&" " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
url_cat_p=ob_rs2("url_esp")
titulo_esp_cat=ob_rs2("titulo_esp")
end if
ob_rs2.close
end if
if id_seccion<>"" then
Sql2= "SELECT url_esp, titulo_esp FROM secciones WHERE id_seccion="&id_seccion&" " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
url_sec_p="/"&ob_rs2("url_esp")
titulo_esp_sec=" | "&ob_rs2("titulo_esp")
titulo_esp_sec_tag=ob_rs2("titulo_esp")
end if
ob_rs2.close
end if
if id_destino<>"" then
Sql2= "SELECT url_esp, titulo_esp FROM destinos WHERE id_destino="&id_destino&" " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
titulo_esp_dest_tag=ob_rs2("titulo_esp")
end if
ob_rs2.close
end if
end if
ob_rs3.close%>
<div class="item"><div class="c-content-blog-post-card-1 c-option-2"><div class="c-media c-content-overlay back_new" style="max-height:220px"><div class="c-overlay-wrapper"><div class="c-overlay-content">
<a href="<%=r%><%if ob_rs("inc_cat")="si"then%><%=url_cat_p%><%if ob_rs("inc_sec")="si"then%><%=url_sec_p%>/<%end if%><%end if%><%=ob_rs("url_esp")%>"><i class="icon-link"></i></a>
</div></div>
<%if id_item<>"" then
Sql2= "SELECT nombre,alt FROM rel, archivos WHERE rel.id_item="&id_item&" and rel.id_archivo= archivos.id_archivo and campo='archivo_1' and tipo='img'" 
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
img_nom=ob_rs2("nombre")
alt_nom=ob_rs2("alt")
else
img_nom=r&"web/lib/img/logos/no-foto.gif"
end if
ob_rs2.close%>
<img class="c-overlay-object img-responsive" src="<%=r%><%=img_nom%>" alt="<%=alt_nom%>"> 
<%img_nom=""
alt_nom=""
end if%>
</div>
<div class="c-body">
<div class="c-title c-font-uppercase c-font-bold">
<a href="<%=r%><%if ob_rs("inc_cat")="si"then%><%=url_cat_p%><%if ob_rs("inc_sec")="si"then%><%=url_sec_p%>/<%end if%><%end if%><%=ob_rs("url_esp")%>"><%=ob_rs("titulo_esp")%></a>
</div>
<div class="c-author"><%=ob_rs("resumen_esp")%></div>
<!--#include file="web/comun/fluctuaciones.asp"-->
<!--#include file="web/comun/moneda.asp"-->
<%Sql2= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&id_item&" and id_itemSub <>0 " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana,itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana and itemsSubSemanas.semanas<>53 order by itemsSubSemanas.precio" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio=ob_rs3("precio")
id_itemSub_dd=ob_rs3("id_itemSub")
semanas_dd=ob_rs3("semanas")%>
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_item, id_itemSub FROM rel WHERE id_item="&id_item&" and id_itemSub <>0 " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana and itemsSubSemanas.precio < "&precio&" and itemsSubSemanas.semanas<>53" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio=ob_rs3("precio")
id_itemSub_dd=ob_rs3("id_itemSub")
semanas_dd=ob_rs3("semanas")
end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close%>
<div class="c-panel"><ul class="c-tags c-theme-ul-bg"><%if ob_rs("oferta")="si"then%><li>Oferta</li><%end if%><%if precio<>"" then%><li>desde <%=FormatNumber(ccur(precio*fluctuacion_c),2)%>&nbsp;<%=mon%></li><%end if%><%if titulo_esp_cat<>""then%><li><%=titulo_esp_cat%></li><%end if%><%if titulo_esp_sec_tag<>""then%> <li><%=titulo_esp_sec_tag%></li><%end if%><%if titulo_esp_dest_tag<>""then%> <li><%=titulo_esp_dest_tag%></li><%end if%></ul></div>
<p><%if ob_rs("texto_esp")<>"" then%><%=left(RemoveHTML(ob_rs("texto_esp")),160)%>...<%end if%></p>
</div></div></div>
<%id_categoria=""
id_seccion=""
id_destino=""
ob_rs.movenext
loop%>
</div></div></div></div>
<%end if
ob_rs.close%>
<div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row"><div class="col-md-12"><div class="c-content-title-1 c-margin-b-60"><h2 class="c-center c-font-uppercase c-font-bold h2_index"> A 3 pasos de tu curso de idiomas en el extranjero</h2><div class="c-line-center"></div><p class="c-center c-font-uppercase c-font-17">Inscripción on line, con precio todo incluido, sin sorpresas ni gastos extra</p></div></div></div><div class="row"><div class="col-md-4 col-sm-6 wow animate fadeInLeft"><div class="c-content-step-1 c-opt-1"><div class="c-icon"><span class="c-hr c-hr-first"><span class="c-content-line-icon c-icon-29 c-theme"></span></span></div><div class="c-title c-font-20 c-font-bold c-font-uppercase">1. Elige tu curso</div><div class="c-description c-font-17">De manera clara, rápida y sencilla de entre nuestra oferta </div><button class="btn c-btn-square c-theme-btn c-btn-border1-2x c-btn-uppercase c-btn-bold hidden">cómo elegir curso</button></div></div><div class="col-md-4 col-sm-6 wow animate fadeInLeft" data-wow-delay="0.2s"><div class="c-content-step-1 c-opt-1"><div class="c-icon"><span class="c-hr"><span class="c-content-line-icon c-icon-23 c-theme"></span></span></div><div class="c-title c-font-20 c-font-bold c-font-uppercase">2. preinscríbete</div><div class="c-description c-font-17">A través de un formulario de registro para agilizar los trámites</div><button class="btn c-btn-square c-theme-btn c-btn-uppercase c-btn-bold hidden">cómo preinscribirse</button></div></div><div class="col-md-4 col-sm-12 wow animate fadeInLeft" data-wow-delay="0.4s"><div class="c-content-step-1 c-opt-1"><div class="c-icon"><span class="c-hr c-hr-last"><span class="c-content-line-icon c-icon-46 c-theme"></span></span></div><div class="c-title c-font-20 c-font-bold c-font-uppercase">3. prepara tu viaje</div><div class="c-description c-font-17"> Con nuestros consejos e indicaciones lo tendrás muy fácil </div><button class="btn c-btn-square c-theme-btn c-btn-uppercase c-btn-bold hidden">cómo preparar mi viaje</button></div></div></div></div></div>
<%Sql= "SELECT titulo_esp, url_esp, texto_esp, id_noticia, fecha_in FROM noticias WHERE destacado='si' ORDER BY fecha_in desc" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="c-content-box c-size-md c-bg-parallax" style="background-image: url(<%=r%>web/lib/img/cursos-idiomas-extranjero-fondo.jpg)"><div class="container">
<div class="c-content-title-1"><h3 class="c-center c-font-uppercase c-font-bold c-font-white">Últimas Noticias</h3><div class="c-line-center c-theme-bg"></div></div><div class="c-content-isotope-grid c-opt-2">
<%do while not ob_rs.eof
id_noticia=ob_rs("id_noticia")
Sql2= "SELECT nombre FROM rel, archivos WHERE id_noticia="&id_noticia&" and rel.id_archivo= archivos.id_archivo and campo='archivo_1' and tipo='img'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
img_nom=ob_rs2("nombre")
else
img_nom=r&"web/lib/img/no-imagen.gif"
end if
ob_rs2.close%>
<div class="c-content-isotope-item <!--c-item-size-double--> home-news"><div class="c-content-isotope-image-container">
<img class="c-content-isotope-image" src="<%=r%><%=img_nom%>" />
<div class="c-content-isotope-overlay"><div class="c-content-isotope-overlay-content">
<h3 class="c-content-isotope-overlay-title c-font-white c-font-uppercase"><%=ob_rs("titulo_esp")%></h3>
<p class="c-content-isotope-overlay-desc c-font-white"><%=RemoveHTML(ob_rs("texto_esp"))%></p>
<a href="<%=r%><%=ob_rs("url_esp")%>" class="cbp-l-caption-buttonLeft btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase"><i class="fa fa-link" aria-hidden="true"></i></a>
<a href="<%=r%>web/index-imagenes.asp?id_noticia=<%=id_noticia%>" class="cbp-singlePage cbp-l-caption-buttonLeft btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase"><i class="fa fa-share-square-o" aria-hidden="true"></i></a>
</div></div></div></div>
<%ob_rs.movenext
img_nom=""
loop%>
</div></div><div class="c-content-latest-works"></div></div>
<%end if
ob_rs.close%>

<%Sql1= "SELECT tipo FROM generales where tipo='hm'" 
Set Ob_RS1 = Server.CreateObject("ADODB.Recordset")
Ob_RS1.Open Sql1, ob_conn,adOpenStatic, adCmdText
if not ob_rs1.eof then
if texto_esp<>"" then%>
<div class="c-content-box c-size-md c-bg-white">
<div class="container">
<div class="row">
<div class="col-md-4">
<div class="c-content-media-1 c-bordered wow animated fadeInLeft texto_med_home"><span class="c-title c-font-uppercase c-theme-on-hover c-font-bold h2_index"><h2><%=titulo_esp%></h2></span>
<p><%=texto_esp%></p>
<%Sql= "SELECT rel.id_archivo, rel.id_general, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_general="&id_general&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_1' order by archivos.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="c-author"><div class="c-portrait" style="background-image: url('<%=r%><%=ob_rs("nombre")%>')"></div><div class="c-name c-font-uppercase"><%=ob_rs("alt")%></div></div>
<%end if
ob_rs.close%>
</div></div>
<%Sql= "SELECT rel.id_archivo, rel.id_general, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_general="&id_general&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_1' order by archivos.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_img_o=ob_rs.recordcount%>
<div class="col-md-8">
<%if num_img_o >1 then%>
<div class="c-content-media-2-slider wow animated fadeInRight" data-slider="owl"><div class="c-content-label c-font-uppercase c-font-bold">Cursit Idiomas</div><div class="owl-carousel owl-theme c-theme owl-single" data-single-item="true" data-navigation-dots="true" data-auto-play="4000" data-rtl="false">
<%do while not ob_rs.eof%>
<div class="c-content-media-2 c-bg-img-center" style="background-image: url('<%=r%><%=ob_rs("nombre")%>'); min-height: 380px;"></div>
<%ob_rs.movenext
loop%></div></div><%else%>
<div class="c-content-media-2-slider fadeInRight"><div class="owl-theme c-theme" ><div class="c-content-media-2 c-bg-img-center" style="background-image: url('<%=r%><%=ob_rs("nombre")%>');min-height: 380px;"></div></div></div>
<%end if%></div>
<%end if
ob_rs.close%>
<div class="col-md-8"><img src="<%=r%>web/lib/img/imagen-index.jpg" style="width:100%;max-width:750px"></div>
</div></div></div>
<%end if
end if
ob_rs1.close%>
<div class="c-content-box c-size-lg c-bg-parallax" style="background-image: url(<%=r%>web/lib/img/cursos-idiomas-extranjero-fondo2.jpg)">
<div class="container"><div class="c-content-blog-post-card-1-slider" data-slider="owl"><div class="c-content-title-1"><h3 class="c-center c-font-uppercase c-font-white c-font-bold">Nuestros alumnos te lo cuentan</h3><div class="c-line-center c-theme-bg"></div><p class="c-center c-font-white">Nadie mejor que alguien con experiencia en cursos de idiomas</p>
</div><div class="owl-carousel owl-theme c-theme c-owl-nav-center" data-items="3" data-slide-speed="8000" data-rtl="false">
<div class="item"><div class="c-content-testimonial-3 c-option-dark-transparent">
<div class="c-content"> El colegio me encanta, no hay muchos españoles ni extranjeros, y profesores y compañeros son muy amables y siempre quieren ayudarnos, y mi host family ha sido acogedora desde el principio.</div>
<div class="c-person"><img src="<%=r%>web/lib/img/test-testimonio.png" class="img-responsive"><div class="c-person-detail c-font-uppercase"><h4 class="c-name">Test</h4><p class="c-position c-font-bold c-theme-font">Año Escolar en Iranda</p></div></div></div></div>
<div class="item"><div class="c-content-testimonial-3 c-option-dark-transparent">
<div class="c-content"> Pues me esta yendo genial todo y aunque algunas veces es duro merece la pena!! Mi familia de acogida es la mejor familia que uno puede encontrar y mi high school me gusta muchísimo.</div>
<div class="c-person"><img src="<%=r%>web/lib/img/test-testimonio.png" class="img-responsive"><div class="c-person-detail c-font-uppercase"><h4 class="c-name">Test</h4><p class="c-position c-font-bold c-theme-font">Año Escolar Estados Unidos</p></div></div></div></div>
<div class="item"><div class="c-content-testimonial-3 c-option-dark-transparent">
<div class="c-content"> En la escuela, los profesores son muy agradables. Siempre pendientes de todos nosotros. Mi familia me hace sentir muy cómoda, cuidando siempre los detalles. Como en casa</div><div class="c-person"><img src="<%=r%>web/lib/img/test-testimonio.png" class="img-responsive"><div class="c-person-detail c-font-uppercase"><h4 class="c-name">Test</h4><p class="c-position c-font-bold c-theme-font">Curso en Oxford</p></div></div></div></div>
<div class="item"><div class="c-content-testimonial-3 c-option-dark-transparent">
<div class="c-content"> Mi familia es increíble. Estoy súper agradecida por todo lo que me han aportado en mi experiencia. Han organizado montones de excursiones y cuidado de mí al máximo. </div>
<div class="c-person"><img src="<%=r%>web/lib/img/test-testimonio.png" class="img-responsive"><div class="c-person-detail c-font-uppercase"><h4 class="c-name">Test</h4><p class="c-position c-font-bold c-theme-font">Año Escolar Estados Unidos</p></div></div></div></div>
<div class="item"><div class="c-content-testimonial-3 c-option-dark-transparent">
<div class="c-content"> En Canadá puedes elegir lo que quieres estudiar, y eso es algo que a mí me ha gustado mucho. Las clases son muy prácticas y con más tiempo libre. <br><br></div>
<div class="c-person"><img src="<%=r%>web/lib/img/test-testimonio.png" class="img-responsive"><div class="c-person-detail c-font-uppercase"><h4 class="c-name">Test 1</h4><p class="c-position c-font-bold c-theme-font">Año Escolar Canadá</p></div></div></div></div>
<div class="item"><div class="c-content-testimonial-3 c-option-dark-transparent">
<div class="c-content"> Al principio me costó relacionarme con las chicas de mi clase porque tenia vergüenza pero como ví que todas me ayudaban la fui perdiendo. Considero que tengo un buen grupo de amigas Irlandesas.</div>
<div class="c-person"><img src="<%=r%>web/lib/img/test-testimonio.png" class="img-responsive"><div class="c-person-detail c-font-uppercase"><h4 class="c-name">Test</h4><p class="c-position c-font-bold c-theme-font">Año Escolar Irlanda</p></div></div></div></div>
</div></div></div></div>
<div class="c-content-box c-size-sm c-bg-green"><div class="container"><div class="c-content-subscribe-form-1"><div class="row"><div class="col-sm-6"><h3 class="c-title c-font-30 c-font-uppercase c-font-bold">Suscríbete a nuestra newsletter</h3><div class="c-body c-font-16 c-font-uppercase c-font-sbold c-font-white">Para estar informado de todas nuestras novedades, ofertas y promociones que siempre estamos preparando para ti.</div></div><div class="col-sm-6"><form action="//wishingwell.us17.list-manage.com/subscribe?u=adf71d94b9a8ae5dbe036947f&id=9c948985ad" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate><div class="input-group input-group-lg"><input class="form-control input-lg" placeholder="Email" id="mce-EMAIL" type="email" value="" name="EMAIL"><span class="input-group-btn"><button type="submit" class="btn btn-primary c-btn-uppercase btn-lg c-btn-bold c-btn-square" id="mc-embedded-subscribe">Suscribir</button></span></div></form></div></div></div></div></div>
<div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="c-content-client-logos-slider-1" data-slider="owl"><div class="c-content-title-1"><h3 class="c-center c-font-uppercase c-font-bold">Acreditaciones</h3><div class="c-line-center c-theme-bg"></div></div><div class="owl-carousel owl-theme c-theme c-owl-nav-center" data-items="5" data-desktop-items="4" data-desktop-small-items="3" data-tablet-items="3" data-mobile-small-items="1" data-auto-play="false" data-rtl="false" data-slide-speed="5000" data-auto-play-hover-pause="true">
<div class="item"><img src="/up_files/images/web/acreditaciones/logo1.jpg" alt="AAIEP" /></div><div class="item"><img src="/up_files/images/web/acreditaciones/logo3.jpg" alt="AAIEP" /></div><div class="item"><img src="/up_files/images/web/acreditaciones/logo2.jpg" alt="Brutish Council" /></div><div class="item"></div><div class="item"><img src="/up_files/images/web/acreditaciones/logo4.jpg" alt="Quality English" /></div><div class="item"></div><div class="item"><img src="/up_files/images/web/acreditaciones/logo5.jpg" alt="Aseproce" />
</div></div></div></div></div>
<!--#include file="web/comun/menu_inf.asp"-->