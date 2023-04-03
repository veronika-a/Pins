import Foundation
import GameKit

class Level {
  var level: Levels = .one
  var stones: [Stone] = [Stone]()
  var links: [SKShapeNode] = [SKShapeNode]()
  
  init(level: Levels) {
    self.level = level
  }
  
  func setupStones(stoneSize: CGFloat) {
    stones.removeAll()
    links.removeAll()
    for s in 0..<level.stones.count {
      let stone = Stone(category: level.stones[s], width: stoneSize)
      stone.name = "\(s)"
      stones.append(stone)
    }
  }
  
  enum Levels: Int, CaseIterable {
    case one = 0, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twentyOne
    
    var name: String {
      switch self {
        case .one:
          return "Boy"
        case .two:
          return "Heart"
        case .three:
          return "Face"
        case .four:
          return "Apple"
        case .five:
          return "Chess board"
        case .six:
          return "House"
        case .seven:
          return "Mouth"
        case .eight:
          return "?"
        case .nine:
          return "Car"
        case .ten:
          return "Burger"
        case .eleven:
          return "Rocket"
        case .twelve:
          return "Sushi"
        case .thirteen:
          return "Chicken"
        case .fourteen:
          return "Candle"
        case .fifteen:
          return "The Statue of Liberty"
        case .sixteen:
          return "Elephant"
        case .seventeen:
          return "Scissors"
        case .eighteen:
          return "Saxophone"
        case .nineteen:
          return "Camel"
        case .twenty:
          return "Rain"
        case .twentyOne:
          return "Cherry"
      }
    }
    var countX: Int {
      switch self {
        case .one:
          return 9
        case .two:
          return 7
        case .three:
          return 5
        case .four:
          return 5
        case .five:
          return 6
        case .six:
          return 7
        case .seven:
          return 10
        case .eight:
          return 5
        case .nine:
          return 9
        case .ten:
          return 11
        case .eleven:
          return 7
        case .twelve:
          return 7
        case .thirteen:
          return 9
        case .fourteen:
          return 5
        case .fifteen:
          return 7
        case .sixteen:
          return 11
        case .seventeen:
          return 9
        case .eighteen:
          return 7
        case .nineteen:
          return 8
        case .twenty:
          return 9
        case .twentyOne:
          return 9
      }
    }
    
    var countY: Int {
      switch self {
        case .one:
          return 12
        case .two:
          return 7
        case .three:
          return 6
        case .four:
          return 7
        case .five:
          return 6
        case .six:
          return 8
        case .seven:
          return 6
        case .eight:
          return 9
        case .nine:
          return 5
        case .ten:
          return 8
        case .eleven:
          return 15
        case .twelve:
          return 8
        case .thirteen:
          return 8
        case .fourteen:
          return 16
        case .fifteen:
          return 13
        case .sixteen:
          return 7
        case .seventeen:
          return 11
        case .eighteen:
          return 10
        case .nineteen:
          return 7
        case .twenty:
          return 11
        case .twentyOne:
          return 10
      }
    }
    
    var stones: [Stone.StoneType] {
      switch self {
        case .one:
          return [.extraLightBrown, .extraLightBrown, .extraLightBrown,
                  .body, .body, .body,
                  .body, .body, .body,
                  .body,
                  .body, .body, .red, .red, .red, .red, .red, .body, .body,
                  .red, .red, .red,
                  .red, .red, .red,
                  .blue, .blue, .blue,
                  .blue, .blue,
                  .blue, .blue,
                  .blue, .blue,
                  .body, .body
          ]
        case .two:
          return [.red, .red, .red, .red,
                  .red, .red, .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red,
                  .red, .red, .red,
                  .red
          ]
        case .three:
          return [.black, .body, .black,
                  .body,
                  .body, .body, .body,
                  .black, .white, .white, .white, .black,
                  .black,.black, .black
          ]
        case .four:
          return [.green,
                  .brown,
                  .red, .red, .red,
                  .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red,
                  .red, .red, .red,
          ]
        case .five:
          return [.white, .black, .white, .black, .white, .black,
                  .black, .white, .black, .white, .black, .white,
                  .white, .black, .white, .black, .white, .black,
                  .black, .white, .black, .white, .black, .white,
                  .white, .black, .white, .black, .white, .black,
                  .black, .white, .black, .white, .black, .white
          ]
        case .six:
          return [.red,
                  .red, .red, .red,
                  .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red, .red, .red,
                  .white, .white, .white, .white, .white, .white, .white,
                  .white, .lightBlue, .lightBlue, .white, .brown, .brown, .white,
                  .white, .lightBlue, .lightBlue, .white, .brown, .brown, .white,
                  .white, .white, .white, .white, .brown, .brown, .white
            ]
        case .seven:
          return [.red, .red, .red, .red, .red, .red,
                  .red, .red, .red, .red, .red, .red, .red, .red, .red, .red,
                  .mutedRed, .mutedRed, .white, .white, .white, .white, .white, .white, .mutedRed, .mutedRed,
                  .mutedRed, .mutedRed, .white, .white, .white, .white, .mutedRed, .mutedRed,
                  .mutedRed, .mutedRed, .mutedRed, .mutedRed, .mutedRed, .mutedRed, .mutedRed, .mutedRed,
                  .mutedRed, .mutedRed, .mutedRed, .mutedRed, .mutedRed, .mutedRed
          ]
        case .eight:
          return [.black, .black, .black,
                  .black, .black,
                  .black,
                  .black,
                  .black,
                  .black,
                  .black,
                  .black
          ]
        case .nine:
          return [.lightBlue, .red, .lightBlue, .lightBlue, .lightBlue,
                  .lightBlue, .lightBlue, .red, .lightBlue, .lightBlue, .lightBlue, .lightBlue,
                  .red, .red, .red, .red, .red, .red, .red, .red, .red,
                  .red, .black, .black, .red, .red, .red, .black, .black, .red,
                  .black, .black, .black, .black
          ]
        case .ten:
          return [.lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .lightBrown, .lightBrown, .lightBrown, .extraLightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .extraLightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .lightBrown, .lightBrown, .extraLightBrown, .lightBrown, .lightBrown, .extraLightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown,
                  .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown, .brown,
                  .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown
                  
          ]
        case .eleven:
          return [.white,
                  .white,
                  .white, .white, .white,
                  .white, .white, .white,
                  .white, .red, .white,
                  .red, .white, .red,
                  .white, .white, .white,
                  .white, .white, .white,
                  .white, .white, .white,
                  .white, .white, .white,
                  .lightGrey, .white, .white, .white, .lightGrey,
                  .lightGrey, .lightGrey, .white, .white, .white, .lightGrey, .lightGrey,
                  .lightGrey, .lightGrey, .white, .white, .white, .lightGrey, .lightGrey,
                  .yellow, .yellow,
                  .red, .red
          ]
        case .twelve:
          return [.black, .black, .black, .black, .black,
                  .black, .black, .white, .white, .white, .black, .black,
                  .darkGrey, .white, .rose, .rose, .rose, .white, .darkGrey,
                  .black, .darkGrey, .white, .white, .white, .darkGrey, .black,
                  .black, .black, .black, .black, .black, .black, .black,
                  .black, .black, .black, .black, .black, .black, .black,
                  .black, .black, .black, .black, .black, .black, .black,
                  .black, .black, .black, .black, .black,
          ]
        case .thirteen:
          return [.white, .white,
                  .white, .white, .white, .white, .orange,
                  .white, .lightGrey, .white, .white, .white, .white,
                  .white, .lightGrey, .white, .white, .white, .white,
                  .white, .white, .lightGrey, .lightGrey, .white,
                  .white, .white, .white,
                  .orange,
                  .orange, .orange
          ]
        case .fourteen:
          return [.red,
                  .red,
                  .red, .red,
                  .red, .red, .red,
                  .red, .yellow, .red, .red,
                  .red, .red, .yellow, .yellow, .red,
                  .red, .yellow, .yellow, .yellow, .red,
                  .red, .yellow, .yellow, .yellow, .red,
                  .red, .red, .red,
                  .white,
                  .lightGrey, .lightGrey, .lightGrey, .lightGrey, .lightGrey,
                  .white, .lightGrey, .white, .lightGrey, .white,
                  .white, .lightGrey, .white, .white, .white,
                  .white, .white, .white, .white, .white,
                  .white, .white, .white, .white, .white,
                  .white, .white, .white, .white, .white
          ]
        case .fifteen:
          return [.yellow,
                  .brightGreen, .green,
                  .brightGreen, .brightGreen,
                  .brightGreen, .green, .green, .brightGreen,
                  .green, .brightGreen, .brightGreen, .brightGreen,
                  .brightGreen, .green, .brightGreen, .brightGreen,
                  .green, .green, .green,
                  .green, .green, .green,
                  .brightGreen, .green, .brightGreen,
                  .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .lightBrown, .lightBrown, .lightBrown, .lightBrown, .lightBrown,
                  .brown, .brown, .brown, .brown, .brown, .brown, .brown
          ]
        case .sixteen:
          return [.grey, .grey,
                  .grey, .grey, .grey, .darkGrey, .grey, .grey, .grey,
                  .grey, .grey, .grey, .grey, .darkGrey, .grey, .grey, .grey, .grey,
                  .grey, .grey, .grey, .grey, .grey, .darkGrey, .grey, .grey, .grey, .grey,
                  .grey, .grey, .grey, .grey, .grey, .grey, .darkGrey, .darkGrey, .grey,
                  .grey, .grey, .grey, .grey, .grey,
                  .grey, .grey, .grey, .grey, .grey
          ]
        case .seventeen:
          return [.darkGrey, .darkGrey,
                  .darkGrey, .darkGrey,
                  .darkGrey, .darkGrey,
                  .darkGrey, .darkGrey,
                  .darkGrey, .darkGrey,
                  .darkGrey, .darkGrey,
                  .darkGrey,
                  .red, .red, .red, .red, .red, .red,
                  .red, .red, .red, .red,
                  .red, .red, .red, .red,
                  .red, .red, .red, .red,
                  
          ]
        case .eighteen:
          return [.black, .yellow,
                  .yellow,
                  .warmYellow, .warmYellow,
                  .yellow, .yellow, .yellow, .warmYellow,
                  .warmYellow, .yellow, .yellow, .yellow, .warmYellow,
                  .yellow, .yellow, .warmYellow, .yellow, .warmYellow,
                  .warmYellow, .yellow, .yellow, .warmYellow,
                  .yellow, .yellow, .warmYellow,
                  .yellow, .yellow, .yellow, .yellow,
                  .yellow, .yellow
          ]
        case .nineteen:
          return [.brown, .brown, .brown, .brown,
                  .brown, .brown, .brown, .brown, .brown, .brown,
                  .brown, .brown, .brown, .brown, .brown, .brown,
                  .brown, .brown, .brown, .darkBrown, .brown, .brown, .brown,
                  .brown, .darkBrown, .brown,
                  .brown, .brown,
                  .darkBrown, .darkBrown
          ]
        case .twenty:
          return [.lightGrey, .white, .white,
                  .lightGrey, .white, .white, .white, .white,
                  .lightGrey, .white, .white, .white, .white, .white, .lightGrey, .white,
                  .lightGrey, .white, .white, .white, .white, .lightGrey, .white, .white, .white,
                  .blue, .blue, .blue,
                  .blue, .blue, .blue,
                  .blue, .blue, .blue,
                  .blue, .blue, .blue
          ]
        case .twentyOne:
          return [.brightGreen, .brightGreen,
                  .brightGreen, .brightGreen,
                  .brightGreen, .brightGreen,
                  .brightGreen, .brightGreen,
                  .brightGreen, .brightGreen,
                  .brightGreen, .brightGreen,
                  .red, .red, .red, .red,
                  .red, .white, .red,.red, .red, .white, .red, .red,
                  .red, .red, .red, .red, .red, .red,.red, .red,
                  .red, .red, .red, .red
          ]
      }
    }
    
    var startPlaces: [[Int]] {
      switch self {
        case .one:
          return [[0, 3], [0, 4], [0, 5],
                  [1, 3], [1, 4], [1, 5],
                  [2, 3], [2, 4], [2, 5],
                  [3, 4],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8],
                  [5, 3], [5, 4], [5, 5],
                  [6, 3], [6, 4], [6, 5],
                  [7, 3], [7, 4], [7, 5],
                  [8, 3], [8, 5],
                  [9, 3], [9, 5],
                  [10, 3], [10, 5],
                  [11, 3], [11, 5],
          ]
        case .two:
          return [[0, 1], [0, 2], [0, 4], [0, 5],
                  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6],
                  [4, 1], [4, 2], [4, 3], [4, 4], [4, 5],
                  [5, 2], [5, 3], [5, 4],
                  [6, 3]
          ]
        case .three:
          return [[0, 0], [0, 2], [0, 4],
                  [1, 2],
                  [2, 1], [2, 2], [2, 3],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4],
                  [5, 1], [5, 2], [5, 3]
          ]
        case .four:
          return [[0, 1],
                  [1, 2],
                  [2, 1], [2, 2], [2, 3],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4],
                  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4],
                  [6, 1], [6, 2], [6, 3],
          ]
        case .five:
          return [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5],
                  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5],
          ]
        case .six:
          return [[0, 3],
                  [1, 2], [1, 3], [1, 4],
                  [2, 1], [2, 2], [2, 3], [2, 4], [2, 5],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6],
                  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6],
                  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6],
                  [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6]
          ]
        case .seven:
          return [[0, 1], [0, 2], [0, 3], [0, 6], [0, 7], [0, 8],
                  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [2, 9],
                  [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8],
                  [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8],
                  [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7]
          ]
        case .eight:
          return [[0, 1], [0, 2], [0, 3],
                  [1, 0], [1, 4],
                  [2, 4],
                  [3, 4],
                  [4, 3],
                  [5, 2],
                  [6, 2],
                  [8, 2]
          ]
        case .nine:
          return [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8],
                  [4, 1], [4, 2], [4, 6], [4, 7]
          ]
        case .ten:
          return [[0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                  [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [2, 9], [2, 10],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8], [3, 9], [3, 10],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8], [4, 9], [4, 10],
                  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [5, 8], [5, 9], [5, 10],
                  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8], [6, 9], [6, 10],
                  [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8], [7, 9], [7, 10],
          ]
        case .eleven:
          return [[0, 3],
                  [1, 3],
                  [2, 2], [2, 3], [2, 4],
                  [3, 2], [3, 3], [3, 4],
                  [4, 2], [4, 3], [4, 4],
                  [5, 2], [5, 3], [5, 4],
                  [6, 2], [6, 3], [6, 4],
                  [7, 2], [7, 3], [7, 4],
                  [8, 2], [8, 3], [8, 4],
                  [9, 2], [9, 3], [9, 4],
                  [10, 1], [10, 2], [10, 3], [10, 4], [10, 5],
                  [11, 0], [11, 1], [11, 2], [11, 3], [11, 4], [11, 5], [11, 6],
                  [12, 0], [12, 1], [12, 2], [12, 3], [12, 4], [12, 5], [12, 6],
                  [13, 2], [13, 4],
                  [14, 2], [14, 4]
          ]
        case .twelve:
          return [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
                  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6],
                  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6],
                  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6],
                  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6],
                  [7, 1], [7, 2], [7, 3], [7, 4], [7, 5]
          ]
        case .thirteen:
          return [[0, 6], [0, 7],
                  [1, 0], [1, 5], [1, 6], [1, 7], [1, 8],
                  [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6],
                  [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6],
                  [4, 1], [4, 2], [4, 3], [4, 4], [4, 5],
                  [5, 2], [5, 3], [5, 4],
                  [6, 3],
                  [7, 3], [7, 4]
          ]
        case .fourteen:
          return [[0, 1],
                  [1, 2],
                  [2, 2], [2, 3],
                  [3, 1], [3, 2], [3, 3],
                  [4, 1], [4, 2], [4, 3], [4, 4],
                  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4],
                  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4],
                  [7, 0], [7, 1], [7, 2], [7, 3], [7, 4],
                  [8, 1], [8, 2], [8, 3],
                  [9, 2],
                  [10, 0], [10, 1], [10, 2], [10, 3], [10, 4],
                  [11, 0], [11, 1], [11, 2], [11, 3], [11, 4],
                  [12, 0], [12, 1], [12, 2], [12, 3], [12, 4],
                  [13, 0], [13, 1], [13, 2], [13, 3], [13, 4],
                  [14, 0], [14, 1], [14, 2], [14, 3], [14, 4],
                  [15, 0], [15, 1], [15, 2], [15, 3], [15, 4],
          ]
        case .fifteen:
          return [[0, 1],
                  [1, 1], [1, 3],
                  [2, 1], [2, 3],
                  [3, 1], [3, 2], [3, 3], [3, 4],
                  [4, 2], [4, 3], [4, 4], [4, 5],
                  [5, 2], [5, 3], [5, 4], [5, 5],
                  [6, 2], [6, 3], [6, 4],
                  [7, 2], [7, 3], [7, 4],
                  [8, 2], [8, 3], [8, 4],
                  [9, 1], [9, 2], [9, 3], [9, 4], [9, 5],
                  [10, 1], [10, 2], [10, 3], [10, 4], [10, 5],
                  [11, 1], [11, 2], [11, 3], [11, 4], [11, 5],
                  [12, 0], [12, 1], [12, 2], [12, 3], [12, 4], [12, 5], [12, 6]
          ]
        case .sixteen:
          return [[0, 7], [0, 8],
                  [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9],
                  [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [2, 9], [2, 10],
                  [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8], [3, 9], [3, 10],
                  [4, 0], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8], [4, 10],
                  [5, 2], [5, 3], [5, 7], [5, 8], [5, 10],
                  [6, 2], [6, 3], [6, 7], [6, 8], [6, 10]
          ]
        case .seventeen:
          return [[0, 1], [0, 7],
                  [1, 1], [1, 7],
                  [2, 2], [2, 6],
                  [3, 2], [3, 6],
                  [4, 3], [4, 5],
                  [5, 3], [5, 5],
                  [6, 4],
                  [7, 1], [7, 2], [7, 3], [7, 5], [7, 6], [7, 7],
                  [8, 0], [8, 3], [8, 5], [8, 8],
                  [9, 0], [9, 3], [9, 5], [9, 8],
                  [10, 1], [10, 2], [10, 6], [10, 7]
          ]
        case .eighteen:
          return [[0, 0], [0, 1],
                  [1, 2],
                  [2, 2], [2, 7],
                  [3, 2], [3, 5], [3, 6], [3, 7],
                  [4, 2], [4, 4], [4, 5], [4, 6], [4, 7],
                  [5, 2], [5, 4], [5, 5], [5, 6], [5, 7],
                  [6, 2], [6, 4], [6, 5], [6, 7],
                  [7, 2], [7, 4], [7, 5],
                  [8, 2], [8, 3], [8, 4], [8, 5],
                  [9, 3], [9, 4]
                  
          ]
        case .nineteen:
          return [[0, 2], [0, 4], [0, 7], [0, 8],
                  [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 7],
                  [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 7],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6],
                  [4, 1], [4, 2], [4, 5],
                  [5, 1], [5, 5],
                  [6, 1], [6, 5],
          ]
        case .twenty:
          return [[0, 2], [0, 3], [0, 4],
                  [1, 1], [1, 2], [1, 3], [1, 4], [1, 5],
                  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7],
                  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8],
                  [4, 1], [4, 4], [4, 7],
                  [6, 2], [6, 5], [6, 8],
                  [8, 0], [8, 3], [8, 6],
                  [10, 1], [10, 4], [10, 7]
          ]
        case .twentyOne:
          return [[0, 6], [0, 7],
                  [1, 6], [1, 7],
                  [2, 5], [2, 7],
                  [3, 5], [3, 7],
                  [4, 4], [4, 7],
                  [5, 3], [5, 7],
                  [6, 1], [6, 2], [6, 6], [6, 7],
                  [7, 0], [7, 1], [7, 2], [7, 3], [7, 5], [7, 6], [7, 7], [7, 8],
                  [8, 0], [8, 1], [8, 2], [8, 3], [8, 5], [8, 6], [8, 7], [8, 8],
                  [9, 1], [9, 2], [9, 6], [9, 7],
          ]
      }
    }
    
    var invisibleType: Stone.StoneType {
      switch self {
        case .one:
          return .body
        case .two:
          return .red
        case .three:
          return .black
        case .four:
          return .red
        case .five:
          return .white
        case .six:
          return .brown
        case .seven:
          return .white
        case .eight:
          return .black
        case .nine:
          return .black
        case .ten:
          return .brown
        case .eleven:
          return .lightGrey
        case .twelve:
          return .rose
        case .thirteen:
          return .orange
        case .fourteen:
          return .yellow
        case .fifteen:
          return .yellow
        case .sixteen:
          return .grey
        case .seventeen:
          return .red
        case .eighteen:
          return .yellow
        case .nineteen:
          return .brown
        case .twenty:
          return .blue
        case .twentyOne:
          return .red
      }
    }
    
    var invisible: [[Int]] {
      switch self {
        case .one:
          return [[11, 3]]
        case .two:
          return [[6, 3]]
        case .three:
          return [[0, 4]]
        case .four:
          return [[2, 3], [3, 3], [3, 4]]
        case .five:
          return [[1, 3], [3, 1], [4, 4]]
        case .six:
          return [[7, 4], [7, 5], [6, 4], [6, 5], [5, 4], [5, 5]]
        case .seven:
          return [[2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7],
                  [3, 3], [3, 4], [3, 5], [3, 6]
          ]
        case .eight:
          return [[8, 2]]
        case .nine:
          return [[3, 1], [3, 2], [4, 1], [4, 2]]
        case .ten:
          return [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [5, 8], [5, 9], [5, 10],
                  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8], [6, 9], [6, 10],
          ]
        case .eleven:
          return [[10, 1],
                  [11, 0], [11, 1],
                  [12, 0], [12, 1]
          ]
        case .twelve:
          return [[2, 2], [2, 3], [2, 4]]
        case .thirteen:
          return [[1, 8]]
        case .fourteen:
          return [[4, 2], [5, 2], [5, 3], [6, 1], [6, 2], [6, 3], [7, 1], [7, 2], [7, 3]]
        case .fifteen:
          return [[0, 1]]
        case .sixteen:
          return [[4, 10], [5, 10], [6, 10]]
        case .seventeen:
          return [[7, 5], [7, 6], [7, 7],
                  [8, 5], [8, 8],
                  [9, 5], [9, 8],
                  [10, 6], [10, 7]
          ]
        case .eighteen:
          return [[1, 2],
                  [3, 2],
                  [5, 2],
                  [7, 2]
          ]
        case .nineteen:
          return [[0, 2], [0, 4]]
        case .twenty:
          return [[6, 5],
                  [8, 3],
                  [10, 7]
          ]
        case .twentyOne:
          return [[6, 1], [6, 2],
                  [7, 0], [7, 2], [7, 3],
                  [8, 0], [8, 1], [8, 2], [8, 3],
                  [9, 1], [9, 2]
          ]
      }
    }
    
    var bg: Stone.StoneType {
      switch self {
        case .one:
          return .mutedGreen
        case .two:
          return .white
        case .three:
          return .warmYellow
        case .four:
          return .white
        case .five:
          return .brown
        case .six:
          return .mutedGreen
        case .seven:
          return .body
        case .eight:
          return .white
        case .nine:
          return .grey
        case .ten:
          return .white
        case .eleven:
          return .darkGrey
        case .twelve:
          return .mutedGreen
        case .thirteen:
          return .mutedGreen
        case .fourteen:
          return .darkGrey
        case .fifteen:
          return .white
        case .sixteen:
          return .white
        case .seventeen:
          return .white
        case .eighteen:
          return .orange
        case .nineteen:
          return .yellow
        case .twenty:
          return .azul
        case .twentyOne:
          return .extraLightBrown
      }
    }
  }
}
