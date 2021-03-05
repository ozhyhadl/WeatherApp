//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by User on 05.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDarkMode = false
    @ObservedObject var weather = WeatherManager()
    
    var body: some View {
        ZStack {
            BackgroundView(isDarkMode: $isDarkMode)
            
            VStack {
                CityTextView()
                TodayWeatherView(temperatureToday: weather.getCurrentTemperature(),
                                 imageName: weather.getCurrentImage(),
                                 text: weather.getCurrentWeatherText())
                
                
                HStack(spacing: 30) {
                    ForEach(0 ..< 5) {index in
                        ForecastNextDay(dayOfWeek: weather.getForecastDate(index),
                                       imageName: weather.getForecastImage(index),
                                       temperature: weather.getForecastTemperature(index))
                    }
                }
                Spacer()
                
                Button {
                    isDarkMode.toggle()
                        
                } label: {
                    WeatherButton(title: "Change Dark mode", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
            
            
            
        }.onAppear {
            weather.getWeatherData()
        }
        
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Forecast Next Day

struct ForecastNextDay: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40
                       , height: 40)
            Text(temperature)
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}


// MARK: - Background View

struct BackgroundView: View {
    
    @Binding var isDarkMode: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isDarkMode ?.black : .blue, isDarkMode ? .gray : Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - City Text View

struct CityTextView: View {
    var body: some View {
        Text("Zhitomir, Ukraine")
            .font(.system(size: 32, weight: .semibold))
            .foregroundColor(.white)
            .padding()
    }
}

// MARK: - Today Weather View

struct TodayWeatherView: View {
    var temperatureToday: String
    var imageName: String
    var text: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180
                       , height: 180)
                .padding(.bottom, 20)
            Text("Hevy snow")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
            Text(temperatureToday)
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
            
        }
        .padding(.bottom, 80)
    }
}

