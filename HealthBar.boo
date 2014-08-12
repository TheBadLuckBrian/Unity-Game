import UnityEngine

public class HealthBar(MonoBehaviour):
	
	public PlayerHealth = 100.0
	
	public spawnPoint as Transform
	
	static public NumberOfLives = 3
		
	def Start ():
		pass
		
	def Update():
		if PlayerHealth <= 0:
			Death()
			PlayerHealth = 100
			
		if NumberOfLives <= 0:
			Application.LoadLevel('GameOver')
			NumberOfLives = 3
		
		
	def OnCollisionEnter2D(coll as Collision2D) as void:
		if coll.gameObject.tag == 'Enemy':
			PlayerHealth -= 10
			transform.Translate((Vector3)((transform.position.x - coll.gameObject.transform.position.x),0,0) * 2)
			transform.position.z = 0
	
	
	def OnTriggerEnter2D(coll as Collider2D) as void:
		if coll.gameObject.tag == 'Health' and PlayerHealth + 20 <= 100:
			PlayerHealth += 20
		elif coll.gameObject.tag == 'Health':
			PlayerHealth = 100
		elif coll.gameObject.tag == 'DeadZone':
			PlayerHealth = 100
			Death()

			
	def OnGUI() as void:
		GUI.Box(Rect(5, 5, (Screen.width / 3.0) / (100.0 / PlayerHealth), 25), 'Health: ' + PlayerHealth)
		
		GUI.Box(Rect(5, 35, 85, 25), 'Lives: ' + NumberOfLives)
		
		
	def Death():
		gameObject.transform.position = spawnPoint.position
		NumberOfLives -= 1
		Application.LoadLevel(Application.loadedLevel)

		
