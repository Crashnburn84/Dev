import UIKit

class CoolController: UIViewController
{
    override func loadView() {
        print("Loading...")
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        
        view = backgroundView
        
        let subview1 = CoolCell(frame: CGRect(x: 90, y: 200, width: 100, height: 40))
        let subview2 = CoolCell(frame: CGRect(x: 90, y: 120, width: 100, height: 40))
        backgroundView.addSubview(subview1)
        backgroundView.addSubview(subview2)
        
        subview1.text = "Have a nice day! 🌴"
        subview2.text = "Surfs Up, Dude! 🏄🏻"
        
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
        backgroundView.backgroundColor = UIColor.brown
    }
}
