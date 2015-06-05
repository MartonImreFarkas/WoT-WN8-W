//
//  ExpectedValuesDetailsViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit

class ExpectedValuesDetailsViewController: UIViewController {

    
    var vehicleData = VehicleDataStruct()
    var vehicleExpectedValues = ExpectedValueStruct()
    var vehiclePersonalData = VehiclePersonalData()
    
    var vehiclePersonalDataInteractor = VehiclePersonalDataInteractor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        vehiclePersonalData = vehiclePersonalDataInteractor.getVehicledataSync(vehicleData.tank_id!)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
}

extension ExpectedValuesDetailsViewController : UITableViewDataSource {
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
        if indexPath.row == 0 {
            return setupMainDataCell(tableView)
        }
        var cell = tableView.dequeueReusableCellWithIdentifier("ExpectedValuesSimpleDataTableViewCell") as! ExpectedValuesSimpleDataTableViewCell
        
        var percentage : Double = 0.0
        
        switch indexPath.row {
        case 1:
            cell.setupCell("", playerValue: "WolferWolfy", expectedValue: "Expected")
        case 2:
            
            // String(format: "%.02f", arguments: percentage)
            percentage = Double (vehiclePersonalData.allBattleStat.damage_dealt!) / Double (vehiclePersonalData.allBattleStat.battles!)
            cell.setupCell("Damage", playerValue:String(format: "%.02f", percentage),  expectedValue: "\(vehicleExpectedValues.expDamage!)")
        case 3:
            percentage = Double (vehiclePersonalData.allBattleStat.frags!) / Double (vehiclePersonalData.allBattleStat.battles!)
            cell.setupCell("Frags", playerValue:String(format: "%.02f", percentage), expectedValue: "\(vehicleExpectedValues.expFrag!)")
        case 4:
            percentage = Double (vehiclePersonalData.allBattleStat.spotted!) / Double (vehiclePersonalData.allBattleStat.battles!)
            cell.setupCell("Spots", playerValue:String(format: "%.02f", percentage), expectedValue: "\(vehicleExpectedValues.expSpot!)")
        case 5:
            percentage = Double (vehiclePersonalData.allBattleStat.dropped_capture_points!) / Double (vehiclePersonalData.allBattleStat.battles!)
            cell.setupCell("Def. points", playerValue:String(format: "%.02f", percentage), expectedValue: "\(vehicleExpectedValues.expDef!)")
        case 6:
            // check for 0 divisor
            percentage = Double (vehiclePersonalData.allBattleStat.wins!) * 100 / Double (vehiclePersonalData.allBattleStat.battles!)
            cell.setupCell("Win Rate", playerValue:String(format: "%.02f", percentage), expectedValue: "\(vehicleExpectedValues.expWinRate!)")
        default:
            println("default")
        }
        
            var emptyValues = ExpectedValueStruct()
            emptyValues.expDamage = 0
            emptyValues.expDef = 0
            emptyValues.expFrag = 0
            emptyValues.expSpot = 0
            emptyValues.expWinRate = 0
        
            return cell
            
            
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120.0 : 44.0
    }
    
    func setupMainDataCell(tableView: UITableView) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ExpectedValuesMainDataTableViewCell") as! ExpectedValuesMainDataTableViewCell

        cell.setupCell(vehicleData, wn8: Int(calculateWN8()), battles: 235)

        return cell
    }
    
    func calculateWN8() -> Double {
        
        var avgDmg = Double (vehiclePersonalData.allBattleStat.damage_dealt!) / Double (vehiclePersonalData.allBattleStat.battles!)
        var avgSpot = Double (vehiclePersonalData.allBattleStat.spotted!) / Double (vehiclePersonalData.allBattleStat.battles!)
        var avgFrag = Double (vehiclePersonalData.allBattleStat.frags!) / Double (vehiclePersonalData.allBattleStat.battles!)
        var avgDef = Double (vehiclePersonalData.allBattleStat.dropped_capture_points!) / Double (vehiclePersonalData.allBattleStat.battles!)
        var avgWinRate = Double (vehiclePersonalData.allBattleStat.wins!) * 100 / Double (vehiclePersonalData.allBattleStat.battles!)
        
        var rDAMAGE = avgDmg     / vehicleExpectedValues.expDamage!
        var rSPOT   = avgSpot    / vehicleExpectedValues.expSpot!
        var rFRAG   = avgFrag    / vehicleExpectedValues.expFrag!
        var rDEF    = avgDef     / vehicleExpectedValues.expDef!
        var rWIN    = avgWinRate / vehicleExpectedValues.expWinRate!
        
        var rWINc    = max(0,                     (rWIN    - 0.71) / (1 - 0.71) )
        var rDAMAGEc = max(0,                     (rDAMAGE - 0.22) / (1 - 0.22) )
        var rFRAGc   = max(0, min(rDAMAGEc + 0.2, (rFRAG   - 0.12) / (1 - 0.12)))
        var rSPOTc   = max(0, min(rDAMAGEc + 0.1, (rSPOT   - 0.38) / (1 - 0.38)))
        var rDEFc    = max(0, min(rDAMAGEc + 0.1, (rDEF    - 0.10) / (1 - 0.10)))

        var WN8FirstTry : Double = 980 * rDAMAGE + 210 * rDAMAGE * rFRAG + 155 * rFRAG * rSPOT + 75 * rDEF * rFRAG + 145 * min(1.8,rWIN)
        
        var WN8 : Double = 980 * rDAMAGEc + 210 * rDAMAGEc * rFRAGc + 155 * rFRAGc * rSPOTc + 75 * rDEFc * rFRAGc + 145 * min(1.8,rWINc)
        
        return WN8
    }

    
    
}

    extension ExpectedValuesDetailsViewController : UITableViewDelegate {
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        }
        
    }


