//
//  CollageTest.swift
//  CollageTest
//
//  Created by Wolfgang Lutz on 30.07.17.
//  Copyright © 2017 wlutz. All rights reserved.
//

import XCTest

class CollageTest: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testCollage() {
    //    CollagePosition.allValues.forEach {
    //      Collage().writeImages(
    //        at: ["/Users/admin/Desktop/Pictures/IMG_6089.jpg"],
    //        with: [$0],
    //        to: "/Users/admin/Desktop/output-\($0.rawValue).jpg"
    //      )
    //    }
    //
    //    Collage().writeImages(
    //      at: ["/Users/admin/Desktop/Pictures/IMG_6089.jpg", "/Users/admin/Desktop/Pictures/IMG_6089.jpg"],
    //      with: [.left, .right],
    //      to: "/Users/admin/Desktop/output-left-right.jpg"
    //    )

    let images = [
      "/Volumes/EXTENSION/Debug/Images/chetah/58946_1600x1200-wallpaper-cb1346965323.jpg",
      "/Volumes/EXTENSION/Debug/Images/chetah/60067_1600x1200-wallpaper-cb1349989089.jpg",
      "/Volumes/EXTENSION/Debug/Images/chetah/61068_1600x1200-wallpaper-cb1352826282.jpg",
      "/Volumes/EXTENSION/Debug/Images/chetah/62674_1600x1200-wallpaper-cb1357148786.jpg"
    ]

    Collage(screenSize: CGSize(width: 1024, height: 768)).writeImages(
      at: images,
      to: "/Users/admin/Desktop/output-random.jpg"
    )
  }
}
