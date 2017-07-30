//
// FolderManager.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Cocoa

class FolderManager {
  var baseFolder: URL

  init(baseFolderPath: String) {
    self.baseFolder = URL(fileURLWithPath: baseFolderPath)
  }

  func folderUrlUsingDaytime(_ useDaytime: Bool) -> URL {
    if useDaytime {
      return self.baseFolder.appendingPathComponent(self.folderNameForCurrentTime())
    } else {
      return self.baseFolder.appendingPathComponent("all")
    }
  }

  func folderNameForCurrentTime() -> String {
    return DayTime.currentDayTime().rawValue
  }

  func groupsUsingDaytime(_ useDaytime: Bool) -> [WallpaperGroup] {
    var groups = [WallpaperGroup]()

    let folderUrls = FileManager.default.visibleFolderURLsAtURL(self.folderUrlUsingDaytime(useDaytime))

    for folderUrl in folderUrls {
      let wallpaperGroup = WallpaperGroup(groupFolderURL: folderUrl)
      groups.append(wallpaperGroup)
    }

    // if we have no results, get the results from the "all"-Folder
    if useDaytime && groups.count == 0 {
      groups = self.groupsUsingDaytime(false)
    }

    return groups
  }
}
