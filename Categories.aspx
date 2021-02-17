<%@ Page Title="Categories" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="MyAmazon.Categories" %>
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
    
        <h1 style ="text-align: center">Categories</h1> <br /> <br />

        <form runat ="server" style="text-align: center">
            <div style ="text-align:center">
        <asp:DropDownList ID="category" runat="server">
        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
        <asp:ListItem Text="Electronics" Value="Electronics"></asp:ListItem>
        <asp:ListItem Text="Cellphones" Value="Cellphones"></asp:ListItem>
        <asp:ListItem Text="Cosmetics" Value="Cosmetics"></asp:ListItem>
        </asp:DropDownList>
  
        <br /> <br />
            
        <asp:Button class="btn" ID="catload" Text="Submit" runat="server" OnClick="loadproducts" />        <br /><br />
        <asp:GridView ID ="categoriesview" runat ="server" AutoGenerateColumns ="true" EnableViewState="true" Style="margin: 0px auto" Width="702px"
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
             <div>

             <h1>Buy Product</h1> <br />
                <p>Product ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="PID" CssClass="txtbox" runat="server" Width="205px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PID" ErrorMessage="Enter a valid product ID" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p>&nbsp;</p>
                <p>Product Quantity&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="PQuant" CssClass="txtbox" runat="server" Width="206px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pQuant" ErrorMessage="Enter a valid product Quantity" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p>&nbsp;</p>
                <p><asp:Button ID="BuyProduct" CssClass="btn" runat="server" Text="Buy Product" Height="44px" Width="339px" OnClick="BuyButton_Click" /></p>
             <br />
            <asp:Label ID="MessageBP" runat="server" CssClass="auto-style10" Text=""></asp:Label>
       
        </div>
            </div>
        </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
