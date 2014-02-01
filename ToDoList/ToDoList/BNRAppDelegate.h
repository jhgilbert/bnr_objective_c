//
//  BNRAppDelegate.h
//  ToDoList
//
//  Created by jgilbert on 2/1/14.
//

#import <UIKit/UIKit.h>

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end
