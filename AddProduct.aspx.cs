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
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddProduct_Click(object sender, EventArgs e)
        {
            myDAL objmyDAL = new myDAL();
            String InputPname = Pname.Text;
            int InputPstock = Convert.ToInt32(Pstock.Text);
            int InputPrice = Convert.ToInt32(Price.Text);
            String InputCat = category.Text;
            String InputEmail = Session["user"].ToString();

            int found;
            found = objmyDAL.AddProduct_DAL(InputPname, InputEmail, InputPstock, InputPrice, InputCat);
            if (found == -1)
            {
                MessageBP.Text = "Unsuccessful. Try Again";
            }
            else
            {
                if (found == 1)
                    MessageBP.Text = "Product added successfully";

            }
        }
    }



}