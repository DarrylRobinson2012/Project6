//
//  CharacterViewController.swift
//  Project6
//
//  Created by Darryl Robinson  on 10/31/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import UIKit

class CharcterViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var person = [People]()
    
    
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var eyesLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var smallestLabel: UILabel!
    @IBOutlet weak var LargestLabel: UILabel!
    
    
    @IBOutlet weak var pickwheel: UIPickerView!

    
    
    
    //Picker view data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return person.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return person[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bornLabel.text = person[row].born
        homeLabel.text = person[row].home
        heightLabel.text = person[row].height
        eyesLabel.text = person[row].eyes
        hairLabel.text = person[row].hair
        mainLabel.text = person[row].name
        
        TaskManger.fetchPLanet(plantUrl: person[row].home!, completion:{ [unowned self] planet
            in
            let personPlanet = planet.name
            
            DispatchQueue.main.async {
                self.homeLabel.text = personPlanet
            }
                
        
    }
        )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskManger.fetchPeoplePage1{ [unowned self] people in
            self.person = people.results
            
           // print(self.person)
            print("******************************")
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.pickwheel.reloadAllComponents()
                
                
                var peopleLengthArray = [Int]()
              
                
                for people in self.person {
                    peopleLengthArray.append(Int(people.height!)!)
                }
                let largest = peopleLengthArray.max()
                let smallest = peopleLengthArray.min()
                
                for people in self.person {
                    if Int(people.height!) == largest {
                        self.LargestLabel.text = people.name
                    }
                    if Int(people.height!) == smallest {
                        self.smallestLabel.text = people.name
                    }
                }
                
            }
            
            
            
        }
        
        
        
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    
}
