//
//  MainRouter.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

protocol IMainRouter: class {
	// do someting...
}

class MainRouter: IMainRouter {	
	weak var view: MainViewController?
	
	init(view: MainViewController?) {
		self.view = view
	}
}
