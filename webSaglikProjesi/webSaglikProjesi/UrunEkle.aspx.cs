using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class UrunEkle : System.Web.UI.Page
    {
        SaglikUrunleriEntities ent = new SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                    Response.Redirect("Admin.aspx");
                else
                {
                    KategoriGetir();
                    AltKategoriGetir();
                    UrunleriGetir();
                    //Gizle();
                }
            }
        }
        private void KategoriGetir()
        {
            var Categories = (from kategori in ent.Kategoriler
                              where kategori.silindi == false
                              select kategori).ToList();
            ddlKategoriler.DataSource = Categories;
            ddlKategoriler.DataBind();
        }
        private void AltKategoriGetir()
        {
            int KID = Convert.ToInt32(ddlKategoriler.SelectedValue);
            var AltKategori = (from altkategori in ent.AltKategoriler
                               where altkategori.silindi == false && altkategori.kategorino == KID
                               select altkategori).ToList();
            ddlAltKategoriler.DataSource = AltKategori;
            ddlAltKategoriler.DataBind();
        }
        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategoriGetir();
            UrunleriGetir();
        }
        private void UrunleriGetir()
        {
            int KID = Convert.ToInt32(ddlKategoriler.SelectedValue);
            int AKID = Convert.ToInt32(ddlAltKategoriler.SelectedValue);
            var Uruns = (from urun in ent.Urunler
                         where urun.silindi == false && urun.urunkategorino == KID && urun.urunaltkategorino == AKID
                               select urun).ToList();
            gvUrunler.DataSource = Uruns;
            gvUrunler.DataBind();
        }

        protected void ddlAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            UrunleriGetir();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if(fuResim1.HasFile)
                fuResim1.SaveAs(Server.MapPath("~/images/" + fuResim1.FileName));
            if (fuResim2.HasFile)
                fuResim2.SaveAs(Server.MapPath("~/images/buyuk/" + fuResim2.FileName));
            Urunler u = new Urunler();
            u.urunkodu = txtUrunKodu.Text;
            u.urunad = txtUrunAdi.Text;
            u.urunbilgisi = txtUrunBilgisi.Text;
            u.miktar = Convert.ToInt32(txtMiktar.Text);
            u.urunfiyat = Convert.ToDecimal(txtFiyat.Text);
            u.urunkategorino = Convert.ToInt32(ddlKategoriler.SelectedValue);
            u.urunaltkategorino = Convert.ToInt32(ddlAltKategoriler.SelectedValue);
            u.resimyolu1 = "images/" + fuResim1.FileName;
            u.resimyolu2 = "images/buyuk/" + fuResim2.FileName;
            ent.Urunler.Add(u);
            try
            {
                ent.SaveChanges();
                Gizle();
                UrunleriGetir();
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            Goster();
        }
        private void Gizle()
        {
            pnlGiris.Visible = false;
        }
        private void Goster()
        {
            pnlGiris.Visible = true;
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {

        }

        protected void btnSil_Click(object sender, EventArgs e)
        {

        }
    }
}