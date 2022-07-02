import Foundation

extension TimeInterval {
  
  func toString() -> String {
    let input: Date = Date(timeIntervalSince1970: self)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM YYYY"
    dateFormatter.locale = Locale(identifier: "en")
    
    return dateFormatter.string(from: input)
  }
}
