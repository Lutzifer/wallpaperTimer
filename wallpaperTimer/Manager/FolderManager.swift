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

    let daytimeFolders = FileManager.default.visibleFolderURLsAtURL(folderUrlUsingDaytime(useDaytime))
    let allFolders = FileManager.default.visibleFolderURLsAtURL(folderUrlUsingDaytime(false))

    return (daytimeFolders + allFolders).flatMap { WallpaperGroup(groupFolderURL: $0) }
  }
}
