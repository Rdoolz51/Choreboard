const mongoose = require('mongoose');
require('dotenv').config();

// mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost/Choreboard', {
//     useNewUrlParser: true,
//     useUnifiedTopology: true,
//     // useCreateIndex: true,
//     // useFindAndModify: false
// });

mongoose.connect(`mongodb+srv://${process.env.DB_NAME}:${process.env.DB_PASS}@cluster0.agjhbbl.mongodb.net/?retryWrites=true&w=majority`, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}, (err) => {
    if (err) throw err;

    console.log("DB CONNECTED SUCCESSFULLY!");
});

module.exports = mongoose.connection;