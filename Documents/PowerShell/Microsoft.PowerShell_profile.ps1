Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
$env:PYTHONIOENCODING = 'utf-8'
$env:YAZI_FILE_ONE='C:\Program Files\Git\usr\bin\file.exe'
$env:Path = "C:/Users/para/scoop/apps/w64devkit/current/bin;" + $env:Path

Import-Module gsudoModule
Import-Module Get-ChildItemColor

Set-Alias t wsl -Option AllScope
Set-Alias ls Get-ChildItemColor -option AllScope
Set-Alias vi nvim -Option AllScope
Set-Alias vim nvim -Option AllScope
Set-Alias so scoop -Option AllScope
Set-Alias sos scoop-search -Option AllScope
Set-Alias rm rm.exe -Option AllScope
Set-Alias cp cp.exe -Option AllScope
Set-Alias lg lazygit.exe -Option AllScope
Set-Alias ldk lazydocker.exe -Option AllScope
Set-Alias yt yt-dlp
Set-Alias tar "D:\para\Tools\w64devkit\bin\tar.exe"
Set-Alias curl "C:\Users\para\scoop\shims\curl.exe"
Set-Alias dkc docker-compose

function wsls {
    wsl --shutdown
}

function vic {
    nvim --clean $args
}

function gitd {
    git --git-dir=$HOME/.paragit --work-tree=$HOME $args
}

function lgd {
    lazygit -w $HOME -g $HOME/.paragit $args
}

function ccc {
    bunx conventional-changelog-cli $args
}

function gpt {
    $process=Get-NetTCPConnection -LocalPort $args 2> $null
    if ($process -ne $null) {
        Get-Process -Id $process.OwningProcess
    }
}

function mitm {
    sudo mitmproxy --mode=transparent --showhost --set console_mouse=false
}

function mflow {
    mitmproxy -n --set console_mouse=false --showhost -r $args
}

function zrm { zoxide remove $args }

function http { python -m http.server $args }
function venv { python -m venv $args }
function ns {
    $(Stop-Process -Name nvim) 2> $null
    $(Stop-Process -Name git) 2> $null
}

function l { ls.exe $args }
function ll { ls.exe -lsh $args }
function la { ls.exe -lash $args }


function psp { netstat -ano | Select-String $args }

function ce { sudo ~/Documents/CtrlEscape.exe }
function ec { sudo Stop-Process -Name "CtrlEscape" }

function wrangler { npx --yes wrangler $args }

function di { i --context_window 128000 --max_tokens 8192 --max_output 8192 --multi_line $args }
function cfd { cloudflared $args }

function gwm-stop { 
    sudo pwsh -Command "Stop-Process -Name glazewm"
    Stop-Process -Name zebar
}

function zebar-restart {
    Stop-Process -Name zebar 2> $null
    C:\Users\para\.glzr\zebar\start.bat
}

# Audio
function rvd { Get-AudioDevice -List | Where-Object Type -EQ Playback | Where-Object Name -Like "*Stealth 600X*" | Set-AudioDevice }
function rvv { Get-AudioDevice -List | Where-Object Type -EQ Playback | Where-Object Name -Like "*INZONE*Game*" | Set-AudioDevice }
function rrd { Get-AudioDevice -List | Where-Object Type -EQ Recording | Where-Object Name -Like "*Nvidia Broadcast*" | Set-AudioDevice }
function rrv { Get-AudioDevice -List | Where-Object Type -EQ Recording | Where-Object Name -Like "*(Beyond)*" | Set-AudioDevice }
function ra { while ($(rvd | wc -l) -eq 0) { sleep 1; echo "waiting for headset connection..." } rvd; rrd; [console]::beep(440, 150); [console]::beep(440, 150); }
function rr { rvv; rrv }

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# starship
Invoke-Expression (&starship init powershell)

# Invoke-Expression "$(thefuck --alias)"
Invoke-Expression (&{ (rustup completions powershell | Out-String) })
Invoke-Expression (& { (zoxide init powershell | Out-String) })
