<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="webSaglikProjesi.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script type="text/javascript">
            var baslikText = this.document.getElementById("baslik");
            baslikText.innerText = "Ürün Detayları";
    </script>
    <center>
        <div>
        <asp:DataList ID="dlstUrunler" runat="server" RepeatColumns="1" Width="505px" DataKeyField="urunid" OnItemCommand="dlstUrunler_ItemCommand">
            <ItemTemplate>
                <div>
                    <asp:Label ID="lblUrunAdi" runat="server" Text='<%#Eval("urunad") %>'></asp:Label><br />
                    <asp:ImageButton ID="imgResim" ImageUrl='<%#Eval("resimyolu2") %>' runat="server" Width="220px" Height="240px" AlternateText='<%#Eval("urunad") %>' /><br />
                    <asp:Label ID="lblFiyat" runat="server" Text='<%#Eval("urunfiyat") %>'></asp:Label>
                    <asp:TextBox ID="txtAdet" Text="1" Width="20px" runat="server"></asp:TextBox><br />
                    <asp:Button ID="btnEkle" runat="server" Text="Sepete Ekle" CommandName="sepet" />
                    <br /><br />
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("urunbilgisi") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div></center>
</asp:Content>
