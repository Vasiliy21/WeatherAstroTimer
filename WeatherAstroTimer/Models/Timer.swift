//
//  Timer.swift
//  WeatherAstroTimer
//
//  Created by Vasiliy on 13.08.2022.
//

struct Timer: Codable {
    let product: String
    let dataseries: [DataSeries]
}


struct DataSeries: Codable {
    let timepoint: Int
    let cloudcover: Int
    let seeing: Int
    let wind10m: WindSpeed
    let temp2m: Int

    var description: String {
        """
        Погода через \(timepoint) будет:
        Температура: \(temp2m)
        Облачность: \(cloudcover)
        Скорость ветра: \(wind10m)
        Видимость: \(seeing)
        """
    }
}

struct WindSpeed: Codable {
    let direction: String
    let speed: Int
}

//enum Direction: String, Codable {
//    case s = "S"
//    case se = "SE"
//    case sw = "SW"
//    case w =  "W"
//}

