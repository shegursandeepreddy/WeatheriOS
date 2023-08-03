//
//  ContentView.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-07-25.
//

import SwiftUI
import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}


struct ContentView: View {
    @StateObject private var locationManagerDelegate = LocationManagerDelegate()
    @State private var weatherData: WeatherData?
    @State private var isSettingViewPresented = false
    @State private var isForecastViewPresented = false
    @State private var isAboutUsViewPresented = false
      


    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Good Morning!")
                    .font(.title)
                Spacer()
               
                Button(action: {
                                     isSettingViewPresented = true
                                 }) {
                                     Image(systemName: "gear")
                                 }
                                 .sheet(isPresented: $isSettingViewPresented) {
                                     SettingView()
                                 }
            
                Button(action: {
                    isForecastViewPresented = true
                }) {
                    Image(systemName: "cloud.sun.fill")
                }
                .sheet(isPresented: $isForecastViewPresented) {
                    ForecastView( weatherData: weatherData)
                }

                Button(action: {
                    isAboutUsViewPresented = true
                }) {
                    Image(systemName: "info.circle.fill")
                }
                .sheet(isPresented: $isAboutUsViewPresented) {
                    AboutUsView()
                }
            }
            .padding(.horizontal)
        
            if let weatherData = weatherData {
                WeatherCard(weatherData: weatherData)
              
            } else {
                Text("Loading weather data...")
            }
            
            
            List {
                     WeatherRow(cityName: "New York", temperature: "28°C", uvIndex: "2", wind: "8 km/h", tempLow: "18°C")
                     WeatherRow(cityName: "London", temperature: "22°C", uvIndex: "1", wind: "12 km/h", tempLow: "15°C")
                     WeatherRow(cityName: "Tokyo", temperature: "32°C", uvIndex: "3", wind: "6 km/h", tempLow: "25°C")
                 }
            
        }
        .onChange(of: locationManagerDelegate.userLocation) { userLocation in
                  // When user location changes, fetch weather data
                  guard let location = userLocation else { return }
                  fetchWeatherData(latitude: location.latitude, longitude: location.longitude)
              }
              .onAppear {
                  // Start location updates
                  locationManagerDelegate.startUpdatingLocation()
              }
     

    }

    func fetchWeatherData(latitude: Double, longitude: Double) {
        
        print(latitude)
        print(longitude)
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&appid=d808dbe21a6cebba0ecc3db4f4e5ad0a") else {
            print("Invalid API URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
    
    
            if let error = error {
                print("Error: \(error.localizedDescription)")
                // Handle the error and display a message to the user
                DispatchQueue.main.async {
                    self.weatherData = nil
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid HTTP response")
                // Handle the invalid HTTP response and display a message to the user
                DispatchQueue.main.async {
                    self.weatherData = nil
                }
                return
            }

            guard let data = data else {
                print("Empty data")
                // Handle the empty data response and display a message to the user
                DispatchQueue.main.async {
                    self.weatherData = nil
                }
                return
            }
            
      


            do {
        
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                // Handle the decoding error and display a message to the user
                DispatchQueue.main.async {
                    self.weatherData = nil
                }
            }
        }.resume()
    

    }
    
    
}



struct WeatherRow: View {
    var cityName: String
    var temperature: String
    var uvIndex: String
    var wind: String
    var tempLow: String

    var body: some View {
        HStack {
            Text(cityName)
                .font(.headline)
            Spacer()
            Text(temperature)
                .font(.subheadline)
            VStack(alignment: .leading) {
                Text("UV Index: \(uvIndex)")
                Text("Wind: \(wind)")
                Text("Temp Low: \(tempLow)")
            }
            .font(.caption)
        }
    }
}
