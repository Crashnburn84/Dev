import UIKit

class ViewBookController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBAction func cancel(segue: UIStoryboardSegue) { }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = book?.title
        yearLabel.text = book?.year
        firstNameLabel.text = book?.author?.firstName
        lastNameLabel.text = book?.author?.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.realDestination as? EditBookController else { return }
        controller.book = book
    }
}

// TODO: Move to an Extensions.swift file
extension UIStoryboardSegue
{
    var realDestination: UIViewController? {
        guard let navController = destination as? UINavigationController else {
                return destination
        }
        return navController.childViewControllers.first
    }
}
