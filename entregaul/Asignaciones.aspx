<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Asignaciones.aspx.cs" Inherits="Asignaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Asignacion de materias</title>
    <link href="Scripts/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div>
                            <p class="text-center"><strong>Asignar Materias</strong></p>
                            <asp:Label ID="Label1" runat="server" Text="Carrera:      "></asp:Label>
                            <asp:DropDownList ID="ddlCarrera" runat="server" class="btn btn-primary" AutoPostBack="True" OnSelectedIndexChanged="ddlCarrera_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:CompareValidator ControlToValidate="ddlCarrera" ID="CompareValidator1"
                                ValidationGroup="g1" CssClass="errormesg" ErrorMessage="Please select a type"
                                runat="server" Display="Dynamic"
                                Operator="Equal" ValueToCompare="0" Type="Integer" />
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Clave Profesor:"></asp:Label>
                            <asp:DropDownList ID="ddlClave" runat="server" class="btn btn-primary" AutoPostBack="True">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Materia:"></asp:Label>
                            <asp:DropDownList ID="ddlMateria" class="btn btn-primary" runat="server">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <div class="text-center">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Asignar" class="btn btn-primary" />
                                <input type="button" onclick="ConfirmDemo()" value="Salir" class="btn btn-warning" />
                            </div>
                            <div>
                                <script type="text/javascript">
                                    function ConfirmDemo() {
                                        var mensaje = confirm("Sus cambios no serán guardados si cierra esta ventana.\n ¿Seguro que desea salir?");
                                        if (mensaje) {
                                            window.location.replace("Welcome.aspx");
                                        }
                                        else {
                                        }
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="col-sm-4"></div>

                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
