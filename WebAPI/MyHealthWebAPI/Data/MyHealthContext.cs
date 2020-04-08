using Microsoft.EntityFrameworkCore;
using MyHealthWebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq; 
using System.Threading.Tasks;

namespace MyHealthWebAPI.Data
{
    public class MyHealthContext: DbContext
    {
        public MyHealthContext(DbContextOptions<MyHealthContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }

        public DbSet<ProblemList> ProblemListItems { get; set; }
        
               
    }
}
