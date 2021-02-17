<%@ Page Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyAmazon.Login" %>

<%--<!DOCTYPE html>--%>

<asp:Content ID="content2" ContentPlaceHolderID="content" runat="server">
    <style type="text/css">
        div
        {
            font-family: cambria;
            color: antiquewhite;
            text-align: center;
        }
        p
        {
            font-size: large;
            text-align: center;
        }
    </style>


    <form id="form1" runat="server" >
        <div >
            <br /><br /><br />
            <h1 >Login Page</h1>
            <br /> <br /> <br />
            <p>
                Email Address
                <asp:TextBox ID="Email" CssClass="txtbox" runat="server"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Email Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Enter a Correct Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br /><br />
            <p>    
                 Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Password" TextMode="Password" CssClass="txtbox" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Password required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <br /><br />
            <p>
                <asp:Button ID="LoginButton" runat="server" CssClass="btn"  OnClick ="LoginButton_Click" Text="Login" Height="44px" Width="272px" style="margin-top: 11" />
            </p>
            <br /><br />
            <div>
                &nbsp;<asp:Label ID="Message" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>
