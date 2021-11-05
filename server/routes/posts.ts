
import express, { Router } from 'express'
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { UserModel } from '../models/user';
import PostingModel from '../models/posting';

let router = Router();
export default router;

type VoidApiResult = {
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
})