import UIKit


class SViewController: UIViewController, UITextViewDelegate{
    
    var characterLimit = 49
    
    
    @IBOutlet weak var titleFieldView: UITextView!
    @IBOutlet weak var textFieldView: UITextView!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func doneButton(_ sender: Any) {
        let trimmedText = textFieldView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let trimmedTitle = titleFieldView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if !trimmedText.isEmpty && !trimmedTitle.isEmpty {
            data.append(titleFieldView.text)
            texts.append(textFieldView.text)
            navigationController?.popViewController(animated: true)
        } else {
            alerting()
        }
    }
    
    func alerting(){
            let alert = UIAlertController(title: "Ошибка создания", message: "Поля не могут быть пустыми", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        textFieldView.text = ""
        titleFieldView.text = ""
        super.viewDidLoad()
        
    }
}
