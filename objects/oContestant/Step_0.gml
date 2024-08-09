if (killer = false)
{
	jumper = floor(random_range(1,100));
	if (x > 200 && x < 1600)
	{
		runner = floor(random_range(1,10));
	}
	else
	{
		runner = floor(random_range(3,9));
	}
	
	if (change > 0 && x < 400)
	{
		runner = floor(random_range(1,17));
	}
	
	if (change < 0 && x > 1400)
	{
		runner = floor(random_range(1,17));
	}
	
	if (runner == 5)
	{
		change = -change;
	}

	xadder += 0.1*change;


	if (xadder >= 7)
	{
		xadder = 7;
	}

	if (xadder <= -7)
	{
		xadder = -7;
	}


	vsp += grv;

	if (place_meeting(x+xadder,y,oBeam))
	{
		while (!place_meeting(x+sign(xadder),y,oBeam))
		{
			x += sign(xadder);
		}
		xadder = 0;
	}

	if (place_meeting(x,y+vsp,oBeam))
	{
		while (!place_meeting(x,y+sign(vsp),oBeam))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}

	if (jumper == 5)
	{
		vsp = -17;
	}

	x += xadder;
	y += vsp;
	
	if (place_meeting(x,y,oWater))
	{
		
		if (alarm[0] == -1)
		{
			alarm[0] = 60;
			instance_create_depth(x,y+130,depth,oWave);
		}
	}
}
else
{
	image_angle += 20;
	if (image_angle >= 360) { image_angle -= 360 }
	vsp -= 0.5;
	y += vsp;
}
//ewewe