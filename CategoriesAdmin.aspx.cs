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
    public partial class CategoriesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadCategories();
            loadCategoriesList();
        }

        public void loadCategories()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            Categories.DataSource = objDAL.GetCategories_DAL();
            Categories.DataBind();
        }
        public void loadCategoriesList()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            CategoriesList.DataSource = objDAL.GetCategoriesList_DAL();
            CategoriesList.DataBind();
        }
        protected void CategoriesEdit(object sender, GridViewEditEventArgs e)
        {

            //get the index of the row you ewant to delete and load the grid
            Categories.EditIndex = e.NewEditIndex;
            loadCategories();
        }
        protected void CancelEdit(Object sender, GridViewCancelEditEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows
            // collection of the GridView control.
            GridViewRow row = Categories.Rows[e.RowIndex];

            // The update operation was canceled. Display the 
            // primary key of the row. In this example, the primary
            // key is displayed in the second column of the GridView
            // control. To access the text of the column, use the Cells
            // collection of the row.
            String message = "Update for item " + row.Cells[1].Text + " " + row.Cells[2].Text + " Canceled.";
            //reload the grid and restore the data
            Categories.EditIndex = -1;
            loadCategories();
        }
        protected void CategoriesUpdate(Object sender, GridViewUpdateEventArgs e)
        {

            // Retrieve the row that raised the event from the Rows

            GridViewRow row = Categories.Rows[e.RowIndex];


            //retrieve roll number from that row (key-non editable)
            int ID = Convert.ToInt32(row.Cells[1].Text.ToString());
            //get the new values from that row
            string NewName = e.NewValues["CategoryName"].ToString(); ;

            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            int result = objMyDal.UpdateCategory_DAL(ID, NewName);
            //reload the page======================================================
            Categories.EditIndex = -1;
            loadCategories();
            loadCategoriesList();
        }

        protected void AddCategoryOnClick(Object sender, EventArgs e)
        {
            myDAL objmyDAL = new myDAL();
            String InputCid = CID.Text;
            String InputCname = CName.Text;
            
            int found=0;
            found = objmyDAL.AddCategory_DAL(InputCid,InputCname);
            if (found == -1)
            {
                Message.Text = "Category exists already";
            }
            else
            {
                if (found == 1)
                    Message.Text = "Category Added Successfully";
            }
            loadCategories();
            loadCategoriesList();

        }

    }
}