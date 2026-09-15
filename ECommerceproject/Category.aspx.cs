using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ECommerceproject
{
    public partial class Category : System.Web.UI.Page
    {
        DBConnection dbobj = new DBConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string categoryName = txtCategoryName.Text.Trim();

            if (string.IsNullOrEmpty(categoryName))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please enter a category name";
                return;
            }

            if (!fuCategoryPhoto.HasFile)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please select a category photo";
                return;
            }

            string p = "~/Phs/" + fuCategoryPhoto.FileName;

            fuCategoryPhoto.SaveAs(Server.MapPath(p));

            string safeName = categoryName.Replace("'", "''");
            string safePath = p.Replace("'", "''");

            string query = "insert into Category ([category name], [photo]) values('" +
                            safeName + "', '" + safePath + "')";

            int i = dbobj.fn_nonquery(query);

            if (i > 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Category added successfully";
                txtCategoryName.Text = "";
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Failed to add category";
            }
        }
    }
}