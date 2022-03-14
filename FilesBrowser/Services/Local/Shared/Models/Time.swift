//
//  Time.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Time: TimeRepresentable {
    
    var hour: Int
    var minute: Int
    var second: Int
    
    init(_ floatTime: Double, roundSeconds: Bool = false) {
        hour = Int(floatTime)
        let floatMinutes = (floatTime - Double(hour)) * 60
        minute = Int(floatMinutes)
        let floatSeconds = (floatMinutes - Double(minute)) * 60
        second = Int(floatSeconds)
        if roundSeconds {
            let sec = floatMinutes - Double(minute)
            minute += Int(sec.rounded())
            second = max(Int((sec - sec.rounded()) * 60), 0)
        }
    }
    
    init(hour: Int, minute: Int, second: Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    init(_ date: Date) {
        let com = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        hour = com.hour ?? 0
        minute = com.minute ?? 0
        second = com.second ?? 0
    }
    
    init() {
        hour = 0
        minute = 0
        second = 0
    }
}

extension Time: ExpressibleByFloatLiteral {
    
    init(floatLiteral value: Double) {
        self.init(value)
    }
}

extension Time: CustomStringConvertible {
    
    var description: String {
        if hour > 0 {
            return String(format: "%02d:%02d:%02d", hour, minute, second)
        } else if minute > 0 {
            return String(format: "%02d:%02d", minute, second)
        } else {
            return String(format: "%02d", second)
        }
    }
}
