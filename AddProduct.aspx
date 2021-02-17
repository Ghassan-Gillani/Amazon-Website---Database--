<%@ Page Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MyAmazon.AddProduct" %>

<%--<!DOCTYPE html>--%>

<asp:Content ID="content2" ContentPlaceHolderID="content" runat="server">
    <style type="text/css">
        div {
            font-family: cambria;
            text-align: center;
        }

        p {
            font-size: large;
            text-align: center;
        }
    </style>


    <form runat="server">
        <div >

            <p>Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp 
                      <asp:DropDownList ID="category" runat="server" Width="201px">
                          <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                          <asp:ListItem Text="Electronics" Value="Electronics"></asp:ListItem>
                          <asp:ListItem Text="Cellphones" Value="Cellphones"></asp:ListItem>
                          <asp:ListItem Text="Cosmetics" Value="Cosmetics"></asp:ListItem>
                      </asp:DropDownList>
            </p><br />
            <p>Product Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:TextBox ID="Pname" CssClass="txtbox" runat="server" Width="205px"></asp:TextBox></p>
            <p>&nbsp;</p>
            <p>Product Stock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Pstock" CssClass="txtbox" runat="server" Width="206px"></asp:TextBox></p>
            <p>&nbsp;</p>
            <p>Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Price" CssClass="txtbox" runat="server" Width="206px"></asp:TextBox></p>
            <p>&nbsp;</p>

            <p>
                <asp:Button ID="AddP" CssClass="btn" runat="server" Text="Add Product" Height="44px" OnClick="AddProduct_Click" Width="339px" /></p>
            <br />
            <asp:Label ID="MessageBP" runat="server" CssClass="auto-style10" Text=""></asp:Label>

        </div>

    </form>
</asp:Content>
