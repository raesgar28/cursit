<!--#include file="comun/menu_sup.asp"-->
<%Function RemoveHTML(strText)
Dim RegEx
Set RegEx = New RegExp
RegEx.Pattern = "<[^>]*>"
RegEx.Global = True
RemoveHTML = RegEx.Replace(strText, "")
End Function%>
<%pag = request.QueryString("pag")
id_seccion=request("id_seccion")
pr=request("pr")
topeLados = 5
if pag = "" then pag=1'Const adCmdText = &H0001'Const adOpenStatic = 3
if id_categoria<>"" then
Sql2= "SELECT url_esp, titulo_esp,texto_esp FROM categorias WHERE id_categoria="&id_categoria&" " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
url_cat_l=ob_rs2("url_esp")
url_cat_p=ob_rs2("url_esp")
titulo_esp_cat=ob_rs2("titulo_esp")
texto_esp=ob_rs2("texto_esp")
end if
ob_rs2.close
Sql= "SELECT rel.id_archivo, rel.id_general, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_categoria="&id_categoria&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
end if
ob_rs.close
end if
if id_seccion<>"" then
Sql2= "SELECT url_esp, titulo_esp,texto_esp FROM secciones WHERE id_seccion="&id_seccion&" " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
url_sec_l="/"&ob_rs2("url_esp")
titulo_esp_sec=" | "&ob_rs2("titulo_esp")
titulo_esp_sec_tag=ob_rs2("titulo_esp")
texto_esp_sec=ob_rs2("texto_esp")
end if
ob_rs2.close
Sql= "SELECT rel.id_archivo, rel.id_general, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_seccion="&id_seccion&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
end if
ob_rs.close
end if


if id_destino<>"" then
Sql2= "SELECT url_esp, titulo_esp,texto_esp FROM destinos WHERE id_destino="&id_destino&" " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
url_des_l="/"&ob_rs2("url_esp")
titulo_esp_des=" | "&ob_rs2("titulo_esp")
titulo_esp_des_tag=ob_rs2("titulo_esp")
texto_esp_dst=ob_rs2("texto_esp")
end if
ob_rs2.close


Sql= "SELECT rel.id_archivo, rel.id_general, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_destino="&id_destino&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
end if
ob_rs.close
end if
if id_ciudad<>"" then
Sql= "SELECT rel.id_archivo, rel.id_general, archivos.id_archivo, archivos.campo,archivos.nombre,archivos.alt FROM rel, archivos WHERE rel.id_ciudad="&id_ciudad&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo='archivo_2'" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ruta_banner=ob_rs("nombre")
alt=ob_rs("alt")
alt_banner=ob_rs("alt")
end if
ob_rs.close
end if%>

<div class="c-layout-breadcrumbs-1 c-bgimage-full c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza" style="background-image: url(<%=ruta_banner%>)"><div class="c-breadcrumbs-wrapper"><div class="container"><div class="c-page-title c-pull-left"><h1 class="c-font-uppercase c-font-white c-font-20 c-font-slim "><%=titulo_esp_web%> | <%=titulo_esp_cat%><%=titulo_esp_sec%><%=titulo_esp_des%></h1><h2 class="c-font-white c-font-thin c-opacity-07"><%=alt_banner%></h2></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white" title="<%=titulo_esp_web%>"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white">Filtrado Cursos Idiomas</li></ul></div></div></div>

<div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row"><div class="col-sm-12">
<div class="c-margin-t-20"></div>
<%if pag=1 then
if id_categoria<>"" and texto_esp<>"" then%>
<div class="col-md-12"><%=texto_esp%></div>
<%end if%>
<%if id_seccion<>"" and texto_esp_sec<>"" then%>
<div class="col-md-12"><%=texto_esp_sec%></div>
<%end if%>
<%if id_destino<>"" and texto_esp_dst<>"" then%>
<div class="col-md-12"><%=texto_esp_dst%></div>
<%end if%>
<%if id_ciudad<>"" and texto_esp_ciu<>"" then%>
<div class="col-md-12"><%=texto_esp_ciu%></div>
<%end if%>
<%if texto_esp<>"" or texto_esp_sec<>"" or texto_esp_dst<>"" or texto_esp_ciu<>"" then%><div class="col-md-12 separa_listado"></div>
<%end if
end if

if pr="dst"then
'id_ciudad=request("id_ciudad")
if id_categoria<>"" and id_ciudad="" then
Sql= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, items.id_item, resumen_esp, oferta, texto_esp, id_seccion, id_destino  FROM rel, items WHERE id_categoria="&id_categoria&" and rel.id_destino="&id_destino&"  and rel.id_seccion<>0 and rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and  (privado IS NULL or privado='') and (visible='si') ORDER BY items.orden" 
end if
if id_ciudad<>"" and id_categoria<>"" then
Sql= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, items.id_item, resumen_esp, oferta, texto_esp, id_seccion, id_destino FROM rel, items WHERE id_categoria="&id_categoria&" and rel.id_destino="&id_destino&"  and rel.id_ciudad="&id_ciudad&"  and rel.id_seccion<>0 and rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and (privado IS NULL or privado='') and (visible='si') ORDER BY items.orden" 
end if
end if
if pr="men"then
if id_categoria<>""then
Sql= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, items.id_item, resumen_esp, oferta, texto_esp, id_destino, id_seccion FROM rel, items WHERE id_categoria="&id_categoria&"  and rel.id_categoria=id_categoria and rel.id_seccion<>0 and rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and (privado IS NULL or privado='') and visible='si' ORDER BY items.orden" 
end if
if id_seccion<>""then
if id_destino<>""then
Sql= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, items.id_item, resumen_esp, oferta, texto_esp, id_destino, id_seccion FROM rel, items WHERE rel.id_destino="&id_destino&" and id_categoria="&id_categoria&" and rel.id_seccion="&id_seccion&" and rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and  (privado IS NULL or privado='') and (visible='si') ORDER BY items.orden" 
else
Sql= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, items.id_item, resumen_esp, oferta, texto_esp, id_destino,id_seccion FROM rel, items WHERE id_categoria="&id_categoria&" and rel.id_seccion="&id_seccion&" and rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and  (privado IS NULL or privado='') and (visible='si') ORDER BY items.orden" 
end if
end if
end if
if pr="busca" then%>
<!--#include file="comun/limpia.asp"-->
<%Sql= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des, show_cat, id_categoria, en_menu, items.id_item, resumen_esp, oferta, meta_key, id_seccion, id_destino, texto_esp FROM rel, items WHERE rel.id_item= items.id_item and (eliminado IS NULL or eliminado='') and (eliminado IS NULL or eliminado='') and  (privado IS NULL or privado='') and id_categoria<>0 and id_seccion<>0  and (visible='si') and "
buscar_txt=replace(request("buscar_txt"),"-"," ")
buscar_txt_limpia=buscar_txt
buscar_txt_lk=buscar_txt
Function acentos2(Str)
Dim ac
For x = 1 To Len(Str)
ac = Mid(Str, x, 1)
Select Case ac
Case "a", "à", "á"
acentos2 = acentos2 & "[aàá]"
Case "e", "é", "è"
acentos2 = acentos2 & "[eéè]"
Case "i", "ì", "í"
acentos2 = acentos2 & "[iìí]"
Case "o", "ò" , "ó"
acentos2 = acentos2 & "[x]"
Case "u", "ù", "ú"
acentos2 = acentos2 & "[uùú]"
Case "n", "ñ", "Ñ"
acentos2 = acentos2 & "[nñÑ]"
Case Else
acentos2 = acentos2 & ac
End Select
Next
End Function
Cadena=Split(buscar_txt_lk," ")
For i = 0 to UBound(Cadena) '- 1
num_p=i+1
next
buscar_txt_b=split(buscar_txt_lk)
For i = 0 to UBound(buscar_txt_b) '- 1
check2=""
if lcase(right(buscar_txt_b(i),1))= "s" and lcase(right(buscar_txt_b(i),2))<> "es" and lcase(buscar_txt_b(i))<>"naturals" then
buscar_txt_b(i)= mid(buscar_txt_b(i),1, (len(buscar_txt_b(i))-1))&" "
end if
if lcase(right(buscar_txt_b(i),2))= "es" then
buscar_txt_b(i)= mid(buscar_txt_b(i),1, (len(buscar_txt_b(i))-2))&" "
check2="ok"
end if
if lcase(right(buscar_txt_b(i),1))<> "s" and lcase(right(buscar_txt_b(i),2))<> "es" and check2<>"ok" then
buscar_txt_b(i)= buscar_txt_b(i) &" "
end if
buscar_txt = trim(buscar_txt_b(i))
buscar_txt=acentos2(buscar_txt)
buscar_txt=replace(buscar_txt,"]","aeiou&aacute;&eacute;&iacute;&oacute;&uacute;áéíóú]")
if i>0then Sql=Sql&" and " end if
if num_p=1then
Sql=Sql&"(titulo_esp + meta_key LIKE " & chr(39) &"%" & buscar_txt & "%" & chr(39) & ")"
end if
if num_p>1then
Sql=Sql&"(titulo_esp LIKE " & chr(39) &"%" & buscar_txt & "%" & chr(39) & ""
'Sql=Sql&"or i_items.texto_esp LIKE " & chr(39) &"%" & buscar_txt & "%" & chr(39) & ""
Sql=Sql&"or meta_key LIKE " & chr(39) &"%" & buscar_txt & "%" & chr(39) & ")"
end if
Next
Sql=Sql&" ORDER BY items.orden" 
end if


Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ob_rs.PageSize = 8
ob_rs.AbsolutePage = pag
NumPag = ob_rs.PageCount
i=0
While (not ob_rs.eof and i < ob_rs.PageSize )
id_item=ob_rs("id_item")
id_categoria=ob_rs("id_categoria")

id_destino=ob_rs("id_destino")
id_seccion=ob_rs("id_seccion")
if pr="busca" then
id_seccion=ob_rs("id_seccion")
id_destino=ob_rs("id_destino")
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
url_des_p="/"&ob_rs2("url_esp")
titulo_esp_des=" | "&ob_rs2("titulo_esp")
titulo_esp_des_tag=ob_rs2("titulo_esp")
end if
ob_rs2.close
end if

if ob_rs("inc_cat")="si" then
url_cat=url_cat_p
end if
if ob_rs("inc_sec")="si" then
Sql2= "SELECT url_esp FROM secciones, rel WHERE rel.id_categoria="&id_categoria&" and secciones.id_seccion=rel.id_seccion " 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
url_sec=ob_rs2("url_esp")
end if
ob_rs2.close
end if

Sql2= "SELECT nombre FROM rel, archivos WHERE rel.id_item="&id_item&" and rel.id_archivo= archivos.id_archivo and campo='archivo_1' " 
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
img_nom=ob_rs2("nombre")
else
img_nom=""
end if
ob_rs2.close

if img_nom="" then
Sql2= "SELECT nombre FROM rel, archivos WHERE rel.id_item="&id_item&" and rel.id_archivo= archivos.id_archivo and campo='archivo_2' and tipo='img'" 
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
img_nom=ob_rs2("nombre")
else
img_nom=r&"web/lib/img/logos/no-foto.gif"
end if
ob_rs2.close
end if
if img_nom="" then img_nom=r&"web/lib/img/logos/no-foto.gif" end if%>



<div class="row c-margin-b-40"><div class="c-content-product-2 c-bg-white">
<div class="col-md-4"><div class="c-content-overlay"><%if ob_rs("oferta")="si"then%><div class="c-label c-bg-red c-font-uppercase c-font-white c-font-13 c-font-bold">Oferta</div><%end if%>


<div class="c-overlay-wrapper"><div class="c-overlay-content">
<a href="<%=r%><%if ob_rs("inc_cat")="si"then%><<%=url_cat_p%><%end if%><%if ob_rs("inc_sec")="si"then%><%=url_sec_p%><%if ob_rs("inc_des")<>"si"then%>/<%end if%><%end if%><%if ob_rs("inc_des")="si"then%><%=url_des_p%>/<%end if%><%=ob_rs("url_esp")%>" class="btn btn-md c-btn-grey-1 c-btn-uppercase c-btn-bold c-btn-border-1x c-btn-square">Ver curso</a>
</div></div><div class="c-bg-img-center c-overlay-object" data-height="height" style="height: 230px; background-image: url('<%=img_nom%>');"></div></div></div><%img_nom=""%>


<!--#include file="comun/fluctuaciones.asp"-->
<!--#include file="comun/moneda.asp"-->
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
if precio<>"" then
Sql3= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.precio, itemsSubSemanas.id_itemSubSemana, itemsSubSemanas.semanas FROM rel, itemsSubSemanas WHERE rel.id_itemSub="&ob_rs2("id_itemSub")&" and  rel.id_itemSubSemana <>0 and itemsSubSemanas.id_itemSubSemana=rel.id_itemSubSemana and itemsSubSemanas.precio < "&precio&" and itemsSubSemanas.semanas<>53" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
precio=ob_rs3("precio")
id_itemSub_dd=ob_rs3("id_itemSub")
semanas_dd=ob_rs3("semanas")
end if
ob_rs3.close
end if
ob_rs2.movenext
loop
end if
ob_rs2.close%>
<div class="col-md-8"><div class="c-info-list">
<h3 class="c-title c-font-bold c-font-22 c-font-dark">
<a class="c-theme-link" href="<%=r%><%if ob_rs("inc_cat")="si"then%><%=url_cat_p%><%end if%><%if ob_rs("inc_sec")="si"then%><%=url_sec_p%><%if ob_rs("inc_des")<>"si"then%>/<%end if%><%end if%><%if ob_rs("inc_des")="si"then%><%=url_des_p%>/<%end if%><%=ob_rs("url_esp")%>"><%=ob_rs("titulo_esp")%></a>
</h3>
<%'if pr="busca" then%>
<ul class="c-theme-ul-bg tages" style="margin:0;padding:0;margin-bottom:10px;">
<%if titulo_esp_cat<>""then%><li><%=titulo_esp_cat%></li><%end if%>
<%if titulo_esp_sec_tag<>""then%> <li><%=titulo_esp_sec_tag%></li><%end if%>
<%if titulo_esp_dest_tag<>""then%> <li><%=titulo_esp_dest_tag%></li><%end if%>
</ul>
<%'end if%>
<p class="c-desc c-font-16 c-font-thin"><%if ob_rs("resumen_esp")<>""then%><%=ob_rs("resumen_esp")%><%else%><%=left(RemoveHTML(ob_rs("texto_esp")),420)%>...<%end if%></p><p class="c-price c-font-26 c-font-thin"><%if precio<>"" then%><span style="font-size:0.5em;margin-right:12px;">desde</span><%=FormatNumber(ccur(precio*fluctuacion_c),2)%>&nbsp;<%=mon%><%end if%></p></div><div>
<a href="<%=r%><%if ob_rs("inc_cat")="si"then%><%=url_cat_p%><%end if%><%if ob_rs("inc_sec")="si"then%><%=url_sec_p%><%if ob_rs("inc_des")<>"si"then%>/<%end if%><%end if%><%if ob_rs("inc_des")="si"then%><%=url_des_p%>/<%end if%><%=ob_rs("url_esp")%>" class="btn btn-sm c-theme-btn c-btn-square c-btn-uppercase c-btn-bold"><i class="fa fa-search-plus"></i>Ver curso </a>
</div></div></div></div>
<%i = i + 1
precio=""
ob_rs.movenext
wend
else%>
</div></div><div class="alert alert-danger alert-dismissible margin-120" role="alert" > Actualmente no hay cursos dentro de esa selección.</div>
<%end if
ob_rs.close
dim inicio,flechaAnt,flechaPos           'PAGINACION
if pag="ult" then pag=NumPag
if cint(pag)>cint(topeLados+1) then flechaAnt=pag-cint(topeLados+1) else flechaAnt=0
if cint(pag) < cint(NumPag+topeLados+1) then flechaPos=cint(pag+topeLados+1) else flechaPos=0
if cint(pag)>cint(topeLados+1) then inicio=pag-topeLados else inicio=1
if cint(pag+topeLados)< cint(NumPag) then fin=pag+topeLados else fin=NumPag
if cint(flechaAnt)=0 then fin=cint(topeLados*2+1)
if cint(fin)>cint(NumPag) then fin=NumPag
if NumPag>1 then%> 
<div class="c-pagination">    
<ul class="c-content-pagination c-theme pull-right">P&aacute;ginas::         
<%if (pag>topePag) and flechaAnt>0 then %>
<li class="c-prev"><a href="<%=r%><%=url_cat_p%>/<%=flechaAnt%>" title="Página anterior de Cursit Idiomas · Listado de <%=titulo_esp_cat%>"><i class="fa fa-angle-left"></i></a></li>
<%end if
For i=inicio to fin
if i = cint(pag) then%>
<li class="c-active">
<a href="<%=r%><%if pr="busca"then%>busca/<%=deslimpia(buscar_txt_lk)%><%else%><%=url_cat_l%><%=url_sec_l%><%=url_des_l%><%end if%>/<%=i%>" title="Página <%=i%> de Cursit Idiomas · Listado de <%=titulo_esp_cat%>"><%=i%></a></li>
<%else%>
<li>
<a href="<%=r%><%if pr="busca"then%>busca/<%=deslimpia(buscar_txt_lk)%><%else%><%=url_cat_l%><%=url_sec_l%><%=url_des_l%><%end if%>/<%=i%>" title="Página <%=i%> de Cursit Idiomas · Listado de <%=titulo_esp_cat%>"><%=i%></a>
</li>
<%end if
Next
if cint(flechaPos)>0 and cint(pag+topeLados)<cint(NumPag) then%>
<li class="c-next"><a href="<%=r%><%if pr="busca"then%>busca/<%=deslimpia(buscar_txt_lk)%><%else%><%=url_cat_l%><%=url_sec_l%><%=url_des_l%><%end if%>/<%=flechaPos%>"><i class="fa fa-angle-right"></i></a></li>
<%end if%>
</ul>
</div>
<%end if      'FIN PAGINACION%> 
</div></div></div></div>
<!--#include file="comun/menu_inf.asp"-->