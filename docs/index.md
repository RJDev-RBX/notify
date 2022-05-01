!!! important
    This documentation is still under construction!

`notify` by RJDev lets you send notifications to users from the server with a simple module that can be easily integrated anywhere!

Getting started is simple, all you have to do is require and initialise the `notify` module and then use the simple notification method in any of your server scripts!

## Quickstart
To start sending notifications, do the following in a server script:
```lua
local Notify = require(game:GetService("ReplicatedStorage").notify)
Notify:Init()

Notify:notifyPlayer(player, notifyType, message)
```

There are three notification types available, whose names should be passed as the second argument to the `notifyPlayer` method. They are as follows:
```lua
notifyType = "Info"
```
*Image needs to be added here*

```lua
notifyType = "Success"
```
*Image needs to be added here*

```lua
notifyType = "Error"
```
*Image needs to be added here*