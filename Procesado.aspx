<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Procesado.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script type="text/javascript">

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
     
    </script>

    <style type="text/css">

        .auto-style1 {
            height: 43px;
            width: 211px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img alt="Logo" class="auto-style1" longdesc="Logo" src="Imagen/BATA%20(rojo).png" />
    </div>
        <br />
        <br />
        <br />
    <div style="margin-left: 200px">
        <asp:Label ID="Label1" runat="server" Text="Procesando..." ForeColor="Red" Font-Names="Cooper Black" Font-Size="Larger"></asp:Label>
    
        <br />
    
        <asp:Label ID="Label2" runat="server" Text="Favor de cerrar el navegador." ForeColor="Red" Font-Names="Cooper Black" Font-Size="Larger"></asp:Label>
    
    </div>
    </form>
</body>
</html>
