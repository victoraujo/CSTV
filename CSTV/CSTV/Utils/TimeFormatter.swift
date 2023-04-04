//
//  TimeFormatter.swift
//  CSTV
//
//  Created by Victor Vieira on 04/04/23.
//

import Foundation

class TimeFormatter {
    private var time: String?
    
    public func getDate(dateString: String?, status: Status?) -> String {
        if status == .running { return "AGORA" }
        guard let dateString = dateString else { return "Em breve" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateString) else { return "Em breve" }
        
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: now, to: date)
        
        if components.day == 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return "Hoje, \(dateFormatter.string(from: date))"
        } else if components.day == 1 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return "Amanhã, \(dateFormatter.string(from: date))"
        } else if components.day ?? 8 <= 7 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let weekday = calendar.component(.weekday, from: date)
            return "\(transformDayLanguage(date:calendar.weekdaySymbols[weekday-1])), \(dateFormatter.string(from: date))"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM HH:mm"
            return dateFormatter.string(from: date)
        }
    }

    private func transformDayLanguage(date: String) -> String {
        switch date {
        case "Sunday":
            return "Dom"
        case "Monday":
            return "Seg"
        case "Tuesday":
            return "Ter"
        case "Wednsday":
            return "Qua"
        case "Thursday":
            return "Qui"
        case "Friday":
            return "Sex"
        case "Saturday":
            return "Sab"
        default:
            return "Em breve"
        }
    }
}

