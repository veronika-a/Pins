import GameKit

class LevelsCell: UITableViewCell {
  
  @IBOutlet weak var star2: UIImageView!
  @IBOutlet weak var star3: UIImageView!
  @IBOutlet weak var star1: UIImageView!
  @IBOutlet private weak var buttonImage: UIImageView!
  @IBOutlet private weak var numberLabel: UILabel!
  @IBOutlet private weak var levelLabel: UILabel!
  @IBOutlet private weak var centerXConstaint: NSLayoutConstraint!
    
  func configer(index: IndexPath, stars: Int = 0, isOpen: Bool) {
    self.selectionStyle = .none
    star1.image = stars > 0 ? UIImage(named: "star") : UIImage(named: "starEmpty")
    star2.image = stars > 1 ? UIImage(named: "star") : UIImage(named: "starEmpty")
    star3.image = stars > 2 ? UIImage(named: "star") : UIImage(named: "starEmpty")
    star1.alpha = stars > 0 ? 1 : (isOpen ? 0.6 : 0)
    star2.alpha = stars > 0 ? 1 : (isOpen ? 0.6 : 0)
    star3.alpha = stars > 0 ? 1 : (isOpen ? 0.6 : 0)

    numberLabel.text = "\(index.row + 1)"
    numberLabel.isHidden = isOpen ? false : true
    levelLabel.isHidden = isOpen ? false : true
    buttonImage.clipsToBounds = true
    buttonImage.alpha = stars > 0 ? 1 : (isOpen ? 0.6 : 0)
    centerXConstaint.constant = (index.row % 2 == 0) ? 88 : -88
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    contentView.alpha = selected ? 0.5 : 1
  }
}

class LevelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  private var stars = UserDefaultsHelper.shared.stars
  private let numberOfLevels = Level.Levels.allCases.count
  //private var bestLevel: Int { return UserDefaultsHelper.shared.level }
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func backToMenu(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    stars = UserDefaultsHelper.shared.stars
    tableView.reloadData()
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.contentInset = .init(top: 88, left: 0, bottom: 64, right: 0)
    tableView.separatorStyle = .none
  }
  
  override func viewWillAppear(_ animated: Bool) {
    guard let selectedRows = tableView.indexPathsForSelectedRows else { return }
    for indexPath in selectedRows { tableView.deselectRow(at: indexPath, animated: animated) }
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! LevelsCell
    var countStars = 0
    stars.forEach{ countStars = countStars + $0 }
    var isOpen = false
    if indexPath.item < 3 {
      isOpen = true
    } else if indexPath.item >= 3, indexPath.item < 6, countStars > 3 * 2 + 1 {
      isOpen = true
    } else if indexPath.item >= 6, indexPath.item < 9, countStars > 3 * 5 + 1 {
      isOpen = true
    } else if indexPath.item >= 9, indexPath.item < 12, countStars > 3 * 7 + 2 {
      isOpen = true
    } else if indexPath.item >= 12, indexPath.item < 15, countStars > 3 * 9 + 3 {
      isOpen = true
    } else if indexPath.item >= 15, indexPath.item < 18, countStars > 3 * 12 + 3 {
      isOpen = true
    } else if indexPath.item >= 18, indexPath.item < Level.Levels.allCases.count, countStars > 3 * 14 + 3 {
      isOpen = true
    }
    cell.configer(index: indexPath, stars: stars[indexPath.item], isOpen: isOpen)
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfLevels
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var countStars = 0
    stars.forEach{ countStars = countStars + $0 }
    var isOpen = false
    if indexPath.item < 3 {
      isOpen = true
    } else if indexPath.item >= 3, indexPath.item < 6, countStars > 3 * 2 + 1 {
      isOpen = true
    } else if indexPath.item >= 6, indexPath.item < 9, countStars > 3 * 5 + 1 {
      isOpen = true
    } else if indexPath.item >= 9, indexPath.item < 12, countStars > 3 * 7 + 2 {
      isOpen = true
    } else if indexPath.item >= 12, indexPath.item < 15, countStars > 3 * 9 + 3 {
      isOpen = true
    } else if indexPath.item >= 15, indexPath.item < 18, countStars > 3 * 12 + 3 {
      isOpen = true
    } else if indexPath.item >= 18, indexPath.item < Level.Levels.allCases.count, countStars > 3 * 14 + 3 {
      isOpen = true
    }
    guard isOpen else {
      tableView.deselectRow(at: indexPath, animated: true)
      return
    }
    
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "game") as? GameViewController else { return }
    vc.level = Level(level: Level.Levels.init(rawValue: indexPath.row) ?? .one)
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

