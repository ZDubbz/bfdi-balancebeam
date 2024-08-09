if (dead == false)
{
	if (!instance_exists(oContestant))
	{
		awinnerisyou = true;
	}
	key_up = keyboard_check(ord("W")) || keyboard_check(vk_space);
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));

	hsp += (key_right - key_left)*walksp;

	vsp += grv;

	if (key_up && place_meeting(x,y+1,oBeam))
	{
		vsp = jump;
	}

	if (place_meeting(x+hsp,y,oBeam))
	{
		hsp = 0;
	}

	if (place_meeting(x,y+vsp,oBeam))
	{
		while (!place_meeting(x,y+sign(vsp),oBeam))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}

	hsp += hsp_frac;
	vsp += vsp_frac;
	hsp_frac = frac(hsp);
	vsp_frac = frac(vsp);
	hsp -= hsp_frac;
	vsp -= vsp_frac;

	if (place_meeting(x+1,y,oContestant)) { hsp = -10; vsp = -17; }
	if (place_meeting(x-1,y,oContestant)) { hsp = 10; vsp = -17; }
	if (place_meeting(x,y+1,oContestant))
	{
		var _ewewe = floor(random_range(1,6));
		if (_ewewe == 5)
		{
			var _contest = instance_nearest(x,y+1,oContestant)
			_contest.killer = true;
			_contest.alarm[0] = 120;
		}
	}

	if (place_meeting(x,y,oWater))
	{
		dead = true;
		instance_create_depth(x,y,depth,oWave);
	}

	x += hsp;
	y += vsp;
}
else
{
	image_alpha -= 0.01;
	if (image_alpha == 0) { room_restart(); }
	x += floor(random_range(-5,5))
	y += floor(random_range(-5,5))
}
if (awinnerisyou)
{
	room_goto_next();
}