//  Created by Kay.
//  Copyright 2013 SCIO System-Consulting GmbH & Co. KG. All rights reserved.
//
using UnityEngine;
using System.Collections;


/// <summary>
/// Callback listener for IPodHandlerPlugin. Attach this component to a GameObject named Main in your scene.
/// </summary>
public class TestIPodListener : MonoBehaviour 
{
	void Awake () {
		IPodHandler.RegisterUnityIPodCallbackListener ();
	}
	
	public void IPodNotification (string message) {
		Debug.Log ("Notification !!! " + message);
	}
}
