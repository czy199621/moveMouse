Add-Type -AssemblyName System.Windows.Forms

function Move-MouseRandom {
    # ?取当前鼠?位置
    $pos = [System.Windows.Forms.Cursor]::Position
    $x = $pos.X
    $y = $pos.Y

    # ?生随机偏移量，范?在 -10 到 10 之?
    $dx = Get-Random -Minimum -10 -Maximum 10
    $dy = Get-Random -Minimum -10 -Maximum 10

    # 移?鼠?到新的位置
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x + $dx, $y + $dy)
}

while ($true) {
    Move-MouseRandom
    Start-Sleep -Seconds 60
}
