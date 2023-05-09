//
//  Model.swift
//  CurrencyConverterApp
//
//  Created by 초코크림 on 2023/05/04.
//

import Foundation

//{
//  "result": "success",
//  "provider": "https://www.exchangerate-api.com",
//  "documentation": "https://www.exchangerate-api.com/docs/free",
//  "terms_of_use": "https://www.exchangerate-api.com/terms",
//  "time_last_update_unix": 1683072151,
//  "time_last_update_utc": "Wed, 03 May 2023 00:02:31 +0000",
//  "time_next_update_unix": 1683160541,
//  "time_next_update_utc": "Thu, 04 May 2023 00:35:41 +0000",
//  "time_eol_unix": 0,
//  "base_code": "USD",
//  "rates": {
//    "USD": 1,
//    "AED": 3.6725,
//    "AFN": 87.115132,
//    "ZWL": 1050.536157
//  }
//}
// 환율 정보 api : https://open.er-api.com/v6/latest/USD

struct CurrencyModel: Codable{
    let result: String?
    let provider: String?
    let baseCode: String?
    let rates: [String: Double]?
    let time: Int?
    
    enum CodingKeys: String, CodingKey{ // json 이름과 변수 지정 이름이 다를 때
        case result
        case provider
        case baseCode = "base_code"
        case rates
        case time = "time_last_update_unix"
    }
}
