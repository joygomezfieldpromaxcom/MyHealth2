using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MyHealthWebAPI.Models
{
    [Table("dbo.ProblemList")]
    public class ProblemList
    {

        
        public string ProblemListName { get; set; }
        [Key]
        public int id { get; set; }
        

    }
}
