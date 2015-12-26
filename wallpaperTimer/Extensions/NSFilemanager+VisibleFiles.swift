//
// NSFilemanager+VisibleFiles.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

extension NSFileManager {
	func visibleFileURLsAtURL(url: NSURL) -> Array<NSURL> {
		do {
			var folderResult: Array<String>
			
			try folderResult = self.contentsOfDirectoryAtPath(url.path!)
            
			// filter dotfiles
			let cleanFiles: Array<NSURL> = folderResult.filter({ filename -> Bool in
					return !filename.hasPrefix(".")
				}).map({ fileName -> NSURL in
					url.URLByAppendingPathComponent(fileName)
				})
			
			return cleanFiles
		} catch let err as NSError {
			print(err)
			return Array<NSURL>()
		}
	}
}