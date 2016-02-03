IBM MobileFirst Platform Foundation iOS SDK
===

This package contains the required native components for your application to interact with IBM
MobileFirst Platform Foundation or IBM MobileFirst Platform Foundation for iOS. IBM MobileFirst Platform Foundation and IBM MobileFirst Platform Foundation for iOS provide an on-premises backend server and infrastructure
for managing MobileFirst applications. The SDK manages all of the communication and security integration between your iOS mobile app and IBM MobileFirst Platform Foundation or IBM MobileFirst Platform Foundation for iOS servers.


###Installing and using the SDK
Install the SDK with [CocoaPods](http://cocoapods.org/).  To install CocoaPods, see [CocoaPods Getting Started](http://guides.cocoapods.org/using/getting-started.html#getting-started). 
The SDK is downloaded when you run the pod install command, after you specify the SDK source path in your podfile.
For more information, see:
- (MobileFirst Platform Foundation) [Developing a new iOS native application with CocoaPods ](http://www.ibm.com/support/knowledgecenter/SSHS8R_8.0.0/com.ibm.worklight.dev.doc/dev/t_dev_new_w_cocoapods.html

- (MobileFirst Platform Foundation for iOS) [Developing a new iOS native application with CocoaPods ](http://www.ibm.com/support/knowledgecenter/SSHSCD_8.0.0/com.ibm.worklight.dev.doc/dev/t_dev_new_w_cocoapods.html


###SDK contents
The IBM MobileFirst Platform Foundation iOS SDK consists of a collection of pods, available through CocoaPods, that you can add to your project.
The pods correspond to core and optional functions that are exposed by IBM MobileFirst Platform Foundation or 
IBM MobileFirst Platform Foundation for iOS.  The SDK contains the following pods:

- **IBMMobileFirstPlatformFoundation**: Provides core functionality. It implements client-server connections, handles security, accesses server resources and handles their responses. Includes iOS and watchOS2 support.
- **IBMMobileFirstPlatformFoundationJSONStore**: Enables the JSONStore feature for iOS native MobileFirst apps. It contains JSONStore native APIs.
- **IBMMobileFirstPlatformFoundationPush: Provides support for push notifications from the server.
- **IBMMobileFirstPlatformFoundationConfigurationService: Provides support for remote changes to the server configuration.
- **IBMMobileFirstPlatformFoundationOpenSSLUtils: Provides support for encryption and decryption using OpenSSL.

Each pod handles one or more pods. All of the pods depend on, include and load the IBMMobileFirstPlatformFoundation pod. 


###Supported iOS levels
- iOS 7
- iOS 8
- iOS 9

###Getting started 

Get started with the following tutorials: 

- [Quick Start demonstration](https://developer.ibm.com/mobilefirstplatform/documentation/getting-started-7-1/foundation/native-ios/quick-start-demonstration/)

- [Configuring a native iOS application with the MobileFirst Platform Foundation iOS SDK](https://developer.ibm.com/mobilefirstplatform/documentation/getting-started-7-1/foundation/hello-world/configuring-a-native-ios-with-the-mfp-sdk/)


###Learning More
   * Visit the [MobileFirst Developers Center](https://developer.ibm.com/mobilefirstplatform/).
   * Visit [IBM MobileFirst Platform Foundation, version 8.0.0 in IBM Knowledge Center](http://www.ibm.com/support/knowledgecenter/SSHS8R_8.0.0/wl_welcome.html).
   * Visit the [IBM MobileFirst Platform Foundation for iOS, version 8.0.0 in IBM Knowledge Center](http://www.ibm.com/support/knowledgecenter/SSHSCD_8.0.0/wl_welcome.html).

###Connect with IBM MobileFirst
[Web](http://www.ibm.com/mobilefirst) |
[Twitter](http://twitter.com/ibmmobile/) |
[Blog](http://asmarterplanet.com/mobile-enterprise) |
[Facebook](http://www.facebook.com/ibmMobile/) |
[Linkedin](http://www.linkedin.com/groups/IBM-Mobile-4579117/about)


Copyright 2016 IBM Corp.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

[Terms of Use](web link to License.txt)
