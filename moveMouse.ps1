Add-Type -AssemblyName System.Windows.Forms

function Move-MouseRandom {
    # ?�擖�O�l?�ʒu
    $pos = [System.Windows.Forms.Cursor]::Position
    $x = $pos.X
    $y = $pos.Y

    # ?�������ΈڗʁC�?�� -10 �� 10 �V?
    $dx = Get-Random -Minimum -10 -Maximum 10
    $dy = Get-Random -Minimum -10 -Maximum 10

    # ��?�l?���V�I�ʒu
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x + $dx, $y + $dy)
}

while ($true) {
    Move-MouseRandom
    Start-Sleep -Seconds 60
}
