
import express, { Router } from 'express'
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { UserModel } from '../models/user';
import PostingModel from '../models/posting';

let router = Router();
export default router;

class VoidApiResult {
    constructor(status, error) {
        this.status = status;
        this.error = error;
    }
    status: String;
    error: String;
}

router.post('/status', (req, res, next) => {
    if (req.isAuthenticated()) {
        res.send({status: "loggedin", error: null});
    } else {
        res.send({status: "false", error: null});
    }
});

router.post('/postings', async (req, res, next) => {
    if (req.isAuthenticated()) {
        let postings = await PostingModel.find().exec();
        console.log(postings);
        res.send(postings);
    } else {
    }
});

router.post('/postings/new', async (req, res, next) => {
    if (req.isAuthenticated()) {
        let posting = new PostingModel(req.body.posting);
        let user = await UserModel.find()['getPublicUserInfo'](req.user['_id']);
        posting.date = new Date();
        posting.author = user;
        console.log("new posting", posting);
        await posting.save()
        res.send(new VoidApiResult("ok", ""));
    } else {

    }
})