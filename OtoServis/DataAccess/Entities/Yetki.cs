﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OtoServis.DataAccess.Entities
{
    [Table("Yetki")]
    public class Yetki
    {
        [Key]
        public int Id { get; set; }
        public string YetkiAdi { get; set; }
        public virtual ICollection<RolYetkisi> RolYetkileri { get; set; }
    }
}
