#!/bin/sh

# clone the repository and checkout the 41 commit
git clone https://gitlab.gnome.org/GNOME/adwaita-icon-theme.git
cd adwaita-icon-theme
git checkout 8670d0eb2414c1ac16d927da5d1a22142ba5e346

# build and install the theme
autoreconf -fvi
./autogen.sh --prefix=$HOME/.local
make
make install

# rename the icon theme so it doesn't interfere with the newer version
mv $HOME/.local/share/icons/Adwaita $HOME/.local/share/icons/Adwaita-41
sed -i 's/Adwaita/Adwaita-41/' $HOME/.local/share/icons/Adwaita-41/index.theme

# have it inherit from the newer theme so that newer 42 icons are found and used
sed -i 's/Inherits=hicolor/Inherits=Adwaita/' $HOME/.local/share/icons/Adwaita-41/index.theme

# update the icon cache
gtk-update-icon-cache $HOME/.local/share/icons/Adwaita-41

# select Adwaita-41.1 from Settings Manager > Appearance > Icons, or
xfconf-query -c xsettings -p /Net/IconThemeName -t string -s "Adwaita-41" --create

# restart the panel
xfce4-panel -r