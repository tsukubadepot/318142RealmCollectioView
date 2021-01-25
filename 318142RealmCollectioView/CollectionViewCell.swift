import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellImage: UIImageView!

    func setup(name: String, icon: UIImage){
        cellName.text = name
        cellImage.image = icon
    }
}
