//
//  FileManager+Caches.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import Foundation

extension FileManager {

  class func cachesDir() -> String {
    var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
    return paths[0]
  }
}
