using Dawson_HW4.Models;
using System.Collections.Generic;

namespace Dawson_HW4.Data
{
    public interface iShoppingCartRepository
    {
        
        void AddtoCart(string cartid, int prodid);

        List<ShoppingCart> LoadCartItems(string cartID, out decimal total);

        void UpdateCartItem(string cartID, int productID, int quantity);

        
    }

}

