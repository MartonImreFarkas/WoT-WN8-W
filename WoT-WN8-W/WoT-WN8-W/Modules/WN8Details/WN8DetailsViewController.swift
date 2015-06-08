//
//  WN8DetailsViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 08/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit


protocol WN8DetailsView : class {
    weak var presenter : protocol <WN8DetailsPresenterEventHandler>? {get set}
}

class WN8DetailsViewController: UIViewController {
    
    weak var presenter: protocol<WN8DetailsPresenterEventHandler>?
    
    
    var vehicleData = VehicleDataStruct()
    var vehicleExpectedValues = ExpectedValueStruct()
    var vehiclePersonalData = VehiclePersonalData()
    
    var vehiclePersonalDataInteractor = VehiclePersonalDataInteractor()
    
    
    class func createView() -> WN8DetailsViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewControllerWithIdentifier("WN8DetailsViewController") as! WN8DetailsViewController
        return view
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        vehiclePersonalData = vehiclePersonalDataInteractor.getVehicledataSync(vehicleData.tank_id!)
        
    }

    
    
    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
}

extension WN8DetailsViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return setupMainDataCell(tableView)
        }
        var cell = tableView.dequeueReusableCellWithIdentifier("ExpectedValuesSimpleDataTableViewCell") as! ExpectedValuesSimpleDataTableViewCell
        
        var percentage : Double = 0.0
        
        let hasBattles = vehiclePersonalData.allBattleStat.battles > 0
        let battleCount : Double = hasBattles ?  Double(vehiclePersonalData.allBattleStat.battles) : 1
        
        switch indexPath.row {
        case 1:
            cell.setupHeaderCell("WolferWolfy")
        case 2:
            
            // String(format: "%.02f", arguments: percentage)
            percentage = Double (vehiclePersonalData.allBattleStat.damage_dealt) / battleCount
            cell.setupCell("Damage", playerValue:percentage,  expectedValue: vehicleExpectedValues.expDamage!, hasBattles: hasBattles)
        case 3:
            percentage = Double (vehiclePersonalData.allBattleStat.frags) / battleCount
            cell.setupCell("Frags", playerValue: percentage, expectedValue: vehicleExpectedValues.expFrag!, hasBattles: hasBattles)
        case 4:
            percentage = Double (vehiclePersonalData.allBattleStat.spotted) / battleCount
            cell.setupCell("Spots", playerValue: percentage, expectedValue: vehicleExpectedValues.expSpot!, hasBattles: hasBattles)
        case 5:
            percentage = Double (vehiclePersonalData.allBattleStat.dropped_capture_points) / battleCount
            cell.setupCell("Def. points", playerValue: percentage, expectedValue: vehicleExpectedValues.expDef!, hasBattles: hasBattles)
        case 6:
            // check for 0 divisor
            percentage = Double (vehiclePersonalData.allBattleStat.wins) * 100 / battleCount
            cell.setupCell("Win Rate", playerValue: percentage, expectedValue: vehicleExpectedValues.expWinRate!, hasBattles: hasBattles)
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
        return indexPath.row == 0 ? 140.0 : 44.0
    }
    
    func setupMainDataCell(tableView: UITableView) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ExpectedValuesMainDataTableViewCell") as! ExpectedValuesMainDataTableViewCell
        
        cell.setupCell(vehicleData, wn8: calculateWN8(), battles: vehiclePersonalData.allBattleStat.battles)
        
        return cell
    }
    
    func calculateWN8() -> Double {
        
        let battleCount : Double = vehiclePersonalData.allBattleStat.battles == 0 ? 1 : Double(vehiclePersonalData.allBattleStat.battles)
        
        var avgDmg = Double (vehiclePersonalData.allBattleStat.damage_dealt) / battleCount
        var avgSpot = Double (vehiclePersonalData.allBattleStat.spotted) / battleCount
        var avgFrag = Double (vehiclePersonalData.allBattleStat.frags) / battleCount
        var avgDef = Double (vehiclePersonalData.allBattleStat.dropped_capture_points) / battleCount
        var avgWinRate = Double (vehiclePersonalData.allBattleStat.wins) * 100 / battleCount
        
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
        
        return WN8.isNaN ? 0.0 : WN8
    }
    
    
    
}

extension WN8DetailsViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}

extension WN8DetailsViewController: WN8DetailsView {
    
    
}
