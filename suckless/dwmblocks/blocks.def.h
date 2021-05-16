//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", 	   "get_keymap",	              0, 10},
	{"Bat:",   "get_bat", 		              5, 11},
	{"S:"  ,   "get_vol", 			          0, 12},
	{""    ,   "date '+%b %d (%a) %I:%M%p'", 60, 13},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
