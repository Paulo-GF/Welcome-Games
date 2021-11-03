const pool = require('../database.js');

class Game {

    constructor(gameJSON) {
        for (const property in gameJSON) {
            this[property] = gameJSON[property];
        }
    }

    async save() {
        console.log(this);
        const query = {
            text: "SELECT new_game($1)",
            values: [this]
        };

        const result = await pool.query(query);
        this.id = result.rows[0].new_game;
    }

}

module.exports = Game;
