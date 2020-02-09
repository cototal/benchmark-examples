using System.ComponentModel.DataAnnotations.Schema;

namespace myapp.Models {
    public class Comment {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }

        public int post_id { get; set; }
        public Post Post { get; set; }
    }
}
