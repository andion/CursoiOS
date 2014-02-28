//
//  LAMAppDelegate.m
//  lectures_management
//
#import "LAMStundent.h"
#import "LAMAppDelegate.h"

@implementation LAMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
  NSLog(@"%@", [SQLiteAccess getName]);
  LAMStundent *stu = [SQLiteAccess getStundent:@"pablo@pabloformoso.com"];
  NSLog(@"%@", [stu fullName]);
#endif  

  LAMStundent *stundent1 = [[LAMStundent alloc] initWithName:@"Lucas"
                                                     surname:@"Andion Montáns"
                                                     andMail:@"me@email.com"];
  
  LAMStundent *stundent2 = [[LAMStundent alloc] initWithName:@"Joaquín"
                                                     surname:@"Tillizos"
                                                     andMail:@"me2@me.com"];

  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  
  NSArray *tmpArray = @[stundent1, stundent2];
  
  [userDefault setObject:[NSKeyedArchiver archivedDataWithRootObject:tmpArray] forKey:@"stundents"];
  
  return YES;
}

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
