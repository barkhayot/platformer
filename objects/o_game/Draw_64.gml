// draw score 

if (room != room_m) && (instance_exists(o_player)) && (global.kills > 0)
{
	killtextscale = max(killtextscale * 0.95, 1);
	draw_set_halign(RES_W-150);	
	draw_set_valign(12);
	//image_angle += 1;
	draw_text_transformed(RES_W-150, 12, "Kills : " + string(global.kills), killtextscale, killtextscale, 0);
	
	
	//DrawSetText()
	//draw_text_transformed( RES_W-8, 12, string(global.kills) + "kills", killtextscale, killtextscale, 0);
	//draw_set_color(c_white);
	//draw_text_transformed(RES_W-10, 10, string(global.kills) + "kills", killtextscale, killtextscale, 0);
}  