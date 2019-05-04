using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace EatryOnline.Models
{
    public class CustomerViewModel
    {

        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [StringLength(6,ErrorMessage ="Length should not be less than 6 characters")]
        public string Password { get; set; }

       

        [Required]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [Required]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        [DisplayName("Last Name")]
        public string LastName { get; set; }

        [Required]
        [RegularExpression(@"^(.|\s)*[a-zA-Z]+(.|\s)*$", ErrorMessage = "Use letters only please")]
        public string Address { get; set; }

        [Required]
        [RegularExpression(@"^(\+\d{2,4})?\s?(\d{10})$", ErrorMessage = "Use valid contact no. please")]
        public string Contact { get; set; }

        [Required]
        [DisplayName("Secret Question")]
        public string SQuestion { get; set; }


        [Required]
        [DisplayName("Answer")]
        public string SAnswer { get; set; }
    }
}