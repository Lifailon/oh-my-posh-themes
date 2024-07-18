function Global:Set-EnvVariable {
    $GetProcess = Get-Process
    $ProcessPwsh = $GetProcess | Where-Object name -like pwsh
    $env:POSH_RUN_TIME = $([string]([datetime](Get-Date) - $($ProcessPwsh | Where-Object id -eq $($env:POSH_PID)).StartTime) -replace "\.\d+$")
    $env:POSH_PROC_TIME = $($ProcessPwsh | Where-Object id -eq $($env:POSH_PID)).TotalProcessorTime.ToString() -replace "\..+"
    $env:POSH_MEM_USE = $($($ProcessPwsh | Where-Object id -eq $($env:POSH_PID)).WorkingSet / 1mb).ToString("0")
    $env:POSH_MEM_USE_ALL = $($($ProcessPwsh | Measure-Object WorkingSet -sum).sum / 1mb).ToString("0")
    $env:POSH_PROCESS_COUNT = $ProcessPwsh.Count
    $env:PROC_MEM_USE_ALL = $($($GetProcess | Measure-Object WorkingSet -sum).sum / 1mb).ToString("0")
    $env:ALL_PROCESS_COUNT = $GetProcess.Count
    $env:POSH_JOB_COUNT = $(Get-Job).Count
    $env:POSH_JOB_RUNNING = $(Get-Job -State Running).Count
    $env:POSH_JOB_COMPLETED = $(Get-Job -State Completed).Count
    $env:POSH_JOB_FAILED = $(Get-Job -State Failed).Count
}
New-Alias -Name "Set-PoshContext" -Value "Set-EnvVariable" -Scope Global -Force
oh-my-posh init pwsh --config 'C:\Users\Lifailon\AppData\Local\Programs\oh-my-posh\themes\Pwsh-Process-Performance.omp.json' | Invoke-Expression

