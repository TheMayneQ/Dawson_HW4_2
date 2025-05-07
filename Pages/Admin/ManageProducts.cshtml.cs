using Dawson_HW4.Data;
using Dawson_HW4.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.Threading.Tasks; // For async (though not strictly needed here if repo methods are sync)

namespace Dawson_HW4.Pages.Admin
{
    [Authorize(Roles = "Admin")]
    public class ManageProductsModel : PageModel
    {
        private readonly iProductRepository _productRepo;

        public List<Product> Products { get; set; }

        [TempData]
        public string Message { get; set; }


        public ManageProductsModel(iProductRepository productRepo)
        {
            _productRepo = productRepo;
        }

        public void OnGet()
        {
            Products = _productRepo.GetAllProducts(); // Using the new method
        }

        public IActionResult OnPostDelete(int id) // id should match asp-route-id
        {
            try
            {
                var product = _productRepo.GetProductDetails(id);
                if (product == null)
                {
                    Message = "Product not found.";
                    return RedirectToPage();
                }

                _productRepo.DeleteProduct(id);
                Message = $"Product '{product.ProductName}' (ID: {id}) deleted successfully.";
            }
            catch (System.Exception ex)
            {
                // Log the exception ex
                Message = "Error deleting product.";
            }
            return RedirectToPage(); // Refreshes the page and shows the message
        }
    }
}