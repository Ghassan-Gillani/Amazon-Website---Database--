<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="SellerProfile.aspx.cs" Inherits="MyAmazon.SellerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div runat="server" style="padding-left:30px">
        <h1>My Profile</h1>
           <br />
            <asp:GridView ID="Sellers" runat="server" EnableViewState="false" DataKeyNames="ID,Email" CellPadding="4" ForeColor="#333333" GridLines="None"  AutoGenerateEditButton="true" OnRowEditing="SellerEdit" OnRowCancelingEdit="CancelEdit" OnRowUpdating="SellersUpdate" style="text-align: center" Width="778px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                
            </asp:GridView><br /><br />
             <asp:Button runat ="server" CssClass ="btn" style="float:left;" Text="Logout" onclick ="logout"/>
        </div>
</form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>

