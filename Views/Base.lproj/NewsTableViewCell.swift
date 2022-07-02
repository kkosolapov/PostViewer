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

  // MARK: - Actions
  @objc func buttonAction(_ sender: UIButton!) {
    buttonTapBlock?()
    print("Button tapped")
  }
  
  //MARK: - View setup
  func setupConstraints() {
    
    // newsTitleLabel constraints
    newsTitleLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 8).isActive = true
    newsTitleLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 15).isActive = true
    newsTitleLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -10).isActive = true
    newsTitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    // previewLabel constraints
    previewLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor).isActive = true
    previewLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 15).isActive = true
    previewLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -20).isActive = true
    
    // likesStackView constraints
    likesStackView.topAnchor.constraint(equalTo: previewLabel.bottomAnchor, constant: 10).isActive = true
    likesStackView.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10).isActive = true
    likesStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // timestampLabel constraints
    timestampLabel.topAnchor.constraint(equalTo: previewLabel.bottomAnchor, constant: 10).isActive = true
    timestampLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -10).isActive = true
    timestampLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // expandBotton constraints
    expandBotton.topAnchor.constraint(equalTo: likesStackView.bottomAnchor, constant: 10).isActive = true
    expandBotton.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 0).isActive = true
    expandBotton.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: 0).isActive = true
    expandBotton.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: 0).isActive = true
    expandBotton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    // postView constraints
    postView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    postView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
    postView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    postView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
  }
