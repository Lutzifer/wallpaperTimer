//
//  CollagePosition.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import CoreImage

enum CollagePosition: String, EnumCollection {
  case fullscreen
  case top
  case bottom
  case left
  case right
  case topLeft
  case topRight
  case bottomLeft
  case bottomRight

  func rect(for screenSize: CGSize) -> CGRect {
    return CGRect(
      x: ([.right, .topRight, .bottomRight].contains(self) ? 0.5 : 0.0) * screenSize.width,
      y: ([.top, .topLeft, .topRight].contains(self) ? 0.5 : 0.0) * screenSize.height,
      width: ([.top, .bottom, .fullscreen].contains(self) ? 1.0 : 0.5) * screenSize.width,
      height: ([.left, .right, .fullscreen].contains(self) ? 1.0 : 0.5) * screenSize.height
    )
  }

  func rectOfImage(for imageSize: CGSize) -> CGRect {
    return CGRect(
      x: ([.left, .right].contains(self) ? 0.375 : 0.0) * imageSize.width,
      y: ([.top, .bottom].contains(self) ? 0.375 : 0.0) * imageSize.height,
      width: ([.left, .right].contains(self) ? 0.5 : 1.0) * imageSize.width,
      height: ([.top, .bottom].contains(self) ? 0.5 : 1.0) * imageSize.height
    )
  }
}

extension CollagePosition {
  static func combinations(for numberOfImages: Int) -> [[CollagePosition]] {
    let result: [[CollagePosition]]

    switch numberOfImages {
    case 1:
      result = [[.fullscreen]]
    case 2:
      result = [
        [.top, .bottom],
        [.left, .right]
      ]
    case 3:
      result = [
        [.top, .bottomLeft, .bottomRight],
        [.bottom, .topLeft, .topRight],
        [.left, .topRight, .bottomRight],
        [.right, .topLeft, .bottomLeft]
      ]
    case 4:
      result = [
        [.topLeft, .topRight, .bottomLeft, .bottomRight]
      ]
    default:
      result = [[CollagePosition]]()
    }

    return result
  }

  static func allCombinations(for maxNumberOfImages: Int) -> [[CollagePosition]] {
    return (0 ... maxNumberOfImages).prefix(5).flatMap { combinations(for: $0) }
  }
}
