//
// FolderManager.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Cocoa

struct FolderManager {
  let baseFolder: URL

  func folderUrlUsingDaytime(_ useDaytime: Bool) -> URL {

    let folderName: String

    if useDaytime {
      folderName = DayTime.currentDayTimeName
    } else {
      folderName = "all"
    }

    return baseFolder.appendingPathComponent(folderName)
  }

  func groupsUsingDaytime(_ useDaytime: Bool) -> [WallpaperGroup] {

    var groups = FileManager.default.visibleFolderURLsAtURL(folderUrlUsingDaytime(useDaytime))
      .flatMap { WallpaperGroup(groupFolderURL: $0) }

    // if we have no results, get the results from the "all"-Folder
    if useDaytime, groups.count == 0 {
      groups = groupsUsingDaytime(false)
    }

    return groups
  }
}
