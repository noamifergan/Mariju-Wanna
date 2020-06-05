//
//  ViewController.swift
//  Mariju-Wanna
//
//  Created by Noam Efergan on 30/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    //MARK:- Variables
    let strainPicker = UIPickerView()
    let strains = ["Sativa","Indica","Hybrid"]
    let logo = UIImageView()
    let chooser = UISegmentedControl(items: ["Name","Strain","Effect","Flavor"])
    let nameTextField = UITextField()
    let effectsPicker = UIPickerView()
    let flavorPicker = UIPickerView()
    let searchButton = UIButton()
// MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4850801826, green: 0.7734418511, blue: 0.4870281816, alpha: 1)
        effectsPicker.delegate = self
        effectsPicker.dataSource = self
        strainPicker.delegate = self
        strainPicker.dataSource = self
        flavorPicker.delegate = self
        flavorPicker.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        addLogo()
        addChooser()
        addNameTextField()
        addStrainsPicker()
        addEffectsPicker()
        addFlavorPicker()
        addSearchButton()
        showRelevantSearchOption()
    }
    
    //MARK:- Adding functions
    
    func addLogo(){
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "leafIcon")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            logo.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.5),
            logo.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5),
            logo.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -150)
        ])
    }
    func addChooser(){
        chooser.translatesAutoresizingMaskIntoConstraints = false
        chooser.layer.cornerRadius = 26
        chooser.selectedSegmentIndex = 0
        chooser.addTarget(self, action: #selector(showRelevantSearchOption), for: .valueChanged)
        view.addSubview(chooser)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            chooser.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            chooser.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            chooser.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.95),
            chooser.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func addNameTextField(){
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.layer.cornerRadius = 10
        nameTextField.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        nameTextField.textAlignment = .center
        nameTextField.clearsOnBeginEditing = true
        nameTextField.addDoneButtonOnKeyboard()
        view.addSubview(nameTextField)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            nameTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.95),
            nameTextField.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: chooser.bottomAnchor, constant: 20),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func addStrainsPicker(){
        strainPicker.makeRoundedSquere(view: view)
        strainPicker.tag = 0
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            strainPicker.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.95),
            strainPicker.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            strainPicker.topAnchor.constraint(equalTo: chooser.bottomAnchor, constant: 20),
            strainPicker.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func addEffectsPicker(){
        effectsPicker.makeRoundedSquere(view: view)
        effectsPicker.tag = 1
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            effectsPicker.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.95),
            effectsPicker.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            effectsPicker.topAnchor.constraint(equalTo: chooser.bottomAnchor, constant: 20),
            effectsPicker.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func addFlavorPicker(){
        flavorPicker.makeRoundedSquere(view: view)
        flavorPicker.tag = 2
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            flavorPicker.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.95),
            flavorPicker.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            flavorPicker.topAnchor.constraint(equalTo: chooser.bottomAnchor, constant: 20),
            flavorPicker.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    func addSearchButton(){
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.layer.cornerRadius = 26
        searchButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchSet), for: .touchUpInside)
        view.addSubview(searchButton)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -50),
            searchButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            searchButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7),
            searchButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

//MARK:- Other functions
    
    @objc func showRelevantSearchOption(){
        switch chooser.selectedSegmentIndex {
        case 0:
            ConstantsForApp.selected = 0
            nameTextField.isHidden = false
            nameTextField.isUserInteractionEnabled = true
            strainPicker.isHidden = true
            strainPicker.isUserInteractionEnabled = false
            effectsPicker.isHidden = true
            effectsPicker.isUserInteractionEnabled = false
            flavorPicker.isHidden = true
            flavorPicker.isUserInteractionEnabled = false
            
        case 1:
            ConstantsForApp.selected = 1
            nameTextField.isHidden = true
            nameTextField.isUserInteractionEnabled = false
            strainPicker.isHidden = false
            strainPicker.isUserInteractionEnabled = true
            effectsPicker.isHidden = true
            effectsPicker.isUserInteractionEnabled = false
            flavorPicker.isHidden = true
            flavorPicker.isUserInteractionEnabled = false
            
        case 2:
            ConstantsForApp.selected = 2
            effectsPicker.reloadAllComponents()
            nameTextField.isHidden = true
            nameTextField.isUserInteractionEnabled = false
            strainPicker.isHidden = true
            strainPicker.isUserInteractionEnabled = false
            effectsPicker.isHidden = false
            effectsPicker.isUserInteractionEnabled = true
            flavorPicker.isHidden = true
            flavorPicker.isUserInteractionEnabled = false
        default:
            ConstantsForApp.selected = 3
            flavorPicker.reloadAllComponents()
            nameTextField.isHidden = true
            nameTextField.isUserInteractionEnabled = false
            strainPicker.isHidden = true
            strainPicker.isUserInteractionEnabled = false
            effectsPicker.isHidden = true
            effectsPicker.isUserInteractionEnabled = false
            flavorPicker.isHidden = false
            flavorPicker.isUserInteractionEnabled = true
        }

    }
    
    //Keybaord pushs up the view
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func searchSet(){
        //set function to each segmented choosen
        switch chooser.selectedSegmentIndex {
        case 0:
            guard let name = nameTextField.text else {return}
           fetchSearch(APIKey: Secrets.APIKey, element: "name", specific: name)
            

        case 1:
            fetchSearch(APIKey: Secrets.APIKey, element: "race", specific: ConstantsForApp.strain)

        case 2:
            fetchSearch(APIKey: Secrets.APIKey, element: "effect", specific: ConstantsForApp.effect)

        default:
            fetchSearch(APIKey: Secrets.APIKey, element: "flavor", specific: ConstantsForApp.flavor)
        }
        createSpinnerView()
    }
    
    func createSpinnerView() {
        let child = SpinnerViewController()
        
        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            ConstantsForApp.resultsVC.tableView.reloadData()
            self.navigationController?.present(ConstantsForApp.resultsVC, animated: true, completion: nil)
            
        }
    }
}
