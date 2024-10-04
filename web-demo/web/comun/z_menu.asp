<%z_menu=request("z_nivel")%>
<div class="c-layout-sidebar-menu c-theme men_usu"><div class="c-sidebar-menu-toggler"><h3 class="c-title c-font-uppercase c-font-bold">Mi zona privada</h3><a href="javascript:;" class="c-content-toggler" data-toggle="collapse" data-target="#sidebar-menu-1"><span class="c-line"></span><span class="c-line"></span><span class="c-line"></span></a></div>
<ul class="c-sidebar-menu collapse " id="sidebar-menu-1"><li class="c-dropdown c-open"><a href="javascript:;" class="c-toggler">Mi zona privada<span class="c-arrow"></span></a>
<ul class="c-dropdown-menu">
<li class="<%if z_menu="dash" then%>c-active<%end if%>"><a href="<%=r%>zona-privada"><i class="fa fa-laptop" aria-hidden="true"></i>Escritorio</a></li>
<li class="<%if z_menu="inscrip" then%>c-active<%end if%>"><a href="<%=r%>inscripciones"><i class="fa fa-folder" aria-hidden="true"></i>Inscripciones</a></li>
<li class="<%if z_menu="preinsc" then%>c-active<%end if%>"><a href="<%=r%>preinscripciones"><i class="fa fa-folder-o" aria-hidden="true"></i>Pre Inscripciones</a></li>
<%if session("u_agente")="si" then%><li class="<%if z_menu="inscribir" then%>c-active<%end if%>"><a href="<%=r%>inscribir"><i class="fa fa-folder-o" aria-hidden="true"></i>Inscribir alumno</a></li><%end if%>
<li class="<%if z_menu="mod_usu" then%>c-active<%end if%>"><a href="<%=r%>modificar-datos"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Modificar datos</a></li>
<li class="<%if z_menu="dash" then%>c-active<%end if%>"><a href="<%=r%>salir"><i class="fa fa-sign-out" aria-hidden="true"></i>Salir</a></li>
</ul></li></ul></div>