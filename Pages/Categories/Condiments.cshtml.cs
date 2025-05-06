using Dawson_HW4.Data;
using Dawson_HW4.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Dawson_HW4.Pages.Categories
{
    public class CondimentsModel : PageModel
    {
        private readonly iProductRepository _productRepository;

        public List<Product> ProdList { get; set; }

        public CondimentsModel(iProductRepository productRepository)
        {
            _productRepository = productRepository;
        }



        public void OnGet()
        {

            ProdList = _productRepository.GetProductList(103);
        }
    }
}
