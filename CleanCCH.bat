@ECHO OFF

:::        ________________   ___/-\___     ___/-\___     ___/-\___
:::      / /             ||  |---------|   |---------|   |---------|
:::     / /              ||   |       |     | | | | |     |   |   |
:::    / /             __||   |       |     | | | | |     | | | | |
:::   / /   \\        I  ||   |       |     | | | | |     | | | | |
:::  (-------------------||   | | | | |     | | | | |     | | | | |
:::  ||               == ||   |_______|     |_______|     |_______|
:::  ||   ACME TRASH CO  | =============================================
:::  ||          ____    |                                ____      |
::: ( | o      / ____ \       CCH Trash CAUTION!!!      / ____ \    |)   0oO0 
:::  ||      / / . . \ \                              / / . . \ \   |    0O
::: [ |_____| | .   . \ \____________________________| | .   . \ \__] oO0
:::           \ .   . |                                \ .   . |
:::____________\_____/__________________________________\_____/___________

cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.

:start
    set /P c=Delete .cch files from .\trunk [Y/N]:
    if /I "%c%" EQU "Y" goto :trunkDel
    if /I "%c%" EQU "N" goto :branch
    goto :start


:trunkDel
    del .\trunk\Data\*.cch
    echo.
    echo All .cch files from .\trunk are deleted
    echo.
    pause
    goto :branch

:branch
    cls
    for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
    echo.
    echo.
    set /P c=Delete .cch files from .\branches [Y/N]:
    if /I "%c%" EQU "Y" goto :branchDel
    if /I "%c%" EQU "N" goto :quit
    goto :branch

:branchDel
    for /d %%D in (.\branches\*) do (
        del %%D\Data\*.cch
    )
    echo.
    echo All .cch files from .\branches are deleted
    echo.
    pause
    goto :quit

:quit
    cls
    echo Exiting...
    echo.
    pause
    exit