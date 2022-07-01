import UIKit
import SwiftUI

class DetailViewController: UIViewController {
  
  // MARK: - Properties
  
  var height = UIScreen.main.bounds.height / 2
  var id = 0
  var newsTitle = ""
  var newsText = ""
  var likes = ""
  var date = ""
  
  private var post: PostID?
  private let scrollView = UIScrollView()
  
  // MARK: - Views
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var postView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let newsTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 20, weight: .semibold)
    label.textAlignment = .left
    return label
  }()
  
  private let previewLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.textAlignment = .left
    return label
  }()
  
  private let likesImageView: UIImageView = {
    let image = UIImageView(image: UIImage(systemName: "heart.fill"))
    image.tintColor = .red
    image.contentMode = .scaleAspectFit
    image.frame = .init(x: 0, y: 0, width: 20, height: 20)
    return image
  }()
  
  private let likesCountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .light)
    label.textAlignment = .left
    return label
  }()
  
  lazy var likesStackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [likesImageView, likesCountLabel])
    stack.backgroundColor = .green
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.spacing = 4
    stack.axis = .horizontal
    stack.alignment = .fill
    stack.distribution = .fillProportionally
    return stack
  }()
  
  private let timestampLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .light)
    label.textAlignment = .right
    return label
  }()
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [newsTitleLabel, previewLabel, likesImageView, likesCountLabel, timestampLabel])
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 10
    return stack
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    newsTitleLabel.text = newsTitle
    likesCountLabel.text = likes
    timestampLabel.text = date
    
    setupViews()
    setupScrollView()
    setupConstraints()
    
    PostManager.shared.getPost(id: id) { [weak self] result in
      switch result {
      case .success(let posts):
        self?.post = posts
        
        self!.imageView.loadFrom(URLAddress: posts.postImage)
        
        DispatchQueue.main.async {
          self!.previewLabel.text = posts.text
        }
        
      case .failure(let error):
        print(error)
      }
    }
  }
