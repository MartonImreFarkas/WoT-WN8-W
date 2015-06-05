//
//  ExpectedValuesViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol VehicleListView : class {
    weak var presenter : protocol <VehicleListPresenterEventHandler>? {get set}
    
}

class VehicleListViewController: UIViewController {
    
    weak var presenter: protocol<VehicleListPresenterEventHandler>?
    
    var vehicleList = [VehicleDataStruct]()
    var expectedValuesList = [ExpectedValueStruct]()
    
    var selectedIndex : Int = 0
        
     class func createView() -> VehicleListViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewControllerWithIdentifier("VehicleListViewController") as! VehicleListViewController
        return view
    }
    
    override func viewWillAppear(animated: Bool) {
        var vli = VehicleListInteractor()
        vehicleList = vli.getVehicleListSync()
        
        var evi = ExpectedValuesInteractor()
        expectedValuesList = evi.getExpectedValuesSync()
        
    }
    
    
    func findExpectedValue(tankId : Int) -> ExpectedValueStruct{
        
        for expV in expectedValuesList {
            if expV.IDNum == tankId {
                return expV
            }
        }
        var emptyValues = ExpectedValueStruct()
        emptyValues.expDamage = 0
        emptyValues.expDef = 0
        emptyValues.expFrag = 0
        emptyValues.expSpot = 0
        emptyValues.expWinRate = 0
        return emptyValues

    }
}

extension VehicleListViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.registerNib(UINib(nibName: "TankMinimalDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "TankMinimalDescriptionTableViewCell")
        tableView.registerNib(UINib(nibName: "ExpectedValuesNotLoggedInTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpectedValuesNotLoggedInTableViewCell")
        tableView.registerNib(UINib(nibName: "ExpectedValuesNotLoggedInBigTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpectedValuesNotLoggedInBigTableViewCell")
        
        return vehicleList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
 /*       var cell = tableView.dequeueReusableCellWithIdentifier("TankMinimalDescriptionTableViewCell") as! TankMinimalDescriptionTableViewCell
        
        cell.setupCell(vehicleList[indexPath.row])
        return cell
*/
        var cell = tableView.dequeueReusableCellWithIdentifier("ExpectedValuesNotLoggedInBigTableViewCell") as! ExpectedValuesNotLoggedInBigTableViewCell
        
        cell.setupCell(vehicleList[indexPath.row], expectedValues: findExpectedValue(vehicleList[indexPath.row].tank_id!))
    
        return cell

        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120.0
    }
 
}

extension VehicleListViewController : UITableViewDelegate {

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(vehicleList[indexPath.row].short_name_i18n)
        
        selectedIndex = indexPath.row

        performSegueWithIdentifier("expectedValuesDetailsSegue", sender: self)
            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
        if (segue.identifier == "expectedValuesDetailsSegue") {
                
            // initialize new view controller and cast it as your view controller
            var viewController = segue.destinationViewController as! ExpectedValuesDetailsViewController
            // your new view controller should have property that will store passed value
            
            
            viewController.vehicleData = vehicleList[selectedIndex]
            viewController.vehicleExpectedValues = findExpectedValue(vehicleList[selectedIndex].tank_id!)
        }
    }
}




extension VehicleListViewController : VehicleListView {

}
