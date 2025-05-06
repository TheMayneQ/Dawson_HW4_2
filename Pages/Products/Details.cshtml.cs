using Dawson_HW4.Data;
using Dawson_HW4.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Dawson_HW4.Pages.Products
{
    [Authorize(Roles = "Customer")]
    public class DetailsModel : PageModel
    {
        private readonly iProductRepository _productRepository;

        private readonly iShoppingCartRepository _shoppingCartRepository;

        public Product Product { get; set; }

        public DetailsModel(iProductRepository productRepository, iShoppingCartRepository shoppingCartRepository)
        {
            _productRepository = productRepository;

            _shoppingCartRepository = shoppingCartRepository;
        }

        public IActionResult OnGet(int id) 
        {
            Product = _productRepository.GetProductDetails(id);


            if (Product == null)
            {
                return NotFound(); 
            }

            return Page();
        }

        public IActionResult OnPost(string cartID, int productID)
        {
            if(ModelState.IsValid)
            {
                _shoppingCartRepository.AddtoCart(cartID, productID);

                return RedirectToPage("/Index");
            }
            return Page();
        }
    }
}