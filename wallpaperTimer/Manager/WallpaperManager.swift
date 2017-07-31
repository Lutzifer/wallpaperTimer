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
    let screens = NSScreen.screens
    let urls: [URL]

    let eligibleGroups =
      groups(at: URL(fileURLWithPath: self.baseFolderPath), usingDaytime: useDaytime)

    if screens.count == 1, let screen = screens.first {
      // If there is only one screen, we make a collage

      let wallpaperURLsToSet = eligibleGroups[Int.random(withMaximum: eligibleGroups.count)]
        .wallpaperURLs

      let collagePath = FileManager.default.pathToTemporaryImage

      Collage(screenSize: screen.visibleFrame.size)
        .writeImages(
          at: wallpaperURLsToSet.map { $0.path },
          to: collagePath
        )
      urls = [URL(fileURLWithPath: collagePath)]
    } else {
      urls = eligibleGroups
        .filter { $0.wallpaperURLs.count >= screens.count } [Int.random(withMaximum: eligibleGroups.count)]
        .wallpaperURLs
    }

    for (screen, url) in zip(screens, urls) {
      screen.setDesktopImage(at: url)
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
