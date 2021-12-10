import express from 'express';
import mongoose from 'mongoose';
import bcrypt from 'bcrypt';
import sessionService from 'express-session';
import cookieParser from 'cookie-parser';
import connectMongo from 'connect-mongo';
import MongoStore from 'connect-mongo';
import authRouter from './routes/auth';
import routes from './routes/posts';
import routed from './routes/list';
import passport, { Passport } from 'passport';
import { PassportStrategyInitializer } from './passport-setup';

const app = express();
const dbURI = "mongodb://localhost/houseparty";
const port = 3000;
const oneWeek = 7 * 1000 * 60 * 60 * 24;

(async function () {
    app.use(express.json());
    app.use(cookieParser("secret"));

    app.use(sessionService({
        secret: "secret",
        saveUninitialized:true,
        cookie: { maxAge: oneWeek },
        resave: false,
        store: MongoStore.create({mongoUrl: dbURI })
    }));

    app.use(passport.initialize());
    app.use(passport.session());
    let passportInit = new PassportStrategyInitializer();
    passportInit.init();

    app.use('/api', authRouter);
    app.use('/api', routes);

    mongoose.connect(dbURI);
    const db = mongoose.connection

    // app.get('/', (req, res, next) => {
    //     res.send(req.user);
    // })

    db.on("error", (err)=>{console.error(err)});
    db.once("open", () => {console.log("DB started successfully")});

    app.listen(port, () => {
        console.log("Server started: ", port);
    });

})()