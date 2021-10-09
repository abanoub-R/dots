# Auto setup script for 'aqua' i3 theme by abanoub-R on github
echo "installer for aquai3 (MUST BE RAN AS ROOT)"
# move config into ~/config/i3
mv config ~/.config/i3/
echo "moved i3 config"

# move i3status.conf into /etc
sudo mv i3status.conf /etc/
echo "moved i3status"

echo "finished"
