using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class Details : System.Web.UI.Page
    {
        SaglikUrunleriEntities ent = new SaglikUrunleriEntities();
        cSepet spt = new cSepet();
        int ID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ID = Convert.ToInt32(Request.QueryString["ID"]);
                VeriGetir();
            }
        }
        private void VeriGetir()
        {
            var Uruns = (from urun in ent.Urunler
                         where urun.urunid == ID
                         select new { urun.urunid, urun.urunad, urun.urunfiyat, urun.urunbilgisi, urun.resimyolu1, urun.resimyolu2 }).ToList();
            dlstUrunler.DataSource = Uruns;
            dlstUrunler.DataBind();

            if (Session["sepet"] != null)
            {
                DataTable dt = (DataTable)Session["sepet"];
                GridView sepetOzet = (GridView)this.Master.FindControl("gvSepetOzet");
                sepetOzet.Columns[0].FooterText = "Toplam:";
                sepetOzet.Columns[1].FooterText = string.Format("{0:#,##0.00}", ToplamTutarBul());
                sepetOzet.DataSource = dt;
                sepetOzet.DataBind();
            }
        }
        private decimal ToplamTutarBul()
        {
            decimal ToplamTutar = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamTutar += Convert.ToDecimal(dr["tutar"]);
            }
            return ToplamTutar;
        }
        private int ToplamAdetBul()
        {
            int ToplamAdet = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamAdet += Convert.ToInt32(dr["adet"]);
            }
            return ToplamAdet;
        }
        protected void dlstUrunler_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sepet")
            {
                dlstUrunler.SelectedIndex = e.Item.ItemIndex;
                if (Session["sepet"] == null)
                {
                    Session["sepet"] = spt.YeniSepet();
                }
                DataTable dt = (DataTable)Session["sepet"];
                DataRow dr;
                dr = dt.NewRow();
                dr["urunID"] = Convert.ToInt32(dlstUrunler.SelectedValue);
                Label UrunAdi = (Label)e.Item.FindControl("lblUrunAdi");
                dr["urunAd"] = UrunAdi.Text;
                Label Fiyat = (Label)e.Item.FindControl("lblFiyat");
                dr["fiyat"] = Convert.ToDecimal(Fiyat.Text);
                TextBox Adet = (TextBox)e.Item.FindControl("txtAdet");
                dr["adet"] = Convert.ToInt32(Adet.Text);
                dr["tutar"] = Convert.ToInt32(Adet.Text) * Convert.ToDecimal(Fiyat.Text);
                dt.Rows.Add(dr);
                Session["sepet"] = dt;

                Response.Redirect("Sepet.aspx");
            }
        }
    }
}