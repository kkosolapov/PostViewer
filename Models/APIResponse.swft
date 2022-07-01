import Foundation

struct APIResponse: Codable {
  let posts: [Post]
}

struct Post: Codable {
  let postId: Int
  let timestamp: TimeInterval
  let title: String
  let previewText: String
  let likesCount: Int
  
  enum CodingKeys: String, CodingKey {
    case postId
    case timestamp = "timeshamp"
    case title
    case previewText = "preview_text"
    case likesCount = "likes_count"
  }
}
