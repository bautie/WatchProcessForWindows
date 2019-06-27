# watchProcess
#  pythonのプロセス数が変化したときに音を鳴らす
#  powershell.exe -ExecutionPolicy RemoteSigned .\watchProcess.ps1

$numProcs = 0;

while( $true ) {

    $procs = Get-Process -Name "python" -ErrorAction SilentlyContinue

    $lastNumProcs = $numProcs;
    $numProcs = 0;

    foreach( $proc in $procs ) {
        $numProcs ++
    }

    if ( $lastNumProcs -lt $numProcs ) { # Start
        [Console]::Beep( 400, 150 )
        [Console]::Beep( 400, 150 )
    } elseif ( $lastNumProcs -gt $numProcs ) { # End
        [Console]::Beep( 1700, 300 )
        [Console]::Beep( 1800, 300 )
        [Console]::Beep( 1900, 300 )
    }

    Write-Host -NoNewline " :" $numProcs
    Start-Sleep -Seconds 5

}
