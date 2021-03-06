//
//  EZip, Awesome File Compression
//  Copyright (c) 2014 Jack Maloney. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import <Foundation/Foundation.h>
#import "ez.h"
#import "EZTree.h"
#import "EZRandom.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        if (argc < 2) {
            printUsage();
            exit(1);
        }

        NSString* arg = [NSString stringWithUTF8String:argv[1]];

        if ([@"-h" isEqualToString:arg] || [@"--help" isEqualToString:arg]) {
            printHelp();
        } else if ([@"-v" isEqualToString:arg] || [@"--version" isEqualToString:arg]) {
            printVersion();
        } else if ([@"-l" isEqualToString:arg]) {
            showLicense();
        } else if ([@"-a" isEqualToString:arg]) {
            // Create Archive

            if (argc < 3) {
                printErr(@"-a Requires An Argument");
                exit(1);
            }

            [ez compressFile:[NSString stringWithUTF8String:argv[2]]];

        } else if ([@"-x" isEqualToString:arg]) {
            // Extract Archive

            if (argc < 3) {
                printErr(@"-x Requires An Argument");
                exit(1);
            }

            [ez decompressFile:[NSString stringWithUTF8String:argv[2]]];

        } else {
            printErr(@"Arguments Are Invalid");
        }
        
    }
    return 0;
}

