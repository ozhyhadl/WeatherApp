//
//  CurrentWeatherManager.swift
//  WeatherSwiftUI
//
//  Created by User on 05.03.2021.
//

import Foundation

// MARK: - Current Weather Manager

extension WeatherManager {
    
    func getCurrentTemperature() -> String {
        guard let weatherData = weatherData else { return "-" }
        
        let temperature = Int(weatherData.current.tempC)
        return "\(temperature) °"
    }
    
    func getCurrentWeatherText() -> String{
        guard let weatherData = weatherData else { return "" }
        
        return weatherData.current.condition.text
    }
    
    func getCurrentImage() -> String {
        guard let weatherData = weatherData else { return "sun.max.fill" }
        print(weatherData.current.condition.text)
        return getImageName(name: weatherData.current.condition.text)
    }
}
