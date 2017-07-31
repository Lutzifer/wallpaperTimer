//
//  Collage.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import Cocoa
import CoreImage

struct Collage {
  let screenSize: CGSize

  func writeImages(at inputPaths: [String], to outputPath: String) {

    if let bitmap = bitmap(for: screenSize) {
      NSGraphicsContext.saveGraphicsState()
      NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmap)

      let positions = CollagePosition.allCombinations(for: inputPaths.count)
      let positionSet = positions[Int.random(withMaximum: positions.count)]

      for (inputPath, position) in zip(inputPaths, positionSet) {
        drawImage(at: inputPath, at: position, with: screenSize)
      }

      NSGraphicsContext.restoreGraphicsState()
      write(bitMap: bitmap, to: outputPath)
    }
  }

  private func bitmap(for screensize: CGSize) -> NSBitmapImageRep? {
    return NSBitmapImageRep(
      bitmapDataPlanes: nil,
      pixelsWide: Int(screenSize.width),
      pixelsHigh: Int(screenSize.height),
      bitsPerSample: 8,
      samplesPerPixel: 4,
      hasAlpha: true,
      isPlanar: false,
      colorSpaceName: .calibratedRGB,
      bytesPerRow: 0,
      bitsPerPixel: 0
    )
  }

  private func write(bitMap: NSBitmapImageRep, to path: String) {
    if let jpgRespresentation = bitMap.representation(using: .jpeg, properties: [:]) {
      try? jpgRespresentation.write(to: URL(fileURLWithPath: path))
    }
  }

  private func drawImage(at path: String, at position: CollagePosition, with screenSize: CGSize) {

    guard let image = NSImage(byReferencingFile: path) else { fatalError("Failed to load images.") }

    image.draw(
      in: position.rect(for: screenSize),
      from: position.rectOfImage(for: image.size),
      operation: .sourceOver,
      fraction: 1.0
    )
  }
}
