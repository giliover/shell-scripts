<header>
	<label><strong>💻 Code: </strong><br></label>
</header>

```sh
#!/bin/bash

install() {
    # scriptdir variable
    scriptdir=`dirname "$BASH_SOURCE"`

    # library needed
    echo "Installing libraries" && WINEPREFIX=~/.wine-rosetta WINEARCH=win32 winetricks d3dx10 d3dx9_26 d3dx9_28 d3dx9_31 d3dx9_35 d3dx9_36 d3dx9_39 d3dx9_42 devenum directmusic directplay directx9 dmsynth dsound --optout|| echo "Libraries not installed";

    echo "" 

    if echo "Installing rosetta stone setup, do not running without exit!!!"; then 

        if WINEPREFIX=~/.wine-rosetta WINEARCH=win32 wine $scriptdir/rosetta-stone/installer/Setup.exe ; then 

            echo "Copy crack to wine prefix" && cp -r $scriptdir/rosetta-stone/installer/crack/* ~/.wine-rosetta/drive_c/Program\ Files/Rosetta\ Stone/Rosetta\ Stone\ Language\ Training/ || echo "Uncompiled copy"

            echo "Disabling firewall" &&  cp $scriptdir/rosetta-stone/installer/crack/hosts ~/.wine-rosetta/drive_c/windows/system32/drivers/etc/ || echo "Was not possible to disable"
            
            echo "Completed";

            else echo "Was not possible to install" 
        fi

        else echo "Not completed"; 

    fi 
    
    echo "End"
}


if [ $1 == "--install-arch-linux" ]; then
    echo "Installing wine and winetricks"
    echo "Case installed (Ctrl + C)"
    trizen -S --noconfirm wine winetricks && install || echo "Wine and winetricks not installed";
fi

if [ $1 == "--start" ]; then
    echo "Starting the Rosetta Stone "

    WINEPREFIX=~/.wine-rosetta WINEARCH=win32 wine ~/.wine-rosetta/drive_c/Program\ Files/Rosetta\ Stone/Rosetta\ Stone\ Language\ Training/Rosetta\ Stone.exe
    
    echo "End"
fi

if [ $1 == "--install" ]; then
    echo "Starting the Rosetta Stone "
   

    install || echo "Make sure the wine and winetricks are installed"
    echo "End"
fi
```

<br>
<label>↪Installing on your <strong>arch linux:</strong></label>

<br>
<br>

```sh
# SCRIPTS = ~/path/to/script/repository 

$SCRIPTS/wine/rosetta-stone.sh --install-arch-linux

```

<br>
<label>↪Running on your <strong>arch linux:</strong></label>

<br>
<br>

```sh
# SCRIPTS = ~/path/to/script/repository 

$SCRIPTS/wine/rosetta-stone.sh --install-arch-linux

```

<br>
<label>↪Running on your <strong>any linux:</strong></label>

<br>
<br>

```sh
# SCRIPTS = ~/path/to/script/repository 

$SCRIPTS/wine/rosetta-stone.sh --install

```
