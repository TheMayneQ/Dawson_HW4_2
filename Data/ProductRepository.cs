using Dawson_HW4.Models;
using Microsoft.Data.SqlClient;

namespace Dawson_HW4.Data
{
    public class ProductRepository : iProductRepository
    {

        private readonly string connectionString;

        public ProductRepository(IConfiguration config)
        {
            connectionString = config.GetConnectionString("DefaultConnection");
        }





        public List<Product> GetProductList(int categoryID)
        {
            var products = new List<Product>();

            //create connection
            using (var connection = new SqlConnection(connectionString))
            {
                //create command
                using (var command = new SqlCommand("sp_GetProductsByCategory", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CategoryID", categoryID);

                    //open connection
                    connection.Open();

                    //execute command
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            products.Add(new Product
                            {
                                ProductID = reader.GetInt32(0),
                                ProductCode = reader.GetString(1),
                                ProductName = reader.GetString(2),
                                Description = reader.GetString(3),
                                CategoryID = reader.GetInt32(4),
                                StandardCost = reader.GetDecimal(5),
                                ListPrice = reader.GetDecimal(6),
                                ReorderLevel = reader.GetInt32(7),
                                TargetLevel = reader.GetInt32(8),
                                Discontinued = reader.GetBoolean(9),
                                SupplierID = reader.GetInt32(10),
                                AvailableQty = reader.GetInt32(11),
                                Reordered = reader.GetBoolean(12),
                                //ProdImage = reader.GetString(13)


                            });
                        }
                    }
                }




            }


            return products;
        }

        public Product GetProductDetails(int categoryID)
        {
            Product product = null;

            //create connection
            using (var connection = new SqlConnection(connectionString))
            {
                //create command
                using (var command = new SqlCommand("sp_GetProductDetails", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ProductID", categoryID);

                    //open connection
                    connection.Open();

                    //execute command
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read()) // Expecting a single product
                        {
                            product = new Product
                            {
                                ProductID = reader.GetInt32(reader.GetOrdinal("ProductID")),
                                ProductCode = reader.GetString(reader.GetOrdinal("ProductCode")),
                                ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                                Description = reader.GetString(reader.GetOrdinal("Description")),
                                CategoryID = reader.GetInt32(reader.GetOrdinal("CategoryID")),
                                StandardCost = reader.GetDecimal(reader.GetOrdinal("StandardCost")),
                                ListPrice = reader.GetDecimal(reader.GetOrdinal("ListPrice")),
                                ReorderLevel = reader.GetInt32(reader.GetOrdinal("ReorderLevel")),
                                TargetLevel = reader.GetInt32(reader.GetOrdinal("TargetLevel")),
                                Discontinued = reader.GetBoolean(reader.GetOrdinal("Discontinued")),
                                SupplierID = reader.GetInt32(reader.GetOrdinal("SupplierID")),
                                AvailableQty = reader.GetInt32(reader.GetOrdinal("AvailableQty")),
                                Reordered = reader.GetBoolean(reader.GetOrdinal("Reordered")),
                                //ProdImage = reader.IsDBNull(reader.GetOrdinal("ProdImage")) ? null : reader.GetString(reader.GetOrdinal("ProdImage")) // Handle potential DBNull
                            };
                        }
                    }
                }




            }


            return product;
        }
    }
}
