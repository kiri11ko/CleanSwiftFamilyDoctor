//
//  Pills.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.

import Foundation

struct Pills : Codable {
	let desription : String?
	let dose : String?
	let name : String?
	let id : Int?
	let img : String?

	enum CodingKeys: String, CodingKey {

		case desription = "desription"
		case dose = "dose"
		case name = "name"
		case id = "id"
		case img = "img"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		desription = try values.decodeIfPresent(String.self, forKey: .desription)
		dose = try values.decodeIfPresent(String.self, forKey: .dose)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		img = try values.decodeIfPresent(String.self, forKey: .img)
	}

}
