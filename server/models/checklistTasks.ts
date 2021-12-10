import { ObjectId } from "mongodb";
import { Schema, model, connect, SchemaDefinition} from "mongoose";
import { User, UserModel } from "./user"

import mongoose from 'mongoose';

interface ChecklistTasks {
    _id: ObjectId;
    userId: User;
    taskName: string;
    notes: string;
    date: string;
}

const checklistTaskSchema = new Schema<ChecklistTasks>({
    taskName: {
        type: String,
        required: true
    },
    notes: {
        type: String,
        required: false
    },
    userId: {
    },
});

const ChecklistModel = model<ChecklistTasks>('ChecklistTasks', checklistTaskSchema);

export default ChecklistModel;