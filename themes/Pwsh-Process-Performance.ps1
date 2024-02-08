function Set-EnvVariable {
    $GetProcess = Get-Process pwsh
    $env:POSH_RUN_TIME = $([string]([datetime](Get-Date) - $($GetProcess | Where-Object id -eq $($env:POSH_PID)).StartTime) -replace "\.\d+$")
    $env:POSH_PROC_TIME = $($GetProcess | Where-Object id -eq $($env:POSH_PID)).TotalProcessorTime.ToString() -replace "\..+"
    $env:POSH_MEM_USE = $($($GetProcess | Where-Object id -eq $($env:POSH_PID)).WorkingSet / 1mb).ToString("0")
    $env:POSH_MEM_USE_ALL = $($($GetProcess | Measure-Object WorkingSet -sum).sum / 1mb).ToString("0")
    $env:POSH_PROCESS_COUNT = $GetProcess.Count
}
New-Alias -Name "Set-PoshContext" -Value "Set-EnvVariable" -Scope Global -Force
oh-my-posh init pwsh --config "https://raw.githubusercontent.com/Lifailon/oh-my-posh-themes/rsa/themes/Pwsh-Process-Performance.omp.json" | Invoke-Expression
