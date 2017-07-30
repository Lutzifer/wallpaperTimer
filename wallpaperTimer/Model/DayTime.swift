//
// DayTime.swift
// wallpaperTimer
//
// Created by Wolfgang Lutz on 25.12.15.
// Copyright © 2015 wlutz. All rights reserved.
//

import Foundation

enum DayTime: String, EnumCollection {
  case morning, noon, afternoon, evening, night

  init(hour: Int) {
    if hour >= DayTime.night.beginningHour {
      self = .night
    } else if hour >= DayTime.evening.beginningHour {
      self = .evening
    } else if hour >= DayTime.afternoon.beginningHour {
      self = .afternoon
    } else if hour >= DayTime.noon.beginningHour {
      self = .noon
    } else if hour >= DayTime.morning.beginningHour {
      self = .morning
    } else {
      self = .night
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
    let hour = (Calendar.current as NSCalendar).component(NSCalendar.Unit.hour, from: Date())
    return DayTime(hour: hour)
  }
}
