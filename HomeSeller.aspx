<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="HomeSeller.aspx.cs" Inherits="MyAmazon.HomeSeller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <form>
        <div style ="padding-left: 30px">
            <h1>Welcome</h1>
            <br />
            <asp:Label ID="welcome" runat="server" Text=""></asp:Label>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
