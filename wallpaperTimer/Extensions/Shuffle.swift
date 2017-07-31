//
//  Shuffle.swift
//  wallpaperTimer
//
//  Created by Wolfgang Lutz on 31.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import Foundation

// https://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift

extension MutableCollection {
  /// Shuffles the contents of this collection.
  mutating func shuffle() {
    let c = count
    guard c > 1 else { return }

    for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
      let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
      let i = index(firstUnshuffled, offsetBy: d)
      swapAt(firstUnshuffled, i)
    }
  }
}

extension Sequence {
  /// Returns an array with the contents of this sequence, shuffled.
  func shuffled() -> [Element] {
    var result = Array(self)
    result.shuffle()
    return result
  }
}
