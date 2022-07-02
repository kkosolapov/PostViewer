import Foundation

extension Date {
  
  func toString(withFormat format: String = "dd MMMM yyyy") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en")
    dateFormatter.dateFormat = format
    
    return dateFormatter.string(from: self)
  }
