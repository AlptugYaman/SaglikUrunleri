//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace webSaglikProjesi
{
    using System;
    using System.Collections.Generic;
    
    public partial class Alt_kategoriler
    {
        public Alt_kategoriler()
        {
            this.Urunler = new HashSet<Urunler>();
        }
    
        public int ID { get; set; }
        public string altkategoriAd { get; set; }
        public int kategoriNo { get; set; }
        public string aciklama { get; set; }
        public bool silindi { get; set; }
    
        public virtual Kategoriler Kategoriler { get; set; }
        public virtual ICollection<Urunler> Urunler { get; set; }
    }
}
