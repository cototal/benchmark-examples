const Sequelize = require("sequelize");
const AuthorModel = require("./author");
const PostModel = require("./post");
const CommentModel = require("./comment");

const sequelize = new Sequelize(process.env.DATABASE_URL);
const Author = AuthorModel(sequelize);
const Post = PostModel(sequelize);
const Comment = CommentModel(sequelize);

Author.hasMany(Post);
Post.belongsTo(Author);
Post.hasMany(Comment);
Comment.belongsTo(Post);

module.exports = {
    Author,
    Post,
    Comment
}
