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
	
    init(hour: Int) {
        if hour >= night.beginningHour {
            self = night
        } else if hour >= evening.beginningHour {
            self = evening
        } else if hour >= afternoon.beginningHour {
            self = afternoon
        } else if hour >= noon.beginningHour {
            self = noon
        } else if hour >= morning.beginningHour {
            self = morning
        } else {
            self = night
        }
    }
    
    var beginningHour: Int {
        switch self {
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
    
    static func currentDayTime() -> DayTime {
        let hour = NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: NSDate())
        return DayTime(hour: hour)
    }
    
    static func allCaseStrings() -> Array<String> {
        return DayTime.allCases.map({(dayTime) -> String in
            dayTime.rawValue
        })
    }
    
    static func allCaseStringsWithBeginning() -> Array<String> {
        return DayTime.allCases.map({(dayTime) -> String in
            "'\(dayTime.rawValue)' (begins at \(dayTime.beginningHour) ó clock)"
        })
    }
    
	static let allCases = Array(arrayLiteral: DayTime.morning, DayTime.noon, DayTime.afternoon, DayTime.evening, DayTime.night)
}
