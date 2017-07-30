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

  var wallpapers: [Wallpaper] {
    return FileManager.default.visibleFileURLs(at: groupFolderURL).map { Wallpaper(url: $0) }
  }
}
