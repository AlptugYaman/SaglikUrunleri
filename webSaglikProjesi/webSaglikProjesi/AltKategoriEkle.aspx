<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AltKategoriEkle.aspx.cs" Inherits="webSaglikProjesi.AltKategoriEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" DataTextField="kategoriad" DataValueField="id" Height="23px" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged" Width="141px">
    </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="dgvAltKategoriler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" Width="481px" OnSelectedIndexChanged="dgvAltKategoriler_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" HeaderText="Seç" SelectText="&gt;&gt;" ShowSelectButton="True" />
            <asp:BoundField DataField="altkategoriad" HeaderText="AltKategori " />
            <asp:BoundField DataField="aciklama" HeaderText="Açıklama" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
        <br />
    <asp:Button ID="btnYeni" runat="server" Text="Yeni Altkategori" Width="114px" CssClass="bluebutton" OnClick="btnYeni_Click" />
    <br />
    <asp:Panel ID="pnlGiris" runat="server">
        <table>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="AltKategori Adı"></asp:Label></td>
                <td><asp:TextBox ID="txtAltkategoriAdi" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Açıklama"></asp:Label></td>
                <td><asp:TextBox ID="txtAciklama" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" Width="60px" CssClass="bluebutton" OnClick="btnKaydet_Click" />
                    &nbsp;<asp:Button ID="btnDegistir" runat="server" Text="Değiştir" Width="60px" CssClass="bluebutton" OnClick="btnDegistir_Click" />
                    &nbsp;<asp:Button ID="btnSil" runat="server" Text="Sil" Width="60px" CssClass="bluebutton" OnClick="btnSil_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
