using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyAmazon.DAL;

namespace MyAmazon
{
    public partial class HomeSeller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            welcome.Text = Convert.ToString(Session["user"]);
        }
    }
}