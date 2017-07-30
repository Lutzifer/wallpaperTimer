//
// FileManager+VisibleFolders.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

extension FileManager {
  func visibleFolderURLsAtURL(_ url: URL) -> [URL] {
    return FileManager.default.visibleFileURLs(at: url)
      .filter { fileUrl -> Bool in
        var isDirectory: ObjCBool = true
        FileManager.default.fileExists(atPath: fileUrl.path, isDirectory: &isDirectory)
        return isDirectory.boolValue
      }
  }
}
