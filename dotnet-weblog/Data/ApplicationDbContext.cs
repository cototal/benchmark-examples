
using Microsoft.EntityFrameworkCore;
using myapp.Models;

namespace myapp.Data {
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
        {}

        public DbSet<Post> Posts { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Author> Authors { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Post>(entity => {
                entity.ToTable("posts");
                entity.HasOne(p => p.Author)
                    .WithMany(a => a.Posts)
                    .HasForeignKey("author_id");
            });
            builder.Entity<Author>(entity => {
                entity.ToTable("authors");
            });
            builder.Entity<Comment>(entity => {
                entity.ToTable("comments");
                entity.HasOne(c => c.Post)
                    .WithMany(p => p.Comments)
                    .HasForeignKey("post_id");
            });
        }
    }
}
