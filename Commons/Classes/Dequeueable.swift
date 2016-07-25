
import Foundation

public protocol DequeueableCollectionCell: class {
}

public extension DequeueableCollectionCell {

  public static func dequeueFromCollectionView(collectionView: UICollectionView, forIndexPath indexPath: NSIndexPath) -> Self {
    return collectionView.dequeueReusableCellWithReuseIdentifier(nameOfClass(Self), forIndexPath: indexPath) as! Self
  }
}

public protocol DequeueableCollectionReusableView: class {
}

extension UICollectionViewCell: DequeueableCollectionCell {
}

public extension DequeueableCollectionReusableView {

  public static func dequeueReusableSupplementaryViewOfKind(elementKind: String, fromCollectionView collectionView: UICollectionView, forIndexPath indexPath: NSIndexPath) -> Self {
    return collectionView.dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: nameOfClass(Self), forIndexPath: indexPath) as! Self
  }
}

extension UICollectionReusableView: DequeueableCollectionReusableView {
}

public protocol DequeueableTableCell: class {
}

public extension DequeueableTableCell {

  public static func dequeueFromTableView(tableView: UITableView, forIndexPath indexPath: NSIndexPath) -> Self {
    return tableView.dequeueReusableCellWithIdentifier(nameOfClass(Self), forIndexPath: indexPath) as! Self
  }
}

extension UITableViewCell: DequeueableTableCell {
}
