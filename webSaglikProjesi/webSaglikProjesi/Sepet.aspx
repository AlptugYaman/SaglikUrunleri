<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="webSaglikProjesi.Sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var baslikText = this.document.getElementById("baslik");
        baslikText.innerText = "Sepet Detayları";
    </script>
<center>
<div>
    <img src="images/sepetonay2.jpg" /><br />
    <br />
    <asp:GridView ID="gvSepet" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="431px" AutoGenerateColumns="False" DataKeyNames="sepetID" ShowFooter="True" OnRowDeleting="gvSepet_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="urunAd" HeaderText="Ürün Adı" />
            <asp:BoundField DataField="fiyat" HeaderText="Birim Fiyat">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="adet" HeaderText="Adet">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="tutar" HeaderText="Tutar">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:CommandField DeleteText="Sil" ShowDeleteButton="True" >
            <ControlStyle Font-Underline="True" />
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:CommandField>
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
    <asp:Button ID="btnTemizle" runat="server" Text="Sepeti Boşalt" Width="100px" OnClick="btnTemizle_Click" CssClass="bluebutton" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Button ID="btnDevam" runat="server" OnClick="btnDevam_Click" Text="Alışverişe Devam" Width="115px"   CssClass="bluebutton" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSatinAl" runat="server" OnClick="btnSatinAl_Click" Text="Satın Al" Width="98px"  CssClass="bluebutton"  />

</div>
</center>
</asp:Content>
