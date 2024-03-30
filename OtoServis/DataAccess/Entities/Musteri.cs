﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OtoServis.DataAccess.Entities
{
    public class Musteri
    {
        [Key]
        public int MusteriID { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string Telefon { get; set; }
        public string Email { get; set; }
        public virtual ICollection<Arac> Araclar { get; set; }
    }
}
