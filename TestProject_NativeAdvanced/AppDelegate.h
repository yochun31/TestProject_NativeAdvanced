//
//  AppDelegate.h
//  TestProject_NativeAdvanced
//
//  Created by Charles on 2017/11/14.
//  Copyright © 2017年 cf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

