FROM debian:buster

RUN apt-get update && apt-get upgrade \
    && env DEBIAN_FRONTEND=noninteractive apt-get install -y --reinstall ca-certificates \
    && env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        dbus-x11 \
    && env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        thunar \
        xfdesktop4 \
        xfwm4 \
        xfce4-panel \
        xfce4-settings \
        xfce4-session \
        xfconf \
        xfce4-taskmanager \
        xfce4-terminal \
        xfce4-appfinder \
    && env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        librsvg2-common \
    && env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gtk2-engines-murrine \
        gtk2-engines-pixbuf \
        libgtk2.0-0 \
        libgtk-3-0 \
        git \
    && git clone -b Nord-Black-Frost --single-branch https://github.com/rtlewis88/rtl88-Themes.git \
    && git clone https://github.com/L4ki/Breeze-Noir-Icons.git \
    && cp -r rtl88-Themes/Material-Black-Frost-3.38 /usr/share/themes/Material-Black-Frost-3.38 \
    && cp -r Breeze-Noir-Icons/Breeze-Noir-White-Blue /usr/share/icons/Breeze-Noir-White-Blue \
    && gtk-update-icon-cache /usr/share/icons/Breeze-Noir-White-Blue \
    && sed -i 's%<property name="ThemeName" type="string" value=".*"/>%<property name="ThemeName" type="string" value="Material-Black-Frost-3.38"/>%;\
        s%<property name="IconThemeName" type="string" value=".*"/>%<property name="IconThemeName" type="string" value="Breeze-Noir-White-Blue"/>%' \
        /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml \
    && rm -rf rtl88-Themes && rm -rf Breeze-Noir-Icons \
    && env DEBIAN_FRONTEND=noninteractive apt-get remove -y git

CMD ["startxfce4"]