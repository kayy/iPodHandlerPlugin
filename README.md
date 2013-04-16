iPodHandlerPlugin
=================

Small plugin for Unity game engine to detect if iPod player is playing. 
A Unity GameObject can register itself as callback listener to get notified on every status change.

The Xcode project builds a library file "libiPodHandlerPluginRelease.a" which should be placed in
the Assets/Plugins/iOS folder of your Unity project. When building the iPhone player in Unity,
it will be transferred to the Library folder of the Unity-iPhone project automatically.

To use it within your Unity project you can use the sample class IPodHandler.cs and modify it to 
fit your needs. The simplest use case is polling the iPod player status. This is done by calling
IPodHandler.Active property.

To register the callback listener within your Unity project you need to call IPodHandler's
RegisterUnityIPodCallbackListener method.
