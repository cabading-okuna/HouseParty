import express, { Router } from 'express'
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { UserModel } from '../models/user';
// Import Checklist Model here

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

router.post('/checklists', async (req, res, next) => {
    if (req.isAuthenticated()) {
        // let checklists = await ChecklistModel.find().exec();
        // console.log(checklists);
        // res.send(checklists);
    } else {
    }
});

router.post('/checklists/new', async (req, res, next) => {
    if (req.isAuthenticated()) {
        // console.log("new checklist", req.body.checklist);
        // let checklist = new ChecklistModel(req.body.checklist);
        // await checklist.save()
        res.send(new VoidApiResult("ok", ""));
    } else {

    }
})