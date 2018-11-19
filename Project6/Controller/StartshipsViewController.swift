//
//  StartshipsViewController.swift
//  Project6
//
//  Created by Darryl Robinson  on 10/31/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//


import UIKit

class StarshipsViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var starWhips = [Starships]()
    var stashipsMake = [String]()

    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var metricLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var smallestLabel: UILabel!
    @IBOutlet weak var LargestLabel: UILabel!
    
    
    @IBOutlet weak var pickwheel: UIPickerView!
    
    
    
    var tools = [String]()
    //Picker view data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return starWhips.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return starWhips[row].model
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bornLabel.text = starWhips[row].make
        costLabel.text = starWhips[row].cost
        lengthLabel.text = starWhips[row].length
        classLabel.text = starWhips[row].cLass
        crewLabel.text = starWhips[row].crew
        mainLabel.text = starWhips[row].model
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskManger.fetchStarshipsPage1 { [unowned self] starships in
            self.starWhips = starships.results
        
            //print(self.starWhips)
            print("******************************")
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.pickwheel.reloadAllComponents()
                //print(self.starWhips)
                
                var starshipslength = [Double]()
                
                for ships in self.starWhips {
                    starshipslength.append(Double(ships.length)!)
                }
                let largest = starshipslength.max()
                let smallest = starshipslength.min()
                
                for ships in self.starWhips {
                    if Double(ships.length) == largest {
                        self.LargestLabel.text = ships.model
                    }
                    if Double(ships.length) == smallest {
                        self.smallestLabel.text = ships.model
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
