/*
 //  $Id: m3SysLib.m 127 2013-02-04 20:14:34Z kay $
 //
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

#import "iPodHandlerPlugin.h"
#import <MediaPlayer/MediaPlayer.h>

extern "C" {
    
    bool IsIPodMusicPlaying () {
        BOOL isPlaying = NO;
        MPMusicPlayerController* iPodMusicPlayer = [MPMusicPlayerController iPodMusicPlayer];
        if (iPodMusicPlayer.playbackState == MPMusicPlaybackStatePlaying) {
            isPlaying = YES;
        }
//        NSLog(@"Music is %@.", isPlaying ? @"on" : @"off");
        return isPlaying;
    }
}