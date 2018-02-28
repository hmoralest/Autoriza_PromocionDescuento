<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DatosAdic.aspx.cs" Inherits="_Default" %>

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

        function Confirmacion() {
            var seleccion = confirm("Confirma su Aprobación de la Promoción?");

            var email = getParameterByName('mail');
            var promo = getParameterByName('promo');

            if (seleccion) {
                alert("se acepto el mensaje");
                location.href = "Procesado.aspx?mostrar=1&email=" + email + "&reg=" + promo + "";
            }
            else {
                alert("NO se acepto el mensaje");
                location.href = "Procesado.aspx?mostrar=0&email=" + email + "&reg=" + promo + "";
            }

            //usado para que no haga postback el boton de asp.net cuando no se acepte el confirm
            return seleccion;
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
        <img alt="Logo" class="auto-style1" longdesc="Logo" src="Imagen/BATA%20(rojo).png" /><br />
        <br />
        <table style="width:80%;border-width:1px;border-style:solid;border:hidden" border="1" align="center">
            <tr>
                <td colspan="3" align="center" style="background-color:red;color:white;font-family:'Cooper Black';font-size:24px">
                    Promoción:<br />
                    <asp:Label ID="titulo" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="border:hidden">&nbsp;</td>
            </tr>
            <tr>
                <td align="center"colspan="3" style="background-color:red;color:white;font-family:'Cooper Black';font-size:16px">Productos:</td>
            </tr>
            <tr>
                <td align="center" style="background-color:red;color:white;font-family:'Cooper Black';font-size:16px;width:47%">Activadores</td>
                <td rowspan="2" style="border:hidden">&nbsp;</td>
                <td align="center" style="background-color:red;color:white;font-family:'Cooper Black';font-size:16px;width:47%">Promoción</td>
            </tr>
            <tr>
                <td align="center" valign="top" style="border:hidden"><div id="activ" runat="server">&nbsp;</div></td>
                <td align="center" valign="top" style="border:hidden"><div id="promo" runat="server">&nbsp;</div></td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="border:hidden">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="background-color:red;color:white;font-family:'Cooper Black';font-size:16px">Tiendas:</td>
            </tr>
            <tr>
                <td colspan="3"align="center" style="border:hidden"><div id="tda" runat="server">&nbsp;</div></td>
            </tr>
        </table>
    </form>
</body>
</html>
