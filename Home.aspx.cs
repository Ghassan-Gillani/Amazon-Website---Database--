﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyAmazon.DAL;
using System.Data;


namespace MyAmazon
{
   
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
            Message.Text = "";
            Message1.Text = "";
            if (Session["user"] != null)
            {
                welcome.Text = Session["user"].ToString();
                Welcome1.Text = "Welcome to your Homepage";
            }
        }

        public void loadGrid()
        {
            //this function will load the data into grid
            myDAL objDAL = new myDAL();
            newarrivals.DataSource = objDAL.GetNewArrivals_DAL();
            newarrivals.DataBind();

            myDAL objDAL2 = new myDAL();
            Popular.DataSource = objDAL2.GetPopular_DAL();
            Popular.DataBind();

        }
        protected void BuyButton_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (PID.Text != "" && PQuant.Text != "")
                {

                    String InputProductID1 = PID.Text;
                    String InputQuantity1 = PQuant.Text;
                    myDAL objmyDAL = new myDAL();
                    int InputProductID = Convert.ToInt32(InputProductID1);
                    int InputQuantity = Convert.ToInt32(InputQuantity1);


                    if (Session["user"] != null)
                    {
                        String BuyerEmail = Session["user"].ToString();
                        //String BuyerEmail = "'" + BuyerEmail1 + "'";
                        int found;
                        found = objmyDAL.BuyProduct_DAL(InputProductID, InputQuantity, BuyerEmail);
                        if (found == 1)
                            MessageBP.Text = "Product bought successfuly. Thank you for purchasing from us!";
                        else if (found == -1)
                            MessageBP.Text = "Can not make a purchase. Your required quantity is more than available stock'";
                        else if (found == -2)
                            MessageBP.Text = "You do not have enough balance to purchase this product";
                        else if (found == -3)
                            MessageBP.Text = "Sorry. This product does not exist.";
                        else if (found == -5)
                            MessageBP.Text = "Sorry. Some unknown error occured.";
                    }
                }
            }
            else
                MessageBP.Text = "You need to be logged in to our website to buy a product. Please loging or in case of new user, just signup!";
        }
    }

    

}