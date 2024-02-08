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
    if ($Save) {
        $Path = "$home\AppData\Local\Programs\oh-my-posh\themes\$theme.omp.json"
        $ThemeJson   = $(Invoke-WebRequest https://raw.githubusercontent.com/Lifailon/oh-my-posh-themes-performance/rsa/themes/$Theme.omp.json).Content
        $ThemeJson   | Out-File $Path
        $ThemeScript = $(Invoke-WebRequest https://raw.githubusercontent.com/Lifailon/oh-my-posh-themes-performance/rsa/themes/$Theme.ps1).Content
        $ThemeScript = $ThemeScript -replace 'oh-my-posh init pwsh --config ".+"',"oh-my-posh init pwsh --config '$Path'"
        $ThemeScript | Out-File $Profile
    }
}