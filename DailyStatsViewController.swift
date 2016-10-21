//
//  DailyStatsViewController.swift
//  proj1
//
//  Created by Jemal Aytjanova on 10/20/16.
//  Copyright © 2016 Jemal Aytjanova. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {

    
    @IBOutlet var num: UILabel!
    var numinDisplay : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        num.text = "\(numinDisplay)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
