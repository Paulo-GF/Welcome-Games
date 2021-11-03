const pool = require('./database');

const dataMapper = {
    insert: async (game) => {
        console.log(game);
        const query = {
            text: 'SELECT new_game($1)',
            values: [game]
        };

        return await pool.query(query);

    }
};

module.exports = dataMapper;