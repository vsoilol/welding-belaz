const http = require("http");

const REGISTAR_URL = "http://localhost:5006";

Date.prototype.addDays = function(days) {
  var date = new Date(this.valueOf());
  date.setDate(date.getDate() + days);
  return date;
}

setInterval(() => {
  const now = new Date();
  const isoString = now.addDays(6).toISOString();

  const postData = JSON.stringify({
    RegID: "sdfsdf",
    EplRF: "D7:F1:7D:5A",
    EqpRF: "A6:F1:CF:48",
    SDT: isoString,
  });

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
      console.log(data);
    });
  });

  req.on("error", (error) => {
    console.error(error);
  });

  req.write(postData);
  req.end();
}, 5000);


