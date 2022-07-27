//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"RAM : ", 	"free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
        
	{"♪ : ",	"pamixer --get-volume",	0,		5},

	{"", "date '+%m/%d/%Y %I:%M %p'",	5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
