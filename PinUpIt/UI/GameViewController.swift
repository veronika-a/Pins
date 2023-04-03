//
//  GameViewController.swift
//  MagicGems iOS
//
//  Created by Veronika Andrianova on 14.09.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  
  @IBOutlet private weak var skView: SKView?
  @IBOutlet weak var levelLabel: UILabel?

  var level = Level.init(level: .one)
  var scene: GameScene?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    newGame()
  }
  
  func newGame() {
    levelLabel?.isHidden = true
    levelLabel?.text = "\(level.level.name.uppercased())"
    self.scene = nil
    if let skView = self.view as! SKView? {
      skView.showsPhysics = true
      let scene = GameScene()
      scene.vc = self
      scene.level = level
      scene.backgroundColor = .clear
      scene.isGameOver = false
      scene.gameProtocol = self
      scene.scaleMode = .resizeFill
      skView.allowsTransparency = true
      skView.presentScene(scene)
      self.scene = scene
    }
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  @IBAction func backButtonTap(_ sender: UIButton) {
    scene = nil
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func replayTap(_ sender: UIButton) {
    newGame()
  }
  
}

extension GameViewController: GameProtocol {
  func gameOver(steps: Int) {
    var stars = 0
    switch abs(steps - level.level.invisible.count) {
      case 0:
        stars = 3
      case 1, 2:
        stars = 2
      case 3, 4:
        stars = 1
      default:
        break
    }
    let savedStars = UserDefaultsHelper.shared.stars[level.level.rawValue]
    var win = stars == 3 ? true : savedStars < stars
    if savedStars == 0 {
      //UserDefaultsHelper.shared.level = UserDefaultsHelper.shared.level + 1
      win = true
    }
    if win, savedStars != 3 {
      var new = UserDefaultsHelper.shared.stars
      new[level.level.rawValue] = stars
      UserDefaultsHelper.shared.stars = new
    }
    SoundManager.shared.playSound(name: win ? "win.mp3" : "falling.wav")
    let vc = storyboard?.instantiateViewController(withIdentifier: "finish") as! FinishViewController
    vc.isWinning = win
    vc.stars = stars
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}
