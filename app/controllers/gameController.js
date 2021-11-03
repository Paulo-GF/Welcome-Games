// const dataMapper = require('../datamapper.js');
const Game = require('../models/game.js');

const gameController = {
    insert: async(req,res) => {

        // const result = await dataMapper.insert(req.body);
        // console.log(result.rows[0]);
        // res.json(result.rows[0]);

        const game = new Game(req.body);
        await game.save();
        res.json(game);
    }
};

module.exports = gameController;