iPodHandlerPlugin
=================

Small plugin for Unity game engine to detect if iPod player is playing. 
A Unity GameObject can register itself as callback listener to get notified on every status change.

To use it within your Unity project put libiPodHandlerPlugin.a in folder Assets/Plugins/iOS and 
put class IPodHandler.cs (s. folder Unity-CSharp) somewhere under Assets/Scripts. 

The simplest use case is polling the iPod player status. This is done by calling
IPodHandler.Active property.

A more sophisticated approach is to register a callback listener within your Unity project. To do so:
 - Put IPodHandler.cs in your project
 - Look for GameObject let's call it main that should stay active even when a new scene is loaded 
   i.e. Object.DontDestroyOnLoad (mainGameObject) is called in Awake ().
   If your GameObject's name is not main, replace "main" in IPodHandler.GAME_OBJECT with your object
 - main has to have a component attached that implements the callback method:
   public void IPodNotification (string message)
   If you prefer a different name, modify the const IPodHandler.METHOD appropriately
 - Call once the method IPodHandler.RegisterUnityIPodCallbackListener ().

If you need to compile a new version of libiPodHandlerPlugin.a start with the attached Xcode 
project and modify the build settings to fit your needs. The resulting .a file has to be copied
to the Assets/Plugins/iOS folder of your Unity project. When building the iPhone player in Unity,
it will be transferred to the Library folder of the Unity-iPhone project automatically.

