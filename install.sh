echo "This script must be ran as root to take effect. Are you sure you want to continue? (y/n)"
read choice

case $choice in # handler
  y)
    echo "  >> Initializing"
    repodir=$(pwd) # for later when we go down directories and need to go back to square 1
    
    echo "type your home directory (note that '~/' won't work, but '/home/bob' for example, will work.) : "
    read homedir
    echo "would you like to install dwm (y/n) ?"
    read install_dwm
    echo "would you like to install home dotfiles"
    read install_home
    
    echo "  >>  Installing"
    
    case $install_dwm in
      y)
        echo "installing dwm"
        cd dwm
        sudo make clean install
        
        echo "installing dwmblocks"
        cd dwmblocks
        sudo make clean install
        
        echo "installing dwm scripts"
        cd $repodir/system/scripts
        chmod +x *
        sudo mv * /usr/local/bin
        echo "done installing dwm"
      ;;
      
      n)
        echo "skipping dwm"
      ;;
      
      *)
        echo "er: unidentified option"
      ;;
    esac
    
    case $install_home in
      y) 
        echo "installing home dotfiles"
        cd $repodir/system
        mv .* $homedir
      ;;
      
      n)
        echo "skipping home dotfiles"
      ;;
      
      *)
        echo "er: unidentified option"
      ;;
    esac
  ;;

  n)
  ;;

  *)
    echo "er: unidentified option; quitting."
  ;;
esac

echo "Thank you for choosing my dotfiles, have a nice day."
exit
