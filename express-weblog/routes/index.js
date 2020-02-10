const express = require('express');
const router = express.Router();

module.exports = ({ Author, Post, Comment }) => {
  router.get('/', async function(req, res, next) {
    console.log(req.query);
    const authors = await Author.findAll({ where: { email: req.query.email }, include: [{
      model: Post,
      include: [{
        model: Comment
      }]
    }]});
    res.json(authors);
  });
  return router;
}
