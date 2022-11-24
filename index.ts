'use strict'
import { config as envConfig } from 'dotenv'
envConfig()
import express, { NextFunction } from 'express';
import { Request, Response } from 'express';
import bodyParser from "body-parser";
import pool from './Libs/Db'
import getConfig from './Config'
import { Server as httpServer } from 'http'
import Service from './Services/index'
import UserAgent from 'express-useragent'
import { Response as HTTPResponse } from './Libs'
import { HTTPResponseCode, AuthHeader } from './Constant/RequestResponse'
import ErrorCode from './Constant/error'
import path from 'path'
import cors from 'cors'
export const  init = () => {
    // // server
    const app = express();
    const http = new httpServer(app)
    const port = getConfig('PORT')


    // express configuration
    app.use(bodyParser.json({ limit: "500mb" }));
    app.use(
        bodyParser.urlencoded({
            extended: true,
        })
    );
    app.use(UserAgent.express());
    app.use(cors({
        origin: '*',
        methods: ['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH']
    }))
    app.use('/static', express.static(path.join(__dirname, '../public')))
    app.use('/api/v1/export', express.static(path.join(__dirname, '../public/temp')))

    app.get('/', (req: Request, res: Response) => {
        res.send('Well done!');
    })

    app.use('/api/v1/', Service())

    app.use(function (err: any, req: Request, res: Response, next: NextFunction) {
        return HTTPResponse.send(res, HTTPResponseCode.INTERNAL_SERVER_ERROR, { error: ErrorCode.INTERNAL_SERVER_ERROR })
    })

    http.listen(port, () => {
        http.keepAliveTimeout = 45000
        console.log(`The application is listening on port ${port}!`);
    })
    return app
}