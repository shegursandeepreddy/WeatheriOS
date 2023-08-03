//
//  WeatherCard.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-07-31.
//

import SwiftUI

struct WeatherCard: View {
    var weatherData: WeatherData
    
    // Function to convert Kelvin to Celsius
     private func kelvinToCelsius(_ kelvin: Double) -> Double {
         return kelvin - 273.15
     }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            VStack(spacing: 20) {
                Text("\(String(format: "%.1f", kelvinToCelsius(weatherData.current.temp)))°C") // Access the "temp" property from "main"
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundColor(.black)
                
                HStack(spacing: 20) {
                    VStack {
                        Text("UV Index")
                            .font(.headline)
                        Text("\(weatherData.current.uvi)") // Access the "uvIndex" property from "main"
                            .font(.subheadline)
                    
                    }
                    VStack {
                        Text("Wind")
                            .font(.headline)
                        Text("\(weatherData.current.wind_speed) km/h") // Access the "speed" property from "wind"
                            .font(.subheadline)
                    }
                    VStack {
                        Text("Feels Like")
                            .font(.headline)
                        Text("\("\(String(format: "%.1f", kelvinToCelsius(weatherData.current.feels_like)))°C")") // Access the "feels like" property from "main"
                            .font(.subheadline)
                    }
                }
                .foregroundColor(.black)
            }
            .padding()
        }
        .frame(height: 200)
        .padding()
    }
}
