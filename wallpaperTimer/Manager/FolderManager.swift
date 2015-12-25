//
// FolderManager.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Cocoa

class FolderManager: NSObject {
	var baseFolder: NSURL
	
	init(baseFolderPath : String) {
		self.baseFolder = NSURL(fileURLWithPath: baseFolderPath)
	}
	
	func folderUrlUsingDaytime(useDaytime : Bool) -> NSURL {
		if (useDaytime) {
			return self.baseFolder.URLByAppendingPathComponent(self.folderNameForCurrentTime())
		} else {
			return self.baseFolder.URLByAppendingPathComponent("all")
		}
	}
	
	func folderNameForCurrentTime() -> String {
		return DayTimeHelper().currentDayTime().rawValue
	}
	
	func groupsUsingDaytime(useDaytime : Bool) -> Array<WallpaperGroup> {
		var groups = Array<WallpaperGroup>()
		
		let folderUrls = NSFileManager.defaultManager().visibleFolderURLsAtURL(self.folderUrlUsingDaytime(useDaytime))
		
		for folderUrl in folderUrls {
			let wallpaperGroup = WallpaperGroup(groupFolderURL: folderUrl)
			wallpaperGroup.load()
			groups.append(wallpaperGroup)
		}
		
		// if we have no results, get the results from the "all"-Folder
		if (useDaytime && groups.count == 0) {
			groups = self.groupsUsingDaytime(false)
		}
		
		return groups
	}
	
}
