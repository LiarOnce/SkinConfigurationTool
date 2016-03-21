; 7z������
!packhdr temp.dat 'cmd /c Copy /B temp.dat /B +nosee.7z temp.dat'

; ��װ�����ʼ���峣��
!define PRODUCT_NAME "Death Horizon Studio Skin Configuration Tool"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "Death Horizon Studio."
!define PRODUCT_WEB_SITE "http://deathhorizon.top"

SetCompressor lzma

; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "icon.ico"
!define MUI_WELCOMEPAGE_TITLE "Death Horizon Studio Skin Configuration Tool"
!define MUI_WELCOMEPAGE_TEXT "\r\n\r\n\r\n     ���������Ϊ��������Ƥ��վ��С��׼���ģ����������������c(�A���@)�� ������ϻ��c(�A���@)�� �� \r\n    ��Ȼ�������߿�Դ������Github��ַ��https://github.com/LiarOnce/SkinConfigurationTool  "
!define MUI_WELCOMEFINISHPAGE_BITMAP "2001.bmp"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "msaa.txt"
; ���ѡ��ҳ��
!insertmacro MUI_PAGE_COMPONENTS
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!insertmacro MUI_PAGE_FINISH

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

; ��װԤ�ͷ��ļ�
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �ִ����涨����� ------

Name "Death Horizon Studio Skin Configuration Tool"
OutFile "Tool.exe"
InstallDir "$PROGRAMFILES\"
ShowInstDetails show
DirText "��������һ��Ҫѡ���Minecraft����ϷĿ¼��.minecraft��������Ĭ��Program Files·�������Ա����޸�Ŀ¼�������޸�Ŀ¼�������޸�Ŀ¼������������Ҫ����˵���飩"
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

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "ΪCustomSkinLoader 13.1�����ϰ汾�ṩ����"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "ΪCustomSkinLoader 13.1���°汾�ṩ����"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "ΪUniSkinMod 1.2�����ϰ汾�ṩ����"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "ΪUniSkinMod 1.2���°汾�ṩ����"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

