namespace Dawson_HW4.Models
{
    public class ShoppingCart
    {
        public string CartID { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal StandardCost { get; set; }
        public int QuantityToOrder { get; set; }
        public decimal Subtotal { get; set; }

    }
}
