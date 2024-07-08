//
//  AppDelegate.m
//  A
//
//  Created by yangjw  on 13-9-12.
//  Copyright (c) 2013年 yangjw . All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "OneViewController.h"
#import "TwoViewController.h"

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
	[_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
	self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if ([[url host] isEqualToString:@"com.b.nav"]) {
        NSString *viewId = [[url query] substringFromIndex:[[url query] rangeOfString:@"viewId="].location + 7];
        if ([viewId isEqualToString:@"letters"])
		{
			OneViewController *one = [[OneViewController alloc] init];
			NSString *test = [url query];
			one.testLabel.text = test;
			[self.viewController presentViewController:one animated:YES completion:nil];
        }
		else
		{
			TwoViewController *two = [[TwoViewController alloc] init];
			[self.viewController presentViewController:two animated:YES completion:nil];
        }
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation API_DEPRECATED_WITH_REPLACEMENT("application:openURL:options:", ios(4.2, 9.0)) {
    
    return YES;
}


//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
//    return YES;
//}


- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
