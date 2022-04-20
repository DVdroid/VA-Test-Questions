//
//  StockPrice.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 18/10/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, atFilePath path: String) -> T? {

        let filePathUrl = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: filePathUrl) else {
            return nil
        }

        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: data)
    }
}

extension String {

    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        return dateFormatter.date(from: self)
    }
}


public enum WeekDay: Int {
    case Monday = 1
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

extension WeekDay {

    init?(name: String) {
        switch name {
        case "Monday":
            self = .Monday
        case "Tuesday":
            self = .Tuesday
        case "Wednesday":
            self = .Wednesday
        case "Thursday":
            self = .Thursday
        case "Friday":
            self = .Friday
        case "Saturday":
            self = .Saturday
        case "Sunday":
            self = .Sunday
        default:
            return nil
        }
    }
}

public enum StockError: LocalizedError {
    case NoStockError
    case JSONFileNotFoundError
    case InvalidJSONFormatError
    case InvalidParameterError
}

protocol StockProtocol {
    func openAndClosePrices(firstDate: String, lastDate: String, weekday: String) throws -> [Stock]
}


public struct Stock: Decodable {
    var date: String
    var open: Float
    var high: Float
    var low: Float
    var close: Float

    var dateObj: Date? {
        return date.toDate()
    }

    var day: WeekDay? {
        guard let date = self.date.toDate() else {
            return nil
        }
        let day = Calendar.current.component(.weekday, from: date)
        return WeekDay(rawValue: (day - 1))
    }
}


public class JSONReader {

    func read() throws -> [Stock] {
        guard let jsonDataFilePath = Bundle.main.path(forResource: "Data/data", ofType: "json") else { throw StockError.JSONFileNotFoundError }
        guard let stocks = Bundle.main.decode([Stock].self, atFilePath: jsonDataFilePath) else { throw StockError.InvalidJSONFormatError }
        return stocks
    }
}

public class StockPrice: StockProtocol {

    let stocks: [Stock]
    init(_ stocks: [Stock]) {
        self.stocks = stocks
    }

    func openAndClosePrices(firstDate: String, lastDate: String, weekday: String) throws -> [Stock] {

        guard let startDateObj = firstDate.toDate(),
            let endDateObj = lastDate.toDate()  else { throw StockError.InvalidParameterError }

        var filteredStocks: [Stock] = []
        for stock in self.stocks {

            guard let stockDate = stock.dateObj, let weekDayToCompare = WeekDay(name: weekday) else { continue }

            if stockDate >= startDateObj, stockDate <= endDateObj {
                if stock.day == weekDayToCompare {
                    filteredStocks.append(stock)
                }
            }
        }

        if filteredStocks.isEmpty {
            throw StockError.NoStockError
        }

        return filteredStocks
    }
}
