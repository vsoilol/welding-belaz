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
        tID: "31b32617-5ce8-454d-8f60-a058b4d7965d",
        PasN: 2,
        preTemp: 12.2,
        RegID: "string",
        EqpID: "cc38be9c-9245-4211-a4bc-f7975a341708",
        EplID: "e0c4b3ae-d915-41a9-a9a2-bc4efcbbebfa",
        SDT: isoString,
        Amp: generateRandomNumbers(260, 320, 500),
        Volt: generateRandomNumbers(22, 28, 500),
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