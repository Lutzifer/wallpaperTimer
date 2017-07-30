//
// WallpaperManager.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Cocoa

class WallpaperManager {
  let useDaytime: Bool
  let folderManager: FolderManager

  init(baseFolder: URL, useDaytime: Bool = false) {
    self.folderManager = FolderManager(baseFolder: baseFolder)
    self.useDaytime = useDaytime
  }

  func setImageAtUrl(_ url: URL, screen: NSScreen) {
    do {
      try NSWorkspace.shared().setDesktopImageURL(url, for: screen, options: [String: AnyObject]())
    } catch let err as NSError {
      print(err)
    }
  }

  func setWallpapers() {
    if let screens = NSScreen.screens() {
      let groups = folderManager.groupsUsingDaytime(useDaytime)

      let eligibleGroups = groups.filter({ group -> Bool in
        group.wallpapers.count >= screens.count
      })

      let groupIndex = randomWithMax(eligibleGroups.count)
      let selectedGroup = groups[groupIndex]

      setWallpapers(selectedGroup, screens: screens)
    }
  }

  func setWallpapers(_ wallpaperGroup: WallpaperGroup, screens: [NSScreen]) {
    var wallpapers = wallpaperGroup.wallpapers

    for screen in screens {

      let index = randomWithMax(wallpapers.count)
      setImageAtUrl(wallpapers[index].url as URL, screen: screen)
      wallpapers.remove(at: index)
    }
  }

  func randomWithMax(_ max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
  }
}
