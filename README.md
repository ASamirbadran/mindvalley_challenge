# mindvalley_challenge
Mindvalley IOS task for creating a library for Loading Images and JSON.

The MindDownloader Library is Added As A Framework inside this sample Project which include a list of image like Pinterest  as a Demo.
This Demo is Made with VIPER Architecture and all image Loading , api call is Made With MindDownloader Library.


## Usage
For Downloading Image:
```swift
import MindDownloader
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

## TODO
 1- Adding feature for handling loading the same image at the same time from diffrent application part by requesting it one time only.
 
 2- 
 
