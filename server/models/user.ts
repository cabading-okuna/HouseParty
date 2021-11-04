import { ObjectId } from "mongodb";
import { Schema, model, connect, SchemaDefinition} from "mongoose";

import mongoose from 'mongoose';

interface User {
    _id: ObjectId;
    name: string;
    email: string;
    password: string;
}

const userSchema = new Schema<User>({
    email: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    }
});

const UserModel = model<User>('User', userSchema);

export default UserModel;