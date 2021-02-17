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
    public partial class RatingsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadRatings();
        }

        public void loadRatings()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            Ratings.DataSource = objDAL.GetRatingsList_DAL();
            Ratings.DataBind();
        }
        protected void RatingsDelete(Object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Ratings.Rows[e.RowIndex];


            //get roll number from that row
            int prodid = Convert.ToInt32(row.Cells[1].Text);
            int buyerid = Convert.ToInt32(row.Cells[4].Text);
            //Call the DAL function to delete the student with this roll number 
            myDAL objDAL = new myDAL();
            if (objDAL.RatingsDelete_DAL(prodid,buyerid) == 1)
            {
                loadRatings(); //reload the grid to show the modifications in table
            }


        }
    }
}