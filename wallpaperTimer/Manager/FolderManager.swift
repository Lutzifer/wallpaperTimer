//
// FolderManager.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

struct FolderManager {
  let baseFolder: URL

  func groupsUsingDaytime(_ useDaytime: Bool) -> [WallpaperGroup] {

    return [
      baseFolder.appendingPathComponent(DayTime.currentDayTimeName),
      baseFolder.appendingPathComponent("all")
    ]
    .flatMap { FileManager.default.visibleFolderURLsAtURL($0) }
    .flatMap { WallpaperGroup(groupFolderURL: $0) }
  }
}
