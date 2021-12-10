import { ObjectId } from "mongodb";
import { Schema, model, connect, SchemaDefinition} from "mongoose";

import mongoose from 'mongoose';

interface User {
    _id: ObjectId;
    name: string;
    email: string;
    bio: string;
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
    },
    name: {
        type: String,
        default: ''
    },
    bio: {
        type: String,
        default:''
    }
});

userSchema.query.getPublicUserInfo = function(_id) {
    let user = this.findOne({ _id }, '-password');
    return user;
}

const UserModel = model<User>('User', userSchema);


export { UserModel, User };