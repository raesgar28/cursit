<%rd="../"%><!--#include file="../conex/conex.asp"--><%id_noticia=request.QueryString("id_noticia")
Sql= "SELECT titulo_esp, url_esp, texto_esp, id_noticia, fecha_in FROM noticias WHERE id_noticia="&id_noticia&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%><div class="cbp-l-project-title"><%=ob_rs("titulo_esp")%></div><div class="cbp-l-project-subtitle">por Cursit Idiomas</div>
<%Sql2= "SELECT rel.id_archivo, rel.id_general, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_noticia="&id_noticia&"  and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_2' order by archivos.orden" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%><div class="cbp-slider"><ul class="cbp-slider-wrap"><%do while not ob_rs2.eof%><li class="cbp-slider-item"><img src="<%=ob_rs2("nombre")%>" alt=""></li><%ob_rs2.movenext
loop%></ul></div><%end if
ob_rs2.close%><div class="cbp-l-project-container"><div class="cbp-l-project-desc"><div class="cbp-l-project-desc-title"><span><%=ob_rs("titulo_esp")%></span></div><div class="cbp-l-project-desc-text"><%=ob_rs("texto_esp")%></div></div><div class="cbp-l-project-details"><ul class="cbp-l-project-details-list"><li><strong>Fecha</strong><%=ob_rs("fecha_in")%></li></ul><a href="<%=ob_rs("url_esp")%>" class="cbp-l-project-details-visit btn btn-sm c-btn-border-1x c-btn-square c-btn-dark c-btn-uppercase c-btn-bold">ver noticia completa</a></div></div><%end if
ob_rs.close%>