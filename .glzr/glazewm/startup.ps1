get-process zebar -ErrorAction SilentlyContinue | stop-process -force
get-process yasb -ErrorAction SilentlyContinue | stop-process -force
get-process gat-gwm -ErrorAction SilentlyContinue | stop-process -force

# conhost.exe --headless zebar
yasb

&"$HOME\.glzr\glazewm\gat-gwm.exe"

