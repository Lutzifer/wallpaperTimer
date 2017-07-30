//
// WallpaperGroup.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

class WallpaperGroup {
  var wallpapers: [Wallpaper]
  var groupFolderURL: URL

  init(groupFolderURL: URL) {
    self.groupFolderURL = groupFolderURL
    self.wallpapers = Array()
  }

  func load() {
    self.wallpapers = Array()

    for file in FileManager.default.visibleFileURLsAtURL(self.groupFolderURL) {
      self.wallpapers.append(Wallpaper(url: file))
    }
  }

  func numberOfWallpapers() -> Int {
    return wallpapers.count
  }
}
