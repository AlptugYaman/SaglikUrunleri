using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class AltKategoriEkle : System.Web.UI.Page
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
                    Gizle();
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
            dgvAltKategoriler.DataSource = AltKategori;
            dgvAltKategoriler.DataBind();
        }
        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategoriGetir();
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
            txtAltkategoriAdi.Focus();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtAltkategoriAdi.Text.Trim() != "")
            {
                AltKategoriler ak = new AltKategoriler();
                ak.altkategoriad = txtAltkategoriAdi.Text;
                ak.aciklama = txtAciklama.Text;
                ak.kategorino = Convert.ToInt32(ddlKategoriler.SelectedValue);
                ent.AltKategoriler.Add(ak);
                try
                {
                    ent.SaveChanges();
                    Gizle();
                    AltKategoriGetir();
                }
                catch (SqlException ex)
                {
                    string hata = ex.Message;
                }
            }
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(dgvAltKategoriler.SelectedValue);
            var degisen = (from k in ent.AltKategoriler
                           where k.id == ID
                           select k).First();
            degisen.altkategoriad = txtAltkategoriAdi.Text;
            degisen.aciklama = txtAciklama.Text;
            try
            {
                ent.SaveChanges();
                Gizle();
                AltKategoriGetir();
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(dgvAltKategoriler.SelectedValue);
            var silinen = (from k in ent.AltKategoriler
                           where k.id == ID
                           select k).First();
            ent.AltKategoriler.Remove(silinen);
            try
            {
                ent.SaveChanges();
                Gizle();
                AltKategoriGetir();
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
            }
        }

        protected void dgvAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            Goster();
            txtAltkategoriAdi.Text = HttpUtility.HtmlDecode(dgvAltKategoriler.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(dgvAltKategoriler.SelectedRow.Cells[2].Text);
        }
    }
}