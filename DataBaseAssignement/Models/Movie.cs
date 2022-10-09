using System;
using System.Collections.Generic;

namespace DataBaseAssignement.Models
{
    public partial class Movie
    {
        public Movie()
        {
            OrderRecords = new HashSet<OrderRecord>();
        }

        public int Id { get; set; }
        public string Title { get; set; } = null!;
        public string Director { get; set; } = null!;
        public int ReleaseYear { get; set; }
        public decimal? Price { get; set; }

        public virtual ICollection<OrderRecord> OrderRecords { get; set; }
    }
}
