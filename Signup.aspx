<%@ Page Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MyAmazon.Signup" %>

<asp:Content ID="content2" ContentPlaceHolderID="content" runat="server">
    <style type="text/css">
        div {
            font-family: cambria;
            color: antiquewhite;
            text-align: center;
        }

        p {
            font-size: large;
            text-align: center;
        }
    .auto-style1 {
        text-align: center;
    }
    </style>

    <form id="form2" runat="server">
        <div>
            <br />
            <h1>Signup Page</h1>
            <p class="auto-style1">
                <br />
                <br />
                Full Name*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="FullName" CssClass="txtbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FullName" ErrorMessage="Full Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p>
                Email Address&nbsp;&nbsp;
                <asp:TextBox ID="Email" CssClass="txtbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" ErrorMessage="Email Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Enter a Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br />
            <p>
                Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               <asp:TextBox ID="Password" Type="Password" CssClass="txtbox" runat="server" Style="margin-left: 0"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>
                &nbsp;</p>
            <p class="auto-style1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               <asp:TextBox ID="ConfirmPassword" Type="Password" CssClass="txtbox" runat="server" Style="margin-left: 0"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ErrorMessage="Both Passwords Doesn't Match" ForeColor="Red" ControlToValidate="ConfirmPassword"></asp:CompareValidator>
            <br />
            <p>
                &nbsp;Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                
                <asp:TextBox ID="Address" CssClass="txtbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Address" ErrorMessage="Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p>
                City*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="City" CssClass="txtbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="City" ErrorMessage="City Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p>
                Country*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Country" CssClass="txtbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Country" ErrorMessage="Country Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p>
                User Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                <asp:DropDownList ID="UserType" runat="server" Height="25px" Width="210px" Style="margin-left: 0px">
                    <asp:ListItem Text="Buyer" Value="Buyer"></asp:ListItem>
                    <asp:ListItem Text="Seller" Value="Seller"></asp:ListItem>

                </asp:DropDownList>
            </p>
            <br />
            <p>
                <asp:Button ID="SignupButton" CssClass="btn" runat="server" OnClick="SignupButton_Click" Text="Signup" Height="44px" Width="339px" />
            </p>
            <br />
            <asp:Label ID="Message" runat="server" CssClass="auto-style10" Text=""></asp:Label>
        </div>
    </form>
</asp:Content>
