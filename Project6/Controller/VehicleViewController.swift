//
//  VehicleViewController.swift
//  Project6
//
//  Created by Darryl Robinson  on 10/31/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//


import UIKit

class VehicleViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var whips = [Vehicles]()
    var stashipsMake = [String]()
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
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
        return whips.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return whips[row].model
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        makeLabel.text = whips[row].make
        costLabel.text = whips[row].cost
        lengthLabel.text = whips[row].length
        classLabel.text = whips[row].cLass
        crewLabel.text = whips[row].crew
        mainLabel.text = whips[row].model
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskManger.fetchVehiclesPage1 { [unowned self] whips in
            self.whips = whips.results
            
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.pickwheel.reloadAllComponents()
             
           
                var wipslength = [Double]()
                
                for whips in self.whips {
                    wipslength.append(Double(whips.length)!)
                }
                let largest = wipslength.max()
                let smallest = wipslength.min()
                
                for whips in self.whips {
                    if Double(whips.length) == largest {
                        self.LargestLabel.text = whips.model
                    }
                    if Double(whips.length) == smallest {
                        self.smallestLabel.text = whips.model
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
