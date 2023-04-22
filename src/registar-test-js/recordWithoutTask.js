const http = require("http");

function recordWithoutTask(callback) {
    const now = new Date();
    const isoString = now.toISOString();

    const postData = JSON.stringify({
        RegID: "string",
        EqpID: "b6c05a58-4d68-4591-af21-e334aba53e94",
        EplID: "da16dc46-5955-4cbf-ab57-f6aaeaf77e94",
        SDT: isoString,
        Amp: [
            115.8, 135.4, 87.8, 150.0, 103.0, 133.1, 122.6, 122.9, 146.9, 122.2, 146.9, 124.6, 117.5, 134.4, 106.0,
            109.7, 111.4, 103.3, 107.0, 96.2, 109.4, 123.6, 109.7, 70.59, 101.0, 125.0, 51.3, 95.2, 94.2, 83.4, 140.19,
            62.5, 95.2, 132.0, 62.1, 94.9, 77.7, 78.7, 120.6, 52.3, 78.0, 102.3, 77.7, 57.4, 119.2, 91.2, 52.3, 101.0,
            87.8, 68.5, 101.6, 53.3, 124.6, 57.0, 111.4, 29.7, 77.0, 22.2, 66.8, 49.6, 81.7, 99.6, 8.4, 35.79, 40.5,
            47.2, 28.3, 27.0, 16.2, 22.6, 35.4, 14.5, 43.5, 21.2, 16.5, 15.2, 10.1, 37.1, 35.4, 35.4, 23.9, 19.89, 28.0,
            27.3, 17.2, 55.4, 27.7, 46.9, 38.5, 21.2, 15.5, 66.2, 18.5, 8.1, 13.1, 30.0, 43.5, 55.4, 49.3, 17.5, 81.4,
            61.1, 7.4, 11.4, 2.7, 18.2, 15.5, 32.7, 53.7, 76.59, 16.8, 44.2, 57.0, 29.3, 112.5, 44.2, 65.5, 41.5, 58.4,
            116.2, 29.3, 46.2, 44.5, 19.89, 53.7, 36.79, 136.8, 43.2, 28.0, 40.79, 100.3, 98.6, 7.0, 8.1, 6.7, 130.69,
            118.9, 8.4, 8.1, 125.3, 23.3, 13.5, 58.1, 130.69, 43.2, 86.8, 9.1, 34.7, 136.1, 24.6, 84.7, 15.5, 53.0,
            130.0, 8.69, 146.9, 30.7, 63.1, 88.1, 77.3, 37.1, 22.9, 121.2, 45.9, 62.8, 78.3, 56.4, 92.9, 54.3, 66.5,
            23.3, 59.1, 116.2, 86.1, 11.8, 118.5, 72.2, 26.6, 31.7, 159.69, 28.7, 159.4, 34.4, 147.6, 8.1, 25.6, 140.8,
            78.0, 130.4, 53.3, 134.1, 97.6, 105.0, 103.0, 125.6, 79.7, 139.5, 62.8, 159.4, 23.3, 140.5, 37.5, 127.3,
            78.3, 74.59, 95.6, 99.3, 94.5, 60.1, 132.4, 96.9, 142.9, 93.2, 116.2, 95.2, 113.5, 90.2, 128.69, 66.5,
            110.1, 114.1, 81.4, 116.8, 98.3, 109.4, 100.3, 108.1, 94.2, 100.6, 118.2, 96.2, 107.0, 112.1, 101.3, 105.4,
            106.0, 114.1, 97.2, 116.5, 99.3, 106.4, 121.2, 92.2, 116.5, 89.8, 105.7, 127.7, 96.6, 95.6, 107.0, 127.3,
            86.8, 124.6, 91.5, 91.8, 128.0, 92.2, 116.5, 55.4, 130.4, 128.3, 88.1, 130.4, 91.8, 106.7, 108.4, 112.1,
            115.5, 124.3, 69.2, 115.2, 102.0, 119.9, 106.0, 104.0, 122.6, 107.7, 111.1, 82.4, 121.2, 85.8, 88.5, 102.7,
            113.8, 100.6, 117.2
        ],
        Volt: [
            23.2, 25.3, 26.8, 23.8, 27.0, 24.9, 25.3, 25.0, 24.6, 24.9, 23.8, 25.0, 25.0, 22.4, 21.2, 21.4, 21.0, 20.9,
            20.7, 21.5, 20.6, 20.39, 20.3, 22.1, 21.2, 19.7, 22.1, 21.4, 21.5, 20.7, 18.89, 21.0, 20.8, 19.7, 21.6,
            19.6, 22.1, 20.0, 18.0, 21.6, 19.2, 19.0, 20.0, 20.2, 17.6, 19.0, 20.1, 18.7, 18.2, 20.2, 18.3, 19.6, 17.7,
            19.6, 16.8, 30.3, 17.1, 30.9, 16.89, 17.8, 15.7, 18.5, 22.0, 18.3, 17.8, 16.2, 17.1, 18.0, 25.9, 22.8, 22.7,
            57.3, 21.8, 27.4, 18.2, 18.0, 18.1, 14.7, 15.6, 15.4, 15.9, 16.7, 14.8, 15.2, 16.2, 13.1, 16.0, 13.6, 17.8,
            17.1, 16.2, 11.9, 16.5, 17.8, 16.8, 14.3, 13.2, 12.0, 12.2, 15.6, 9.5, 13.4, 18.39, 59.3, 63.4, 39.6, 44.7,
            14.7, 11.5, 10.6, 45.3, 21.8, 18.7, 38.7, 10.6, 15.6, 14.6, 14.7, 14.1, 11.6, 25.8, 17.5, 13.9, 34.79,
            19.89, 14.9, 10.5, 18.7, 15.9, 15.8, 12.2, 16.5, 41.2, 28.1, 36.2, 10.1, 14.0, 29.0, 29.0, 8.8, 57.5, 56.4,
            23.1, 8.8, 23.4, 14.8, 22.5, 43.1, 9.3, 20.6, 33.1, 29.8, 17.8, 11.8, 35.9, 9.9, 18.8, 15.1, 15.4, 13.6,
            49.0, 56.6, 10.4, 16.1, 13.9, 13.6, 14.5, 16.6, 14.8, 17.5, 16.8, 17.5, 13.7, 18.1, 47.1, 12.2, 16.2, 19.0,
            17.3, 15.5, 19.8, 14.4, 21.2, 15.7, 32.79, 48.6, 16.3, 20.2, 15.4, 19.3, 16.7, 17.5, 18.6, 18.39, 17.89,
            19.0, 17.1, 20.6, 16.2, 64.7, 22.5, 21.1, 18.0, 24.6, 19.0, 23.5, 17.8, 19.7, 20.6, 17.89, 18.7, 18.39,
            19.1, 18.8, 19.6, 21.4, 19.7, 18.39, 20.5, 19.6, 18.8, 20.3, 19.0, 20.39, 19.3, 19.6, 19.39, 20.3, 20.5,
            19.5, 20.0, 20.0, 19.6, 20.0, 19.7, 19.7, 20.1, 19.5, 19.89, 20.5, 19.6, 20.2, 19.89, 20.2, 20.7, 20.0,
            19.5, 19.8, 20.39, 19.3, 19.6, 21.0, 18.7, 21.2, 20.39, 19.1, 20.7, 19.1, 21.8, 19.39, 20.1, 20.1, 20.1,
            20.9, 20.0, 19.7, 19.89, 19.39, 19.3, 21.2, 19.6, 20.5, 19.6, 20.3, 19.8, 19.0, 20.6, 19.6, 21.1, 19.6,
            20.6, 20.5, 19.6, 20.39, 20.0, 19.7
        ]
    });

    const options = {
        hostname: "localhost",
        port: 5006,
        path: "/api/registar/recordWithoutTask",
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Content-Length": postData.length,
        },
    };

    const req = http.request(options, (res) => {
        // console.log(`Status code: ${res.statusCode}`);
        // console.log(`Headers: ${JSON.stringify(res.headers)}`);
        // console.log(`Data: ${res.url}`);
        // res.setEncoding("utf8");
        // res.on("data", (chunk) => {
        //   console.log(`Body: ${chunk}`);
        // });

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

recordWithoutTask((error, data) => {
    if (error) {
        console.error(error);
    } else {
        console.log(data);
    }
});
