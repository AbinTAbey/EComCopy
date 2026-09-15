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
    public partial class user : System.Web.UI.Page
    {
        DBConnection dbobj = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string address = TextBox2.Text;
            string phone = TextBox3.Text;
            string email = TextBox4.Text;
            string password = TextBox5.Text;
            string confirmpassword = TextBox6.Text;

            if (password != confirmpassword)
            {
                Label1.Visible = true;
                Label1.Text = "Password and Confirm Password do not match";
                return;
            }

            string checkquery = "select count(*) from User_Reg where [username]='" + username + "'";
            string count = dbobj.fn_scalar(checkquery);
            if (count != "0")
            {
                Label1.Visible = true;
                Label1.Text = "Username already exists";
                return;
            }
            string idquery = "select isnull(max([user id]), 1000) + 1 from User_Reg";
            string userid = dbobj.fn_scalar(idquery);
            string query = "insert into User_Reg " +
                           "([user id], [username], [Address], [[Phone no], [Email], [password], [confirm password]) " +
                           "values(" + userid + ", '" + username + "', '" +
                           address + "', '" + phone + "', '" + email + "', '" + password + "', '" + confirmpassword + "')";
            int i = dbobj.fn_nonquery(query);
            Label1.Visible = true;
            if (i > 0)
            {
                Label1.Text = "Registration successful.  ";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
            }
            else
            {
                Label1.Text = "Registration failed";
            }
        }

    }
}