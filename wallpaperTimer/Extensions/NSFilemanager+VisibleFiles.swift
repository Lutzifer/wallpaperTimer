//
// NSFilemanager+VisibleFiles.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

extension FileManager {
	func visibleFileURLsAtURL(_ url: URL) -> Array<URL> {
        var result = Array<URL>()
    
		do {
			var folderResult: Array<String>
			
			try folderResult = self.contentsOfDirectory(atPath: url.path)
            
			// filter dotfiles
			result = folderResult.filter({ filename -> Bool in
					return !filename.hasPrefix(".")
				}).map({ fileName -> URL in
					url.appendingPathComponent(fileName)
				})
			
			return result
		} catch let err as NSError {
			print(err)
			return result
		}
	}
}
