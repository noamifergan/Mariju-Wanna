//
//  FetchData.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 01/06/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

extension ViewController{
    
    func fetchSearch(APIKey:String,element:String,specific:String){
        let urlString = "https://strainapi.evanbusse.com/" + APIKey + "/strains/search/" + element + "/" + specific
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else if error == nil && data != nil {
                let decoder = JSONDecoder()
                switch element {
                    //search by name
                case "name":
                    do {
                    ConstantsForApp.nameSearched = try decoder.decode([resultName].self, from: data!)
                    } catch {print("error parsing json - name")}
                    //search by race (AKA strain)
                case "race":
                    do{
                        ConstantsForApp.strainSearched = try decoder.decode([resultStrain].self, from: data!)
                    }
                    catch {print("error parsing json - strain")}
                    //search by effect
                case "effect":
                    do{
                        ConstantsForApp.effectSearched = try decoder.decode([resultEffect].self , from: data!)
                    }
                    catch{print("error parsing json - effect")}
                default:
                    // search by flavor
                    do {
                        ConstantsForApp.flavorSearched = try decoder.decode([resultFlavor].self, from: data!)
                    }catch{print("error parsing json - flavor")}
                    
                }
            }
        }
        task.resume()
        
    }

    
}
