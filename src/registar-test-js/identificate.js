const http = require("http");

const REGISTAR_URL = "http://localhost:5006";

Date.prototype.addDays = function (days) {
  var date = new Date(this.valueOf());
  date.setDate(date.getDate() + days);
  return date;
};

setInterval(() => {
  const now = new Date();
  const isoString = now.toISOString();

  const postData = JSON.stringify({
    RegID: "sdfsdf",
    EplRF: "32:06:D3:E5",
    EqpRF: "03:3D:93:0D",
    SDT: isoString,
  });

  console.log(isoString);

  const options = {
    hostname: "localhost",
    port: 5006,
    path: "/api/registar/identificate",
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Content-Length": postData.length,
    },
  };

  const req = http.request(options, (res) => {
    let data = "";
    res.on("data", (chunk) => {
      data += chunk;
    });
    res.on("end", () => {
      console.log("Send request");
    });
  });

  req.on("error", (error) => {
    console.error("Send request");
  });

  req.write(postData);
  req.end();
}, 5000);
