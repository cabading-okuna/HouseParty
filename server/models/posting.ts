import { ObjectId } from "mongodb";
import { Schema, model, connect, SchemaDefinition} from "mongoose";
import { User, UserModel } from "./user"

import mongoose from 'mongoose';

interface Posting {
    _id: ObjectId;
    author: User;
    post: string;
}

const postingSchema = new Schema<Posting>({
    post: {
        type: String,
        required: true
    },
    // author: {
    //     type: User,
    //     required: true
    // }
});

const PostingModel = model<Posting>('Posting', postingSchema);

export default UserModel;