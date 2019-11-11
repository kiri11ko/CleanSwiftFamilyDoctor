//
//  MedicamentEndpoint.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import Foundation
import Alamofire

enum MedicamentEndpoint {
    case main
}

extension MedicamentEndpoint: IEndpoint {
    
    var method: HTTPMethod {
        switch self {
        case .main:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .main:
            return "https://cloud.fdoctor.ru/test_task/"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .main:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .main:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .main:
            return JSONEncoding.default
        }
    }
}
