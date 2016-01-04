//
// DayTime.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

enum DayTime: String {
	case Morining, Noon, Afternoon, Evening, Night
	
    init(hour: Int) {
        if hour >= Night.beginningHour {
            self = Night
        } else if hour >= Evening.beginningHour {
            self = Evening
        } else if hour >= Afternoon.beginningHour {
            self = Afternoon
        } else if hour >= Noon.beginningHour {
            self = Noon
        } else if hour >= Morining.beginningHour {
            self = Morining
        } else {
            self = Night
        }
    }
    
    var beginningHour: Int {
        switch self {
        case .Morining:
            return 6
        case .Noon:
            return 11
        case .Afternoon:
            return 13
        case .Evening:
            return 17
        case .Night:
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
    
	static let allCases = Array(arrayLiteral: DayTime.Morining, DayTime.Noon, DayTime.Afternoon, DayTime.Evening, DayTime.Night)
}
