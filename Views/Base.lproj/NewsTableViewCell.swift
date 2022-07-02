import UIKit

class NewsTableViewCell: UITableViewCell {
    
  // MARK: - Properties
  
  static let identifier = "NewsTableViewCell"
  var buttonTapBlock: (()->())?
  
  // MARK: - View
  
  lazy var postView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let newsTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 18, weight: .semibold)
    label.textAlignment = .left
    return label
  }()
  
  public let previewLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.textAlignment = .left
    return label
  }()
  
  private let likesImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
    imageView.tintColor = .red
    imageView.contentMode = .scaleAspectFit
    imageView.frame = .init(x: 0, y: 0, width: 20, height: 20)
    return imageView
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
  
  private let expandBotton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Expand", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
    button.backgroundColor = #colorLiteral(red: 0.2775951028, green: 0.3229554296, blue: 0.369166106, alpha: 1)
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupViews()
    setupConstraints()
  }
    
  func setupViews() {
    addSubview(postView)
    postView.addSubview(newsTitleLabel)
    postView.addSubview(previewLabel)
    postView.addSubview(likesStackView)
    postView.addSubview(timestampLabel)
    postView.addSubview(expandBotton)
  }
