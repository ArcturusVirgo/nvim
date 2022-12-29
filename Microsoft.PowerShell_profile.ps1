#------------------------------- Import Modules BEGIN -------------------------------
Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/emodipt-extend.omp.json" | Invoke-Expression
#------------------------------- Import Modules END   -------------------------------



#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置预测文本来源为历史记录
Set-PSReadLineOption -PredictionSource History

# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
# Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

# 设置 Ctrl+z 为撤销
# Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#-------------------------------  Set Hot-keys END    -------------------------------





#-------------------------------    Functions BEGIN   -------------------------------
# Python 直接执行
# $env:PATHEXT += ";.py"

# 更新系统组件
# function Update-Packages {
# 	# update pip
# 	Write-Host "Step 1: 更新 pip" -ForegroundColor Magenta -BackgroundColor Cyan
# 	$a = pip list --outdated
# 	$num_package = $a.Length - 2
# 	for ($i = 0; $i -lt $num_package; $i++) {
# 		$tmp = ($a[2 + $i].Split(" "))[0]
# 		pip install -U $tmp
# 	}

# 	# update TeX Live
# 	$CurrentYear = Get-Date -Format yyyy
# 	Write-Host "Step 2: 更新 TeX Live" $CurrentYear -ForegroundColor Magenta -BackgroundColor Cyan
# 	tlmgr update --self
# 	tlmgr update --all

# 	# update Chocolotey
# 	Write-Host "Step 3: 更新 Chocolatey" -ForegroundColor Magenta -BackgroundColor Cyan
# 	choco outdated
# }
#-------------------------------    Functions END     -------------------------------





#-------------------------------   Set Alias BEGIN    -------------------------------
# 1. 编译函数 make
# function MakeThings {
# 	nmake.exe $args -nologo
# }
# Set-Alias -Name make -Value MakeThings

# 2. 更新系统 os-update
# Set-Alias -Name os-update -Value Update-Packages

# 3. 查看目录 ls & ll
# function ListDirectory {
# 	(Get-ChildItem).Name
# 	Write-Host("")
# }
# Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ls -Value Get-ChildItem

# 4. 打开当前工作目录
function OpenCurrentFolder {
	param
	(
		# 输入要打开的路径
		# 用法示例：open C:\
		# 默认路径：当前工作文件夹
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder
Set-Alias -Name v -Value nvim  # 使用 v 打开 nvim
Set-Alias -Name c -Value cls  # 使用 c 清屏
#-------------------------------    Set Alias END     -------------------------------





#-------------------------------   Set Network BEGIN    -------------------------------
# 1. 获取所有 Network Interface
# function Get-AllNic {
# 	Get-NetAdapter | Sort-Object -Property MacAddress
# }
# Set-Alias -Name getnic -Value Get-AllNic

# # 2. 获取 IPv4 关键路由
# function Get-IPv4Routes {
# 	Get-NetRoute -AddressFamily IPv4 | Where-Object -FilterScript {$_.NextHop -ne '0.0.0.0'}
# }
# Set-Alias -Name getip -Value Get-IPv4Routes

# # 3. 获取 IPv6 关键路由
# function Get-IPv6Routes {
# 	Get-NetRoute -AddressFamily IPv6 | Where-Object -FilterScript {$_.NextHop -ne '::'}
# }
# Set-Alias -Name getip6 -Value Get-IPv6Routes
#-------------------------------    Set Network END     -------------------------------



# 调用批处理(.bat)脚本，并保留生成的环境变量
function Invoke-Environment(){
    param(
        [Parameter(Mandatory=1)][string]$Command   # 待执行的脚本文件或命令
    )

    # 执行批处理脚本，最后调用set指令返回环境变量
	foreach($_ in cmd /c " `"$Command`" > null 2>&1 && SET") {
    #foreach($_ in cmd /c) {
        if ($_ -match '^([^=]+)=(.*)') {
            [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2])
        }
    }
	rm null
}
