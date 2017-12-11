<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Materias.aspx.cs" Inherits="Materias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Scripts/bootstrap.min.css" rel="stylesheet" />
    <title>Materias</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-md-4">
                        <div>
                            <p class="text-center"><strong>Agregar Materia</strong></p>
                            <asp:Label ID="Label1" runat="server" Text="Clave Materia:"></asp:Label>
                            <asp:TextBox ID="txtClave" runat="server" Style="margin-left: 30px" MaxLength="8" Width="73px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtClave"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Nombre Materia:"></asp:Label>
                            <asp:TextBox ID="txtNombre" runat="server" Style="margin-left: 17px" Width="176px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtClave"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Horas Semanales:"></asp:Label>
                            <asp:DropDownList class="btn btn-primary" ID="ddlHoras" runat="server" Style="margin-left: 7px">
                                <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                                <asp:ListItem Value="2"></asp:ListItem>
                                <asp:ListItem Value="3"></asp:ListItem>
                                <asp:ListItem Value="4"></asp:ListItem>
                                <asp:ListItem Value="5"></asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Semestre:"></asp:Label>
                            <asp:DropDownList class="btn btn-primary" ID="ddlSemestre" runat="server" Style="margin-left: 59px">
                                <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                                <asp:ListItem Value="2"></asp:ListItem>
                                <asp:ListItem Value="3"></asp:ListItem>
                                <asp:ListItem Value="4"></asp:ListItem>
                                <asp:ListItem Value="5"></asp:ListItem>
                                <asp:ListItem Value="6"></asp:ListItem>
                                <asp:ListItem Value="7"></asp:ListItem>
                                <asp:ListItem Value="8"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="Carrera:"></asp:Label>
                            <asp:DropDownList class="btn btn-primary" ID="ddlCarrera" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreCarrera" DataValueField="Id" Style="margin-left: 0px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HorarioFinalConnectionString1 %>" SelectCommand="SELECT [NombreCarrera], [Id] FROM [Carreras]"></asp:SqlDataSource>
                            <br />
                            <br />
                            <div class="text-center">
                                <asp:Button ID="btnCrear" runat="server" Text="Agregar" class="btn btn-primary" OnClick="btnCrear_Click" />
                                <input type="button" onclick="ConfirmDemo()" value="Cancelar" class="btn btn-warning" />
                            </div>
                            <div>
                                <script type="text/javascript">
                                    function ConfirmDemo() {
                                        //Ingresamos un mensaje a mostrar
                                        var mensaje = confirm("Sus cambios no serán guardados si cierra esta ventana.\n ¿Seguro que desea salir?");
                                        //Detectamos si el usuario acepto el mensaje
                                        if (mensaje) {
                                            window.location.replace("Welcome.aspx");
                                        }
                                            //Detectamos si el usuario denegó el mensaje
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
    </form>
</body>
</html>
