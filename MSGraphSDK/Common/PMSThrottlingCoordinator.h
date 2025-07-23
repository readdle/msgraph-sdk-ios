#import <Foundation/Foundation.h>

@protocol PMSThrottlingCoordinator <NSObject>

/// Performs `requestBlock` as soon as the current per-tenant throttling state allows.
/// - warning: The `requestBlock` is performed on an internal throttling queue. The block along with its captured resources is retained until the throttling
/// ends.
- (void)performThrottled:(void (NS_SWIFT_SENDABLE ^)(void))requestBlock;

/// Parses `Retry-After` HTTP header from the `response` and updates per-tenant throttling state accordingly.
/// - note: Only HTTP requests with status codes 429 and 503 are processed.
- (void)updateThrottlingFromResponse:(NSURLResponse *)response;

@end
