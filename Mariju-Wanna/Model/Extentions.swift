//
//  Extentions.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 31/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
//MARK:- extention for buttons

extension UIButton{
    
    func pulsate(){
        let pusle = CASpringAnimation(keyPath: "transform.scale")
        pusle.duration = 0.35
        pusle.fromValue = 0.9
        pusle.toValue = 1
        pusle.autoreverses = false
        pusle.initialVelocity = 1
        pusle.damping = 20
        
        layer.add(pusle, forKey: nil)
    }
    
}

//MARK:- extentions for texfields

extension UITextField{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

//MARK:- extentions for pickers

extension UIPickerView  {
    func makeRoundedSquere(view:UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.addSubview(self)
    }
}
