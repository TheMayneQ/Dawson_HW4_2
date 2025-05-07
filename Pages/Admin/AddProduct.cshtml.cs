// Path: Pages/Admin/AddProduct.cshtml.cs
using Dawson_HW4.Data;
using Dawson_HW4.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System; // For Exception
using System.Threading.Tasks; // For async (though current AddProduct is sync)

namespace Dawson_HW4.Pages.Admin
{
    [Authorize(Roles = "Admin")] // Ensure only Admins can access
    public class AddProductModel : PageModel
    {
        private readonly iProductRepository _productRepo;

        [BindProperty]
        public Product NewProduct { get; set; }

        [TempData]
        public string Message { get; set; }

        public AddProductModel(iProductRepository productRepo)
        {
            _productRepo = productRepo;
            NewProduct = new Product // Initialize with defaults that make sense
            {
                Discontinued = false,
                Reordered = false
                // AvailableQty might default to 0 if not set by user
            };
        }

        public void OnGet()
        {
            // No data loading needed for dropdowns
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                // If model state is invalid, return the page to show validation errors
                return Page();
            }

            try
            {
                _productRepo.AddProduct(NewProduct);
                Message = $"Product '{NewProduct.ProductName}' (Code: {NewProduct.ProductCode}) added successfully!";
                return RedirectToPage("./ManageProducts"); // Redirect to the product listing/management page
            }
            catch (Exception ex)
            {
                // Log the exception (ex) - for diagnostics. Consider using a proper logging framework.
                Console.WriteLine(ex.Message); // Basic logging for now
                Message = "Error adding product. Please check the details and try again. If the issue persists, contact support. Details: " + ex.Message;
                // Return to the page so the user can see the error and correct data if needed.
                return Page();
            }
        }
    }
}