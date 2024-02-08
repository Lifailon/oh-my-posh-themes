function Set-EnvVariable {
    $env:BATTERY = "$($(Get-CimInstance -Class Win32_Battery).EstimatedChargeRemaining)"
    $env:CPU_USE = "$([string]$(Get-CimInstance Win32_PerfFormattedData_PerfOS_Processor | Where-Object Name -eq "_Total").PercentProcessorTime)"
    $Memory = Get-CimInstance Win32_OperatingSystem
    $MemUse = $Memory.TotalVisibleMemorySize - $Memory.FreePhysicalMemory
    $env:MEM_USE = "$([int](($MemUse / $Memory.TotalVisibleMemorySize) * 100))"
	$NetworkInterface = Get-CimInstance -ClassName Win32_PerfFormattedData_Tcpip_NetworkInterface
    $env:NET_Up = $($NetworkInterface.BytesSentPersec/1mb).ToString("0.000")
    $env:NET_Down = $($NetworkInterface.BytesReceivedPersec/1mb).ToString("0.000")
}
New-Alias -Name "Set-PoshContext" -Value "Set-EnvVariable" -Scope Global -Force
oh-my-posh init pwsh --config "https://raw.githubusercontent.com/Lifailon/oh-my-posh-themes/rsa/themes/System-Performance.omp.json" | Invoke-Expression
