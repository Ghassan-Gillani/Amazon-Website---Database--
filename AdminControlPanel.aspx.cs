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
    public partial class AdminControlPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["type"]) != 3)
            {
                Response.Redirect("./Login.aspx");
            }
            else
            {
                loadDetails();
            }
        }
        public void loadDetails()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            if (Session["type"] != null) // means currently admin
            {
                string Email = Session["user"].ToString();
                Details.DataSource = objDAL.GetAdminDetails_DAL(Email);
                Details.DataBind();
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
        protected void AdminEdit(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            Details.EditIndex = e.NewEditIndex;
            loadDetails();
        }
        protected void CancelEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Details.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            Details.EditIndex = -1;
            loadDetails();
        }

        protected void AdminUpdate(Object sender, GridViewUpdateEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows

            GridViewRow row = Details.Rows[e.RowIndex];


            //retrieve roll number from that row (key-non editable)
            int ID = Convert.ToInt32(row.Cells[1].Text.ToString());
            //get the new values from that row
            string NewName = e.NewValues["Name"].ToString(); ;
            string NewAddress = e.NewValues["Address"].ToString();
            string NewCity = e.NewValues["City"].ToString();
            string NewCountry = e.NewValues["Country"].ToString();
            string NewPassword = e.NewValues["Password"].ToString();

            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            int result = objMyDal.UpdateAdmin_DAL(ID, NewName, NewAddress, NewCity, NewCountry, NewPassword);
            //reload the page======================================================
            Details.EditIndex = -1;
            loadDetails();
        }
    }
    
}