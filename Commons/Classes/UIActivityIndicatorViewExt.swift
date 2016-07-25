
import UIKit

public extension UIActivityIndicatorView {

  public class func initLargeBoxStyleIndicator() -> UIActivityIndicatorView {
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    indicator.applyLargeBoxAppearance()
    return indicator
  }

  private func applyLargeBoxAppearance() {
    color = UIColor.blackColor()
    frame.size.width *= 2
    frame.size.height *= 2
    let backView = UIView(frame: bounds)
    backView.backgroundColor = UIColor.whiteColor()
    backView.alpha = 0.9
    backView.layer.cornerRadius = 5
    addSubview(backView)
    sendSubviewToBack(backView)
  }
}
