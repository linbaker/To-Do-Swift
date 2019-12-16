import UIKit

class TodoListTableViewController: UITableViewController {
    var todoItems:NSMutableArray!
    
    func loadinitData()
    {
       
        for i in 1...15
        {
            var todoItem=TodoItem()
            todoItem.itemName="Test Case"
            todoItem.completed=false
            todoItems.addObject(todoItem)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoItems=NSMutableArray()
        loadinitData()

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoListCell", forIndexPath: indexPath) as UITableViewCell

 
        var todoItem=self.todoItems.objectAtIndex(indexPath.row) as TodoItem
        cell.textLabel?.text=todoItem.itemName
        if(todoItem.completed==true){
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType=UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var todoItem=self.todoItems.objectAtIndex(indexPath.row) as TodoItem
        if( todoItem.completed==true){
            todoItem.completed=false}
        else{
            todoItem.completed=true}
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        var source=segue.sourceViewController as AddTodoItemViewController
        var item=source.todoItem
        if(item != nil)
        {
            self.todoItems.addObject(item)
            self.tableView.reloadData()
        }
    }

}