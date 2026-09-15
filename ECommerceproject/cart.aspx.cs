using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceproject
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            DataTable dtCart = Session["Cart"] as DataTable;
            
            if (dtCart == null || dtCart.Rows.Count == 0)
            {
                pnlEmpty.Visible = true;
                rptCart.Visible = false;
                lblCartCount.Text = "0";
                lblItemCount.Text = "0";
                lblTotalPrice.Text = "0";
                lblGrandTotal.Text = "0";
                return;
            }

            pnlEmpty.Visible = false;
            rptCart.Visible = true;
            rptCart.DataSource = dtCart;
            rptCart.DataBind();

            int totalItems = 0;
            decimal totalPrice = 0;

            foreach (DataRow row in dtCart.Rows)
            {
                int qty = (int)row["Quantity"];
                decimal price = (decimal)row["Price"];
                totalItems += qty;
                totalPrice += (qty * price);
            }

            lblCartCount.Text = dtCart.Rows.Count.ToString();
            lblItemCount.Text = totalItems.ToString();
            lblTotalPrice.Text = totalPrice.ToString("0.00");
            lblGrandTotal.Text = totalPrice.ToString("0.00");
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dtCart = Session["Cart"] as DataTable;
            if (dtCart == null) return;

            int productId = Convert.ToInt32(e.CommandArgument);

            for (int i = 0; i < dtCart.Rows.Count; i++)
            {
                DataRow row = dtCart.Rows[i];
                if ((int)row["ProductID"] == productId)
                {
                    int qty = (int)row["Quantity"];
                    int stock = (int)row["Stock"];

                    if (e.CommandName == "Plus")
                    {
                        if (qty < stock)
                            row["Quantity"] = qty + 1;
                    }
                    else if (e.CommandName == "Minus")
                    {
                        if (qty > 1)
                            row["Quantity"] = qty - 1;
                    }
                    else if (e.CommandName == "Remove")
                    {
                        dtCart.Rows.RemoveAt(i);
                    }
                    break;
                }
            }

            Session["Cart"] = dtCart;
            LoadCart();
        }
    }
}
