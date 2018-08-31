import UIKit

class ReadingListController: UITableViewController
{
    // MARK: - Unwind segues
    
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        // TODO: Sync UI and save
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) { }
}


// MARK: - UITableViewDataSource methods
extension ReadingListController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100 // FIXME: needs no explanation
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book Summary") else {
            fatalError("Set the cell's identifier in the storyboard")
        }
        
//        if let cachedCell = tableView.dequeueReusableCell(withIdentifier: "Foo Bar") {
//            cell = cachedCell
//        } else {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Foo Bar")
//            cell.textLabel?.text = "Row \(indexPath.row + 1)"
//        }
        
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        
        return cell
    }
}
