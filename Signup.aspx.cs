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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected int UserType_SelectedIndexChanged(object sender, EventArgs e)
        //{
          //  int ret=0;



            //return ret;
        //}


        protected void SignupButton_Click(object sender, EventArgs e)
        {
            myDAL objmyDAL = new myDAL();
            String InputEmail = Email.Text;
            String InputPassword = Password.Text;
            String InputName = FullName.Text;
            String InputAddress = Address.Text;
            String InputCity = City.Text;
            String InputCountry = Country.Text;
            String InputUsertype = UserType.Text;
           
            int found;
            found = objmyDAL.Signup_DAL(InputName, InputEmail, InputPassword, InputAddress, InputCity, InputCountry, InputUsertype);
            if (found == -1)
            {
                Message.Text = "Unsuccessful Signup. Try Again";
            }
            else
            {
                if (found == 1)
                    Message.Text = "Email already in use. User exists. You need to login";
                else if (found == 2)
                    Message.Text = "Signup Successful";
                else if (found == 3)
                    Message.Text = "Continue to Guest Mode without signing up";

            }
        }
        
    }

}