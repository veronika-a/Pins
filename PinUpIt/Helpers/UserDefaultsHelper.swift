import Foundation

public enum UserDefaultsKeys: String, CaseIterable {
  case isMuted
  case isMutedSound
  //case level
  case leaderboardID
  case stars
}

class UserDefaultsHelper {
  static let shared = UserDefaultsHelper()
//  var level: Int {
//    get {
//      return UserDefaults.standard.integer(forKey: UserDefaultsKeys.level.rawValue)
//    }
//    set {
//      guard newValue >= 0 else { return }
//      UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.level.rawValue)
//    }
//  }
  
  var isMuted: Bool {
    get {
      return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isMuted.rawValue)
    }
    set {
      UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isMuted.rawValue)
    }
  }
  
  var isMutedSound: Bool {
    get {
      return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isMutedSound.rawValue)
    }
    set {
      UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isMutedSound.rawValue)
    }
  }
  
  var stars: [Int] {
    get {
      if let array = UserDefaults.standard.array(forKey: UserDefaultsKeys.stars.rawValue) as? [Int] {
        return array
      } else {
        return []
      }
    }
    set {
      guard !stars.isEmpty else { return }
      UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.stars.rawValue)
    }
  }
  
  init() {
    UserDefaults.standard.register(defaults: [UserDefaultsKeys.isMuted.rawValue : false])
    UserDefaults.standard.register(defaults: [UserDefaultsKeys.isMutedSound.rawValue : false])
    //UserDefaults.standard.register(defaults: [UserDefaultsKeys.level.rawValue : 0])
    var array = [Int]()
    for _ in 0..<Level.Levels.allCases.count {
      array.append(0)
    }
    UserDefaults.standard.register(defaults: [UserDefaultsKeys.stars.rawValue : array])
  }
}
