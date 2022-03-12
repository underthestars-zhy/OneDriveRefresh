# OneDriveRefresh

`OAuthSwift` did not support Linux. So if you wanna use `OAuthSwift` to refresh your onedrive token on linux, it is impossible.

But now, you have `OneDriveRefresh`. A cross-platforms package.

## How to use?

```swift
try await OneDriveRefresh("", clientId: "").refresh()
```
The first parameter is your old refresh token.
