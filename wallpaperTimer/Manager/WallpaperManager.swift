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

    let eligibleGroups =
      groups(at: URL(fileURLWithPath: self.baseFolderPath), usingDaytime: useDaytime)
      .filter { $0.wallpaperURLs.count >= screens.count }

    var wallpaperURLsToSet = eligibleGroups[Int.random(withMaximum: eligibleGroups.count)].wallpaperURLs

    if screens.count == 1, let screen = screens.first {
      let cachePath = FileManager.cachesDir().appending("/WallpaperTimer")
      try? _ = FileManager.default.createDirectory(
        atPath: cachePath,
        withIntermediateDirectories: true,
        attributes: nil
      )

      let collagePath = cachePath.appending("/\(UUID().uuidString).jpg")

      Collage(screenSize: screen.visibleFrame.size)
        .writeImages(
          at: wallpaperURLsToSet.map { $0.path },
          to: collagePath
        )

      screen.setDesktopImage(at: URL(fileURLWithPath: collagePath))
      return
    }

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
