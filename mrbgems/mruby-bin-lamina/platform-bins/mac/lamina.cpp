#include "mruby_lamina.h"
#include <stdio.h>
#import "include/cef_application_mac.h"
#import <Cocoa/Cocoa.h>

extern int global_argc;
extern char** global_argv;

// Provide the CefAppProtocol implementation required by CEF.
@interface LaminaApplication : NSApplication<CefAppProtocol> {
@private
  BOOL handlingSendEvent_;
}
@end

@implementation LaminaApplication
- (BOOL)isHandlingSendEvent {
  return handlingSendEvent_;
}

- (void)setHandlingSendEvent:(BOOL)handlingSendEvent {
  handlingSendEvent_ = handlingSendEvent;
}

- (void)sendEvent:(NSEvent*)event {
  CefScopedSendingEvent sendingEventScoper;
  [super sendEvent:event];
}

// - (void)terminate:(id)sender {
//   ClientAppDelegate* delegate =
//       static_cast<ClientAppDelegate*>([NSApp delegate]);
//   [delegate tryToTerminateApplication:self];
//   // Return, don't exit. The application is responsible for exiting on its own.
// }
@end

@interface LaminaAppDelegate : NSObject<NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end

@implementation LaminaAppDelegate

@synthesize window;

-(void)dealloc
{
    [super dealloc];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed: (NSApplication *)sender
{
    return YES;
}

-(void)applicationDidFinishLaunching: (NSNotification *)aNotification
{
  printf("Finished launching\n");
  lamina_main();
}

@end

int main(int argc, char *argv[])
{
  printf("In main\n");
  global_argc = argc;
  global_argv = argv;
  // return NSApplicationMain(argc, (const char **) argv);
  @autoreleasepool {
    NSApplication * application = [LaminaApplication sharedApplication];
    LaminaAppDelegate* appDelegate = [[LaminaAppDelegate alloc] init];

    [application setDelegate:appDelegate];
    [application run];
  }

  return EXIT_SUCCESS;
}
