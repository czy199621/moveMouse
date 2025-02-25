# ‰Á?‘l?‘€ìŠù“I’ö˜W
Add-Type -AssemblyName System.Windows.Forms

function Keep-Alive {
    param(
        # ?ŸŠ÷ˆÚ??C…•½•ûŒü•ÎˆÚ“IÅ‘å???
        [int]$HorizontalMaxOffset = 10,
        # ?ŸŠ÷ˆÚ??C‚’¼•ûŒü•ÎˆÚ“IÅ‘å???
        [int]$VerticalMaxOffset   = 10,
        
        # ?ŸˆÚ?‘l?@C‰ºˆêŸˆÚ?“IÅ’Z?Šu(•b)
        [int]$MinIntervalSeconds  = 30,
        # ?ŸˆÚ?‘l?@C‰ºˆêŸˆÚ?“IÅ??Šu(•b)
        [int]$MaxIntervalSeconds  = 90
    )

    Write-Host "?nŠ÷ˆÚ?‘l?..."
    Write-Host "…•½•ÎˆÚä—?: }$HorizontalMaxOffset, ‚’¼•ÎˆÚä—?: }$VerticalMaxOffset"
    Write-Host "ˆÚ??Šuä—?: $MinIntervalSeconds - $MaxIntervalSeconds •b"

    while ($true) {
        # æ“¾“–‘O‘l?ˆÊ’u
        $pos = [System.Windows.Forms.Cursor]::Position
        $x   = $pos.X
        $y   = $pos.Y

        # ?¶Š÷•ÎˆÚ—Ê (’ˆÓ: Get-Random -Minimum X -Maximum Y æ?ä—?¥ [X, Y-1])
        $dx = Get-Random -Minimum (-1 * $HorizontalMaxOffset) -Maximum ($HorizontalMaxOffset + 1)
        $dy = Get-Random -Minimum (-1 * $VerticalMaxOffset)   -Maximum ($VerticalMaxOffset + 1)

        # ?Z›óˆÚ?“V¿?
        $newX = $x + $dx
        $newY = $y + $dy
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($newX, $newY)

        # Š÷™r’è‰ºŸˆÚ?‘O“I‹x–°??
        $sleepSeconds = Get-Random -Minimum $MinIntervalSeconds -Maximum ($MaxIntervalSeconds + 1)
        Write-Host "ˆÚ?“ ($newX, $newY) - ‰ºŸˆÚ?«İ $sleepSeconds •b@"
        Start-Sleep -Seconds $sleepSeconds
    }
}

# ”@‰Ê‘z’¼Ú?s”Ÿ”C‰ÂæÁˆÈ‰º’?F
Keep-Alive -HorizontalMaxOffset 10 -VerticalMaxOffset 10 -MinIntervalSeconds 30 -MaxIntervalSeconds 90

