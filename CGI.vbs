SET  ::WM_LBUTTONDOWN=0x0201
SET  ::WM_LBUTTONDBLCLK=0x0203
SET  ::WM_MOUSEHOVER=0x02A1
SET  ::WM_MOUSELEAVE=0x02A3
TEAM ENVI &&vFORM=|ENVI &&LnvFORM=|ENVI &&PARTSEL1=|ENVI &&PARTSEL2=|ENVI &&PARTSEL5=|ENVI &&CheckGHOSize=0
TEAM ENVI &&P2PList=|ENVI &&FFDrv=|ENVI$ &&NLDD=0d 0a|ENVI$ &&NLHH=0a|ENVI$ &&TAB=09|ENVI &&GinCD=|ENVI &&ahCHECK=|ENVI &&PEPOS=0
TEAM ENVI &&HDMHINFO=|ENVI &&HDSEL=|ENVI &&HDLIST=|ENVI &&IsWOW64=WOW32|ENVI &&PLIST1ITEM=|ENVI &&DLIST1ITEM=|ENVI &&ILIST1ITEM=
TEAM ENVI &&HDSizeSel=|ENVI &&HDModelSel=|ENVI &&FlagUI=0|ENVI &&KillVD=0|ENVI &&CGIDirESDList=|ENVI &&CGIDirLevel=0
TEAM ENVI &&SHUTorREBOOT=0|ENVI &&DynOSVolume=|ENVI &&DynCopy=0|ENVI &&DrvLettBackup=|ENVI &&SRCDrvLett=|ENVI &&DSTDrvLett=
TEAM ENVI &&SystemNumber=|ENVI &&BackupNum=|ENVI &&SysDrvNum=|ENVI &&SysPartNum=|ENVI &&BKDefaultPath=|ENVI &&BKPARTDRV=
TEAM ENVI &&pBusType=0|ENVI &&PartCPYNoIDE=|ENVI &&hBusType=0|ENVI &&HDCPYNoIDE=|ENVI &&PESysDrv=|ENVI &&OKSysDrv=|ENVI &&I=0
TEAM ENVI &&SYSVERSION=0|ENVI &&VERNUM=|ENVI &&FromConfig=0|ENVI &&CGIEXEDir=|ENVI &&CGIDirGHOList=|ENVI &&CGIDirGHO=|ENVI &&CGIDirWIMList=
TEAM ENVI &&BGHOPATH=|ENVI &&FullPath=|ENVI &&KillGHOFlag=0|ENVI &&OldGHOExist=0|ENVI &&OldGHOTime=0|ENVI &&CheckGHOTime=0
REGI $HKLM\SYSTEM\CurrentControlSet\Control\SystemStartOptions,&&PEorNOT
LPOS* &PEPOS=minint,1,%&PEorNOT%
SHOW =1 &
CALL @MHGHO2012
IFEX $%&KillVD%=1,CALL DoVirtualDrive
IFEX $%&SHUTorREBOOT%=1,CALL MyPowerOff
IFEX $%&SHUTorREBOOT%=2,CALL MyRestart
TEAM ENVI &vFORM=|ENVI &LnvFORM=|ENVI &PARTSEL1=|ENVI &PARTSEL2=|ENVI &PARTSEL5=
TEAM ENVI &P2PList=|ENVI &FFDrv=||ENVI$ &NLDD=|ENVI$ &NLHH=|ENVI$ &TAB=|ENVI &GinCD=|ENVI &ahCHECK=|ENVI &PEPOS=
TEAM ENVI &HDMHINFO=|ENVI &HDSEL=|ENVI &HDLIST=|ENVI &IsWOW64=|ENVI &PLIST1ITEM=|ENVI &DLIST1ITEM=|ENVI &ILIST1ITEM=
TEAM ENVI &HDSizeSel=|ENVI &HDModelSel=|ENVI &FlagUI=|ENVI &KillVD=|ENVI &CGIDirESDList=|ENVI &CGIDirLevel=
TEAM ENVI &SHUTorREBOOT=|ENVI &DynOSVolume=|ENVI &DynCopy=|ENVI &DrvLettBackup=|ENVI &SRCDrvLett=|ENVI &DSTDrvLett=
TEAM ENVI &SystemNumber=|ENVI &BackupNum=|ENVI &SysDrvNum=|ENVI &SysPartNum=|ENVI &BKDefaultPath=|ENVI &BKPARTDRV=
TEAM ENVI &pBusType=|ENVI &PartCPYNoIDE=|ENVI &hBusType=|ENVI &HDCPYNoIDE=|ENVI &PESysDrv=|ENVI &OKSysDrv=|ENVI &I=
TEAM ENVI &SYSVERSION=|ENVI &VERNUM=|ENVI &FromConfig=|ENVI &CGIEXEDir=|ENVI &CGIDirGHOList=|ENVI &CGIDirGHO=|ENVI &CGIDirWIMList=
TEAM ENVI &BGHOPATH=|ENVI &FullPath=|ENVI &KillGHOFlag=|ENVI &OldGHOExist=|ENVI &OldGHOTime=|ENVI &CheckGHOTime=|ENVI &CheckGHOSize=

_SUB DoVirtualDrive
    EXEC =*ImDisk.exe -D -m %&FFDrv%: 
_END

_SUB MyPowerOff
    IFEX $%&PEPOS%=0,EXEC shutdown.exe /s /t 0!%SystemRoot%\System32\PECMD.EXE SHUT
    WAIT 3000
    SHUT
    WAIT 5000
    SHUT SHUTDOWN -s
_END

_SUB MyRestart
    IFEX $%&PEPOS%=0,EXEC shutdown.exe /r /t 0!%SystemRoot%\System32\PECMD.EXE SHUT R
    WAIT 3000
    SHUT R
    WAIT 5000
    SHUT SHUTDOWN -r
_END

_SUB Page1,W472H376,P1,,,#
    ENVI &&TITLE=+40:���%&TAB%+40:�̷�%&TAB%=65:�ܴ�С%&TAB%=70:���ÿռ�%&TAB%+70:��������%&TAB%+70:�ļ�ϵͳ%&TAB%80:  ���
    GROU GHOGROU1,L10T6W454H60
    LABE REBK,L18T20W440H18,1.��ѡ����Ҫ���еĲ�����
    RADI RERADI,L34T40W110H20,��ԭ����,CALL MAKEVIS1,1
    RADI BKRADI,L152T40W110H20,���ݷ���,CALL MAKEVIS2,0
    RADI PART2PART,L268T40W110H20,�����Կ�,CALL MAKEVIS3,0
    GROU GHOGROU2,L10T68W454H140
    LABE PLABE,L18T82W250H18,2.��ѡ���������������������
    LABE -left ShowSysDrv,L270T82W190H18,,,0xFF0000
    TABL GHOSTABL,L18T100W435H100,%&TITLE%,,0x100c0   
    GROU GHOGROU3,L10T210W454H58
    LABE RETIP,L18T224W240H16,3.��ѡ�����ļ���
    LIST -h GHOLIST,L18T240W415H200,,TEAM ENVI. @STATUS3=��ѡ·��/�ļ���%GHOLIST%|CALL WIMGICHECK "%GHOLIST%",,0x10100   
    ITEM ReBUTTON,L435T240W25H20,...,CALL RESPATH
    LIST GHOBACK,L18T240W415H20,,ENVI. @STATUS3=��ѡ·��/�ļ���%GHOBACK%,,0x10114
    ITEM BkBUTTON,L435T240W25H20,...,CALL BACKPATH,,16
    EDIT+ INFO01,L22T244W360H15,,,
    LIST SPART,L30T240W140H20,,CALL SetSTATUS4,,0x110
    LABE DLABLE,L260T224W200H16,3.��ѡ��Ŀ�������
    ENVI @DLABLE.Visable=0
    LIST DPART,L272T240W140H20,,CALL SetSTATUS5,,0x110
    GROU GHOGROU4,L10T270W454H116
    LABE STATUS0,L18T284W100H18,״̬��
    LABE -left STATUS1,L30T304W420H18,��ѡ��������ԭ����,,0xFF0000
    LABE -left STATUS2,L30T324W420H18,��ѡ��������,,0xFF0000
    LABE -left STATUS4,L30T324W420H18,Դ��������,,0xFF0000
    ENVI @STATUS4.Visable=0
    LABE. -left STATUS3,L30T344W420H38,��ѡ·��/�ļ�����,,0xFF0000
    LABE -left STATUS5,L30T344W420H18,Ŀ���������,,0xFF0000
    ENVI @STATUS5.Visable=0
_END

_SUB Page2,W472H376,P2,,,#
    ENVI &&hTITLE=+80:�������%&TAB%+95:��������%&TAB%280:   ���̺��ͺ�
    GROU hGROU1,L10T6W454H60
    LABE hREBK,L18T20W440H18,1.��ѡ����Ҫ���еĲ�����
    RADI hRERADI,L34T40W110H20,��ԭӲ��,CALL HDVIS1,0
    RADI hBKRADI,L152T40W110H20,����Ӳ��,CALL HDVIS2,0
    RADI HD2HD,L268T40W110H20,Ӳ�̶Կ�,CALL HDVIS3,0
    GROU hGROU2,L10T68W454H140
    LABE hLABE,L18T82W440H18,2.��ѡ��Ӳ�̣�����������������
    TABL hTABL,L18T100W440H100,%&hTITLE%,,0x100c0
    LIST -h hLIST,L18T240W415H160,    ,TEAM ENVI. @hSTATUS3=��ѡ·��/�ļ���%hLIST%|ENVI &ahCHECK=2|CALL GICHECK "%hLIST%",,0x10100
    GROU hGROU3,L10T210W454H58
    LABE hRETIP,L18T224W240H16,3.��ѡ�����ļ���
    ITEM hReBn,L435T240W25H20,...,CALL hRESPATH
    LIST hBACK,L18T240W415H20,D:\SYSTEM.GHO,ENVI. @hSTATUS3=��ѡ·��/�ļ���%hBACK%,D:\SYSTEM.GHO,0x10114
    ITEM hBkBn,L435T240W25H20,...,CALL hBACKPATH,,16
    EDIT+ hINFO01,L22T244W360H15,,,
    LIST SRCHD,L30T240W140H20,,CALL SethSTATUS4,,0x110
    LABE hLABLE,L260T224W200H16,3.��ѡ��Ŀ��Ӳ�̣�
    ENVI @hLABLE.Visable=0
    LIST DSTHD,L272T240W140H20,,CALL SethSTATUS5,,0x110
    GROU hGROU4,L10T270W454H116
    LABE hSTATUS0,L18T284W100H18,״̬��
    LABE -left hSTATUS1,L30T304W420H18,��ѡ��������,,0xFF0000
    LABE -left hSTATUS2,L30T324W420H18,��ѡӲ�̣���,,0xFF0000
    LABE -left hSTATUS4,L30T324W420H18,ԴӲ�̣���,,0xFF0000
    ENVI @hSTATUS4.Visable=0
    LABE. -left hSTATUS3,L30T344W420H38,��ѡ·��/�ļ�����,,0xFF0000
    LABE -left hSTATUS5,L30T344W420H18,Ŀ��Ӳ�̣���,,0xFF0000
    ENVI @hSTATUS5.Visable=0
_END

_SUB Page3,W472H376,P3,,,#
    GROU ,L10T7W454H190,��������,
    CHEK advIDE,L22T34W166H18,���÷���IDE�豸,,1
    CHEK advPWD1,L202T34W52H18,����,CALL EnablePWD,0
    EDIT advEDIT1,L255T33W120H18,,,-
    LABE ,L18T76W61H18,��ԭʱ��,,
    CHEK advCRC,L80T73W368H18,����CRC����,,0
    LABE ,L18T116W61H18,����ʱ��,,
    LIST advBL01,L80T112W90H18,��ѹ��|����ѹ��|��ѹ��|����ѹ��,,����ѹ��,
    LIST advBL02,L206T112W80H18,���־�|650 MB|1950 MB|3950 MB|�Զ����,,���־�,
    CHEK HideFolder,L318T112W140H18,���ر����ļ���,,0
    LABE ,L18T165W80H18,����������,,
    EDIT paras,L100T161W286H18,,,
    ITEM ,L390T157W70H25,�� ��,ENVI @-.POSTMSG=#4;3;0,
    GROU ,L10T206W454H93,���GHO�����������,
    LIST -h advLIST,L18T227W414H170,,TEAM ENVI. @advLABE=��ѡ�ļ���%advLIST%|ENVI &ahCHECK=3|CALL GICHECK "%advLIST%",,0x10100
    ITEM advBn1,L434T227W25H20,...,CALL advPATH,
    LABE. -left advLABE,L18T254W360H32,��ѡ�ļ���,,0xFF0000,
    ITEM advBn2,L380T265W80H28,��ʼ���,CALL IntegCheck,
_END

_SUB MHGHO2012,W502H500,CGI 4.0.3.3,,#1,
    TABS TABS1,L10T6W476H416,Page1:PARTMH:��������:�Է������в���;Page2:HDMH:����Ӳ��:������Ӳ�̽��в���;Page3:ADVANMH:�� ��:�����������ú͹���,
    LABE -left WIMVER,L20T427W230H16,ImageX64: v10.0.14393,
    LABE -left GHOVER,L20T446W230H16,Ghost64: v12.0.0.10531,
    ITEM DOIT1,L328T430W70H28,ִ ��,CALL DOITph,
    ITEM DOIT2,L406T430W70H28,�� ��,KILL \,
    ENVI @TABS1.MSG=_%WM_LBUTTONDOWN%: CALL OnLButton_TABS1
    TEAM ENVI &&GHOLS=|ENVI &&GHOLS1=|ENVI &&WIMLS=|ENVI &&ESDLS=|ENVI &&ISOLS=
    TEAM ENVI &&wp=|ENVI &&lp=|ENVI &&J=0|ENVI &&BasicDone=0|ENVI &&DL=  
    ENVI @PARTMH:GHOSTABL.MSG=_%&WM_LBUTTONDOWN%:   CALL GHOSTCHECK
    ENVI @PARTMH:GHOSTABL.MSG=_%&WM_LBUTTONDBLCLK%:  CALL OPENPART
    ENVI @HDMH:hTABL.MSG=_%&WM_LBUTTONDOWN%:  CALL HDCHECK   
    ENVI @PARTMH:STATUS3.MSG=%&WM_MOUSEHOVER%:   CALL DISPTIP 1
    ENVI @HDMH:hSTATUS3.MSG=%&WM_MOUSEHOVER%:  CALL DISPTIP 2
    ENVI @ADVANMH:advLABE.MSG=%&WM_MOUSEHOVER%:  CALL DISPTIP 3
    ENVI @PARTMH:STATUS3.MSG=%&WM_MOUSELEAVE%:  TIPS -
    ENVI @HDMH:hSTATUS3.MSG=%&WM_MOUSELEAVE%:  TIPS -
    ENVI @ADVANMH:advLABE.MSG=%&WM_MOUSELEAVE%:  TIPS -
    ENVI @MHGHO2012.MSG=#1: CALL OnMsg1
    TIME Timer1,1000, CALL OnTimer1
    CALL OnTimer1
    THREAD*  GODRVINFO
    TIME &KillGHOTimer,0, CALL OnKillGHOTimer
    ENVI @this.MSG=_#4: CALL @*paraHELP
_END

_SUB OPENPART
    ENVI  @GHOSTABL.Sel=?&&Sel
    ENVI  @GHOSTABL.Val=?%&Sel%.2;&&P4VIEW
    FIND $%&P4VIEW%=  ,! EXEC !CMD.EXE /C START "" %&P4VIEW%\
_END

_SUB OnLButton_TABS1
    FIND $%&TABS1.Select%=3,TEAM ENVI @DOIT1.Enable=0|ENVI @DOIT2.Visable=1
    FIND $%&TABS1.Select%=1,
    {
        ENVI @DOIT1.Enable=1
        ENVI @DOIT2.Visable=1       
        FIND $%PART2PART.Check%=1, CALL PARTCOPYNOIDE2! CALL SetNOIDE3
    }
    FIND $%&TABS1.Select%=2,
    {
        ENVI @DOIT1.Enable=1
        ENVI @DOIT2.Visable=1
        FIND $%HD2HD.Check%=1, CALL SetHDCOPYIDE2! CALL SetHDIDE2
    }
_END

_SUB GODRVINFO
    ENVI &CGIEXEDir=%CurDir%
    CALL GetCGIDirLevel
    EXEC* -exe:#600 &vFORM=!USORT.EXE -mohong
    EXEC* -exe:#601 &HDMHINFO=!HDSIZEID.EXE -mohong
    ENVI @PARTMH:GHOSTABL.Val=1*;%&vFORM%
    ENVI @HDMH:hTABL.Val=1*;%&HDMHINFO%
    CALL FINDGHO
    CALL FINDWIM
    CALL FINDESD
    CALL FINDISO
    CALL FINDGHOInCGIDir
    CALL FINDWIMInCGIDir
    CALL FINDESDInCGIDir
    ENVI @Timer1=0
    ENVI @MHGHO2012.POSTMSG=#1
_END

_SUB GetCGIDirLevel
    TEAM ENVI &&M=1|ENVI &&iPOS=0
    LOOP 1,
    {
        LPOS &iPOS=\,%&M%,%&CGIEXEDir%
        IFEX $%&iPOS% = 0, EXIT LOOP
        CALC #&CGIDirLevel = %&CGIDirLevel% + 1
        CALC #&M = %&M% + 1
    }
_END

_SUB OnMsg1
    CALL SetDiskInfo    
    CALL SetSizeHiddenPart
    IFEX $%&PEPOS% = 0, TEAM ENVI @PARTMH:ShowSysDrv=��ϵͳ��Ϊ %SYSTEMDRIVE% �̣�|ENVI &OKSysDrv=%SYSTEMDRIVE%|CALL SetBackupPath! CALL FindPEWINDRV
    TEAM ENVI @Timer1=0| ENVI @PARTMH:INFO01.Visable=0| ENVI @HDMH:hINFO01.Visable=0
    TEAM ENVI @PARTMH:GHOLIST.VAL=%&GHOLS%|ENVI @HDMH:hLIST.VAL=%&GHOLS%|ENVI @ADVANMH:advLIST.VAL=%&GHOLS%
    FIND $%&BKDefaultPath% = ,! ENVI &GHOLS1=%&BKDefaultPath% 
    FIND $%&CGIDirGHO%=,!
    {
        IFEX $%&CGIDirLevel% > 1, TEAM ENVI @PARTMH:GHOLIST.ADD=%&CGIDirGHOList%|ENVI @HDMH:hLIST.ADD=%&CGIDirGHOList%|ENVI @ADVANMH:advLIST.ADD=%&CGIDirGHOList%
        ENVI &GHOLS1=%&CGIDirGHO%
    }
    ENVI @PARTMH:GHOLIST.SEL=%&GHOLS1%
    FIND $%BKRADI.Check%=0,!! FIND $%PART2PART.Check%=0,!! ENVI. @PARTMH:STATUS3=��ѡ·��/�ļ���%&GHOLS1%
    ENVI @HDMH:hLIST.SEL=%&GHOLS1%
    FIND $%hBKRADI.Check%=0,!! FIND $%HD2HD.Check%=0,!! ENVI. @HDMH:hSTATUS3=��ѡ·��/�ļ���%&GHOLS1%   
    ENVI @ADVANMH:advLIST.SEL=%&GHOLS1%
    ENVI. @ADVANMH:advLABE=��ѡ�ļ���%&GHOLS1%
    ENVI @PARTMH:GHOLIST.ADD=%&WIMLS%
    FIND $%&CGIDirWIMList%=,!
    {
        IFEX $%&CGIDirLevel% > 1, ENVI @PARTMH:GHOLIST.ADD=%&CGIDirWIMList%
    }
    ENVI @PARTMH:GHOLIST.ADD=%&ESDLS%
    FIND $%&CGIDirESDList%=,!
    {
        IFEX $%&CGIDirLevel% > 1, ENVI @PARTMH:GHOLIST.ADD=%&CGIDirESDList%
    }
    TEAM ENVI @PARTMH:GHOLIST.ADD=%&ISOLS%|ENVI @HDMH:hLIST.ADD=%&ISOLS%|ENVI @ADVANMH:advLIST.ADD=%&ISOLS%
    FIND $%&OKSysDrv%=,! CALL SelectSystemInTBAL
    ENVI @PARTMH:GHOLIST.QUERY=&&AllItems
    FIND $%&AllItems%=,!
    {
        ENVI @PARTMH:GHOLIST.QUERY=1;&PLIST1ITEM
        ENVI @HDMH:hLIST.QUERY=1;&DLIST1ITEM
        ENVI @ADVANMH:advLIST.QUERY=1;&ILIST1ITEM
    }
    CALL GetSystemVersion
    ENVI &BasicDone=1 
_END

_SUB SetBackupPath
    TEAM ENVI &&faultPath=|ENVI &&fDrive=|ENVI &&vLn=|ENVI &&A2=|ENVI &&A5=|ENVI &&A6=|ENVI &&A9=|ENVI &&YinCA=
    FORX *ab \SYBACKUP\RESC.GHO,&faultPath,1,
    { 
      FIND %&faultPath%=,!
      {
       FDRV &fDrive=%&faultPath%
       ENVI @PARTMH:GHOBACK.ADD=%&fDrive%\SYSTEM.GHO
       TEAM ENVI @PARTMH:GHOBACK.ADDSEL=%&faultPath%|ENVI &BKDefaultPath=%&faultPath%
       ENVI @PARTMH:GHOBACK.ADD=%&fDrive%\SYSTEM.WIM
       ENVI @PARTMH:GHOBACK.ADD=%&fDrive%\SYBACKUP\RESC.WIM
       ENVI @PARTMH:GHOBACK.ADD=%&fDrive%\SYSTEM.ESD
       ENVI @PARTMH:GHOBACK.ADD=%&fDrive%\SYBACKUP\RESC.ESD
       EXIT _SUB
      }         
    }
    FIND $%&faultPath%=,!!
    {
      FORX *NL &vFORM,&vLn,
       {
         MSTR* &A2,&A5,&A6,&A9=<2><5><6><9>%&vLn%
         LSTR &YinCA=6,%&A6%
         FIND $%&A2%<>%&OKSysDrv%,!! FIND $%&A5%<>EFI,!! FIND $%&YinCA%<>hidden,!! FIND $%&A9%<>1,!! TEAM ENVI &BKPARTDRV=%&A2%|EXIT FORX 
       }
      FIND %&BKPARTDRV%=,!
       {
         ENVI @PARTMH:GHOBACK.ADD=%&BKPARTDRV%\SYSTEM.GHO
         ENVI @PARTMH:GHOBACK.ADDSEL=%&BKPARTDRV%\SYBACKUP\RESC.GHO
         ENVI @PARTMH:GHOBACK.ADD=%&BKPARTDRV%\SYSTEM.WIM
         ENVI @PARTMH:GHOBACK.ADD=%&BKPARTDRV%\SYBACKUP\RESC.WIM
         ENVI @PARTMH:GHOBACK.ADD=%&BKPARTDRV%\SYSTEM.ESD
         ENVI @PARTMH:GHOBACK.ADD=%&BKPARTDRV%\SYBACKUP\RESC.ESD        
       }
    }  
_END

_SUB FindPEWINDRV
    CALL GetSysDrvInPE
    FIND $%&PESysDrv%=, EXIT _SUB
    ENVI @PARTMH:ShowSysDrv=��ϵͳ��Ϊ%&PESysDrv%�̣�
    ENVI &OKSysDrv=%&PESysDrv%
    CALL SetBackupPath %&PESysDrv%
_END

_SUB GetAnyDrvNumByDrvLett
    TEAM ENVI &&vln=|ENVI &&A1=|ENVI &&A2=|ENVI &&iPOS=
    ENVI &&DrvLett=%1
    ENVI &AnyDrvNum=0
    FORX *NL &vFORM,&vln,
    {
        MSTR* &A1,&A2=<1><2>%&vln%
        FIND $%&A2%=%&DrvLett%,!!
        {
            LPOS &iPOS=:,1,%&A1%
            CALC #&iPOS = %&iPOS% - 1
            LSTR &AnyDrvNum=%&iPOS%,%&A1%
            EXIT _SUB
        }
    }
_END

_SUB GetAnyBusTypeByDrvNum
    TEAM ENVI &&vln=|ENVI &&A1=|ENVI &&A4=
    ENVI &&HDNumber=%1
    ENVI &AnyBusType=0
    FORX *NL &HDMHINFO,&vln,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&HDNumber%, TEAM ENVI &AnyBusType=%&A4%|EXIT _SUB
    }
_END

_SUB GetSysDrvInPE
    TEAM ENVI &&vd=|ENVI &&A1=|ENVI &&A2=|ENVI &&A9=|ENVI &&vln=|ENVI &&szNUM=|ENVI &&iPOS=0
    TEAM ENVI &&HD1DrvList=|ENVI &&HD2DrvList=|ENVI &&DrvList=|ENVI &&AnyDrvNum=0|ENVI &&XDrvNum=
    CALL GetAnyDrvNumByDrvLett %SYSTEMDRIVE%
    ENVI &XDrvNum=%&AnyDrvNum%
    IFEX $%&XDrvNum%=1,!
    {
        CALL GetAllDrvLettOnDrive 1
        ENVI &HD1DrvList=%&DrvList%
        FORX * %&HD1DrvList%,&vd,
        {
            IFEX %&vd%\Windows, TEAM ENVI &PESysDrv=%&vd%|ENVI &SysDrvNum=1| EXIT FORX
        }
        FIND $%&PESysDrv%=,! EXIT _SUB
    }
    IFEX $%&XDrvNum%=2,!
    {
        CALL GetAllDrvLettOnDrive 2
        ENVI &HD2DrvList=%&DrvList%
        FORX * %&HD2DrvList%,&vd,
        {
            IFEX %&vd%\Windows, TEAM ENVI &PESysDrv=%&vd%|ENVI &SysDrvNum=2| EXIT FORX
        }
        FIND $%&PESysDrv%=,! EXIT _SUB
    }
    // ======== GPT SSD �迼�ǣ� ��ϻ�������������� =======================
    TEAM ENVI &&PTStyleHD1=|ENVI &&PTStyleHD2=|ENVI &&PTStyleHD=|ENVI &&ActPartDrv=
    CALL GetPartitionTableStyle 1
    ENVI &PTStyleHD1=%&PTStyleHD%
    CALL GetPartitionTableStyle 2
    ENVI &PTStyleHD2=%&PTStyleHD%
    TEAM ENVI &&szHD1=|ENVI &&szHD2=|ENVI &&szHD=
    CALL CheckIsSSD 1
    ENVI &szHD1=%&szHD%
    CALL CheckIsSSD 2
    ENVI &szHD2=%&szHD%
    TEAM ENVI &&ESPExist=0|ENVI &&vSSD=0
    LPOS* &vSSD=SSD,1,%&szHD1%
    IFEX $%&vSSD% > 0,
    {
        FIND $%&PTStyleHD1%=MBR,
        {
            CALL ActivePartitionDrv 1
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD1%=GPT,
        {
            CALL CheckESP 1
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 1
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    ENVI &vSSD=0
    LPOS* &vSSD=SSD,1,%&szHD2%
    IFEX $%&vSSD% > 0,
    {
        FIND $%&PTStyleHD2%=MBR,
        {
            CALL ActivePartitionDrv 2
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD2%=GPT,
        {
            CALL CheckESP 2
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 2
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    TEAM ENVI &&BusTypeHD1=0|ENVI &&BusTypeHD2=0|ENVI &&AnyBusType=0|ENVI &&BTHD1=Y|ENVI &&BTHD2=Y
    CALL GetAnyBusTypeByDrvNum 1
    ENVI &BusTypeHD1=%&AnyBusType%
    CALL GetAnyBusTypeByDrvNum 2
    ENVI &BusTypeHD2=%&AnyBusType%
    IFEX $%&BusTypeHD1% = 7, ENVI &BTHD1=NonHD
    IFEX $%&BusTypeHD1% = 0, ENVI &BTHD1=NonHD
    IFEX $%&BusTypeHD2% = 7, ENVI &BTHD2=NonHD
    IFEX $%&BusTypeHD2% = 0, ENVI &BTHD2=NonHD
    FIND $%&BTHD1%=Y,
    {
        FIND $%&PTStyleHD1%=MBR,
        {
            CALL ActivePartitionDrv 1
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD1%=GPT,
        {
            CALL CheckESP 1
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 1
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    FIND $%&BTHD2%=Y,
    {
        FIND $%&PTStyleHD2%=MBR,
        {
            CALL ActivePartitionDrv 2
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD2%=GPT,
        {
            CALL CheckESP 2
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 2
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    // ����Ѳ������ٰ����Ϲ����ѵ��������Ŀ�Ӳ��===============
    ENVI &&HD3DrvList=
    IFEX $%&XDrvNum%=3,!
    {
        CALL GetAllDrvLettOnDrive 3
        ENVI &HD3DrvList=%&DrvList%
        FORX * %&HD3DrvList%,&vd,
        {
            IFEX %&vd%\Windows, TEAM ENVI &PESysDrv=%&vd%|ENVI &SysDrvNum=3| EXIT FORX
        }
        FIND $%&PESysDrv%=,! EXIT _SUB
    }
    ENVI &&HD4DrvList=
    IFEX $%&XDrvNum%=4,!
    {
        CALL GetAllDrvLettOnDrive 4
        ENVI &HD4DrvList=%&DrvList%
        FORX * %&HD4DrvList%,&vd,
        {
            IFEX %&vd%\Windows, TEAM ENVI &PESysDrv=%&vd%|ENVI &SysDrvNum=4| EXIT FORX
        }
        FIND $%&PESysDrv%=,! EXIT _SUB
    }
    TEAM ENVI &&PTStyleHD3=|ENVI &&PTStyleHD4=
    CALL GetPartitionTableStyle 3
    ENVI &PTStyleHD3=%&PTStyleHD%
    CALL GetPartitionTableStyle 4
    ENVI &PTStyleHD4=%&PTStyleHD%
    TEAM ENVI &&szHD3=|ENVI &&szHD4=
    CALL CheckIsSSD 3
    ENVI &szHD3=%&szHD%
    CALL CheckIsSSD 4
    ENVI &szHD4=%&szHD%
    ENVI &vSSD=0
    LPOS* &vSSD=SSD,1,%&szHD3%
    IFEX $%&vSSD% > 0,
    {
        FIND $%&PTStyleHD3%=MBR,
        {
            CALL ActivePartitionDrv 3
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD3%=GPT,
        {
            CALL CheckESP 3
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 3
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    ENVI &vSSD=0
    LPOS* &vSSD=SSD,1,%&szHD4%
    IFEX $%&vSSD% > 0,
    {
        FIND $%&PTStyleHD4%=MBR,
        {
            CALL ActivePartitionDrv 4
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD2%=GPT,
        {
            CALL CheckESP 4
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 4
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    TEAM ENVI &&BusTypeHD3=0|ENVI &&BusTypeHD4=0|ENVI &&BTHD3=Y|ENVI &&BTHD4=Y
    CALL GetAnyBusTypeByDrvNum 3
    ENVI &BusTypeHD3=%&AnyBusType%
    CALL GetAnyBusTypeByDrvNum 4
    ENVI &BusTypeHD4=%&AnyBusType%
    IFEX $%&BusTypeHD3% = 7, ENVI &BTHD3=NonHD
    IFEX $%&BusTypeHD3% = 0, ENVI &BTHD3=NonHD
    IFEX $%&BusTypeHD4% = 7, ENVI &BTHD4=NonHD
    IFEX $%&BusTypeHD4% = 0, ENVI &BTHD4=NonHD
    FIND $%&BTHD3%=Y,
    {
        FIND $%&PTStyleHD3%=MBR,
        {
            CALL ActivePartitionDrv 3
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD3%=GPT,
        {
            CALL CheckESP 3
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 3
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
    FIND $%&BTHD4%=Y,
    {
        FIND $%&PTStyleHD4%=MBR,
        {
            CALL ActivePartitionDrv 4
            FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
        }
        FIND $%&PTStyleHD4%=GPT,
        {
            CALL CheckESP 4
            FIND $%&ESPExist%=1,
            {
                CALL FirstNTFSPartition 4
                FIND $%&ActPartDrv%=,! TEAM ENVI &PESysDrv=%&ActPartDrv%|EXIT _SUB
            }
        }
    }
_END

_SUB GetPartitionTableStyle
    TEAM ENVI &&vln=|ENVI &&A1=|ENVI &&A8=|ENVI &&E1=|ENVI &&E2=
    ENVI &&HDNumber=%1
    ENVI &PTStyleHD=
    FORX *NL &vFORM,&vln,
    {
        MSTR* &A1,&A8=<1><8>%&vln%
        LPOS &E1=:,1,%&A1%
        CALC #&E1 = %&E1% - 1
        LSTR &E2=%&E1%,%&A1%
        IFEX $%&E2% = %&HDNumber%, TEAM ENVI &PTStyleHD=%&A8%|EXIT _SUB
    }
_END

_SUB CheckIsSSD
    TEAM ENVI &&vln=|ENVI &&A1=|ENVI &&A5=
    ENVI &&HDNumber=%1
    ENVI &szHD=
    FORX *NL &HDMHINFO,&vln,
    {
        MSTR* &A1,&A5=<1><5>%&vLn%
        FIND $%&A1%=%&HDNumber%, TEAM ENVI &szHD=%&A5%|EXIT _SUB
    }
_END

_SUB ActivePartitionDrv
    TEAM ENVI &&vln=|ENVI &&A1=|ENVI &&A2=|ENVI &&A9=|ENVI &&E1=|ENVI &&E2=
    ENVI &&HDNumber=%1
    ENVI &ActPartDrv=
    FORX *NL &vFORM,&vln,
    {
        MSTR* &A1,&A2,&A9=<1><2><9>%&vln%
        IFEX $%&A9% = 1,
        {
            LPOS &E1=:,1,%&A1%
            CALC #&E1 = %&E1% - 1
            LSTR &E2=%&E1%,%&A1%
            IFEX $%&E2% = %&HDNumber%,!! FIND $%&A2%=%SYSTEMDRIVE%,! TEAM ENVI &ActPartDrv=%&A2%|EXIT _SUB
        }
    }
_END

_SUB CheckESP
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A5=|ENVI &&tPOS=|ENVI &&aNum=
    ENVI &&HDNumber=%1
    ENVI &ESPExist=0
    FORX *NL &vFORM,&vLn,
    {
        MSTR* &A1,&A5=<1><5>%&vLn%
        FIND $%&A5%=EFI,
        {
            LPOS &tPOS=:,1,%&A1%
            CALC #&tPOS = %&tPOS% - 1
            LSTR &aNum=%&tPOS%,%&A1%
            IFEX $%&aNum% = %&HDNumber%, TEAM ENVI &ESPExist=1|EXIT _SUB
        }
    }
_END

_SUB FirstNTFSPartition
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A2=|ENVI &&A6=|ENVI &&tPOS=|ENVI &&aNum=
    ENVI &&HDNumber=%1
    ENVI &ActPartDrv=
    FORX *NL &vFORM,&vLn,
    {
        MSTR* &A1,&A2,&A6=<1><2><6>%&vLn%
        FIND $%&A6%=NTFS,
        {
            LPOS &tPOS=:,1,%&A1%
            CALC #&tPOS = %&tPOS% - 1
            LSTR &aNum=%&tPOS%,%&A1%
            IFEX $%&aNum% = %&HDNumber%,
            {
                FIND $%&A2%=%SYSTEMDRIVE%,! ENVI &ActPartDrv=%&A2%
                FIND $%&ActPartDrv%=,! EXIT _SUB
            }
        }
    }
_END

_SUB SelectSystemInTBAL
    TEAM ENVI &&M=1| ENVI &&FTDRV=| ENVI &&SysLine=
    LOOP #%&M% <= %&LnvFORM%,
    {
        ENVI @PARTMH:GHOSTABL.Val=?%&M%.2;&FTDRV
        FIND $%&FTDRV%=%&OKSysDrv%, TEAM ENVI @PARTMH:GHOSTABL.Sel=%&M%|EXIT LOOP
        CALC #&M = %&M% + 1
    }
    ENVI  @PARTMH:GHOSTABL.Val=?%&M%.1;&PARTSEL1
    ENVI  &PARTSEL2=%&OKSysDrv%
    ENVI  @PARTMH:GHOSTABL.Val=?%&M%.5;&PARTSEL5
    ENVI &DrvLettBackup=%&PARTSEL2%   
    FIND $%&PARTSEL2%=  ,ENVI @PARTMH:STATUS2=��ѡ������  ��� %&PARTSEL1%         ���̷�!ENVI @PARTMH:STATUS2=��ѡ������  ��� %&PARTSEL1%         �̷� %&PARTSEL2%
    CALL SetNOIDE3
_END

_SUB GetSystemVersion
    ENVI &&WINVER=
    EXEC*- &&line=!CMD.EXE /C ver
    RPOS &&szPOS=[,1,%&line%
    MSTR &&tString=%&szPOS%,0,%&line%
    MSTR &WINVER=<2>%&tString%
    LPOS &&aSysPOS=.,1,%&WINVER%
    CALC #&aSysPOS = %&aSysPOS% - 1
    LSTR &SYSVERSION=%&aSysPOS%,%&WINVER%
    LPOS &&VerPOS=.,2,%&WINVER%
    CALC #&VerPOS = %&VerPOS% - 1
    LSTR &VERNUM=%&VerPOS%,%&WINVER%
_END

//=========================================== ��ʼ������ =========================================================================
_SUB GetOSVolume
    FILE GHSTSTAT.TXT
    EXEC* -exe:#200 =!ghost.exe -dd
    EXEC* -exe:#602 &DynOSVolume=!OSVOLNumber.exe
    FILE GHSTSTAT.TXT
    FILE ghost*.dmp
_END

_SUB GetNumberOfVolume
    CALL GetOSVolume
    FIND $%&DynOSVolume%=,EXIT _SUB
    TEAM ENVI &&V1=|ENVI &&V2=|ENVI &&DynVol=
    FORX *NL &DynOSVolume,&DynVol,
    {
         MSTR &V1,&V2=<1><2>%&DynVol%
         FIND $%&V2%=%&PARTSEL2%, TEAM ENVI &PARTSEL1=%&V1%|EXIT FORX
    }
_END

_SUB SetSizeHiddenPart
    READ -,-1,&LnvFORM,%&vFORM%
    TEAM ENVI &&M=1| ENVI &&FTDRV=| ENVI &&HIDDEN=| ENVI &&F8=
    TEAM ENVI &&PartNo=| ENVI &&DrvLett=
    LOOP #%&M% <= %&LnvFORM%,
    {
      ENVI @PARTMH:GHOSTABL.Val=?%&M%.6;&FTDRV
      LSTR &HIDDEN=7,%&FTDRV%
	    MSTR &F8=8,0,%&FTDRV%
      FIND $%&HIDDEN%=hidden_, TEAM ENVI @PARTMH:GHOSTABL.Color=*%&M%;0xFF| ENVI @PARTMH:GHOSTABL.Val=%&M%.6;����%&F8%
      ENVI @PARTMH:GHOSTABL.Val=?%&M%.1;&PartNo
      ENVI @PARTMH:GHOSTABL.Val=?%&M%.2;&DrvLett
      FIND $%&PartNo%=, ENVI &P2PList=%&P2PList%           %&DrvLett%%NLDD%! ENVI &P2PList=%&P2PList%  %&PartNo%      %&DrvLett%%NLDD%
      CALC #&M = %&M% + 1
    }
    // ���á������Կ���������
    ENVI @PARTMH:SPART.ADD=%&P2PList%
    ENVI @PARTMH:DPART.ADD=%&P2PList%
    // ��Native PE �У�winvblockģ����̱�ʶ��ΪFixed HD��GHOST32Ҳ����ˣ������ȥ�������
    IFEX $%&PEPOS% > 0,
    {
        TEAM ENVI &M=1| ENVI &&HDNumberX=
        LOOP #%&M% <= %&LnvFORM%,
        {
            ENVI @PARTMH:GHOSTABL.Val=?%&M%.2;&DrvLett
            FIND $%&DrvLett%=%SYSTEMDRIVE%,
            {
                ENVI @PARTMH:GHOSTABL.Val=?%&M%.1;&HDNumberX
                ENVI @PARTMH:GHOSTABL.Val=-%&M%
                // ��ȥ�������Կ�������������Ӧ����Ŀ
                ENVI @PARTMH:SPART.DEL=  %&HDNumberX%      %SYSTEMDRIVE%
                ENVI @PARTMH:DPART.DEL=  %&HDNumberX%      %SYSTEMDRIVE%
                // ��ȥӲ���б�͡�Ӳ�̶Կ�����������Ӧ����Ŀ
                CALL CutWinvblock %&HDNumberX%
                EXIT LOOP
            }
            CALC #&M = %&M% + 1
        }
    }
_END

_SUB SetDiskInfo
    READ -,-1,&&Ln,%&HDMHINFO%
    TEAM ENVI &&M=1| ENVI &&HDNumber=
    LOOP #%&M% <= %&Ln%,
    {
        ENVI @HDMH:hTABL.Val=?%&M%.1;&HDNumber
        ENVI &HDList=%&HDList%%&HDNumber%%NLDD%
        CALC #&M = %&M% + 1
    }
    // ���á�Ӳ�̶Կ���������     
    ENVI @HDMH:SRCHD.ADD=%&HDList%
    ENVI @HDMH:DSTHD.ADD=%&HDList%
_END

_SUB CutWinvblock
    TEAM ENVI &&HDNumPOS=| ENVI &&hNum=| ENVI &&DiskNum=
    LPOS &HDNumPOS=:,1,%1
    CALC #&HDNumPOS = %&HDNumPOS% - 1
    LSTR &hNum=%&HDNumPOS%,%1
    READ -,-1,&&Ln,%&HDMHINFO%
        
    ENVI &M=1
    LOOP #%&M% <= %&Ln%,
    {
        ENVI @HDMH:hTABL.Val=?%&M%.1;&DiskNum
        FIND $%&DiskNum%=%&hNum%, TEAM ENVI @HDMH:hTABL.Val=-%&M%| EXIT LOOP
        CALC #&M = %&M% + 1
    }
    
    // ��ȥ��Ӳ�̶Կ�����������Native PE��Ӧ����Ŀ
    ENVI @HDMH:SRCHD.DEL=%&hNum%
    ENVI @HDMH:DSTHD.DEL=%&hNum%
_END

_SUB GICHECK
    FEXT &&EXT=%~1
    FIND $%&EXT%=ISO,CALL F_GHOinISO %1
_END

_SUB F_GHOinISO,W420H208,ISO��GHO�ļ��б�,,#1
    ENVI &&GITITLE=375:%~1�е�GHO�ļ��б�
    LABE ,L20T12W380H18,��ѡ��GHO�ļ�������������������
    TABL GITABL,L20T32W380H100,%&GITITLE%,,0x10040
    EDIT+ GIEDIT,L50T70W340H16,,,
    ITEM GIButton1,L220T140W80H28,ȷ ��,TEAM CALL SetSTATUS3|KILL \,
    ITEM GIButton2,L320T140W80H28,�� ��,KILL \,
    ENVI @GITABL.MSG=_%&WM_LBUTTONDOWN%:   CALL GIPICK    
    ENVI &GinCD=
    ENVI &&K=0
    ENVI &&GLSinISO=
    ENVI @F_GHOinISO.MSG=#1: CALL GIMsg1
    TIME Timer3,200, CALL OnTimer3
    CALL OnTimer3
    ENVI &&ISOPATH=%1
    THREAD* L_ISO2GHO
_END

_SUB SetSTATUS3
    FIND $%&GinCD%=,!
    {
        FIND $%&ahCHECK%=2,TEAM ENVI. @hSTATUS3=��ѡ·��/�ļ���%&GinCD%|EXIT _SUB
        FIND $%&ahCHECK%=3,ENVI. @advLABE=��ѡ�ļ���%&GinCD%
    }
_END

_SUB SetSTATUS4
    ENVI @STATUS4=Դ������      %SPART%
    CALL PARTCOPYNOIDE
_END

_SUB SetSTATUS5
    ENVI @STATUS5=Ŀ�������    %DPART%
    CALL PARTCOPYNOIDE
_END

_SUB PARTCOPYNOIDE
    FIND $%DPART%=,EXIT _SUB
    FIND $%SPART%=,EXIT _SUB
    TEAM ENVI &&S1=|ENVI &&S2=|ENVI &&IsDrv=
    MSTR &S1,&S2=<1><2>%SPART%
    RSTR &IsDrv=1,%&S1%
    FIND $%&IsDrv%=:, EXIT _SUB
    TEAM ENVI &&D1=|ENVI &&D2=
    MSTR &D1,&D2=<1><2>%DPART%
    RSTR &IsDrv=1,%&D1%
    FIND $%&IsDrv%=:, EXIT _SUB
    TEAM ENVI &&SPACOR=0|ENVI &&DrvNum=|ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=|ENVI &&IsIDE1=0|ENVI &&IsIDE2=0
    LPOS &SPACOR=:,1,%&S1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DrvNum=%&SPACOR%,%&S1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DrvNum%, TEAM ENVI &IsIDE1=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE1%=3, TEAM ENVI @-:-:-:ADVANMH:advIDE.Check=0|ENVI &PartCPYNoIDE=|EXIT _SUB
    LPOS &SPACOR=:,1,%&D1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DrvNum=%&SPACOR%,%&D1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DrvNum%, TEAM ENVI &IsIDE2=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE2%=3, TEAM ENVI @-:-:-:ADVANMH:advIDE.Check=0|ENVI &PartCPYNoIDE=|EXIT _SUB! TEAM ENVI @-:-:-:ADVANMH:advIDE.Check=1|ENVI &PartCPYNoIDE=-noide
_END

_SUB PARTCOPYNOIDE2
    FIND $%DPART%=,EXIT _SUB
    FIND $%SPART%=,EXIT _SUB
    TEAM ENVI &&S1=|ENVI &&S2=|ENVI &&IsDrv=
    MSTR &S1,&S2=<1><2>%SPART%
    RSTR &IsDrv=1,%&S1%
    FIND $%&IsDrv%=:, EXIT _SUB
    TEAM ENVI &&D1=|ENVI &&D2=
    MSTR &D1,&D2=<1><2>%DPART%
    RSTR &IsDrv=1,%&D1%
    FIND $%&IsDrv%=:, EXIT _SUB
    TEAM ENVI &&SPACOR=0|ENVI &&DrvNum=|ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=|ENVI &&IsIDE1=0|ENVI &&IsIDE2=0
    LPOS &SPACOR=:,1,%&S1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DrvNum=%&SPACOR%,%&S1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DrvNum%, TEAM ENVI &IsIDE1=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE1%=3, TEAM ENVI @-:ADVANMH:advIDE.Check=0|ENVI &PartCPYNoIDE=|EXIT _SUB
    LPOS &SPACOR=:,1,%&D1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DrvNum=%&SPACOR%,%&D1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DrvNum%, TEAM ENVI &IsIDE2=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE2%=3, TEAM ENVI @-:ADVANMH:advIDE.Check=0|ENVI &PartCPYNoIDE=|EXIT _SUB! TEAM ENVI @-:ADVANMH:advIDE.Check=1|ENVI &PartCPYNoIDE=-noide
_END

_SUB GIPICK
    ENVI @GITABL.Sel=?&&Sel
    ENVI @GITABL.Val=?%&Sel%.1;&GinCD
_END
_SUB OnTimer3
    ENVI @GIEDIT=�������������ļ������Ժ�...  ����ʱ��: %&K%��
    CALC &K= %&K% + 0.2#1
_END

_SUB GIMsg1
    TEAM ENVI @Timer3=0| ENVI @GIEDIT.Visable=0
    FIND $%&GLSinISO%=,TEAM MESS ��ISOǰ����Ŀ¼��������������������GHO����|KILL \|EXIT _SUB
    ENVI @GITABL.Val=1*;%&GLSinISO%
_END

_SUB L_ISO2GHO
    CALL CheckUltraISODrv %&ISOPATH%
    TEAM ENVI &&ANYGHO=|ENVI &&aGHOLS=|ENVI &&HD45=|ENVI &&vln=|ENVI &&GTPATH= 
    FORX /S:2 %&FFDrv%:\*.GHO,&ANYGHO,0,ENVI &aGHOLS=%&aGHOLS%%&NLHH%%&ANYGHO%
    FORX *NL &aGHOLS,&vln,
    {
        FIND $%&vln%=,!
        {
            FNAM &HD45=%&vln%
            FIND $%&HD45%=HD4,! FIND $%&HD45%=HD5,! ENVI &GLSinISO=%&GLSinISO%%&vln%%&NLHH%
        }
    }
    ENVI @Timer3=0
    ENVI &KillVD=1
    ENVI @F_GHOinISO.POSTMSG=#1
_END

_SUB RESPATH
    BROW &&REPATH,,��ѡ�����ļ�,GHO��WIM��SWM��ESD��ISO�ļ�(*.GHO;*.WIM;*.SWM;*.ISO)|*.GHO;*.WIM;*.ESD;*.SWM;*.ISO,
    FIND $%&REPATH%=,!
    {
        FIND $%&REPATH%=%&PLIST1ITEM%,ENVI @GHOLIST.SEL=%&REPATH%!ENVI @GHOLIST.ADDSEL=%&REPATH%
        ENVI. @STATUS3=��ѡ·��/�ļ���%GHOLIST%
        FEXT &&pEXT=%GHOLIST%
        FIND $%&pEXT%=GHO,! CALL WIMGICHECK "%GHOLIST%"
    }
_END

_SUB BACKPATH
    BROW &&BKPATH,&D:\SYSTEM.GHO,��ѡ�񱣴�Ŀ¼,GHO��WIM��ESD�ļ�(*.GHO;*.WIM;*.ESD)|*.GHO;*.WIM;*.ESD,
    FIND $%&BKPATH%=,!
    {
        // PECMD2012��BUG��ͨ�����������ť����ļ�ʱ����Ҫ��ӵ��ļ���������������Ѵ���
        // ��Ϊ��һ����Ŀʱ��������˳���������Ϊ������BUG�ġ�
        ENVI @GHOBACK.QUERY=&&AllBKGHO
        FIND $%&AllBKGHO%=,! ENVI @GHOBACK.QUERY=1;&&FirstBKGHO
        FIND $%&BKPATH%=%&FirstBKGHO%, ENVI @GHOBACK.SEL=%&BKPATH%! ENVI @GHOBACK.ADDSEL=%&BKPATH%
        ENVI. @STATUS3=��ѡ·��/�ļ���%GHOBACK%
    }
_END

_SUB MAKEVIS1
    ENVI @RETIP=3.��ѡ�����ļ���
    ENVI @GHOBACK.Visable=0
    ENVI @BkBUTTON.Visable=0
    ENVI @GHOLIST.Visable=1
    ENVI @ReBUTTON.Visable=1
    ENVI @STATUS1=��ѡ��������ԭ����
    ENVI. @STATUS3=��ѡ·��/�ļ���%GHOLIST%
    ENVI @PLABE.Visable=1
    ENVI @DLABLE.Visable=0
    ENVI @SPART.Visable=0
    ENVI @DPART.Visable=0
    ENVI @STATUS2.Visable=1
    ENVI @STATUS4.Visable=0
    ENVI @STATUS3.Visable=1
    ENVI @STATUS5.Visable=0
    CALL SetNOIDE2
_END

_SUB MAKEVIS2
    ENVI @RETIP=3.��ѡ�񱣴�·����
    ENVI @GHOLIST.Visable=0
    ENVI @ReBUTTON.Visable=0
    ENVI @GHOBACK.Visable=1
    ENVI @BkBUTTON.Visable=1
    ENVI @STATUS1=��ѡ���������ݷ���
    ENVI. @STATUS3=��ѡ·��/�ļ���%GHOBACK%
    ENVI @PLABE.Visable=1
    ENVI @DLABLE.Visable=0
    ENVI @SPART.Visable=0
    ENVI @DPART.Visable=0
    ENVI @STATUS2.Visable=1
    ENVI @STATUS4.Visable=0
    ENVI @STATUS3.Visable=1
    ENVI @STATUS5.Visable=0
    CALL SetNOIDE2
_END

_SUB MAKEVIS3
    ENVI @RETIP=2.��ѡ��Դ������
    ENVI @GHOLIST.Visable=0
    ENVI @ReBUTTON.Visable=0
    ENVI @GHOBACK.Visable=0
    ENVI @BkBUTTON.Visable=0
    ENVI @PLABE.Visable=0
    ENVI @DLABLE.Visable=1
    ENVI @SPART.Visable=1
    ENVI @DPART.Visable=1
    ENVI @STATUS1=��ѡ�����������Կ�
    ENVI @STATUS2.Visable=0
    ENVI @STATUS4.Visable=1
    ENVI @STATUS4=Դ������      %SPART%
    ENVI @STATUS3.Visable=0
    ENVI @STATUS5.Visable=1
    ENVI @STATUS5=Ŀ�������    %DPART%
    CALL PARTCOPYNOIDE
_END

_SUB REORBK
    FIND $%RERADI.Check%=0,!!FIND $%BKRADI.Check%=0,!!FIND $%PART2PART.Check%=0,!!TEAM MESS ����û��ѡ�������%&NLDD%%&NLDD%��ѡ�񡾻�ԭ�������������ݷ������򡾷����Կ�����|EXIT _SUB
    FIND $%PART2PART.Check%=0,!!
    {
        FIND $%&PARTSEL1%=,!!FIND $%&PARTSEL2%=,!!TEAM MESS ����û��ѡ�������%&NLDD%%&NLDD%��ѡ�������|EXIT _SUB
        FIND $%RERADI.Check%=1,
        {
            RSTR &&REL4=4,%STATUS3%
            FIND $%&REL4%=.GHO, TEAM CALL REGHOST|EXIT _SUB
            LPOS* &&WIMFlag=->,1,%STATUS3%
            IFEX $%&WIMFlag% > 0, TEAM CALL RESTOREWIM|EXIT _SUB
            FIND $%&REL4%=.ISO, TEAM MESS. ����ǰѡ����%GHOLIST%�ļ���%&NLDD%%&NLDD%����ѡһ�´�ISO�ļ���������û������Ҫ�ľ���|EXIT _SUB
            FIND $%&REL4%=.WIM, TEAM MESS. ����ǰѡ����%GHOLIST%�ļ���%&NLDD%%&NLDD%����ѡһ�´�WIM�ļ���������û������Ҫ�ľ�|EXIT _SUB
            FIND $%&REL4%=.ESD, TEAM MESS. ����ǰѡ����%GHOLIST%�ļ���%&NLDD%%&NLDD%����ѡһ�´�ESD�ļ���������û������Ҫ�ľ�|EXIT _SUB
            FIND $%&REL4%=.SWM, TEAM MESS. ����ǰѡ����%GHOLIST%�ļ���%&NLDD%%&NLDD%����ѡһ�´�SWM�ļ���������û������Ҫ�ľ�|EXIT _SUB
            TEAM MESS ����û��ѡ����|EXIT _SUB
        }
        FIND $%BKRADI.Check%=1,
        {
            MSTR &&BKBLANK=<1>%GHOBACK%
            FIND $%&BKBLANK%=,TEAM MESS ����û��ѡ�񱣴�·����|EXIT _SUB
            RSTR &&BKEXT=4,%GHOBACK%
            FIND $%&BKEXT%=.WIM, TEAM CALL BACKUPWIM|EXIT _SUB
            FIND $%&BKEXT%=.ESD, TEAM CALL BACKUPWIM|EXIT _SUB
            CALL BKGHOST
        }
    }
    FIND $%PART2PART.Check%=1,!!
    {
        FIND $%SPART%=,TEAM MESS ����û��ѡ��Դ������|EXIT _SUB
        FIND $%DPART%=,TEAM MESS ����û��ѡ��Ŀ�������|EXIT _SUB
        CALL P2PDUMP
    }
_END

_SUB REGHOST
    LPOS &&pPOS=��,1,%STATUS3%
    CALC #&pPOS = %&pPOS% + 1
    MSTR &&pFILE=%&pPOS%,0,%STATUS3%
    FDRV &&pDrv=%&pFILE%
    FIND $%&pDrv%=%&PARTSEL2%,TEAM MESS GHO�������ڷ�����Ŀ�������ͬ���޷���ԭ��%&NLDD%%&NLDD%�ɽ���GHO�����Ƶ����������ٽ��л�ԭ��|EXIT _SUB
    FEXT &&pEXT=%GHOLIST%
    FIND $%&pEXT%=ISO,
    {
        FDRV &&pDrv2=%GHOLIST%
        FIND $%&pDrv2%=%&PARTSEL2%,TEAM MESS ISO�ļ����ڷ�����Ŀ�������ͬ���޷���ԭ��%&NLDD%%&NLDD%�ɽ���ISO�ļ����Ƶ����������ٽ��л�ԭ��|EXIT _SUB        
    }
    TEAM ENVI &&szNoIDE=| ENVI &&pCRC=| ENVI &&PWDRE=|ENVI &&szNoUSB=
    CALL CRPWD "%&pFILE%"
    FDRV &&szDrv=%GHOLIST%
    CALL GetNoIDENoUSB %pBusType% %&szDrv%
    FIND $%advCRC.Check%=1, ENVI &pCRC=-crcignore
    IFEX %&pFILE%, TEAM CALL OnRestore|EXIT _SUB
    MESS �Ҳ�����ѡGHO����
_END

_SUB GetNoIDENoUSB
    TEAM ENVI &&szTYPE=|ENVI &&szBUS=0|ENVI &&nBUS=|ENVI &&Drv=
    ENVI &nBUS=%1
    ENVI &Drv=%2
    FORM &szTYPE,&szBUS=%&Drv%
    IFEX $%&nBUS% = 3,! IFEX $%&szBUS% = 3,! ENVI &szNoIDE=-noide
    IFEX $%&nBUS% = 7,! IFEX $%&szBUS% = 7,! ENVI &szNoUSB=-nousb
_END

_SUB ASKGHORestore,W432H172,��ԭ����,,#1,
    ENVI &&dstPart=
    FIND $%&PARTSEL2%=  , ENVI &dstPart=%&PARTSEL1% ����! ENVI &dstPart=%&PARTSEL2%
    LABE. -left ,L26T16W400H31,��"%&pFILE%"��ԭ�� %&dstPart%,,0xFF0000
    LABE ,L26T56W61H18,��ɺ�,,
    CHEK GHORestoreSHUT,L230T53W62H18,�ػ�,CALL GHOReSHUTRB1,0
    CHEK GHORestoreRB,L295T53W62H18,����,CALL GHOReSHUTRB2,0
    ITEM ,L226T98W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L326T98W80H28,ȡ ��,KILL \,
_END

_SUB GHOReSHUTRB1
    FIND $%GHORestoreSHUT.Check%=1, ENVI @GHORestoreRB.Check=0
_END

_SUB GHOReSHUTRB2
    FIND $%GHORestoreRB.Check%=1, ENVI @GHORestoreSHUT.Check=0
_END

_SUB OnRestore
    IFEX $%&PEPOS% = 0,!! FIND $%&PARTSEL2%=%SYSTEMDRIVE%,!! TEAM MESS �뵽PE�л�ԭϵͳ|EXIT _SUB
    ENVI &&IsConfirm=0
    CALL ASKGHORestore
    FIND $%&IsConfirm%=0, EXIT _SUB
    TEAM ENVI &&TDrvNum=|ENVI &&Tstyle=|ENVI &&EFIDrive=|ENVI &&ActiveDrv=
    CALL GetTargetPartitionInfo
    // ��̬����
    FIND $%&PARTSEL5%=Dynamic, CALL GetNumberOfVolume
    ENVI @MHGHO2012.Visable=0
    ENVI &&RUNINFO1=0
    EXEC* -exe:*#200 &RUNINFO1=!ghost.exe -clone,mode=pload,src="%&pFILE%":1,dst=%&PARTSEL1% -batch %&szNoIDE% %&szNoUSB% %&pCRC% %&PWDRE% %paras%
    FIND $%&RUNINFO1%=,
    { 
        MESS+icon102 ��ԭ�ɹ���@��ԭ���� #OK *3000 $1
        CALL AutomaticGuidanceRepair      
        FIND $%GHORestoreSHUT.Check%=1, ENVI &SHUTorREBOOT=1
        FIND $%GHORestoreRB.Check%=1, ENVI &SHUTorREBOOT=2
        ENVI @MHGHO2012.Visable=1
        KILL @MHGHO2012
        EXIT _SUB
    }
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    FILE ghstwarn.txt
    ENVI &&ERRPOS=0
    LPOS* &ERRPOS=T: 36002,1,%&RUNINFO1%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS �û���ֹ����ԭʧ�ܣ�@��ԭ���� #OK *5000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    
    FIND $%&PARTSEL5%=Dynamic,!!
    {
        ENVI &&RUNINFO2=0
        EXEC* -exe:*#200 &RUNINFO2=!ghost.EXE -clone,mode=pload,src="%&pFILE%":1,dst=@OS:%&DrvLettBackup% -batch %&szNoIDE% %&szNoUSB% %&pCRC% %&PWDRE% %paras%
        FIND $%&RUNINFO2%=,
        {
            MESS+icon102 ��ԭ�ɹ���@��ԭ���� #OK *3000 $1
            FIND $%GHORestoreSHUT.Check%=1, ENVI &SHUTorREBOOT=1
            FIND $%GHORestoreRB.Check%=1, ENVI &SHUTorREBOOT=2
            ENVI @MHGHO2012.Visable=1
            KILL @MHGHO2012
            EXIT _SUB
        }
        FILE ghost*.dmp
        FILE GHOSTERR.TXT
        LPOS* &ERRPOS=T: 36002,1,%&RUNINFO2%
        IFEX $%&ERRPOS% > 0,!!
        {
            MESS �û���ֹ����ԭʧ�ܣ�@��ԭ���� #OK *5000 $1
            ENVI @MHGHO2012.Visable=1
            EXIT _SUB
        }
    }
    // ����ƫ��ֵ������Ļ� ---��ʼ��ԭ-----
    FIND $%&DrvLettBackup%=,! FIND $%&PARTSEL5%=Dynamic,!
    {
        ENVI &&RUNINFO2=0
        EXEC* -exe:*#200 &RUNINFO2=!ghost.EXE -clone,mode=pload,src="%&pFILE%":1,dst=@OS:%&DrvLettBackup% -batch %&szNoIDE% %&szNoUSB% %&pCRC% %&PWDRE% %paras%
        FIND $%&RUNINFO2%=,
        {
            MESS+icon102 ��ԭ�ɹ���@��ԭ���� #OK *3000 $1
            FIND $%GHORestoreSHUT.Check%=1, ENVI &SHUTorREBOOT=1
            FIND $%GHORestoreRB.Check%=1, ENVI &SHUTorREBOOT=2
            ENVI @MHGHO2012.Visable=1
            KILL @MHGHO2012
            EXIT _SUB
        }
        FILE ghost*.dmp
        FILE GHOSTERR.TXT
        LPOS* &ERRPOS=T: 36002,1,%&RUNINFO2%
        IFEX $%&ERRPOS% > 0,!!
        {
            MESS �û���ֹ����ԭʧ�ܣ�@��ԭ���� #OK *5000 $1
            ENVI @MHGHO2012.Visable=1
            EXIT _SUB
        }
    }
    // ����ƫ��ֵ������Ļ� ---������ԭ-----
    MESS ��ԭʧ�ܣ�@��ԭ���� #OK *3000 $1
    ENVI @MHGHO2012.Visable=1
_END

_SUB ASKGHOBackup,W432H172,���ݷ���,,#1,,
    ENVI &&dstPart=
    FIND $%&PARTSEL2%=  , ENVI &dstPart=%&PARTSEL1% ����! ENVI &dstPart=%&PARTSEL2%
    LABE. -left ,L26T16W400H31,�� %&dstPart% ���ݵ�"%&BGHOPATH%",,0xFF0000
    LABE ,L26T56W61H18,��ɺ�,,
    CHEK GHOBackupSHUT,L88T53W62H18,�ػ�,CALL GHOBkSHUTRB1,0
    CHEK GHOBackupRB,L152T53W62H18,����,CALL GHOBkSHUTRB2,0
    ITEM ,L226T98W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L326T98W80H28,ȡ ��,KILL \,
_END

_SUB GHOBkSHUTRB1
    FIND $%GHOBackupSHUT.Check%=1, ENVI @GHOBackupRB.Check=0
_END

_SUB GHOBkSHUTRB2
    FIND $%GHOBackupRB.Check%=1, ENVI @GHOBackupSHUT.Check=0
_END

_SUB ASKExistGHOBackup,W432H200,���ݷ���,,#1,,
    ENVI &&dstPart=
    FIND $%&PARTSEL2%=  , ENVI &dstPart=%&PARTSEL1% ����! ENVI &dstPart=%&PARTSEL2%
    LABE. -left ,L26T16W400H31,�� %&dstPart% ���ݵ�"%&BGHOPATH%",,0xFF0000
    LABE. -left ,L26T54W360H18,������ԭ�еı����ļ���,,0x0000FF
    LABE ,L26T86W61H18,��ɺ�,,
    CHEK ExistGHOBackupSHUT,L88T83W62H18,�ػ�,CALL ExistGHOBkSHUTRB1,0
    CHEK ExistGHOBackupRB,L152T83W62H18,����,CALL ExistGHOBkSHUTRB2,0
    ITEM ,L230T120W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L330T120W80H28,ȡ ��,KILL \,
_END

_SUB ExistGHOBkSHUTRB1
    FIND $%ExistGHOBackupSHUT.Check%=1, ENVI @ExistGHOBackupRB.Check=0
_END

_SUB ExistGHOBkSHUTRB2
    FIND $%ExistGHOBackupRB.Check%=1, ENVI @ExistGHOBackupSHUT.Check=0
_END

_SUB CheckBKPathLegal
    ENVI &&DrvORNum=%~1
    STRL &iLen=%&DrvORNum%
    IFEX $%&iLen% > 2, TEAM CALL CheckLegalByNum "%&DrvORNum%"|EXIT _SUB
    IFEX $%&iLen% = 2, TEAM ENVI &RealBKDrvLett=%&DrvORNum%|CALL CheckLegalByDrv "%&DrvORNum%"
_END

_SUB CheckLegalByNum
    ENVI &&szDrvPartNum=%~1
    TEAM ENVI &&RChar1=|ENVI &&DrvPartNum=|ENVI &&vLn=|ENVI &&A1=|ENVI &&A2=
    RSTR &RChar1=1,%&szDrvPartNum%
    FIND $%&RChar1%=:,MSTR &DrvPartNum=-2,0,%&szDrvPartNum%! ENVI &DrvPartNum=%&szDrvPartNum%
    FORX *NL &vFORM,&vLn,
    {
        MSTR* &A1,&A2=<1><2>%&vLn%
        FIND $%&A1%=%&DrvPartNum%, TEAM ENVI &legalDrv=%&A2%|EXIT FORX
    }
    FIND $%&legalDrv%=,! FIND $%&legalDrv%=  ,! ENVI &RealBKDrvLett=%&legalDrv%
_END

_SUB CheckLegalByDrv
    ENVI &&Drv=%~1
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A2=
    FORX *NL &vFORM,&vLn,
    {
        MSTR* &A1,&A2=<1><2>%&vLn%
        FIND $%&A2%=%&Drv%,TEAM ENVI &legalNum=%&A1%|EXIT FORX
    }
_END

_SUB BKGHOST
    TEAM ENVI &&pBLK=|ENVI &&szDrive=|ENVI &&szDrvPOS=0|ENVI &&szBKPATH=
    MSTR &pBLK=<1->%GHOBACK%
    LPOS &szDrvPOS=\,1,%&pBLK%
    IFEX $%&szDrvPOS% = 0, TEAM MESS ��ѡ��Ϸ��ı���·����|EXIT _SUB
    MSTR &szBKPATH=%&szDrvPOS%,0,%&pBLK%
    CALC #&szDrvPOS = %&szDrvPOS% - 1
    LSTR &szDrive=%&szDrvPOS%,%&pBLK%
    TEAM ENVI &&legalDrv=|ENVI &&legalNum=|ENVI &&RealBKDrvLett=
    CALL CheckBKPathLegal "%&szDrive%"
    FIND $%&legalDrv%=,!! FIND $%&legalNum%=,!! TEAM MESS ���ݵı���·�����Ϸ���������ָ����|EXIT _SUB
    FIND $%&RealBKDrvLett%=%&PARTSEL2%, TEAM MESS �޷��ѱ����ļ����浽Ҫ���ݵķ�����%&NLDD%%&NLDD%������ѡ�񱣴�·����|EXIT _SUB
    // ������ݵ�����������ʾ
    FIND $%&RealBKDrvLett%=,!
    {
        TEAM ENVI &&szBKTYPE=|ENVI &&dwBKBUS=0
        FORM &szBKTYPE,&dwBKBUS=%&RealBKDrvLett%
        FIND $DRIVE_CDROM=%&szBKTYPE%, TEAM MESS �޷����ݵ�����%&RealBKDrvLett%�У�������ָ������·����|EXIT _SUB
    }
    RSTR &&BKL4=4,%&pBLK%
    FIND $%&RealBKDrvLett%=,
    {
        FIND $%&BKL4%=.GHO, ENVI &BGHOPATH=%&pBLK%! ENVI &BGHOPATH=%&pBLK%.GHO
    }
    FIND $%&RealBKDrvLett%=,!
    {
        FIND $%&BKL4%=.GHO, ENVI &BGHOPATH=%&RealBKDrvLett%%&szBKPATH%! ENVI &BGHOPATH=%&RealBKDrvLett%%&szBKPATH%.GHO
    }
    RPOS &&pDIR=\,1,%&BGHOPATH%
    LSTR &&pMKDIR=%&pDIR%,%&BGHOPATH%
    ENVI &&ExistFolder=0
    IFEX %&pMKDIR%, ENVI &ExistFolder=1!MDIR %&pMKDIR%
    FIND $%HideFolder.Check%=1, IFEX %&pMKDIR%, SITE %&pMKDIR%,+H
    MSTR &&pSIZE=<1>%advBL02%
    TEAM ENVI &&szNoIDE=|ENVI &&szNoUSB=| ENVI &&BKPWD=| ENVI &&pCMPR=-z1| ENVI &&pSPLIT=-split=%&pSIZE%
    FIND $%advPWD1.Check%=1,
    {
        FIND $%advEDIT1%=,!
        {
            TEAM ENVI &&realPWD=|ENVI &&PL=
            ENVI &realPWD=%advEDIT1%
            STRL &PL=%&realPWD%
            IFEX $%&PL% > 10, LSTR &realPWD=10,%&realPWD%
            ENVI &BKPWD=-pwd="%&realPWD%"
        }
    }
    CALL GetNoIDENoUSB %pBusType% %&szDrive%
    FIND $%advBL01%=��ѹ��, ENVI &pCMPR=
    FIND $%advBL01%=��ѹ��, ENVI &pCMPR=-z3
    FIND $%advBL01%=����ѹ��, ENVI &pCMPR=-z9
    FIND $%advBL02%=���־�, ENVI &pSPLIT=-split=0
    FIND $%advBL02%=�Զ����, ENVI &pSPLIT=
    TEAM ENVI &&IsConfirm=0|ENVI &&dstFileExist=0
    IFEX %&BGHOPATH%, TEAM ENVI &dstFileExist=1|CALL ASKExistGHOBackup! CALL ASKGHOBackup
    FIND $%&IsConfirm%=0,
    {
        IFEX $%&ExistFolder% = 0,!!
        {
            MSTR &&KillDir=-2,0,%&pMKDIR%
            SITE %&KillDir%,-H-S-R
            PATH #%&KillDir%
        }
        EXIT _SUB
    }
    TEAM ENVI &&CurrentSystem=0|ENVI &&BackupSuccess=0
    TEAM ENVI &&iTIME=|ENVI &&NewGHOTime=0|ENVI &&NewGHOSize=0
    TEAM ENVI &&T1=|ENVI &&T2=|ENVI &&T3=|ENVI &&T4=|ENVI &&T5=|ENVI &&T6=|ENVI &&T7=
    IFEX $%&PEPOS% = 0,!! FIND $%&PARTSEL2%=%SYSTEMDRIVE%,!! ENVI &CurrentSystem=1
    ENVI &OldGHOExist=0
    IFEX %&BGHOPATH%,
    {
        ENVI &OldGHOExist=1
        SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &OldGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    FIND $%&PARTSEL5%=Dynamic, CALL GetNumberOfVolume
    IFEX $%&CurrentSystem% = 1,!!
    {
        PUTF %SystemRoot%\bootstat.dat,0x08#0x02,0x00 0x00
        FIND $%&RealBKDrvLett%=,! TEAM ENVI &I=0|ENVI @&KillGHOTimer=2000
    }
    ENVI @MHGHO2012.Visable=0
    TEAM ENVI &&RUNINFO1=0|ENVI &&report=0|ENVI &KillGHOFlag=0
    EXEC* -exe:*#200 &RUNINFO1=!ghost.EXE -clone,mode=pdump,src=%&PARTSEL1%,dst="%&BGHOPATH%" -batch %&szNoIDE% %&szNoUSB% %&BKPWD% %&pCMPR% %&pSPLIT% %paras%
    ENVI @&KillGHOTimer=0
    IFEX %&BGHOPATH%,
    {
        SIZE &NewGHOSize=%&BGHOPATH%
        SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &NewGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    IFEX $%&KillGHOFlag% = 1,!!
    {
        FIND $%&PARTSEL5%=Dynamic,!
        {
            MESS �޷��ȱ��ݵ�ǰϵͳ������PE�б��ݡ�@���ݷ��� #OK *5000 $1
            FILE ghost*.dmp
            FILE GHOSTERR.TXT
            FILE ghstwarn.txt
            FIND $%&NewGHOTime%=%&OldGHOTime%,! FILE %&BGHOPATH%
            IFEX $%&ExistFolder% = 0,!!
            {
                MSTR &&KillDir=-2,0,%&pMKDIR%
                SITE %&KillDir%,-H-S-R
                PATH #%&KillDir%
            }
            ENVI @MHGHO2012.Visable=1            
            EXIT _SUB
        }
    }
    IFEX $%&KillGHOFlag% = 0,
    {
    FIND $%&RUNINFO1%=,
    {
        IFEX %&BGHOPATH%,
        {
            IFEX $%&OldGHOExist% = 1,!!
            {
                FIND $%&NewGHOTime%=%&OldGHOTime%,!!
                {
                    FIND $%&PARTSEL5%=Dynamic,! TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                }
                FIND $%&NewGHOTime%=%&OldGHOTime%,!
                {
                    IFEX $%&CurrentSystem% = 1, CALL CheckBackupSuccess %&NewGHOSize%
                    IFEX $%&CurrentSystem% = 0,!!
                    {
                        IFEX $%&NewGHOSize% = 0,!
                        {
                            MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                            IFEX $%&dstFileExist% = 0,!!
                            {
                                FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                            }
                            IFEX $%&dstFileExist% = 1,!!
                            {
                                FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                            }
                            ENVI @MHGHO2012.Visable=1
                            KILL @MHGHO2012
                            EXIT _SUB
                        }
                        IFEX $%&NewGHOSize% = 0,!! FIND $%&PARTSEL5%=Dynamic,! TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                    }
                }
            }
            IFEX $%&OldGHOExist% = 0,!!
            {
                IFEX $%&CurrentSystem% = 1, CALL CheckBackupSuccess %&NewGHOSize%
                IFEX $%&CurrentSystem% = 0,!!
                {
                    IFEX $%&NewGHOSize% = 0,!
                    {
                        MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                        IFEX $%&dstFileExist% = 0,!!
                        {
                            FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                            FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                        }
                        IFEX $%&dstFileExist% = 1,!!
                        {
                            FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                            FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                        }
                        ENVI @MHGHO2012.Visable=1
                        KILL @MHGHO2012
                        EXIT _SUB
                    }
                    IFEX $%&NewGHOSize% = 0,!! FIND $%&PARTSEL5%=Dynamic,! TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                }
            }
            IFEX $%&BackupSuccess% = 1,!!
            {
                MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                IFEX $%&dstFileExist% = 0,!!
                {
                    FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                    FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                }
                IFEX $%&dstFileExist% = 1,!!
                {
                    FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                    FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                }
                ENVI @MHGHO2012.Visable=1
                KILL @MHGHO2012
                EXIT _SUB
            }
        }
        IFEX %&BGHOPATH%,!
        {
            FIND $%&PARTSEL5%=Dynamic,!
            {
                TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
            }
        }
    }
    }
    // �������һ�������Ŷ�Ӧ&KillGHOFlag
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    FILE ghstwarn.txt
    FIND $%&NewGHOTime%=%&OldGHOTime%,! FILE %&BGHOPATH%
    IFEX $%&ExistFolder% = 0,!!
    {
        MSTR &&KillDir=-2,0,%&pMKDIR%
        SITE %&KillDir%,-H-S-R
        PATH #%&KillDir%
    }
    ENVI &&ERRPOS=0
    LPOS* &ERRPOS=T: 651,1,%&RUNINFO1%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@���ݷ��� #OK *10000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    LPOS* &ERRPOS=T: 519,1,%&RUNINFO1%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@���ݷ��� #OK *10000 $1
        ENVI @MHGHO2012.Visable=1        
        EXIT _SUB
    }
    LPOS* &ERRPOS=T: 36002,1,%&RUNINFO1%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS �û���ֹ������ʧ�ܣ�@���ݷ��� #OK *5000 $1
        ENVI @MHGHO2012.Visable=1        
        EXIT _SUB
    }  
    FIND $%&PARTSEL5%=Dynamic,!!
    {
        ENVI &ExistFolder=0
        IFEX %&pMKDIR%, ENVI &ExistFolder=1!MDIR %&pMKDIR%
        FIND $%HideFolder.Check%=1, IFEX %&pMKDIR%, SITE %&pMKDIR%,+H
        ENVI &OldGHOExist=0
        IFEX %&BGHOPATH%,
        {
            ENVI &OldGHOExist=1
            SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
            MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
            ENVI &OldGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
        }
        ENVI &&RUNINFO2=0
        ENVI &report=0
        EXEC* -exe:*#200 &RUNINFO2=!ghost.EXE -clone,mode=pdump,src=@OS:%&DrvLettBackup%,dst="%&BGHOPATH%" -batch %&szNoIDE% %&szNoUSB% %&BKPWD% %&pCMPR% %&pSPLIT% %paras%
       
        IFEX %&BGHOPATH%,
        {
            SIZE &NewGHOSize=%&BGHOPATH%
            SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
            MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
            ENVI &NewGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
        }
        FIND $%&RUNINFO2%=,
        {
            IFEX %&BGHOPATH%,!!
            {
                IFEX $%&OldGHOExist% = 1,!!
                {
                    FIND $%&NewGHOTime%=%&OldGHOTime%,!!
                    {
                        TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                    }
                    FIND $%&NewGHOTime%=%&OldGHOTime%,!
                    {
                        IFEX $%&CurrentSystem% = 1, CALL CheckBackupSuccess %&NewGHOSize%
                        IFEX $%&CurrentSystem% = 0,!!
                        {
                            IFEX $%&NewGHOSize% = 0,!
                            {
                                MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                                IFEX $%&dstFileExist% = 0,!!
                                {
                                    FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                    FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                                }
                                IFEX $%&dstFileExist% = 1,!!
                                {
                                    FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                    FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                                }
                                ENVI @MHGHO2012.Visable=1
                                KILL @MHGHO2012
                                EXIT _SUB
                            }
                            IFEX $%&NewGHOSize% = 0, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                        }
                    }
                }
                IFEX $%&OldGHOExist% = 0,!!
                {
                    IFEX $%&CurrentSystem% = 1, CALL CheckBackupSuccess %&NewGHOSize%
                    IFEX $%&CurrentSystem% = 0,!!
                    {
                        IFEX $%&NewGHOSize% = 0,!
                        {
                            MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                            IFEX $%&dstFileExist% = 0,!!
                            {
                                FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                            }
                            IFEX $%&dstFileExist% = 1,!!
                            {
                                FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                            }
                            ENVI @MHGHO2012.Visable=1
                            KILL @MHGHO2012
                            EXIT _SUB
                        }
                        IFEX $%&NewGHOSize% = 0, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                    }
                }
                IFEX $%&BackupSuccess% = 1,!!
                {
                    MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                    IFEX $%&dstFileExist% = 0,!!
                    {
                        FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                        FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                    }
                    IFEX $%&dstFileExist% = 1,!!
                    {
                        FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                        FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                    }
                    ENVI @MHGHO2012.Visable=1
                    KILL @MHGHO2012
                    EXIT _SUB
                }
            }
            IFEX %&BGHOPATH%,! TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
       }
       FILE ghost*.dmp
       FILE GHOSTERR.TXT
       FIND $%&NewGHOTime%=%&OldGHOTime%,! FILE %&BGHOPATH%
       IFEX $%&ExistFolder% = 0,!!
       {
           MSTR &&KillDir=-2,0,%&pMKDIR%
           SITE %&KillDir%,-H-S-R
           PATH #%&KillDir%
       }
       LPOS* &ERRPOS=T: 651,1,%&RUNINFO2%
       IFEX $%&ERRPOS% > 0,!!
       {
           MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@���ݷ��� #OK *10000 $1
           ENVI @MHGHO2012.Visable=1
           EXIT _SUB
       }
       LPOS* &ERRPOS=T: 519,1,%&RUNINFO2%
       IFEX $%&ERRPOS% > 0,!!
       {
           MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@���ݷ��� #OK *10000 $1
           ENVI @MHGHO2012.Visable=1
           EXIT _SUB
       }
       LPOS* &ERRPOS=T: 36002,1,%&RUNINFO2%
       IFEX $%&ERRPOS% > 0,!!
       {
           MESS �û���ֹ������ʧ�ܣ�@���ݷ��� #OK *5000 $1
           ENVI @MHGHO2012.Visable=1         
           EXIT _SUB
       }
    }
    // ����ƫ��ֵ������Ļ� ---��ʼ-----
    FIND $%&DrvLettBackup%=,! FIND $%&PARTSEL5%=Dynamic,!
    {
        ENVI &ExistFolder=0
        IFEX %&pMKDIR%, ENVI &ExistFolder=1!MDIR %&pMKDIR%
        FIND $%HideFolder.Check%=1, IFEX %&pMKDIR%, SITE %&pMKDIR%,+H
        ENVI &OldGHOExist=0
        IFEX %&BGHOPATH%,
        {
            ENVI &OldGHOExist=1
            SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
            MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
            ENVI &OldGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
        }
        ENVI &&RUNINFO2=0
        ENVI &report=0
        EXEC* -exe:*#200 &RUNINFO2=!ghost.EXE -clone,mode=pdump,src=@OS:%&DrvLettBackup%,dst="%&BGHOPATH%" -batch %&szNoIDE% %&szNoUSB% %&BKPWD% %&pCMPR% %&pSPLIT% %paras%
       
        IFEX %&BGHOPATH%,
        {
            SIZE &NewGHOSize=%&BGHOPATH%
            SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
            MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
            ENVI &NewGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
        }
        FIND $%&RUNINFO2%=,
        {
            IFEX %&BGHOPATH%,!!
            {
                IFEX $%&OldGHOExist% = 1,!!
                {
                    FIND $%&NewGHOTime%=%&OldGHOTime%,!!
                    {
                        TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                    }
                    FIND $%&NewGHOTime%=%&OldGHOTime%,!
                    {
                        IFEX $%&CurrentSystem% = 1, CALL CheckBackupSuccess %&NewGHOSize%
                        IFEX $%&CurrentSystem% = 0,!!
                        {
                            IFEX $%&NewGHOSize% = 0,!
                            {
                                MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                                IFEX $%&dstFileExist% = 0,!!
                                {
                                    FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                    FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                                }
                                IFEX $%&dstFileExist% = 1,!!
                                {
                                    FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                    FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                                }
                                ENVI @MHGHO2012.Visable=1
                                KILL @MHGHO2012
                                EXIT _SUB
                            }
                            IFEX $%&NewGHOSize% = 0, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                        }
                    }
                }
                IFEX $%&OldGHOExist% = 0,!!
                {
                    IFEX $%&CurrentSystem% = 1, CALL CheckBackupSuccess %&NewGHOSize%
                    IFEX $%&CurrentSystem% = 0,!!
                    {
                        IFEX $%&NewGHOSize% = 0,!
                        {
                            MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                            IFEX $%&dstFileExist% = 0,!!
                            {
                                FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                            }
                            IFEX $%&dstFileExist% = 1,!!
                            {
                                FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                                FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                            }
                            ENVI @MHGHO2012.Visable=1
                            KILL @MHGHO2012
                            EXIT _SUB
                        }
                        IFEX $%&NewGHOSize% = 0, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
                    }
                }
                IFEX $%&BackupSuccess% = 1,!!
                {
                    MESS+icon102 ���ݳɹ���@���ݷ��� #OK *3000 $1
                    IFEX $%&dstFileExist% = 0,!!
                    {
                        FIND $%GHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                        FIND $%GHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                    }
                    IFEX $%&dstFileExist% = 1,!!
                    {
                        FIND $%ExistGHOBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                        FIND $%ExistGHOBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                    }
                    ENVI @MHGHO2012.Visable=1
                    KILL @MHGHO2012
                    EXIT _SUB
                }
            }
            IFEX %&BGHOPATH%,! TEAM ENVI &report=1|MESS ����ʧ�ܣ� @���ݷ��� #OK *3000 $1
       }
       FILE ghost*.dmp
       FILE GHOSTERR.TXT
       FIND $%&NewGHOTime%=%&OldGHOTime%,! FILE %&BGHOPATH%
       IFEX $%&ExistFolder% = 0,!!
       {
           MSTR &&KillDir=-2,0,%&pMKDIR%
           SITE %&KillDir%,-H-S-R
           PATH #%&KillDir%
       }
       LPOS* &ERRPOS=T: 651,1,%&RUNINFO2%
       IFEX $%&ERRPOS% > 0,!!
       {
           MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@���ݷ��� #OK *10000 $1
           ENVI @MHGHO2012.Visable=1        
           EXIT _SUB
       }
       LPOS* &ERRPOS=T: 519,1,%&RUNINFO2%
       IFEX $%&ERRPOS% > 0,!!
       {
           MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@���ݷ��� #OK *10000 $1
           ENVI @MHGHO2012.Visable=1           
           EXIT _SUB
       }
       LPOS* &ERRPOS=T: 36002,1,%&RUNINFO2%
       IFEX $%&ERRPOS% > 0,!!
       {
           MESS �û���ֹ������ʧ�ܣ�@���ݷ��� #OK *5000 $1
           ENVI @MHGHO2012.Visable=1
           EXIT _SUB
       }
    }
    // ����ƫ��ֵ������Ļ� ---����-----
    IFEX $%&report% = 0, MESS ����ʧ�ܣ�@���ݷ��� #OK *3000 $1
    ENVI @MHGHO2012.Visable=1
_END

_SUB CheckBackupSuccess
    ENVI &&GHOSize=%1
    FIND $%&VERNUM%=5.1,!!
    {
        IFEX $%&GHOSize% >= 100M, ENVI &BackupSuccess=1
        EXIT _SUB
    }
    FIND $%&VERNUM%=5.2,!!
    {
        IFEX $%&GHOSize% >= 100M, ENVI &BackupSuccess=1
        EXIT _SUB
    }
    FIND $%&VERNUM%=6.0,!!
    {
        IFEX $%&GHOSize% >= 280M, ENVI &BackupSuccess=1
        EXIT _SUB
    }
    FIND $%&VERNUM%=6.1,!!
    {
        IFEX $%&GHOSize% >= 300M, ENVI &BackupSuccess=1
        EXIT _SUB
    }
    IFEX $%&VERNUM% > 6.1,!!
    {
        IFEX $%&GHOSize% >= 450M, ENVI &BackupSuccess=1
        EXIT _SUB
    }
    IFEX $%&VERNUM% < 5.1,!!
    {
        IFEX $%&GHOSize% >= 80M, ENVI &BackupSuccess=1
        EXIT _SUB
    }
_END

_SUB OnKillGHOTimer
    CALC #&I = %&I% + 2
    TEAM ENVI &&iTIME=|ENVI &&T1=|ENVI &&T2=|ENVI &&T3=|ENVI &&T4=|ENVI &&T5=|ENVI &&T6=|ENVI &&T7=
    IFEX %&BGHOPATH%,
    {
        SIZE &CheckGHOSize=%&BGHOPATH%
        SITE ?-local ,&iTIME=FTIME,%&BGHOPATH%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &CheckGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    IFEX $%&I% < 40,!!
    {
        IFEX $%&OldGHOExist% = 0,!! IFEX %&BGHOPATH%,!! IFEX $%&CheckGHOSize% = 0,! TEAM ENVI @&KillGHOTimer=0|EXIT _SUB
        IFEX $%&OldGHOExist% = 1,!! FIND $%&CheckGHOTime%=%&OldGHOTime%,! IFEX $%&CheckGHOSize% = 0,! TEAM ENVI @&KillGHOTimer=0|EXIT _SUB
    }
    IFEX $%&I% >= 40,!!
    {
        ENVI @&KillGHOTimer=0
        IFEX %&BGHOPATH%,!
        {
            ENVI &KillGHOFlag=1
            KILL *force ghost.EXE
            FILE ghost*.dmp
            FILE GHOSTERR.TXT
            FILE ghstwarn.txt
            EXIT _SUB
        }
        IFEX %&BGHOPATH%,!!
        {
            IFEX $%&OldGHOExist% = 0,
            {
                IFEX $%&CheckGHOSize% = 0,! EXIT _SUB
                IFEX $%&CheckGHOSize% = 0,!!
                {
                    ENVI &KillGHOFlag=1
                    KILL *force ghost.EXE
                    FILE ghost*.dmp
                    FILE GHOSTERR.TXT
                    FILE ghstwarn.txt
                    EXIT _SUB
                }
            }
            IFEX $%&OldGHOExist% = 1,
            {
                FIND $%&CheckGHOTime%=%&OldGHOTime%,!!
                {
                    ENVI &KillGHOFlag=1
                    KILL *force ghost.EXE
                    FILE ghost*.dmp
                    FILE GHOSTERR.TXT
                    FILE ghstwarn.txt
                    EXIT _SUB
                }
                FIND $%&CheckGHOTime%=%&OldGHOTime%,!
                {
                    IFEX $%&CheckGHOSize% = 0,! EXIT _SUB
                    IFEX $%&CheckGHOSize% = 0,!!
                    {
                        ENVI &KillGHOFlag=1
                        KILL *force ghost.EXE
                        FILE ghost*.dmp
                        FILE GHOSTERR.TXT
                        FILE ghstwarn.txt
                        EXIT _SUB
                    }
                }
            }
        }
    }
_END

_SUB ASKPartitionClone,W320H202,�����Կ�,,#1,,
    TEAM ENVI &&srcDRVforWIN=|ENVI &&dstDRVforWIN=
    FIND $%&SRSLett%=, ENVI &srcDRVforWIN=%&SRCNUM%! ENVI &srcDRVforWIN=%&SRSLett%
    FIND $%&DSTLett%=, ENVI &dstDRVforWIN=%&DSTNUM%! ENVI &dstDRVforWIN=%&DSTLett%
    LABE -left ,L26T16W290H31,�� %&srcDRVforWIN% ������¡�� %&dstDRVforWIN% ����,,0xFF0000
    LABE -left ,L26T56W290H24,Ŀ������ϵ��������ݽ��ᱻ���ǣ�,,0x0000FF
    LABE ,L26T86W61H18,��ɺ�,,
    CHEK PCloneSHUT,L88T83W62H18,�ػ�,CALL PCloneSHUTRB1,0
    CHEK PCloneRB,L152T83W62H18,����,CALL PCloneSHUTRB2,0
    ITEM ,L120T128W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L220T128W80H28,ȡ ��,KILL \,
_END

_SUB PCloneSHUTRB1
    FIND $%PCloneSHUT.Check%=1, ENVI @PCloneRB.Check=0
_END

_SUB PCloneSHUTRB2
    FIND $%PCloneRB.Check%=1, ENVI @PCloneSHUT.Check=0
_END

_SUB P2PDUMP
    MSTR &&SRCNUM,&&SRSLett=<1><2>%SPART%
    MSTR &&DSTNUM,&&DSTLett=<1><2>%DPART%
    FIND $%&SRCNUM%=%&DSTNUM%,TEAM MESS Դ������Ŀ�������ͬ��%&NLDD%%&NLDD%�޷����з����Կ���|EXIT _SUB
    IFEX $%&PEPOS% = 0,!!
    {
        FIND $%&SystemNumber%=%&DSTNUM%,TEAM MESS Ŀ�����Ϊϵͳ�̣�Ҫ�����Կ�������PE�½��С�|EXIT _SUB
        FIND $%SYSTEMDRIVE%=%&DSTNUM%,TEAM MESS Ŀ�����Ϊϵͳ�̣�Ҫ�����Կ�������PE�½��С�|EXIT _SUB
    }
    ENVI &&IsConfirm=0
    CALL ASKPartitionClone
    FIND $%&IsConfirm%=0, EXIT _SUB
    ENVI &&PartCPYNoUSB=
    CALL PartitionCopyNoUSB
    //��̬���̲���
    FIND $%&SRSLett%=, TEAM ENVI &SRCDrvLett=%&SRCNUM%| CALL CheckISDynaimc 1 %&SRCNUM%! TEAM ENVI &SRCDrvLett=%&SRSLett%| CALL CheckISDynaimc 1 %&SRSLett%
    FIND $%&DSTLett%=, TEAM ENVI &DSTDrvLett=%&DSTNUM%| CALL CheckISDynaimc 2 %&DSTNUM%! TEAM ENVI &DSTDrvLett=%&DSTLett%| CALL CheckISDynaimc 2 %&DSTLett%
    ENVI @MHGHO2012.Visable=0
    ENVI &&RUNINFO1=
    EXEC* -exe:*#200 &RUNINFO1=!ghost.EXE -clone,mode=pcopy,src=%&SRCNUM%,dst=%&DSTNUM% -batch %&PartCPYNoIDE% %&PartCPYNoUSB% %paras%
    FIND $%&RUNINFO1%=,
    {
        MESS+icon102 �Կ��ɹ���@�����Կ� #OK *3000 $1
        FIND $%PCloneSHUT.Check%=1, ENVI &SHUTorREBOOT=1
        FIND $%PCloneRB.Check%=1, ENVI &SHUTorREBOOT=2
        ENVI @MHGHO2012.Visable=1
        KILL @MHGHO2012
        EXIT _SUB
    }
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    FILE ghstwarn.txt
    ENVI &&ERRPOS=0
    LPOS* &ERRPOS=T: 36002,1,%&RUNINFO1%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS �û���ֹ���Կ�ʧ�ܣ�@�����Կ� #OK *5000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    FIND $%&DynCopy%=1,!!
    {
        ENVI &&RUNINFO2=0
        EXEC* -exe:*#200 &RUNINFO2=!ghost.EXE -clone,mode=pcopy,src=@OS:%&SRCDrvLett%,dst=@OS:%&DSTDrvLett% -batch %&PartCPYNoIDE% %&PartCPYNoUSB% %paras%
        FIND $%&RUNINFO2%=,
        {
            MESS+icon102 �Կ��ɹ���@�����Կ� #OK *3000 $1
            FIND $%PCloneSHUT.Check%=1, ENVI &SHUTorREBOOT=1
            FIND $%PCloneRB.Check%=1, ENVI &SHUTorREBOOT=2
            ENVI @MHGHO2012.Visable=1
            KILL @MHGHO2012
            EXIT _SUB
        }
        FILE ghost*.dmp
        FILE GHOSTERR.TXT
        LPOS* &ERRPOS=T: 36002,1,%&RUNINFO2%
        IFEX $%&ERRPOS% > 0,!!
        {
            MESS �û���ֹ���Կ�ʧ�ܣ�@�����Կ� #OK *5000 $1
            ENVI @MHGHO2012.Visable=1
            EXIT _SUB
        }
    }
    MESS �Կ�ʧ�ܣ�@�����Կ� #OK *3000 $1
    ENVI @MHGHO2012.Visable=1
_END

_SUB PartitionCopyNoUSB
    FIND $%&SRSLett%=, EXIT _SUB
    FIND $%&DSTLett%=, EXIT _SUB
    TEAM ENVI &&szPOS=0|ENVI &&srcDRV=|ENVI &&dstDRV=|ENVI &&srcBUS=|ENVI &&dstBUS=|ENVI &&A1=|ENVI &&A4=|ENVI &&vLn=
    LPOS &szPOS=:,1,%&SRCNUM%
    CALC #&szPOS = %&szPOS% - 1
    LSTR &srcDRV=%&szPOS%,%&SRCNUM%
    LPOS &szPOS=:,1,%&DSTNUM%
    CALC #&szPOS = %&szPOS% - 1
    LSTR &dstDRV=%&szPOS%,%&DSTNUM%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&srcDRV%, ENVI &srcBUS=%&A4%
        FIND $%&A1%=%&dstDRV%, ENVI &dstBUS=%&A4%
    }
    IFEX $%&srcBUS% = 7,! IFEX $%&dstBUS% = 7,! ENVI &PartCPYNoUSB=-nousb
_END

_SUB CheckISDynaimc
    ENVI &&letter=%2
    RSTR &&TOKEN=1,%&letter%
    FIND $%&TOKEN%=:,!EXIT _SUB
    ENVI &&SRCorDST=%1
    TEAM ENVI &&M=1|ENVI &&FTDRV=|ENVI &&IsDyn=
    LOOP #%&M% <= %&LnvFORM%,
    {
        ENVI @PARTMH:GHOSTABL.Val=?%&M%.2;&FTDRV
        FIND $%&FTDRV%=%&letter%, TEAM ENVI @PARTMH:GHOSTABL.Val=?%&M%.5;&IsDyn|EXIT LOOP
        CALC #&M = %&M% + 1
    }
    FIND $%IsDyn%=Dynamic,
    {
        ENVI &DynCopy=1
        FIND $%&DynOSVolume%=,CALL GetOSVolume
        FIND $%&DynOSVolume%=,EXIT _SUB
        TEAM ENVI &&V1=|ENVI &&V2=
        FORX *NL &DynOSVolume,&DynVol,
        {
             MSTR &V1,&V2=<1><2>%&DynVol%
             FIND $%&V2%=%&letter%,!!
             {
                 FIND $%&SRCorDST%=1,TEAM ENVI &SRCNUM=%&V1%|EXIT _SUB
                 FIND $%&SRCorDST%=2,TEAM ENVI &DSTNUM=%&V1%|EXIT _SUB
             }
        }
    }
_END

_SUB GHOSTCHECK
    ENVI  @GHOSTABL.Sel=?&&Sel
    ENVI  @GHOSTABL.Val=?%&Sel%.1;&PARTSEL1
    ENVI  @GHOSTABL.Val=?%&Sel%.2;&PARTSEL2
    ENVI  @GHOSTABL.Val=?%&Sel%.5;&PARTSEL5
    ENVI &DrvLettBackup=%&PARTSEL2%
    
    FIND $%&PARTSEL1%=  ,!
    {
        FIND $%&PARTSEL2%=  ,ENVI @STATUS2=��ѡ������  ��� %&PARTSEL1%         ���̷�!ENVI @STATUS2=��ѡ������  ��� %&PARTSEL1%         �̷� %&PARTSEL2%
        CALL SetNOIDE
        EXIT _SUB
    }
    FIND $%&PARTSEL1%=  , ENVI  @STATUS2=��ѡ������  %&PARTSEL2%
_END

_SUB SetNOIDE
    TEAM ENVI &&SPACOR=0|ENVI &&DRVNUMPICK=|ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=
    LPOS &SPACOR=:,1,%&PARTSEL1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DRVNUMPICK=%&SPACOR%,%&PARTSEL1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DRVNUMPICK%, TEAM ENVI &pBusType=%&A4%|EXIT FORX
    }
    FIND $%&pBusType%=3, ENVI @-:-:-:-:ADVANMH:advIDE.Check=0! ENVI @-:-:-:-:ADVANMH:advIDE.Check=1
_END

_SUB SetNOIDE2
    TEAM ENVI &&SPACOR=0|ENVI &&DRVNUMPICK=|ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=
    LPOS &SPACOR=:,1,%&PARTSEL1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DRVNUMPICK=%&SPACOR%,%&PARTSEL1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DRVNUMPICK%, TEAM ENVI &pBusType=%&A4%|EXIT FORX
    }
    FIND $%&pBusType%=3, ENVI @-:-:-:ADVANMH:advIDE.Check=0! ENVI @-:-:-:ADVANMH:advIDE.Check=1
_END

_SUB SetNOIDE3
    TEAM ENVI &&SPACOR=0|ENVI &&DRVNUMPICK=|ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=
    LPOS &SPACOR=:,1,%&PARTSEL1%
    CALC #&SPACOR= %&SPACOR% - 1
    LSTR &DRVNUMPICK=%&SPACOR%,%&PARTSEL1%
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&DRVNUMPICK%, TEAM ENVI &pBusType=%&A4%|EXIT FORX
    }
    FIND $%&pBusType%=3, ENVI @-:ADVANMH:advIDE.Check=0! ENVI @-:ADVANMH:advIDE.Check=1
_END

_SUB OnTimer1
    ENVI @PARTMH:INFO01=�������������ļ������Ժ�...  ����ʱ��: %&I%��
    ENVI @HDMH:hINFO01=�������������ļ������Ժ�...  ����ʱ��: %&I%��
    CALC #&I= %&I% + 1
_END

_SUB FINDGHO
    TEAM ENVI &&ANYGHO=|ENVI &&LSTEMP=|ENVI &&vln=|ENVI &&iPOS=|ENVI &&HD45=
    FORX *ab /S:1 /size:524288000:16106127360 \*.GHO,&ANYGHO,0,ENVI &LSTEMP=%&LSTEMP%%&NLDD%%&ANYGHO%          
    FORX *NL &LSTEMP,&vln,
     {
       FIND $%&vln%=,!
       {
          FNAM &HD45=%&vln%
          FIND $%&HD45%=HD4,! FIND $%&HD45%=HD5,! ENVI &GHOLS=%&GHOLS%|%&vln%
       }
     }
    MSTR &GHOLS=2,0,%&GHOLS% 
    RPOS &iPOS=|,1,%&GHOLS%
    CALC # &iPOS = %&iPOS% + 1
    MSTR &GHOLS1=%&iPOS%,0,%&GHOLS%
_END

_SUB FINDWIM
    TEAM ENVI &&ANYWIM=|ENVI &&R9=
    FORX *ab /S:1 /size:524288000:16106127360 \*.WIM,&ANYWIM,0,
    {
      FNAM &R9=%&ANYWIM%
      FIND $%&R9%=boot,! FIND $%&R9%=Winre,! ENVI &WIMLS=%&WIMLS%%&NLDD%%&ANYWIM% 
    } 
    ENVI &WIMLS=%&NLDD%%&WIMLS%      
_END

_SUB FINDESD
    ENVI &&ANYESD=
    FORX *ab /S:1 /size:524288000:16106127360 \*.ESD,&ANYESD,0,ENVI &ESDLS=%&ESDLS%%&NLDD%%&ANYESD% 
    ENVI &ESDLS=%&NLDD%%&ESDLS%
_END

_SUB FINDISO
    TEAM ENVI &&ANYISO=|ENVI &&ISODIR=
    FORX *ab /S:1 \*.ISO,&ANYISO,0,ENVI &ISOLS=%&ISOLS%%&NLDD%%&ANYISO%
    ENVI &ISOLS=%&NLDD%%&ISOLS%
_END

_SUB FINDGHOInCGIDir
    TEAM ENVI &&ANYGHO=|ENVI &&HD45=
    FORX %&CGIEXEDir%\*.GHO,&ANYGHO,0,CALL CutHD45
_END

_SUB CutHD45
    FNAM &HD45=%&ANYGHO%
    FIND $%&HD45%=HD4,! FIND $%&HD45%=HD5,! TEAM ENVI &CGIDirGHOList=%&CGIDirGHOList%%&ANYGHO%%&NLDD%|ENVI &CGIDirGHO=%&ANYGHO%
_END

_SUB FINDWIMInCGIDir
    TEAM ENVI &&ANYWIM=|ENVI &&BOOTWIM=
    FORX %&CGIEXEDir%\*.WIM,&ANYWIM,0,ENVI &CGIDirWIMList=%&CGIDirWIMList%%&ANYWIM%%&NLDD%
_END

_SUB FINDESDInCGIDir
    ENVI &&ANYESD=
    FORX %&CGIEXEDir%\*.ESD,&ANYESD,0,ENVI &CGIDirESDList=%&CGIDirESDList%%&ANYESD%%&NLDD%
_END

_SUB FreeDrvs
    TEAM ENVI &&Drv=|ENVI &&VD=
    FDRV &&OCUDrvs=*
    FORX * Z Y X W V U T S R Q P O N M L K J I H G F E D C B A,&Drv,
    {
        FORX * %&OCUDrvs%,&VD,FIND $%&Drv%=%&VD%,TEAM ENVI &FFDrv=|EXIT FORX!ENVI &FFDrv=%&Drv%
        FIND $%&FFDrv%=,!EXIT _SUB
    }
_END

//==========================  ����Ϊ����Ӳ��  ================================================================
_SUB HDCHECK
    ENVI  @hTABL.Sel=?&&Sel
    ENVI  @hTABL.Val=?%&Sel%.1;&HDSEL
    ENVI  @hSTATUS2=��ѡӲ�̣�  %&HDSEL%
    ENVI  @hTABL.Val=?%&Sel%.2;&HDSizeSel
    ENVI  @hTABL.Val=?%&Sel%.3;&HDModelSel
    CALL SetHDIDE
_END

_SUB SetHDIDE
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&HDSEL%, TEAM ENVI &hBusType=%&A4%|EXIT FORX
    }
    FIND $%&hBusType%=3, ENVI @-:-:-:ADVANMH:advIDE.Check=0! ENVI @-:-:-:ADVANMH:advIDE.Check=1
_END

_SUB SetHDIDE2
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%&HDSEL%, TEAM ENVI &hBusType=%&A4%|EXIT FORX
    }
    FIND $%&hBusType%=3, ENVI @-:ADVANMH:advIDE.Check=0! ENVI @-:ADVANMH:advIDE.Check=1
_END

_SUB SethSTATUS4
    ENVI @hSTATUS4=ԴӲ�̣�      %SRCHD%
    CALL SetHDCOPYIDE
_END

_SUB SethSTATUS5
    ENVI @hSTATUS5=Ŀ��Ӳ�̣�    %DSTHD%
    CALL SetHDCOPYIDE
_END

_SUB SetHDCOPYIDE
    FIND $%DSTHD%=,EXIT _SUB
    FIND $%SRCHD%=,EXIT _SUB
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=|ENVI &&IsIDE1=0|ENVI &&IsIDE2=0
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%SRCHD%, TEAM ENVI &IsIDE1=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE1%=3, TEAM ENVI @-:-:-:ADVANMH:advIDE.Check=0|ENVI &HDCPYNoIDE=|EXIT _SUB
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%DSTHD%, TEAM ENVI &IsIDE2=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE2%=3, TEAM ENVI @-:-:-:ADVANMH:advIDE.Check=0|ENVI &HDCPYNoIDE=|EXIT _SUB! TEAM ENVI @-:-:-:ADVANMH:advIDE.Check=1|ENVI &HDCPYNoIDE=-noide
_END

_SUB SetHDCOPYIDE2
    FIND $%DSTHD%=,EXIT _SUB
    FIND $%SRCHD%=,EXIT _SUB
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A4=|ENVI &&IsIDE1=0|ENVI &&IsIDE2=0
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%SRCHD%, TEAM ENVI &IsIDE1=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE1%=3, TEAM ENVI @-:ADVANMH:advIDE.Check=0|ENVI &HDCPYNoIDE=|EXIT _SUB
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%DSTHD%, TEAM ENVI &IsIDE2=%&A4%|EXIT FORX
    }
    FIND $%&IsIDE2%=3, TEAM ENVI @-:ADVANMH:advIDE.Check=0|ENVI &HDCPYNoIDE=|EXIT _SUB! TEAM ENVI @-:ADVANMH:advIDE.Check=1|ENVI &HDCPYNoIDE=-noide
_END

_SUB hRESPATH
    BROW &&hREPATH,,��ѡ�����ļ�,GHO�ļ���ISO�ļ�(*.GHO;*.ISO)|*.GHO;*.ISO,
    FIND $%&hREPATH%=,!
    {
        FIND $%&hREPATH%=%&DLIST1ITEM%,ENVI @hLIST.SEL=%&hREPATH%!ENVI @hLIST.ADDSEL=%&hREPATH%
        ENVI. @hSTATUS3=��ѡ·��/�ļ���%hLIST%
        FEXT &&hEXT=%hLIST%
        FIND $%&hEXT%=ISO,TEAM ENVI &ahCHECK=2|CALL GICHECK "%hLIST%"
    }
_END

_SUB hBACKPATH
    BROW &&hBKPATH,&D:\SYSTEM.GHO,��ѡ�񱣴�Ŀ¼,GHO�ļ�(*.GHO)|*.GHO|�����ļ�(*.*)|*.*,
    FIND $%&hBKPATH%=,!
    {
        // PECMD2012��BUG��ͨ�����������ť����ļ�ʱ����Ҫ��ӵ��ļ���������������Ѵ���
        // ��Ϊ��һ����Ŀʱ��������˳���������Ϊ������BUG�ġ�
        ENVI @hBACK.QUERY=&&AllBKGHO
        FIND $%&AllBKGHO%=,! ENVI @hBACK.QUERY=1;&&FirstBKGHO
        FIND $%&hBKPATH%=%&FirstBKGHO%, ENVI @hBACK.SEL=%&hBKPATH%! ENVI @hBACK.ADDSEL=%&hBKPATH%
        ENVI. @hSTATUS3=��ѡ·��/�ļ���%hBACK%
    }
_END

_SUB HDVIS1
    ENVI @hRETIP=3.��ѡ�����ļ���
    ENVI @hBACK.Visable=0
    ENVI @hBkBn.Visable=0
    ENVI @hLIST.Visable=1
    ENVI @hReBn.Visable=1
    ENVI @hSTATUS1=��ѡ��������ԭӲ��
    ENVI. @hSTATUS3=��ѡ·��/�ļ���%hLIST%
    ENVI @hLABE.Visable=1
    ENVI @hLABLE.Visable=0
    ENVI @SRCHD.Visable=0
    ENVI @DSTHD.Visable=0
    ENVI @hSTATUS2.Visable=1
    ENVI @hSTATUS4.Visable=0
    ENVI @hSTATUS3.Visable=1
    ENVI @hSTATUS5.Visable=0
    CALL SetHDIDE
_END

_SUB HDVIS2
    ENVI @hRETIP=3.��ѡ�񱣴�·����
    ENVI @hLIST.Visable=0
    ENVI @hReBn.Visable=0
    ENVI @hBACK.Visable=1
    ENVI @hBkBn.Visable=1
    ENVI @hSTATUS1=��ѡ����������Ӳ��
    ENVI. @hSTATUS3=��ѡ·��/�ļ���%hBACK%
    ENVI @hLABE.Visable=1
    ENVI @hLABLE.Visable=0
    ENVI @SRCHD.Visable=0
    ENVI @DSTHD.Visable=0
    ENVI @hSTATUS2.Visable=1
    ENVI @hSTATUS4.Visable=0
    ENVI @hSTATUS3.Visable=1
    ENVI @hSTATUS5.Visable=0
    CALL SetHDIDE
_END

_SUB HDVIS3
    ENVI @hRETIP=2.��ѡ��ԴӲ�̣�
    ENVI @hLIST.Visable=0
    ENVI @hReBn.Visable=0
    ENVI @hBACK.Visable=0
    ENVI @hBkBn.Visable=0
    ENVI @hLABE.Visable=0
    ENVI @hLABLE.Visable=1
    ENVI @SRCHD.Visable=1
    ENVI @DSTHD.Visable=1
    ENVI @hSTATUS1=��ѡ������Ӳ�̶Կ�
    ENVI @hSTATUS2.Visable=0
    ENVI @hSTATUS4.Visable=1
    ENVI @hSTATUS4=ԴӲ�̣�      %SRCHD%
    ENVI @hSTATUS3.Visable=0
    ENVI @hSTATUS5.Visable=1
    ENVI @hSTATUS5=Ŀ��Ӳ�̣�    %DSTHD%
    CALL SetHDCOPYIDE
_END

_SUB hREORBK
    FIND $%hRERADI.Check%=0,!!FIND $%hBKRADI.Check%=0,!!FIND $%HD2HD.Check%=0,!!TEAM MESS ����û��ѡ�������%&NLDD%%&NLDD%��ѡ�񡾻�ԭӲ�̡���������Ӳ�̡���Ӳ�̶Կ�����|EXIT _SUB
    FIND $%HD2HD.Check%=0,!!
    {
        FIND $%&HDSEL%=, TEAM MESS ����û��ѡ��Ӳ�̣�%&NLDD%%&NLDD%��ѡ��Ӳ�̣�|EXIT _SUB
        FIND $%hRERADI.Check%=1,
        {
            RSTR &&REL4=4,%hSTATUS3%
            FIND $%&REL4%=.GHO,!
            {
                FIND $%&REL4%=.ISO, TEAM MESS. ����ǰѡ����%hLIST%�ļ���%&NLDD%%&NLDD%����ѡһ�´�ISO�ļ�����������û������Ҫ��GHO����|EXIT _SUB
                TEAM MESS ����û��ѡ��GHO����|EXIT _SUB
            }
            CALL hREGHOST
        }
        FIND $%hBKRADI.Check%=1,
        {
            MSTR &&BKBLANK=<1>%hBACK%
            FIND $%&BKBLANK%=,TEAM MESS ����û��ѡ�񱣴�·����|EXIT _SUB
            CALL hBKGHOST
        }
    }
    FIND $%HD2HD.Check%=1,!!
    {
        FIND $%SRCHD%=,TEAM MESS ����û��ѡ��ԴӲ�̣�|EXIT _SUB
        FIND $%DSTHD%=,TEAM MESS ����û��ѡ��Ŀ��Ӳ�̣�|EXIT _SUB
        CALL HD2HDCOPY
    }
_END

_SUB hREGHOST
    TEAM ENVI &&hhDRV=|ENVI &&hFsame=|ENVI &&hDrvNUM=
    FDRV &&hREDrv=%hLIST%
    FORX *NL &vFORM,&hFsame,
    {
        MSTR &hhDRV=<2>%&hFsame%
        FIND $%&hhDRV%=%&hREDrv%, TEAM MSTR &hDrvNUM=<1>%&hFsame%|EXIT FORX
    }
    LPOS &&hdPOS=:,1,%&hDrvNUM%
    CALC #&hdPOS = %&hdPOS% - 1
    LSTR &hDrvNUM=%&hdPOS%,%&hDrvNUM%
    FIND $%&hDrvNUM%=%&HDSEL%,
    {
        FEXT &&hdEXT=%hLIST%
        FIND $%&hdEXT%=ISO, TEAM MESS ISO�ļ���Ŀ��Ӳ�̣��޷���ԭ��%&NLDD%%&NLDD%�ɽ������Ƶ�����Ӳ���ٽ��л�ԭ��|EXIT _SUB
        TEAM MESS GHO������Ŀ��Ӳ�̣��޷���ԭ��%&NLDD%%&NLDD%�ɽ������Ƶ�����Ӳ���ٽ��л�ԭ��|EXIT _SUB
    }
    LPOS &&hPOS=��,1,%hSTATUS3%
    CALC #&hPOS = %&hPOS% + 1
    MSTR &&hFILE=%&hPOS%,0,%hSTATUS3%
    FEXT &&hdEXT=%hLIST%
    FIND $%&hdEXT%=ISO, CALL LoadISO "%hLIST%"
    TEAM ENVI &&szNoIDE=| ENVI &&szNoUSB=| ENVI &&hCRC=| ENVI &&PWDRE=
    CALL CRPWD "%&hFILE%"
    CALL GetNoIDENoUSB %hBusType% %&hREDrv%
    FIND $%advCRC.Check%=1, ENVI &hCRC=-crcignore
    IFEX %&hFILE%, TEAM CALL OnResHD|EXIT _SUB
    MESS �Ҳ�����ѡGHO����
_END

_SUB ASKHDRestore,W432H178,��ԭӲ��,,#1,,
    ENVI &&HDInfo=
    CALL SetHDInfoString
    LABE. -left ,L26T16W400H18,��"%&hFILE%"��ԭ��,,0xFF0000
    LABE -left ,L26T36W400H18,����%&HDSEL%  ��%&HDInfo%��,,0xFF0000
    LABE ,L26T68W61H18,��ɺ�,,
    CHEK HDRestoreSHUT,L88T65W62H18,�ػ�,CALL HDRestoreSHUTRB1,0
    CHEK HDRestoreRB,L152T65W62H18,����,CALL HDRestoreSHUTRB2,0
    ITEM ,L220T102W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L320T102W80H28,ȡ ��,KILL \,
_END

_SUB SetHDInfoString
    TEAM ENVI &&A1=|ENVI &&A2=|ENVI &&A3=
    MSTR &A1,&A2,&A3=<1><2><3>%&HDModelSel%
    FIND $%&A3%=,! TEAM ENVI &HDInfo=%&HDSizeSel%��%&A1% %&A2% %&A3%|EXIT _SUB
    FIND $%&A2%=,! TEAM ENVI &HDInfo=%&HDSizeSel%��%&A1% %&A2%|EXIT _SUB
    FIND $%&A1%=,! TEAM ENVI &HDInfo=%&HDSizeSel%��%&A1%|EXIT _SUB
    ENVI &HDInfo=%&HDSizeSel%
_END

_SUB HDRestoreSHUTRB1
    FIND $%HDRestoreSHUT.Check%=1, ENVI @HDRestoreRB.Check=0
_END

_SUB HDRestoreSHUTRB2
    FIND $%HDRestoreRB.Check%=1, ENVI @HDRestoreSHUT.Check=0
_END

_SUB OnResHD
    IFEX $%&PEPOS% = 0,!! FIND $%&HDSEL%=%&SysDrvNum%,!! TEAM MESS �뵽PE�л�ԭϵͳӲ�̡�|EXIT _SUB
    ENVI &&IsConfirm=0
    CALL ASKHDRestore
    FIND $%&IsConfirm%=0, EXIT _SUB
    ENVI @MHGHO2012.Visable=0
    ENVI &&RUNINFO=0
    EXEC* -exe:*#200 &RUNINFO=!ghost.EXE -clone,mode=load,src="%&hFILE%",dst=%&HDSEL% -batch %&szNoIDE% %&szNoUSB% %&hCRC% %&PWDRE% %paras%
    FIND $%&RUNINFO%=,
    {
        MESS+icon102 ��ԭ�ɹ���@��ԭӲ�� #OK *3000 $1
        FIND $%HDRestoreSHUT.Check%=1, ENVI &SHUTorREBOOT=1
        FIND $%HDRestoreRB.Check%=1, ENVI &SHUTorREBOOT=2
        ENVI @MHGHO2012.Visable=1
        KILL @MHGHO2012
        EXIT _SUB
    }
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    FILE ghstwarn.txt
    ENVI &&ERRPOS=0
    LPOS* &ERRPOS=T: 36002,1,%&RUNINFO%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS �û���ֹ����ԭʧ�ܣ�@��ԭӲ�� #OK *5000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    MESS ��ԭʧ�ܣ�@��ԭӲ�� #OK *3000 $1
    ENVI @MHGHO2012.Visable=1
_END

_SUB ASKHDBackup,W432H178,����Ӳ��,,#1,,
    ENVI &&HDInfo=
    CALL SetHDInfoString
    LABE -left ,L26T16W400H18,�Ѵ���%&HDSEL%  ��%&HDInfo%��,,0xFF0000
    LABE. -left ,L26T36W400H18,���ݵ�"%&hBKDir%",,0xFF0000
    LABE ,L26T68W61H18,��ɺ�,,
    CHEK HDBackupSHUT,L88T65W62H18,�ػ�,CALL HDBackupSHUTRB1,0
    CHEK HDBackupRB,L152T65W62H18,����,CALL HDBackupSHUTRB2,0
    ITEM ,L220T102W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L320T102W80H28,ȡ ��,KILL \,
_END

_SUB HDBackupSHUTRB1
    FIND $%HDBackupSHUT.Check%=1, ENVI @HDBackupRB.Check=0
_END

_SUB HDBackupSHUTRB2
    FIND $%HDBackupRB.Check%=1, ENVI @HDBackupSHUT.Check=0
_END

_SUB ASKExistHDBackup,W432H198,����Ӳ��,,#1,,
    ENVI &&HDInfo=
    CALL SetHDInfoString
    LABE -left ,L26T16W400H18,�Ѵ���%&HDSEL%  ��%&HDInfo%��,,0xFF0000
    LABE. -left ,L26T36W400H18,���ݵ�"%&hBKDir%",,0xFF0000
    LABE. -left ,L26T60W400H18,������ԭ�еı����ļ���,,0x0000FF
    LABE ,L26T88W61H18,��ɺ�,,
    CHEK ExistHDBackupSHUT,L88T85W62H18,�ػ�,CALL ExistHDBackupSHUTRB1,0
    CHEK ExistHDBackupRB,L152T85W62H18,����,CALL ExistHDBackupSHUTRB2,0
    ITEM ,L220T122W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L320T122W80H28,ȡ ��,KILL \,
_END

_SUB ExistHDBackupSHUTRB1
    FIND $%ExistHDBackupSHUT.Check%=1, ENVI @ExistHDBackupRB.Check=0
_END

_SUB ExistHDBackupSHUTRB2
    FIND $%ExistHDBackupRB.Check%=1, ENVI @ExistHDBackupSHUT.Check=0
_END

_SUB hBKGHOST
    MSTR &&hBLK=<1->%hBACK%
    LSTR &&hBKDrv=2,%&hBLK%
    TEAM ENVI &&hFBK=| ENVI &&hBDrvNUM=
    FORX *NL &vFORM,&hFBK,
    {
        MSTR &&iBKDrv=<2>%&hFBK%
        FIND $%&iBKDrv%=%&hBKDrv%, TEAM MSTR &hBDrvNUM=<1>%&hFBK%|EXIT FORX
    }
    LPOS &&hBPOS=:,1,%&hBDrvNUM%
    CALC #&hBPOS = %&hBPOS% - 1
    LSTR &hBDrvNUM=%&hBPOS%,%&hBDrvNUM%
    FIND $%&hBDrvNUM%=%&HDSEL%, TEAM MESS �޷��ѱ����ļ����浽Ҫ���ݵ�Ӳ�̣�%&NLDD%%&NLDD%������ѡ�񱣴�·����|EXIT _SUB
    ENVI &&hBKDir=
    RSTR &&BKL4=4,%&hBLK%
    FIND $%&BKL4%=.GHO, ENVI &hBKDir=%&hBLK%! ENVI &hBKDir=%&hBLK%.GHO
    RPOS &&hDIR=\,1,%&hBKDir%
    LSTR &&hMKDIR=%&hDIR%,%&hBKDir%
    ENVI &&ExistFolder=0
    IFEX %&hMKDIR%, ENVI &ExistFolder=1!MDIR %&hMKDIR%
    FIND $%HideFolder.Check%=1, IFEX %&hMKDIR%, SITE %&hMKDIR%,+H
    MSTR &&hSIZE=<1>%advBL02%
    TEAM ENVI &&szNoIDE=| ENVI &&szNoUSB=| ENVI &&BKPWD=| ENVI &&hCMPR=-z1| ENVI &&hSPLIT=-split=%&hSIZE%
    FIND $%advPWD1.Check%=1,
    {
        FIND $%advEDIT1%=,!
        {
            TEAM ENVI &&realPWD=|ENVI &&PL=
            ENVI &realPWD=%advEDIT1%
            STRL &PL=%&realPWD%
            IFEX $%&PL% > 10, LSTR &realPWD=10,%&realPWD%
            ENVI &BKPWD=-pwd="%&realPWD%"
        }
    }
    CALL GetNoIDENoUSB %hBusType% %&hBKDrv%
    FIND $%advBL01%=��ѹ��, ENVI &hCMPR=
    FIND $%advBL01%=��ѹ��, ENVI &hCMPR=-z3
    FIND $%advBL01%=����ѹ��, ENVI &hCMPR=-z9
    FIND $%advBL02%=���־�, ENVI &hSPLIT=-split=0
    FIND $%advBL02%=�Զ����, ENVI &hSPLIT=
    TEAM ENVI &&IsConfirm=0|ENVI &&dstFileExist=0
    IFEX %&hBKDir%, TEAM ENVI &dstFileExist=1|CALL ASKExistHDBackup! CALL ASKHDBackup
    FIND $%&IsConfirm%=0,
    {
        IFEX $%&ExistFolder% = 0,!!
        {
            MSTR &&hKillDir=-2,0,%&hMKDIR%
            SITE %&hKillDir%,-H-S-R
            PATH #%&hKillDir%
        }
        EXIT _SUB
    }
    TEAM ENVI &&iTIME=|ENVI &&NewGHOTime=0|ENVI &&NewGHOSize=0
    TEAM ENVI &&T1=|ENVI &&T2=|ENVI &&T3=|ENVI &&T4=|ENVI &&T5=|ENVI &&T6=|ENVI &&T7=
    ENVI &OldGHOExist=0
    IFEX %&hBKDir%,
    {
        ENVI &OldGHOExist=1
        SITE ?-local ,&iTIME=FTIME,%&hBKDir%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &OldGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    ENVI @MHGHO2012.Visable=0
    TEAM ENVI &&RUNINFO=0|ENVI &&report=0
    EXEC* -exe:*#200 &RUNINFO=!ghost.EXE -clone,mode=dump,src=%&HDSEL%,dst="%&hBKDir%" -batch %&szNoIDE% %&szNoUSB% %&BKPWD% %&hCMPR% %&hSPLIT% %paras%
    IFEX %&hBKDir%,
    {
        SIZE &NewGHOSize=%&hBKDir%
        SITE ?-local ,&iTIME=FTIME,%&hBKDir%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &NewGHOTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    FIND $%&RUNINFO%=,
    {
        IFEX %&hBKDir%,!!
        {
            IFEX $%&OldGHOExist% = 1,!!
            {
                FIND $%&NewGHOTime%=%&OldGHOTime%, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @����Ӳ�� #OK *3000 $1
                FIND $%&NewGHOTime%=%&OldGHOTime%,!
                {
                    IFEX $%&NewGHOSize% = 0, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @����Ӳ�� #OK *3000 $1
                    IFEX $%&NewGHOSize% = 0,!
                    {
                        MESS+icon102 ���ݳɹ���@����Ӳ�� #OK *3000 $1
                        IFEX $%&dstFileExist% = 0,!!
                        {
                            FIND $%HDBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                            FIND $%HDBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                        }
                        IFEX $%&dstFileExist% = 1,!!
                        {
                            FIND $%ExistHDBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                            FIND $%ExistHDBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                        }
                        ENVI @MHGHO2012.Visable=1
                        KILL @MHGHO2012
                        EXIT _SUB
                    }
                }
            }
            IFEX $%&OldGHOExist% = 0,!!
            {
                IFEX $%&NewGHOSize% = 0, TEAM ENVI &report=1|MESS ����ʧ�ܣ� @����Ӳ�� #OK *3000 $1
                IFEX $%&NewGHOSize% = 0,!
                {
                    MESS+icon102 ���ݳɹ���@����Ӳ�� #OK *3000 $1
                    IFEX $%&dstFileExist% = 0,!!
                    {
                        FIND $%HDBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                        FIND $%HDBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                    }
                    IFEX $%&dstFileExist% = 1,!!
                    {
                        FIND $%ExistHDBackupSHUT.Check%=1, ENVI &SHUTorREBOOT=1
                        FIND $%ExistHDBackupRB.Check%=1, ENVI &SHUTorREBOOT=2
                    }
                    ENVI @MHGHO2012.Visable=1
                    KILL @MHGHO2012
                    EXIT _SUB
                }
            }
        }
        IFEX %&hBKDir%,! TEAM ENVI &report=1|MESS ����ʧ�ܣ� @����Ӳ�� #OK *3000 $1
    }
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    FILE ghstwarn.txt
    FIND $%&NewGHOTime%=%&OldGHOTime%,! FILE %&hBKDir%
    IFEX $%&ExistFolder% = 0,!!
    {
        MSTR &&hKillDir=-2,0,%&hMKDIR%
        SITE %&hKillDir%,-H-S-R
        PATH #%&hKillDir%
    }
    ENVI &&ERRPOS=0
    LPOS* &ERRPOS=T: 651,1,%&RUNINFO%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@����Ӳ�� #OK *10000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    LPOS* &ERRPOS=T: 519,1,%&RUNINFO%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS ���澵��ķ����ռ䲻�㣬����ʧ�ܣ�@����Ӳ�� #OK *10000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    LPOS* &ERRPOS=T: 36002,1,%&RUNINFO%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS �û���ֹ������ʧ�ܣ�@����Ӳ�� #OK *5000 $1
        ENVI @MHGHO2012.Visable=1
        EXIT _SUB
    }
    IFEX $%&report% = 0, MESS ����ʧ�ܣ�@����Ӳ�� #OK *3000 $1
    ENVI @MHGHO2012.Visable=1
_END

_SUB HD2HDCOPY
    FIND $%SRCHD%=%DSTHD%,TEAM MESS ԴӲ����Ŀ��Ӳ����ͬ��%&NLDD%%&NLDD%�޷�����Ӳ�̶Կ���|EXIT _SUB
    IFEX $%&PEPOS% = 0,!!
    {
        FIND $%&SysDrvNum%=%DSTHD%,TEAM MESS Ŀ��Ӳ����ϵͳӲ�̣�ҪӲ�̶Կ����뵽PE�н��С�|EXIT _SUB
    }
    ENVI &&IsConfirm=0
    CALL ASKHDCopy
    FIND $%&IsConfirm%=0, EXIT _SUB
    ENVI &&HDCPYNoUSB=
    CALL GetHDCopyNoUSB
    ENVI @MHGHO2012.Visable=0
    EXEC* -exe:*#200 &&RUNINFO=!ghost.EXE -clone,mode=copy,src=%SRCHD%,dst=%DSTHD% -batch %&HDCPYNoIDE% %&HDCPYNoUSB% %paras%
    FIND $%&RUNINFO%=,
    {
        MESS+icon102 �Կ��ɹ���@Ӳ�̶Կ� #OK *3000 $1
        FIND $%HDCopySHUT.Check%=1, ENVI &SHUTorREBOOT=1
        FIND $%HDCopyRB.Check%=1, ENVI &SHUTorREBOOT=2
        ENVI @MHGHO2012.Visable=1
        KILL @MHGHO2012
        EXIT _SUB
    }
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    FILE ghstwarn.txt
    MESS �Կ�ʧ�ܣ�@Ӳ�̶Կ� #OK *3000 $1
    ENVI @MHGHO2012.Visable=1
_END

_SUB ASKHDCopy,W432H208,Ӳ�̶Կ�,,#1,,
    TEAM ENVI &&srcHDInfo=|ENVI &&dstHDInfo=|ENVI &&HDInfo=
    CALL GetHDInformation %SRCHD%
    ENVI &srcHDInfo=%&HDInfo%
    ENVI &HDInfo=
    CALL GetHDInformation %DSTHD%
    ENVI &dstHDInfo=%&HDInfo%
    LABE -left ,L26T16W400H18,�Ѵ���%SRCHD% ��%&srcHDInfo%����¡��,,0xFF0000
    LABE -left ,L26T36W400H18,����%DSTHD% ��%&dstHDInfo%��,,0xFF0000
    LABE -left ,L26T66W400H18,Ŀ������ϵ��������ݽ��ᱻ���ǣ�,,0x0000FF
    LABE ,L26T98W61H18,��ɺ�,,
    CHEK HDCopySHUT,L88T95W62H18,�ػ�,CALL HDCopySHUTRB1,0
    CHEK HDCopyRB,L152T95W62H18,����,CALL HDCopySHUTRB2,0
    ITEM ,L220T132W80H28,ȷ ��,TEAM ENVI &IsConfirm=1|KILL \,
    ITEM ,L320T132W80H28,ȡ ��,KILL \,
_END

_SUB HDCopySHUTRB1
    FIND $%HDCopySHUT.Check%=1, ENVI @HDCopyRB.Check=0
_END

_SUB HDCopySHUTRB2
    FIND $%HDCopyRB.Check%=1, ENVI @HDCopySHUT.Check=0
_END

_SUB GetHDInformation
    TEAM ENVI &&A1=|ENVI &&A2=|ENVI &&A3=|ENVI &&szHDSize=|ENVI &&szHDModel=|ENVI &&vLn=|ENVI &&HDNum=
    ENVI &HDNum=%1
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A2,&A3=<1><2><3>%&vLn%
        FIND $%&A1%=%&HDNum%, TEAM ENVI &szHDSize=%&A2%|ENVI &szHDModel=%&A3%|EXIT FORX
    }
    MSTR &A1,&A2,&A3=<1><2><3>%&szHDModel%
    FIND $%&A3%=,! TEAM ENVI &HDInfo=%&szHDSize%��%&A1% %&A2% %&A3%|EXIT _SUB
    FIND $%&A2%=,! TEAM ENVI &HDInfo=%&szHDSize%��%&A1% %&A2%|EXIT _SUB
    FIND $%&A1%=,! TEAM ENVI &HDInfo=%&szHDSize%��%&A1%|EXIT _SUB
    ENVI &HDInfo=%&szHDSize%
_END

_SUB GetHDCopyNoUSB
    TEAM ENVI &&srcBUS=|ENVI &&dstBUS=|ENVI &&A1=|ENVI &&A4=|ENVI &&vLn=
    FORX *NL &HDMHINFO,&vLn,
    {
        MSTR* &A1,&A4=<1><4>%&vLn%
        FIND $%&A1%=%SRCHD%, ENVI &srcBUS=%&A4%
        FIND $%&A1%=%DSTHD%, ENVI &dstBUS=%&A4%
    }
    IFEX $%&srcBUS% = 7,! IFEX $%&dstBUS% = 7,! ENVI &HDCPYNoUSB=-nousb
_END

//====================================== ����Ϊ���߼��� ============================================================
_SUB EnablePWD
    FIND $%advPWD1.Check%=1,ENVI @advEDIT1.Enable=1!ENVI @advEDIT1.Enable=0
_END

_SUB advPATH
    BROW &&advP,,��ѡ�����ļ�,GHO��ISO�ļ�(*.GHO;*.ISO)|*.GHO;*.ISO,
    FIND $%&advP%=,!
    {
        FIND $%&advP%=%&ILIST1ITEM%,ENVI @advLIST.SEL=%&advP%!ENVI @advLIST.ADDSEL=%&advP%
        ENVI. @advLABE=��ѡ�ļ���%advLIST%
        FEXT &&advEXT=%advLIST%
        FIND $%&advEXT%=ISO,TEAM ENVI &ahCHECK=3|CALL GICHECK "%advLIST%"
    }
_END

_SUB IntegCheck
    RSTR &&advChExt=4,%advLABE%
    FIND $%&advChExt%=.ISO,TEAM MESS ��ѡ��Ĳ���GHO�����ļ���|EXIT _SUB
    LPOS &&aPOS=��,1,%advLABE%
    CALC #&aPOS = %&aPOS% + 1
    MSTR &&aFILE=%&aPOS%,0,%advLABE%
    IFEX %&aFILE%,TEAM CALL CHKINTGR "%&aFILE%"|EXIT _SUB
    MESS �Ҳ�����ѡGHO����
_END

_SUB CHKINTGR
    ENVI &&PWDRE=
    ENVI &&iPath=%1
    CALL CRPWD %&iPath%
    ENVI &&ERRINFO=0
    EXEC* -exe:*#200 &ERRINFO=!ghost.EXE -chkimg,%1 -batch %&PWDRE%
    FIND $%&ERRINFO%=,TEAM MESS.+icon102 %~1 ����������| EXIT _SUB
    FILE ghost*.dmp
    FILE GHOSTERR.TXT
    ENVI &&ERRPOS=0
    LPOS* &ERRPOS=T: 36002,1,%&ERRINFO%
    IFEX $%&ERRPOS% > 0,!!
    {
        MESS �û���ֹ��@���GHO�����Ƿ����� #OK *3000 $1
        EXIT _SUB
    }
    MESS.+icon7 %~1 ����������
_END

_SUB paraHELP,W432H344,��������,,#1
    ENVI &&PrmTITLE=120:����%&TAB%268:˵��
    ENVI &&PrmDATA=-nousb%&TAB%���÷���USB�豸%&NLHH%-no1394%&TAB%���÷���1394�豸%&NLHH%-noscsi%&TAB%���÷���SCSI�豸%&NLHH%-fro%&TAB%ǿ�ƿ����л��صķ���%&NLHH%-forceusb%&TAB%��������USB�豸����%&NLHH%-force1394%&TAB%��������1394�豸����%&NLHH%-ia%&TAB%��ȫִ�������������ĸ���%&NLHH%-id%&TAB%��ȫ��������Ӳ�̣�����δ���ֵĿռ�
    LABE ,L14T10W402H16,�������������µĲ�������������ÿո�ָ���,,
    LABE ,L14T30W380H16,    -nousb -fro,,
    LABE ,L14T50W402H16,Ҳ���Դ�����ѡ�񣬻��߲����ֶ����벿�ִ�����ѡ��,,
    TABL PrmTabl,L12T70W402H142,%&PrmTITLE%,%&PrmDATA%,0x82600
    LABE -left ,L18T220W400H40,��ʾ����һ���ָ�֧�ֵĲ��������������г��ģ�����GHOST֧�ֵģ�����֧�֡�,,0xFF0000,
    ITEM ,L226T270W80H28,ȷ ��,TEAM CALL PrmPick|KILL \,
    ITEM ,L326T270W80H28,�� ��,KILL \,
_END

_SUB PrmPick
    ENVI @PrmTabl.Check=?*&&PrmPs
    FIND $%&PrmPs%=,!
    {
        TEAM ENVI &&ParaSEL=| ENVI &&LPick=| ENVI &&PPS=
        FORX * %&PrmPs%,&LPick,
        {
            ENVI @PrmTabl.Val=?%&LPick%.1;&ParaSEL
            ENVI &PPS=%&PPS% %&ParaSEL%
        }
        ENVI &PPS=%paras%%&PPS%
        ENVI @-:-:-:ADVANMH:paras=%&PPS%
    }
_END

_SUB DOITph
    ENVI @DOIT1.Enable=0
    ENVI &&M=0
    LOOP #%&BasicDone% = 0,
    {
        WAIT 1000
        CALC #&M = %&M% + 1
        IFEX $%&M% > 10, EXIT LOOP
    }
    IFEX $%&BasicDone% = 0, TEAM MESS ϵͳ��æ�����Ժ����ԡ�|ENVI @DOIT1.Enable=1|EXIT _SUB
    ENVI @DOIT1.Enable=1
    FIND $%&TABS1.Select%=1,TEAM CALL REORBK|EXIT _SUB
    FIND $%&TABS1.Select%=2,CALL hREORBK
_END

_SUB CRPWD
    EXEC* -exe:*#603 &&PWDINFO=!GP.EXE %1
    FIND $%&PWDINFO%=,!ENVI &PWDRE=-pwd="%&PWDINFO%"
_END

_SUB DISPTIP
    ENVI &&CTRLNUM=%1
    FIND $%&CTRLNUM%=1,
    {
        FIND $%BKRADI.Check%=1,EXIT _SUB
        ENVI &&SHOWINFO=%STATUS3%
        LPOS* &&arrowPOS=->,1,%&SHOWINFO%
        IFEX $%&arrowPOS% > 0, TEAM CALL SHOWWIMTIPS|EXIT _SUB
        ENVI &&LFILE=%GHOLIST% 
        TEAM CALL SHOWTIPS|EXIT _SUB
    }
    FIND $%&CTRLNUM%=2,
    {
        FIND $%hBKRADI.Check%=1,EXIT _SUB
        ENVI &&SHOWINFO=%hSTATUS3%
        ENVI &&LFILE=%hLIST%
        TEAM CALL SHOWTIPS|EXIT _SUB
    }
    FIND $%&CTRLNUM%=3,
    {
        ENVI &&SHOWINFO=%advLABE%
        ENVI &&LFILE=%advLIST%
        CALL SHOWTIPS
    }
_END

_SUB SHOWWIMTIPS
    ENVI @@Cur=?&&CurX;&&CurY
    LPOS &&fPOS=��,1,%&SHOWINFO%
    CALC #&fPOS = %&fPOS% + 1
    MSTR &&fFILE=%&fPOS%,0,%&SHOWINFO%
    LPOS* &&wPOS=->,1,%&fFILE%
    CALC #&wPOS = %&wPOS% - 1
    LSTR &&wFILE=%&wPOS%,%&fFILE%
    SIZE &&iSize=%&wFILE%
    CALC &iSize = %&iSize% /1048576#2
    IFEX $%&iSize% > 999, TEAM CALC &iSize = %&iSize% /1024#2|ENVI &iSize=%&iSize% GB! ENVI &iSize=%&iSize% MB
    SITE ?-local ,&&iTIME=FTIME,%&wFILE%
    MSTR &T1,&T2,&T3,&T4,&T5,&T6=<1><2><3><4><5><6>%&iTIME%
    ENVI &iTIME=%&T1%��%&T2%��%&T3%�� %&T4%:%&T5%:%&T6%
    ENVI &&szInfo=%&wFILE%%&NLDD%��С�� %&iSize%%&NLDD%�޸�ʱ�䣺%&iTIME%
    TIPS. ,%&fFILE%%&NLDD%%&NLDD%%&szInfo%,5000,0,@AL%&CurX%T%&CurY%
_END

_SUB SHOWTIPS
    FIND $%&LFILE%=, EXIT _SUB
    TEAM ENVI &&T1=|ENVI &&T2=|ENVI &&T3=|ENVI &&T4=|ENVI &&T5=|ENVI &&T6=|ENVI &&T21=|ENVI &&T22=
    ENVI @@Cur=?&&CurX;&&CurY
    LPOS &&fPOS=��,1,%&SHOWINFO%
    CALC #&fPOS = %&fPOS% + 1
    MSTR &&fFILE=%&fPOS%,0,%&SHOWINFO%
    SIZE &&iSize=%&fFILE%
    CALC &iSize = %&iSize% /1048576#2
    IFEX $%&iSize% > 999, TEAM CALC &iSize = %&iSize% /1024#2|ENVI &iSize=%&iSize% GB! ENVI &iSize=%&iSize% MB
    SITE ?-local ,&&iTIME=FTIME,%&fFILE%
    MSTR &T1,&T2,&T3,&T4,&T5,&T6=<1><2><3><4><5><6>%&iTIME%
    ENVI &iTIME=%&T1%��%&T2%��%&T3%�� %&T4%:%&T5%:%&T6%
    ENVI &&szInfo=%&fFILE%%&NLDD%��С�� %&iSize%%&NLDD%�޸�ʱ�䣺%&iTIME%
    TIPS. ,%&szInfo%,5000,0,@AL%&CurX%T%&CurY%
_END

// =======================  WIM ģ��  =====================================================================

_SUB WIMGICHECK
    FEXT &&EXT=%~1
    FIND $%&EXT%=WIM, TEAM CALL VolumeInWIM %1|EXIT _SUB
    FIND $%&EXT%=ESD, TEAM CALL VolumeInWIM %1|EXIT _SUB
    FIND $%&EXT%=SWM, TEAM CALL VolumeInWIM %1|EXIT _SUB
    FIND $%&EXT%=ISO, CALL GHOWIMinISO %1
_END

_SUB VolumeInWIM,W600H470,WIM&ESD�����еķ־�/ӳ��,,#1
    ENVI &&WIMSel=%~1
    ENVI &&VolumeTITLE=+30:�־�%&TAB%180:             ����%&TAB%+60:��С%&TAB%+40:λ��%&TAB%180:        ��ʾ����%&TAB%300:  ����
    LABE ,L20T12W370H18,Դ�ļ���%&WIMSel%
    TABL VolumeTABL,L20T32W555H350,%&VolumeTITLE%,,0x40
    EDIT+ VolumeEDIT,L50T70W340H16,,,
    ITEM VolumeButton1,L420T398W70H28,ȷ ��,TEAM CALL RealSTATUS3|KILL \,
    ITEM VolumeButton2,L505T398W70H28,�� ��,KILL \,
    ENVI @VolumeTABL.MSG=_%&WM_LBUTTONDOWN%:  CALL VolumePICK    
    TEAM ENVI &&VLSinWIM=| ENVI &&VolumeSel=| ENVI &&K=0    
    ENVI @VolumeInWIM.MSG=#1: CALL WIMMsg1
    TIME WIMTimer3,200, CALL WIMOnTimer3
    TEAM CALL WIMOnTimer3|ENVI &&WIMPATH=%1
    THREAD* GetWIMVolumes %&WIMPATH%
_END

_SUB WIMOnTimer3
    ENVI @VolumeEDIT=��������WIM�еľ����Ժ�...  ����ʱ��: %&K%��
    CALC &K= %&K% + 0.2#1
_END

_SUB CheckUltraISODrv
    IFEX $%&KillVD%=1,EXEC =*ImDisk.exe -D -m %&FFDrv%:
    CALL FreeDrvs
    EXEC =*ImDisk.exe -a -f "%1" -m %&FFDrv%:
_END

_SUB GetWIMVolumes
    TEAM ENVT &&WIMINFO=|ENVI &&vln=|ENVI &&F1=|ENVI &&cPOS1=0|ENVI &&cPOS2=0|ENVI &&Lc=0|ENVI &&cDESC=|ENVI &&HEX_WIMINFO= 
    TEAM ENVI &&Wstr=|ENVI &&DISPOS=0|ENVI &&aSIZE=|ENVI &&aDESC=|ENVI &&bDESC=|ENVI &&szVol=|ENVI &&dDESC=|ENVI &&fDESC= 
    EXEC* -code:UTF8 -exe:*#201  &WIMINFO=!imagex /info %1
    FORX *NL &WIMINFO,&vln,
    {*
        MSTR &F1=<1>%&vln%
        FIND $%&F1%=<IMAGE,
        {
           LPOS &cPOS1=",1,%&vln%
           LPOS &cPOS2=",2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &Wstr=%&cPOS1%,%&Lc%,%&vln%
        }
        LPOS* &DISPOS=<NAME>,1,%&F1%
        IFEX $%&DISPOS% = 1,
        {
           MSTR &cPOS1=11,0,%&vln%        
           MSTR &aDESC=-8,0,%&cPOS1%
        }
        LPOS* &DISPOS=<TOTALBYTES>,1,%&F1%
        IFEX $%&DISPOS% = 1,
        {
           LPOS &cPOS1=>,1,%&vln%
           LPOS &cPOS2=<,2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &aSIZE=%&cPOS1%,%&Lc%,%&vln%
           CALC &aSIZE = %&aSIZE% / 1073741824#2
           IFEX $%&aSIZE% < 0.9, TEAM CALC &aSIZE = %&aSIZE% * 1024#1|ENVI &szVol=[%&aSIZE%MB]! ENVI &szVol=[%&aSIZE%GB]
        }
       LPOS* * &DISPOS=<ARCH>,1,&F1
       IFEX $%&DISPOS% = 1,
        {
           LPOS* * &cPOS1=>,1,&vln
           LPOS* * &cPOS2=<,2,&vln
           CALC #&cPOS1=%&cPOS1%+1
           CALC #&Lc=%&cPOS2%-%&cPOS1%
           MSTR * &dDESC=%&cPOS1%,%&Lc%,&vln
           FIND $%&dDESC%=0,ENVI &cDESC=32λ
           FIND $%&dDESC%=9,ENVI &cDESC=64λ
        }     
        LPOS* &DISPOS=<DISPLAYNAME>,1,%&F1%
        IFEX $%&DISPOS% = 1,
        {
           LPOS &cPOS1=>,1,%&vln%
           LPOS &cPOS2=<,2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &bDESC=%&cPOS1%,%&Lc%,%&vln%
        }
        LPOS* * &DISPOS=<DESCRIPTION>,1,&F1
        IFEX $%&DISPOS% = 1,
        {
                LPOS* * &cPOS1=>,1,&vln
                LPOS* * &cPOS2=<,2,&vln
                CALC #&cPOS1=%&cPOS1%+1
                CALC #&Lc=%&cPOS2%-%&cPOS1%
                MSTR * &fDESC=%&cPOS1%,%&Lc%,&vln             
        } 
        FIND $%&F1%=</IMAGE>,
        {
            ENVI &VLSinWIM=%&VLSinWIM%%&Wstr%%&TAB%%&aDESC%%&TAB%%&szVol%%&TAB%%&cDESC%%&TAB%%&bDESC%%&TAB%%&fDESC%%&NLDD%              
            TEAM ENVI &Wstr=|ENVI &aSIZE=|ENVI &aDESC=|ENVI &bDESC=|ENVI &szVol=|ENVI &cDESC=|ENVI &dDESC=|ENVI &&fDESC=
        }
    }
    ENVI @WIMTimer3=0
    ENVI @VolumeInWIM.POSTMSG=#1
_END

_SUB WIMMsg1
    TEAM ENVI @WIMTimer3=0| ENVI @VolumeEDIT.Visable=0 
    ENVI @VolumeTABL.Val=1*;%&VLSinWIM% 
    ENVI @VolumeTABL.Sel=1;*
    CALL VolumePICK
_END

_SUB VolumePICK
    ENVI @VolumeTABL.Sel=?&&Sel
    ENVI @VolumeTABL.Val=?%&Sel%.1;&VolumeSel1
    ENVI @VolumeTABL.Val=?%&Sel%.2;&VolumeSel2
    ENVI @VolumeTABL.Val=?%&Sel%.3;&VolumeSel3
    ENVI @VolumeTABL.Val=?%&Sel%.4;&VolumeSel4
    ENVI @VolumeTABL.Val=?%&Sel%.5;&VolumeSel6
    ENVI @VolumeTABL.Val=?%&Sel%.6;&VolumeSel7
    FIND $%&VolumeSel6%=,ENVI &VolumeSel5=%&VolumeSel7%!ENVI &VolumeSel5=%&VolumeSel6%
    ENVI &VolumeSel=%&VolumeSel1% %&VolumeSel2% %&VolumeSel3% %&VolumeSel4% %&VolumeSel5%
_END

_SUB RealSTATUS3
    FIND $%&VolumeSel%=,!
    {
        ENVI. @STATUS3=��ѡ·��/�ļ���%&WIMSel%-> %&VolumeSel%
    }
_END

_SUB GHOWIMinISO,W600H470,ISO�еľ����б�,,#1
    ENVI &&ISOSel=%~1
    ENVI &&GHOWIMTITLE=150:        ӳ��%&TAB%+30:�־�%&TAB%180:             ����%&TAB%+60:��С%&TAB%+40:λ��%&TAB%180:        ��ʾ����%&TAB%300:  ����
    LABE ,L20T12W420H18,Դ�ļ���%&ISOSel%
    TABL GHOWIMTABL,L20T32W555H350,%&GHOWIMTITLE%,,0x10040
    EDIT+ GHOWIMEDIT,L50T70W350H16,,,
    ITEM GHOWIMButton1,L420T398W70H28,ȷ ��,TEAM CALL GHOWIMSTATUS3|KILL \,
    ITEM GHOWIMButton2,L505T398W70H28,�� ��,KILL \,
    ENVI @GHOWIMTABL.MSG=_%&WM_LBUTTONDOWN%:  CALL GHOWIMPICK
    ENVI &&GHOWIMSel=
    ENVI &&K=0
    ENVI &&GHOWIMLS=
    ENVI @GHOWIMinISO.MSG=#1: CALL GHOWIMMsg1
    TIME GHOWIMTimer3,200, CALL GHOWIMOnTimer3
    CALL GHOWIMOnTimer3
    ENVI &&ISOPATH=%1
    THREAD* ISO2GHOWIM 
_END

_SUB ISO2GHOWIM
    CALL CheckUltraISODrv %&ISOPATH%
    TEAM ENVI &&aGHOLS=|ENVI &&GLSinISO=|ENVI &&vln=|ENVI &&HD45=
    FORX /S:3 /size:524288000:16106127360 %&FFDrv%:\*.GHO,ANYGHO,0,ENVI &aGHOLS=%&aGHOLS%%&NLDD%%ANYGHO%
    FORX *NL &aGHOLS,&vln,
    {
        FIND $%&vln%=,!
        {
            FNAM &HD45=%&vln%
            FIND $%&HD45%=HD4,! FIND $%&HD45%=HD5,! ENVI &GLSinISO=%&GLSinISO%%&vln%%&NLDD%
        }
    }
    TEAM ENVI &&aWIMLS=|ENVI &&WLSinISO=|ENVI &&R9=
    FORX /S:3 %&FFDrv%:\*.WIM,ANYWIM,0,ENVI &aWIMLS=%&aWIMLS%%&NLDD%%ANYWIM%
    FORX /S:3 %&FFDrv%:\*.ESD,ANYWIM,0,ENVI &aWIMLS=%&aWIMLS%%&NLDD%%ANYWIM%    
    FORX *NL &aWIMLS,&vln,
    {
        FIND $%&vln%=,!
         {
           FNAM &R9=%&vln%
           FIND $%&R9%=BOOT,! CALL GetWIMVolumesInISO "%&vln%"      
         }
    }
    ENVI &GHOWIMLS=%&GLSinISO%%&WLSinISO%
    ENVI &KillVD=1
    ENVI @GHOWIMOnTimer3=0 
    ENVI @GHOWIMinISO.POSTMSG=#1
_END

_SUB GetWIMVolumesInISO
    TEAM ENVT &&WIMINFO=|ENVI &&vln=|ENVI &&F1=|ENVI &&cPOS1=0|ENVI &&cPOS2=0|ENVI &&Lc=0|ENVI &&cDESC=|ENVI &&HEX_WIMINFO=
    TEAM ENVI &&Wstr=|ENVI &&DISPOS=0|ENVI &&aSIZE=|ENVI &&aDESC=|ENVI &&bDESC=|ENVI &&szVol=|ENVI &&dDESC=|ENVI &&fDESC= 
    EXEC* -code:UTF8 -exe:#201 &WIMINFO=!IMAGEX /info %1 
    FORX *NL &WIMINFO,&vln,
    {*
        MSTR &F1=<1>%&vln%
        FIND $%&F1%=<IMAGE,
        {*
           LPOS &cPOS1=",1,%&vln%
           LPOS &cPOS2=",2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &Wstr=%&cPOS1%,%&Lc%,%&vln%
        }
        LPOS* &DISPOS=<NAME>,1,%&F1%
        IFEX $%&DISPOS% = 1,
        {*
           LPOS &cPOS1=>,1,%&vln%
           LPOS &cPOS2=<,2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &aDESC=%&cPOS1%,%&Lc%,%&vln%
        }
        LPOS* &DISPOS=<TOTALBYTES>,1,%&F1%
        IFEX $%&DISPOS% = 1,
        {*
           LPOS &cPOS1=>,1,%&vln%
           LPOS &cPOS2=<,2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &aSIZE=%&cPOS1%,%&Lc%,%&vln%
           CALC &aSIZE = %&aSIZE% / 1073741824#2
           IFEX $%&aSIZE% < 0.9, TEAM CALC &aSIZE = %&aSIZE% * 1024#1|ENVI &szVol=[%&aSIZE%MB]! ENVI &szVol=[%&aSIZE%GB]
        }
        LPOS* * &DISPOS=<ARCH>,1,&F1
        IFEX $%&DISPOS% = 1,
        {*
           LPOS* * &cPOS1=>,1,&vln
           LPOS* * &cPOS2=<,2,&vln
           CALC #&cPOS1=%&cPOS1%+1
           CALC #&Lc=%&cPOS2%-%&cPOS1%
           MSTR * &dDESC=%&cPOS1%,%&Lc%,&vln
           FIND $%&dDESC% = 0,ENVI &cDESC=32λ
           FIND $%&dDESC% = 9,ENVI &cDESC=64λ
        }     
        LPOS* &DISPOS=<DISPLAYNAME>,1,%&F1%
        IFEX $%&DISPOS% = 1,
        {*
           LPOS &cPOS1=>,1,%&vln%
           LPOS &cPOS2=<,2,%&vln%
           CALC #&cPOS1 = %&cPOS1% + 1
           CALC #&Lc = %&cPOS2% - %&cPOS1%
           MSTR &bDESC=%&cPOS1%,%&Lc%,%&vln%
        }
        LPOS* * &DISPOS=<DESCRIPTION>,1,&F1
        IFEX $%&DISPOS% = 1,
        {*
           LPOS* * &cPOS1=>,1,&vln
           LPOS* * &cPOS2=<,2,&vln
           CALC #&cPOS1=%&cPOS1%+1
           CALC #&Lc=%&cPOS2%-%&cPOS1%
           MSTR * &fDESC=%&cPOS1%,%&Lc%,&vln
        } 
        FIND $%&F1%=</IMAGE>,
        {*
            ENVI &WLSinISO=%&WLSinISO%%~1%&TAB%%&Wstr%%&TAB%%&aDESC%%&TAB%%&szVol%%&TAB%%&cDESC%%&TAB%%&bDESC%%&TAB%%&fDESC%%&NLDD%              
            TEAM ENVI &Wstr=|ENVI &aSIZE=|ENVI &aDESC=|ENVI &bDESC=|ENVI &szVol=|ENVI &cDESC=|ENVI &dDESC=|ENVI &&fDESC=
        }
    }
_END

_SUB GHOWIMOnTimer3
    ENVI @GHOWIMEDIT=���������������Ժ�...  ����ʱ��: %&K%��
    CALC &K= %&K% + 0.2#1
_END

_SUB GHOWIMMsg1
    TEAM ENVI @GHOWIMOnTimer3=0| ENVI @GHOWIMEDIT.Visable=0
    FIND $%&GHOWIMLS%=, TEAM MESS ��ISOǰ����Ŀ¼�������������������ľ���|KILL \|EXIT _SUB
    ENVI @GHOWIMTABL.Val=1*;%&GHOWIMLS%
    ENVI @GHOWIMTABL.Sel=1;*
    CALL GHOWIMPICK
_END

_SUB GHOWIMPICK 
    ENVI @GHOWIMTABL.Sel=?&&Sel
    ENVI @GHOWIMTABL.Val=?%&Sel%.1;&GHOWIMSel1
    ENVI @GHOWIMTABL.Val=?%&Sel%.2;&GHOWIMSel2
    ENVI @GHOWIMTABL.Val=?%&Sel%.3;&GHOWIMSel3
    ENVI @GHOWIMTABL.Val=?%&Sel%.4;&GHOWIMSel4
    ENVI @GHOWIMTABL.Val=?%&Sel%.5;&GHOWIMSel5
    ENVI @GHOWIMTABL.Val=?%&Sel%.6;&GHOWIMSel7
    ENVI @GHOWIMTABL.Val=?%&Sel%.7;&GHOWIMSel8
    FIND $%&GHOWIMSel7%=,ENVI &GHOWIMSel6=%&GHOWIMSel8%!ENVI &GHOWIMSel6=%&GHOWIMSel7%
    RSTR &&REL10=4,%&GHOWIMSel1%
    FIND $%&REL10%=.GHO,ENVI &GHOWIMSel=%&GHOWIMSel1%!ENVI &GHOWIMSel=%&GHOWIMSel1%-> %&GHOWIMSel2% %&GHOWIMSel3% %&GHOWIMSel4% %&GHOWIMSel5% %&GHOWIMSel6%
_END

_SUB GHOWIMSTATUS3
    FIND $%&GHOWIMSel%=,!
    {
        ENVI. @STATUS3=��ѡ·��/�ļ���%&GHOWIMSel%
    }
_END

_SUB RESTOREWIM
    IFEX $%&PEPOS% = 0,!! FIND $%&PARTSEL2%=%SYSTEMDRIVE%,!! TEAM MESS �뵽PE�л�ԭϵͳ|EXIT _SUB
    ENVI &&szDrv=
    ENVI &SHUTorREBOOT=0
    FDRV &szDrv=%GHOLIST%
    LPOS &&pPOS=��,1,%STATUS3%
    CALC #&pPOS = %&pPOS% + 1
    MSTR &&pFILE=%&pPOS%,0,%STATUS3%
    LPOS* &pPOS=->,1,%&pFILE%
    CALC #&&WIMFILEPOS = %&pPOS% - 1
    LSTR &&WIMFILE=%&WIMFILEPOS%,%&pFILE%
    MSTR &&VolNumString=%&pPOS%,0,%&pFILE%
    MSTR &&VolNum=<2>%&VolNumString%
    RSTR &&IsSWM=4,%&WIMFILE%
    ENVI &&SWMFILE=
    FIND $%&IsSWM%=.SWM, MSTR &SWMFILE=-5,0,%&WIMFILE%
    IFEX %&WIMFILE%,! TEAM MESS. �Ҳ���%&WIMFILE%��|EXIT _SUB
    ENVI @MHGHO2012.Visable=0
    CALL @WIMApplyProgressor
_END

_SUB WIMApplyProgressor,W432H316,WIM��ԭ����,,#1,,,-discloseb
    LABE. -left ,L26T18W400H31,��"%&WIMFILE%"�ĵ�%&VolNum%��ԭ�� %&PARTSEL2%,,0xFF0000
    CHEK KillAll,L26T50W380H18,��ʽ��Ŀ�����,,1
    CHEK FixBoot,L26T85W90H18,�Զ��޸�����,,1
    CHEK Unattend,L26T120W90H18,�������ֵ��,,0
    LABE -left fghui,L140T123W250H16,������ԭ��Win7/8/8.1/10ϵͳ,,0xFF0000
    LABE ,L26T157W61H18,��ɺ�,,
    CHEK WIMAPPLYSHUT,L280T154W62H18,�ػ�,CALL WIMSHUTRB1,0
    CHEK WIMAPPLYRB,L350T154W62H18,����,CALL WIMSHUTRB2,0
    TEAM ENVI &&p=0|ENVI &&V=|ENVI &&vLn=|ENVI &&L2=
    PBAR PBAR1,L26T186W380H22,0
    LABE -vcenter -trans -ncmd ApplyDoneInfo,L20T213W120H22,,,0xFF0000
    LABE -vcenter -trans -ncmd CalculateInfo,L290T213W120H22,,,0xFF0000
    TEAM ENVI &&TDrvNum=|ENVI &&Tstyle=|ENVI &&EFIDrive=|ENVI &&ActiveDrv=
    TEAM ENVI &&totalSec=0|ENVI &&cSec=0|ENVI &&cMin=0|ENVI &&cHour=0|ENVI &&TMP=0
    TEAM ENVI &&LtoSec=0|ENVI &&LSec=0|ENVI &&LMin=0|ENVI &&LHour=0
    TIME &ApplyTimer,0, CALL OnApplyTimer
    TIME &ElapsedTime,0, CALL CalculateElapsedTime
    ITEM ApplyOK,L226T244W80H28,ȷ ��,CALL OnApply,
    ITEM ApplyCancel,L326T244W80H28,ȡ ��,TEAM ENVI @MHGHO2012.Visable=1|KILL \,
_END

_SUB WIMSHUTRB1
    FIND $%WIMAPPLYSHUT.Check%=1, ENVI @WIMAPPLYRB.Check=0
_END

_SUB WIMSHUTRB2
    FIND $%WIMAPPLYRB.Check%=1, ENVI @WIMAPPLYSHUT.Check=0
_END

_SUB OnApply
    TEAM ENVI @KillAll.Enable=0|ENVI @FixBoot.Enable=0|ENVI @Unattend.Enable=0
    TEAM ENVI @WIMAPPLYSHUT.Enable=0|ENVI @WIMAPPLYRB.Enable=0|ENVI @ApplyOK.Enable=0|ENVI @ApplyCancel.Enable=0 
    IFEX $%KillAll.Check% = 1,
    {
        FIND $%&szDrv%=%&PARTSEL2%,
        {
            MESS. ��ѡ%GHOLIST%��Ŀ��������޷���ʽ�����뿽�������������ٽ��С�
            KILL \
            ENVI @MHGHO2012.Visable=1
            KILL @MHGHO2012
            EXIT _SUB
        }
        ENVI @PBAR1=1;���ڸ�ʽ��...
        DFMT %&PARTSEL2%,NTFS, 
        WAIT 1000
    } 
    TEAM ENVI @&ApplyTimer=1000|ENVI @&ElapsedTime=2000
    FIND $%&IsSWM%=.SWM,!
    {
        EXEC*  --cmd::2000:OnApplyMsg -exe:*#201 &V=!IMAGEX.EXE /APPLY "%&WIMFILE%" "%&VolNum%" "%&PARTSEL2%"
    }
    FIND $%&IsSWM%=.SWM,
    {
        EXEC*  --cmd::2000:OnApplyMsg -exe:*#201 &V=!IMAGEX.EXE /ref "%&SWMFILE%*.SWM" /apply "%&WIMFILE%" "%&VolNum%" "%&PARTSEL2%"
    }
    FDIR &&srcWIMDir=%&WIMFILE%
    IFEX %&srcWIMDir%\$OEM$\,
    {
        FILE %&srcWIMDir%\$OEM$\$1\*.*=>%&PARTSEL2%\
        FILE %&srcWIMDir%\$OEM$\$$\*.*=>%&PARTSEL2%\WINDOWS
    }
    ENVI @PBAR1=100;��ԭ�ɹ���
    TEAM ENVI @&ApplyTimer=0|ENVI @&ElapsedTime=0
    TEAM ENVI @ApplyDoneInfo=����ʱ�䣺%&cHour%:%&cMin%:%&cSec%|ENVI @CalculateInfo=ʣ��ʱ�䣺00:00:00  
    WAIT 2000
    IFEX $%FixBoot.Check% = 1,
    {
      CALL GetTargetPartitionInfo
      CALL AutomaticGuidanceRepair
    }  
    IFEX $%Unattend.Check%=1,CALL Determinedversion
    WAIT 1000
    IFEX $%WIMAPPLYSHUT.Check%=1,ENVI &SHUTorREBOOT=1
    IFEX $%WIMAPPLYRB.Check%=1,ENVI &SHUTorREBOOT=2
    ENVI @MHGHO2012.Visable=1
    KILL @MHGHO2012
    KILL \
_END

_SUB OnApplyMsg
    FIND $%&V%=, EXIT -
    READ -,0,&vLn,%&V%
    MSTR &L2=<2>%&vLn%
    MSTR &p=-2,0,%&L2%
    CALC #&p=%&p%
    IFEX %&p% < 0, EXIT
    ENVI @PBAR1=%&p%;���ڻ�ԭ.....%&p%%%
_END

_SUB OnApplyTimer   
    CALC #&totalSec = %&totalSec% + 1
    CALC #&cSec = %&totalSec% % 60
    CALC #&TMP = %&totalSec% / 60
    CALC #&cMin = %&TMP% % 60
    CALC #&cHour = %&TMP% / 60
    IFEX $%&cSec% < 10, ENVI &cSec=0%&cSec%
    IFEX $%&cMin% < 10, ENVI &cMin=0%&cMin%
    IFEX $%&cHour% < 10, ENVI &cHour=0%&cHour%
    ENVI @ApplyDoneInfo=����ʱ�䣺%&cHour%:%&cMin%:%&cSec%
_END

_SUB CalculateElapsedTime
    CALC &LtoSec = ( 100 - %&p% ) / %&p% * %&totalSec%#0 
    CALC #&LSec = %&LtoSec% % 60
    CALC #&TMP = %&LtoSec% / 60
    CALC #&LMin = %&TMP% % 60
    CALC #&LHour = %&TMP% / 60
    IFEX $%&LSec% < 10, ENVI &LSec=0%&LSec%
    IFEX $%&LMin% < 10, ENVI &LMin=0%&LMin%
    IFEX $%&LHour% < 10, ENVI &LHour=0%&LHour%
    ENVI @CalculateInfo=ʣ��ʱ�䣺%&LHour%:%&LMin%:%&LSec%
_END

///=========================================================================================================
_SUB AutomaticGuidanceRepair
     FIND $%&Tstyle%=MBR,CALL BootMBR
     FIND $%&Tstyle%=GPT,CALL BootGPT
_END

_SUB BootMBR
    TEAM ENVI &&iVer=|&&VerPOS=|&&ThisVer=
    IFEX %&PARTSEL2%\windows\system32\kernel32.dll,
    {
      SITE ?&iVer=FVER,%&PARTSEL2%\windows\system32\kernel32.dll
      LPOS &VerPOS=.,1,%&iVer%
      CALC #&VerPOS = %&VerPOS% - 1
      LSTR &ThisVer=%&VerPOS%,%&iVer%
      IFEX $%&ThisVer% > 5, TEAM CALL BootNT60|EXIT _SUB
      CALL GetActivePartition
      EXEC -exe:#203 =!bootsect.exe /nt52 %&ActiveDrv%
    }
_END

_SUB BootNT60   
     CALL GetActivePartition
     FIND $%&PARTSEL2%=%&ActiveDrv%,CALL TSELeDrv!CALL ActPART  
_END

_SUB TSELeDrv
     IFEX %&PARTSEL2%\Boot\BCD,!
     {
       EXEC -exe:#202 =!bcdboot.exe %&PARTSEL2%\Windows /s %&ActiveDrv% /f BIOS /l zh-CN
       EXEC -exe:#203 =!bootsect.exe /nt60 %&ActiveDrv% /mbr
     }
     EXEC -exe:#203 =!bootsect.exe /nt60 %&ActiveDrv%    
_END

_SUB ActPART
    IFEX %&ActiveDrv%\Boot\BCD,!
    {
      EXEC -exe:#202 =!bcdboot.exe %&PARTSEL2%\Windows /s %&ActiveDrv% /f BIOS /l zh-CN
      EXEC -exe:#203 =!bootsect.exe /nt60 %&ActiveDrv%
      IFEX %&ActiveDrv%\ntldr,!! IFEX %&ActiveDrv%\boot.ini,!! IFEX %&ActiveDrv%\Windows,!! CALL NT52BCD
      EXIT _SUB
    }
    IFEX %&ActiveDrv%\Boot\BCD,!! IFEX %&ActiveDrv%\BOOTMGR,!! CALL 567HJKI89       
_END

_SUB NT52BCD
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /create {ntldr} /d "Earlier Windows OS Loader"
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set {ntldr} device partition=%&ActiveDrv%
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set {ntldr} path \ntldr
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set {ntldr} description "Windows XP" 
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /displayorder {ntldr} /addlast
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /timeout 5  
    EXEC -exe:#203 =!bootsect.exe /nt60 %&ActiveDrv% /mbr    
_END

_SUB 567HJKI89
    TEAM ENVI &&part=|ENVI &&FORM=|ENVI &&M=1|ENVI &&pou=|ENVI &&A1=|ENVI &&A2=|ENVI &&Lett=1|ENVI &&M1=
    TEAM ENVI &&Lnv=|ENVI &&ID=
    EXEC* -exe:*#204 &part=!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /enum osloader
    READ -,-1,&FORM,%&part%
    LOOP #%&M% <= %&FORM%,
    {
      READ -,%&M%,&pou,%&part% 
      MSTR &A1,&A2=<1><2>%&pou%  
      FIND $%&A1%=device,!! FIND $%&A2%=partition=%&PARTSEL2%,!! TEAM ENVI &Lett=0|ENVI &M1=%&M%|EXIT LOOP
      CALC #&M = %&M% + 1
    }
    IFEX $%&Lett%=0,
    {
      CALC #&M1 = %&M1% - 1
      READ -,%&M1%,&Lnv,%&part%
      MSTR &ID=<2>%&Lnv%
      EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /delete %&ID% /cleanup
      TEAM CALL RTYUUIOFFEFFGGHH|EXIT _SUB
    }
    IFEX $%&Lett%=1,CALL RTYUUIOFFEFFGGHH
_END

 _SUB RTYUUIOFFEFFGGHH 
    TEAM ENVI &&iVer=|ENVI &&part22=|ENVI &&A3=
    HIVE 123,%&PARTSEL2%\Windows\System32\config\SOFTWARE
    REGI HKEY_LOCAL_MACHINE\123\Microsoft\Windows NT\CurrentVersion\ProductName,&iVer
    HIVE 123
    EXEC* -exe:*#204 &part22=!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /create /d "%&iVer%" /application osloader   
    MSTR &A3=<3>,%&part22%
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set %&A3% device  partition=%&PARTSEL2%
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set %&A3% path  \Windows\system32\winload.exe
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set %&A3% locale  zh-CN     
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set %&A3% osdevice  partition=%&PARTSEL2%
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set %&A3% systemroot  \Windows
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /set %&A3% nx   OptIn
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /displayorder %&A3% /addlast 
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /default %&A3%
    EXEC -exe:*#204 =!bcdedit /store "%&ActiveDrv%\BOOT\BCD" /timeout 10
    EXEC -exe:#203 =!bootsect.exe /nt60 %&ActiveDrv%
_END

_SUB BootGPT
    ENVI &&Fexist=0
    CALL SetBOOTAndActive
    FIND $%&EFIDrive%= ,!
    {
      ENVI &Fexist=1
      IFEX %&EFIDrive%\EFI\Boot\BOOTX64.EFI,! ENVI &Fexist=0
      IFEX %&EFIDrive%\EFI\Microsoft\Boot\BCD,! ENVI &Fexist=0
      FIND $%&Fexist%=0,TEAM EXEC -exe:#202 =!bcdboot.exe %&PARTSEL2%\Windows /s %&EFIDrive% /f UEFI /l zh-CN|EXIT _SUB
      FIND $%&Fexist%=1,CALL SetBCDEDIT 
_END

_SUB SetBCDEDIT
    TEAM ENVI &&part=|ENVI &&FORM=|ENVI &&M=1|ENVI &&pou=|ENVI &&A1=|ENVI &&A2=|ENVI &&Lett=1|ENVI &&M1=
    TEAM ENVI &&Lnv=|ENVI &&ID=
    EXEC* -exe:*#204 &part=!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /enum osloader
    READ -,-1,&FORM,%&part%
    LOOP #%&M% <= %&FORM%,
    {
      READ -,%&M%,&pou,%&part% 
      MSTR &A1,&A2=<1><2>%&pou%  
      FIND $%&A1%=device,!! FIND $%&A2%=partition=%&PARTSEL2%,!! TEAM ENVI &Lett=0|ENVI &M1=%&M%|EXIT LOOP
      CALC #&M = %&M% + 1
    }
    IFEX $%&Lett%=0,
    {
      CALC #&M1 = %&M1% - 1
      READ -,%&M1%,&Lnv,%&part%
      MSTR &ID=<2>%&Lnv%
      EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /delete %&ID% /cleanup 
      TEAM CALL RREEWWQQUUII|EXIT _SUB
    }
    IFEX $%&Lett%=1,CALL RREEWWQQUUII
_END

 _SUB RREEWWQQUUII 
    TEAM ENVI &&iVer=|ENVI &&part22=|ENVI &&A3=
    HIVE 123,%&PARTSEL2%\Windows\System32\config\SOFTWARE
    REGI HKEY_LOCAL_MACHINE\123\Microsoft\Windows NT\CurrentVersion\ProductName,&iVer
    HIVE 123
    EXEC* -exe:*#204 &part22=!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /create /d "%&iVer%" /application osloader   
    MSTR &A3=<3>,%&part22%
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /set %&A3% device  partition=%&PARTSEL2%
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /set %&A3% path  \Windows\system32\winload.efi
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /set %&A3% locale  zh-CN     
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /set %&A3% osdevice  partition=%&PARTSEL2%
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /set %&A3% systemroot  \Windows
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /set %&A3% nx   OptIn
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /displayorder %&A3% /addlast 
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /default %&A3%
    EXEC -exe:*#204 =!bcdedit /store "%&EFIDrive%\EFI\Microsoft\Boot\BCD" /timeout 5
_END

//------------�жϻ�ԭ��������Ӳ�̷�������GPT����MBR
_SUB GetTargetPartitionInfo
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A2=|ENVI &&A8=|ENVI &&tPOS=0
    LPOS &tPOS=:,1,%&PARTSEL1%
    CALC #&tPOS = %&tPOS% - 1
    LSTR &TDrvNum=%&tPOS%,%&PARTSEL1%
    FIND $%&PARTSEL2%=  ,!
    {
        FORX *NL &vFORM,&vLn,
        {
            MSTR* &A2,&A8=<2><8>%&vLn%
            FIND $%&A2%=%&PARTSEL2%,TEAM ENVI &Tstyle=%&A8%|EXIT FORX
        }
        EXIT _SUB
    }
    FIND $%&PARTSEL1%=  ,!
    {
        FORX *NL &vFORM,&vLn,
        {
            MSTR* &A1,&A8=<1><8>%&vLn%
            FIND $%&A1%=%&PARTSEL1%,TEAM ENVI &Tstyle=%&A8%|EXIT FORX
        }
    }
_END

//------------�ж�mbr�������������̵��̷�
_SUB GetActivePartition
    TEAM ENVI &&vln=|ENVI &&A1=|ENVI &&A2=|ENVI &&A9=|ENVI &&E1=|ENVI &&E2=
    FORX *NL &vFORM,&vln,
    {
        MSTR* &A1,&A2,&A9=<1><2><9>%&vln%
        IFEX $%&A9% = 1,
        {
            LPOS &E1=:,1,%&A1%
            CALC #&E1 = %&E1% - 1
            LSTR &E2=%&E1%,%&A1%
            IFEX $%&E2% = %&TDrvNum%, TEAM ENVI &ActiveDrv=%&A2%|EXIT _SUB
        }
    }
_END

//------------�ж�gpt�������������̵��̷�
_SUB SetBOOTAndActive
    TEAM ENVI &&vLn=|ENVI &&A1=|ENVI &&A2=|ENVI &&A5=|ENVI &&tPOS=|ENVI &&aNum=|ENVI &&Fexist=0
    FORX *NL &vFORM,&vLn,
    {
        MSTR* &A1,&A2,&A5=<1><2><5>%&vLn%
        FIND $%&A5%=EFI,
        {
            LPOS &tPOS=:,1,%&A1%
            CALC #&tPOS = %&tPOS% - 1
            LSTR &aNum=%&tPOS%,%&A1%
            IFEX $%&aNum% = %&TDrvNum%, TEAM ENVI &EFIDrive=%&A2%|EXIT FORX
        }
    }
_END
//================================================================================================================================
_SUB BACKUPWIM
    IFEX $%&PEPOS% = 0,!! FIND $%&PARTSEL2%=%SYSTEMDRIVE%,!! TEAM MESS �뵽PE�б���ϵͳ|EXIT _SUB
    TEAM ENVI &&pBLK=|ENVI &&szDrive=|ENVI &&szDrvPOS=0
    MSTR &pBLK=<1->%GHOBACK%
    LPOS &szDrvPOS=\,1,%&pBLK%
    IFEX $%&szDrvPOS% = 0, TEAM MESS ��ѡ��Ϸ��ı���·����|EXIT _SUB
    CALC #&szDrvPOS = %&szDrvPOS% - 1
    LSTR &szDrive=%&szDrvPOS%,%&pBLK%
    TEAM ENVI &&legalDrv=|ENVI &&legalNum=
    CALL CheckBKPathLegal "%&szDrive%"
    FIND $%&legalDrv%=,!! FIND $%&legalNum%=,!! TEAM MESS ���ݵı���·�����Ϸ���������ָ����|EXIT _SUB
    RPOS &&pDIR=\,1,%&pBLK%
    LSTR &&pMKDIR=%&pDIR%,%&pBLK%
    ENVI &&ExistFolder=0
    IFEX %&pMKDIR%, ENVI &ExistFolder=1!MDIR %&pMKDIR%
    ENVI @MHGHO2012.Visable=0
    IFEX %&pBLK%, CALL @WIMAppend! CALL @WIMCapture
_END

_SUB WIMCapture,W432H315,WIM���ݷ���,,#1,,,-discloseb
    LABE. -left ,L26T16W400H31,�� %&PARTSEL2% ���ݵ�"%&pBLK%",,0xFF0000
    LABE ,L26T50W80H16,���ƣ�,
    EDIT WIMName,L108T48W280H18,,
    LABE ,L26T80W80H16,������,    
    date *space &&szTime1
    MSTR &&B1,&&B2,&&B3,&&B5,&&B6,&&B7=<1><2><3><5><6><7>%&szTime1% 
    EDIT WIMDescribe,L108T78W280H19,%&B1%-%&B2%-%&B3% %&B5%:%&B6%:%&B7%,
    LABE ,L26T113W80H16,ѹ������,
    LIST WIMCompress,L108T109W90H20,���ѹ��|����ѹ��|��ѹ��,,���ѹ��,
    LABE ,L26T150W61H18,��ɺ�,,
    CHEK WIMCaptureSHUT,L88T147W62H18,�ػ�,CALL CaptureSHUTRB1,0
    CHEK WIMCaptureRB,L152T147W62H18,����,CALL CaptureSHUTRB2,0
    TEAM ENVI &&p=0|ENVI &&V=|ENVI &&vLn=|ENVI &&L2=
    PBAR CaptureBar,L26T185W380H22,0
    LABE -center -vcenter -trans -ncmd CaptureDoneInfo,L25T208W381H18,,,0xFF0000
    TEAM ENVI &&totalSec=0|ENVI &&cSec=0|ENVI &&cMin=0|ENVI &&cHour=0|ENVI &&TMP=0
    TIME &CaptureTimer,0, CALL OnCaptureTimer
    ITEM CaptureOK,L226T240W80H28,ȷ ��,CALL OnCapture,
    ITEM CaptureCancel,L326T240W80H28,ȡ ��,TEAM ENVI @MHGHO2012.Visable=1|KILL \,  
_END

_SUB CaptureSHUTRB1
    FIND $%WIMCaptureSHUT.Check%=1, ENVI @WIMCaptureRB.Check=0
_END

_SUB CaptureSHUTRB2
    FIND $%WIMCaptureRB.Check%=1, ENVI @WIMCaptureSHUT.Check=0
_END

_SUB OnCapture
    TEAM ENVI @CaptureOK.Enable=0|ENVI @WIMName.Enable=0|ENVI @WIMDescribe.Enable=0|ENVI @WIMCompress.Enable=0
    TEAM ENVI @CaptureCancel.Enable=0|ENVI @WIMCaptureRB.Enable=0|ENVI @WIMCaptureSHUT.Enable=0
    ENVI &&CMPR=
    FIND $%WIMCompress%=����ѹ��,ENVI &CMPR=/compress fast
    FIND $%WIMCompress%=���ѹ��,ENVI &CMPR=/compress maximum
    FIND $%WIMCompress%=��ѹ��,ENVI &CMPR=/compress none
    SET &p=-1
    ENVI @CaptureDoneInfo=����ʱ�䣺00:00:00
    ENVI @&CaptureTimer=1000
    EXEC*  --cmd::2000:OnCaptureMsg -exe:#201  &V=!IMAGEX.EXE /capture "%&PARTSEL2%" "%&pBLK%" "%WIMName%" "%WIMDescribe%" %&CMPR%
    ENVI @&CaptureTimer=0
    ENVI &&NewWIMSize=0
    IFEX %&pBLK%, SIZE &NewWIMSize=%&pBLK%
    IFEX $%&NewWIMSize% = 0, ENVI @CaptureBar=100;����ʧ�ܣ�! ENVI @CaptureBar=100;���ݳɹ���
    WAIT 3000
    FIND $%HideFolder.Check%=1, IFEX %&pMKDIR%, SITE %&pMKDIR%,+H
    IFEX $%WIMCaptureSHUT.Check% = 1, ENVI &SHUTorREBOOT=1
    IFEX $%WIMCaptureRB.Check% = 1, ENVI &SHUTorREBOOT=2
    ENVI @MHGHO2012.Visable=1
    KILL @MHGHO2012
    KILL \
_END

_SUB OnCaptureMsg
    FIND $%&V%=, EXIT -
    SET &p0=%&p%
    READ -,0,&vLn,%&V%
    MSTR &L2=<2>%&vLn%
    MSTR &p=-2,0,%&L2%
    CALC #&p=%&p%
    IFEX %&p% < 0, EXIT
    IFEX $%&p% = %&p0%, EXIT
    ENVI @CaptureBar=%&p%;���ڱ���.....%&p%%%
_END

_SUB OnCaptureTimer
    CALC #&totalSec = %&totalSec% + 1
    CALC #&cSec = %&totalSec% % 60
    CALC #&TMP = %&totalSec% / 60
    CALC #&cMin = %&TMP% % 60
    CALC #&cHour = %&TMP% / 60
    IFEX $%&cSec% < 10, ENVI &cSec=0%&cSec%
    IFEX $%&cMin% < 10, ENVI &cMin=0%&cMin%
    IFEX $%&cHour% < 10, ENVI &cHour=0%&cHour%
    ENVI @CaptureDoneInfo=����ʱ�䣺%&cHour%:%&cMin%:%&cSec%
_END

_SUB WIMAppend,W432H332,����/���Ǳ���,,#1,,,-discloseb
    LABE. -left ,L26T16W400H31,�� %&PARTSEL2% ���ݵ�"%&pBLK%",,0xFF0000
    LABE ,L26T51W50H16,���ƣ�,
    EDIT AppendName,L78T48W320H18,
    LABE ,L26T81W50H16,������
    date *space &&szTime
    MSTR &&A1,&&A2,&&A3,&&A5,&&A6,&&A7=<1><2><3><5><6><7>%&szTime%
    EDIT Appendmiaos,L78T78W320H18,%&A1%-%&A2%-%&A3% %&A5%:%&A6%:%&A7%,
    GROU ,L26T104W188H94
    RADI SelectIncrement,L38T119W160H18,��������,CALL EnableCompress,1
    RADI SelectCapture,L38T144W160H18,����ԭ�б���,CALL EnableCompress,0
    LABE -right DescCompress,L35T170W80H16,ѹ������,
    ENVI @DescCompress.Enable=0
    LIST SelectCompress,L116T166W90H20,���ѹ��|����ѹ��|��ѹ��,,���ѹ��,-
    GROU ,L230T104W172H94
    LABE ,L245T119W100H18,��ɺ�,,
    CHEK WIMAppendSHUT,L270T140W100H18,�ػ�,CALL AppendSHUTRB1,0
    CHEK WIMAppendRB,L270T166W100H18,����,CALL AppendSHUTRB2,0
    TEAM ENVI &&p=0|ENVI &&V=|ENVI &&vLn=|ENVI &&L2=
    PBAR AppendBar,L26T212W380H22,0
    LABE -center -vcenter -trans -ncmd AppendDoneInfo,L25T234W381H18,,,0xFF0000
    TEAM ENVI &&totalSec=0|ENVI &&cSec=0|ENVI &&cMin=0|ENVI &&cHour=0|ENVI &&TMP=0
    TIME &AppendTimer,0, CALL OnAppendTimer
    ITEM AppendOK,L226T260W80H28,ȷ ��,CALL CaptureOrAppend,
    ITEM AppendCancel,L326T260W80H28,ȡ ��,TEAM ENVI @MHGHO2012.Visable=1|KILL \,    
_END

_SUB AppendSHUTRB1
    FIND $%WIMAppendSHUT.Check%=1, ENVI @WIMAppendRB.Check=0
_END

_SUB AppendSHUTRB2
    FIND $%WIMAppendRB.Check%=1, ENVI @WIMAppendSHUT.Check=0
_END

_SUB EnableCompress
    FIND $%SelectIncrement.Check%=1, TEAM ENVI @DescCompress.Enable=0|ENVI @SelectCompress.Enable=0|EXIT _SUB
    FIND $%SelectCapture.Check%=1, TEAM ENVI @DescCompress.Enable=1|ENVI @SelectCompress.Enable=1
_END

_SUB CaptureOrAppend
    FIND $%SelectIncrement.Check%=1, TEAM CALL OnAppend|EXIT _SUB
    CALL StillCaptureWIM
_END

_SUB OnAppend
    TEAM ENVI @AppendName.Enable=0|ENVI @Appendmiaos.Enable=0|ENVI @SelectIncrement.Enable=0|ENVI @SelectCapture.Enable=0 
    TEAM ENVI @SelectCompress.Enable=0|ENVI @WIMAppendSHUT.Enable=0|ENVI @WIMAppendRB.Enable=0|ENVI @AppendOK.Enable=0|ENVI @AppendCancel.Enable=0
    TEAM ENVI &&iTIME=|ENVI &&T1=|ENVI &&T2=|ENVI &&T3=|ENVI &&T4=|ENVI &&T5=|ENVI &&T6=|ENVI &&T7=|ENVI &&OldWIMTime=
    IFEX %&pBLK%,
    {
        SITE ?-local ,&iTIME=FTIME,%&pBLK%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &OldWIMTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    SET &p=-1
    ENVI @AppendDoneInfo=����ʱ�䣺00:00:00
    ENVI @&AppendTimer=1000
    EXEC*  --cmd::2000:OnAppendMsg -exe:#201 &V=!IMAGEX.EXE /append "%&PARTSEL2%" "%&pBLK%" "%AppendName%" "Appendmiaos"
    ENVI @&AppendTimer=0
    TEAM ENVI &&NewWIMSize=0|ENVI &&NewWIMTime=|ENVI &&WIMFailure=0
    IFEX %&pBLK%,
    {
        SIZE &NewWIMSize=%&pBLK%
        SITE ?-local ,&iTIME=FTIME,%&pBLK%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &NewWIMTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    FIND $%&NewWIMTime%=%&OldWIMTime%, ENVI &WIMFailure=1
    IFEX $%&NewWIMSize% = 0, ENVI &WIMFailure=1
    IFEX $%&WIMFailure% = 0, ENVI @AppendBar=100;�������ݳɹ���! ENVI @AppendBar=100;��������ʧ�ܣ�
    WAIT 3000
    FIND $%HideFolder.Check%=1, IFEX %&pMKDIR%, SITE %&pMKDIR%,+H
    IFEX $%WIMAppendSHUT.Check% = 1, ENVI &SHUTorREBOOT=1
    IFEX $%WIMAppendRB.Check% = 1, ENVI &SHUTorREBOOT=2
    ENVI @MHGHO2012.Visable=1
    KILL @MHGHO2012
    KILL \
_END

_SUB OnAppendMsg
    FIND $%&V%=, EXIT -
    SET &p0=%&p%
    READ -,0,&vLn,%&V%
    MSTR &L2=<2>%&vLn%
    MSTR &p=-2,0,%&L2%
    CALC #&p=%&p%
    IFEX %&p% < 0, EXIT
    IFEX $%&p% = %&p0%, EXIT
    ENVI @AppendBar=%&p%;���ڱ���.....%&p%%%
_END

_SUB OnAppendTimer
    CALC #&totalSec = %&totalSec% + 1
    CALC #&cSec = %&totalSec% % 60
    CALC #&TMP = %&totalSec% / 60
    CALC #&cMin = %&TMP% % 60
    CALC #&cHour = %&TMP% / 60
    IFEX $%&cSec% < 10, ENVI &cSec=0%&cSec%
    IFEX $%&cMin% < 10, ENVI &cMin=0%&cMin%
    IFEX $%&cHour% < 10, ENVI &cHour=0%&cHour%
    ENVI @AppendDoneInfo=����ʱ�䣺%&cHour%:%&cMin%:%&cSec%
_END

_SUB StillCaptureWIM
    TEAM ENVI @AppendName.Enable=0|ENVI @Appendmiaos.Enable=0|ENVI @SelectIncrement.Enable=0|ENVI @SelectCapture.Enable=0 
    TEAM ENVI @SelectCompress.Enable=0|ENVI @WIMAppendSHUT.Enable=0|ENVI @WIMAppendRB.Enable=0|ENVI @AppendOK.Enable=0|ENVI @AppendCancel.Enable=0 
    ENVI &&CMPR=
    FIND $%SelectCompress%=����ѹ��,ENVI &CMPR=/compress fast
    FIND $%SelectCompress%=���ѹ��,ENVI &CMPR=/compress maximum
    FIND $%SelectCompress%=��ѹ��,ENVI &CMPR=/compress none
    TEAM ENVI &&iTIME=|ENVI &&T1=|ENVI &&T2=|ENVI &&T3=|ENVI &&T4=|ENVI &&T5=|ENVI &&T6=|ENVI &&T7=|ENVI &&OldWIMTime=
    IFEX %&pBLK%,
    {
        SITE ?-local ,&iTIME=FTIME,%&pBLK%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &OldWIMTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    SET &p=-1
    ENVI @AppendDoneInfo=����ʱ�䣺00:00:00
    ENVI @&AppendTimer=1000
    EXEC*  --cmd::2000:OnAppendMsg -exe:#201 &V=!IMAGEX.EXE /capture "%&PARTSEL2%" "%&pBLK%" "%AppendName%" "Appendmiaos" %&CMPR%
    ENVI @&AppendTimer=0
    TEAM ENVI &&NewWIMSize=0|ENVI &&NewWIMTime=|ENVI &&WIMFailure=0
    IFEX %&pBLK%,
    {
        SIZE &NewWIMSize=%&pBLK%
        SITE ?-local ,&iTIME=FTIME,%&pBLK%
        MSTR &T1,&T2,&T3,&T4,&T5,&T6,&T7=<1><2><3><4><5><6><7>%&iTIME%
        ENVI &NewWIMTime=%&T1%%&T2%%&T3%%&T4%%&T5%%&T6%%&T7%
    }
    FIND $%&NewWIMTime%=%&OldWIMTime%, ENVI &WIMFailure=1
    IFEX $%&NewWIMSize% = 0, ENVI &WIMFailure=1
    IFEX $%&WIMFailure% = 0, ENVI @AppendBar=100;���Ǳ��ݳɹ���! ENVI @AppendBar=100;���Ǳ���ʧ�ܣ�
    WAIT 3000
    FIND $%HideFolder.Check%=1, IFEX %&pMKDIR%, SITE %&pMKDIR%,+H
    IFEX $%WIMAppendSHUT.Check% = 1, ENVI &SHUTorREBOOT=1
    IFEX $%WIMAppendRB.Check% = 1, ENVI &SHUTorREBOOT=2
    ENVI @MHGHO2012.Visable=1
    KILL @MHGHO2012
    KILL \
_END

///-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_SUB Determinedversion
   TEAM ENVI &&Shuzhi=|ENVI &&iVer=
   HIVE 123,%&PARTSEL2%\Windows\System32\config\SOFTWARE
   REGI HKEY_LOCAL_MACHINE\123\Microsoft\Windows NT\CurrentVersion\ProductName,&iVer
   MSTR &Shuzhi=<2>%&iVer%
   HIVE 123
   IFEX %&PARTSEL2%\Windows\SysWOW64,ENVI &Systemdigits=amd64!ENVI &Systemdigits=x86
   IFEX %&PARTSEL2%\Windows\Panther\Unattend.xml,!
     {
       MDIR %&PARTSEL2%\Windows\Panther
       FIND $%&Shuzhi%=7,CALL WINDOWS7
       FIND $%&Shuzhi%=10,CALL WINDOWSyui10
       FIND $%&Shuzhi%=8,CALL WINDOWS8
       FIND $%&Shuzhi%=8.1,CALL WINDOWS8.1
     }   
_END

_SUB WINDOWS7
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<?xml version="1.0" encoding="utf-8"?>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<unattend xmlns="urn:schemas-microsoft-com:unattend">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<settings pass="oobeSystem">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="%&Systemdigits%" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<OOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipMachineOOBE>true</SkipMachineOOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</OOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<TimeZone>China Standand Time</TimeZone>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<AutoLogon>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Password>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Value>UABhAHMAcwB3AG8AcgBkAA==</Value>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<PlainText>false</PlainText>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</Password>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Username>Administrator</Username>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Enabled>true</Enabled> 
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</AutoLogon>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</component>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</settings>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</unattend>
_END

_SUB WINDOWS8
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<?xml version="1.0" encoding="utf-8"?>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<unattend xmlns="urn:schemas-microsoft-com:unattend">
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<settings pass="oobeSystem">
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="%&Systemdigits%" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<OOBE>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipMachineOOBE>true</SkipMachineOOBE>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipUserOOBE>false</SkipUserOOBE>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</OOBE>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<AutoLogon>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Username>Administrator</Username>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Enabled>true</Enabled>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<LogonCount>1</LogonCount>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</AutoLogon>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</component>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</settings>
   WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</unattend>   
_END


_SUB WINDOWS8.1
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<?xml version="1.0" encoding="utf-8"?>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<unattend xmlns="urn:schemas-microsoft-com:unattend">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<settings pass="oobeSystem">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="%&Systemdigits%" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<OOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipMachineOOBE>true</SkipMachineOOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipUserOOBE>false</SkipUserOOBE> 
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</OOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<UserAccounts>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<LocalAccounts>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<LocalAccount wcm:action="add">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Password>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Value>UABhAHMAcwB3AG8AcgBkAA==</Value>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<PlainText>false</PlainText>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</Password>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Group>Administrators</Group>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Name>MyPC</Name>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</LocalAccount>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</LocalAccounts>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</UserAccounts>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</component>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</settings>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</unattend>
_END

_SUB WINDOWSyui10
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<?xml version="1.0" encoding="utf-8"?>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<unattend xmlns="urn:schemas-microsoft-com:unattend">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<settings pass="oobeSystem">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<component name="Microsoft-Windows-Shell-Setup" processorArchitecture="%&Systemdigits%" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"> 
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<OOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipMachineOOBE>true</SkipMachineOOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<SkipUserOOBE>false</SkipUserOOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</OOBE>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<AutoLogon>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Username>Administrator</Username>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Enabled>true</Enabled>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<LogonCount>1</LogonCount>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</AutoLogon>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<LogonCommands>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<AsynchronousCommand wcm:action="add">
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<CommandLine>%WINDIR%\1.cmd</CommandLine>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Description>Active</Description>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,<Order>1</Order>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</AsynchronousCommand>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</LogonCommands> 
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</component> 
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</settings>
    WRIT "%&PARTSEL2%\Windows\Panther\Unattend.xml",$+0,</unattend>
_END
