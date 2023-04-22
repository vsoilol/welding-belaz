const http = require("http");

const generateRandomNumbers = (min, max, times) => {
    const randoms = []

    for (let i = 0; i < times; i++) {
        randoms.push(Math.floor(Math.random() * (max - min) + min))
    }

    return randoms
}

function recordWithTask(callback) {
    const now = new Date();
    const isoString = now.toISOString();

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
        tID: "5b868974-2134-43d9-8ecd-3953b086accf",
        PasN: 2,
        preTemp: 12.2,
        RegID: "string",
        EqpID: "cc52f444-97f1-4aa9-b4dc-de0d3b3be3f8",
        EplID: "a9889668-a179-48d2-a4b0-ad1f1f2ec176",
        SDT: isoString,
        Amp: generateRandomNumbers(270, 315, 500),
        Volt: generateRandomNumbers(23, 26, 500),
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