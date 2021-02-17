using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyAmazon.DAL;
using System.Data;

namespace MyAmazon
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            myDAL objmyDAL = new myDAL();
            String InputEmail = Email.Text;
            String InputPassword = Password.Text;

            Session["type"] = null;
            Session["user"] = null;

            DataTable DT = new DataTable();
            int found;
            found = objmyDAL.Logincheck_DAL(InputEmail, InputPassword);
            if (found == -1)
            {
                Message.Text = "There is no user found. You need to signup";
            }
            else
            {
                if (found == 0)
                    Message.Text = "Incorrect password";
                else if (found == 1)
                {
                    Message.Text = "You are a buyer";
                    Session["type"] = 1;
                    Session["user"] = InputEmail;

                    Response.Redirect("./Home.aspx");
                }
                else if (found == 2)
                {
                    Message.Text = "You are a seller";
                    Session["type"] = 2;
                    Session["user"] = InputEmail;

                    Response.Redirect("./HomeSeller.aspx");
                }
                else if (found == 3)
                {
                    Message.Text = "You are an admin";
                    Session["type"] = 3;
                    Session["user"] = InputEmail;

                    Response.Redirect("./Homeadmin.aspx");
                }
            }
        }
    }
}