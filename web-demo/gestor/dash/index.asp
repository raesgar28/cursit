<!--#include file="../comun/menu_sup.asp"--> 
<link href="<%=r%>lib/app/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css">
<link href="../lib/css/plugins.min.css" rel="stylesheet" type="text/css"><!-- CREO QUE SOLO PARA DASH-->
<div class="breadcrumbs"><h1>Escritorio</h1><ol class="breadcrumb"><li><a href="#">CRM Cursit</a></li><li class="active">Escritorio</li></ol></div>
<div id="dash"></div>
<%if ndos="muestra_dash"then%><script>
$(document).ready(function(){var url = "<%=r%>dash/index_a.asp?r=<%=r%>";$.ajax({type: "GET",url: url,success: function(data){
$('#dash').hide().html(data).fadeIn("slow");
$('.se-pre-con').fadeOut("slow");
}});})</script>
<%else
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat="))
response.redirect(r&"preinscripciones/listado.jpk2?enc="&EnCrypt("?r="&r&"&rd="&rd&"&n=pi&ndos=&ntres=s&ncuat="))
end if%>



