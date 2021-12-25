using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text.Json.Serialization;
using CryptoAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace api.Models{

	/// <summary>
	/// Summary description for Class1
	/// </summary>
	/// 
	[Table("user")]
    public class User
    {	
        
		[Key]
        public int Id { get; set; }
		
		public string Username { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Email { get; set; }
		public short Age { get; set; }


		public IEnumerable<Position> Positions { get; set; }




    }
}
