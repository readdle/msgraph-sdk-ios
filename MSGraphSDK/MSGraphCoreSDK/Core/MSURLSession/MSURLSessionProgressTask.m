// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionProgressTask.h"

@interface MSURLSessionProgressTask ()

@property (nonatomic, assign) BOOL isProgressObserverAdded;

@end

@implementation MSURLSessionProgressTask

- (void)dealloc {
    [self removeProgressObserver];
}

- (NSProgress *)createProgress
{
    NSProgress *progress = [NSProgress progressWithTotalUnitCount:0];
    _progress = progress;
    [self updateProgressObserver];

    return progress;
}

- (void)setProgressHandler:(void (^)(float progress))progressHandler {
    _progressHandler = progressHandler;
    [self updateProgressObserver];
}

#pragma mark - Private

- (void)updateProgressObserver {
    const BOOL shouldAddObserver = self.progressHandler != nil && self.progress != nil;
    if (shouldAddObserver) {
        [self addProgressObserver];
    }
    else {
        [self removeProgressObserver];
    }
}

- (void)addProgressObserver {
    if (self.isProgressObserverAdded) {
        return;
    }
    [self.progress
     addObserver:self
     forKeyPath:@"fractionCompleted"
     options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
     context:nil];
    self.isProgressObserverAdded = YES;
}

- (void)removeProgressObserver {
    if (self.isProgressObserverAdded == NO) {
        return;
    }
    [self.progress 
     removeObserver:self
     forKeyPath:@"fractionCompleted"];
    self.isProgressObserverAdded = NO;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (object == self.progress) {
        if (self.progressHandler != nil) {
            self.progressHandler(self.progress.fractionCompleted);
        }
    }
}

@end
