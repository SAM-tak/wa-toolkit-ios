/*
 Copyright 2010 Microsoft Corp
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "WAQueue.h"
#import "WAQueueMessage.h"
#import "WABlob.h"
#import "WABlobContainer.h"
#import "WATableEntity.h"
#import "WAResultContinuation.h"

#import "WACloudStorageClient.h"
#import "WACloudStorageClientDelegate.h"
#import "WATableFetchRequest.h"
#import "WABlobFetchRequest.h"
#import "WABlobContainerFetchRequest.h"
#import "WAQueueFetchRequest.h"
#import "WAQueueMessageFetchRequest.h"

#import "WAAuthenticationCredential.h"
#import "WACloudAccessControlClient.h"
#import "WACloudAccessToken.h"

extern NSInteger WAEmuPort;
extern NSString *WAEmuHost;

@interface NSData (WASimpleBase64)
- (NSString *)stringWithBase64EncodedData;
@end

@interface NSString (WASimpleBase64)
- (NSData *)dataWithBase64DecodedString;
@end

@interface NSString (URLEncode)
- (NSString *)URLEncode;
- (NSString *)URLDecode;
@end
