<div class="modal fade" id="secciones_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Sección</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap"))%><iframe src="<%=r%>secciones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="subsecciones_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear subSección</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap"))%><iframe src="<%=r%>subsecciones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="proveedores_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Proveedor (Escuela)</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=&edi=rap"))%><iframe src="<%=r%>proveedores/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="destinos_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear un Destino</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=dt&ncuat=&edi=rap"))%><iframe src="<%=r%>destinos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=dt&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="idiomas_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Idioma</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=id&ncuat=&edi=rap"))%><iframe src="<%=r%>idiomas/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=id&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="ciudades_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Ciudad</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=&edi=rap"))%><iframe src="<%=r%>ciudades/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>