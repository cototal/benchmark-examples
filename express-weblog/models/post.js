const Sequelize = require("sequelize");

module.exports = (sequelize) => {
    class Post extends Sequelize.Model {

    }

    Post.init({
        id: {
          type: Sequelize.INTEGER,
          primaryKey: true,
          autoIncrement: true
        },
        title: {
            type: Sequelize.STRING,
            allowNull: false
        },
        body: {
            type: Sequelize.STRING,
            allowNull: true
        }

    }, {
        sequelize,
        underscored: true,
        timestamps: true,
        tableName: "posts"
    });

    return Post;
}
