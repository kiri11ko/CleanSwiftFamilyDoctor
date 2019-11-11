//
//  GenericCache.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 11.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation
import CodableCache

final class GenericCache<Cacheable: Codable> {

    let cache: CodableCache<Cacheable>

    init(cacheKey: AnyHashable) {
        self.cache = CodableCache<Cacheable>(key: cacheKey)
    }

    func get() -> Cacheable? {
        return self.cache.get()
    }

    func set(value: Cacheable) throws {
        try self.cache.set(value: value)
    }

    func clear() throws {
        try self.cache.clear()
    }
}
