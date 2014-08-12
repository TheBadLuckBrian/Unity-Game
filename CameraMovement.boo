import UnityEngine

class CameraMovement (MonoBehaviour): 

	public player as Transform
	
	def Start ():
		pass
	
	def Update ():
		transform.position = player.position
		transform.position.z = 100
		
/*	
		if Input.GetKeyDown(KeyCode.N):
			# zoom in
				if Camera.main.orthographicSize > 1:
					Camera.main.orthographicSize--
			
			
		if Input.GetKeyDown(KeyCode.M):
			# zoom out
			if Camera.main.orthographicSize < 15:
				Camera.main.orthographicSize++	
*/
