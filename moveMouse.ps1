# ��?�l?���쏊���I�����W
Add-Type -AssemblyName System.Windows.Forms

function Keep-Alive {
    param(
        # ?��������??�C���������ΈړI�ő�???
        [int]$HorizontalMaxOffset = 10,
        # ?��������??�C���������ΈړI�ő�???
        [int]$VerticalMaxOffset   = 10,
        
        # ?����?�l?�@�C���ꎟ��?�I�ŒZ?�u(�b)
        [int]$MinIntervalSeconds  = 30,
        # ?����?�l?�@�C���ꎟ��?�I��??�u(�b)
        [int]$MaxIntervalSeconds  = 90
    )

    Write-Host "?�n������?�l?..."
    Write-Host "�����Έ��?: �}$HorizontalMaxOffset, �����Έ��?: �}$VerticalMaxOffset"
    Write-Host "��??�u�?: $MinIntervalSeconds - $MaxIntervalSeconds �b"

    while ($true) {
        # �擾���O�l?�ʒu
        $pos = [System.Windows.Forms.Cursor]::Position
        $x   = $pos.X
        $y   = $pos.Y

        # ?�������Έڗ� (����: Get-Random -Minimum X -Maximum Y ��?�?�� [X, Y-1])
        $dx = Get-Random -Minimum (-1 * $HorizontalMaxOffset) -Maximum ($HorizontalMaxOffset + 1)
        $dy = Get-Random -Minimum (-1 * $VerticalMaxOffset)   -Maximum ($VerticalMaxOffset + 1)

        # ?�Z���?���V��?
        $newX = $x + $dx
        $newY = $y + $dy
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($newX, $newY)

        # �����r�艺����?�O�I�x��??
        $sleepSeconds = Get-Random -Minimum $MinIntervalSeconds -Maximum ($MaxIntervalSeconds + 1)
        Write-Host "��?�� ($newX, $newY) - ������?���� $sleepSeconds �b�@"
        Start-Sleep -Seconds $sleepSeconds
    }
}

# �@�ʑz����?�s�����C����ȉ���?�F
Keep-Alive -HorizontalMaxOffset 10 -VerticalMaxOffset 10 -MinIntervalSeconds 30 -MaxIntervalSeconds 90

