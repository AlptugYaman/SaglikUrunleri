<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="webSaglikProjesi.UrunEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" DataTextField="kategoriad" DataValueField="id" Height="20px" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged" Width="129px">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlAltKategoriler" runat="server" AutoPostBack="True" DataTextField="altkategoriad" DataValueField="id" Height="24px" OnSelectedIndexChanged="ddlAltKategoriler_SelectedIndexChanged" Width="168px">
    </asp:DropDownList>
    <br />
    <asp:GridView ID="gvUrunler" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="urunid" ForeColor="#333333" GridLines="None" Width="500px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" HeaderText="Seç" SelectText="&gt;&gt;" ShowSelectButton="True" />
            <asp:BoundField DataField="urunkodu" HeaderText="Kodu" />
            <asp:BoundField DataField="urunad" HeaderText="Ürün Ad" />
            <asp:BoundField DataField="miktar" HeaderText="Miktar">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="urunfiyat" HeaderText="Fiyat">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="urunbilgisi" HeaderText="Ürün Bilgisi" Visible="False" />
            <asp:BoundField DataField="resimyolu1" HeaderText="ResimYolu1" Visible="False" />
            <asp:BoundField DataField="resimyolu2" HeaderText="Resim Yolu2" Visible="False" />
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
    <asp:Button ID="btnYeni" runat="server" Text="Yeni Ürün Ekle" Width="114px" CssClass="bluebutton" OnClick="btnYeni_Click" />
    <br />
    <asp:Panel ID="pnlGiris" runat="server">
        <table>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Ürün Kodu"></asp:Label></td>
                <td><asp:TextBox ID="txtUrunKodu" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Ürün Adı"></asp:Label></td>
                <td><asp:TextBox ID="txtUrunAdi" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Ürün Bilgisi"></asp:Label></td>
                <td><asp:TextBox ID="txtUrunBilgisi" runat="server" Height="59px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Miktar"></asp:Label></td>
                <td><asp:TextBox ID="txtMiktar" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="Fiyat"></asp:Label></td>
                <td><asp:TextBox ID="txtFiyat" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Küçük Resim"></asp:Label></td>
                <td>
                    <asp:FileUpload ID="fuResim1" runat="server" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label7" runat="server" Text="Büyük Resim"></asp:Label></td>
                <td>
                    <asp:FileUpload ID="fuResim2" runat="server" />
                </td>
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
