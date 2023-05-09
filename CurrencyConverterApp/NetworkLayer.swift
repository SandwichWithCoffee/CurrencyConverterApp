//
//  NetworkLayer.swift
//  CurrencyConverterApp
//
//  Created by 초코크림 on 2023/05/08.
//

import Foundation

enum NetworkError: Error{
    case badUrl
    case badStatusCode
}

struct NetworkLayer{
    static func fetchJson(completion: @escaping (CurrencyModel) -> Void){
        let urlString = "https://open.er-api.com/v6/latest/USD"
        guard let url = URL(string: urlString) else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{
                return
            }
            do{
                let currencyModel = try JSONDecoder().decode(CurrencyModel.self, from: data)
                completion(currencyModel)
            }catch{
                print("error :", error)
            }
        }.resume()
    }
    
    static func fetchJsonAsyncAwait() async throws -> CurrencyModel{
        let urlString = "https://open.er-api.com/v6/latest/USD"
        guard let url = URL(string: urlString) else{
            throw NetworkError.badUrl
        }
        
        do{
            let(data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw NetworkError.badStatusCode
            }
            
            let currencyModel = try JSONDecoder().decode(CurrencyModel.self, from: data)
            
            return currencyModel
        }
        catch{
            throw error
        }
    }
}
