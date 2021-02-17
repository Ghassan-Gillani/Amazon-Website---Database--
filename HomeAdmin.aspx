<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="MyAmazon.HomeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div style="padding-left: 30px" runat="server">
        <div>
       <h1>Welcome</h1>
        <asp:Label ID="welcome" runat="server" Text=""></asp:Label>
        </div>
   </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
