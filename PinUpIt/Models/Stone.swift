import UIKit
import SpriteKit

class Stone: SKSpriteNode {
  var type: StoneType = .black
  var isInvisible: Bool = false
  var stoneSize: CGFloat = 50
  var isNew: Bool = false
  
  enum StoneType: String, CaseIterable {
    case extraLightBrown, blue, red, body, mutedGreen, azul, black, brightGreen, brown, darkBrown,
         darkGrey, green, grey, lightBlue, lightBrown, lightGrey, mutedGrey, mutedRed, yellow,
         orange, rose, warmYellow, white
    
    var color: UIImage {
      let rand = Int.random(in: 0...2)
      return UIImage(named: "\(self.rawValue)-\(rand)") ?? UIImage()
    }
  }
  
  init(category: StoneType, width: CGFloat, bgColor: StoneType? = nil, isNew: Bool = false) {
    self.stoneSize = width
    self.isNew = isNew
    let texture = SKTexture(image: bgColor != nil ? bgColor!.color : category.color )
    self.type = category
    super.init(texture: texture, color: UIColor.clear, size: texture.size())
    self.setScale(toWidth: stoneSize)
    self.name = UUID().uuidString
    if bgColor == nil, isNew {
      let img = UIImage(named: "pin-\(Int.random(in: 0...5))") ?? UIImage()
      let textureSmall = SKTexture(image: img)
      let node = SKSpriteNode(texture: textureSmall, size: CGSize(width: textureSmall.size().width, height:  textureSmall.size().height))
      node.position = CGPointMake(self.frame.midX, self.frame.midY )
      self.addChild(node)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
