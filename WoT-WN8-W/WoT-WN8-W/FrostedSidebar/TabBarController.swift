//
//  TabBarController.swift
//  FrostedSidebar
//
//  Created by Evan Dekhayser on 8/28/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
	
	var sidebar: FrostedSidebar!
    let loginWireFrame = LoginWireFrame()
    let profileWireFrame = ProfileWireFrame()
    let vehicleListWireFrame = VehicleListWireFrame()
  //  let expectedValuesWireFrame = ExpectedValuesWireFrame()
    
    

	override func viewDidLoad() {
		super.viewDidLoad()
		delegate = self
		tabBar.hidden = true
		
		moreNavigationController.navigationBar.hidden = true
        
        
        setup()

		sidebar = FrostedSidebar(itemImages: [
			UIImage(named: "gear")!,
			UIImage(named: "globe")!,
			UIImage(named: "profile")!,
			UIImage(named: "profile")!,
			UIImage(named: "star")!],
			colors: [
				UIColor(red: 240/255, green: 159/255, blue: 254/255, alpha: 1),
				UIColor(red: 255/255, green: 137/255, blue: 167/255, alpha: 1),
				UIColor(red: 126/255, green: 242/255, blue: 195/255, alpha: 1),
				UIColor(red: 126/255, green: 242/255, blue: 195/255, alpha: 1),
				UIColor(red: 126/255, green: 242/255, blue: 195/255, alpha: 1)],
            itemTitles: [
                "Gear",
                "Globe",
                "LoginPr",
                "Profile",
                "Star"],
			selectedItemIndices: NSIndexSet(index: 0))
		
		sidebar.isSingleSelect = true
		sidebar.actionForIndex = [
			0: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 0}) },
			1: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 1}) },
			2: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 2}) },
			3: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 3}) },
			4: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 4}) }]
    }
    
    func changeToIndex(index: Int) {
        selectedIndex = index
        sidebar.selectItemAtIndex(index)
    }


    
    //MARK - setupMethod
    func setup() {
        var lvc = loginWireFrame.rootViewController()
        var pvc = profileWireFrame.rootViewController()
        var vlvc =  vehicleListWireFrame.rootViewController()
       // var expvvc = expectedValuesWireFrame.rootViewController()
        
        var vcs = viewControllers
        
        vcs?.append(lvc)
        vcs?.append(pvc)
        vcs?.append(vlvc)
      //  vcs?.append(expvvc)
        
        setViewControllers(vcs!, animated: false)

    }


}
