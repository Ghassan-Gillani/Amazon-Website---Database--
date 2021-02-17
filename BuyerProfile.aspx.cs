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
    public partial class BuyerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["type"]) != 1)
            {
                Response.Redirect("./Login.aspx");
            }
            else
            {
                loadBuyers();
            }
        }
        public void loadBuyers()
        {
            if (Session["user"] != null)
            {
                String curremail = Session["user"].ToString();
                //this function will load the data into grid
                myDAL objDAL = new myDAL();
                buyerslist.DataSource = objDAL.BuyerProfile_DAL(curremail);
                buyerslist.DataBind();
            }
        }
        protected void logout(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Session["user"] = null;
                Session["type"] = null;
                Response.Redirect("./Home.aspx");
            }
        }

        protected void BuyersEditing(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            buyerslist.EditIndex = e.NewEditIndex;
            loadBuyers();
        }
        
        protected void BuyersCancellingEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = buyerslist.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            buyerslist.EditIndex = -1;
            loadBuyers();
        }

        protected void BuyersUpdate(Object sender, GridViewUpdateEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows

            GridViewRow row = buyerslist.Rows[e.RowIndex];


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
            int result = objMyDal.UpdateBuyers_DAL(ID, NewName, NewAddress, NewCity, NewCountry, NewPassword, NewAmount);
            //reload the page======================================================
            buyerslist.EditIndex = -1;
            loadBuyers();
        }
   
     

    }
}