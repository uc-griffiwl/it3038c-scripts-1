var http = require ("http");
var fs = require("fs");
var os = require("os");
var ip = require("ip");

function myUptime(){
    uptime=os.uptime();
    days = Math.floor(uptime / 86400)
    hours = Math.floor(uptime % (86400) / 3600);
    minutes = Math.floor(uptime % 3600 / 600);
    seconds = Math.floor(uptime % 3600 % 60)

    return `Days:${days}, Hours:${hours}, Minutes:${minutes}, Seconds:${seconds}`;
}

http.createServer(function(req, res){
    if (req.url === "/") {
         fs.readFile("./public/index.html", "UTF-8", function(err,body){
             res.writeHead(200, {"Content-Type": "text/html"});
             res.end(body);
        });
    }
    else if (req.url.match("/sysinfo")) {
    currenttime = new Date(Date.now() - os.uptime());
    myHostname=os.hostname();
    myTotalMemory =((os.totalmem())/1048576);
    myFreeMemory =((os.freemem())/1048576);
    myCPUCount =os.cpus().length;
    html=`
    <!DOCTYPE HTML>
        <html>
            <head>
                <title> Node JS Sysinfo</title>
            </head>     
            <body>
                <p> Current Date and Time: ${currenttime} </P>
                <p> Hostname: ${myHostname} </p>
                <p> IP: ${ip.address()} </p>
                <p> Server Uptime: ${myUptime} </p>
                <p> Total Memory: ${myTotalMemory}MB </p>
                <p> Free Memory: ${myFreeMemory}MB </p>
                <p> Number of CPUs: ${myCPUCount} </p.
            </body>      
        </html>
        `
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(html);
}    else {
        res.writeHead(404, {"Content-Type": "text/plain"});
        res.end("404 file not found");
    }
}).listen(3000);


console.log("Server listening on port 3000");
