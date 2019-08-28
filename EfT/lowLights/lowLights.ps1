##### It's not a real tool unless it has ascii art...
#  _               _     _       _     _                    __  
# | |             | |   (_)     | |   | |                  /  | 
# | | _____      _| |    _  __ _| |__ | |_ ___   _ __  ___ `| | 
# | |/ _ \ \ /\ / / |   | |/ _` | '_ \| __/ __| | '_ \/ __| | | 
# | | (_) \ V  V /| |___| | (_| | | | | |_\__ \_| |_) \__ \_| |_
# |_|\___/ \_/\_/ \_____/_|\__, |_| |_|\__|___(_) .__/|___/\___/
#                           __/ |               | |             
#                          |___/                |_|   
# May need to allow scripts to be run.  Use following commands to set and check execution policy.
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted
# Get-ExecutionPolicy
# Must state "Unrestricted"
#####

# Initialize global var previousCount to store "previous count of files"
$global:previousCount = 0

# Enable easy-mode filepath variables.
$audioFile = 'C:\Path\To\Audio\file.wav'
$highlightsDir = 'C:\Path\To\Nvidia\Highlights\Directory\'

# Function modifies previousCount and plays audio.  
function incrementAndAudio
    {
    $global:previousCount = $currentCount
    $PlayWav=New-Object System.Media.SoundPlayer
    $PlayWav.SoundLocation=$audioFile
    $PlayWav.playsync()
    }

while($true)
    {
    # Do for fucking ever.  You know what a while($true) does, you idiot.  Why are you reading this?
    sleep 3
    $currentCount =  (Get-ChildItem $highlightsDir | Measure-Object).Count
    Write-Host ("`n+++++++++++++++++++")
    Write-Host ("currentCount = " + $currentCount)
    Write-Host ("previousCount = " + $previousCount)

    if ($currentCount -gt $previousCount)
        {
        # New file in directory.  Kill (or player death) confirmed.
        incrementAndAudio
        }

    if ($currentCount -eq 0)
        {
        # No files in directory.  Highlights have been deleted.  Reset counters for next match.
        $global:previousCount = 0
        }
    }
