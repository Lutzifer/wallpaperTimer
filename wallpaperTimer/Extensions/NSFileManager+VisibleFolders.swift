//
// NSFileManager+VisibleFolders.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

extension FileManager {
  func visibleFolderURLsAtURL(_ url: URL) -> [URL] {
    let visibleFiles = FileManager.default.visibleFileURLsAtURL(url)

    let folders = visibleFiles.filter { fileUrl -> Bool in
      var isDir: ObjCBool = true
      FileManager.default.fileExists(atPath: fileUrl.path, isDirectory: &isDir)
      return isDir.boolValue
    }

    return folders
  }
}
