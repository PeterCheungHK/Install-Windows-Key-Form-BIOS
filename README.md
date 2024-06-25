# Windows License Management Script Windows 授權管理腳本

This repository contains a script to manage Windows licenses. It includes steps to uninstall the current license, retrieve the original product key, and reinstall the license using the retrieved key.

由於使用 Ghost/Acronis/Clonezilla 恢復備份映像，產品序號識別可能不正確導致在啟動期間彈出視窗中顯示硬體設備已變更。
此儲存庫包含一個用於管理 Windows 授權的腳本。它包括卸載目前許可證、檢索原始產品金鑰以及使用檢索到的金鑰重新安裝許可證的步驟。

The script only works on brand computers
腳本只適用於品牌電腦

## Steps 步驟

### 1. Uninstall the Current License 卸載目前許可證

Use the following command to uninstall the current Windows license:
使用以下命令卸載目前的 Windows 許可證：

```bash
slmgr /upk
```

### 2. Retrieve the Original Product Key  檢索原始產品金鑰

Run the following command to query the original product key and store it in a variable:

運行以下命令檢索原始產品金鑰並將其存儲在變數中：

```powershell
$OriginalProductKey = (wmic path softwarelicensingservice get OA3xOriginalProductKey | findstr /v "OA3xOriginalProductKey").Trim()
```

### 3. Install the License Using the Retrieved Key  使用檢索到的金鑰安裝許可證

Use the following command to install the license using the key stored in the variable:

使用以下命令安裝存儲在變數中的許可證金鑰：

```bash
slmgr /ipk $OriginalProductKey
```

## Full Script  完整腳本

Here's the full script combining all the steps:

以下是結合所有步驟的完整腳本：

```powershell
# Uninstall the current license
slmgr /upk

# Retrieve the original product key and store it in a variable
$OriginalProductKey = (wmic path softwarelicensingservice get OA3xOriginalProductKey | findstr /v "OA3xOriginalProductKey").Trim()

# Install the license using the retrieved key
slmgr /ipk $OriginalProductKey
```

## Usage  使用方法

1. Open a PowerShell window with administrative privileges.

   以管理員身份打開 PowerShell 視窗。

   
3. Copy and paste the script into the PowerShell window.
   
   將腳本複製並粘貼到 PowerShell 視窗中。
   
6. Press Enter to execute the script.

   按 Enter 鍵執行腳本。

This will uninstall the current license, retrieve the original product key, and reinstall the license using the retrieved key.

這將卸載當前的許可證，檢索原始產品金鑰，並使用檢索到的金鑰重新安裝許可證。

## Notes  注意事項

- Ensure you run the PowerShell as an administrator to avoid permission issues.
- This script is intended for use on Windows operating systems.

- 確保以管理員身份運行 PowerShell 以避免權限問題。
- 此腳本僅適用於 Windows 操作系統。
