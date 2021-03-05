//
//  WeatherManager.swift
//  WeatherSwiftUI
//
//  Created by User on 05.03.2021.
//

import UIKit

final class WeatherManager: ObservableObject {
    @Published var weatherData: Weather?
    
    
    func getWeatherData() {
        guard weatherData == nil else { return }
        GetRequest.shared.getWeather { [self] data in
            guard let data = data else { return }
            weatherData = data
        }
    }
    
    
    func getImageName(name: String) -> String {
        
        switch name {
        case "Sunny": return "sun.max.fill"
        case "Partly cloudy": return "cloud.sun.fill"
        case "Cloudy": return "cloud.fill"
        case "Overcast": return "cloud.drizzle.fill"
        case "Clear": return "moon.fill"
        case "Mist", "Freezing fog", "Fog": return "smoke.fill"
        case "Patchy rain possible": return "cloud.sun.rain.fill"
        case "Patchy snow possible": return "cloud.snow.fill"
        case "Heavy rain", "Light rain": return "cloud.bolt.rain.fill"
        case "Light snow", "Heavy snow", "Blowing snow", "Blizzard": return "snow"
        default: return "cloud.sun.fill"
        }
    }
}
