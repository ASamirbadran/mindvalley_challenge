# Mindvalley IOS Challenge
Mindvalley IOS task for creating a library for Loading Images and JSON.

The MindDownloader Library is Added As A Framework inside this sample Project which include a list of image like Pinterest  as a Demo.
This Demo is Made with VIPER Architecture and all image Loading , api call is Made With MindDownloader Library.

## Requirements
 * iOS 10.0+
 * Xcode 11+
 * Swift 5.0+

## Usage
```swift
import MindDownloader
```
For Downloading Image:

```swift
self.imageView.loadImageFromUrl(url: link)
```
For Downloading Json:

1- Create your endPoint Service by extending EndPoint Protocol then Perform your request Using MindDownloader.

```swift
MindDownloader.shared.fetchData(endpoint: endPoint)
```
For Canceling Fetching:

```swift
MindDownloader.shared.cancelFetching(url: url)
```
For Setting CacheLimit

```swift
MindDownloader.shared.setCacheLimit(totalCostLimit: 10, countLimit: 10)
```

## TODO
 * Adding feature for handling loading the same image at the same time from diffrent application part by requesting it one time only.
 
 * Adding encoding paramters as the encode type and attach to the request as currently we support Json Encoding only.
 
* Supporting XML , PDF.
