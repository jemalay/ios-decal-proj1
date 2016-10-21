//
//  ToDoListTableViewController.h
//  proj1
//
//  Created by Jemal Aytjanova on 10/20/16.
//  Copyright © 2016 Jemal Aytjanova. All rights reserved.
//

#ifndef ToDoListTableViewController_h
#define ToDoListTableViewController_h

@interface ToDoListTableViewController (Workaround)

//-(IBAction)unwindToList: (UIStoryboardSegue *)segue;
-(IBAction) selectWeaponWasPressed: (UIButton *) sender{
    UIViewController *mainMenu = self.navigationController.viewControllers[0];
    [self.navigationController popToViewController:mainMenu
                                          animated:YES];
    
}
@end

#endif /* ToDoListTableViewController_h */
