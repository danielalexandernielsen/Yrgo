static class Collision
{
  
	static boolean round(GameObject object1, GameObject object2)
	{
		float maxDistance = object1.radius + object2.radius;

		if (abs(object1.position.x - object2.position.x) > maxDistance || abs(object1.position.y - object2.position.y) > maxDistance)
		{
			return false;
		} 
		else if (dist(object1.position.x, object1.position.y, object2.position.x, object2.position.y) > maxDistance)
		{
			return false;
		} 
		else
		{
			return true;
		}
	}
}
