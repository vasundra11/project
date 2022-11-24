const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql');
const cors = require('cors');

const app = express()
const port = process.env.PORT || 5000;
app.use(express.urlencoded({extended: true}));
app.use(express.json()); 


app.listen(port, () => console.log(`Listening on port ${port}`));
app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH']
}))


const pool  = mysql.createPool({
    connectionLimit : 10,
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'insurance'
})


// Login
app.post('/login', (req, res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err
        const payload = req.body.payload;
        connection.query(`SELECT * from signin where username='${payload.username}' AND password='${payload.password}'`, (err, rows) => {
            connection.release()
            if (rows.length>0) {
                return res.send('Success')
            } else {
                return res.send('Invalid Login');
            }
        })
    })
})


// Add
app.post('/add_customer', (req, res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err
        
        const params = req.body.payload
        const sql =`INSERT INTO Customer_details(Customer_Name,Customer_mobile,Customer_email,Address,Gender,marital_status,DOB,aadhaar_no)
        VALUES('${params.cus_name}','${params.cus_mobile}','${params.cus_mailid}','${params.cus_address}','${params.gender}','${params.maritalstatus}',
        '${params.dob}','${params.aadharno}')`
        connection.query(sql, (err, rows) => {
        connection.release()
        if (rows) {
            return res.send('Added')
        } else {
            console.log(err)
            return res.send('NotAdded');
        }
        })
    })
});

//Update
app.post('/edit_customer', (req, res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err
        
        const params = req.body.payload
        const sql =`update Customer_details SET Customer_Name='${params.cus_name}',Customer_mobile='${params.cus_mobile}',Customer_email='${params.cus_mailid}',
        Address='${params.cus_address}',Gender='${params.gender}',DOB='${params.dob}',marital_status='${params.maritalstatus}',aadhaar_no='${params.aadharno}' where cus_id=${params.cus_id}`
        connection.query(sql, (err, rows) => {
        connection.release()
        if (rows) {
            return res.send("Updated")
        } else {
            return res.send('Server Error');
        }
        })
    })
});
//Get All EMployee
app.get('/get_cuslist', (req, res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err
        
        const params = req.body.payload
        const sql =`select * from Customer_details`
        connection.query(sql, (err, rows) => {
        connection.release()
        if (rows) {
            return res.send(rows)
        } else {
            return res.send('Server Error');
        }
        })
    })
});

//Get BY id
app.get('/get_list/:id', (req, res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err
        
        const params = req.params.id
        const sql =`select * from Customer_details where cus_id='${params}'`
        connection.query(sql, (err, rows) => {
        connection.release()
        if (rows) {
            return res.send(rows)
        } else {
            return res.send('Server Error');
        }
        })
    })
});

//Delete Employee
app.delete('/dlt_cus/:id', (req, res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err
        
        const params = req.params.id
        const sql =`Delete from Customer_details where cus_id=${params}`
        connection.query(sql, (err, rows) => {
        connection.release()
        if (rows) {
            return res.send('Deleted');
        } else {
            return res.send('Server Error');
        }
        })
    })
});