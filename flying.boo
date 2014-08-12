import UnityEngine

class flying (MonoBehaviour): 
	public maxSpeed = 10f
	flyCooldown = false		
		
	def Start ():
		pass

	def Update ():
		if flyCooldown:
			Physics2D.gravity.y = 0						// flight.  IT WORKS
			
		else:
			Physics2D.gravity.y = -30
	
		if Physics2D.gravity.y == 0:	
			ySpeed = Input.GetAxis("Vertical")
			rigidbody2D.velocity.y = ySpeed * maxSpeed
			
	def canFly():											
			flyCooldown = false
	
	def OnCollisionEnter2D(col as Collision2D) as void:		
		if col.gameObject.tag == 'nyan':
			flyCooldown = true
			Invoke("canFly", 10f)							
			Destroy(col.gameObject)							
			
