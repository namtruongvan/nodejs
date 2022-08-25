// console.log("hello world!");
// var x = 10 ;
// var y = 20;
// console.log(x+
const express = require("express");
const app = express();
const port = process.env.PORT || 5000;

app.listen(port,function(){
    console.log("server is runing...");

})

app.get("/",function (req,res){
    res.send("hello world");
})

app.get("/bong-da",function(req,res){
    res.send("bong da 24h");
})

app.get("/vui-choi",function(req,res){
    res.send("truong van nam ");
})