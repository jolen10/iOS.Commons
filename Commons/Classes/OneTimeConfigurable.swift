
import UIKit

public protocol OneTimeConfigurable: class {
}

private var finishOneTimeConfigAssociationKey: UInt8 = 0

public extension OneTimeConfigurable {

  private var finishOneTimeConfig: Bool {
    get {
      return objc_getAssociatedObject(self, &finishOneTimeConfigAssociationKey) as? Bool ?? false
    }
    set {
      objc_setAssociatedObject(self, &finishOneTimeConfigAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  public func oneTimeConfig(block: (Self)->Void) {
    if finishOneTimeConfig {
      return
    }
    block(self)
  }
}

extension UICollectionViewCell: OneTimeConfigurable {
}

extension UITableViewCell: OneTimeConfigurable {
}
