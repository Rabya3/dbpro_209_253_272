using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace EatryOnline.Models
{
    public class CategoryViewModel
    {
        [Required]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        public string Name { get; set; }

        [Required]
        [RegularExpression(@"^[a-zA-Z][a-zA-Z\\s]+$", ErrorMessage = "Use letters only please")]
        public string Description { get; set; }
    }
}