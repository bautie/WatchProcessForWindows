# watchProcess
#  pythonのプロセス数が変化したときに音を鳴らす
#  powershell.exe -ExecutionPolicy RemoteSigned .\watchProcess.ps1

$targets = "python", "ffmpeg"

$numProcs = 0;


while( $true ) {

    $lastNumProcs = $numProcs;
    $numProcs = 0;

    foreach( $target in $targets ) {
        $procs = Get-Process -Name $target -ErrorAction SilentlyContinue
        foreach( $proc in $procs ) {
            $numProcs ++
        }
    }

    if ( $lastNumProcs -lt $numProcs ) { # Start
        [Console]::Beep( 400, 50 )
        [Console]::Beep( 400, 50 )
    } elseif ( $lastNumProcs -gt $numProcs ) { # End
        [Console]::Beep( 1500, 200 )
        [Console]::Beep( 1800, 200 )
        [Console]::Beep( 1900, 200 )
    }

    Write-Host -NoNewline " :" $numProcs
    Start-Sleep -Seconds 5

}
