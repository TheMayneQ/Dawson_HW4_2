using Dawson_HW4.Models;
using Microsoft.Data.SqlClient;

namespace Dawson_HW4.Data
{
    public class ShoppingCartRepository : iShoppingCartRepository
    {
        private readonly string _connectionString;

        public ShoppingCartRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("DefaultConnection");
        }


        public void AddtoCart(string cartid, int prodid)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var cmd = new SqlCommand("spShoppingCartAddItem2", connection);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@cartid", cartid);
                cmd.Parameters.AddWithValue("@prodid", prodid);

                connection.Open();

                cmd.ExecuteNonQuery();


            }
        }

        public List<ShoppingCart> LoadCartItems(string cartID, out decimal total)
        {
            List<ShoppingCart> CartItems = new List<ShoppingCart>();

            using (var connection = new SqlConnection(_connectionString))
            {
                

                var command = new SqlCommand("spShoppingCartGetItems", connection);

                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@cartID", cartID);

                connection.Open();

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        CartItems.Add(new ShoppingCart
                        {
                            CartID = reader.GetString(0),
                            ProductID = reader.GetInt32(1),
                            ProductName = reader.GetString(2),
                            StandardCost = reader.GetDecimal(3),
                            QuantityToOrder = reader.GetInt32(4),
                            Subtotal = reader.GetDecimal(5)

                        });
                    }
                }

                using (command = new SqlCommand("spShoppingCartGetTotal", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CartID", cartID);
                    total = Convert.ToDecimal(command.ExecuteScalar());
                } 


            }

            return CartItems;

        }

        public void UpdateCartItem(string cartID, int productID, int quantity)
        {
            //List<ShoppingCart> CartItems = new List<ShoppingCart>();
            using (var connection = new SqlConnection(_connectionString))
            {
                var cmd = new SqlCommand("spShoppingCartUpdateItem", connection);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CartID", cartID);
                cmd.Parameters.AddWithValue("@ProductID", productID);
                cmd.Parameters.AddWithValue("@Quantity", quantity);

                connection.Open();
                cmd.ExecuteNonQuery();



            }

        }
    }
}
