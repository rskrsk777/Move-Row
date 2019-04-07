//
//  ToyMakers.swift
//  Move Row
//
//  Created by ryosuke kubo on 2019/04/07.
//  Copyright © 2019 ryosuke kubo. All rights reserved.
//

import Foundation
import RealmSwift

class ToyMakers: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var companyName = ""
    let toys = List<Toy>()
    
    override static func primaryKey () -> String? {
        return "id"
    }
    
    convenience init (_ name: String) {
        self.init()
        self.companyName = name
    }
}

class Toy: Object {
    @objc dynamic var toyName = ""
    let maker = LinkingObjects(fromType: ToyMakers.self, property: "toys")
    
    convenience init (_ name: String) {
        self.init()
        self.toyName = name
    }
}
