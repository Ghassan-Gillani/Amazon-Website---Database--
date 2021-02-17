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
    public partial class BuyerOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                loadOrders();
            }
            else
            {
                Message.Text = "Please signup or login to an existing account";
            }
        }
        public void loadOrders()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            if (Session["type"] != null) // means currently buyer
            {
                string Email = Session["user"].ToString();
                Orders.DataSource = objDAL.GetBuyerOrders_DAL(Email);
                Orders.DataBind();
            }
        }
        protected void OrderEdit(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            Orders.EditIndex = e.NewEditIndex;
            loadOrders();
        }
        protected void CancelEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Orders.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            Orders.EditIndex = -1;
            loadOrders();
        }
        protected void RatingAdd(Object sender, GridViewUpdateEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows

            GridViewRow row = Orders.Rows[e.RowIndex];


            //retrieve roll number from that row (key-non editable)
            int PID = Convert.ToInt32(row.Cells[3].Text.ToString());
            int BID = Convert.ToInt32(row.Cells[4].Text.ToString());
            //get the new values from that row
            string rate = e.NewValues["Rating"].ToString();
            int rating = Convert.ToInt32(rate);
            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            int result = objMyDal.AddRating_DAL(PID,BID,rating);
            if (result == 1)
            {
                Message.Text = "Rating successfully added";
            }
            else if (result == 2)
            {
                Message.Text = "Ratings successfully updated";
            }
            else if ( result == -1)
            {
                Message.Text = "Please enter a value between 1-5";
            }
            //reload the page======================================================
            Orders.EditIndex = -1;
            loadOrders();
        }
    }
}