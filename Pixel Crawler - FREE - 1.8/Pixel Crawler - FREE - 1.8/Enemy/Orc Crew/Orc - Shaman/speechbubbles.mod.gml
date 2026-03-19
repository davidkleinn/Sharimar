#define init
global.cowSay = ["", "", "", ""];	//	message to display
global.milkSay = [0, 0, 0, 0];	//	duration of display


#define chat_message
var mesContent = argument0;	//	string of message sent
var mesPlayer = argument1;	//	index of sender
global.cowSay[mesPlayer] = mesContent;	//	putting content into array
global.cowSay[mesPlayer] = scr_linebreak(global.cowSay[mesPlayer], 40, 40);	//	wrapping content
global.milkSay[mesPlayer] = 180;	//	initiate duration

#define step
for(i = 0; i < array_length(global.milkSay); i++){	//	for each player
	if(global.milkSay[i] > 0){	//	if duration not already depleted
		global.milkSay[i] -= current_time_scale;	// manage duration
	}
}

#define draw
depth = 999999;	// appear over walls and such
for(i = 0; i < array_length(global.cowSay); i++){
	if(global.milkSay[i] > 0){
		draw_set_font(fntChat)
		if(global.milkSay[i] < 30){
			draw_set_alpha(global.milkSay[i] / 30 * 0.8);
		}
		else{
			draw_set_alpha(0.8);
		}
		var _p = player_find(i);
		if(_p != -4){
			var _y = 10 + sprite_get_height(_p.sprite_index) / 2;
			draw_tooltip(_p.x, _p.y - _y, global.cowSay[i]);
		}
	}
}
draw_set_alpha(1);



#define scr_linebreak(string,maxLength,maxWordLength)
/*

Takes a string and automatically inserts linebreaks into it after a certain amount of characters.
string = string to automatically linebreak
maxLength = maximum length a line can be before breaking
maxWordLength = maximum length a word can be before the script gives up and starts a new line
Created by Spasman
spasman@spasmangames.com
 
*/

insert = 0
go = 0
prev = 0
text = argument0
repeat(string_length(text)) {
    if insert > argument1 {
        while(1) {
            str = string_char_at(text,go-prev)
            if str != " " {
                prev += 1
            }
            else {
                break;
            }
            if prev > argument2 {
                prev = 0
                break;
            }
        }
        text = string_insert("#",text,go-prev)
        insert = 0
    }
    insert += 1
    go += 1
    if string_char_at(text,go) = "#" {
       insert = 0
    }
}
 
return text;