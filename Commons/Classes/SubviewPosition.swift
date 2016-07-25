
import UIKit

public struct SubviewPosition {

  public var contentMode: UIViewContentMode
  public var margin: CGFloat
  public var yCenterAdjustmentDueToUnderBar: CGFloat

  init(contentMode: UIViewContentMode, margin: CGFloat = 0, yCenterAdjustmentDueToUnderBar: CGFloat = 0) {
    self.contentMode = contentMode
    self.margin = margin
    self.yCenterAdjustmentDueToUnderBar = yCenterAdjustmentDueToUnderBar
  }
}
