//
//  CollagePosition.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import CoreImage

enum CollagePosition: String, EnumCollection {
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
      x: positionX(for: screenSize),
      y: positionY(for: screenSize),
      width: width(for: screenSize),
      height: height(for: screenSize)
    )
  }

  private func positionX(for screenSize: CGSize) -> CGFloat {
    switch self {
    case .top, .bottom, .left, .topLeft, .bottomLeft:
      return 0
    default:
      return screenSize.width * 0.5
    }
  }

  private func positionY(for screenSize: CGSize) -> CGFloat {
    switch self {
    case .top, .topLeft, .topRight:
      return screenSize.height * 0.5
    default:
      return 0
    }
  }

  private func width(for screenSize: CGSize) -> CGFloat {
    switch self {
    case .top, .bottom:
      return screenSize.width
    default:
      return screenSize.width * 0.5
    }
  }

  private func height(for screenSize: CGSize) -> CGFloat {
    switch self {
    case .left, .right:
      return screenSize.height
    default:
      return screenSize.height * 0.5
    }
  }

  func rectOfImage(for imageSize: CGSize) -> CGRect {
    return CGRect(
      x: imagePositionX(for: imageSize),
      y: imagePositionY(for: imageSize),
      width: imageWidth(for: imageSize),
      height: imageHeight(for: imageSize)
    )
  }

  private func imagePositionX(for imageSize: CGSize) -> CGFloat {
    switch self {
    case .left, .right:
      return imageSize.width * 0.375
    default:
      return 0
    }
  }

  private func imagePositionY(for imageSize: CGSize) -> CGFloat {
    switch self {
    case .top, .bottom:
      return imageSize.height * 0.375
    default:
      return 0
    }
  }

  private func imageWidth(for imageSize: CGSize) -> CGFloat {
    switch self {
    case .left, .right:
      return imageSize.width * 0.5
    default:
      return imageSize.width
    }
  }

  private func imageHeight(for imageSize: CGSize) -> CGFloat {
    switch self {
    case .top, .bottom:
      return imageSize.height * 0.5
    default:
      return imageSize.height
    }
  }
}

extension CollagePosition {
  static func combinations(for numberOfImages: Int) -> [[CollagePosition]] {
    let result: [[CollagePosition]]

    switch numberOfImages {
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
        [.right, .topLeft, .topRight]
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
    let highestAllowed = maxNumberOfImages <= 4 ? maxNumberOfImages : 4
    return (0 ... highestAllowed).flatMap { combinations(for: $0) }
  }
}
