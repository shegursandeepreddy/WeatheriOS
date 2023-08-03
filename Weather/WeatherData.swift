//
//  WeatherData.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-07-31.
//

import Foundation

struct WeatherData: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezone_offset: Int
    let current: CurrentWeather
    let minutely: [MinutelyWeather]
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}

struct CurrentWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double?
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct MinutelyWeather: Codable {
    let dt: Int
    let precipitation: Double
}

struct HourlyWeather: Codable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double?
    let weather: [WeatherInfo]
    let pop: Double
}

struct DailyWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let moonrise: Int
    let moonset: Int
    let moon_phase: Double
    let temp: Temperature
    let feels_like: FeelsLikeTemperature
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double?
    let weather: [WeatherInfo]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double
}

struct Temperature: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLikeTemperature: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}

//struct WeatherData: Codable {
//    let coord: Coordinate
//    let weather: [Weather]
//    let base: String
//    let main: Main
//    let visibility: Int
//    let wind: Wind
//    let clouds: Clouds
//    let dt: Int
//    let sys: Sys
//    let timezone: Int
//    let id: Int
//    let name: String
//    let cod: Int
//}
//
//struct Coordinate: Codable {
//    let lon: Double
//    let lat: Double
//}
//
//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let description: String
//    let icon: String
//}
//
//struct Main: Codable {
//    let temp: Double
//    let feels_like: Double
//    let temp_min: Double
//    let temp_max: Double
//    let pressure: Int
//    let humidity: Int
//}
//
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
//
//struct Clouds: Codable {
//    let all: Int
//}
//
//struct Sys: Codable {
//    let type: Int
//    let id: Int
//    let country: String
//    let sunrise: Int
//    let sunset: Int
//}
