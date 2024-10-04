<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body style="background:#fff;width:100%;">
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
if rd=""then
rd=request("rd")
if rd ="" then rd = request_equerystring("rd") 'end if
end if%>
<!--<link href="../lib/css/loader.css" rel="stylesheet" type="text/css" />-->
<!--#include file="../comun/estilos.asp"-->
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<link href="<%=r%>lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
<link href="<%=r%>lib/css/layout.css" rel="stylesheet" id="style_components" type="text/css">
<link href="<%=r%>lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
<div class="se-pre-con"></div>
<div class="page-content-col col-md-12">
<div class="row">
<%Sql= "SELECT id_categoria, titulo_crm_esp, url_esp from categorias order by orden"    
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_categoria=ob_rs("id_categoria")
tit_cat=ob_rs("titulo_crm_esp")%>
<div class="col-md-6">
<div class="portlet light bordered">
<div class="portlet-title"><div class="caption"><i class="icon-social-dribbble font-blue-sharp"></i><span class="caption-subject font-blue-sharp bold">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=c&ncuat="&ncuat&"&cod="&id_categoria))%>
<a href="<%=r%>categorias/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=c&ncuat="&ncuat&"&cod="&id_categoria)%>"><%=tit_cat%></a></span></div></div>
<div class="portlet-body">
<div id="tree_1" class="tree-demo tree_1">
<ul>
<%Sql2= "SELECT rel.id_categoria, rel.id_seccion, secciones.id_seccion, secciones.titulo_esp from rel, secciones where rel.id_categoria="&id_categoria&" and rel.id_seccion<>0 and rel.id_seccion=secciones.id_seccion group by rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.titulo_esp "    
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
id_seccion=ob_rs2("rel.id_seccion")
tit_sec=ob_rs2("titulo_esp")%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=s&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_seccion))%>
<li data-jstree='{"opened":true}'><a href="<%=r%>secciones/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=s&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_seccion)%>"><%=tit_sec%></a>
<ul>
<%Sql3= "SELECT rel.id_seccion, items.id_item, items.titulo_of_esp, rel.id_subseccion from rel, items where rel.id_seccion="&id_seccion&" and rel.id_item<>0 and rel.id_subseccion=0 and rel.id_item=items.id_item and rel.id_categoria="&id_categoria&" and (eliminado IS NULL or eliminado='') group by rel.id_item, items.id_item, rel.id_seccion, items.titulo_of_esp, rel.id_subseccion "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
id_item=ob_rs3("id_item")
tit_item=ob_rs3("titulo_of_esp")
	Sql3_c= "SELECT id_item, id_subseccion from rel where id_item="&id_item&" and id_subseccion<>0 "
	Set Ob_RS3_c = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_c.Open Sql3_c, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_c.eof then
	else
	Sql3_cd= "SELECT rel.id_item, rel.id_destino, destinos.id_destino, destinos.titulo_esp from rel, destinos where rel.id_item="&id_item&" and rel.id_destino<>0 and rel.id_destino=destinos.id_destino"
	Set Ob_RS3_cd = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_cd.Open Sql3_cd, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_cd.eof then
	titulo_dest=ob_rs3_cd("titulo_esp")
	end if
	ob_rs3_cd.close%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-info"}'><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item)%>"> <%=tit_item%> (<%=titulo_dest%>)</a>
<%Sql4= "SELECT rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub<>0 and rel.id_itemSub=itemsSub.id_itemSub group by  rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub"    
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then%>
<ul>
<%do while not ob_rs4.eof
id_itemSub=ob_rs4("rel.id_itemSub")
tit_itemSub=ob_rs4("titulo_esp")%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&ob_rs4("id_item")&"&cod="&id_itemSub))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-success"}'><a href="<%=r%>itemsSub/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&ob_rs4("id_item")&"&cod="&id_itemSub)%>"><%=tit_itemSub%></a></li>
<%id_item=""
tit_item=""
titulo_dest=""
ob_rs4.movenext
loop%>
</ul>
<%end if
ob_rs4.close%>
</li>
<%end if
ob_rs3_c.close
ob_rs3.movenext
loop
end if
ob_rs3.close

Sql3= "SELECT rel.id_seccion, rel.id_subseccion, subsecciones.id_subseccion, subsecciones.titulo_esp from rel, subsecciones where rel.id_seccion="&id_seccion&" and rel.id_subseccion<>0 and rel.id_subseccion=subsecciones.id_subseccion group by rel.id_subseccion, rel.id_seccion, subsecciones.id_subseccion, subsecciones.titulo_esp "    
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
id_subseccion=ob_rs3("rel.id_subseccion")
tit_sub=ob_rs3("titulo_esp")%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=ss&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_subseccion))%>
<li data-jstree='{"opened":true}'><a href="<%=r%>subsecciones/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=ss&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_subseccion)%>"><%=tit_sub%></a>
<ul>
<%Sql4= "SELECT rel.id_seccion, items.id_item, items.titulo_of_esp, rel.id_subseccion from rel, items where rel.id_item<>0 and rel.id_subseccion="&id_subseccion&" and rel.id_item=items.id_item and rel.id_categoria="&id_categoria&" group by rel.id_item, items.id_item, rel.id_seccion, items.titulo_of_esp, rel.id_subseccion "    
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof
id_item=ob_rs4("id_item")
tit_item=ob_rs4("titulo_of_esp")
	Sql3_c= "SELECT id_item, id_subseccion from rel where id_item="&id_item&" and id_subseccion<>0 "
	Set Ob_RS3_c = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_c.Open Sql3_c, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_c.eof then
	Sql3_cd= "SELECT rel.id_item, rel.id_destino, destinos.id_destino, destinos.titulo_esp from rel, destinos where rel.id_item="&id_item&" and rel.id_destino<>0 "
	Set Ob_RS3_cd = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_cd.Open Sql3_cd, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_cd.eof then
	titulo_dest=ob_rs3_cd("titulo_esp")
	end if
	ob_rs3_cd.close%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-info"}'><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item)%>"> <%=tit_item%>(<%=titulo_dest%>)</a>
<%Sql5= "SELECT rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub<>0 and rel.id_itemSub=itemsSub.id_itemSub group by  rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub"    
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then%>
<ul>
<%do while not ob_rs5.eof
id_itemSub=ob_rs5("rel.id_itemSub")
tit_itemSub=ob_rs5("titulo_esp")%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&id_item&"&cod="&id_itemSub))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-success"}'><a href="<%=r%>itemsSub/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&id_item&"&cod="&id_itemSub)%>"><%=tit_itemSub%></a></li>
<%ob_rs5.movenext
loop%>
</ul>
<%end if
ob_rs5.close%>
</li>
<%end if
ob_rs3_c.close
ob_rs4.movenext
loop
end if
ob_rs4.close%>
</ul>
</li>
<%ob_rs3.movenext
loop
end if
ob_rs3.close%>
</ul>
</li>
<%ob_rs2.movenext
loop
end if
ob_rs2.close
Sql3= "SELECT rel.id_seccion, rel.id_subseccion, subsecciones.id_subseccion, subsecciones.titulo_esp from rel, subsecciones where rel.id_seccion=0 and rel.id_subseccion<>0 and rel.id_subseccion=subsecciones.id_subseccion group by rel.id_subseccion, rel.id_seccion, subsecciones.id_subseccion, subsecciones.titulo_esp "    
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
id_subseccion=ob_rs3("rel.id_subseccion")
tit_sub=ob_rs3("titulo_esp")
	Sql3_a= "SELECT id_seccion, id_subseccion from rel where id_subseccion="&id_subseccion&" and id_seccion<>0 "
	Set Ob_RS3_a = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_a.Open Sql3_a, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_a.eof then
	else%>
    
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=ss&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_subseccion))%>
<li data-jstree='{"opened":true}'><a href="<%=r%>subsecciones/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos=css&ntres=ss&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_subseccion)%>"><%=tit_sub%></a>
<ul>
<%Sql4= "SELECT rel.id_seccion, items.id_item, items.titulo_of_esp, rel.id_subseccion from rel, items where rel.id_seccion=0 and rel.id_item<>0 and rel.id_subseccion=0 and rel.id_item=items.id_item and (eliminado IS NULL or eliminado='') group by rel.id_item, items.id_item, rel.id_seccion, items.titulo_of_esp, rel.id_subseccion "    
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof
id_item=ob_rs4("id_item")
tit_item=ob_rs4("titulo_of_esp")
	Sql3_c= "SELECT id_item, id_subseccion from rel where id_item="&id_item&" and id_subseccion<>0 "
	Set Ob_RS3_c = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_c.Open Sql3_c, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_c.eof then%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-info"}'><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item)%>"> <%=tit_item%></a>
<%Sql5= "SELECT rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub<>0 and rel.id_itemSub=itemsSub.id_itemSub group by  rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub"    
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then%>
<ul>
<%do while not ob_rs5.eof
id_itemSub=ob_rs5("rel.id_itemSub")
tit_itemSub=ob_rs5("titulo_esp")%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&id_item&"&cod="&id_itemSub))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-success"}'><a href="<%=r%>itemsSub/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&id_item&"&cod="&id_itemSub)%>"><%=tit_itemSub%></a></li>
<%ob_rs5.movenext
loop%>
</ul>
<%end if
ob_rs5.close%>
</li>
<%end if
ob_rs3_c.close
ob_rs4.movenext
loop
end if
ob_rs4.close%>
</ul>
</li>
<%end if
ob_rs3_a.close
ob_rs3.movenext
loop
end if
ob_rs3.close
Sql4= "SELECT rel.id_seccion, items.id_item, items.titulo_of_esp, rel.id_subseccion, rel.id_categoria from rel, items where rel.id_seccion=0 and rel.id_item<>0 and rel.id_subseccion=0 and rel.id_item=items.id_item and rel.id_categoria="&id_categoria&" and rel.id_seccion= 0 and (eliminado IS NULL or eliminado='') group by rel.id_item, items.id_item, rel.id_seccion, items.titulo_of_esp, rel.id_subseccion, rel.id_categoria"
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof
id_item=ob_rs4("id_item")
tit_item=ob_rs4("titulo_of_esp")
	Sql3_c= "SELECT id_item from rel where id_item="&id_item&" and id_seccion<>0"
	Set Ob_RS3_c = Server.CreateObject("ADODB.Recordset")
	Ob_RS3_c.Open Sql3_c, ob_conn,adOpenStatic, adCmdText
	if not ob_rs3_c.eof then
else
	Sql4_c= "SELECT id_item from rel where id_item="&id_item&" and id_subseccion<>0"
	Set Ob_RS4_c = Server.CreateObject("ADODB.Recordset")
	Ob_RS4_c.Open Sql4_c, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4_c.eof then
else%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-info"}'><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod="&id_item)%>"> <%=tit_item%></a>
<%Sql5= "SELECT rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub<>0 and rel.id_itemSub=itemsSub.id_itemSub group by  rel.id_item, rel.id_itemSub, itemsSub.titulo_esp, itemsSub.id_itemSub"    
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then%>
<ul>
<%do while not ob_rs5.eof
id_itemSub=ob_rs5("rel.id_itemSub")
tit_itemSub=ob_rs5("titulo_esp")%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&id_item&"&cod="&id_itemSub))%>
<li data-jstree='{"icon":"fa fa-graduation-cap icon-state-success"}'><a href="<%=r%>itemsSub/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n=ac&ndos="&ndos&"&ntres=it&ncuat="&ncuat&"&cod_cat="&id_categoria&"&cod_prog="&id_item&"&cod="&id_itemSub)%>"><%=tit_itemSub%></a></li>
<%ob_rs5.movenext
loop%>
</ul>
<%end if
ob_rs5.close%>
</li>
<%end if
ob_rs4_c.close
end if
ob_rs3_c.close
ob_rs4.movenext
loop
end if
ob_rs4.close%>
</ul>
</div>
</div>
</div>
</div>
<%ob_rs.movenext
loop
end if
ob_rs.close
ob_conn.close%>
</div>
</div>
<script src="<%=r%>lib/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/app.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/layout.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/ui-tree.js" type="text/javascript"></script>
</body></html>