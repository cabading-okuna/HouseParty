import express, { Router } from 'express'
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { UserModel } from '../models/user';
import ChecklistModel from '../models/checklistTasks';

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
        let checklistTasks = await ChecklistModel.find().exec();
        console.log(checklistTasks);
        res.send(checklistTasks);
    } else {
    }
});

router.post('/checklists/new', async (req, res, next) => {
    if (req.isAuthenticated()) {
        console.log("new checklist", req.body.checklistTasks);
        let checklistTasks = new ChecklistModel(req.body.checklistTasks);
        await checklistTasks.save()
        res.send(new VoidApiResult("ok", ""));
    } else {

    }
})