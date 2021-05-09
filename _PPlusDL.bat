@ECHO off
cls
:start
@echo off
setlocal enableDelayedExpansion

set /a size=80-1 & rem screen size minus one

title Paramount Plus Downloader
echo Starting downloader...
@timeout 0 /nobreak>nul
echo Checking for ffmpeg...
@timeout 0 /nobreak>nul
if not exist "ffmpeg.exe" goto missingcodec
echo Checking for yt-dlp.exe...
@timeout 0 /nobreak>nul
if not exist "yt-dlp.exe" goto missingdl
echo Checking to see if we're not running on MS^-DOS...
@timeout 0 /nobreak>nul
if not "%os%"=="Windows_NT" goto not_windows_nt
echo Checking yt-dlp.exe for updates...
yt-dlp.exe -U
goto menu
:menu
cls
mode con:cols=80 lines=25
color 1f
echo.
echo.
echo.
echo.
echo.
set s=Paramount^+
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!

set s=Downloader v1.1.0
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
echo.
set s=Batch GUI by Spencer Everly.
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
echo.
set s=What do you want to do?
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
echo.

set s=1 to download a show or movie^^!
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!

set s=2 to exit.
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!

set s=Please choose a number and press enter.
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto paramountplusurl
if '%choice%'=='2' goto exit
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:paramountplusurl
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set s=Paste the URL of the show or movie below.
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
echo.
set url=
set /p url=
if '%url%'=='' goto paramountplusft

:paramountplusft
cls
echo A command will now run to choose the format you want.
echo.
echo After the formats are available type up the format you want.
echo.
yt-dlp.exe -F %url%
echo.
echo Enter the ID you want below.
echo.
set formatt=
set /p formatt=
if '%formatt%'=='' goto random_funfact

:paramountplusdl
cls
echo Starting download... Another window should now pop up.
echo DO NOT CLOSE THE OTHER WINDOW OR ELSE THE DOWNLOAD WILL FAIL^^!
echo.
echo Fun fact^^! Did you know^?
echo %funfact%
start /wait cmd.exe /c "yt-dlp.exe -o "%%(series)s/%%(season)s/%%(episode)s.%%(ext)s" -f %formatt% %url%"
goto donedl

:random_funfact

set string1=SpongeBob was going to be called ^"SpongeBoy Ahoy^^!^"^, but the name was taken from a mop product.
set string2=Viacom^, the owner of CBS and other companies^, owns Nickelodeon^, BET^, Comedy Central^, and a few others^.
set string3=Jimmy Neutron was originally called Johnny Queasar.
set string4=The SpongeBob episode ^"Mid-Life Crustacean^" was banned due to the panty raid scene^.
set string5=Rugrats was the 2nd Nicktoon to last 9 seasons. SpongeBob beat Rugrats with it^'s 10th season.
set string6=Paramount^+ was originally called CBS All Access before the rebranding on March 4th^, 2021.
set string7=The 3rd SpongeBob movie was originally going to be about cats from outer space taking Gary^.
set string8=Chalk Zone had a lost theme song from the original pilot, and that Paramount^+ included it in their service.
set string9=Fanboy and Chum Chum was greenlit instead of Adventure Time^, which sturred fans years later.
set string10=Invader ZIM^'s Dark Harvest episode was the most darkest^, that it was still never pulled up to this day.
set string11=The Angry Beavers^' final episode never aired because it broke the 4th wall.
set string12=All of the children on Rugrats were voiced by women.
set string13=CBS Television was created around the 1950s^/1960s.
set string14=South Park was the first TV^-MA animated show. You can find the show on HBO Max.
set string15=Some content isn^'t on Paramount^+ due to licensing issues.
set string16=Two real NCIS Agents actually made cameos on the show ^"NCIS^".
set string17=Avatar^: The Last Airbender was going to have a 4th season until ^"The Last Airbender^" flopped completely.

:: set /a funfact_number_before=%funfact_number%
SET /a funfact_number=%random% % (1 + 16)
:: if /i %funfact_number% LSS 1 goto random_funfact
:: if /i %funfact_number% GTR 16 goto random_funfact
:: if "%funfact_number_before%"=="%funfact_number%" goto random_funfact

if %random%==0 set funfact=%string17%
if %random%==1 set funfact=%string1%
if %random%==2 set funfact=%string2%
if %random%==3 set funfact=%string3%
if %random%==4 set funfact=%string4%
if %random%==5 set funfact=%string5%
if %random%==6 set funfact=%string6%
if %random%==7 set funfact=%string7%
if %random%==8 set funfact=%string8%
if %random%==9 set funfact=%string9%
if %random%==10 set funfact=%string10%
if %random%==11 set funfact=%string11%
if %random%==12 set funfact=%string12%
if %random%==13 set funfact=%string13%
if %random%==14 set funfact=%string14%
if %random%==15 set funfact=%string15%
if %random%==16 set funfact=%string16%

goto paramountplusdl

:donedl
cls
echo Done^^! Returning to menu...
@timeout 5 /nobreak>nul
goto menu

:exit
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set s=Do you really want to quit? Type Y for Yes, N for No.
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
set choice=
set /p choice= 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='N' goto menu
if '%choice%'=='Y' goto exitfinal
if '%choice%'=='n' goto menu
if '%choice%'=='y' goto exitfinal

:missingcodec
cls
mode con:cols=80 lines=25
color 1f
echo Hold up^^! ffmpeg is not found.
echo.
echo ffmpeg.exe is used to make the video work for this downloader.
echo To use the download tool, you need ffmpeg.
echo To download ffmpeg, visit https^:^/^/ffmpeg.org^/download.html
echo and click on the Windows icon and go to the builds.
echo.
echo The latest version should be the best.
echo.
echo Until you download it and put it into the root of the batch,
echo this tool cannot continue.
pause
exit

:missingdl
cls
mode con:cols=80 lines=25
color 1f
echo Wait a minute^^! yt-dlp.exe is not found.
echo.
echo This tool uses yt-dlp.exe as the main core of the downloader.
echo Without yt-dlp.exe, it is utterly impossible to download any
echo single show^/movie from Paramount^+.
echo.
echo Also, Windows will detect yt^-dlp.exe as a virus, which it's not.
echo So add an exclusion to the downloader folder. More info here^:
echo https^:^/^/duckduckgo.com^/?q^=adding^+folder^+exclusions^+to^+windows^+defender
echo.
echo To download yt-dlp, visit it^'s official GitHub page at
echo https^:^/^/github.com^/yt^-dlp^/yt^-dlp
echo and then go to the releases tab.
echo.
echo Until you download it and put it into the root of the batch,
echo this tool cannot continue.
pause
exit

:not_windows_nt
cls
echo Hang on^^! You^'re running on MS^-DOS^?^?^?
echo.
echo This software only supports Windows 7 and above.
echo Due to ffmpeg and yt^-dlp not running on MS^-DOS,
echo this is why.
echo.
echo Until you run this on Windows 7 and above, this tool cannot
echo continue.
pause
exit

:exitfinal
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set s=Press enter to exit.
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!
echo.
pause>nul
exit


:: This GUI tool was made by Spencer Everly. Now only did I coded this myself, I also borrowed code from many other batch files like the RiiConnect24Patcher and the NSMBWii Mod Patcher.
:: If you want to contact me for any bugs/reports, find me on Discord at "Spencer Everly#0001" (No quotes)