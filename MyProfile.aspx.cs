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
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] == null)
                Response.Redirect("./login.aspx");
        }
    }
}