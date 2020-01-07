# mindvalley_challenge
Mindvalley IOS task for creating a library for Loading Images and JSON.

The MindDownloader Library is Added As A Framework inside this simple Project which include a list of image like Pinterest  as a Demo.
This Demo is Made with VIPER Architecture and all image Loading , api call is Made With MindDownloader Library.


## Usage
For Downloading Image:
```swift
import MindDownloader
self.imageView.loadImageFromUrl(url: link)
```
For Downloading Json:

1- Create your endPoint Service by extending EndPoint Protocol 
2- Perform your request Using MindDownloader

```swift

```
For Canceling Fetching:

```swift
Downloader.shared.cancelFetching(url: url)

