//
// DayTime.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

enum DayTime: String {
	case morning, noon, afternoon, evening, night
	
	static let allCases = Array(arrayLiteral: DayTime.morning, DayTime.noon, DayTime.afternoon, DayTime.evening, DayTime.night)
}

class DayTimeHelper {
    func beginningHourOfDayTime(daytime: DayTime) -> Int {
        switch daytime {
        case .morning:
            return 6
        case .noon:
            return 11
        case .afternoon:
            return 13
        case .evening:
            return 17
        case .night:
            return 22
        }
    }
    
	func currentDayTime() -> DayTime {
		let hour = NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: NSDate())
		return daytimeWithHour(hour)
	}
	
	func daytimeWithHour(hour: Int) -> DayTime {
		if (hour <= self.beginningHourOfDayTime(.morning) || hour > self.beginningHourOfDayTime(.night)) {
			return DayTime.night
		} else if (hour <= self.beginningHourOfDayTime(.noon)) {
			return DayTime.morning
		} else if (hour <= self.beginningHourOfDayTime(.afternoon)) {
			return DayTime.noon
		} else if (hour <= self.beginningHourOfDayTime(.evening)) {
			return DayTime.afternoon
		} else if (hour <= self.beginningHourOfDayTime(.night)) {
			return DayTime.night
		} else {
			return DayTime.night
		}
	}
	
	func allCaseStrings() -> Array<String> {
		return DayTime.allCases.map({(dayTime) -> String in
				dayTime.rawValue
			})
	}

    func allCaseStringsWithBeginning() -> Array<String> {
        return DayTime.allCases.map({(dayTime) -> String in
            "'\(dayTime.rawValue)' (begins at \(self.beginningHourOfDayTime(dayTime)) ó clock)"
        })
    }

}

