// bootstrap dotfile procedure, change as you wish, then compile and run.
#include <stdio.h>
#include <stdlib.h>

int abort()
{
   printf("error: unidentified option. aborting...");
   return 0;
}

int main()
{
  system("clear");
  
  char maindir[] = system("$(pwd)"; // stores main
  char userdir[] = ""; // stores user dir to modify when ran as root
  static char choice;
  
  printf("Type your user directory (note that '~/' will not work) : ");
  scanf("%s",&userdir);
  
  printf("warning: this script must be ran as root for changes to take effect. Are you sure you want to continue? (y/n) ");
  scanf("%c",&choice);
  
  switch (choice)
  {
    case y: // note: this assumes pwd is the actual repo
      printf("setting up home .files\n");
      system("cd system && mv .* %s",userdir);
      
      printf("would you like to setup dwm scripts? (y/n) ");
      scanf("%c",&choice);
      
      switch (choice)
      {
        case y:
          printf("installing dwm scripts\n");
          system("cd scripts && chmod +x && sudo mv * /usr/local/bin");
          break;
        case n:
          break;
        default:
          abort();
      }
      printf("would you like to install dwm? (y/n) ");
      scanf("%c",&choice);
      
      switch (choice)
      {
        case y:
          printf("compiling dwm and dwmblocks");
          system("sudo make clean install");
          break;
      }
      
      break;
    case n:
      break;
    default:
      abort();
  }
                  
  printf("Thank you for using my dotfiles, have a nice day.");
  return 0;
}
