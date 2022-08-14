//
//  Timer.swift
//  WeatherAstroTimer
//
//  Created by Vasiliy on 13.08.2022.
//

struct Timer: Decodable {
    let product: String
    let dataseries: [DataSeries]
}


struct DataSeries: Decodable {
    let timepoint: Int
    let cloudcover: Int
    let seeing: Int
    let wind10m: [WindSpeed]
    let temp2m: Int


    var description: String {
        """
        Погода через \(timepoint) будет:
        Температура: \(temp2m)
        Облачность: \(cloudcover)
        Видимость: \(seeing)
        Скорость ветра: \(wind10m)
        """
    }
}

struct WindSpeed: Decodable {
    let direction: String
    let speed: Int
}
