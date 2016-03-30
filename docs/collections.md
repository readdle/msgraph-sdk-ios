# Collections in the Microsoft Graph SDK for iOS

## Getting a collection

To retrieve a collection, like a folder's children, you call `getWithCompletion`:

```objc
[[[[[[graphClient me] drive] items:<item_id>] children] request] getWithCompletion:
    ^(MSGraphDriveItemCollection *children, MSGraphDriveItemChildrenCollectionRequest *nextRequest, NSError *error){
        // Returns a MSGraphDriveItemCollection, 
        // another children request if there are more children to get, 
        // or an error if one occurred.
}];
```

All subclasses of `MSCollection` have the following: 

|Name|Description|
|----|-----------|
|**value**|An `NSArray` of dictionaries, strings or other JSON serializable types representing the objects contained in the collection |
|**nextLink**| An `NSURL` used to get to the next page of items, if another page exists.|
|**additionData**| An `NSDictionary` to any additional values returned by the service. In this case, none.|
|**objectAtIndex:(NSUInteger)index**| Returns a strongly typed object created from value[index], e.g. `MSGraphDriveItem`
|**count**| Number of objects contained in the collection

The completion handler also supplies a request object called `nextRequest` of the same type as the original request.  If there is another page of items this object can be used to make the next page request on the collection. If there are no pages left this object will be nil.

## Adding to a collection

Some collections, like the children of a folder, can be changed. To add a folder to the children of an item you can call the `addItem` method:

```objc
MSGraphDriveItem *newFolder = [[MSGraphDriveIem alloc] init];
newFolder.name = <new_folder_name>;
newFolder.folder = [[MSGraphFolder alloc] init];
[[[[[[[graphClient] me] drive] items:<item_id>] children] request] addItem:newFolder withCompletion:^(MSGraphDriveItem *item, NSError *error){
    //returns the new item or an error if there was one.
}];
```

## Expanding a collection

To expand a collection, you call expand on the `CollectionRequest` object with the string you want to expand:

```objc
MSGraphDriveItemChildrenCollectionRequest *request = [[[[[[[odClient] me] drive] items:<item_id>] children] request] expand:@"<property to expand>"];

[request getWithCompletion:^(MSGraphDriveItemCollection *children, MSGraphDriveItemChildrenCollectionRequest *nextRequest, NSError *error){
    // children will have a collection of MSGraphDriveItems, that will have the relevant property populated
}];
```
