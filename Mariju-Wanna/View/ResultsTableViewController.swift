//
//  ResultsTableViewController.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 03/06/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameCell")
        tableView.register(StrainTableViewCell.self, forCellReuseIdentifier: "StrainCell")
        tableView.register(EffectTableViewCell.self, forCellReuseIdentifier: "EffectCell")
        tableView.register(FlavorTableViewCell.self, forCellReuseIdentifier: "FlavorCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ConstantsForApp.selected{
       case 0:
        return ConstantsForApp.nameSearched.count
       case 1:
        return ConstantsForApp.strainSearched.count
       case 2:
        return ConstantsForApp.effectSearched.count
       default:
        return ConstantsForApp.flavorSearched.count
        }


    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch ConstantsForApp.selected {
        case 0:
            let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameTableViewCell
            let name = ConstantsForApp.nameSearched[indexPath.row]
            nameCell.set(result: name)
            return nameCell
        case 1:
            let strainCell = tableView.dequeueReusableCell(withIdentifier: "StrainCell", for: indexPath) as! StrainTableViewCell
            let strain = ConstantsForApp.strainSearched[indexPath.row]
            strainCell.set(result: strain)
            return strainCell
        case 2:
            let effectCell = tableView.dequeueReusableCell(withIdentifier: "EffectCell", for: indexPath) as! EffectTableViewCell
            let effect = ConstantsForApp.effectSearched[indexPath.row]
            effectCell.set(result: effect)
            return effectCell
        default:
            let flavorCell = tableView.dequeueReusableCell(withIdentifier: "FlavorCell", for: indexPath) as! FlavorTableViewCell
            let flavor = ConstantsForApp.flavorSearched[indexPath.row]
            flavorCell.set(result: flavor)
            return flavorCell
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
