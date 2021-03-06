//
//  StrainTableViewCell.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 05/06/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

class StrainTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(result:resultStrain){
        textLabel?.text = "Name: " + "\(result.name ?? "Not Available")"
        textLabel?.font = .boldSystemFont(ofSize: 26)
        textLabel?.numberOfLines  = 0
        
    }
}
