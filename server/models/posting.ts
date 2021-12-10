import { ObjectId } from "mongodb";
import { Schema, model, connect, SchemaDefinition} from "mongoose";
import { User, UserModel } from "./user"

import mongoose from 'mongoose';

interface Posting {
    _id: ObjectId;
    body: string;
    title: string;
    date: Date;
    author: User;
    replies:[PostingReply?]
    actions: [PostingAction?]
}

interface PostingAction {
    author: User;
    action: string;
}

interface PostingReply {
    author: User;
    title: string;
    body: string;
    date: string;
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
    date: {
        type: Date,
        default: new Date()
    },
    author: {
    },
    replies: [],
    actions: []
});

const PostingModel = model<Posting>('Posting', postingSchema);

export default PostingModel;