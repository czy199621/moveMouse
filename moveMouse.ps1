# â¡?ël?ëÄçÏèäé˘ìIíˆèòèW
Add-Type -AssemblyName System.Windows.Forms

function Keep-Alive {
    param(
        # Maximum absolute offset in the horizontal (X) direction for each random mouse movement
        [int]$HorizontalMaxOffset = 10,
        # Maximum absolute offset in the vertical (Y) direction for each random mouse movement
        [int]$VerticalMaxOffset   = 10,
        
        # Minimum number of seconds to wait between movements
        [int]$MinIntervalSeconds  = 30,
        # Maximum number of seconds to wait between movements
        [int]$MaxIntervalSeconds  = 90
    )

    Write-Host "Starting random mouse movements..."
    Write-Host "Horizontal offset range: Å}$HorizontalMaxOffset, Vertical offset range: Å}$VerticalMaxOffset"
    Write-Host "Movement interval range: $MinIntervalSeconds - $MaxIntervalSeconds seconds"

    while ($true) {
        # Get the current cursor position
        $pos = [System.Windows.Forms.Cursor]::Position
        $x   = $pos.X
        $y   = $pos.Y

        # Generate random offset values
        $dx = Get-Random -Minimum (-1 * $HorizontalMaxOffset) -Maximum ($HorizontalMaxOffset + 1)
        $dy = Get-Random -Minimum (-1 * $VerticalMaxOffset)   -Maximum ($VerticalMaxOffset + 1)

        # Calculate the new coordinates and move the cursor
        $newX = $x + $dx
        $newY = $y + $dy
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($newX, $newY)

        # Randomly determine the wait time before the next move
        $sleepSeconds = Get-Random -Minimum $MinIntervalSeconds -Maximum ($MaxIntervalSeconds + 1)
        Write-Host "Moved to ($newX, $newY) - waiting $sleepSeconds seconds until the next move..."
        Start-Sleep -Seconds $sleepSeconds
    }
}

Keep-Alive -HorizontalMaxOffset 10 -VerticalMaxOffset 10 -MinIntervalSeconds 30 -MaxIntervalSeconds 90

