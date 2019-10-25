//
//  ViewController.swift
//  SelectExample
//
//  Created by Banco Fassil on 10/25/19.
//  Copyright © 2019 BancoFassil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    

    @IBOutlet weak var pickerNamesCountries: UIPickerView!
    @IBOutlet weak var pickerNamesCities: UIPickerView!
    
    // values Countries
    static let pickerCountries: [String] = ["Bolivia", "Chile", "Peru"]
    // values Cities
    static let pickerCitiesBolivia: [String] = ["Santa Cruz", "La Paz", "Chuquisaca", "Oruro"]
    static let pickerCitiesChile: [String] = ["Santiago de Chile", "Viña del Mar", "Arica", "Iquique"]
    static let pickerCitiesPeru: [String] = ["Lima", "Arequipa", "Trujillo", "Puno"]
    // values Helpers
    var listCitesKeyValue :[String: [String]] = [:]
    var listCites :[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValuesPicker()
    }
    
    func initValuesPicker()  {
        listCites.append(ViewController.pickerCitiesBolivia)
        listCites.append(ViewController.pickerCitiesChile)
        listCites.append(ViewController.pickerCitiesPeru)
        
        pickerNamesCountries.delegate = self
        pickerNamesCountries.dataSource = self

        pickerNamesCities.delegate = self
        pickerNamesCities.dataSource = self
        for (index, item) in  ViewController.pickerCountries.enumerated() {
            listCitesKeyValue[item] = listCites[index]
        }
    }
    
    // MARCK override for method picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerNamesCountries {
            return ViewController.pickerCountries.count
        } else {
            let positionCountry = pickerNamesCountries.selectedRow(inComponent: 0)
            let nameCountry = ViewController.pickerCountries[positionCountry]
            let value = listCitesKeyValue[nameCountry]
            return value!.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerNamesCountries {
            return ViewController.pickerCountries[row]
        } else  {
            let positionCountry = pickerNamesCountries.selectedRow(inComponent: 0)
            let nameCountry = ViewController.pickerCountries[positionCountry]
            let value = listCitesKeyValue[nameCountry]
            return value![row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerNamesCountries {
            pickerNamesCities.reloadAllComponents()
        }
    }
}

