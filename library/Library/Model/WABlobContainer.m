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

#import "WABlobContainer.h"

NSString * const WAContainerPropertyKeyEtag = @"Etag";
NSString * const WAContainerPropertyKeyLastModified = @"Last-Modified";

@implementation WABlobContainer

@synthesize name = _name;
@synthesize URL = _URL;
@synthesize metadata = _metadata;
@synthesize properties = _properties;

- (id)initContainerWithName:(NSString *)name 
{
    return [self initContainerWithName:name URL:nil metadata:nil];
}

- (id)initContainerWithName:(NSString *)name URL:(NSString *)URL
{
    return [self initContainerWithName:name URL:URL metadata:nil];
}

- (id)initContainerWithName:(NSString *)name URL:(NSString *)URL metadata:(NSString *)metadata 
{
	
    return [self initContainerWithName:name URL:URL metadata:metadata properties:nil];
}

- (id)initContainerWithName:(NSString *)name URL:(NSString *)URL metadata:(NSString *)metadata properties:(NSDictionary *)properties
{
    if ((self = [super init])) {
        _name = [name copy];
        _URL = [[NSURL URLWithString:URL] retain];
        _metadata = [metadata copy];
        _properties = [properties retain];
    }    
    return self;
}

- (void) dealloc 
{
    [_name release];
    [_URL release];
    [_metadata release];
    [_properties release];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"BlobContainer { name = %@, url = %@, metadata = %@, properties = %@ }", _name, _URL, _metadata, _properties.description];
}

@end
