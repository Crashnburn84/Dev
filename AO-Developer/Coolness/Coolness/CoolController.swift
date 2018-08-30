import UIKit

class CoolController: UIViewController
{
    var textField: UITextField!
    var  contentView: UIView!
    
    @objc func addCoolCell(button: UIButton) {
        print("In \(#function), text is \(textField.text ?? "nil")")
        let newCoolCell = CoolCell(frame: CGRect.zero)
        newCoolCell.text = textField.text
        newCoolCell.sizeToFit()
        contentView.addSubview(newCoolCell)
    }
    
    override func loadView() {
        print("Loading...")
        
        let boundsRect = UIScreen.main.bounds
        let backgroundView = UIView(frame: boundsRect)
        view = backgroundView
        
        let (accessoryRect, contentRect) = boundsRect.divided(atDistance: 80, from: .minYEdge)
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = UIView(frame: contentRect)
        
        self.contentView = contentView
        contentView.clipsToBounds = true
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        // Controls
        
        let textField = UITextField(frame: CGRect(x: 8, y: 42, width: 240, height: 30))
        accessoryView.addSubview(textField)
        self.textField = textField
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter some text"
        
        textField.delegate = self
        
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 260, dy: 40)
        button.addTarget(self, action: #selector(addCoolCell(button:)), for: .touchUpInside)
        
        accessoryView.addSubview(button)
        
        // Cells
        
        let subview1 = CoolCell(frame: CGRect(x: 90, y: 30, width: 100, height: 40))
        let subview2 = CoolCell(frame: CGRect(x: 90, y: 90, width: 100, height: 40))
        contentView.addSubview(subview1)
        contentView.addSubview(subview2)
        
        subview1.text = "Have a nice day! 🌴"
        subview2.text = "Surfs Up, Dude! 🏄🏻"
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
        backgroundView.backgroundColor = UIColor.gray
    }
}

extension CoolController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
