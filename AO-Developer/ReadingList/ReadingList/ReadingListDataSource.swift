import UIKit

class ReadingListDataSource: NSObject
{
    let store = ReadingListStore("BooksAndAuthors")
    lazy var readingList = store.fetchedReadingList
    
    func book(at indexPath: IndexPath) -> Book {
        return readingList.books[indexPath.row]
    }
    
    func insert(book: Book, at indexPath: IndexPath) {
        readingList.books.insert(book, at: indexPath.row)
    }
    
    func save() {
        store.save(readingList: readingList)
    }
}


// MARK: - UITableViewDataSource methods
extension ReadingListDataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let book = readingList.books[sourceIndexPath.row]
        readingList.books.remove(at: sourceIndexPath.row)
        readingList.books.insert(book, at: destinationIndexPath.row)
        save()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        readingList.books.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        save()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book Summary") else {
            fatalError("Set the cell's identifier in the storyboard")
        }
        populate(cell: cell, at: indexPath)
        return cell
    }
    
    func populate(cell: UITableViewCell, at indexPath: IndexPath) {
        let book = readingList.books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? "Unknown")  \(book.author?.fullName ?? "Unknown")"
    }
}
