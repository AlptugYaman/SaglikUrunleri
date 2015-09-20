using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSaglikProjesi
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        SaglikUrunleriEntities ent = new SaglikUrunleriEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var Categories = from category in ent.Kategoriler
                                 where category.silindi == false
                                 select new { category.id, category.kategoriad };
                foreach (var kategori in Categories)
                {
                    MenuItem mitm = new MenuItem();
                    mitm.Text = kategori.kategoriad;
                    mitm.Value = kategori.id.ToString();
                    mnuKategoriler.Items.Add(mitm);
                    var SubCategories = from subcategory in ent.AltKategoriler
                                     where subcategory.silindi == false && subcategory.kategorino == kategori.id
                                     select new { subcategory.id, subcategory.altkategoriad };
                    foreach (var altkategori in SubCategories)
                    {
                        MenuItem citm = new MenuItem();
                        citm.Text = altkategori.altkategoriad;
                        citm.Value = altkategori.id.ToString();
                        mitm.ChildItems.Add(citm);
                    }
                }
            }
        }

        protected void mnuKategoriler_MenuItemClick(object sender, MenuEventArgs e)
        {
            //string Secilen = e.Item.Text + ", " + e.Item.Value;
            if (e.Item.Depth != 0)
            {
                string[] Degerler = e.Item.ValuePath.Split('/');
                Response.Redirect("Products.aspx?kno=" + Degerler[0] + "&altkno=" + Degerler[1]);
            }
        }
    }
}