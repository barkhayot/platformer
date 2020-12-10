// Get player input
if (hascontrol)
{

	left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up);

	if (left) || (right) || (jump) 
	{
		controller = 0;
	
	}

	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
	{
		left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller  = 0;	
	}
	if (gamepad_button_check_pressed(0, gp_face1))
	{
		jump = 1;
		controller = 1;
	
	}
}

else 
{
	left = 0;
	right = 0;
	jump = 0;
	
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	jump = 1;
	controller = 1;
}

// Calculate movement 

var move  = right - left;

hsp = move * walkspd;
vsp = vsp + grv;

//Jumping
if (place_meeting(x, y+1, o_wall)) && (jump)
{
	vsp = - 7;
	
}

// Horizontal Collision 
if (place_meeting(x+hsp, y, o_wall))
{
	while (!place_meeting(x+sign(hsp), y, o_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Verticall Collsion 

if (place_meeting(x, y+vsp, o_wall))
{
	while (!place_meeting(x, y+sign(vsp), o_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animation

if (!place_meeting(x, y+1, o_wall))
{
	sprite_index = s_player_a;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else 
{
	image_speed = 1;
	if (hsp == 0)
	{
	sprite_index = s_player;
	}
	else
	{
	sprite_index = s_player_r;
	}
}

if (hsp != 0) image_xscale = sign(hsp);



