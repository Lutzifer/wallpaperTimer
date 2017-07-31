//
// WallpaperGroup.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

struct WallpaperGroup {
  let groupFolderURL: URL

  var wallpaperURLs: [URL] {
    return FileManager.default.visibleFileURLs(at: groupFolderURL)
  }
}
