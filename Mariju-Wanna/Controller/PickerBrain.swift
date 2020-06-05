//
//  PickerBrain.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 31/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

extension ViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return strains.count
        case 1:
            return ConstantsForApp.effects.count
        default:
            return ConstantsForApp.flavors.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
           return strains[row]
        case 1 :
            return ConstantsForApp.effects[row]
        default:
            return ConstantsForApp.flavors[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            // setting the selected to the constant in the ConstantsForApp
        case 0:
            ConstantsForApp.strain = strains[row]
        case 1:
            ConstantsForApp.effect = ConstantsForApp.effects[row]
        default:
            ConstantsForApp.flavor = ConstantsForApp.flavors[row]
        }
    }
    
}
