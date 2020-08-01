Function InstallMsftCamera {
	Write-Output "Installing Microsoft camera application..."
	Get-AppxPackage -AllUsers "Microsoft.WindowsCamera" | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
}

Function SetExplorerOpenSingleClick {
	Write-Output "Setting Explorer to open single click..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShellState" -Type Binary -Value ([byte[]](24,0,0,0,1f,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,13,0,0,0,0,0,0,0,62,0,0,0))
}