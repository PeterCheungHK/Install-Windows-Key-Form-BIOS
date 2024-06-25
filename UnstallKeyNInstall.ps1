# Uninstall the current license
slmgr /upk

# Retrieve the original product key and store it in a variable
$OriginalProductKey = (wmic path softwarelicensingservice get OA3xOriginalProductKey | findstr /v "OA3xOriginalProductKey").Trim()

# Install the license using the retrieved key
slmgr /ipk $OriginalProductKey