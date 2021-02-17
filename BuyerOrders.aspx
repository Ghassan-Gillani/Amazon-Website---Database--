<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="BuyerOrders.aspx.cs" Inherits="MyAmazon.BuyerOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <form runat ="server">
        <div style ="padding-left: 30px">
            <h1>My Orders</h1><br />
            <p runat="server" style="text-align:center"><asp:label id = "Message" style="text-align:center;color:antiquewhite;font-size=150%" runat="server" text=""></asp:label>
               </p> 
                <asp:GridView ID="Orders" runat="server" DataKeyNames="Date,BuyerID,OrderNo,ProductID,ProductName,SellerID,SellersName,Quantity,PriceOfItem,TotalAmount" EnableViewState="false" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateEditButton="true" OnRowEditing ="OrderEdit" OnRowCancelingEdit="CancelEdit" OnRowUpdating="RatingAdd" style="margin:0px auto; text-align: center;" Width="657px">
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
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
