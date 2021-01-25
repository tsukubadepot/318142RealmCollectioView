import Foundation
import RealmSwift

class Teammate: Object {
    // ID
    @objc dynamic var id = 0
    // 名前
    @objc dynamic var name = ""
    // 写真
    @objc dynamic var photo = Data()
}
