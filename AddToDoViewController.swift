//
//  AddToDoViewController.swift
//  proj1
//
//  Created by Jemal Aytjanova on 10/20/16.
//  Copyright © 2016 Jemal Aytjanova. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    var expiration = [NSDate?]()
    var toDoItem: ToDoItem?
    var mark = [Bool]()
    
    @IBOutlet var cancel: UIBarButtonItem!
   
    @IBOutlet var name: UITextField!
    @IBOutlet var done: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender as? NSObject != self.done{
            return
        }
        print("hdsdhsjd")
        if self.name.text != ""{
            print("hahah")
            self.toDoItem = ToDoItem(name: self.name.text!)
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)

    }
   
}
