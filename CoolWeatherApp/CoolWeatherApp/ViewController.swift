//
//  ViewController.swift
//  CoolWeatherApp
//
//  Created by Stepanyan Arman  on 23.08.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

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
    
    let sunsetTime: UILabel = {
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
    
    let sun = UIView(frame: CGRect(x: 0, y: 0, width: 348, height: 348))

    let secDay = UILabel()
    let thDay = UILabel()
    let foDay = UILabel()
    let fiDay = UILabel()
    let sixDay = UILabel()
    let sevDay = UILabel()
    let daysMok: [String] = ["Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    
    let secWeather = UIImageView()
    let thWeather = UIImageView()
    let foWeather = UIImageView()
    let fiWeather = UIImageView()
    let sixWeather = UIImageView()
    let sevWeather = UIImageView()
    let iconsMok: [UIImage] = [UIImage(named: "CloudyIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!, UIImage(named: "RainIcon")!]
    
    let secTemp = UILabel()
    let thTemp = UILabel()
    let foTemp = UILabel()
    let fiTemp = UILabel()
    let sixTemp = UILabel()
    let sevTemp = UILabel()
    let tempMock: [String] = ["24°", "19°", "22°", "10°", "21°", "25°",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for views in [cityName, celsiusSign, currentTime, sunriseTime, sunsetTime, descrWeather, temp,
                      sunsetIcon, sunriseIcon, secDay, thDay, foDay, fiDay, sixDay, sevDay, secWeather,
                      thWeather, foWeather, fiWeather, sixWeather, sevWeather, secTemp, thTemp, foTemp,
                      fiTemp, sixTemp, sevTemp, sun] {
            view.addSubview(views)

        }
        setup()
    }
        
    func setup(){
        
        sun.layer.cornerRadius = 174
        sun.backgroundColor = .red
        sun.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(-250)
        }
        
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
    




