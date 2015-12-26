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
        var result = Array<NSURL>()
        
        guard let path = url.path else {
            return result
        }
        
		do {
			var folderResult: Array<String>
			
			try folderResult = self.contentsOfDirectoryAtPath(path)
            
			// filter dotfiles
			result = folderResult.filter({ filename -> Bool in
					return !filename.hasPrefix(".")
				}).map({ fileName -> NSURL in
					url.URLByAppendingPathComponent(fileName)
				})
			
			return result
		} catch let err as NSError {
			print(err)
			return result
		}
	}
}