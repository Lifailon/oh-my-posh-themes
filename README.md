# Themes performance for oh-my-posh

[![GitHub Release](https://img.shields.io/github/v/release/Lifailon/oh-my-posh-themes-performance?display_name=release&logo=GitHub&label=GitHub&link=https%3A%2F%2Fgithub.com%2FLifailon%2Foh-my-posh-themes-performance%2F)](https://github.com/Lifailon/oh-my-posh-themes-performance)
[![NuGet Version](https://img.shields.io/nuget/v/themes-performance?logo=NuGet&label=NuGet&link=https%3A%2F%2Fwww.nuget.org%2Fpackages%2Fthemes-performance)](https://www.nuget.org/packages/themes-performance)
[![GitHub top language](https://img.shields.io/github/languages/top/Lifailon/oh-my-posh-themes-performance?logo=PowerShell&link=https%3A%2F%2Fgithub.com%2FPowerShell%2FPowerShell)](https://github.com/PowerShell/PowerShell)

Themes for [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) displaying system performance sensors (current speed of network interfaces, CPU load and temperature, and PowerShell Core processes activity). You use the PowerShell module to update and save the theme.

Themes:
- [System-Sensors](#system-sensors)
- [System-Performance](#system-performance)
- [Pwsh-Process-Performance](#pwsh-process-performance)

![Image alt](https://github.com/Lifailon/oh-my-posh-themes-performance/blob/rsa/image/Example.jpg)

## 🚀 Install

[Install oh-my-posh](https://ohmyposh.dev/docs/installation/windows) package any way you like, if you haven't already done so. Example, if you are not using a package manager, like this:

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
```

Install the module from the [NuGet repository](https://www.nuget.org/packages/themes-performance):

```PowerShell
Install-Module themes-performance -Repository NuGet
Import-Module themes-performance
```

💡 You must have a NuGet repository registered:

```PowerShell
Register-PSRepository -Name "NuGet" -SourceLocation "https://www.nuget.org/api/v2" -InstallationPolicy Trusted
```

Choose a theme (theme and script is loaded directly from the GitHub repository, nothing is saved in the system):

```PowerShell
Set-PoshTheme -Theme System-Sensors
Set-PoshTheme -Theme System-Performance
Set-PoshTheme -Theme Pwsh-Process-Performance
```

To save the theme to the system for offline use and set it as the default profile, use the `Save` parameter.

💡 Note, this will overwrite your default profile (You can check its contents using the command: `notepad $Profile`).

```PowerShell
Set-PoshTheme -Theme System-Sensors -Save
Set-PoshTheme -Theme System-Performance -Save
Set-PoshTheme -Theme Pwsh-Process-Performance -Save
```

## System-Sensors

Get sensors from the running [LibreHardwareMonitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor) application instance via WMI/CIM (Common Information Model).

💡 For this theme to work, you need to have **LibreHardwareMonitor** installed and running.

```PowerShell
⌚ 11:51 ⌛ 0ms 📁 ~   💡 CPU: 13% (0/99) | 60°C (42/98) | MEM: 54% (8/15Gb) | ⬇ 0,025 Mbyte/s ⬆ 0,051 Mbyte/s
>
```

Displays sensors for CPU load and temperature, as well as the download and upload speed of the active network interface (if several network adapters are used, the activity of the busiest one will be displayed).

## System-Performance

Get performance data directly from the system through **WMI/CIM**. Works noticeably slower when compared to the **System-Sensors** theme. No dependencies required.

```PowerShell
⌚ 11:52 ⌛ 0ms 📁 ~   🔋 100% | CPU: 6% | MEM: 54% | ⬇ 34,868 Mbyte/s ⬆ 0,499 Mbyte/s
>
```

## Pwsh-Process-Performance

Performance of PowerShell Core processes.

```PowerShell
⌚ 11:53 ⌛ 0ms 📁 ~   💡 00:01:24 (00:00:03) | Jobs: 0/3 (✅3/❌0) | WS: 130/370Mb (3) | MEM: 52% (8/15Gb)
>
```

💡 **Description:** Running time of the currently running process pwsh (CPU time consumption of the current process) | Number of background jobs: Running/All count (Completed/Failed) | Working set of physical memory of the current process/all running processes pwsh (total number of running processes pwsh) | RAM from sysinfo (via the oh-my-posh plug-in)

## 📊 Example

![Image alt](https://github.com/Lifailon/oh-my-posh-themes-performance/blob/rsa/image/Example.gif)
