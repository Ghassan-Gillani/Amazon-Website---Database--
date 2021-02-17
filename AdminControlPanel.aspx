<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AdminControlPanel.aspx.cs" Inherits="MyAmazon.AdminControlPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div style ="padding-left:30px">
            <h1>My Profile</h1>
            <asp:GridView ID="Details" runat="server" DataKeyNames="id,email" EnableViewState="false" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateEditButton="true" OnRowEditing ="AdminEdit" OnRowCancelingEdit="CancelEdit" OnRowUpdating="AdminUpdate" style="text-align: center" Width="657px">
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
