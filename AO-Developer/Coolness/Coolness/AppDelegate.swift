import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.yellow
        window?.rootViewController = UIViewController()
        loadView() // TODO: Delete Me! Usually Never Call "loadView()"
        window?.makeKeyAndVisible()
    }
    // FIXME: Move to view controller
    func loadView(){
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        window?.addSubview(backgroundView)
        
        let subview1 = UIView(frame: CGRect(x: 20, y: 60, width: 100, height: 40))
        let subview2 = UIView(frame: CGRect(x: 50, y: 120, width: 100, height: 40))
        
        backgroundView.addSubview(subview1)
        backgroundView.addSubview(subview2)
        
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
        backgroundView.backgroundColor = UIColor.brown
    }
}

