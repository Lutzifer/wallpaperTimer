//
// WallpaperManager.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Cocoa

struct WallpaperManager {
  let useDaytime: Bool
  let baseFolderPath: String

  func setWallpapers() {
    guard let screens = NSScreen.screens() else { return }

    let eligibleGroups =
      groups(at: URL(fileURLWithPath: self.baseFolderPath), usingDaytime: useDaytime)
      .filter { $0.wallpaperURLs.count >= screens.count }

    var wallpaperURLsToSet = eligibleGroups[Int.random(withMaximum: eligibleGroups.count)].wallpaperURLs

    screens.forEach {
      let index = Int.random(withMaximum: wallpaperURLsToSet.count)
      $0.setDesktopImage(at: wallpaperURLsToSet[index])
      wallpaperURLsToSet.remove(at: index)
    }
  }

  private func groups(at baseUrl: URL, usingDaytime: Bool) -> [WallpaperGroup] {
    return [
      baseUrl.appendingPathComponent(DayTime.currentDayTimeName),
      baseUrl.appendingPathComponent("all")
    ]
    .flatMap { FileManager.default.visibleFolderURLsAtURL($0) }
    .flatMap { WallpaperGroup(groupFolderURL: $0) }
  }
}
