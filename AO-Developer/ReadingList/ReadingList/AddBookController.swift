import UIKit

class AddBookController: UITableViewController
{
    var done: ((Book) -> Void)?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    var book: Book {
        return Book(dictionary: [Book.Keys.title: titleField.text ?? "",
                                 Book.Keys.year: yearField.text ?? "",
                                 Book.Keys.author: [Author.Keys.firstName: firstNameField.text ?? "",
                                                    Author.Keys.lastName: lastNameField.text ?? ""]])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Done" {
           done?(book)
        }
    }
}
