//
//  ViewController.swift
//  CoolWeatherApp
//
//  Created by Stepanyan Arman  on 23.08.2021.
//

import UIKit
import SnapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate{
    
    private let locationManager = CLLocationManager()
    private let weatherService: WeatherService = WeatherServiceDefault()

    let cityName: UILabel = {
        let city = UILabel()
        city.text = "New York"
        city.font = UIFont(name: "Rubik-Regular", size: 27)
        return city
    }()
    
    let celsiusSign: UILabel = {
        let sign = UILabel()
        sign.text = "°C"
        sign.font = UIFont(name: "Rubik-Regular", size: 24)
        return sign
    }()
    
    let currentTime: UILabel = {
        let currentTime = UILabel()
        currentTime.text = "8:00"
        currentTime.font = UIFont(name: "Rubik-Regular", size: 21)
        return currentTime
    }()
    
    let sunriseTime: UILabel = {
        let sunriseTime = UILabel()
        sunriseTime.text = "4:00"
        sunriseTime.alpha = 0.5
        sunriseTime.font = UIFont(name: "Rubik-Regular", size: 21)
        return sunriseTime
    }()
    
    private let sunsetTime: UILabel = {
        let sunsetTime = UILabel()
        sunsetTime.text = "20:00"
        sunsetTime.alpha = 0.5
        sunsetTime.font = UIFont(name: "Rubik-Regular", size: 21)
        return sunsetTime
    }()

    let descrWeather: UILabel = {
        let description = UILabel()
        description.text = "Понедельник. Солнечно!"
        description.font = UIFont(name: "Rubik-Medium", size: 21)
        return description
    }()
    
    let temp: UILabel = {
        let temp = UILabel()
        temp.text = "24"
        temp.font = UIFont(name: "Rubik-Light", size: 171)
        return temp
    }()
    
    let sunsetIcon: UIImageView = {
        let sunset = UIImageView(image: UIImage(named: "SunsetIcon"))
        return sunset
    }()
    
    let sunriseIcon: UIImageView = {
        let sunrise = UIImageView(image: UIImage(named: "SunriseIcon"))
        return sunrise
    }()
    
    
    let sun = UIView()
    var heightSun = -340
    
    
    let secDay = UILabel()
    let thDay = UILabel()
    let foDay = UILabel()
    let fiDay = UILabel()
    let sixDay = UILabel()
    let sevDay = UILabel()
    let daysMok: [String] = ["Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    
    
    var secWeather = UIImageView()
    var thWeather = UIImageView()
    var foWeather = UIImageView()
    var fiWeather = UIImageView()
    var sixWeather = UIImageView()
    var sevWeather = UIImageView()
    var iconsMok: [UIImage] = [UIImage(named: "CloudyIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!]
    
    var secTemp = UILabel()
    var thTemp = UILabel()
    var foTemp = UILabel()
    var fiTemp = UILabel()
    var sixTemp = UILabel()
    var sevTemp = UILabel()
    var tempMock: [String] = ["24°", "19°", "22°", "10°", "21°", "25°",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for views in [cityName, celsiusSign, currentTime, sunriseTime, sunsetTime, descrWeather, temp,
                      sunsetIcon, sunriseIcon, secDay, thDay, foDay, fiDay, sixDay, sevDay, secWeather,
                      thWeather, foWeather, fiWeather, sixWeather, sevWeather, secTemp, thTemp, foTemp,
                      fiTemp, sixTemp, sevTemp, sun] {
            view.addSubview(views)

        }
        
        setup()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.first else { return }
        locationManager.stopUpdatingLocation()
        weatherService.getWeather(for: location)
    }
    
    func setup(){
        
        let temps: [UILabel] = [secTemp, thTemp, foTemp, fiTemp, sixTemp, sevTemp]
        for (index, temp) in temps.enumerated(){
            temp.text = tempMock[index]
            temp.font = UIFont(name: "Rubik-Regular", size: 24)
            temp.snp.makeConstraints{
                $0.right.equalToSuperview().inset(57)
                if index == 0 {
                    $0.top.equalToSuperview().inset(533)
                } else {
                    $0.top.equalTo(temps[index - 1]).inset(40)
                }
            }
            
        }

        let weathers: [UIImageView] = [secWeather, thWeather, foWeather, fiWeather, sixWeather, sevWeather]
        for (index, icon) in weathers.enumerated(){
            icon.image = iconsMok[index]
            icon.snp.makeConstraints{
                $0.centerX.equalToSuperview()
                if index == 0 {
                    $0.top.equalToSuperview().inset(530)
                } else {
                    $0.top.equalTo(weathers[index - 1]).inset(40)
                }
            }
        }
        
        let days: [UILabel] = [secDay, thDay, foDay, fiDay, sixDay, sevDay]
        for (index, day) in days.enumerated() {
            day.text = daysMok[index]
            day.font = UIFont(name: "Rubik-Regular", size: 24)
            day.snp.makeConstraints{
                $0.left.equalToSuperview().inset(22)
                if index == 0 {
                    $0.top.equalToSuperview().inset(533)
                } else {
                    $0.top.equalTo(days[index - 1]).inset(40)
                }
            }
        }
        
        sun.layer.cornerRadius = 174
        sun.backgroundColor = .red
        sun.snp.makeConstraints{
            $0.size.equalTo(348)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(heightSun)
        }


        cityName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.topMargin.equalToSuperview().inset(22)
        }
        
        celsiusSign.snp.makeConstraints{
            $0.rightMargin.equalToSuperview().inset(12)
            $0.topMargin.equalToSuperview().inset(22)
        }
        
        currentTime.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(198)
        }
        
        sunriseTime.snp.makeConstraints{
            $0.top.equalToSuperview().inset(198)
            $0.left.equalToSuperview().inset(22)
        }
        
        sunsetTime.snp.makeConstraints{
            $0.top.equalToSuperview().inset(198)
            $0.right.equalToSuperview().inset(22)
        }
        
        descrWeather.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.topMargin.equalToSuperview().inset(285)
        }
        
        temp.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.topMargin.equalToSuperview().inset(309)
        }
        
        sunsetIcon.snp.makeConstraints{
            $0.top.equalToSuperview().inset(162)
            $0.left.equalToSuperview().inset(30)
        }
        
        sunriseIcon.snp.makeConstraints{
            $0.top.equalToSuperview().inset(162)
            $0.right.equalToSuperview().inset(28)
        }

    }
    
    
    
}
    




