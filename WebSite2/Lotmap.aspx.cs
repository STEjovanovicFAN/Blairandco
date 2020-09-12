using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridView();
    }

    protected void BindGridView()
    {
        var db = new DataClassesDataContext();
        //Using Linq query  
        GridView1.DataSource = (from a in db.Lots select a).ToList();
        GridView1.DataBind();
        // OR  
        //Direct Using ToList   
        GridView1.DataSource = db.Lots.ToList();
        GridView1.DataBind();
    }
}