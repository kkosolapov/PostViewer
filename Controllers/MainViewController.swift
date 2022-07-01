import UIKit
import SwiftUI

class MainViewController: UIViewController {
  
  //MARK: - Properties
  
  private var postModel: [Post]?
  private var ascendingSorting = false
  private var expandedIndexSet : IndexSet = []
  
  //MARK: - Views
  
  private let segmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Likes", "Date"])
    sc.selectedSegmentIndex = 0
    sc.selectedSegmentTintColor = .systemGray
    return sc
  }()
  
  private let tableView: UITableView = {
    let table = UITableView(frame: .zero, style: .plain)
    table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
    return table
  }()
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [segmentedControl, tableView])
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.spacing = 4
    stack.axis = .vertical
    return stack
  }()
  
  lazy var rightButton: UIButton = {
    let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    rightButton.setBackgroundImage(UIImage(named: "ZA"), for: .normal)
    rightButton.addTarget(self, action: #selector(sortButtonAction), for: .touchUpInside)
    return rightButton
  }()
  
  // Actions
  @objc func sortButtonAction() {
    ascendingSorting.toggle()
    if ascendingSorting {
      rightButton.setBackgroundImage(UIImage(named: "AZ"), for: .normal)
      sortingAZ()
    } else {
      rightButton.setBackgroundImage(UIImage(named: "ZA"), for: .normal)
      sortingZA()
    }
  }
