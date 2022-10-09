using System;
using System.Collections.Generic;

namespace DataBaseAssignement.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string BillingAddress { get; set; } = null!;
        public string BillingZip { get; set; } = null!;
        public string BillingCity { get; set; } = null!;
        public string DeliveryAddress { get; set; } = null!;
        public string DeliveryZip { get; set; } = null!;
        public string DeliveryCity { get; set; } = null!;
        public string EmailAddress { get; set; } = null!;
        public string Phone { get; set; } = null!;

        public virtual ICollection<Order> Orders { get; set; }
    }
}
