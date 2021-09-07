//
//  WeatherService.swift
//  CoolWeatherApp
//
//  Created by Stepanyan Arman  on 30.08.2021.
//

import Foundation
import CoreLocation

protocol WeatherReciever {
    func frfrf()
}

protocol WeatherService {
    func getWeather(for location: CLLocation)
}

class WeatherServiceDefault: WeatherService {
    func getWeather(for location: CLLocation) {
        print(location.coordinate.latitude, location.coordinate.longitude)
    }
}
