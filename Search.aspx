<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyAmazon.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
     <style type="text/css">
        div {
            font-family: cambria;
            color: antiquewhite;
            text-align: center;
        }

        p {
            font-size: large;
            text-align: center;
            color: antiquewhite;

        }
    </style>

    <form runat ="server">
        <h1> Enter a Product Name to Search</h1>
        <asp:textbox id ="name" runat="server"></asp:textbox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Enter a valid product name to search" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:button class ="btn" runat="server" text="Search" onclick ="loadproducts" />
        <br /><br />

        <asp:gridview id ="list" style="margin: 0px auto" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="702px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:gridview>

         <div>

             <h1>Buy Product</h1> <br />
                <p>Product ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="PID" CssClass="txtbox" runat="server" Width="205px"></asp:TextBox>
                    
                </p>
                <p>&nbsp;</p>
                <p>Product Quantity&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="PQuant" CssClass="txtbox" runat="server" Width="206px"></asp:TextBox>
                    
                </p>
                <p>&nbsp;</p>
                <p><asp:Button ID="BuyProduct" CssClass="btn" runat="server" Text="Buy Product" Height="44px" Width="339px" OnClick="BuyButton_Click" /></p>
             <br />
            <asp:Label ID="MessageBP" runat="server" CssClass="auto-style10" Text=""></asp:Label>

        </div>

    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
