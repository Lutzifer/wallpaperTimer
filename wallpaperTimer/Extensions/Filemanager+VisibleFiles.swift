//
// Filemanager+VisibleFiles.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

extension FileManager {

  func visibleFileURLs(at url: URL) -> [URL] {

    let paths: [String]

    do {
      try paths = contentsOfDirectory(atPath: url.path)
        // filter dotfiles
        .filter { filename -> Bool in
          !filename.hasPrefix(".")
        }
    } catch let err as NSError {
      print(err)
      paths = [String]()
    }

    return paths.map { fileName -> URL in
      url.appendingPathComponent(fileName)
    }
  }
}
