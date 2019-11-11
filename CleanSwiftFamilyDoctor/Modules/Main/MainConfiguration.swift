//
//  MainConfiguration.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import Alamofire
import UIKit

class MainConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MainViewController()
        let router = MainRouter(view: controller)
        let presenter = MainPresenter(view: controller)
        let manager = MainManager()
        let interactor = MainInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
