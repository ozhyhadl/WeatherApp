//
//  ForecastWeatherManager.swift
//  WeatherSwiftUI
//
//  Created by User on 05.03.2021.
//

import Foundation

// MARK: - Forecast Manager

extension WeatherManager {
    
    func getForecastImage(_ index: Int) -> String {
        guard let weatherData = weatherData,
              weatherData.forecast.forecastday.count > index else { return "sun.max.fill" }
        let conditionText = weatherData.forecast.forecastday[index].day.condition.text
        
        return getImageName(name: conditionText)
    }
    
    func getForecastTemperature(_ index: Int) -> String {
        guard let weatherData = weatherData,
              weatherData.forecast.forecastday.count > index else { return "-" }
        
        let temperature = Int(weatherData.forecast.forecastday[index].day.avgtempC)
        return "\(temperature) °"
    }
    
    func getForecastDate(_ index: Int) -> String{
        guard let weatherData = weatherData,
              weatherData.forecast.forecastday.count > index else { return "-" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: weatherData.forecast.forecastday[index].date) else { return "-" }
        
        dateFormatter.dateFormat = "MM.dd"
        dateFormatter.string(from: date)
    
    
        return dateFormatter.string(from: date)
    }
}
