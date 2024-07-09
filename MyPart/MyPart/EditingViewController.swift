import UIKit

class EditingViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textFieldView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    let characterLimit = 49
    
    
    @IBOutlet weak var titleFieldView: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func doneEditButton(_ sender: Any) {
        let trimmedText = textFieldView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let trimmedTitle = titleFieldView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if !trimmedText.isEmpty && !trimmedTitle.isEmpty {
            data[curIndex] = titleFieldView.text
            texts[curIndex] = textFieldView.text
            navigationController?.popViewController(animated: true)
        }
        else{
            alerting()
        }
    }
    func alerting(){
            let alert = UIAlertController(title: "Ошибка изменения", message: "Поля не могут быть пустыми", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFieldView.text = texts[curIndex]
        titleFieldView.text = data[curIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldView.delegate = self
    }
}
