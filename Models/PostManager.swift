import Foundation

class PostManager {
  
  // MARK: - Properties
  
  private let urlBase = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/"
  
  static let shared = PostManager()
  
  // MARK: - Inits
  
  private init() {}
  
  // MARK: - Helper Methods
  
  public func getNews(completion: @escaping (Result<[Post], Error>) -> Void) {
    
    guard let url = URL(string: "\(urlBase)main.json") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error  in
      if let error = error {
        completion(.failure(error))
      }
      else if let safeData = data {
        do {
          let result = try JSONDecoder().decode(APIResponse.self, from: safeData)
          print("Number of posts: \(result.posts.count)")
          completion(.success(result.posts))
        }
        catch {
          completion(.failure(error))
        }
      }
    }
    task.resume()
  }
