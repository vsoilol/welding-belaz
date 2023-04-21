//new()
//                     {
//                         Name = "Корневой",
//                         Number = 1,
//                         WeldingCurrentMin = 200,
//                         WeldingCurrentMax = 270,
//                         ArcVoltageMin = 23,
//                         ArcVoltageMax = 26
//                     },
//                     new()
//                     {
//                         Name = "Заполняющий",
//                         Number = 2,
//                         WeldingCurrentMin = 270,
//                         WeldingCurrentMax = 310,
//                         ArcVoltageMin = 23,
//                         ArcVoltageMax = 26
//                     }


const generateRandomNumbers = (min, max, times) => {
    const randoms = []

    for (let i = 0; i < times; i++) {
        randoms.push(Math.floor(Math.random() * (max - min) + min))
    }

    return randoms
}

// Later call it like so
generateRandomNumbers(190, 280, 200)