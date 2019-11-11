//
//  MedicamentModel.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.

import Foundation

struct MedicamentModel : Codable {
    
	let status : String?
	let pills : [Pills]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case pills = "pills"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		pills = try values.decodeIfPresent([Pills].self, forKey: .pills)
	}

}
