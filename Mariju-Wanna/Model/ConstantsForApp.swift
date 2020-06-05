//
//  ConstantsForApp.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 01/06/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

struct ConstantsForApp {
    static var name = ""
    static var strain = "Sativa"
    static var effect = "Relaxed"
    static var flavor = "Earthy"
    static let effects = ["Relaxed","Dizzy","Hungry","Euphoric","Happy","Depression","Insomnia","Pain","Stress","Cramps","Creative","Energetic","Talkative","LackofAppetite","Nausea","DryMouth","Headache","Uplifted","Tingly","Paranoid","Sleepy","Fatigue","Headaches","DryEyes","Focused","EyePressure","Anxious","Giggly","Aroused","Inflammation","Spasticity","Seizures","MuscleSpasms"]
    static let flavors = ["Earthy","Chemical","Pine","Spicy/Herbal","Pungent","Pepper","Flowery","Citrus","Orange","Sweet","Skunk","Grape","Minty","Woody","Cheese","Diesel","Tropical","Grapefruit","Nutty","Lemon","Berry","Blueberry","Ammonia","Apple","Rose","Butter","Honey","Tea","Lime","Lavender","Strawberry","Mint","Chestnut","TreeFruit","Pear","Apricot","Peach","BlueCheese","Menthol","Coffee","Tar","Mango","Pineapple","Sage","Vanilla","Plum","Tobacco","Violet"]
    
    static var nameSearched = [resultName]()
    static var strainSearched = [resultStrain]()
    static var effectSearched = [resultEffect]()
    static var flavorSearched = [resultFlavor]()
    static var selected = 0
    
    
    static let vc = ViewController()
    static let resultsVC = ResultsTableViewController()

}

struct resultName:Codable {
    var name:String?
    var race:String?
    var desc:String?
}

struct resultStrain:Codable{
    var name:String?
}

struct resultEffect:Codable{
    var name:String?
    var race:String?
}
struct resultFlavor:Codable {
    var name:String?
    var race:String?
}
