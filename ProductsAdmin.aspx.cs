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
    public partial class ProductsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadProducts();
        }

        public void loadProducts()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            Products.DataSource = objDAL.GetProductsList_DAL();
            Products.DataBind();
        }

        protected void ProductsEditing(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            Products.EditIndex = e.NewEditIndex;
            loadProducts();
        }
        protected void CancellingEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Products.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            Products.EditIndex = -1;
            loadProducts();
        }
        protected void ProductsDelete(Object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Products.Rows[e.RowIndex];


            //get roll number from that row
            int newid = Convert.ToInt32(row.Cells[1].Text);
            //Call the DAL function to delete the student with this roll number 
            myDAL objDAL = new myDAL();
            if (objDAL.ProductDelete_DAL(newid) == 1)
            {
                loadProducts(); //reload the grid to show the modifications in table
            }


        }
    }
}