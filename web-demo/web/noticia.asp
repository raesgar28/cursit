<!--#include file="comun/menu_sup.asp"-->
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza2" style="background-image: url(<%=ruta_banner%>)">
<div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07"> <%=alt_banner%></h4></div>
<ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">
<li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li>
<li class="c-font-white">/</li>
<li class="c-state_active c-font-white"><%=titulo_esp%></li></ul></div></div>
<div class="c-content-box c-size-md"><div class="container" ><div class="row"><div class="col-md-12 box-amplia"><div class="c-content-blog-post-1-view"><div class="c-content-blog-post-1"><div class="c-title c-font-bold c-font-uppercase"><%=titulo_esp%></div>
<div class="c-panel c-margin-b-30"><div class="c-author"><span><a href="http://www.cursit.com/web-demo">Cursit Idiomas </a>el <%=day(fecha_in)%>&nbsp;<%=left(MonthName(month(fecha_in)),3)%>&nbsp;<%=year(fecha_in)%></span></div></div><div class="c-desc"><%=replace(texto_esp,"&#34;","'")%></div></div></div></div></div></div></div>
<%Sql= "SELECT rel.id_archivo, rel.id_general, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_noticia="&id_noticia&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_2' order by archivos.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num=ob_rs.recordcount
if num>=2then%>
<div class="c-content-box c-size-md c-bg-white"  style="margin-bottom:65px"><div class="container"><div class="row"><div class="col-md-8"><div class="c-content-media-2-slider" data-slider="owl">
<div class="c-content-label c-font-uppercase c-font-bold"><%=titulo_esp%></div><div class="owl-carousel owl-theme c-theme owl-single" data-single-item="true" data-auto-play="4000" data-rtl="false">
<%do while not ob_rs.eof%> <div class="c-content-media-2 c-bg-img-center" style="background-image:url('<%=r%><%=ob_rs("nombre")%>'); min-height: 380px;"></div>
<%ob_rs.movenext
loop%></div></div></div>
<div class="col-md-4"><div class="c-content-media-1" style="height:380px;"><div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">Noticias</div><p><%=resumen_esp%></p>
<div class="c-author cursos-idiomas-extranjero"><div class="cursos-idiomas-autor" style="background-image:url(<%=r%>web/lib/img/logos/logo-cursos-idiomas-get-up.png)"></div><div class="c-name c-font-uppercase">Cursit Idiomas</div></div></div></div>
</div></div></div>
<%else%>
<div class="c-content-box c-size-md c-bg-white"  style="margin-bottom:65px"><div class="container"><div class="row"><div class="col-md-8"><div class="c-content-media-2-slider"><div class="c-content-label c-font-uppercase c-font-bold"><%=titulo_esp%></div><div class="c-content-media-2 c-bg-img-center" style="background-image:url('<%=r%><%=ob_rs("nombre")%>'); min-height: 380px;"></div></div></div>
<div class="col-md-4"><div class="c-content-media-1" style="height: 380px;"><div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">Noticias</div><p><%=resumen_esp%></p><div class="c-author cursos-idiomas-extranjero"><div class="cursos-idiomas-autor" style="background-image:url('<%=r%>web/lib/img/logos/logo-cursos-idiomas-get-up.png')"></div><div class="c-name c-font-uppercase">Cursit Idiomas</div></div></div></div></div></div></div>
<%end if
end if
ob_rs.close%>
<!--#include file="comun/menu_inf.asp"-->