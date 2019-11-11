//
//  MainPresenter.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

protocol IMainPresenter: class {
    func showAlert(message: String)
    var alerts: AlertsService {get}
    func updatePillsUI(title: String, description: String)
    func updateCarusel(count: Int )
}

class MainPresenter: IMainPresenter {
    let alerts: AlertsService =  AlertsService()
    weak var view: IMainViewController?
    
    
    func updatePillsUI(title: String, description: String) {
        view?.setLabelData(title: title, description: description )
        
    }
    func updateCarusel(count: Int ) {
        view?.updateCarusel(count: count)
    }
    
    func showAlert(message: String) {
        alerts.showAlert(title: "Error", message: message).show()
    }
    
	init(view: IMainViewController?) {
		self.view = view
	}
}
