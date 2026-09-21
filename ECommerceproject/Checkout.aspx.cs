using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ECommerceproject
{
    public partial class Checkout : System.Web.UI.Page
    {
        DBConnection dbobj = new DBConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserInfo();
                LoadCartSummary();
            }
        }

        private void LoadUserInfo()
        {
            string username = Session["Username"] as string;

            if (!string.IsNullOrEmpty(username))
            {
                string safeUsername = username.Replace("'", "''");
                string query = "SELECT [user id], [username], [Address], [[Phone no], [Email] FROM User_Reg WHERE username = '" + safeUsername + "'";
                
                SqlDataReader dr = dbobj.fn_reader(query);
                if (dr.Read())
                {
                    string phone = dr["[Phone no"].ToString();
                    string address = dr["Address"].ToString();
                    string email = dr["Email"].ToString();

                    lblLoginName.Text = username;
                    lblLoginPhone.Text = phone;
                    
                    lblLoginNameSaved.Text = username;
                    lblLoginPhoneSaved.Text = phone;

                    lblAddressNameSaved.Text = username;
                    lblAddressPhoneSaved.Text = phone;
                    lblAddressEmailSaved.Text = email;
                    
                    if (Session["TempDeliveryAddress"] != null)
                    {
                        lblAddressFullSaved.Text = Session["TempDeliveryAddress"].ToString();
                    }
                    else
                    {
                        lblAddressFullSaved.Text = address;
                    }

                    // Pre-fill delivery form
                    txtName.Text = username;
                    txtMobile.Text = phone;
                    txtAddress.Text = address;
                    txtEmail.Text = email;
                }
                dr.Close();
            }
            else
            {
                lblLoginName.Text = "Not signed in";
                lblLoginPhone.Text = "";
            }
        }

        private void LoadCartSummary()
        {
            DataTable dtCart = Session["Cart"] as DataTable;

            if (dtCart == null || dtCart.Rows.Count == 0)
            {
                rptReviewCart.Visible = false;
                pnlEmptyCart.Visible = true;
                lblItemCount.Text = "0";
                lblSubTotal.Text = "0.00";
                lblGrandTotal.Text = "0.00";
                lblReviewItemCount.Text = "0 items";
                return;
            }

            pnlEmptyCart.Visible = false;
            rptReviewCart.Visible = true;
            rptReviewCart.DataSource = dtCart;
            rptReviewCart.DataBind();

            int totalItems = 0;
            decimal subTotal = 0;

            foreach (DataRow row in dtCart.Rows)
            {
                int qty = Convert.ToInt32(row["Quantity"]);
                decimal price = Convert.ToDecimal(row["Price"]);
                totalItems += qty;
                subTotal += qty * price;
            }

            decimal deliveryCharge = 40m; // Static for now as per HTML
            decimal grandTotal = subTotal + deliveryCharge;

            lblItemCount.Text = totalItems.ToString();
            lblSubTotal.Text = subTotal.ToString("0.00");
            lblGrandTotal.Text = grandTotal.ToString("0.00");
            lblReviewItemCount.Text = totalItems + " item(s)";
        }

        protected void btnChangeAddress_Click(object sender, EventArgs e)
        {
            pnlDeliverySaved.Visible = false;
            pnlDeliveryOptions.Visible = true;
            pnlAddNewAddress.Visible = false;
            pnlEditDetails.Visible = false;
        }

        protected void btnAddAddressOption_Click(object sender, EventArgs e)
        {
            pnlDeliveryOptions.Visible = false;
            pnlAddNewAddress.Visible = true;
        }

        protected void btnEditDetailsOption_Click(object sender, EventArgs e)
        {
            pnlDeliveryOptions.Visible = false;
            pnlEditDetails.Visible = true;
        }

        protected void btnSaveTempAddress_Click(object sender, EventArgs e)
        {
            string newAddress = txtAddress.Text;

            Session["TempDeliveryAddress"] = newAddress;
            lblAddressFullSaved.Text = newAddress;

            pnlAddNewAddress.Visible = false;
            pnlDeliverySaved.Visible = true;
        }

        protected void btnSaveDetails_Click(object sender, EventArgs e)
        {
            string currentUsername = Session["Username"] as string;
            if (string.IsNullOrEmpty(currentUsername)) return;

            string safeCurrentUsername = currentUsername.Replace("'", "''");
            string safeNewName = txtName.Text.Replace("'", "''");
            string safeMobile = txtMobile.Text.Replace("'", "''");
            string safeEmail = txtEmail.Text.Replace("'", "''");

            string query = "UPDATE User_Reg SET [username] = '" + safeNewName + "', [[Phone no] = '" + safeMobile + "', [Email] = '" + safeEmail + "' WHERE username = '" + safeCurrentUsername + "'";
            dbobj.fn_nonquery(query);

            Session["Username"] = txtName.Text;

            LoadUserInfo();

            pnlEditDetails.Visible = false;
            pnlDeliverySaved.Visible = true;
        }

        protected void btnContinueCheckout_Click(object sender, EventArgs e) { }
        protected void btnChangeLogin_Click(object sender, EventArgs e) { }
        protected void btnChangeCart_Click(object sender, EventArgs e) { }
        protected void btnContinueCart_Click(object sender, EventArgs e) { }
        protected void btnConfirmOrder_Click(object sender, EventArgs e) { }
    }
}
