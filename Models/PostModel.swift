import Foundation

struct PostModel: Codable {
  let post: PostID
}

struct PostID: Codable {
  let postId: Int
  let timeshamp: Int
  let title: String
  let text: String
  let postImage: String
  let likes_count: Int
}
