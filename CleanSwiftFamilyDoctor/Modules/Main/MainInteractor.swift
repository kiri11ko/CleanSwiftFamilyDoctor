//
//  MainInteractor.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

protocol IMainInteractor: class {
    var parameters: [String: Any]? { get set }
    func networkLoadStart()
    func displayPillsData(number: Int)
    var pillsData: MedicamentModel? {get set}
    func getImage(row: Int, image: UIImageView)
    func getCach()
}

class MainInteractor: IMainInteractor {
    
    var presenter: IMainPresenter?
    var manager: IMainManager?
    var parameters: [String: Any]?
    let network: NetworkService = NetworkService()
    var pillsData: MedicamentModel?
    private let cacheData = GenericCache<MedicamentModel>(cacheKey: String(describing: MedicamentModel.self))
    
    func networkLoadStart() {
        network.request(endpoint: MedicamentEndpoint.main, success: { [weak self] (data) in
            let jsonDecoder = JSONDecoder()
            do {
                self?.pillsData  = try jsonDecoder.decode(MedicamentModel.self, from: data!)
                try self?.cacheData.set(value: self!.pillsData!)
                
                if let list  = self?.pillsData?.pills {
                    self?.displayPillsData(number: 0)
                    self?.presenter!.updateCarusel(count: list.count )
                }
                
            }catch let error{
                self?.presenter?.showAlert(message: error.localizedDescription)
            }
        })
        { [weak self] (error) in
            self?.presenter?.showAlert(message: error!.localizedDescription)
        }
    }
    
    func getCach() {
        pillsData = cacheData.get()
        displayPillsData(number: 0)
    }
    
    func getImage(row: Int, image: UIImageView) {
        if let urlString = pillsData?.pills![row].img {
            network.loadCachImage(url: urlString, imageView: image)
        }
    }
    
    func displayPillsData(number: Int) {
        if let pill = self.pillsData?.pills?[number] {
            self.presenter?.updatePillsUI(title: pill.name!, description: pill.desription!  + " " + pill.dose!)
        }
        
    }
    
    init(presenter: IMainPresenter, manager: IMainManager) {
        self.presenter = presenter
        self.manager = manager
    }
}
