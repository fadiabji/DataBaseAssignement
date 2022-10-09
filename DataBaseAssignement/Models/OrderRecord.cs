using System;
using System.Collections.Generic;

namespace DataBaseAssignement.Models
{
    public partial class OrderRecord
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public int MovieId { get; set; }
        public decimal Price { get; set; }

        public virtual Movie Movie { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
