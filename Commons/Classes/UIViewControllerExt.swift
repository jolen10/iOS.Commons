
import UIKit

public extension UIViewController {

  public var isViewLoadedOnWindow: Bool {
    return isViewLoaded() && view.window != nil
  }

  public var yCenterAdjustmentDueToUnderBar: CGFloat {
    let navBarHeight = heightOfShowingTranslucentBar(navigationController?.navigationBar)
    let tabBarHeight = heightOfShowingTranslucentBar(tabBarController?.tabBar)
    return navBarHeight - tabBarHeight
  }

  private func heightOfShowingTranslucentBar(bar: Bar?) -> CGFloat {
    guard let bar = bar where bar.isShowingAndTranslucent else {
      return 0
    }
    return bar.frame.height
  }

  public func addSubviewController(subviewController: UIViewController, inContainer: UIView? = nil) {
    let container: UIView = inContainer ?? view
    let subview = subviewController.view
    subview.frame = container.bounds
    addChildViewController(subviewController)
    container.addSubview(subview)
    subviewController.didMoveToParentViewController(self)
  }

  public func removeFromSuperViewController() {
    willMoveToParentViewController(nil)
    view.removeFromSuperview()
    removeFromParentViewController()
  }
}

private protocol Bar: class {

  var translucent: Bool { get }
  var hidden: Bool { get }
  var frame: CGRect { get }
}

extension Bar {

  var isShowingAndTranslucent: Bool {
    return !hidden && translucent
  }
}

extension UINavigationBar: Bar {
}

extension UITabBar: Bar {
}
