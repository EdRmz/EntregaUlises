<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Scripts/bootstrap.min.css" rel="stylesheet" />
    <title>Creación de Usuario</title>
    <link href="Scripts/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Bitter" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div>
                            <div class="bg-primary text-center">
                                <p><strong>Crear Usuario</strong></p>
                            </div>
                            <div class="bg-info text-center">
                                <asp:Label ID="Label1" runat="server" Text="Clave Profesor:"></asp:Label>
                                <asp:TextBox ID="txtClave" runat="server" Style="margin-left: 31px" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtClave"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Apellido Paterno:"></asp:Label>
                                <asp:TextBox ID="txtApPat" runat="server" onkeypress="return functionletras(event)" Style="margin-left: 22px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtApPat"
                                    ErrorMessage="*"
                                    ForeColor="Red" class="text-center">
                                </asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Apellido Materno:"></asp:Label>
                                <asp:TextBox ID="txtApMat" runat="server" onkeypress="return functionletras(event)" Style="margin-left: 20px">                                                      </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtApMat"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Nombre(s):"></asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" onkeypress="return functionletras(event)" Style="margin-left: 60px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtNombre"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="Horas por Semana:"></asp:Label>
                                <asp:TextBox ID="txtHoras" runat="server" onkeypress="return functionx(event)" Style="margin-left: 9px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="txtHoras"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="Contraseña:"></asp:Label>
                                <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" Style="margin-left: 0px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="txtContraseña"
                                    ErrorMessage="*"
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <br />
                                <br />
                            </div>
                            <div class="bg-info">
                                <asp:Label ID="Label7" runat="server" Text="Administrador:"></asp:Label>
                                <asp:RadioButtonList ID="rbSI" runat="server" Width="42px">
                                    <asp:ListItem Text="SI" Value="true" />
                                    <asp:ListItem Text="NO" Value="false" Selected="True" />
                                </asp:RadioButtonList>
                                <br />
                                <div class="bg-info text-center">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Crear" class="btn btn-primary" />
                                    <input type="button" onclick="ConfirmDemo()" value="Cancelar" class="btn btn-warning" />
                                </div>
                            </div>
                            <br />
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function ConfirmDemo() {
                //Ingresamos un mensaje a mostrar
                var mensaje = confirm("Sus cambios no serán guardados si cierra esta ventana. ¿Seguro que desea salir?");
                //Detectamos si el usuario acepto el mensaje
                if (mensaje) {
                    window.location.replace("Welcome.aspx");
                }
                    //Detectamos si el usuario denegó el mensaje
                else {
                }
            }
        </script>
        <script type="text/javascript">
            function functionx(evt) {
                if (evt.charCode > 31 && (evt.charCode < 48 || evt.charCode > 57)) {
                    alert("Debe ingresar un número.");
                    return false;
                }
            }
        </script>
        <script type="text/javascript">
            function functionletras(evt) {
                if (!((evt.charCode <=93 && evt.charCode >=65) ||(evt.charCode <=122 && evt.charCode >=97)))
                {
                    alert("Debe ingresar letras.");
                    return false;
                }
            }
        </script>
    </form>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
