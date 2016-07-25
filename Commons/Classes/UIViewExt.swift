
import UIKit

private var overlayViewAssociationKey: UInt8 = 0
private var activityIndicatorAssociationKey: UInt8 = 0

public extension UIView {

  public private(set) var overlayView: UIView? {
    get {
      return objc_getAssociatedObject(self, &overlayViewAssociationKey) as? UIView
    }
    set {
      objc_setAssociatedObject(self, &overlayViewAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  private var activityIndicatorView: UIActivityIndicatorView? {
    get {
      return objc_getAssociatedObject(self, &activityIndicatorAssociationKey) as? UIActivityIndicatorView
    }
    set {
      objc_setAssociatedObject(self, &activityIndicatorAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  public func overlay(color color: UIColor = UIColor.blackColor(), alpha: CGFloat = 0.5) {
    if let overlayView = overlayView where overlayView.superview == self {
      overlayView.removeFromSuperview()
    }
    let _overlayView = UIView(frame: bounds)
    overlayView = _overlayView
    _overlayView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    addSubview(_overlayView)
    _overlayView.backgroundColor = color
    _overlayView.opaque = alpha < 1
    _overlayView.alpha = alpha
  }

  public func removeOverlay() {
    overlayView?.removeFromSuperview()
    overlayView = nil
  }

  public func blockWithActivityIndicator(activityIndicator: UIActivityIndicatorView, position: SubviewPosition) {
    userInteractionEnabled = false
    if let activityIndicatorView = activityIndicatorView where activityIndicatorView.superview == self {
      activityIndicatorView.removeFromSuperview()
    }
    activityIndicatorView = activityIndicator
    positionSubview(activityIndicator, at: position)

    activityIndicator.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin]
    addSubview(activityIndicator)
    activityIndicator.startAnimating()
  }

  public func unblock() {
    userInteractionEnabled = true
    if activityIndicatorView?.superview == self {
      activityIndicatorView?.removeFromSuperview()
    }
    activityIndicatorView = nil
  }

  public func removeAllSubviews() {
    for subview in subviews {
      subview.removeFromSuperview()
    }
  }

  public func positionSubview(subview: UIView, at position: SubviewPosition) {
    subview.center.x = center.x
    subview.center.y = bounds.height / 2
    switch position.contentMode {
    case .Top, .TopLeft, .TopRight:
      subview.frame.origin.y = position.margin
    case .Bottom, .BottomLeft, .BottomRight:
      subview.frame.origin.y = bounds.height - position.margin - subview.frame.height
    default: break
    }
    switch position.contentMode {
    case .Left, .TopLeft, .BottomLeft:
      subview.frame.origin.x = position.margin
    case .Right, .TopRight, .BottomRight:
      subview.frame.origin.x = bounds.width - position.margin - subview.frame.width
    default: break
    }
    subview.frame.origin.y += position.yCenterAdjustmentDueToUnderBar
  }
}
