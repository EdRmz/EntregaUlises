<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Scripts/bootstrap.css" rel="stylesheet" />
    <title>Inicio</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <style>
                .bg-1 {
                    background-color: #32e8cc; /* Green */
                    color: #ffffff;
                }
            </style>
            <div class="jumbotron container-fluid bg-1 text-center">
                <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-7">
                        <asp:Button class="btn btn-primary" ID="btnUsuario" runat="server" OnClick="btnUsuario_Click" Text="Crear Usuario" Visible="false" />
                        <asp:Button class="btn btn-primary" ID="btnMateria" runat="server" OnClick="Button1_Click" Text="Agregar Materia" Visible="false" />
                        <asp:Button ID="btnAsigna" runat="server" OnClick="btnAsigna_Click" Text="Asignar Materias" class="btn btn-primary" Visible="false" />
                        <asp:Button class="btn btn-primary" ID="btnSelecciona" runat="server" OnClick="btnSelecciona_Click" Text="Seleccion Horario" Visible="false" />
                        <input type="button" onclick="ConfirmDemo()" value="Salir" class="btn btn-warning" />
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
        </div>
        <div>
            <script type="text/javascript">
                function ConfirmDemo() {
                    //Ingresamos un mensaje a mostrar
                    var mensaje = confirm("¿Seguro que desea salir?");
                    //Detectamos si el usuario acepto el mensaje
                    if (mensaje) {
                        window.location.replace("Default.aspx");
                        sessionStorage.clear();
                    }
                        //Detectamos si el usuario denegó el mensaje
                    else {
                    }
                }
            </script>
        </div>
    </form>
</body>
</html>
