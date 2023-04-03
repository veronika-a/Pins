
import SpriteKit

protocol GameProtocol: AnyObject {
  func gameOver(steps: Int)
}

class GameScene: SKScene {
  
  var vc: GameViewController?
  private var spikes: SKSpriteNode?
  var isGameOver: Bool = false
  private var scoreLabel: SKLabelNode!
  
  private var stoneSize: CGFloat = 0
  weak var gameProtocol: GameProtocol?
  private var background = SKSpriteNode(imageNamed: "bg")
  private var matrix: [[Stone?]] = []
  private var matrixPosition: [[CGPoint]] = []
  var level: Level = Level(level: .one)
  var steps: Int = 0
  
  var foundMatrixY: Int = 0
  var foundMatrixX: Int = 0

  func setUpScene() {
    stoneSize = ((self.frame.size.width - 80) / CGFloat(13))
    level.setupStones(stoneSize: stoneSize)
    create()
    //createMatrix()
    //backgroundColor = UIColor.darkGray

  }
  
//  private func setupTimer() {
//    let timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
//    self.timer = timer
//  }
//
//  @objc private func fireTimer() {
//  }
  
  private func create() {
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    let topPadding = (window?.safeAreaInsets.top ?? 0) + (view?.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0)
    
    let countX: Int = Int(frame.width / stoneSize) + 1
    let countY: Int = Int((frame.height + topPadding) / stoneSize) + 1

    matrix = Array(repeating: Array(repeating: nil, count: countX), count: countY)
    matrixPosition = Array(repeating: Array(repeating: .zero, count: countX), count: countY)

    var x: CGFloat = 0
    var y: CGFloat = frame.height
    for i in 0..<matrix.count {
      for j in 0..<matrix[i].count {
        let position = CGPoint(x: x, y: y)
        matrixPosition[i][j] = position
        x = x + stoneSize
      }
     
      y = y - stoneSize
      x = 0
    }
    
    for i in 0..<matrix.count {
      for j in 0..<matrix[i].count {
        if !(matrix[i][j]?.isInvisible ?? false) {
          let stoneBg = Stone(category: .extraLightBrown, width: stoneSize, bgColor: level.level.bg)
          stoneBg.position = matrixPosition[i][j]
          self.addChild(stoneBg)
        }
      }
    }
    
    foundMatrixY = Int((matrixPosition.count - level.level.countY) / 2)
    foundMatrixX = Int((matrixPosition[foundMatrixY].count - level.level.countX) / 2)
    for s in 0..<level.stones.count {
      guard let i = level.level.startPlaces[s].first, let j = level.level.startPlaces[s].last else { return }
      level.stones[s].position = matrixPosition[i + foundMatrixY][j + foundMatrixX]
      var flag = true
      level.level.invisible.forEach {
        guard let first = $0.first, let last = $0.last else { return }
        if first == i, last == j {
          flag = false
        }
      }
      matrix[i + foundMatrixY][j + foundMatrixX] = flag ? level.stones[s] : nil
      if flag { self.addChild(matrix[i + foundMatrixY][j + foundMatrixX]!) }
    }
  }
  
  private func createMatrix() {
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    let topPadding = (window?.safeAreaInsets.top ?? 0) + (view?.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0)
    
    let minX: CGFloat = 40
    let minY: CGFloat = self.frame.height - topPadding - 130 - stoneSize / 2

    var x = minX
    var y = minY
    matrix = Array(repeating: Array(repeating: nil, count: level.level.countX), count: level.level.countY)
    matrixPosition = Array(repeating: Array(repeating: .zero, count: level.level.countX), count: level.level.countY)

    for i in 0..<matrix.count {
      for j in 0..<matrix[i].count {
        let position = CGPoint(x: x, y: y)
        matrixPosition[i][j] = position
        x = x + stoneSize
      }
     
      y = y - stoneSize
      x = minX
    }
    
//    print(matrixPosition)
//    print(matrix)
    
    for i in 0..<matrix.count {
      for j in 0..<matrix[i].count {
        if !(matrix[i][j]?.isInvisible ?? false) {
          let stoneBg = Stone(category: .extraLightBrown, width: stoneSize, bgColor: level.level.bg)
          stoneBg.position = matrixPosition[i][j]
          self.addChild(stoneBg)
        }
      }
    }
    
    for s in 0..<level.stones.count {
      guard let i = level.level.startPlaces[s].first, let j = level.level.startPlaces[s].last else { return }

      level.stones[s].position = matrixPosition[i][j]
      var flag = true
      level.level.invisible.forEach {
        guard let first = $0.first, let last = $0.last else { return }
        if first == i, last == j {
          flag = false
        }
      }
      matrix[i][j] = flag ? level.stones[s] : nil
      if flag { self.addChild(matrix[i][j]!) }
    }
  }
  
  private func updateMatrix(position: CGPoint) {
    let maxY = (matrixPosition.first?.first?.y ?? 0) + stoneSize / 2
    let minY = (matrixPosition.last?.last?.y ?? 0) - stoneSize / 2
    guard position.y > minY - stoneSize / 2, position.y < maxY + stoneSize / 2 else { return }
    var foundY: Int? = nil
    for i in 0..<matrixPosition.count {
      if (matrixPosition[i].first?.y ?? 0) + stoneSize / 2 > position.y, (matrixPosition[i].first?.y ?? 0) - stoneSize / 2 < position.y {
        foundY = i
        break
      }
    }
    guard let foundY = foundY else { return }
    let minX = (matrixPosition[foundY].first?.x ?? 0) - stoneSize / 2
    let maxX = (matrixPosition[foundY].last?.x ?? 0) + stoneSize / 2
    guard position.x > minX - stoneSize / 2, position.x < maxX + stoneSize / 2 else { return }
    
    var foundX: Int? = nil
    for i in 0..<matrixPosition[foundY].count {
      if matrixPosition[foundY][i].x + stoneSize / 2 > position.x, matrixPosition[foundY][i].x - stoneSize / 2 < position.x {
        foundX = i
        break
      }
    }
    guard let foundX = foundX else { return }
    if matrix[foundY][foundX] == nil {
      let stone = Stone(category: level.level.invisibleType, width: stoneSize, isNew: true)
      stone.position = matrixPosition[foundY][foundX]
      self.addChild(stone)
      matrix[foundY][foundX] = stone
    } else {
      if let node = matrix[foundY][foundX], matrix[foundY][foundX]?.parent != nil, !node.isNew {
        matrix[foundY][foundX]?.removeFromParent()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
          guard let self = self else { return }
          self.matrix[foundY][foundX] = node
          self.addChild(node)
        }
      } else {
        matrix[foundY][foundX]?.removeFromParent()
        matrix[foundY][foundX] = nil
      }
    }
    check()
  }

  func check() {
    steps = steps + 1
    var flag = true
    for i in 0..<matrix.count {
      for j in 0..<matrix[i].count {
        if matrix[i][j] != nil {
          var sFlag = false
          for p in 0..<level.level.startPlaces.count {
            if
              let first = level.level.startPlaces[p].first,
              let last = level.level.startPlaces[p].last,
              i == first + foundMatrixY, j == last + foundMatrixX {
              sFlag = true
            }
          }
          if !sFlag {
            flag = false
          }
        }
      }
    }
    
    for p in 0..<level.level.startPlaces.count {
      if
        let first = level.level.startPlaces[p].first,
        let last = level.level.startPlaces[p].last,
        let item = matrix[first + foundMatrixY][last + foundMatrixX] {
        if level.level.stones[p] != item.type {
          flag = false
        }
      } else {
        flag = false
      }
    }
    
    if flag {
      gameOver()
    }
  }

  override func didMove(to view: SKView) {
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    background.size = CGSize(width: self.size.width, height: self.size.height)
    self.addChild(background)
    self.setUpScene()
  }
  
  private func gameOver() {
    guard !isGameOver else { return }
    isGameOver = true
    vc?.levelLabel?.isHidden = false
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
      guard let self = self else { return }
      self.removeAllActions()
      self.removeAllChildren()
      self.vc?.gameOver(steps: self.steps)
    }
  }
  
}

extension GameScene {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches {
      let location = t.location(in: self)
      updateMatrix(position: location)
    }
  }
}
