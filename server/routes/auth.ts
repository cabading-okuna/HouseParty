import express, { Router } from 'express'
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { UserModel } from '../models/user';
import passport from 'passport';
const middleware = require('../middlewares');

let router = Router();
export default router;

router.post('/update', async function (req, res, next) {
    if (req.isAuthenticated()) {
        let name = req.body.name;
        let bio = req.body.bio;

        await UserModel.updateOne({ _id: req.user['_id'] }, { $set: { bio, name }})
        res.send({status: "ok", error: null});
    } else {
        res.send({status: "false", error: null});
    }
});

router.post('/logout', function (req, res, next) {
    if (req.isAuthenticated()) {
        req.logout();
        res.send({status: "loggedout", error: null});
    } else {
        res.send({status: "false", error: null});
    }
});

router.post('/login', function (req, res, next) {
    passport.authenticate('local', (err, user, info, status) => {
        if (user) {
            req.logIn(user, err => {
                if (err) {
                    return res.status(400).json(err);
                }
                return res.status(200).json(user);
            })
        }
        else {
            return res.status(400).json(err);
        }
    })(req, res, next);
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

