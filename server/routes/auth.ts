import express, { Router } from 'express'
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import UserModel from '../models/user';
import passport from 'passport';
const middleware = require('../middlewares');

let router = Router();
export default router;


router.post('/login', function (req, res, next) {
    passport.authenticate('local', (err, user, info, status) => {
        console.log('doing passport stuff');
        if (user) {
            console.log('passport route success ', user);
            req.logIn(user, err => {
                if (err) {
                    return res.status(400).json(err);
                }
                return res.status(200).json(user);
            })
        }
        else {
            console.log('passport failed', user, info, status);
            return res.status(400).json(err);
        }
    })(req, res, next);
    // try {
    //     let user = await UserModel.findOne({ email: req.body.email }).exec();
    //     if (!user) res.status(404).json({ error: 'no user with that email found' });
    //     else {
    //         bcrypt.compare(req.body.password, user.password, (error, match) => {
    //             if (error) res.status(500).json(error);
    //             else if (match) {
    //                 console.log(user);
    //                 res.status(200).json({ token: generateToken(user) });
    //             }
    //             else res.status(403).json({ error: 'passwords do not match' });
    //         })
    //     }
    // }
    // catch (error) {
    //     res.status(500).json(error);
    // }
});

router.post('/signup', (req, res) => {
    console.log("signup: ", req.body);
    if (!req.body.email || !req.body.password) {
        return res.send({ error: 'email or password are missing' });
    }
    bcrypt.hash(req.body.password, 10).then((hash) => {
        const newUser = new UserModel({ email: req.body.email, password: hash });
        console.log(newUser);
        newUser.save()
            .then(user => {
                console.log("saved new user");
                res.status(200).json({ token: generateToken(user) })
            })
            .catch(error => {
                res.status(500).json(error)
            })
    }).catch(error => {
        console.log(error);
        res.status(500).json(error);
    })
});

router.get('/jwt-test', middleware.verify, (req, res) => {
    res.status(200).json(req.user)
})

function generateToken(user) {
    return jwt.sign({ data: user }, "secret", { expiresIn: '24h' })
}

