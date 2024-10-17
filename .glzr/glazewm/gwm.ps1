$cfg_path="$HOME\.glzr\glazewm"
$gwm="$cfg_path\gat-gwm.exe"
if (!(Test-Path $gwm -PathType Leaf)) {
  Invoke-WebRequest -OutFile  $gwm "https://github.com/ParasiteDelta/GAT-GWM/releases/download/0.3.1/gat-gwm.exe"
}
Start-Process $gwm
