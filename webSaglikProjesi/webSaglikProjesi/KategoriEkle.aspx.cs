using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class KategoriEkle : System.Web.UI.Page
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
                    Gizle();
                }
            }
        }
        private void KategoriGetir()
        {
            var Categories = (from kategori in ent.Kategoriler
                              where kategori.silindi == false
                              select kategori).ToList();
            gvKategoriler.DataSource = Categories;
            gvKategoriler.DataBind();
        }
        private void Gizle()
        {
            pnlGiris.Visible = false;
        }
        private void Goster()
        {
            pnlGiris.Visible = true;
        }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            Goster();
            txtKategoriAdi.Focus();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtKategoriAdi.Text.Trim() != "")
            {
                Kategoriler k = new Kategoriler();
                k.kategoriad = txtKategoriAdi.Text;
                k.aciklama = txtAciklama.Text;
                ent.Kategoriler.Add(k);
                try
                {
                    ent.SaveChanges();
                    Gizle();
                    KategoriGetir();
                }
                catch (SqlException ex)
                {
                    string hata = ex.Message;
                }               
            }
        }

        protected void gvKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            Goster();
            txtKategoriAdi.Text = HttpUtility.HtmlDecode(gvKategoriler.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(gvKategoriler.SelectedRow.Cells[2].Text);
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvKategoriler.SelectedValue);
            var degisen = (from k in ent.Kategoriler
                           where k.id == ID
                           select k).First();
            degisen.kategoriad = txtKategoriAdi.Text;
            degisen.aciklama = txtAciklama.Text;
            try
            {
                ent.SaveChanges();
                Gizle();
                KategoriGetir();
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvKategoriler.SelectedValue);
            var silinen = (from k in ent.Kategoriler
                           where k.id == ID
                           select k).First();
            ent.Kategoriler.Remove(silinen);
            try
            {
                ent.SaveChanges();
                Gizle();
                KategoriGetir();
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }
    }
}