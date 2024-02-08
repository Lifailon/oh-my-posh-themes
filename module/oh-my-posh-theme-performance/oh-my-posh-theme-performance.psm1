function Set-PoshTheme {
    param (
        [Parameter(Mandatory)][ValidateSet(
            "System-Sensors",
            "System-Performance",
            "Pwsh-Process-Performance"
        )]$Theme,
        [switch]$Save
    )
    Invoke-Expression $(
        Invoke-RestMethod https://raw.githubusercontent.com/Lifailon/oh-my-posh-themes-performance/rsa/themes/$Theme.ps1
    )
}