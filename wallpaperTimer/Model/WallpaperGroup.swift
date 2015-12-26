//
// WallpaperGroup.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

class WallpaperGroup {
	var wallpapers: Array<Wallpaper>
	var groupFolderURL: NSURL
	
	init(groupFolderURL: NSURL) {
		self.groupFolderURL = groupFolderURL
		self.wallpapers = Array()
	}
	
	func load() {
		self.wallpapers = Array()
		
		for file in NSFileManager.defaultManager().visibleFileURLsAtURL(self.groupFolderURL) {
			self.wallpapers.append(Wallpaper(url: file))
		}
	}
	
	func numberOfWallpapers() -> Int {
		return wallpapers.count
	}
	
}
