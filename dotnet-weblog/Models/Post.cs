using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace myapp.Models {
    public class Post {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }

        public int author_id { get; set; }
        public Author Author { get; set; }

        public ICollection<Comment> Comments { get; set; }
    }
}
