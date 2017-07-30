//
//  Int+RandomWithMax.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import Foundation

extension Int {

  static func random(withMaximum maximum: Int) -> Int {
    return Int(arc4random_uniform(UInt32(maximum)))
  }
}
