//
//  NSScreen+SetWallpaper.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import Cocoa

extension NSScreen {

  func setDesktopImage(at url: URL) {

    do {
      try NSWorkspace.shared.setDesktopImageURL(url, for: self)
    } catch let err as NSError {
      print(err)
    }
  }
}
