// $Id: IPodHandler.cs 869 2013-02-14 18:14:14Z kay $
// 
// Created by Kay.
// Copyright 2011 SCIO System-Consulting GmbH & Co. KG. All rights reserved.
// 
using UnityEngine;
using System.Runtime.InteropServices;


/// <summary>
/// Interface to iPodHandlerPlugin a native iOS library to check whether iPod music player is active i.e. is playing 
/// music.
/// </summary>
public class IPodHandler
{
	/// <summary>
	/// Name of the game object to receive notifications.
	/// </summary>
	const string GAME_OBJECT = "Main";
	/// <summary>
	/// Method name to send the update message to. 
	/// </summary>
	const string METHOD = "IPodNotification";
	
	[DllImport("__Internal")]
	private static extern bool IsIPodMusicPlaying ();

	[DllImport("__Internal")]
	private static extern void RegisterUnityIPodCallbackListener (string gameObject, string method);

	/// <summary>
	/// Getter for returning iPod status.
	/// </summary>
	/// <value>
	/// <c>true</c> if iPod is playing; otherwise, <c>false</c>.
	/// </value>
	public static bool Active {
		get { 
			if (Application.platform == RuntimePlatform.IPhonePlayer) {
				return IsIPodMusicPlaying ();
			}
			return false;
		}
	}
	
	/// <summary>
	/// Registers the game object GAME_OBJECT and its method METHOD as callback listener for iPod change notifications.
	/// In order to work correctly, the game object must ba active in the current scene and has to have a component 
	/// that implements a method with the signature void IPodNotification (string message)
	/// </summary>
	public static void RegisterUnityIPodCallbackListener () {
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			RegisterUnityIPodCallbackListener (GAME_OBJECT, METHOD);
		}
	}
	
}

