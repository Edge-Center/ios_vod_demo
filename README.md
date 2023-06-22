# Fully working video app for iOS: Video player, Smooth scrolling, Upload

## Screenshots
<img src="/gif/iOS_Vod_demo_github_welcome_screen.png"/>
<img src ="/gif/iOS_Vod_demo_github_viewing_screen.png"/>
<img src ="/gif/iOS_Vod_demo_github_scrolling_screen.png"/>
<img src ="/gif/iOS_Vod_demo_github_upload_screen.png"/>

## Introduction
Setup VOD viewing in 15 minutes in your iOS project instead of 7 days of work and setting network, smooth scrolling, upload parameters etc. This demo project is a quick tutorial how to view video from your own mobile app to an audience of 1 000 000+ views like Instagram, Youtube, etc.

## Feature
1) HLS playback,
2) Upload new video via TUSKit,
3) authorization on EdgeCenter services,
4) Support for smooth scrolling.
 
## Quick start 
  1) Launching the application via xcode (it must be run on a real device, since the simulator does not support the camera),
  2) Authorization via email and password of the personal account in EdgeCenter,
  3) On the viewing screen, you can start viewing VOD with smooth scrolling,
  4) On the upload screen, you can start record and push video on the EdgeCenter.

## Setup of project
Clone this project and try it or create a new one.

1) Library <br />
    a) [TUSKit](https://github.com/tus/TUSKit) - To perform asynchronous video upload to the server, we recommend using  version 2.2.1   
This version makes it easy to use metadata to send files. You can easily add via SPM specifying git libraries with the version.
    b) [Texture](https://github.com/TextureGroup/Texture) - To perform asynchronous UI, and smooth scrolling via table node realization.
  
2) Permissions <br />
  To use the camera and microphone, you need to request the user's permission for this. To do this, add to the plist (Info) of the project:
  **Privacy - Camera Usage Description** and **Privacy - Microphone Usage Description**. <br />

    Also, to record sound in the background, you need to add a **background mode** - **"Audio, AirPlay and Picture in Picture"**

3) EdgeCenter API
  To interact with the server, the **HTTPCommunicator** structure is used, through the API:
  ```swift
enum EdgeCenterAPI: String {
    case authorization = "https://api.edgecenter.ru/iam/auth/jwt/login"
    case videos = "https://api.edgecenter.ru/streaming/videos"
    case refreshToken = "https://api.edgecenter.ru/iam/auth/jwt/refresh"
}
  ```
  Which create the necessary request through the **HTTPCommunicator** struct.
  For more check EdgeCenter API [documentation](https://apidocs.edgecenter.ru/streaming).
  
## Requirements
  1) iOS min - 12.1,
  2) Real device (not simulator),
  3) The presence of an Internet connection on the device,
  4) The presence of a camera and microphone on the device.
  
## License
MIT License

Copyright (c) 2023 Edge-Center

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


