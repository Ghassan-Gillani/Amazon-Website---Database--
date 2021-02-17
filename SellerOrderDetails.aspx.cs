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
    public partial class SellerOrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            welcome1.Text = Convert.ToString(Session["user"]);
            load();
        }
        public void load()
        {
            if (Session["user"] != null)
            {
                myDAL objmyDAL = new myDAL();
                String InputEmail = Session["user"].ToString();

                list.DataSource = objmyDAL.SellerOrderDetails_DAL(InputEmail);
                list.DataBind();
            }
        }
    }
}