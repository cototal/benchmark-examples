const Sequelize = require("sequelize");

module.exports = (sequelize) => {
    class Comment extends Sequelize.Model {

    }

    Comment.init({
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
        tableName: "comments"
    });

    return Comment;
}
