# WKWebView-With-RefreshControl

=========

## Using a RefreshControl to Reload a WKWebView in Swift 5.

### When you use the WKWebView control to render a web page in your iOS application, it doesn’t come with the usual browser controls that users may expect. It renders the webpage without a toolbar or functions like Back, Forward, or Reload. I’m going to show you how to use the iOS  UIRefreshControl to reload a web page rendered in a WKWebView. 

------------
Added Some screens here.

![](https://github.com/pawankv89/WKWebView-With-RefreshControl/blob/master/images/screen_1.png)



## Usage
------------

Integration Steps

```swift

override func viewDidLoad() {
super.viewDidLoad()

// Do any additional setup after loading the view, typically from a nib.

webView = WKWebView(frame: webViewContainer.bounds) // size will be determined by auto-layout
if let webView = webView {
webView.translatesAutoresizingMaskIntoConstraints = false
webViewContainer.addSubview(webView)
let bindings: [String: AnyObject] = ["webView": webView]
webViewContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|",
options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: bindings))
webViewContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|",
options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: bindings))

let url = URL(string:"https://www.apple.com")
let request = URLRequest(url:url!)
webView.load(request)

let refreshControl = UIRefreshControl()
refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
webView.scrollView.addSubview(refreshControl)
webView.scrollView.bounces = true
}
}

```

There is a sample function in ViewController that you can simply call. 

```swift

@objc
func refreshWebView(_ sender: UIRefreshControl) {
webView?.reload()
sender.endRefreshing()
}


```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
