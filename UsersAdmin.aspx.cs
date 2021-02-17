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
    public partial class UsersAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadBuyers();
            loadSellers();
            loadAdmins();
        }
        public void loadBuyers()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            Buyers.DataSource = objDAL.GetBuyersList_DAL();
            Buyers.DataBind();
        }

        public void loadSellers()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            Sellers.DataSource = objDAL.GetSellersList_DAL();
            Sellers.DataBind();
        }
        public void loadAdmins()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            Admins.DataSource = objDAL.GetAdminsList_DAL();
            Admins.DataBind();
        }

        protected void BuyersEditing(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            Buyers.EditIndex = e.NewEditIndex;
            loadBuyers();
        }


        protected void SellersEditing(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            Sellers.EditIndex = e.NewEditIndex;
            loadSellers();
        }
        protected void BuyersCancellingEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Buyers.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            Buyers.EditIndex = -1;
            loadBuyers();
        }

        protected void SellersCancellingEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Sellers.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            Sellers.EditIndex = -1;
            loadSellers();
        }

        protected void BuyersUpdate(Object sender, GridViewUpdateEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows

            GridViewRow row = Buyers.Rows[e.RowIndex];


            //retrieve roll number from that row (key-non editable)
            int ID = Convert.ToInt32(row.Cells[1].Text.ToString());
            //get the new values from that row
            string NewName = e.NewValues["Name"].ToString(); ;
            string NewAddress = e.NewValues["Address"].ToString();
            string NewCity = e.NewValues["City"].ToString();
            string NewCountry = e.NewValues["Country"].ToString();
            string NewPassword = e.NewValues["Password"].ToString();
            string temp = e.NewValues["BuyerAmount"].ToString();
            int NewAmount = Convert.ToInt32(temp);

            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            int result = objMyDal.UpdateBuyers_DAL(ID,NewName,NewAddress,NewCity,NewCountry,NewPassword,NewAmount);
            //reload the page======================================================
            Buyers.EditIndex = -1;
            loadBuyers();
        }
        protected void SellersUpdate(Object sender, GridViewUpdateEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows

            GridViewRow row = Sellers.Rows[e.RowIndex];


            //retrieve roll number from that row (key-non editable)
            int ID = Convert.ToInt32(row.Cells[1].Text.ToString());
            //get the new values from that row
            string NewName = e.NewValues["Name"].ToString(); ;
            string NewAddress = e.NewValues["Address"].ToString();
            string NewCity = e.NewValues["City"].ToString();
            string NewCountry = e.NewValues["Country"].ToString();
            string NewPassword = e.NewValues["Password"].ToString();
            string temp = e.NewValues["SellerAmount"].ToString();
            int NewAmount = Convert.ToInt32(temp);

            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            int result = objMyDal.UpdateSellers_DAL(ID, NewName, NewAddress, NewCity, NewCountry, NewPassword, NewAmount);
            //reload the page======================================================
            Sellers.EditIndex = -1;
            loadSellers();
        }
        protected void BuyersDelete(Object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Buyers.Rows[e.RowIndex];


            //get roll number from that row
            int newid =  Convert.ToInt32(row.Cells[1].Text);
            //Call the DAL function to delete the student with this roll number 
            myDAL objDAL = new myDAL();
            if (objDAL.BuyersDelete_DAL(newid)==1)
            {
                loadBuyers(); //reload the grid to show the modifications in table
            }
            

        }
        protected void SellersDelete(Object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Sellers.Rows[e.RowIndex];


            //get roll number from that row
            int newid = Convert.ToInt32(row.Cells[1].Text);
            //Call the DAL function to delete the student with this roll number 
            myDAL objDAL = new myDAL();
            if (objDAL.SellersDelete_DAL(newid) == 1)
            {
                loadSellers(); //reload the grid to show the modifications in table
            }
        }
        protected void AddAdmin(object sender, EventArgs e)
        {
            myDAL objmyDAL = new myDAL();
            String InputEmail = Email.Text;
            String InputPassword = Password.Text;
            String InputName = FullName.Text;
            String InputAddress = Address.Text;
            String InputCity = City.Text;
            String InputCountry = Country.Text;

            int found;
            found = objmyDAL.AddAdmin_DAL(InputName, InputEmail, InputPassword, InputAddress, InputCity, InputCountry);
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

            }
            loadAdmins();
        }

    }
}
