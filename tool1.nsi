; 7z不给看
!packhdr temp.dat 'cmd /c Copy /B temp.dat /B +nosee.7z temp.dat'

; 安装程序初始定义常量
!define PRODUCT_NAME "Death Horizon Studio Skin Configuration Tool"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "Death Horizon Studio."
!define PRODUCT_WEB_SITE "http://deathhorizon.top"

SetCompressor lzma

; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI.nsh"

; MUI 预定义常量
!define MUI_ABORTWARNING
!define MUI_ICON "icon.ico"
!define MUI_WELCOMEPAGE_TITLE "Death Horizon Studio Skin Configuration Tool"
!define MUI_WELCOMEPAGE_TEXT "\r\n\r\n\r\n     这个程序是为不懂配置皮肤站的小白准备的，按步骤做就行啦ヽ(ˋ▽ˊ)ノ ，不多废话ヽ(ˋ▽ˊ)ノ 。 \r\n    当然，本工具开源，这是Github地址：https://github.com/LiarOnce/SkinConfigurationTool  "
!define MUI_WELCOMEFINISHPAGE_BITMAP "2001.bmp"

; 欢迎页面
!insertmacro MUI_PAGE_WELCOME
; 许可协议页面
!insertmacro MUI_PAGE_LICENSE "msaa.txt"
; 组件选择页面
!insertmacro MUI_PAGE_COMPONENTS
; 安装目录选择页面
!insertmacro MUI_PAGE_DIRECTORY
; 安装过程页面
!insertmacro MUI_PAGE_INSTFILES
; 安装完成页面
!insertmacro MUI_PAGE_FINISH

; 安装界面包含的语言设置
!insertmacro MUI_LANGUAGE "SimpChinese"

; 安装预释放文件
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI 现代界面定义结束 ------

Name "Death Horizon Studio Skin Configuration Tool"
OutFile "Tool.exe"
InstallDir "$PROGRAMFILES\"
ShowInstDetails show
DirText "在这里请一定要选择好Minecraft的游戏目录（.minecraft），这里默认Program Files路径，所以必须修改目录，必须修改目录，必须修改目录！！！！（重要的事说三遍）"
BrandingText "Death Horizon Studio"

Section "CustomSkinLoader 13.1+" SEC01
  SetOutPath "$INSTDIR\CustomSkinLoader\"
  SetOverwrite ifnewer
  File "CustomSkinLoader\13.1+\CustomSkinLoader.json"
SectionEnd

Section "CustomSkinLoader 13.1-" SEC02
  File "CustomSkinLoader\13.1-\skinurls.txt"
  File "CustomSkinLoader\13.1-\capeurls.txt"
SectionEnd

Section "UniSkinMod 1.2+" SEC03
  SetOutPath "$INSTDIR\config\"
  File "UniSkinMod\1.2+\UniSkinMod.cfg"
SectionEnd

Section "UniSkinMod 1.2-" SEC04
  File "UniSkinMod\1.2-\UniSkinMod.cfg"
SectionEnd

Section -Post
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "为CustomSkinLoader 13.1及以上版本提供补丁"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "为CustomSkinLoader 13.1以下版本提供补丁"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "为UniSkinMod 1.2及以上版本提供补丁"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "为UniSkinMod 1.2以下版本提供补丁"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

