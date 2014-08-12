import UnityEngine

class RangedAttack (MonoBehaviour): 
	public hairball as Rigidbody2D
	public speed = 20f
	private playerScript as CharacterScript
	
	rangedCooldown = false				// necessary boolean
	
	def Awake():
		playerScript = transform.root.GetComponent[of CharacterScript]()
		
	def Start ():
		pass

	def Update ():
		if rangedCooldown:
			if Input.GetButtonDown("Fire1"):
				if playerScript.facingRight:
					bulletInstance2 as Rigidbody2D = Instantiate(hairball, transform.position, Quaternion.Euler((Vector3)(0,0,180f)))
					bulletInstance2.velocity = (Vector2)(-speed, 0)
				else:				
					bulletInstance as Rigidbody2D = Instantiate(hairball, transform.position, transform.rotation)
					bulletInstance.velocity = (Vector2)(speed, 0) 
			//elif Input.GetButtonDown("Fire1"):
	
	def canFire():											// disables ranged attack
			rangedCooldown = false
	
	def OnCollisionEnter2D(col as Collision2D) as void:		// lets the player shoot
		if col.gameObject.tag == 'Fire':
			rangedCooldown = true
			Invoke("canFire", 10f)							// calls the canFire funtion 10 seconds later
			Destroy(col.gameObject)							// destroys power up
			
			
	
