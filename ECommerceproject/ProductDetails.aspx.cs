using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceproject
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        DBConnection dbobj = new DBConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string pdtid = Request.QueryString["pdtid"];
                if (!string.IsNullOrEmpty(pdtid))
                    LoadProduct(pdtid);
            }
        }

        private void LoadProduct(string pdtid)
        {
            int id;
            if (!int.TryParse(pdtid, out id)) return;

            string query =
                "SELECT P.[product id], P.[product name], P.[description], " +
                "P.[price], P.[quantity], P.[image], C.[category name] " +
                "FROM Product P " +
                "INNER JOIN Category C ON P.[category id] = C.[category id] " +
                "WHERE P.[product id] = " + id;

            DataTable dt = dbobj.fn_adapterTable(query);

            if (dt == null || dt.Rows.Count == 0) return;

            DataRow row = dt.Rows[0];

            string imagePath = row["image"].ToString();
            string resolvedImage = string.IsNullOrEmpty(imagePath) ? "./assets/image/1.jpeg" : imagePath;
            
            zoom_01.ImageUrl = resolvedImage;
            zoom_01.AlternateText = row["product name"].ToString();
            zoom_01.Attributes["data-zoom-image"] = Page.ResolveUrl(resolvedImage);

            lblProductName.Text  = row["product name"].ToString();
            lblPrice.Text        = row["price"].ToString();
            lblDescription.Text  = row["description"].ToString();
            
            int qty = 0;
            int.TryParse(row["quantity"].ToString(), out qty);
            
            if (qty > 0)
            {
                lblQuantity.Text = "In Stock";
                lblQuantity.CssClass = "text-green-600 font-bold";
                lnkAddToCart.Enabled = true;
                lnkBuyNow.Enabled = true;
            }
            else
            {
                lblQuantity.Text = "Out of Stock";
                lblQuantity.CssClass = "text-red-600 font-bold";
                lnkAddToCart.Enabled = false;
                lnkBuyNow.Enabled = false;
            }

            imgThumbnail1.ImageUrl = zoom_01.ImageUrl;
            imgThumbnail1.AlternateText = zoom_01.AlternateText;
            
            // Store product details in ViewState for cart addition
            ViewState["pdtid"] = id;
            ViewState["pdtname"] = row["product name"].ToString();
            ViewState["price"] = row["price"].ToString();
            ViewState["image"] = resolvedImage;
            ViewState["stock"] = qty;
        }

        protected void lnkAddToCart_Click(object sender, EventArgs e)
        {
            AddToCart();
            Response.Redirect("cart.aspx");
        }

        protected void lnkBuyNow_Click(object sender, EventArgs e)
        {
            AddToCart();
            Response.Redirect("cart.aspx");
        }

        private void AddToCart()
        {
            if (ViewState["pdtid"] == null) return;
            
            int pdtid = (int)ViewState["pdtid"];
            string name = ViewState["pdtname"].ToString();
            decimal price = Convert.ToDecimal(ViewState["price"]);
            string image = ViewState["image"].ToString();
            int stock = (int)ViewState["stock"];

            DataTable dtCart = Session["Cart"] as DataTable;
            if (dtCart == null)
            {
                dtCart = new DataTable();
                dtCart.Columns.Add("ProductID", typeof(int));
                dtCart.Columns.Add("ProductName", typeof(string));
                dtCart.Columns.Add("Image", typeof(string));
                dtCart.Columns.Add("Price", typeof(decimal));
                dtCart.Columns.Add("Quantity", typeof(int));
                dtCart.Columns.Add("Stock", typeof(int));
            }

            bool found = false;
            foreach (DataRow row in dtCart.Rows)
            {
                if ((int)row["ProductID"] == pdtid)
                {
                    int currentQty = (int)row["Quantity"];
                    if (currentQty < stock)
                    {
                        row["Quantity"] = currentQty + 1;
                    }
                    found = true;
                    break;
                }
            }

            if (!found)
            {
                if (stock > 0)
                {
                    dtCart.Rows.Add(pdtid, name, image, price, 1, stock);
                }
            }

            Session["Cart"] = dtCart;
        }
    }
}
