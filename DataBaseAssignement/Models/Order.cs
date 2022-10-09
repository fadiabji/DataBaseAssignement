using System;
using System.Collections.Generic;

namespace DataBaseAssignement.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderRecords = new HashSet<OrderRecord>();
        }

        public int Id { get; set; }
        public DateTime OrderDate { get; set; }
        public int CustomerId { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual ICollection<OrderRecord> OrderRecords { get; set; }
    }
}
