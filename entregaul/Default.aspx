<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Scripts/bootstrap.css" rel="stylesheet" />
    <title>Inicia sesión</title>
</head>
<script src="Scripts/jquery-1.8.2.js"></script>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-sm-4 text-center">
                        <img src="Images/login.png" />
                    </div>
                    <div class="col-sm-5 text-center">
                        <br />
                        <br />
                        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/Welcome.aspx" Font-Names="Verdana" Font-Size="Medium" ForeColor="#333333" OnAuthenticate="Login1_Authenticate">
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                            <TextBoxStyle Font-Size="0.8em" />
                            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                        </asp:Login>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
