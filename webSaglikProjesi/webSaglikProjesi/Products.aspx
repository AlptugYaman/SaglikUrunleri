<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="webSaglikProjesi.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
            var baslikText = this.document.getElementById("baslik");
            baslikText.innerText = "Ürünler";
    </script>
        <div>
        <asp:DataList ID="dlstUrunler" runat="server" RepeatColumns="3" Width="505px" DataKeyField="urunid" OnItemCommand="dlstUrunler_ItemCommand">
            <ItemTemplate>
                <div>
                    <asp:Label ID="lblUrunAdi" runat="server" Text='<%#Eval("urunad") %>'></asp:Label><br />
                    <asp:ImageButton ID="imgResim" ImageUrl='<%#Eval("resimyolu1") %>' runat="server" Width="100px" Height="120px" AlternateText='<%#Eval("urunad") %>' CommandName="detay" CommandArgument='<%#Eval("urunid") %>' /><br />
                    <asp:Label ID="lblFiyat" runat="server" Text='<%#Eval("urunfiyat") %>'></asp:Label>
                    <asp:TextBox ID="txtAdet" Text="1" Width="20px" runat="server"></asp:TextBox><br />
                    <asp:ImageButton ID="btnEkle" runat="server" CommandName="sepet" ImageUrl="~/images/btnSepeteAt.png" />
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
