# oh-my-posh-themes-performance

Themes for [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) displaying system performance sensors. You can use the PowerShell module to update and save the theme.

Themes:
- [System-Sensors](#system-sensors)
- [System-Performance](#system-performance)
- [Pwsh-Process-Performance](#pwsh-process-performance)

## 🚀 Install

[Install oh-my-posh](https://ohmyposh.dev/docs/installation/windows) package any way you like, if you haven't already done so.

Install the module from the [NuGet repository](https://www.nuget.org/packages/themes-performance):

```PowerShell
Install-Module themes-performance -Repository NuGet
Import-Module themes-performance
```

Choose a theme (theme is loaded directly from the GitHub repository):

```PowerShell
Set-PoshTheme -Theme System-Sensors
Set-PoshTheme -Theme System-Performance
Set-PoshTheme -Theme Pwsh-Process-Performance
```

To save the theme to the system for offline use and set it as the default profile, use the `Save` parameter.

💡 Note, this will overwrite your default profile

```PowerShell
Set-PoshTheme -Theme System-Sensors -Save
Set-PoshTheme -Theme System-Performance -Save
Set-PoshTheme -Theme Pwsh-Process-Performance -Save
```

## System-Sensors

Get sensors from the running [LibreHardwareMonitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor) application instance via WMI/CIM (Common Information Model).

💡 For this theme to work, you need to have LibreHardwareMonitor installed and running.

```PowerShell
⌚ 13:48 ⌛ 2ms 📁 ~     CPU: 17% (11/63) | 81°C (74/100) | MEM: 79% (12/15Gb) | ⬇ 0,032 Mbyte/s ⬆ 0,003 Mbyte/s
>
```

Displays sensors for CPU load and temperature, as well as the download and upload speed of the active network interface.

## System-Performance

Get performance data directly from the system through **WMI/CIM**. Works noticeably slower when compared to the **System-Sensors** theme. No dependencies required.

```PowerShell
⌚ 13:48 ⌛ 2ms 📁 ~     🔋 64% | CPU: 17% | MEM: 80% | ⬇ 0,012 Mbyte/s ⬆ 0,002 Mbyte/s
>
```

## Pwsh-Process-Performance

Performance of PowerShell Core processes.

```PowerShell
⌚ 13:48 ⌛ 2ms 📁 ~     00:10:51 (00:00:03) | WS: 131/429Mb (4) | MEM: 80% (12/15Gb)
>
```

Running time of the currently running process pwsh (CPU time consumption of the current process) | Working set of physical memory of the current process/all running processes pwsh (total number of running processes pwsh) | RAM from sysinfo (via the oh-my-posh plug-in)