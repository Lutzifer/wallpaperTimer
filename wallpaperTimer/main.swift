//
// main.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 19.11.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import AppKit

let cli = CommandLine()

let sourcePath = StringOption(
  shortFlag: "s",
  longFlag: "sourcepath",
  helpMessage: "Path to the Folder which contains the Folders '"
    + DayTime.allValues.map { "'\($0.rawValue)' (begins at \($0.beginningHour) ó clock)" }.joined(separator: ", ")
    + "' and 'all' (used if other folder is empty or -d flag not given)."
)
let help = BoolOption(
  shortFlag: "h",
  longFlag: "help",
  helpMessage: "Prints a help message."
)
let useDaytime = BoolOption(
  shortFlag: "d",
  longFlag: "daytime",
  helpMessage: "Use folders depending on the time of day."
)

cli.addOptions(sourcePath, help, useDaytime)

do {
  try cli.parse()
} catch {
  cli.printUsage(error)
  exit(EX_USAGE)
}

if help.value {
  cli.printUsage()
  exit(EX_USAGE)
}

if let value = sourcePath.value, let baseFolder = URL(string: value) {
  WallpaperManager(baseFolder: baseFolder, useDaytime: useDaytime.value).setWallpapers()
} else {
  cli.printUsage()
  exit(0)
}
