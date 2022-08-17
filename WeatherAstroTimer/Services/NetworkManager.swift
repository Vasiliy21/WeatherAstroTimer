//
//  NetworkManager.swift
//  WeatherAstroTimer
//
//  Created by Vasiliy on 13.08.2022.
//

import Foundation

enum Link: String {
    case timerURL = "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

//    func fetchTimer(from url: String?, completion: @escaping(Result<Timer,NetworkError>) -> Void) {
//        guard let url = URL(string: url ?? "") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//            do {
//                let timer = try JSONDecoder().decode(Timer.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(timer))
//                }
//            } catch {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
}

