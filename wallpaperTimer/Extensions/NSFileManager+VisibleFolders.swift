//
// NSFileManager+VisibleFolders.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

extension NSFileManager {
	func visibleFolderURLsAtURL(url: NSURL) -> Array<NSURL> {
		let visibleFiles = NSFileManager.defaultManager().visibleFileURLsAtURL(url)
		
		let folders = visibleFiles.filter { fileUrl -> Bool in
				var isDir: ObjCBool = true
				NSFileManager.defaultManager().fileExistsAtPath(fileUrl.path!, isDirectory: &isDir)
				return isDir.boolValue
			}
        
		return folders
	}
}
