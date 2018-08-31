import UIKit

class CoolView: UIView
{
    @IBOutlet var textField: UITextField!
    @IBOutlet var  contentView: UIView!
    
    @IBAction func addCoolCell(button: UIButton) {
        print("In \(#function), text is \(textField.text ?? "nil")")
        let newCoolCell = CoolCell(frame: CGRect.zero)
        newCoolCell.text = textField.text
        newCoolCell.sizeToFit()
        contentView.addSubview(newCoolCell)
    }
}

extension CoolView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
