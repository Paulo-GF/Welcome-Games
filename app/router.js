const express = require('express');

const gameController = require('./controllers/gameController');

const router = express.Router();

router.post('/welcome-games', gameController.insert);

module.exports = router;