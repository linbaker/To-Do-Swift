import UIKit

class AddTodoItemViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var todoItem:TodoItem!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if((sender as UIBarButtonItem!) != self.doneButton){
            return
    }
        if(self.textfield.text != nil){
            self.todoItem=TodoItem()
            self.todoItem.itemName=self.textfield.text
            self.todoItem.completed=false
        }
    
    }
}