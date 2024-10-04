<%rd="../../"
r=request("r")%>
<!--#include file="../../conex/conex.asp"-->
<div class="c-navbar" ><div class="container"><div class="c-navbar-wrapper clearfix"><form class="c-quick-search" action="<%=r%>busca" name="buscar" id="buscar" method="post"><input type="text" name="buscar_txt" id="buscar_txt" placeholder="Qué quieres buscar?" value="" class="form-control" autocomplete="off"><span class="c-theme-link" id="cierra-b">&times;</span><button type="button" class="btn btn-primary btn-block busca" onClick="buscar_accion();">Buscar&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true" ></i></button></form><nav class="c-mega-menu c-pull-right c-mega-menu-dark c-mega-menu-dark-mobile c-fonts-uppercase c-fonts-bold"><ul class="nav navbar-nav c-theme-nav">
<%Sql= "SELECT menu, posicion, id_general, id_categoria FROM menus WHERE menu = 2 order by posicion" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if ob_rs("id_categoria")<>0 then
Sql2= "SELECT id_categoria, titulo_esp, url_esp, visible FROM categorias WHERE id_categoria = "&ob_rs("id_categoria")&" and visible='si' " 
else
Sql2= "SELECT id_general, titulo_esp, url_esp, visible FROM generales WHERE id_general = "&ob_rs("id_general")&"  and visible='si' " 
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if ob_rs("id_categoria")<>0 then 'SOLO PARA PONER CARET O NO
Sql3= "SELECT rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.visible FROM rel, secciones where rel.id_categoria = "&ob_rs("id_categoria")&" and secciones.visible='si' and rel.id_seccion=secciones.id_seccion group by rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.visible" 
else
Sql3= "SELECT id_pag_sup FROM rel where id_pag_sup = "&ob_rs("id_general")&"" 
end if
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then caret="si" else caret=""	end if
ob_rs3.close  'FIN SOLO PARA PONER CARET O NO%>
<li><a href="<%=r%><%=ob_rs2("url_esp")%>" class="c-link dropdown-toggle"><%=ob_rs2("titulo_esp")%><%if caret="si" then%><span class="caret" style="margin-left:5px"></span><%end if%><div class="c-arrow c-toggler"></div></a>
<%if ob_rs("id_categoria")<>0 then
Sql3= "SELECT rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden,en_menu FROM rel, secciones where rel.id_categoria = "&ob_rs("id_categoria")&" and rel.id_seccion=secciones.id_seccion AND visible='si' group by rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden,en_menu ORDER BY secciones.orden" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
c=1%>

<div class="dropdown-menu c-menu-type-mega c-visible-desktop c-pull-right c-menu-type-fullwidth" style="min-width: auto;background:">
<ul class="nav nav-tabs c-theme-nav"><%do while not ob_rs3.eof%><%if ob_rs3("en_menu")="si" then%><li <%if c=1 then%>class="active"<%end if%>><a href="#<%=ob_rs3("secciones.id_seccion")%><%=ob_rs("id_categoria")%>" data-toggle="tab" ><%=ob_rs3("titulo_esp")%></a></li><%end if%>
<%ob_rs3.movenext
c=c+1
loop%></ul>



<div class="tab-content"><!--INICIO TAB CONTENT-->
<%if ob_rs("id_categoria")<>0 then
Sql4= "SELECT rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden FROM rel, secciones where rel.id_categoria = "&ob_rs("id_categoria")&" and rel.id_seccion=secciones.id_seccion  AND visible='si' group by rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden ORDER BY secciones.orden" 
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
c=1
do while not ob_rs4.eof%>
<div class="tab-pane <%if c=1then%>active<%end if%>" id="<%=ob_rs4("secciones.id_seccion")%><%=ob_rs("id_categoria")%>"><!--PRIMER TAB-->
<div class="row">
<%'NO TIENE SUBSECCIONES MENU DESCUAGERINGADO
Sql5= "SELECT rel.id_destino, destinos.titulo_esp, destinos.url_esp FROM rel, destinos WHERE  rel.id_seccion="&ob_rs4("secciones.id_seccion")&" and rel.id_subseccion=0 and rel.id_destino=destinos.id_destino and (rel.id_categoria="&ob_rs("id_categoria")&" or multi='si') GROUP BY rel.id_destino, destinos.titulo_esp, destinos.url_esp, destinos.orden ORDER BY destinos.orden" 
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then 
men=1
do while not ob_rs5.eof
Sql55= "SELECT id_destino FROM rel WHERE id_destino="&ob_rs5("id_destino")&" and id_subseccion<>0 and id_categoria="&ob_rs("id_categoria")&" " 
Set Ob_RS55 = Server.CreateObject("ADODB.Recordset")
Ob_RS55.Open Sql55, ob_conn,adOpenStatic, adCmdText
if not ob_rs55.eof then 
else
if men=5 then%><div class="col-md-12"></div><%end if%>
<div class="col-md-3">
<ul class="dropdown-menu c-menu-type-inline" style="padding-top:0px;padding-bottom:20px;margin-top:0px">
<%Sql555= "SELECT id_destino FROM rel WHERE id_seccion="&ob_rs4("secciones.id_seccion")&" and id_subseccion=0 and (rel.id_categoria="&ob_rs("id_categoria")&" or multi='si')  and id_destino="&ob_rs5("id_destino")&" and eli<>'si' and id_seccion<>0 " '////////////////////////////// NUEVO PARA MENU SI ELIMINADO
Set Ob_RS555 = Server.CreateObject("ADODB.Recordset")
Ob_RS555.Open Sql555, ob_conn,adOpenStatic, adCmdText
if not ob_rs555.eof then 
co=ob_rs555.recordcount
end if
ob_rs555.close
if co=""then co=0 end if
Sql555= "SELECT id_destino FROM rel WHERE id_seccion="&ob_rs4("secciones.id_seccion")&" and id_subseccion=0 and (rel.id_categoria="&ob_rs("id_categoria")&" or multi='si') and id_seccion<>0 and id_destino="&ob_rs5("id_destino")&" and (eli='' or eli IS NULL ) " '////////////////////////////// NUEVO PARA MENU SI ELIMINADO
Set Ob_RS555 = Server.CreateObject("ADODB.Recordset")
Ob_RS555.Open Sql555, ob_conn,adOpenStatic, adCmdText
if not ob_rs555.eof then 
co2=ob_rs555.recordcount
end if
ob_rs555.close
if co2=""then co2=0 end if%>
<%if co2>co then%><li><h4><a href="<%=r%><%=ob_rs2("url_esp")%>/<%=ob_rs4("url_esp")%>/<%=ob_rs5("url_esp")%>" class="destino_men"><%=ob_rs5("titulo_esp")%></a></h4></li><%end if%>
<%co2=""
co=""%>
<%Sql6= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, privado, disponible, visible FROM rel, items WHERE rel.id_destino="&ob_rs5("id_destino")&" and rel.id_item= items.id_item and rel.id_seccion="&ob_rs4("secciones.id_seccion")&" and (rel.id_categoria="&ob_rs("id_categoria")&" or rel.multi='si') and (eliminado IS NULL or eliminado='') and (privado IS NULL or privado='') and en_menu='si' AND visible='si' AND disponible='si' ORDER BY items.orden" 
Set Ob_RS6 = Server.CreateObject("ADODB.Recordset")
Ob_RS6.Open Sql6, ob_conn,adOpenStatic, adCmdText
if not ob_rs6.eof then 
men_sub=1
do while not ob_rs6.eof
if men_sub=6then%>
<li class="ver_mas_menu" ><a href="#\" onclick="ver_mas_<%=ob_rs5("id_destino")%>();">(ver más <span class="fa fa-plus" aria-hidden="true"></span>)</a></li>
<%end if
if ob_rs6("id_categoria")=ob_rs("id_categoria") then%>
<li <%if men_sub>=6then%>class="ver_mas_<%=ob_rs5("id_destino")%>"<%end if%>><a href="<%=r%><%if ob_rs6("inc_cat")="si"then%><%=ob_rs2("url_esp")%>/<%end if%><%if ob_rs6("inc_sec")="si"then%><%=ob_rs4("url_esp")%>/<%end if%><%if ob_rs6("inc_des")="si"then%><%=ob_rs5("url_esp")%>/<%end if%><%=ob_rs6("url_esp")%>"><%=ob_rs6("titulo_esp")%></a></li>
<%else
if ob_rs6("show_cat")="si" then%>
<li <%if men_sub>=6then%>class="ver_mas_<%=ob_rs5("id_destino")%>"<%end if%>><a href="<%=r%><%if ob_rs6("inc_cat")="si"then%><%=ob_rs2("url_esp")%>/<%end if%><%if ob_rs6("inc_sec")="si"then%><%=ob_rs4("url_esp")%>/<%end if%><%if ob_rs6("inc_des")="si"then%><%=ob_rs5("url_esp")%>/<%end if%><%=ob_rs6("url_esp")%>"><%=ob_rs6("titulo_esp")%></a></li>
<%end if
end if
ob_rs6.movenext
men_sub=men_sub+1
loop
end if
ob_rs6.close%>
</ul>
</div>	
<%if men_sub>=6then%><script>$(".ver_mas_<%=ob_rs5("id_destino")%>").hide();function ver_mas_<%=ob_rs5("id_destino")%>(){$(".ver_mas_<%=ob_rs5("id_destino")%>").slideToggle( "slow" );};</script><%end if%>
<%if men=5then men=1 end if
men=men+1
end if
ob_rs55.close%>
<%ob_rs5.movenext
loop
end if
ob_rs5.close%>
</div></div>
<%ob_rs4.movenext
c=c+1
loop
end if
ob_rs4.close
end if%></div></div>
<%end if
ob_rs3.close
end if
'MOBILE
Sql3= "SELECT rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden FROM rel, secciones where rel.id_categoria = "&ob_rs("id_categoria")&" and rel.id_categoria <>0 and rel.id_seccion=secciones.id_seccion and secciones.visible='si' group by rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden ORDER BY secciones.orden" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>    
<ul class="dropdown-menu c-menu-type-mega c-visible-mobile">
<li class="dropdown-submenu"><a href="#"><%=ob_rs3("titulo_esp")%><span class="c-arrow c-toggler"></span></a>
<div class="dropdown-menu">
<div class="row">
<div class="col-md-3">
<ul class="dropdown-menu c-menu-type-inline">
<%'NO TIENE SUBSECCIONES
Sql5= "SELECT rel.id_destino, destinos.titulo_esp, destinos.url_esp, multi FROM rel, destinos WHERE rel.id_seccion="&ob_rs3("secciones.id_seccion")&" and rel.id_subseccion=0 and rel.id_destino=destinos.id_destino and id_categoria = "&ob_rs("id_categoria")&"  GROUP BY rel.id_destino, destinos.titulo_esp, destinos.url_esp, destinos.orden, multi, id_categoria ORDER BY destinos.orden"
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then 
do while not ob_rs5.eof
Sql55= "SELECT id_destino FROM rel WHERE id_destino="&ob_rs5("id_destino")&" and id_subseccion=0 and id_categoria="&ob_rs("id_categoria")&" " 
Set Ob_RS55 = Server.CreateObject("ADODB.Recordset")
Ob_RS55.Open Sql55, ob_conn,adOpenStatic, adCmdText
if not ob_rs55.eof then 
'else%>
<li><h3><a href="<%=r%><%=ob_rs2("url_esp")%>/<%=ob_rs3("url_esp")%>/<%=ob_rs5("url_esp")%>"><%=ob_rs5("titulo_esp")%></a></h3></li>
<%Sql6= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des,show_cat, id_categoria, visible FROM rel, items WHERE rel.id_destino="&ob_rs5("id_destino")&" and rel.id_item= items.id_item and rel.id_seccion="&ob_rs3("secciones.id_seccion")&" and (eliminado IS NULL or eliminado='') and visible='si' ORDER BY items.orden" 
Set Ob_RS6 = Server.CreateObject("ADODB.Recordset")
Ob_RS6.Open Sql6, ob_conn,adOpenStatic, adCmdText
if not ob_rs6.eof then 
do while not ob_rs6.eof
if ob_rs6("id_categoria")=ob_rs("id_categoria") then%>
<li><a href="<%=r%><%if ob_rs6("inc_cat")="si"then%><%=ob_rs2("url_esp")%>/<%end if%><%if ob_rs6("inc_sec")="si"then%><%=ob_rs3("url_esp")%>/<%end if%><%if ob_rs6("inc_des")="si"then%><%=ob_rs5("url_esp")%>/<%end if%><%=ob_rs6("url_esp")%>"><%=ob_rs6("titulo_esp")%></a></li>
<%else
if ob_rs6("show_cat")="si" and ob_rs5("multi")="si" then'AQUI HAY LIO CON CATEGORIAS%>
<li><a href="<%=r%><%if ob_rs6("inc_cat")="si"then%><%=ob_rs2("url_esp")%>/<%end if%><%if ob_rs6("inc_sec")="si"then%><%=ob_rs3("url_esp")%>/<%end if%><%if ob_rs6("inc_des")="si"then%><%=ob_rs5("url_esp")%>/<%end if%><%=ob_rs6("url_esp")%>"><%=ob_rs6("titulo_esp")%></a></li>
<%end if
end if
ob_rs6.movenext
loop
end if
ob_rs6.close
end if
ob_rs55.close
ob_rs5.movenext
loop
end if
ob_rs5.close 'FIN NO TIENE SUBSECCIONES%>
</ul>
</div></div></div></li></ul><!-- FIN MOVIL-->
<%ob_rs3.movenext
loop
end if
if ob_rs("id_general")<>0 then
Sql3= "SELECT rel.id_pag_sup, rel.id_general, generales.titulo_esp, generales.url_esp, generales.orden, generales.visible FROM rel, generales where rel.id_pag_sup = "&ob_rs("id_general")&" and rel.id_general=generales.id_general and generales.visible='si' group by rel.id_pag_sup,rel.id_general, generales.titulo_esp, generales.url_esp, generales.orden, generales.visible order by generales.orden" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<ul class="dropdown-menu c-menu-type-classic c-pull-left">
<%do while not ob_rs3.eof%><li class="dropdown-submenu"><a href="<%=r%><%=ob_rs3("url_esp")%>"><%=ob_rs3("titulo_esp")%><span class="c-arrow c-toggler"></span></a></li>
<%ob_rs3.movenext
loop%>
</ul>
<%end if
ob_rs3.close
end if%>
</li>
<%end if
ob_rs2.close
ob_rs.movenext
loop
end if
ob_rs.close%>
<li><a href="#" class="c-link dropdown-toggle">elige destino<i class="fa fa-globe" aria-hidden="true" style="margin-left:6px;font-size:1.2em"></i><span class="c-arrow c-toggler"></span></a>
<div class="dropdown-menu c-menu-type-mega c-visible-desktop c-pull-right c-menu-type-fullwidth" style="min-width: auto">
<%Sql= "SELECT id_categoria, titulo_esp, url_esp, orden FROM categorias WHERE visible='si' order by orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
c=1%>
<ul class="nav nav-tabs c-theme-nav">
<%do while not ob_rs.eof%>
<li <%if c=1then%>class="active"<%end if%>><a href="#<%=ob_rs("id_categoria")%>" data-toggle="tab" ><%=ob_rs("titulo_esp")%></a></li><!--class="active"-->
<%ob_rs.movenext
c=c+1
loop%>
</ul>
<%end if
ob_rs.close%>
<%Sql= "SELECT id_categoria, titulo_esp, url_esp, orden FROM categorias WHERE visible='si' order by orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
c=1%>
<div class="tab-content">
<%do while not ob_rs.eof%>
<div class="tab-pane <%if c=1then%>active<%end if%>" id="<%=ob_rs("id_categoria")%>"><!--active-->
<div class="row">
<%Sql2= "SELECT id_destino, url_esp, titulo_esp, orden FROM destinos WHERE visible='si' order by orden" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<div class="col-md-2">
<ul class="dropdown-menu c-menu-type-inline">
<%Sql3= "SELECT rel.id_destino, rel.id_categoria FROM rel where rel.id_destino="&ob_rs2("id_destino")&" and rel.id_categoria="&ob_rs("id_categoria")&" and rel.id_item<>0 group by rel.id_destino, rel.id_categoria" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<li><h3><a href="<%=r%><%=ob_rs("url_esp")%>/<%=ob_rs2("url_esp")%>" class="destino_men"><%=ob_rs2("titulo_esp")%></a></h3></li>
<%Sql4= "SELECT rel.id_destino, rel.id_ciudad, ciudades.id_ciudad, ciudades.url_esp, ciudades.titulo_esp FROM rel, ciudades WHERE rel.id_destino="&ob_rs3("id_destino")&" and rel.id_ciudad<>0 and rel.id_item<>0 and  rel.id_ciudad=ciudades.id_ciudad and rel.id_categoria="&ob_rs("id_categoria")&" group by  rel.id_destino,rel.id_ciudad,  ciudades.id_ciudad, ciudades.url_esp, ciudades.titulo_esp"
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof%>
<li><a href="<%=r%>lst/<%=ob_rs("url_esp")%>/<%=ob_rs2("url_esp")%>/<%=ob_rs4("url_esp")%>"><%=ob_rs4("titulo_esp")%></a></li>
<%ob_rs4.movenext
loop
end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close%>
</ul>
</div>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
</div></div>
<%ob_rs.movenext
c=c+1
loop%>
</div>
<%end if
ob_rs.close%>
</div>
<ul class="dropdown-menu c-menu-type-mega c-visible-mobile"><!--MOBILE VERSION -->
<%Sql= "SELECT id_categoria, titulo_esp, url_esp, orden FROM categorias WHERE visible='si' order by orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<li class="dropdown-submenu"><a href="#"><%=ob_rs("titulo_esp")%><span class="c-arrow c-toggler"></span></a>
<div class="dropdown-menu">
<div class="row">
<div class="col-md-3">
<ul class="dropdown-menu c-menu-type-inline">
<%Sql2= "SELECT id_destino, url_esp, titulo_esp, orden FROM destinos WHERE visible='si' order by orden" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<%Sql3= "SELECT rel.id_destino, rel.id_categoria FROM rel where rel.id_destino="&ob_rs2("id_destino")&" and rel.id_categoria="&ob_rs("id_categoria")&" and rel.id_item<>0 group by rel.id_destino, rel.id_categoria" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<li><h3><a href="<%=r%><%=ob_rs("url_esp")%>/<%=ob_rs2("url_esp")%>"><%=ob_rs2("titulo_esp")%></a></h3></li>
<%Sql4= "SELECT rel.id_destino, rel.id_ciudad, ciudades.id_ciudad, ciudades.url_esp, ciudades.titulo_esp FROM rel, ciudades WHERE rel.id_destino="&ob_rs3("id_destino")&" and rel.id_ciudad<>0 and rel.id_item<>0 and  rel.id_ciudad=ciudades.id_ciudad and rel.id_categoria="&ob_rs("id_categoria")&" group by  rel.id_destino,rel.id_ciudad,  ciudades.id_ciudad, ciudades.url_esp, ciudades.titulo_esp"
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof%>
<li><a href="<%=r%>lst/<%=ob_rs("url_esp")%>/<%=ob_rs2("url_esp")%>/<%=ob_rs4("url_esp")%>"><%=ob_rs4("titulo_esp")%></a></li>
<%ob_rs4.movenext
loop
end if
ob_rs4.close%>
<%ob_rs3.movenext
loop
end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</ul>
</div>
</div>
</div>
</li>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</ul><!-- END: MOBILE VERSION --></li>
<li class="c-search-toggler-wrapper"><a href="#" class="c-btn-icon c-search-toggler"><i class="fa fa-search"></i></a></li>
</ul></nav></div></div></div>