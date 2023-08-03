//
//  ForecastView.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-08-02.
//

import Foundation
import SwiftUI
struct ForecastView: View {
    var weatherData: WeatherData?
        
        var body: some View {
            VStack(spacing: 20) {
                Text("7-Day Forecast")
                    .font(.title)
                
                if let weatherData = weatherData {
                    List(weatherData.daily, id: \.dt) { dailyWeather in
                        WeatherRow(cityName: weatherData.timezone, temperature: "\(kelvinToCelsius(dailyWeather.temp.day))°C", uvIndex: "\(dailyWeather.uvi)", wind: "\(dailyWeather.wind_speed) km/h", tempLow: "\(kelvinToCelsius(dailyWeather.temp.min))°C")
                    }
                } else {
                    Text("Loading weather data...")
                }
            }
            .padding()
        }

        private func kelvinToCelsius(_ kelvin: Double) -> Double {
            return kelvin - 273.15
        }
}
