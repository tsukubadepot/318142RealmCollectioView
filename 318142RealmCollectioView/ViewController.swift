import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    //Realmインスタンスを取得
    let realm = try! Realm()

    //Teammateが格納されているリスト
    var teammate = try! Realm().objects(Teammate.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self

        for human in teammate {
            print("name: \(human.name)")
        }

        // レイアウトを調整
        let layout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout
    }

    //セル表示数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 表示するセルの数
        return teammate.count
    }

    //各セルの内容を返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let person = teammate[indexPath.row]
        //写真のデータ型の変換
        var imageData: UIImage? = UIImage(data: person.photo as Data)
        if imageData == nil {
            imageData = UIImage(named: "sample")
        }
        //Cellにセット
        cell.setup(name: person.name, icon: imageData!)
        // セルの色
        //cell.backgroundColor = .lightGray
        return cell
    }

    //デザイン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }

    //入力画面から返ってきたときにCollectionViewを更新
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}
