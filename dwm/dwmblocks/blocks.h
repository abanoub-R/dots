//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" CPU : ",	"get-cpu",		2,                      0},

	{"RAM : ", 	"get-ram",		1,			0},
        
	{"♪ : ",	"get-vol",		0,			10},

	{"", 		"get-date",		1,			0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
