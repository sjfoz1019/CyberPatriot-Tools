ECHO =================================
ECHO    Searching for Media Files
ECHO =================================

cd C:\
mkdir %USERPROFILE%\Desktop\"1 Scripts"\Output
dir /s /b *.mp3 *.mp4 *.wav *.ogg *.m4a *.mov *.wmv *.jpg *.jpeg *.gif *.png *.bmp > %USERPROFILE%\Desktop\"1 Scripts"\Output\"Media Files.txt"

ECHO Execution Completed.

ECHO =================================
ECHO    Searching for Text Files
ECHO =================================

cd C:\Users
echo "Text files in User Directories\n" >> %USERPROFILE%\Desktop\"1 Scripts"\Output\"Plaintext.txt"
dir /s /b *.txt >> %USERPROFILE%\Desktop\"1 Scripts"\Output\"Plaintext.txt"

ECHO Execution Completed.

ECHO =================================
ECHO   Searching for User Programs
ECHO =================================

dir /s /b *.exe > %USERPROFILE%\Desktop\"1 Scripts"\Output\"Programs in User Directories.txt"

ECHO Execution Completed.

ECHO =================================
ECHO   Mapping the User Directory
ECHO =================================

tree /f > %USERPROFILE%\Desktop\"1 Scripts"\Output\"tree.txt"

ECHO Execution Completed.

ECHO =================================
ECHO           netstatting
ECHO =================================

netstat -ab > %USERPROFILE%\Desktop\"1 Scripts"\Output\"netstat.txt"
