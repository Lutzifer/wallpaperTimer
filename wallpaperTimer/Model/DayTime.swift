//
// DayTime.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

enum DayTime: String {
	case Morning, Noon, Afternoon, Evening, Night
	
    init(hour: Int) {
        if hour >= DayTime.Night.beginningHour {
            self = .Night
        } else if hour >= DayTime.Evening.beginningHour {
            self = .Evening
        } else if hour >= DayTime.Afternoon.beginningHour {
            self = .Afternoon
        } else if hour >= DayTime.Noon.beginningHour {
            self = .Noon
        } else if hour >= DayTime.Morning.beginningHour {
            self = .Morning
        } else {
            self = .Night
        }
    }
    
    var beginningHour: Int {
        switch self {
        case .Morning:
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
        let hour = (Calendar.current as NSCalendar).component(NSCalendar.Unit.hour, from: Date())
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
    
	static let allCases = Array(arrayLiteral: DayTime.Morning, DayTime.Noon, DayTime.Afternoon, DayTime.Evening, DayTime.Night)
}
