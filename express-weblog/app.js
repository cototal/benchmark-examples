const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
require("dotenv").config();

const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users');
const { Author, Post, Comment } = require("./models");
const app = express();


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/', indexRouter({ Author, Post, Comment }));
app.use('/users', usersRouter);

module.exports = app;
