//
//  Weapon.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation

class Weapons {
    var injuries: Int
    
    init(injuries: Int) {
        self.injuries = injuries
    }
}

class Sword: Weapons {
    init() {
        super.init(injuries: 10)
    }
}

class MagicHealing: Weapons {
    init() {
        super.init(injuries: 0)
        // The magus can give defense point to characters of his own team + 100 defense points
    }
}

class Hammer: Weapons {
    init() {
        super.init(injuries: 5)
    }
}

class Axe: Weapons {
    init() {
        super.init(injuries: 50)
    }
}
