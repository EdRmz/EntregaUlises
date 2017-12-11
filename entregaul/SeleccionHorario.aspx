<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeleccionHorario.aspx.cs" Inherits="SeleccionHorario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Scripts/bootstrap.css" rel="stylesheet" />
    <title>Selección de Horario</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron center-block">
                <div class="row">
                    <div>
                        <div class="col-sm-12">
                            <div class="col-sm-4 text-center">
                                <p><strong>Selección de Horario</strong></p>
                                <asp:Label ID="Label1" runat="server" Text="Materia:"></asp:Label>
                                <asp:DropDownList class="btn btn-primary" ID="ddlMateria" runat="server" OnSelectedIndexChanged="ddlMateria_SelectedIndexChanged">
                                </asp:DropDownList>
                                <br />
                                <br />
                                <asp:Button ID="btnSelecciona" runat="server" Text="Selecciona" class="btn btn-primary" OnClick="btnSelecciona_Click" />
                                <br />
                                <br />
                                <br />
                                <br />
                                 <asp:Label ID="Label2" runat="server" Text="Horas Por Cargar Restantes:" Visible="false"></asp:Label>  
                                <br />                                
                                <asp:Label ID="Label20" runat="server" Text="Día:" Visible="false"></asp:Label>  
                                <br />                        
                                <asp:DropDownList ID="ddlDia7" runat="server" class="btn btn-primary" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="ddlDia7_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                    <asp:ListItem Value="1">Lunes</asp:ListItem>
                                            <asp:ListItem Value="2">Martes</asp:ListItem>
                                            <asp:ListItem Value="3">Miércoles</asp:ListItem>
                                            <asp:ListItem Value="4">Jueves</asp:ListItem>
                                            <asp:ListItem Value="5">Viernes</asp:ListItem>
                                </asp:DropDownList>
                                   <br />
                                <asp:Label ID="Label21" runat="server" Text="Hora:" Visible="false"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlHora7" runat="server" class="btn btn-primary" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlHora7_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:HorarioFinalConnectionString1 %>" SelectCommand="SELECT DISTINCT Hora FROM Horario
"></asp:SqlDataSource>
                                <br />
                                <asp:Label ID="Label22" runat="server" Text="Aula:" Visible="false"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlAula7" runat="server" class="btn btn-primary" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlAula7_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:HorarioFinalConnectionString1 %>" SelectCommand="SELECT [Id], [NombreAula] FROM [Aulas]"></asp:SqlDataSource>
                                <br />
                                <br />
                                   <asp:Button ID="btnSelec6" runat="server" class="btn btn-info center-block btn-lg" Text="CONFIRMAR" OnClick="btnSelec6_Click" Visible="false" />
                            </div>
                         
                            <div class="col-sm-8">
                                <div class="col-sm-8">
                                </div>

                            </div>
                        </div>
                     
                    </div>
                </div>
            </div>
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
    </form>
</body>
</html>
