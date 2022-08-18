//
//  NetworkManager.swift
//  WeatherAstroTimer
//
//  Created by Vasiliy on 13.08.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case timerURL = "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchTimer(from url: String, completion: @escaping(Result<Timer, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Timer.self) { dataResponse in
               switch dataResponse.result {
               case .success(let timer):
                   completion(.success(timer))
               case .failure(let error):
                   completion(.failure(error))
               }
            }
    }
}
