<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLogin.ascx.cs" Inherits="webSaglikProjesi.ucLogin" %>
<link rel="stylesheet" type="text/css" href="style.css" />
<div>
<table width="300px">
    <tr>
        <td colspan="2" style="text-align:center; font-weight:bold">
            <asp:Label ID="Label3" runat="server" Text="Login" BackColor="Black" Width="300px" ForeColor="White" Height="20px"></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="username"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Kullanıcı adı boş geçilemez!" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="password"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Şifre boş geçilemez!" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center">
            <asp:Button ID="btnLogin" runat="server" Text="login" Width="90px" CssClass="bluebutton" OnClick="btnLogin_Click" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="200px" />
        </td>
    </tr>
</table>
</div>
