//
//  WeatherModel.swift
//  Clima
//
//  Created by Jason Bakker on 14/03/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//
import UIKit
import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var morningCoffeeLogoImages: [UIImage] = [#imageLiteral(resourceName: "889370 - coffee espresso"),#imageLiteral(resourceName: "889365 - coffee cup espresso espresso cup m"),#imageLiteral(resourceName: "889366 - barista coffee espresso flat white"),#imageLiteral(resourceName: "889364 - cappuccino coffee espresso milk mi"),#imageLiteral(resourceName: "889363 - barista cafe caffe coffee latte ma"),#imageLiteral(resourceName: "889383 - americano barista coffee espresso "),#imageLiteral(resourceName: "889377 - barista coffee coffee pot espresso"),#imageLiteral(resourceName: "889371 - bodum coffee coffee maker french f"),#imageLiteral(resourceName: "1046687 - barista coffee coffee machine fil")]
    var allDayCoffeeLogoImages: [UIImage] = [#imageLiteral(resourceName: "889370 - coffee espresso"),#imageLiteral(resourceName: "889385 - aero press aeropress barista brewi"),#imageLiteral(resourceName: "889375 - barista chemex coffee coffee maker"),#imageLiteral(resourceName: "889377 - barista coffee coffee pot espresso"),#imageLiteral(resourceName: "889373 - barista coffee espresso maker syph"),#imageLiteral(resourceName: "889371 - bodum coffee coffee maker french f"),#imageLiteral(resourceName: "1046687 - barista coffee coffee machine fil"),#imageLiteral(resourceName: "889383 - americano barista coffee espresso "),#imageLiteral(resourceName: "889366 - barista coffee espresso flat white")]
    var hotDayCoffeeLogoImages: [UIImage] = [#imageLiteral(resourceName: "889385 - aero press aeropress barista brewi"),#imageLiteral(resourceName: "889375 - barista chemex coffee coffee maker"),#imageLiteral(resourceName: "iconfinder_Ice_Tea_2976465")]
    
    let calendar = Calendar.current
    let date = Date()
    
    
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
            
        }
    }
    
    func checkTimeForCoffee() -> UIImage {
        let hour = calendar.component(.hour, from: date)
        if hour < 11 {
            return morningCoffeeLogoImages[Int.random(in: 0...8)]
        } else {
            return allDayCoffeeLogoImages[Int.random(in: 0...8)]
        }
    }
    
    func iceCoffeeTime() -> UIImage {
        let hour = calendar.component(.hour, from: date)
        if hour < 11 {
            return morningCoffeeLogoImages[Int.random(in: 0...8)]
        } else {
            return hotDayCoffeeLogoImages[Int.random(in: 0...3)]
        }
    }
    
    var coffeeIcon: UIImage {
        switch conditionId {
        case 200...232:
            return checkTimeForCoffee()
        case 300...321:
            return checkTimeForCoffee()
        case 500...531:
            return checkTimeForCoffee()
        case 600...622:
            return checkTimeForCoffee()
        case 701...781:
            return checkTimeForCoffee()
        case 800:
            return iceCoffeeTime()
        case 801...804:
            return checkTimeForCoffee()
        default:
            return checkTimeForCoffee()
        }
    }
}
