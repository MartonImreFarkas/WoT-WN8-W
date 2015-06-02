//
//  ExpectedValuesViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol ExpectedValuesView : class {
    weak var presenter : protocol <ExpectedValuesPresenterEventHandler>? {get set}
    
}

class ExpectedValuesViewController: UIViewController {
    
    weak var presenter: protocol<ExpectedValuesPresenterEventHandler>?
    
    var vehicleList = [VehicleDataStruct]()
    var vehiclesExpectedValues = [ExpectedValueStruct]()
    
    let imageLoader = ImageLoader()
    
     class func createView() -> ExpectedValuesViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewControllerWithIdentifier("ExpectedValuesViewController") as! ExpectedValuesViewController
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        vehiclesExpectedValues = presenter!.downloadExpectedValues()
        var vli = VehiclesListInteractor()
        vehicleList = vli.getExpectedValuesSync()
        
    }
}

extension ExpectedValuesViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ExpectedValuesTableViewCell") as! ExpectedValuesTableViewCell
        let vehicleData = vehicleList[indexPath.row]
        cell.tankNameLabel.text = vehicleData.short_name_i18n
        cell.tankTierLabel.text = "Tier: \(vehicleData.level!)"
        cell.tankTypeLabel.text = vehicleData.type_i18n
        cell.expectedDamageValueLabel.text = "unkown"
        for index in 0...vehiclesExpectedValues.count-1 {
            if vehiclesExpectedValues[index].IDNum == vehicleData.tank_id {
                cell.expectedDamageValueLabel.text = "\(vehiclesExpectedValues[index].expDamage!)"
                break
            }
        }
        
        cell.tankNationFlag.image = UIImage(named: vehicleData.nationFlagImageName!)
   

       // cell.imageView?.image = nil
        imageLoader.imageForUrl(vehicleData.image_small!, completionHandler: { (image, url) -> () in
     //       println(cell.imageView?.frame.size)
            cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
            cell.imageView?.image = image
   //         println(cell.imageView?.frame.size)
      //      cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
            cell.imageView?.sizeToFit()
        })
        return cell
    }
    
}

extension ExpectedValuesViewController : UITableViewDelegate {
    
}

extension ExpectedValuesViewController: ExpectedValuesView {
    
    }
