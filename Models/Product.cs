namespace Dawson_HW4.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public int CategoryID { get; set; }
        public decimal StandardCost { get; set; }
        public decimal ListPrice { get; set; }
        public int ReorderLevel { get; set; }
        public int TargetLevel { get; set; }
        public bool Discontinued { get; set; }
        public int SupplierID { get; set; }
        public int AvailableQty { get; set; }
        public bool Reordered { get; set; }
        public string ProdImage { get; set; }


    }
}
