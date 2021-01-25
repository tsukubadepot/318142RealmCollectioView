import UIKit
import RealmSwift

class InputViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var nameText: UILabel!

    var name = ""
    var imagePhoto: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func tapAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            //編集を可能にする
            pickerView.allowsEditing = true
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[UIImagePickerController.InfoKey.originalImage] != nil {
            // 選択した写真を取得する
            let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            // ビューに表示する
            imageView.image = image
            imagePhoto = image
            // 写真を選ぶビューを引っ込める
            self.dismiss(animated: true)
        }
    }

    //登録ボタン
    @IBAction func okayBtnAction(_ sender: Any) {
        //データの更新
        let realm = try! Realm()
        let newData = Teammate()
        try! realm.write {
            newData.name = "test" + String(Int.random(in: 1...10))
            newData.photo = imagePhoto.jpegData(compressionQuality: 0.5)! as Data
            realm.add(newData)
            print(newData.name)
            print(newData.photo)
        }
        self.dismiss(animated: true, completion: nil)
    }

    @objc func changeName(nm: String){
        nameText.text = nm
    }
}
