using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api.Models
{
    public class UserRepository
    {
        private ApplicationDbContext context;
        public UserRepository(ApplicationDbContext context) {
            this.context = context;
        }
        public void Add(User user)
        {
            context.Users.Add(user);
        }

        public void Delete(User user)
        {
            throw new NotImplementedException();
        }

        public bool Exists(string username)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> GetAll()
        {
            return context.Users.ToList();
        }

        public User GetBy(string username)
        {
            return context.Users.Where(u => u.Username == username).Include(user=>user.Positions).FirstOrDefault();
        }

        public string GetHash(string username)
        {
            throw new NotImplementedException();
        }

        public void SaveChanges()
        {
            context.SaveChanges();
        }
    }
}
