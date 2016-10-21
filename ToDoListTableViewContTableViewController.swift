//
//  ToDoListTableViewContTableViewController.swift
//  proj1
//
//  Created by Jemal Aytjanova on 10/20/16.
//  Copyright © 2016 Jemal Aytjanova. All rights reserved.
//

import UIKit

@objc(ToDoListTableViewController)class ToDoListTableViewController: UITableViewController{
    var toDoItems: NSMutableArray = []
    var finished: [Bool] = [true,true,true]
    var time: [Double] = [0, 0, 0]
    func loadInitialData(){
        
        let item1 = ToDoItem(name: "Buy milk")
        self.toDoItems.add(item1)
        
        let item2 = ToDoItem(name: "Buy eggs")
        self.toDoItems.add(item2)
        
        let item3 = ToDoItem(name: "Read a book")
        self.toDoItems.add(item3)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        oneDay()
    }
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        if segue.identifier == "statsIdentifier"{}
        else{
        
        
            let source: AddToDoViewController = segue.source as! AddToDoViewController
        
            let item: ToDoItem? = source.toDoItem
        
            if item != nil {
                print("jemaaaal")
                self.toDoItems.add(item!)
                finished.append(false)
                time.append(NSDate().timeIntervalSince1970)
                self.tableView.reloadData()
        }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        loadInitialData()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoItems.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPrototypeCell", for: indexPath)
        
        
        
        let todoitem: ToDoItem = self.toDoItems.object(at: indexPath.row) as! ToDoItem
        
        cell.textLabel?.text = todoitem.name as String
        
        
        if todoitem.completed{
            
            cell.accessoryType = .checkmark
            
        }
            
        else{
            
            cell.accessoryType = .none
            
        }
        
        return cell
        // Configure the cell...

        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let tappedItem: ToDoItem = self.toDoItems.object(at: indexPath.row) as! ToDoItem
        
        tappedItem.completed = !tappedItem.completed
        finished[indexPath.row] = !finished[indexPath.row]
        tableView.reloadData()
    }
    


    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

//    
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
//        }
//    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if (editingStyle == .delete) {
            self.toDoItems.removeObject(at: indexPath.row)
            finished.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    func oneDay() {
        var i = toDoItems.count - 1
        while i >= 0 {
            let ms = NSDate().timeIntervalSince1970 - time[i]
            if finished[i] && ms > 24*60*100 {
                toDoItems.removeObject(at: i)
                finished.remove(at: i)
                time.remove(at: i)
            }
            i -= 1
        }
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsIdentifier"
        {
           if let destinationVC = segue.destination as? DailyStatsViewController {
                var count = 0
                for i in finished {
                    if i {
                        count += 1
                    }
                }
                destinationVC.numinDisplay = count
            }
        }
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
