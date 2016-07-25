
import Foundation

public protocol InitableFromNib: class { }

public extension InitableFromNib {

  public static func initFromNib(inbundle bundle: NSBundle = NSBundle.mainBundle()) -> Self {
    return UINib(nibName: nameOfClass(self), bundle: bundle).instantiateWithOwner(nil, options: nil).first as! Self
  }
}

extension UIView: InitableFromNib {
}

public protocol InitableFromStoryboard: class {
}

public extension InitableFromStoryboard {

  public static func initFromStoryboard(storyboard: UIStoryboard?) -> Self {
    let _storyboard = storyboard ?? mainStoryboard
    return _storyboard.instantiateViewControllerWithIdentifier(nameOfClass(Self)) as! Self
  }

  private static var mainStoryboard: UIStoryboard {
    let mainBundle = NSBundle.mainBundle()
    let mainStoryboardName = mainBundle.infoDictionary!["UIMainStoryboardFile"] as! String
    return UIStoryboard(name: mainStoryboardName, bundle: mainBundle)
  }
}

extension UIViewController: InitableFromStoryboard {
}
