import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.addTarget(self, action: #selector(changeText), for: .editingChanged)

        // Do any additional setup after loading the view.
    }

    @objc func changeText(){
        let parent = self.parent as! InputViewController
        parent.changeName(nm: nameTextField.text!)
        parent.name = nameTextField.text!
    }
}
