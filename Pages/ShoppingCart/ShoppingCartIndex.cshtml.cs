using Dawson_HW4.Data;
using Dawson_HW4.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Dawson_HW4.Pages.ShoppingCart
{
    public class ShoppingCartIndexModel : PageModel
    {
        private readonly iShoppingCartRepository _cartRepository;

        public decimal CartTotal { get; set; }

        [BindProperty]
        public List<Dawson_HW4.Models.ShoppingCart> CartItems { get; set; }

        public ShoppingCartIndexModel(iShoppingCartRepository cartRepository)
        {
            _cartRepository = cartRepository;
        }

        public void OnGet()
        {
            string cartID = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier).Value;

            CartItems = _cartRepository.LoadCartItems(cartID, out decimal total);

            CartTotal = total;

        }

        public IActionResult OnPost()
        {
            string cartID = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier).Value;

            if (ModelState.IsValid)
            {
                foreach(var item in CartItems)
                {
                    _cartRepository.UpdateCartItem(item.CartID, item.ProductID, item.QuantityToOrder);

                }

                CartItems = _cartRepository.LoadCartItems(cartID, out decimal total);
                CartTotal = total;

            }
            
            return Page();


        }
    }
}
