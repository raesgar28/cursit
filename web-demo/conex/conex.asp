<%Dim Ob_conn, ob_command
Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_Command = Server.CreateObject ("ADODB.Command")
Ob_Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/front.mdb")
Ob_Command.ActiveConnection = Ob_Conn
Const adCmdText = &H0001
Const adOpenStatic = 3%>