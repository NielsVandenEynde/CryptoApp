using CryptoAPI.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
namespace api.Models
{
    public class ApplicationDbContext : IdentityDbContext
{

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
           

        }
    protected override void OnModelCreating(ModelBuilder builder)
    {
            base.OnModelCreating(builder);
            

        }
    public DbSet<User> Users { get; set; }
    public DbSet<Position> Positions { get; set; }

    
    
    }
}
