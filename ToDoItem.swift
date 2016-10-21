//
//  ToDoItem.swift
//  proj1
//
//  Created by Jemal Aytjanova on 10/20/16.
//  Copyright © 2016 Jemal Aytjanova. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var name: NSString = ""
    var completed: Bool = false
    var date: NSDate = NSDate()
    
    init(name:String){
        self.name = name as NSString
    
    }
    

}
