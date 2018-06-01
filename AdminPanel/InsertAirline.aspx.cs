using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertAirline : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmitAir_Click(object sender, EventArgs e)
    {

    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        String name = TxtNameU.Text;
        gridView.Visible = true;
        String Iden = String.IsNullOrEmpty(name) == true ? "%" : "%" + name + "%";
        String Squery = "select AirlineId,Name,Active from AirlineMaster where Name like '" + Iden + "'";
        DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(Squery);
        if (da != null && da.Tables != null && da.Tables[0].Rows.Count > 0)
        {
            gridView.DataSource = da;
            gridView.DataBind();
        }
    }
    protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridView.EditIndex = e.NewEditIndex;
        loadStores();
    }
    /*protected void fill()
    {
        String 
    }*/
    protected void loadStores()
    {

        String Iden = String.IsNullOrEmpty(TxtNameU.Text) == true ? "%" : "%" + TxtNameU.Text + "%";
        String Squery = "select AirlineId,Name,Active from AirlineMaster where Name like '" + Iden + "'";
        DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(Squery);

        int count = ds.Tables[0].Rows.Count;
        if (ds.Tables[0].Rows.Count > 0)
        {
            gridView.DataSource = ds;
            gridView.DataBind();
        }
    }
    protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = gridView.DataKeys[e.RowIndex].Values["AirlineId"].ToString();
        TextBox City = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtName");
        String query = "update AirlineMaster set Name='" + City.Text + "' where AirlineId='" + id + "'";
        int val = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(query);

        lblmsg.BackColor = System.Drawing.Color.Blue;
        lblmsg.ForeColor = Color.White;
        lblmsg.Text = id + "   Updated successfully........    ";
        gridView.EditIndex = -1;
        loadStores();
    }

    /* protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
     {

     }*/

    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridView.PageIndex = e.NewPageIndex;

        loadStores();
    }

    protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridView.EditIndex = -1;

        loadStores();
    }

    protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gridView.DataKeys[e.RowIndex].Values["AirlineId"].ToString();
        //Label lbldelid = (Label)gridView.Rows[e.RowIndex].FindControl("Id");
        String del = "delete from AirlineMaster where AirlineId='" + id + "'";
        // write yourQuery
        int value = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(del);
        loadStores();
    }

}