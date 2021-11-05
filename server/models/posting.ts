import { ObjectId } from "mongodb";
import { Schema, model, connect, SchemaDefinition} from "mongoose";
import { User, UserModel } from "./user"

import mongoose from 'mongoose';

interface Posting {
    _id: ObjectId;
    userId: User;
    body: string;
    title: string;
    date: Date
}

const postingSchema = new Schema<Posting>({
    body: {
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    userId: {
    },
    date: {
    },
    // author: {
    //     type: User,
    //     required: true
    // }
});

const PostingModel = model<Posting>('Posting', postingSchema);

export default PostingModel;