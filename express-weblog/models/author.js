const Sequelize = require("sequelize");

module.exports = (sequelize) => {
    class Author extends Sequelize.Model {

    }

    Author.init({
        id: {
          type: Sequelize.INTEGER,
          primaryKey: true,
          autoIncrement: true
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        email: {
            type: Sequelize.STRING,
            allowNull: false
        }

    }, {
        underscored: true,
        sequelize,
        timestamps: true,
        tableName: "authors"
    });

    return Author;
}
