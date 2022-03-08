//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" CPU : ",	"get-cpu &",		2,                      0},

	{"RAM : ", 	"free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",		1,			0},
        
	{"♪ : ",	"awk -F'[][]' '/Left:/ { print $2 }' <(amixer sget Master)",	0,			10},

	{"", "date '+%m/%d/%Y %I:%M %p'",	1,			0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
