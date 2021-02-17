using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyAmazon
{
    public partial class Seller : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["type"]) != 2)
            {
                Response.Redirect("./login.aspx");
            }
        }
    }
}