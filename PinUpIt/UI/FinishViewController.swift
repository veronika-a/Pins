import UIKit
import GameKit

class FinishViewController: UIViewController {
  
  @IBOutlet weak var star3: UIImageView!
  @IBOutlet weak var star2: UIImageView!
  @IBOutlet weak var star1: UIImageView!
  @IBOutlet weak var bgImage: UIImageView!
  @IBOutlet weak var exitButton: UIButton!
  @IBOutlet weak var statusImg: UIImageView!
  @IBOutlet weak var musicButton: UIButton!
  
  var stars = 0
  var isWinning: Bool = false

  private var isMuted = UserDefaultsHelper.shared.isMuted {
    didSet {
      DispatchQueue.main.async { [self] in
        if isMuted {
          musicButton.setBackgroundImage(UIImage(named: "SoundOff"), for: .normal)
          SoundManager.shared.stopMusic()
        } else {
          musicButton.setBackgroundImage(UIImage(named: "SoundOn"), for: .normal)
          SoundManager.shared.playBackgroundMusic()
        }
        UserDefaultsHelper.shared.isMuted = isMuted
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    populate()
    isMuted = UserDefaultsHelper.shared.isMuted
  }
  
  private func populate() {
    star1.image = stars > 0 ? UIImage(named: "star") : UIImage(named: "starEmpty")
    star2.image = stars > 1 ? UIImage(named: "star") : UIImage(named: "starEmpty")
    star3.image = stars > 2 ? UIImage(named: "star") : UIImage(named: "starEmpty")
    switch isWinning {
      case true:
        statusImg.image = UIImage(named: "youWin")
        exitButton.setBackgroundImage(UIImage(named: "right"), for: .normal)
      case false:
        statusImg.image = UIImage(named: "youLose")
        exitButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
    }
  }
  
  @IBAction func tryAgain(_ sender: Any) {
    if !isWinning {
      if let vc = navigationController?.viewControllers.filter({$0.isKind(of: GameViewController.self)}).first {
        navigationController?.popToViewController(vc, animated: true)
      }
    } else {
      if let vc = navigationController?.viewControllers.filter({$0.isKind(of: LevelViewController.self)}).first {
        navigationController?.popToViewController(vc, animated: true)
      }
    }
  }
  
  @IBAction func home(_ sender: Any) {
    if let vc = navigationController?.viewControllers.filter({$0.isKind(of: InitViewController.self)}).first {
      navigationController?.popToViewController(vc, animated: true)
    }
  }
  
  @IBAction func back(_ sender: Any) {
    if let vc = navigationController?.viewControllers.filter({$0.isKind(of: GameViewController.self)}).first {
      navigationController?.popToViewController(vc, animated: true)
    }
  }
  
  @IBAction func soundTap(_ sender: Any) {
    isMuted = !isMuted
  }
}

