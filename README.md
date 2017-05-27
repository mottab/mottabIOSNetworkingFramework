# InstaNetworking

This project is a demo project for Instabug, that implement a networking framework for executing HTTP requests in apps. This framework.

## Getting Started

To start using this framework, you can see how the example is working.

just do import ``` InstaNetworking ``` after adding the framework to your project.

Then go to ``` AppDelegate class``` and call this function ``` [InstaNetworking setupBackgroundNetworking]; ``` to ``` applicationDidFinishLaunchWithOptions ``` like the following:
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
[InstaNetworking setupBackgroundNetworking];
return YES;
}
```
to add requests to InstaNetworking Library for processing:

```
[_iNetwork fireRequest:[NSURL URLWithString:@"http://www.google.com"] parameters:nil andVerb:POST withCompletionBlock:^(NSDictionary *response, NSError *error) {
     }];
```

To make ImageRequest do call ``` setImageWithURL ``` to the imageView property:

```
[_imgV setImageWithURL:[NSURL URLWithString:@"http://www.epoojastore.in/image/cache/catalog/Products/Mats-New-Small--1000x1000.jpg"]];
```

Now go to ``` Info.plist ``` file and add the following: ``` Required background modes ``` array and add item ``` App downloads content from the network ```

Then add AppTransport to the info file ``` App Transport Security Settings ``` Dictionary and add child ``` Allow Arbitrary Loads ``` to Boolean ``` YES ```

Then go to build setting and set enable ``` bitcode  ``` to  ``` NO ```