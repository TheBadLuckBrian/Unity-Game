import UnityEngine

class CharacterScript (MonoBehaviour): 
	
	public maxSpeed = 10f
	public facingRight = true
	private anim as Animator
	grounded = false
	public groundCheck as Transform
	groundRadius = 0.2f
	public whatIsGround as LayerMask
	public jumpForce = 700f
	
	public spawnPoint as Transform
	
	bounce = false
	bounceRadius = 0.3f
	public bounceCheck as Transform
	public whatIsBouncy as LayerMask
	
	public x = 0
	
	def Start ():
		anim = GetComponent[of Animator]()
	
	def FixedUpdate ():

		grounded = Physics2D.OverlapCircle(groundCheck.position, groundRadius, whatIsGround)
		anim.SetBool('Ground', grounded)
		
		bounce = Physics2D.OverlapCircle(bounceCheck.position, bounceRadius, whatIsBouncy)
				
		anim.SetFloat('vSpeed', rigidbody2D.velocity.y)
		
		move = Input.GetAxis("Horizontal")
		
		anim.SetFloat('Speed', Mathf.Abs(move))
		
		rigidbody2D.velocity = (Vector2)(move*maxSpeed, rigidbody2D.velocity.y)
		
		if move < 0 and not facingRight:
			Flip()
		elif move > 0 and facingRight:
			Flip()


	def Update():
		
		if grounded and Input.GetKeyDown(KeyCode.UpArrow):
			anim.SetBool('Ground', false)
			rigidbody2D.AddForce((Vector2)(0, jumpForce))
			
		if bounce and Input.GetKeyDown(KeyCode.UpArrow):
			rigidbody2D.AddForce((Vector2)(0, jumpForce/2))
			
	def Flip():
		facingRight = not facingRight
		theScale = transform.localScale
		theScale.x *= -1
		transform.localScale = theScale

	def OnTriggerEnter2D(coll as Collision2D) as void:
		if coll.gameObject.tag == 'DeadZone':
			gameObject.transform.position = spawnPoint.position
