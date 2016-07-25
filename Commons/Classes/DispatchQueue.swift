
import Foundation

public struct DispatchQueue {

  public static var main: DispatchQueue {
    return DispatchQueue(queue: dispatch_get_main_queue())
  }

  public static var globalDefault: DispatchQueue {
    return DispatchQueue(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
  }

  public static var globalBackground: DispatchQueue {
    return DispatchQueue(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
  }

  public static var globalHigh: DispatchQueue {
    return DispatchQueue(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0))
  }

  public static var globalLow: DispatchQueue {
    return DispatchQueue(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0))
  }

  private let queue: dispatch_queue_t

  private init(queue: dispatch_queue_t) {
    self.queue = queue
  }

  public func execute(delayInSecond delayInSecond: Double = 0, block: ()->Void) {
    if delayInSecond > 0 {
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSecond * Double(NSEC_PER_SEC))), queue, block)
    } else {
      dispatch_async(queue, block)
    }
  }
}
