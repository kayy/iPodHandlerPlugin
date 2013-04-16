/*
 //  Created by Kay Bothfeld on Feb 14, 2013.
 //  Inspired by http://answers.unity3d.com/questions/12777/detecting-ipod-music-playback.html#answer-23043
 //  posted by user "Dimitris 1".
 //
 //  MIT license, see http://www.opensource.org/licenses/mit-license.php
 //
 //  Permission is hereby granted, free of charge, to any person obtaining a copy
 //  of this software and associated documentation files (the "Software"), to deal
 //  in the Software without restriction, including without limitation the rights
 //  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 //  copies of the Software, and to permit persons to whom the Software is
 //  furnished to do so, subject to the following conditions:
 //
 //  The above copyright notice and this permission notice shall be included in
 //  all copies or substantial portions of the Software.
 //
 //  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 //  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 //  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 //  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 //  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 //  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 //  THE SOFTWARE.
 */

#import <MediaPlayer/MediaPlayer.h>
#import "UnityIPodCallbackListener.h"

#ifdef __cplusplus
extern "C" {
#endif
	void UnitySendMessage(const char* obj, const char* method, const char* msg);
#ifdef __cplusplus
}
#endif

@implementation UnityIPodCallbackListener

@synthesize gameObject;
@synthesize method;

- (void) sendMessage:(NSString*)message {
	UnitySendMessage([gameObject UTF8String], [method UTF8String], [message UTF8String]);
}

- (void) registerForMediaPlayerNotifications {
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];	
	[notificationCenter addObserver: self
						   selector: @selector (handle_PlaybackStateChanged:)
							   name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
							 object: musicPlayer];
    
	[musicPlayer beginGeneratingPlaybackNotifications];
}

/*!
    @method     handle_PlaybackStateChanged
    @abstract   Called by NotificationCenter iPod player status changes. A message to Unity is sent containing the new
                status as short description built from suffix e.g. MPMusicPlaybackStatePlaying -> "Playing"
	@param		notification not used.
*/
- (void) handle_PlaybackStateChanged: (id) notification {
    
	MPMusicPlaybackState playbackState = [musicPlayer playbackState];
	switch (playbackState) {
        case MPMusicPlaybackStatePlaying:
            [self sendMessage:@"Playing"];
            break;
        case MPMusicPlaybackStatePaused:
            [self sendMessage:@"Paused"];
            break;
        case MPMusicPlaybackStateStopped:
            [self sendMessage:@"Stopped"];
            break;
        case MPMusicPlaybackStateInterrupted:
            [self sendMessage:@"Interrupted"];
            break;
        case MPMusicPlaybackStateSeekingBackward:
        case MPMusicPlaybackStateSeekingForward:
            // Not interesting
            break;
        default:
            break;
	}
}



- (id) initAll:(const char*)gameObjectParam method:(const char*)methodParam {
	if ((self = [super init])) {
		self.gameObject	= [NSString stringWithUTF8String:gameObjectParam];
		self.method = [NSString stringWithUTF8String:methodParam];
        musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
        [self registerForMediaPlayerNotifications];
        NSLog(@"Callback created ");
		return self;
	} else {
		NSLog(@"Error: Unable to initialize!");
		return nil;
	}
}

- (void) dealloc {
	self.gameObject = nil;
	self.method = nil;
}
@end
