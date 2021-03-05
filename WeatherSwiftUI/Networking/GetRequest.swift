//
//  GetRequest.swift
//  WeatherSwiftUI
//
//  Created by User on 05.03.2021.
//

import Alamofire

class GetRequest {
    
    static let shared = GetRequest()
    
    private var apiUrl = "https://api.weatherapi.com/v1/forecast.json?key=d51f1247be2c41c4a90145111210503&q=Zhitomir&days=10&aqi=no&alerts=no"
    
    func getWeather(completionHandler: @escaping(Weather?) -> ()) {
        AF.request(apiUrl).validate().responseDecodable(of: Weather.self) { (response) in
            if let data = response.value {
                completionHandler(data)
                return
            }
            completionHandler(nil)
        }
    }
}
