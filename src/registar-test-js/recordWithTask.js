const http = require("http");

Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

const generateRandomNumbers = (min, max, times) => {
    const randoms = []

    for (let i = 0; i < times; i++) {
        randoms.push(Math.floor(Math.random() * (max - min) + min))
    }

    return randoms
}

function recordWithTask(callback) {
    const now = new Date();
    const isoString = now.addDays(6).toISOString();

    // Number = 1,
    // WeldingCurrentMin = 200,
    // WeldingCurrentMax = 270,
    // ArcVoltageMin = 23,
    // ArcVoltageMax = 26

    // Number = 2,
    // WeldingCurrentMin = 270,
    // WeldingCurrentMax = 310,
    // ArcVoltageMin = 23,
    // ArcVoltageMax = 26

    const postData = JSON.stringify({
        tID: "1c43909c-5aae-487d-a4fd-0ebd6939c125",
        PasN: 2,
        preTemp: 12.2,
        RegID: "string",
        EqpID: "69f00ef3-6fda-4076-a381-a63234731fb0",
        EplID: "134ff62e-b491-4f47-9fab-ae9071244c2f",
        SDT: isoString,
        Amp: generateRandomNumbers(270, 315, 900),
        Volt: generateRandomNumbers(23, 26, 900),
    });

    const options = {
        hostname: "localhost",
        port: 5006,
        path: "/api/registar/recordWithTask",
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
            callback(null, data);
        });
    });

    req.on("error", (error) => {
        callback(error);
    });

    req.write(postData);
    req.end();
}

recordWithTask((error, data) => {
    if (error) {
        console.error(error);
    } else {
        console.log(data);
    }
});