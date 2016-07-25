
import Foundation

public func nameOfClass(anyClass: AnyClass) -> String {
  return NSStringFromClass(anyClass).componentsSeparatedByString(".").last!
}
