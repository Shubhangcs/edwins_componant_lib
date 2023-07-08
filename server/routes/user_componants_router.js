const express = require('express');
const route = express.Router();
const mongoose = require('mongoose');

// Import the Post model/schema
const Post = require('../models/user_componants');

// Define a route to handle the POST request
route.post('/', (req, res) => {
  // Extract the list of items from the request body
  const items = req.body.items;

  // Create a new Post object with the data from the request body
  const post = new Post({
    name: req.body.name,
    items: items
  });

  // Save the post to the database
  post.save()
    .then(savedPost => {
      res.json(savedPost); // Respond with the saved post
    })
    .catch(error => {
      res.status(500).json({ error: 'An error occurred' });
    });
});

module.exports = router;