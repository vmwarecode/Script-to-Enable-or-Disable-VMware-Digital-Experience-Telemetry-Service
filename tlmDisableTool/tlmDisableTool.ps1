# ----------------------------------------------------------
# Copyright 2022 VMware, Inc.  All rights reserved. -- VMware Confidential
# ----------------------------------------------------------


# Change history:
# v1.0 - The intial version.



# -----------------------------------------------------------------------------
# Function PrintUsage
#
# Display the usage of the tlmDisableTool.
#
# -----------------------------------------------------------------------------

function PrintUsage()
{
    Write-Host "Usage:"
    Write-Host "    tlmDisable.bat <options> [args]`r`n"
    Write-Host "Options:"
    Write-Host "    -help`t`tDisplay the help information for the tool."
    Write-Host "    -disable`t`tStop and disable the DEEM Telemetry Service."
    Write-Host "    -enable`t`tEnable and start the DEEM Telemetry Service.`r`n"
}

# -----------------------------------------------------------------------------
# Function PrintHelpInfo
#
# Display the help information for the tlmTool
#
# -----------------------------------------------------------------------------

function PrintHelpInfo()
{
    Write-Host "tlmTool - Command line tool for disable or enable Deem Telemetry Service."
    Write-Host "          Note: The tool must be run as Administrator with proper execution policy set for PowerShell script."
    PrintUsage
}

# -----------------------------------------------------------------------------
# Function DisableDEEM
#
# Stop and disable the DEEM Service.
#
# -----------------------------------------------------------------------------

function DisableDEEM()
{
    sc.exe stop VMWOSQEXT
    sc.exe config VMWOSQEXT start=disabled
}

# -----------------------------------------------------------------------------
# Function EableDEEM
#
# Enable and start the DEEM Service.
#
# -----------------------------------------------------------------------------

function EableDEEM()
{
    sc.exe config VMWOSQEXT start=auto
    sc.exe start VMWOSQEXT
}


# Main function

switch ($args[0]) {
    "-help" {
        PrintHelpInfo
        break
    }
    "-disable" {
        DisableDEEM
        break
    }
    "-enable" {
        EableDEEM
        break
    }
    Default {
        Write-Host "Invalid parameters: '$args'."
        PrintUsage
    }
}
