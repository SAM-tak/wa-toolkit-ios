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

#import "FetchContainersDirectTests.h"
#import "WAToolkit.h"

@implementation FetchContainersDirectTests

#ifdef INTEGRATION_DIRECT

- (void)setUp
{
    [super setUp];
    
    [directClient addBlobContainerNamed:randomContainerNameString withCompletionHandler:^(NSError *error) {
        STAssertNil(error, @"Error returned from addBlobContainer: %@",[error localizedDescription]);
        [directDelegate markAsComplete];
    }];
    [directDelegate waitForResponse];
}

- (void)tearDown
{
    [directClient deleteBlobContainerNamed:randomContainerNameString withCompletionHandler:^(NSError *error) {
        STAssertNil(error, @"Error returned from deleteBlobContainer: %@",[error localizedDescription]);
        [directDelegate markAsComplete];
    }];
    [directDelegate waitForResponse];
    
    [super tearDown];
}

- (void)testShouldFetchContainersWithContinuationUsingCompletionHandler
{
    [directClient fetchBlobContainersWithContinuation:nil maxResult:100 usingCompletionHandler:^(NSArray* containers, WAResultContinuation *resultContinuation, NSError* error) 
     {
         STAssertNil(error, @"Error returned by fetchBlobContainersSegmented: %@", [error localizedDescription]);
         STAssertNotNil(containers, @"fetchBlobContainersSegmented returned nil");
         STAssertTrue(containers.count <= 100, @"fetchBlobContainersSegmented returned more than maxresults");
         [directDelegate markAsComplete];
     }];
	
	[directDelegate waitForResponse];	
}

- (void)testShouldFetchBlobContainersWithCompletionHandler
{   
    [directClient fetchBlobContainersWithCompletionHandler:^(NSArray *containers, NSError *error) {
        STAssertNil(error, @"Error returned from fetchBlobContainersWithCompletionHandler: %@",[error localizedDescription]);
        STAssertTrue([containers count] > 0, @"No containers were found under this account");  // assuming that this is an account with at least one container
        [directDelegate markAsComplete];
    }];
    
    [directDelegate waitForResponse];
}

#endif

@end
