//
//  ExchangeRateService.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import Foundation

struct ExchangeRateService {
    func fetchExchangeRates(completion: @escaping (Result<[String: Double], Error>) -> Void) {
        guard let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=fb60e41baef34f6bbc5e29c470a1af7c") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: 0, userInfo: nil)))
                return
            }

            do {
                let response = try JSONDecoder().decode(ExchangeRatesResponse.self, from: data)
                completion(.success(response.rates))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

struct ExchangeRatesResponse: Codable {
    let rates: [String: Double]
}

