!PECMD
#Code=936T950
ENVI^ ForceLocal=1
ENVI^ EnviMode=1
ENVI$ &NL=0d 0a
CALL $--qd --ret:&DPIAware Shcore.dll,SetProcessDpiAwareness,#2
FIND $%&DPIAware%=, CALL $--bool --qd --ret:&DPI_Aware user32.dll,SetProcessDPIAware
CALL $--qd --ret:&Gpixelsx user32.dll,GetDpiForSystem
IFEX #%&Gpixelsx%<1,
{*
	CALL $--qd --ret:&H USER32.dll,GetDC,#0
	CALL $--qd --ret:&Gpixelsx Gdi32.dll,GetDeviceCaps,#%&H%,#88
	CALL $--qd --ret:&T Kernel32.dll,CloseHandle,#%&H%
}
FIND $%&SYSCODEPAGE%=936, ENVI &SYSlanguage=936
FIND $%&SYSCODEPAGE%=950, ENVI &SYSlanguage=936
FIND $%&SYSCODEPAGE%=52936, ENVI &SYSlanguage=936
IFEX #%&SYSlanguage%=936,
{*
	ENVI &Dstop=桌面
	ENVI &CXJG=查询结果： 所有设备驱动程序已经安装。
	ENVI &anzwc=安装完成
	ENVI &anzwc2=二次扫描，安装完成
	ENVI &zanz=正在安装设备驱动程序，安装进度
	ENVI &DSPHL=安装结果：已忽略安装此设备驱动
	ENVI &Hardid=硬件ID
	ENVI &Yasbao=压缩包
	ENVI &Infos=INF文件
	ENVI &installfully=安装结果：设备驱动程序安装成功。
	ENVI &Theinstall=安装结果：未能成功安装设备驱动程序。
	ENVI &InstallNo=安装结果：找不到匹配的驱动。
	ENVI &Creatingindex=正在创建索引文件，请稍候
	ENVI &Indexi=索引已制作完成。
	ENVI &noindex=不需制作索引文件。
	ENVI &Allindex=所有索引文件已制作完毕。
	ENVI &ClassID=ClassID
	ENVI &driveFolder=选择驱动文件夹
}!
{*
	ENVI &Dstop=Desktop
	ENVI &CXJG=Query results： All device drivers have been installed。
	ENVI &anzwc=Installation progress
	ENVI &anzwc2=Secondary scanning，Installation progress
	ENVI &zanz=Installing device drivers，Installation progress
	ENVI &DSPHL=The installation of this device driver has been ignored
	ENVI &Hardid=Hardware ID
	ENVI &Yasbao=Package name
	ENVI &Infos=Inf path
	ENVI &installfully=Device driver installed successfully。
	ENVI &Theinstall=The device driver could not be successfully installed。
	ENVI &InstallNo=Installation results：No matching driver found。
	ENVI &Creatingindex=Creating index file，please wait
	ENVI &Indexi=Indexing completed。
	ENVI &noindex=There is no need to make index files。
	ENVI &Allindex=All index files have been created。
	ENVI &ClassID=ClassIDYW
	ENVI &driveFolder=Select drive folder
}
ENVI# &hid=*8 0
SET &::WM_LBUTTONDBLCLK=0x0203
SET &::WM_DROPFILES=0x0233
SET &::WM_MOUSEHOVER=0x02A1
SET &::WM_MOUSELEAVE=0x02A3
FDRV &Dri=%SystemRoot%
ENVI ?&Vere,3=PEBIT,%SystemRoot%\System32\ntoskrnl.exe
SITE ?,&VER=FVER,%SystemRoot%\System32\ntoskrnl.exe
FIND $%&Vere%=X64, KILL *%&__PID%
ENVI ?&re=ispe
FIND $%&re%=0,ENVI &zui=%&Dstop%! ENVI &zui=PE
IFEX #%&Gpixelsx%>96,
{*
	CALC &Hcd=(%&Gpixelsx% / 96 * 100 - 100) / 25 #0
	CALC &Tro=115 + %&Hcd% * 3 #0
}
IFEX #%&Gpixelsx%=96, ENVI &Hcd=0
CALC &FON=10 - %&Hcd%
FIND $%1=,
{
	IFEX #%&SYSlanguage%=936, CALL @DrvMGR! CALL @DrvMGRYW
}!
{*
	ENVI &Parameter=%~1
	FIND $%~2=,! TEAM MSTR -delims:, &GFolder,&Secret=<1><2>%~2
	FIND $%&GFolder%=, ENVI &MFolder=! ENVI &MFolder=%&GFolder%
	FIND $%2=-hide,TEAM ENVI &Winhide=%2| ENVI &MFolder=
	FIND $%3=-hide,ENVI &Winhide=%3
	CALL Manually
}
_SUB DrvMGR,W580H415,Drvindex   驱动安装工具      5.22.6.6    - 32Bit,KILL \ ,#1,0,,-scale:%&Tro%
	ENVI @this.Font=%&FON%
	ENVI @DrvMGR.Visible=1
	LABE -left -vcenter,L15T13W65H18,驱动文件夹
	EDIT -vcenter &DrvFolder,L80T13W463H20,%&Curdir%,,
	EDIT| &OutputShow,L15T38W545H225,直接将驱动压缩包路径拖拽到这里->，或手动选择路径。,,0x68
	ENVI @&OutputShow.ReadOnly=1
	LABE &InstTime,L15T335W120H20,安装耗时：,,
	LABE -left -vcenter &RecordTime,L120T335W60H15,%&IS%,,0x0000FF,
	CHEK -left -vcenter ExitS,L15T311W125H20,完成后退出,,
	CHEK -left -vcenter &SearchDisk,L200T290W240H20,搜索硬盘中的驱动,,
	CHEK -left -vcenter &SkipDevice,L200T315W240H20,忽略安装显卡驱动,,
	CHEK -left -vcenter &Indeks,L15T290W100H20,创建索引,CALL SIndex,
	GROU &Our,L5T0W563H267,
	GROU &Ouc,L5T283W563H71,
	GROU &Oud,L5T350W563H31,
	PBAR &ShowProgress,L15T269W530H17,-1,
	LABE -left -vcenter MSGShow,L15T358W230H20,Lightning  QQ群: 1067888280,,
	LABE -left -vcenter MSGSho,L230T358W440H20,当前系统 %&Dri% %&VER% %&Vere%  %&zui%,,
	ITEM HelpInfo,L490T358W50H20,帮助,CALL HelpMSG,,
	ITEM Toinstall,L450T302W100H38,执行,CALL Manually,
	ENVI @&RecordTime.Visible=0
	ENVI @&OutputShow.MSG=_%&WM_DROPFILES%::&wp,&lp, CALL GetDropFile %&wp% %&lp% &DrvFolder
	ENVI @&DrvFolder.MSG=_%&WM_DROPFILES%::&wp,&lp, CALL GetDropFile %&wp% %&lp% &DrvFolder
	ENVI @&DrvFolder.MSG=_%&WM_LBUTTONDBLCLK%: CALL CAPTURE_PATH &DrvFolder
	ENVI @&DrvFolder.MSG=%&WM_MOUSEHOVER%: CALL Mouse_In_TIPS &DrvFolder "输入需要安装驱动存放的文件夹，双击此处打开浏览对话框进行选择。"
	ENVI @&DrvFolder.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&SearchDisk.MSG=%&WM_MOUSEHOVER%: CALL Mouse_In_TIPS &SearchDisk "搜索本机硬盘离线系统下的驱动，匹配安装到当前系统。"
	ENVI @&SearchDisk.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&SkipDevice.MSG=%&WM_MOUSEHOVER%: CALL Mouse_In_TIPS &SkipDevice "勾选此项将跳过安装显卡设备。"
	ENVI @&SkipDevice.MSG=%&WM_MOUSELEAVE%: TIPS -
_END
_SUB DrvMGRYW,W580H415,Drvindex   Drive installation tool      5.22.6.6      - 32Bit,KILL \,#1,0
	ENVI @this.Font=%&FON%
	ENVI @DrvMGRYW.Visible=1
	LABE -left -vcenter ,L15T13W65H18,Drive folder
	EDIT -vcenter &DrvFolder,L80T13W463H20,%&Curdir%,,
	EDIT| &OutputShow,L15T38W545H225,Drag the drive package path here directly->，Or manually select the Path,,0x68
	ENVI @&OutputShow.ReadOnly=1
	LABE &InstTime,L15T335W120H20,Installation time：,,
	LABE -left -vcenter &RecordTime,L120T335W60H15,%&IS%,,0x0000FF,
	CHEK -left -vcenter ExitS,L15T311W125H20,Exit when finished,,
	CHEK -left -vcenter &SearchDisk,L200T290W240H20,Search for drives on your hard drive,,
	CHEK -left -vcenter &SkipDevice,L200T315W240H20,Ignore installing graphics driver,,
	CHEK -left -vcenter &Indeks,L15T290W100H20,Create index,CALL SIndex,
	GROU &Our,L5T0W563H267,
	GROU &Ouc,L5T283W563H71,
	GROU &Oud,L5T350W563H31,
	PBAR &ShowProgress,L15T269W530H17,-1,
	LABE -left -vcenter MSGShow,L15T358W230H20,Lightning  QQ Group: 1067888280,,
	LABE -left -vcenter MSGSho,L230T358W440H20,Current system %&Dri% %&VER% %&Vere%  %&zui%,,
	ITEM HelpInfo,L490T358W50H20,Help,CALL HelpMSGYW,,
	ITEM Toinstall,L450T302W100H38,Executed,CALL Manually,
	ENVI @&RecordTime.Visible=0
	ENVI @&OutputShow.MSG=_%&WM_DROPFILES%::&wp,&lp, CALL GetDropFile %&wp% %&lp% &DrvFolder
	ENVI @&DrvFolder.MSG=_%&WM_DROPFILES%::&wp,&lp, CALL GetDropFile %&wp% %&lp% &DrvFolder
	ENVI @&DrvFolder.MSG=_%&WM_LBUTTONDBLCLK%: CALL CAPTURE_PATH &DrvFolder
	ENVI @&DrvFolder.MSG=%&WM_MOUSEHOVER%: CALL Mouse_In_TIPS &DrvFolder "Enter the folder where the driver needs to be installed. Double click here to open the browse dialog box for selection。"
	ENVI @&DrvFolder.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&SearchDisk.MSG=%&WM_MOUSEHOVER%: CALL Mouse_In_TIPS &SearchDisk "Search the drive under the offline system of the local hard disk and install it to the current system。"
	ENVI @&SearchDisk.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&SkipDevice.MSG=%&WM_MOUSEHOVER%: CALL Mouse_In_TIPS &SkipDevice "Check this box to skip the installation of graphics card devices。"
	ENVI @&SkipDevice.MSG=%&WM_MOUSELEAVE%: TIPS -
_END
_SUB CAPTUREAR,L%&Right%T%&High%W520H132,,,,#-:,,
	FIND $%&Winhide%=-hide,! PBAR &ShowProgress,L15T13W400H15,,
	CHEK -left -vcenter ExitS,L15T285W100H20,完成后退出,,
	CHEK -left -vcenter &SearchDisk,L200T285W130H20,搜索硬盘中的驱动,,
	CHEK -left -vcenter &SkipDevice,L200T308W130H20,跳过安装显卡设备,,
	ENVI @&SkipDevice.Visible=0
	ENVI @&SearchDisk.Visible=0
	ENVI @ExitS.Visible=0
	ENVI &TEMAD=0
	FIND $%&Parameter%=-Audio, ENVI &TEMAD=1
	FIND $%&Parameter%=-Net, ENVI &TEMAD=1
	FIND $%&Parameter%=-Display, ENVI &TEMAD=1
	FIND $%&Parameter%=-Print, ENVI &TEMAD=1
	FIND $%&Parameter%=-b, ENVI &TEMAD=2
	FIND $%&Parameter%=-t, ENVI &TEMAD=2
	FIND $%&Parameter%=-h, ENVI &TEMAD=2
	FIND $%&Parameter%=-y, ENVI &TEMAD=2
	IFEX #%&TEMAD%=1,TIME -t:1 ExitTimer,1, CALL HWID_TEM
	IFEX #%&TEMAD%=2,TIME -t:1 ExitTimer,1, CALL SetupIn
	IFEX #[ %&TEMAD%<>1 & %&TEMAD%<>2 ], KILL \
_END
_SUB SIndex
	FIND $%&Indeks.Check%=1,
	{*
		ENVI @&SearchDisk.enable=0
		ENVI @&SkipDevice.enable=0
		ENVI @&OutputShow=
		IFEX #%&SYSlanguage%=936,
		{
			ENVI @&OutputShow=%&OutputShow%当前为创建索引模式，使用方法：%&NL%支持压缩包格式：7Z ZIP CAB RAR WIM ISO %&NL%默认为搜索当前目录下的驱动压缩包创建索引，索引保存到压缩包相同位置。%&NL%%&NL%制作指定驱动压缩包索引，直接将驱动压缩包路径拖拽到这里->, 或手动选择路径。
		}!
		{
			ENVI @&OutputShow=%&OutputShow%Index creation mode is currently，Usage Method：%&NL%Support compressed package format：7Z ZIP CAB RAR WIM ISO %&NL%The index is saved to the same location as the compressed package. By default, the index is created to search the drive compressed package in the current directory，The index is saved to the same location as the compressed package。%&NL%%&NL%Index the specified drive package，Drag the drive package path here directly->。Or manually select the path。
		}
	}!
	{*
		ENVI @&OutputShow=
		ENVI @&SearchDisk.enable=1
		ENVI @&SkipDevice.enable=1
	}
_END
_SUB CAPATH *
	FDRV &Dri=%SystemRoot%
	ENVI &FilterDrive=
	FDRV &AllDrive=*:
	FORX * %&AllDrive%,&Pan,
	{*
		IFEX %&Pan%\Windows\SysWOW64\ntdll.dll, EXIT -
		IFEX %&Pan%\Windows\System32\DriverStore\FileRepository\,! EXIT -
		FIND $%&Dri%=%&Pan%, EXIT -
		ENVI< &FilterDrive= %&Pan%
	}
	MSTR &RV=<1>%&FilterDrive%
	ENVI ?,&VEA=FVER,%&RV%\Windows\explorer.exe
	FORX * %&FilterDrive%,&FR,
	{*
		ENVI ?,&VE=FVER,%&FR%\Windows\explorer.exe
		IFEX $%&VE%>%&VEA%,
		{*
			SED *ni &FilterDrive=1:0,%&FR%,,%&FilterDrive%
			ENVI &FilterDrive=%&FR% %&FilterDrive%
		}
	}
	ENVI Filter=%&FilterDrive%
_END
_SUB CAPTURE_PATH
	BROW &REPATH,*,%&driveFolder%,
	FIND $%&REPATH%<>, ENVI @%1=%&REPATH%
_END
_SUB GetDropFile *
	ENVI ?&F1,&FS=DROPFILE,%1
	FIND $%3=&DrvFolder,
	{*
		IFEX $%&FS%\, TEAM ENVI @%3=%&FS%| EXIT _SUB
		ENVI @%3=%&FS%
	}
_END
_SUB UISet
	ENVI @&Indeks.enable=%1
	ENVI @ExitS.enable=%1
	ENVI @Toinstall.enable=%1
	ENVI @HelpInfo.enable=%1
	ENVI @&DrvFolder.enable=%1
	IFEX $%&Indeks.Check%=1,
	{*
		ENVI @&SearchDisk.enable=0
		ENVI @&SkipDevice.enable=0
	}!
	{*
		ENVI @&SearchDisk.enable=%1
		ENVI @&SkipDevice.enable=%1
	}
_END
_SUB Manually
	IFEX #%&SYSlanguage%=936,ENVI @DrvMGR.Visible=?&dot! ENVI @DrvMGRYW.Visible=?&dot
	IFEX #%&dot%=1,
	{*
		IFEX $%&Indeks.Check%=1,CALL MakeID! CALL SetupIn
	}!
	{*
		SCRN &Right,&High
		CALC #&Right=%&Right% - 440
		CALC #&High=%&High% - 90
		CALL @CAPTUREAR
	}
_END
_SUB SetupIn
	TEAM ENVI @&OutputShow=| ENVI @&RecordTime.Visible=1|ENVI @&RecordTime=| ENVI @&ShowProgress=| ENVI &::PB=0| ENVI &::AR=0| ENVI slsd=| ENVI &DispID=
	TEAM ENVI &HWIDS=| ENVI &DuplicateFile=| ENVI &IS=0| ENVI &HWIDR=| ENVI &::Jha=0| ENVI &::KS=0|ENVI KS=0| ENVI &7zipa=| ENVI &ISTR=0| ENVI &HIDINFO=
	FIND $%&Parameter%=-b,
	{*
		ENVI ExitS.Check=1
		FIND $%&MFolder%=, ENVI &DrvFolder=%&CurDir%! ENVI &DrvFolder=%&MFolder%
	}
	FIND $%&Parameter%=-t,
	{*
		ENVI ExitS.Check=1
		ENVI &SkipDevice.Check=1
		FIND $%&MFolder%=, ENVI &DrvFolder=%&CurDir%! ENVI &DrvFolder=%&MFolder%
	}
	FIND $%&Parameter%=-y, TEAM ENVI ExitS.Check=1| ENVI &SearchDisk.Check=1
	FIND $%&Parameter%=-h, TEAM ENVI ExitS.Check=1| ENVI &SearchDisk.Check=1| ENVI &SkipDevice.Check=1
	CALL UISet 0
	DEVI **disverify
	IFEX $%&SearchDisk.Check%=1,CALL CAPATH
	IFEX $%&SkipDevice.Check%=1, DEVI listdev:&DispID *listdev=c *DevID:"PCI\CC_0300""PCI\CC_0380""PCI\CC_0302" *inst
	TIME TiCount,100,CALL OnTimer
	CALL HWID_Export
	ENVI @TiCount=-del
	FIND $%&HWIDS%=, ENVI @&OutputShow=%&OutputShow%%&NL%%&CXJG%
	IFEX #%&dot%=1,! ENVI @&ShowProgress.Visible=0
	CALL UISet 1
	IFEX #%ExitS.Check%=1,TEAM ENVI @DrvMGRYW.Visible=0| ENVI @DrvMGR.Visible=0
	CALL WlanID
	DEVI  *rverify
	IFEX %SystemRoot%\Temp\Drvindex\,EXEC -hide CMD /C rd /s /q "%SystemRoot%\Temp\Drvindex"
	IFEX #%ExitS.Check%=1,KILL \
_END
_SUB HWID_Export
	STRL &Cousa=%&DrvFolder%
	IFEX #%&Cousa%=3, MSTR -delims:\ &DrvFolder=<1>%&DrvFolder%
	DEVI listdev:&BthID *listdev=c *DevID:"USB\Class_E0&SubClass_01&Prot_01" *inst
	DEVI listdev:&NetMSG *listdev=c *DevID:"PCI\CC_0200""PCI\CC_0280""USB\Class_FF" *inst
	DEVI *STATUS:&HWIDMSG
	FORX *NL &HWIDMSG,&lists,
	{*
		MSTR &HardwareID,&ErrorCode=<1><3>%&lists%
		MSTR -delims:" &FullID=<2>%&HardwareID%
		MSTR -delims:\ &SVSI,&Hardwaresid=<1><2>%&FullID%
		FIND $[ %&re%=0 & %&SVSI%=PCI ],
		{*
			SED *ni &iPOS=?,%&Hardwaresid%,,%&DispID%
			IFEX #%&iPOS%>1,
			{*
				REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Enum\%&FullID%\Driver,&Dversa
				REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\InfPath,&InfPt
				REGI --qk --init *$HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\IncludedInfs,&IncludedInfs
				FIND $%&InfPt%=display.inf, ENVI &InfPt=
				FIND $%&IncludedInfs%=basicdisplay.inf, ENVI &InfPt=
				FIND $%&InfPt%=, ENVI &ErrorCode=1
			}
		}
		FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1802000,
		{*
			REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%&FullID%\ClassGUID,&GUDrive
			FIND $%&GUDrive%=, ENVI &ErrorCode=1
		}
		FIND $%&SVSI%=USBPRINT,
		{*
			IFEX %SystemRoot%\System32\spoolsv.exe,
			{*
				REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%&FullID%\Driver,&Deinf
				MSTR -delims:\ &Deinf=<1>%&Deinf%
				FIND $%&Deinf%={4D36E979-E325-11CE-BFC1-08002BE10318},! ENVI &ErrorCode=1
			}
		}
		IFEX #%&ErrorCode%=1,! EXIT -
		ENVI< &HWIDS=%&FullID%%&NL%
		LPOS* &iPOS=&,2,%&Hardwaresid%
		CALC #&iPOS=%&iPOS% - 1
		MSTR &Hardware=0,%&iPOS%,%&Hardwaresid%
		SED *ni &iPOS=?,%&Hardware%,,%&NetMSG%
		ENVI &Networkid=0
		IFEX #%&iPOS%>0,
		{*
			IFEX %SystemRoot%\System32\NetSetupApi.dll,! ENVI &Networkid=1
			IFEX %SystemRoot%\System32\NetSetupSvc.dll,! ENVI &Networkid=1
			IFEX %SystemRoot%\System32\Netprofm.dll,! ENVI &Networkid=1
		}
		IFEX #%&Networkid%=1, EXIT -
		DEVI listdev:&CompatibleID *listdev=i *DevID:%&FullID%  *many *comp
		MSTR -delims:\ &CompatibleID=<-1>%&CompatibleID%
		FIND $%&SVSI%=USBPRINT,
		{*
			MSTR -delims:_ &Hardware,&CompatibleID=<1><2>%&Hardware%
			FIND $%&CompatibleID%=,ENVI &CompatibleID=4D36E979-
		}
		FIND $%&CompatibleID%=,ENVI &CompatibleID=%&Hardwaresid%
		ENVI &BthINT=
		SED *ni &iPOS=?,%&Hardware%,,%&BthID%
		IFEX #%&iPOS%>0,
		{*
			IFEX %SystemRoot%\System32\bthserv.dll,! ENVI &BthINT=1
			IFEX %SystemRoot%\system32\BthAvctpSvc.dll,! ENVI &BthINT=1
			IFEX %SystemRoot%\system32\BTAGService.dll,! ENVI &BthINT=1
		}
		IFEX #%&BthINT%=1,EXIT -
		CALC #&Jha=%&Jha% + 1
		CALC #PB= 100 / %&Jha%
		ENVI< &HIDINFO="%&SVSI%\%&Hardwaresid%" "%&Hardware%" "%&FullID%" "%&CompatibleID%"%&NL%
	}
	FORX *NL &HIDINFO,&QDINFO,
	{
		FIND  $%&QDINFO%=, EXIT -
		IFEX $%&SearchDisk.Check%=1,
		{
			THREAD*$  CALL DrvINST  %&QDINFO%
		}!
		{
			CALL ZIP_Export  %&QDINFO%
		}
	}
	WAIT -thread
	FIND $%&HWIDS%=,EXIT _SUB! ENVI @&ShowProgress=100;%&anzwc%：100%
	TEAM ENVI @&ShowProgress=| ENVI &::PB=0| ENVI &::AR=0|ENVI &Jha=0
	ENVI &HIDINFO=
	DEVI *rescan:2
	DEVI *STATUS:&HWIDMSG
	FORX *NL &HWIDMSG,&lists,
	{*
		MSTR &HardwareID,&ErrorCode=<1><3>%&lists%
		MSTR -delims:" &FullID=<2>%&HardwareID%
		MSTR -delims:\ &SVSI,&Hardwaresid=<1><2>%&FullID%
		FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1802000,
		{*
			REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%&FullID%\ClassGUID,&GUDrive
			FIND $%&GUDrive%=, ENVI &ErrorCode=1
		}
		FIND $%&SVSI%=USBPRINT,
		{*
			IFEX %SystemRoot%\System32\spoolsv.exe,
			{*
				REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%&FullID%\Driver,&Deinf
				MSTR -delims:\ &Deinf=<1>%&Deinf%
				FIND $%&Deinf%={4D36E979-E325-11CE-BFC1-08002BE10318},! ENVI &ErrorCode=1
			}
		}
		IFEX $%&ErrorCode%=1,! EXIT -
		LPOS* &iPOS=&,2,%&Hardwaresid%
		CALC #&iPOS=%&iPOS% - 1
		MSTR &Hardware=0,%&iPOS%,%&Hardwaresid%
		SED *ni &iPOS=?,%&Hardware%,,%&HWIDS%
		IFEX #%&iPOS%>0,EXIT -
		DEVI listdev:&CompatibleID *listdev=i *DevID:%&FullID%  *many *comp
		MSTR -delims:\ &CompatibleID=<-1>%&CompatibleID%
		SED *ni &iPOS=?,%&BthID%,,%&Hardwaresid%
		ENVI &BthINT=
		IFEX #%&iPOS%>0,
		{*
			IFEX %SystemRoot%\System32\bthserv.dll,! ENVI &BthINT=1
			IFEX %SystemRoot%\system32\BthAvctpSvc.dll,! ENVI &BthINT=1
			IFEX %SystemRoot%\system32\BTAGService.dll,! ENVI &BthINT=1
		}
		IFEX #%&BthINT%=1, EXIT -
		CALC #&Jha= %&Jha% + 1
		CALC #PB= 100 / %&Jha%
		ENVI< &HIDINFO="%&SVSI%\%&Hardwaresid%" "%&Hardware%" "%&FullID%" "%&CompatibleID%"%&NL%
	}
	FORX *NL &HIDINFO,&QDINFO,
	{
		FIND  $%&QDINFO%=, EXIT -
		IFEX $%&SearchDisk.Check%=1,
		{
			THREAD*$  CALL DrvINST  %&QDINFO%
		}!
		{
			CALL ZIP_Export  %&QDINFO%
		}
	}
	WAIT -thread
	FIND $%&HIDINFO%=,EXIT _SUB! ENVI @&ShowProgress=100;%&anzwc2%：100%
_END
_SUB HWID_TEM
	CALL UISet 0
	DEVI **disverify
	TEAM ENVI &HIDINFO=| ENVI @&ShowProgress=| ENVI &::PB=0| ENVI &::AR=0|ENVI &Jha=0| ENVI &DuplicateFile=| ENVI &7zipa=
	FIND $%&Parameter%=-Print,
	{*
		ENVI &CompatibleS=E979-E3
		DEVI listdev:&HWIDMSG *listdev=c *DevID:USB* *inst
	}
	FIND $%&Parameter%=-Display,
	{*
		ENVI &CompatibleS=E968-E3
		DEVI listdev:&HWIDMSG *listdev=c *DevID:"PCI\CC_0300""PCI\CC_0380""CC_0302" *inst
	}
	FIND $%&Parameter%=-Net,
	{*
		IFEX %SystemRoot%\System32\NetSetupApi.dll,! EXIT _SUB
		IFEX %SystemRoot%\System32\NetSetupSvc.dll,! EXIT _SUB
		IFEX %SystemRoot%\System32\Netprofm.dll,! EXIT _SUB
		ENVI &CompatibleS=E972-E3
		DEVI listdev:&HWIDMSG *listdev=c *DevID:"PCI\CC_0200""PCI\CC_0280""USB\Class_FF" *inst
	}
	FIND $%&Parameter%=-Audio,
	{*
		ENVI &CompatibleS=E96C-E3
		DEVI listdev:&HWIDMSG *listdev=c *DevID:"HDAUDIO\FUNC_01" *inst
	}
	FIND $%&MFolder%=, 
	{*
		CALL CAPATH
	}!
	{*
		ENVI &DrvFolder=%&MFolder%
		STRL &Cousa=%&DrvFolder%
		IFEX #%&Cousa%=3, MSTR -delims:\ &DrvFolder=<1>%&DrvFolder%
	}
	FORX *NL &HWIDMSG,&lists,
	{*
		DEVI *STATUS:&HWIDS:%&lists%
		MSTR &HardwareID,&ErrorCode=<1><3>%&HWIDS%
		MSTR -delims:" &FullID=<2>%&HardwareID%
		FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
		FIND $%&ErrorCode%=0x1802000,
		{*
			REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%&FullID%\ClassGUID,&GUDrive
			FIND $%&GUDrive%=, ENVI &ErrorCode=1
		}
		IFEX #%&ErrorCode%=1,! EXIT -
		MSTR -delims:\ &SVSI,&Hardwaresid=<1><2>%&FullID%
		LPOS* &iPOS=&,2,%&Hardwaresid%
		CALC #&iPOS=%&iPOS% - 1
		MSTR &Hardware=0,%&iPOS%,%&Hardwaresid%
		DEVI listdev:&CompatibleID *listdev=i *DevID:%&FullID%  *many *comp
		MSTR -delims:\ &CompatibleID=<-1>%&CompatibleID%
		CALC #&Jha=%&Jha% + 1
		CALC #PB= 100 / %&Jha%
		ENVI< &HIDINFO="%&SVSI%\%&Hardwaresid%" "%&Hardware%" "%&FullID%" "%&CompatibleID%" "%&CompatibleS%"%&NL%
	}
	FORX *NL &HIDINFO,&QDINFO,
	{
		FIND $%&QDINFO%=, EXIT -
		FIND $%&MFolder%=,
		{
			THREAD*$  CALL DrvINST %&QDINFO%
		}!
		{
			CALL ZIP_Export %&QDINFO%
		}
	}
	WAIT -thread
	ENVI @&ShowProgress=100;%&anzwc%：100%
	ENVI @&ShowProgress.Visible=0
	CALL WlanID
	DEVI  *rverify
	IFEX %SystemRoot%\Temp\Drvindex\,EXEC -hide CMD /C rd /s /q "%SystemRoot%\Temp\Drvindex"
	CALL UISet 1
	KILL \
_END
_SUB ZIP_Export
	ENVI &one=%~1
	ENVI &two=%~2
	ENVI &three=%~3
	ENVI &four=%~4
	ENVI &fouS=%~5
	CALC #kS= %kS% + 1
	ENVI @&ShowProgress=%kS%;%&zanz%：%kS%%
	FIND $%&7zipa%=,
	{
		MDIR %SystemRoot%\Temp\Drvindex\InfFiles
		EXEC -hide -wait --exe:#100 =7z.exe
		ENVI 7zipa=111
	}
	IFEX %&DrvFolder%\,
	{
		FIND $%&DuplicateFile%=,
		{
			FORX * 7Z ZIP CAB RAR WIM ISO,&Format,
			{*
				FORX /S %&DrvFolder%\*.%&Format%,&zipFile,,
				{*
					FDIR &FilePath=%&zipFile%
					NAME &OutputFilePath=%&zipFile%
					ENVI< DuplicateFile=%&OutputFilePath%
					IFEX %&FilePath%\%&OutputFilePath%.index,!
					{
						THREAD*$ CALL Zip_Files "%&zipFile%" "%&OutputFilePath%"
					}
				}
			}
			WAIT -thread
		}
	}!
	{
		FIND $%&DuplicateFile%=,
		{
			FORX %&DrvFolder%,&zipFile,,
			{*
				FDIR &FilePath=%&zipFile%
				NAME &OutputFilePath=%&zipFile%
				ENVI< DuplicateFile=%&OutputFilePath%
				IFEX %&FilePath%\%&OutputFilePath%.index,!
				{
					THREAD*$ CALL Zip_Files "%&zipFile%" "%&OutputFilePath%"
				}
			}
			WAIT -thread
		}
	}
	IFEX %&DrvFolder%\,
	{
		THREAD*$  CALL ZIPINST "%&one%" "%&two%" "%&three%" "%&four%" %&fouS%
	}!
	{
		THREAD*$  CALL 7ZINST "%&one%" "%&two%" "%&three%" "%&four%" %&fouS%
	}
_END
_SUB Zip_Files
	EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x %1 -p%&Secret% -y -r -o"%SystemRoot%\Temp\Drvindex\InfFiles\%~2" *.inf
_END
_SUB DrvINST
	MSTR -delims:\ &SUOID=<1>%~1
	ENVI &Baske=0
	ENVI &GetID=%~3
	ENVI &ComID=%~4
	STRL &Count=%&ComID%
	CALC #&Counts=%&Count%*2
	ENVI-tom &ComIDS=&ComID
	CALL KRDriver "%&ComID%"
	CALC #kS= %kS% + 1
	ENVI @&ShowProgress=%kS%;%&zanz%：%kS%%
	SED *ni &Astrs=?,%~2,,%&DispID%
	IFEX #%&Astrs%>0,
	{
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%NL%%&Hardid%：  %~1%&NL%%&DSPHL%。%&NL%
		TEAM CALC #AR= %PB% + %AR%| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
		EXIT _SUB
	}
	FIND $%~5=,CALL KRDriver "%&ComID%"! ENVI &identifier=%~5
	FIND $%&SUOID%=USBPRINT, TEAM ENVI &STNID=PECI| ENVI &identifier=E979-E3
	FORX * %&Filter%,&Driveletter,
	{*
		FORX /S %&Driveletter%\Windows\System32\DriverStore\FileRepository\*.inf,&InfPath,,
		{*
			WAIT 0.1
			GETF "%&InfPath%",0#2,&All
			FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#6000,&AllContent
			FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#6000,&AllContent
			FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#3000,&AllContent| ENVI-tow &AllContent=&AllContent
			SED *ni  &Astr=?,%&identifier%,,%&AllContent%
			IFEX #%&Astr%<1, EXIT -
			FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#600000,&AllContent
			FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#600000,&AllContent
			FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#300000,&AllContent| ENVI-tow &AllContent=&AllContent
			SED *ni &Astr=?,%~2,,%&AllContent%
			IFEX #%&Astr%<1, EXIT -
			FIND $%&SUOID%=USBPRINT,
			{
				DEVI *nocheck %&InfPath%,DefaultInstall,132
			}!
			{
				DEVI *update:'%~1:%&InfPath%'
			}
			DEVI *STATUS:&state:%~3
			MSTR &ErrorCode=<3>%&state%
			FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1802000,
			{*
				REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
				FIND $%&GUDrive%=, ENVI &ErrorCode=1
			}
			IFEX $%&ErrorCode%=1,
			{*
				CALL %&ClassID% "%&GetID%"
				NAME -ext &InfName=%&InfPath%
				ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Infos%： %&Driveletter%\*\%&InfName%%&Version%%&NL%%&Theinstall%%&NL%
				ENVI &Baske=1
			}!
			{
				CALL %&ClassID% "%&GetID%"
				NAME -ext &InfName=%&InfPath%
				ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Infos%： %&Driveletter%\*\%&InfName%%&Version%%&NL%%&installfully%%&NL%
				TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
				EXIT _SUB
			}
		}
	}
	FIND $%&Baske%=0,
	{
		FIND $%&STNID%<>PECI,
		{
			FORX * %&Filter%,&Driveletter,
			{*
				FORX /S %&Driveletter%\Windows\System32\DriverStore\FileRepository\*.inf,&InfPath,,
				{*
					WAIT 0.1
					GETF "%&InfPath%",0#2,&All
					FIND $'%&All%'='0xFE 0xFF',GETF -find "%&InfPath%",0#20000#%&Counts%##1,&Astr,*&ComID
					FIND $'%&All%'='0xFF 0xFE',GETF -find "%&InfPath%",0#20000#%&Counts%##1,&Astr,*&ComID
					FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],GETF -find "%&InfPath%",0#10000#%&Count%##1,&Astr,*&ComIDS
					IFEX #1>%&Astr%,EXIT -
					DEVI *update:'%~1:%&InfPath%'
					DEVI *STATUS:&state:%~3
					MSTR &ErrorCode=<3>%&state%
					FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
					FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
					FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
					FIND $%&ErrorCode%=0x1802000,
					{*
						REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
						FIND $%&GUDrive%=, ENVI &ErrorCode=1
					}
					IFEX $%&ErrorCode%=1,
					{*
						CALL %&ClassID% "%&GetID%"
						NAME -ext &InfName=%&InfPath%
						ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Infos%： %&Driveletter%\*\%&InfName%%&Version%%&NL%%&Theinstall%%&NL%
						ENVI &Baske=1
					}!
					{
						CALL %&ClassID% "%&GetID%"
						NAME -ext &InfName=%&InfPath%
						ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Infos%： %&Driveletter%\*\%&InfName%%&Version%%&NL%%&installfully%%&NL%
						TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
						EXIT _SUB
					}
				}
			}
		}
	}
	FIND $%&SUOID%=USBPRINT,
	{
		CALL %&ClassID% "%&GetID%"
		NAME -ext &InfName=%&InfPath%
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Infos%： %&Driveletter%\*\%&InfName%%&Version%%&NL%%&installfully%%&NL%
		TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
		EXIT _SUB
	}
	FIND $%&Baske%=0,
	{
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&InstallNo%%&NL%
	}
	TEAM CALC #AR= %PB% + %AR% -1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
_END
_SUB ZIPINST
	MSTR -delims:\ &SUOID=<1>%~1
	ENVI &Baske=0
	ENVI &SBaske=0
	ENVI &GetID=%~3
	ENVI &ComID=%~4
	STRL &Count=%&ComID%
	CALC #&Counts=%&Count%*2
	ENVI-tom &ComIDS=&ComID
	CALC #kS= %kS% + 1
	ENVI @&ShowProgress=%kS%;%&zanz%：%kS%%
	SED *ni &Astrs=?,%~2,,%&DispID%
	IFEX #%&Astrs%>1,
	{*
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%NL%%&Hardid%：  %~1%&NL%%&DSPHL%。%&NL%
		TEAM CALC #AR= %PB% + %AR%| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
		EXIT _SUB
	}
	FIND $%~5=,CALL KRDriver "%&ComID%"! ENVI &identifier=%~5
	FIND $%&SUOID%=USBPRINT, TEAM ENVI &STNID=PECI| ENVI &identifier=E979-E3
	FORX /S %&DrvFolder%\*.index,&IndexFile,,
	{
		GETF "%&IndexFile%",0#2,&All
		FIND $'%&All%'='0xFE 0xFF',GETF# "%&IndexFile%",1#*,&AllContent
		FIND $'%&All%'='0xFF 0xFE',GETF# "%&IndexFile%",2#*,&AllContent
		FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&IndexFile%",0#*,&AllContent| ENVI-tow &AllContent=&AllContent
		SED *ni &Astr=?,%~2,,%&AllContent%
		IFEX #1>%&Astr%,EXIT -
		FORX * 7Z ZIP CAB RAR WIM ISO,&Format,
		{*
			FDIR &FilePath=%&IndexFile%
			NAME &FileInfo=%&IndexFile%
			IFEX %&FilePath%\%&FileInfo%.%&Format%,! EXIT -
			FORX *NL &AllContent,&Single,
			{*
				WAIT 0.1
				SED *ni &Astr=?,%~2,,%&Single%
				IFEX #1>%&Astr%,EXIT -
				MSTR -delims:| &InfName=<1>%&Single%
				RPOS* &iPOS=\,1,%&InfName%
				MSTR &ExtractPath=0,%&iPOS%,%&InfName%
				IFEX #%&iPOS%=0,ENVI &ExtractPath=
				NAME -ext &InfsName=%&InfName%
				EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&FilePath%\%&FileInfo%.%&Format%" -p%&Secret% -y -o"%SystemRoot%\Temp\Drvindex" "%&ExtractPath%*"
				FIND $%&SUOID%=USBPRINT,
				{
					DEVI *nocheck %SystemRoot%\Temp\Drvindex\%&InfName%,DefaultInstall,132
				}!
				{
					DEVI *update:'%~1:%SystemRoot%\Temp\Drvindex\%&InfName%'
				}
				DEVI *STATUS:&state:%~3
				MSTR &ErrorCode=<3>%&state%
				FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
				FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
				FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
				FIND $%&ErrorCode%=0x1802000,
				{*
					REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
					FIND $%&GUDrive%=, ENVI &ErrorCode=1
				}
				IFEX $%&ErrorCode%=1,
				{*
					CALL %&ClassID% "%&GetID%"
					ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&FilePath%\%&FileInfo%.%&Format%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&Theinstall%%&NL%
					ENVI &SBaske=1
				}!
				{
					CALL %&ClassID% "%&GetID%"
					ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&FilePath%\%&FileInfo%.%&Format%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%
					TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
					EXIT _SUB
				}
			}
		}
	}
	FORX * 7Z ZIP CAB RAR WIM ISO,&Format,
	{
		FORX /S %&DrvFolder%\*.%&Format%,&zipFiles,,
		{*
			FDIR &FilePath=%&ZipFiles%
			NAME &FileInfo=%&ZipFiles%
			IFEX %&FilePath%\%&FileInfo%.index, EXIT -
			FORX /S %SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%\*.inf,&InfPath,,
			{*
				WAIT 0.1
				GETF "%&InfPath%",0#2,&All
				FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#6000,&AllContent
				FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#6000,&AllContent
				FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#3000,&AllContent| ENVI-tow &AllContent=&AllContent
				SED *ni &Astr=?,%&identifier%,,%&AllContent%
				IFEX #1>%&Astr%,EXIT -
				FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#600000,&AllContent
				FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#600000,&AllContent
				FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#300000,&AllContent| ENVI-tow &AllContent=&AllContent
				SED *ni &Astr=?,%~2,,%&AllContent%
				IFEX #1>%&Astr%,EXIT -
				STRL &iLEN="%SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%"
				MSTR &InfName=%&iLEN%,0,%&InfPath%
				RPOS* &iPOS=\,1,%&InfName%
				MSTR &ExtractPath=0,%&iPOS%,%&InfName%
				IFEX #%&iPOS%=0,ENVI &ExtractPath=
				NAME -ext &InfsName=%&InfName%
				EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&ZipFiles%" -p%&Secret% -y -o"%SystemRoot%\Temp\Drvindex" "%&ExtractPath%*"
				FIND $%&SUOID%=USBPRINT,
				{
					DEVI *nocheck %SystemRoot%\Temp\Drvindex\%&InfName%,DefaultInstall,132
				}!
				{
					DEVI *update:'%~1:%SystemRoot%\Temp\Drvindex\%&InfName%'
				}
				DEVI *STATUS:&state:%~3
				MSTR &ErrorCode=<3>%&state%
				FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
				FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
				FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
				FIND $%&ErrorCode%=0x1802000,
				{*
					REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
					FIND $%&GUDrive%=, ENVI &ErrorCode=1
				}
				IFEX $%&ErrorCode%=1,
				{*
					CALL %&ClassID% "%&GetID%"
					ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZipFiles%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&Theinstall%%&NL%
					ENVI &Baske=1
				}!
				{
					CALL %&ClassID% "%&GetID%"
					ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZipFiles%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%
					TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
					EXIT _SUB
				}
			}
		}
	}
	FIND $%&Baske%=0,
	{
		FIND $%&STNID%<>PECI,
		{
			FORX * 7Z ZIP CAB RAR WIM ISO,&Format,
			{
				FORX /S %&DrvFolder%\*.%&Format%,&ZipFiles,,
				{*
					NAME &FileInfo=%&ZipFiles%
					FDIR &FilePath=%&ZipFiles%
					IFEX %&FilePath%\%&FileInfo%.index,EXIT -
					FORX /S %SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%\*.inf,&InfPath,,
					{*
						WAIT 0.1
						GETF "%&InfPath%",0#2,&All
						FIND $'%&All%'='0xFE 0xFF',GETF -find "%&InfPath%",0#20000#%&Counts%##1,&Astr,*&ComID
						FIND $'%&All%'='0xFF 0xFE',GETF -find "%&InfPath%",0#20000#%&Counts%##1,&Astr,*&ComID
						FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],GETF -find "%&InfPath%",0#10000#%&Count%##1,&Astr,*&ComIDS
						IFEX #1>%&Astr%,EXIT -
						STRL &iLEN="%SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%"
						MSTR &InfName=%&iLEN%,0,%&InfPath%
						RPOS* &iPOS=\,1,%&InfName%
						MSTR &ExtractPath=0,%&iPOS%,%&InfName%
						IFEX #%&iPOS%=0,ENVI &ExtractPath=
						NAME -ext &InfsName=%&InfName%
						EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&ZipFiles%" -p%&Secret% -y -o"%SystemRoot%\Temp\Drvindex" "%&ExtractPath%*"
						DEVI *update:'%~1:%SystemRoot%\Temp\Drvindex\%&InfName%'
						DEVI *STATUS:&state:%~3
						MSTR &ErrorCode=<3>%&state%
						FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
						FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
						FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
						FIND $%&ErrorCode%=0x1802000,
						{*
							REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
							FIND $%&GUDrive%=, ENVI &ErrorCode=1
						}
						IFEX $%&ErrorCode%=1,
						{*
							CALL %&ClassID% "%&GetID%"
							ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZipFiles%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&Theinstall%%&NL%
							ENVI &Baske=1
						}!
						{*
							CALL %&ClassID% "%&GetID%"
							ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZipFiles%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%
							TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
							EXIT _SUB
						}
					}
				}
			}
		}
	}
	FIND $%&SUOID%=USBPRINT,
	{
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZipFiles%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%	
		TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
		EXIT _SUB
	}
	IFEX #[ %&Baske%=0 & %&SBaske%=0 ],
	{	
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&InstallNo%%&NL%
	}
	TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
_END
_SUB 7ZINST
	MSTR -delims:\ &SUOID=<1>%~1
	ENVI &identr=%~2
	ENVI &Baske=0
	ENVI &SBaske=0
	ENVI &GetID=%~3
	ENVI &ComID=%~4
	STRL &Count=%&ComID%
	CALC #&Counts=%&Count%*2
	ENVI-tom &ComIDS=&ComID
	CALC #kS= %kS% + 1
	ENVI @&ShowProgress=%kS%;%&zanz%：%kS%%
	SED *ni &Astrs=?,%~2,,%&DispID%
	IFEX #%&Astrs%>1,
	{*
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%NL%%&Hardid%：  %~1%&NL%%&DSPHL%。%&NL%
		TEAM CALC #AR= %PB% + %AR%| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
		EXIT _SUB
	}
	FIND $%~5=,CALL KRDriver "%&ComID%"! ENVI &identifier=%~5
	FIND $%&SUOID%=USBPRINT, TEAM ENVI &STNID=PECI| ENVI &identifier=E979-E3
	FORX %&DrvFolder%,&ZIPInfo,,
	{*
		FDIR &FilePath=%&ZIPInfo%
		NAME &FileInfo=%&ZIPInfo%
		IFEX %&FilePath%\%&FileInfo%.index,! EXIT -
		ENVI &IndexFile=%&FilePath%\%&FileInfo%.index
		GETF "%&IndexFile%",0#2,&All
		FIND $'%&All%'='0xFE 0xFF',GETF# "%&IndexFile%",1#*,&AllContent
		FIND $'%&All%'='0xFF 0xFE',GETF# "%&IndexFile%",2#*,&AllContent
		FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&IndexFile%",0#*,&AllContent| ENVI-tow &AllContent=&AllContent
		SED *ni &Astr=?,%~2,,%&AllContent%
		IFEX #1>%&Astr%,EXIT -
		FORX *NL &AllContent,&Single,
		{*
			WAIT 0.1
			SED *ni &Astr=?,%~2,,%&Single%
			IFEX #1>%&Astr%,EXIT -
			MSTR -delims:| &InfName=<1>%&Single%
			RPOS* &iPOS=\,1,%&InfName%
			MSTR &ExtractPath=0,%&iPOS%,%&InfName%
			IFEX #%&iPOS%=0,ENVI &ExtractPath=
			NAME -ext &InfsName=%&InfName%
			EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&ZIPInfo%" -p%&Secret% -y -o"%SystemRoot%\Temp\Drvindex" "%&ExtractPath%*"		
			FIND $%&SUOID%=USBPRINT,
			{
				DEVI *nocheck %SystemRoot%\Temp\Drvindex\%&InfName%,DefaultInstall,132
			}!
			{
				DEVI *update:'%~1:%SystemRoot%\Temp\Drvindex\%&InfName%'
				
			}
			DEVI *STATUS:&state:%~3
			MSTR &ErrorCode=<3>%&state%
			FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1802000,
			{*
				REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
				FIND $%&GUDrive%=, ENVI &ErrorCode=1
			}
			IFEX $%&ErrorCode%=1,
			{*
				CALL %&ClassID% "%&GetID%"
				ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZIPInfo%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&Theinstall%%&NL%
				ENVI &SBaske=1
			}!
			{
				CALL %&ClassID% "%&GetID%"
				ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZIPInfo%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%
				TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
				EXIT _SUB
			}
		}
	}
	FORX %&DrvFolder%,&ZIPInfo,,
	{*
		FDIR &FilePath=%&ZIPInfo%
		NAME &FileInfo=%&ZIPInfo%
		IFEX %&FilePath%\%&FileInfo%.index,EXIT -
		FORX /S %SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%\*.inf,&InfPath,,
		{*
			WAIT 0.1
			GETF "%&InfPath%",0#2,&All
			FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#6000,&AllContent
			FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#6000,&AllContent
			FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#3000,&AllContent| ENVI-tow &AllContent=&AllContent
			SED *ni &Astr=?,%&identifier%,,%&AllContent%
			IFEX #1>%&Astr%,EXIT -
			FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#600000,&AllContent
			FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#600000,&AllContent
			FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#300000,&AllContent| ENVI-tow &AllContent=&AllContent
			SED *ni &Astr=?,%~2,,%&AllContent%
			IFEX #1>%&Astr%,EXIT -
			STRL &iLEN="%SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%"
			MSTR &InfName=%&iLEN%,0,%&InfPath%
			RPOS* &iPOS=\,1,%&InfName%
			MSTR &ExtractPath=0,%&iPOS%,%&InfName%
			IFEX #%&iPOS%=0,ENVI &ExtractPath=
			NAME -ext &InfsName=%&InfName%
			EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&ZIPInfo%" -p%&Secret% -y -o"%SystemRoot%\Temp\Drvindex" "%&ExtractPath%*"
			FIND $%&SUOID%=USBPRINT,
			{
				DEVI *nocheck %SystemRoot%\Temp\Drvindex\%&InfName%,DefaultInstall,132
			}!
			{
				DEVI *update:'%~1:%SystemRoot%\Temp\Drvindex\%&InfName%'
			}
			DEVI *STATUS:&state:%~3
			MSTR &ErrorCode=<3>%&state%
			FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
			FIND $%&ErrorCode%=0x1802000,
			{*
				REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
				FIND $%&GUDrive%=, ENVI &ErrorCode=1
			}
			IFEX $%&ErrorCode%=1,
			{*
				CALL %&ClassID% "%&GetID%"
				ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZIPInfo%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&Theinstall%%&NL%
				ENVI &Baske=1
			}!
			{
				CALL %&ClassID% "%&GetID%"
				ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZIPInfo%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%
				TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
				EXIT _SUB
			}
		}
	}
	FIND $%&Baske%=0,
	{
		FIND $%&STNID%<>PECI,
		{
			FORX %&DrvFolder%,&ZIPInfo,,
			{*
				FDIR &FilePath=%&ZIPInfo%
				NAME &FileInfo=%&ZIPInfo%
				IFEX %&FilePath%\%&FileInfo%.index,EXIT -
				FORX /S %SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%\*.inf,&InfPath,,
				{*
					WAIT 0.1
					GETF "%&InfPath%",0#2,&All
					FIND $'%&All%'='0xFE 0xFF',GETF -find "%&InfPath%",0#20000#%&Counts%##1,&Astr,*&ComID
					FIND $'%&All%'='0xFF 0xFE',GETF -find "%&InfPath%",0#20000#%&Counts%##1,&Astr,*&ComID
					FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],GETF -find "%&InfPath%",0#10000#%&Count%##1,&Astr,*&ComIDS
					IFEX #1>%&Astr%,EXIT -
					STRL &iLEN="%SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%"
					MSTR &InfName=%&iLEN%,0,%&InfPath%
					RPOS* &iPOS=\,1,%&InfName%
					MSTR &ExtractPath=0,%&iPOS%,%&InfName%
					IFEX #%&iPOS%=0,ENVI &ExtractPath=
					NAME -ext &InfsName=%&InfName%
					EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&ZIPInfo%" -p%&Secret% -y -o"%SystemRoot%\Temp\Drvindex" "%&ExtractPath%*"
					DEVI *update:'%~1:%SystemRoot%\Temp\Drvindex\%&InfName%'
					DEVI *STATUS:&state:%~3
					MSTR &ErrorCode=<3>%&state%
					FIND $%&ErrorCode%=0x1806000, ENVI &ErrorCode=1
					FIND $%&ErrorCode%=0x1802400, ENVI &ErrorCode=1
					FIND $%&ErrorCode%=0x1806400, ENVI &ErrorCode=1
					FIND $%&ErrorCode%=0x1802000,
					{*
						REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~3\ClassGUID,&GUDrive
						FIND $%&GUDrive%=, ENVI &ErrorCode=1
					}
					IFEX $%&ErrorCode%=1,
					{*
						CALL %&ClassID% "%&GetID%"
						ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZIPInfo%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&Theinstall%%&NL%
						ENVI &Baske=1
					}!
					{*
						CALL %&ClassID% "%&GetID%"
						ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZIPInfo%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%
						TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
						EXIT _SUB
					}
				}
			}
		}
	}
	FIND $%&SUOID%=USBPRINT,
	{
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&Yasbao%：  %&ZipFiles%%&NL%%&Infos%： %&InfsName%%&Version%%&NL%%&installfully%%&NL%	
		TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
		EXIT _SUB
	}
	IFEX #[ %&Baske%=0 & %&SBaske%=0 ],
	{	
		CALL %&ClassID% "%&GetID%"
		ENVI @&OutputShow=%&OutputShow%%&NL%%&DeviceID%: %&DeviceName%%&NL%%&Hardid%：  %~1%&NL%%&InstallNo%%&NL%
	}
	TEAM CALC #AR= %PB% + %AR% - 1| ENVI @&ShowProgress=%AR%;%&zanz%：%AR%%
_END
_SUB KRDriver *
	ENVI &STNID=
	FIND $%~1=FUNC_01,TEAM ENVI &identifier=E96C-E3| EXIT _SUB
	FIND $%~1=CC_0300,TEAM ENVI &identifier=E968-E3| EXIT _SUB
	FIND $%~1=CC_0302,TEAM ENVI &identifier=E968-E3| EXIT _SUB
	FIND $%~1=CC_0380,TEAM ENVI &identifier=E968-E3| EXIT _SUB
	FIND $%~1=CC_0200,TEAM ENVI &identifier=E972-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0280,TEAM ENVI &identifier=E972-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0403,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0780,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0880,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0108,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_1180,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0500,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0580,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0600,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0601,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0604,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0C03,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0C05,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	FIND $%~1=CC_0C80,TEAM ENVI &identifier=E97D-E3| ENVI &STNID=PECI| EXIT _SUB
	ENVI &identifier=C
	ENVI &STNID=PECI
	EXIT _SUB
_END
_SUB ClassID *
	ENVI &DeviceID=
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~1\DeviceDesc,&Equi
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~1\ClassGUID,&DriveGUID
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~1\Driver,&der
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Control\Class\%&der%\DriverVersion,&DVer
	FIND $%&DVer%=,! ENVI &Version=    版本：%&DVer%
	MSTR -delims:; &DeviceName=<2>%&Equi%
	FIND $%&DeviceName%=,ENVI &DeviceName=%&Equi%
	FIND $%&DeviceName%=,ENVI &DeviceName=未知设备
	FIND $%&DriveGUID%=,TEAM ENVI &DeviceID=其他设备| EXIT _SUB
	FIND $%&DriveGUID%={4d36e972-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=网络适配器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e973-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=网络客户端| EXIT _SUB
	FIND $%&DriveGUID%={eec5ad98-8080-425f-922a-dabf3de3f69a},TEAM ENVI &DeviceID=便携设备| EXIT _SUB
	FIND $%&DriveGUID%={71a27cdd-812a-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=存储卷| EXIT _SUB
	FIND $%&DriveGUID%={4D36E97D-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=系统设备| EXIT _SUB
	FIND $%&DriveGUID%={88BAE032-5A81-49f0-BC3D-A4FF138216D6},TEAM ENVI &DeviceID=USB设备| EXIT _SUB
	FIND $%&DriveGUID%={e0cbf06c-cd8b-4647-bb8a-263b43f0f974},TEAM ENVI &DeviceID=蓝牙设备| EXIT _SUB
	FIND $%&DriveGUID%={4d36e967-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=磁盘驱动器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e968-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=显示适配器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96e-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=监视器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96f-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=鼠标| EXIT _SUB
	FIND $%&DriveGUID%={4d36e964-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=适配器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97e-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=其他设备| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97b-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=存储控制器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96c-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=声音、视频和游戏控制器| EXIT _SUB
	FIND $%&DriveGUID%={50906cb8-ba12-11d1-bf5d-0000f805f530},TEAM ENVI &DeviceID=多端口串行适配器| EXIT _SUB
	FIND $%&DriveGUID%={d45b1c18-c8fa-11d1-9f77-0000f805f530},TEAM ENVI &DeviceID=APM| EXIT _SUB
	FIND $%&DriveGUID%={4d36e966-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=计算机| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc2-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=解码器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e976-e325-11ce-bfc1-08002be10318,TEAM ENVI &DeviceID=无驱动程序| EXIT _SUB
	FIND $%&DriveGUID%={8ecc055d-047f-11d1-a537-0000f8753ed1},TEAM ENVI &DeviceID=非即插即用驱动程序| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97a-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=打印机| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97c-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=声音| EXIT _SUB
	FIND $%&DriveGUID%={533c5b84-ec70-11d2-9505-00c04F79deaf},TEAM ENVI &DeviceID=存储卷快照| EXIT _SUB
	FIND $%&DriveGUID%={36fc9e60-c465-11cf-8056-444553540000},TEAM ENVI &DeviceID=通用串行总线控制器| EXIT _SUB
	FIND $%&DriveGUID%={72631e54-78a4-11d0-bcf7-00aa00b7b32a},TEAM ENVI &DeviceID=电池设备| EXIT _SUB
	FIND $%&DriveGUID%={c06ff265-ae09-48f0-812c-16753d7cba83},TEAM ENVI &DeviceID=音频/视频控制器设备| EXIT _SUB
	FIND $%&DriveGUID%={53D29EF7-377C-4D14-864B-EB3A85769359},TEAM ENVI &DeviceID=生物识别设备| EXIT _SUB
	FIND $%&DriveGUID%={ca3e7ab9-b4c3-4ae6-8251-579ef933890f},TEAM ENVI &DeviceID=相机设备| EXIT _SUB
	FIND $%&DriveGUID%={4d36e965-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=CD-ROM驱动器| EXIT _SUB
	FIND $%&DriveGUID%={e2f84ce7-8efa-411c-aa69-97454ca4cb57},TEAM ENVI &DeviceID=扩展| EXIT _SUB
	FIND $%&DriveGUID%={4d36e969-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=软盘驱动器控制器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e980-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=软盘驱动器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96a-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=硬盘控制器| EXIT _SUB
	FIND $%&DriveGUID%={745a17a0-74d3-11d0-b6fe-00a0c90f57da},TEAM ENVI &DeviceID=人体学输入设备| EXIT _SUB
	FIND $%&DriveGUID%={66f250d6-7801-4a64-b139-eea80a450b24},TEAM ENVI &DeviceID=IEEE 1394内核调试器| EXIT _SUB
	FIND $%&DriveGUID%={c459df55-db08-11d1-b009-00a0c9081ff6},TEAM ENVI &DeviceID=IEEE 1394 IP网络枚举器| EXIT _SUB
	FIND $%&DriveGUID%={48721b56-6795-11d2-b1a8-0080c72e74a2},TEAM ENVI &DeviceID=IEEE 1284.4 设备| EXIT _SUB
	FIND $%&DriveGUID%={49ce6ac8-6f86-11d2-b1e5-0080c72e74a2},TEAM ENVI &DeviceID=IEEE 1284.4 兼容打印机| EXIT _SUB
	FIND $%&DriveGUID%={7ebefbc0-3200-11d2-b4c2-00a0C9697d07},TEAM ENVI &DeviceID=IEEE 1394设备| EXIT _SUB
	FIND $%&DriveGUID%={d48179be-ec20-11d1-b6b8-00c04fa372a7},TEAM ENVI &DeviceID=支持SBP2协议| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc1-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=IEEE 1394 控制器| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc6-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=图像设备| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc5-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=IrDA设备| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96b-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=键盘| EXIT _SUB
	FIND $%&DriveGUID%={ce5939ae-ebde-11D0-b181-0000f8753ec4},TEAM ENVI &DeviceID=介质更换| EXIT _SUB
	FIND $%&DriveGUID%={4d36e970-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=内存技术驱动程序| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96d-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=调制解调器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e971-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=多功能设备| EXIT _SUB
	FIND $%&DriveGUID%={4d36e974-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=网络服务| EXIT _SUB
	FIND $%&DriveGUID%={4d36e975-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=网络传输| EXIT _SUB
	FIND $%&DriveGUID%={268c95a1-edfe-11d3-95c3-0010dc4050a5},TEAM ENVI &DeviceID=PCI SSL加速器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e977-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=PCMCIA适配器| EXIT _SUB
	FIND $%&DriveGUID%={4d36e978-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=端口（COM和LPT端口)| EXIT _SUB
	FIND $%&DriveGUID%={4d36e979-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=打印机| EXIT _SUB
	FIND $%&DriveGUID%={4658ee7e-f050-11d1-b6bd-00c04fa372a7},TEAM ENVI &DeviceID=打印机| EXIT _SUB
	FIND $%&DriveGUID%={50127dc3-0f36-415e-a6cc-4cb3be910b65},TEAM ENVI &DeviceID=处理器| EXIT _SUB
	FIND $%&DriveGUID%={d94ee5d8-d189-4994-83d2-f68d7d41b0e6},TEAM ENVI &DeviceID=安全设备类| EXIT _SUB
	FIND $%&DriveGUID%={5175d334-c371-4806-b3ba-71fd53c9258d},TEAM ENVI &DeviceID=传感器| EXIT _SUB
	FIND $%&DriveGUID%={50dd5230-ba8a-11d1-bf5d-0000f805f530},TEAM ENVI &DeviceID=智能卡读取器| EXIT _SUB
	FIND $%&DriveGUID%={5c4c3332-344d-483c-8739-259e934c9cc8},TEAM ENVI &DeviceID=软件组件| EXIT _SUB
	FIND $%&DriveGUID%={25dbce51-6c8f-4a72-8a6d-b54c2b4fc835},TEAM ENVI &DeviceID=CE USB ActiveSync设备| EXIT _SUB
	FIND $%&DriveGUID%={6d807884-7d21-11cf-801c-08002be10318},TEAM ENVI &DeviceID=磁带驱动器| EXIT _SUB
_END
_SUB ClassIDYW *
	ENVI &DeviceID=
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~1\DeviceDesc,&Equi
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~1\ClassGUID,&DriveGUID
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Enum\%~1\Driver,&der
	REGI --qk --init $HKLM\SYSTEM\ControlSet001\Control\Class\%&der%\DriverVersion,&DVer
	FIND $%&DVer%=,! ENVI &Version=   Version：%&DVer%
	MSTR -delims:; &DeviceName=<2>%&Equi%
	FIND $%&DeviceName%=,ENVI &DeviceName=%&Equi%
	FIND $%&DeviceName%=,ENVI &DeviceName=unknown device
	FIND $%&DriveGUID%=,TEAM ENVI &DeviceID=Other equipment| EXIT _SUB
	FIND $%&DriveGUID%={4d36e972-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Network adapter| EXIT _SUB
	FIND $%&DriveGUID%={4d36e973-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Network client| EXIT _SUB
	FIND $%&DriveGUID%={eec5ad98-8080-425f-922a-dabf3de3f69a},TEAM ENVI &DeviceID=Portable device| EXIT _SUB
	FIND $%&DriveGUID%={71a27cdd-812a-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=Storage volume| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97d-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=System device| EXIT _SUB
	FIND $%&DriveGUID%={88BAE032-5A81-49f0-BC3D-A4FF138216D6},TEAM ENVI &DeviceID=USB device| EXIT _SUB
	FIND $%&DriveGUID%={e0cbf06c-cd8b-4647-bb8a-263b43f0f974},TEAM ENVI &DeviceID=Bluetooth device| EXIT _SUB
	FIND $%&DriveGUID%={4d36e967-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Disc drive| EXIT _SUB
	FIND $%&DriveGUID%={4d36e968-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Display adapter| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96e-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Monitor| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96f-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Mouse| EXIT _SUB
	FIND $%&DriveGUID%={4d36e964-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Adapter| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97e-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Other equipment| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97b-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Storage controller| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96c-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Sound, video and game controllers| EXIT _SUB
	FIND $%&DriveGUID%={50906cb8-ba12-11d1-bf5d-0000f805f530},TEAM ENVI &DeviceID=Multi port serial adapter| EXIT _SUB
	FIND $%&DriveGUID%={d45b1c18-c8fa-11d1-9f77-0000f805f530},TEAM ENVI &DeviceID=APM| EXIT _SUB
	FIND $%&DriveGUID%={4d36e966-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Computer| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc2-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=Decoder| EXIT _SUB
	FIND $%&DriveGUID%={4d36e976-e325-11ce-bfc1-08002be10318,TEAM ENVI &DeviceID=No driver| EXIT _SUB
	FIND $%&DriveGUID%={8ecc055d-047f-11d1-a537-0000f8753ed1},TEAM ENVI &DeviceID=Non plug and play driver| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97a-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Printer| EXIT _SUB
	FIND $%&DriveGUID%={4d36e97c-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Sound| EXIT _SUB
	FIND $%&DriveGUID%={533c5b84-ec70-11d2-9505-00c04F79deaf},TEAM ENVI &DeviceID=Storage volume snapshot| EXIT _SUB
	FIND $%&DriveGUID%={36fc9e60-c465-11cf-8056-444553540000},TEAM ENVI &DeviceID=Universal serial bus controller| EXIT _SUB
	FIND $%&DriveGUID%={72631e54-78a4-11d0-bcf7-00aa00b7b32a},TEAM ENVI &DeviceID=Battery equipment| EXIT _SUB
	FIND $%&DriveGUID%={c06ff265-ae09-48f0-812c-16753d7cba83},TEAM ENVI &DeviceID=Audio / video controller equipment| EXIT _SUB
	FIND $%&DriveGUID%={53D29EF7-377C-4D14-864B-EB3A85769359},TEAM ENVI &DeviceID=Biometric equipment| EXIT _SUB
	FIND $%&DriveGUID%={ca3e7ab9-b4c3-4ae6-8251-579ef933890f},TEAM ENVI &DeviceID=Camera equipment| EXIT _SUB
	FIND $%&DriveGUID%={4d36e965-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=CD-ROM Drive| EXIT _SUB
	FIND $%&DriveGUID%={e2f84ce7-8efa-411c-aa69-97454ca4cb57},TEAM ENVI &DeviceID=Extend| EXIT _SUB
	FIND $%&DriveGUID%={4d36e969-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Floppy drive controller| EXIT _SUB
	FIND $%&DriveGUID%={4d36e980-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Floppy disk driver| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96a-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Hard disk controller| EXIT _SUB
	FIND $%&DriveGUID%={745a17a0-74d3-11d0-b6fe-00a0c90f57da},TEAM ENVI &DeviceID=Ergonomic input device| EXIT _SUB
	FIND $%&DriveGUID%={66f250d6-7801-4a64-b139-eea80a450b24},TEAM ENVI &DeviceID=IEEE 1394 kernel debugger| EXIT _SUB
	FIND $%&DriveGUID%={c459df55-db08-11d1-b009-00a0c9081ff6},TEAM ENVI &DeviceID=IEEE 1394 IP network enumerator| EXIT _SUB
	FIND $%&DriveGUID%={48721b56-6795-11d2-b1a8-0080c72e74a2},TEAM ENVI &DeviceID=IEEE 1284.4 Equipment| EXIT _SUB
	FIND $%&DriveGUID%={49ce6ac8-6f86-11d2-b1e5-0080c72e74a2},TEAM ENVI &DeviceID=IEEE 1284.4 Compatible Printer| EXIT _SUB
	FIND $%&DriveGUID%={7ebefbc0-3200-11d2-b4c2-00a0C9697d07},TEAM ENVI &DeviceID=IEEE 1394 Equipment| EXIT _SUB
	FIND $%&DriveGUID%={d48179be-ec20-11d1-b6b8-00c04fa372a7},TEAM ENVI &DeviceID=Support SBP2 protocol| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc1-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=IEEE 1394 controller| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc6-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=Image equipment| EXIT _SUB
	FIND $%&DriveGUID%={6bdd1fc5-810f-11d0-bec7-08002be2092f},TEAM ENVI &DeviceID=IrDA equipment| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96b-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Keyboard| EXIT _SUB
	FIND $%&DriveGUID%={ce5939ae-ebde-11D0-b181-0000f8753ec4},TEAM ENVI &DeviceID=Media replacement| EXIT _SUB
	FIND $%&DriveGUID%={4d36e970-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Memory Technology Driver| EXIT _SUB
	FIND $%&DriveGUID%={4d36e96d-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Modem| EXIT _SUB
	FIND $%&DriveGUID%={4d36e971-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Multifunctional equipment| EXIT _SUB
	FIND $%&DriveGUID%={4d36e974-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Network service| EXIT _SUB
	FIND $%&DriveGUID%={4d36e975-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Network transmission| EXIT _SUB
	FIND $%&DriveGUID%={268c95a1-edfe-11d3-95c3-0010dc4050a5},TEAM ENVI &DeviceID=PCI SSLaccelerator| EXIT _SUB
	FIND $%&DriveGUID%={4d36e977-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=PCMCIAAdapter| EXIT _SUB
	FIND $%&DriveGUID%={4d36e978-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Ports (COM and LPT ports)| EXIT _SUB
	FIND $%&DriveGUID%={4d36e979-e325-11ce-bfc1-08002be10318},TEAM ENVI &DeviceID=Printer| EXIT _SUB
	FIND $%&DriveGUID%={4658ee7e-f050-11d1-b6bd-00c04fa372a7},TEAM ENVI &DeviceID=Printer| EXIT _SUB
	FIND $%&DriveGUID%={50127dc3-0f36-415e-a6cc-4cb3be910b65},TEAM ENVI &DeviceID=processor| EXIT _SUB
	FIND $%&DriveGUID%={d94ee5d8-d189-4994-83d2-f68d7d41b0e6},TEAM ENVI &DeviceID=Safety equipment| EXIT _SUB
	FIND $%&DriveGUID%={5175d334-c371-4806-b3ba-71fd53c9258d},TEAM ENVI &DeviceID=Sensor| EXIT _SUB
	FIND $%&DriveGUID%={50dd5230-ba8a-11d1-bf5d-0000f805f530},TEAM ENVI &DeviceID=Smart card reader| EXIT _SUB
	FIND $%&DriveGUID%={5c4c3332-344d-483c-8739-259e934c9cc8},TEAM ENVI &DeviceID=Software components| EXIT _SUB
	FIND $%&DriveGUID%={25dbce51-6c8f-4a72-8a6d-b54c2b4fc835},TEAM ENVI &DeviceID=CE USB ActiveSync Equipment| EXIT _SUB
	FIND $%&DriveGUID%={6d807884-7d21-11cf-801c-08002be10318},TEAM ENVI &DeviceID=Tape drive| EXIT _SUB
_END
_SUB WiphlpID
	ENVI-ret %~1=
	FORX * 1 2 3 4 5 6 7,&Prec,
	{*
		ENVI &Wlanss=0
		IFEX %SystemRoot%\System32\iphlpapi.dll,! EXIT _SUB
		ENVI$ &Netlssa=*0
		ENVI$ &Las=0
		CALL $--qd --ret:&Rt iphlpapi.dll,GetAdaptersInfo,*&Netlssa,*&Las
		ENVI?short &Las=&Lsn
		ENVI$ &Netlssa=*%&Lsn%
		CALL $--qd --ret:&Rt iphlpapi.dll,GetAdaptersInfo,*&Netlssa,*&Las
		ENVI &Xs=0
		LOOP #%&Lsn%>0,
		{*
			CALC #&ina=%&Xs% * 640 + 432
			IFEX #%&ina%>%&Lsn%,EXIT  LOOP
			CALC #&Xs=%&Xs% + 1
			ENVI-make &IPV=&Netlssa@%&ina%
			ENVI?char &Netlssa=&NetTay:(%&ina%-16)
			ENVI-tow &IPV=&IPV
			IFEX #%&NetTay%=71,
			{*
				IFEX #%&IPV%=0,
				{*
					ENVI-ret %~1=Wlan
					EXIT _SUB
				}!
				{*
					CALC #&Wlanss=%&Wlanss% + 1
				}
			}
		}
		IFEX #%&Wlanss%>=%~2,EXIT _SUB! WAIT 300
	}
	ENVI-ret %~1=Wlan
_END
_SUB WlanID
	FIND $%&exPath%=, EXIT _SUB
	DEVI listdev:&HWIc *devclass:Net *listdev=c *DevID:"PCI\CC_0280""USB\Class_FF" *inst
	FIND $%&HWIc%=, EXIT _SUB
	MSTR &HWIc=<#>%&HWIc%
	CALL WiphlpID &HWIDnet "%&HWIc%"
	FIND $%&HWIDnet%=, EXIT _SUB
	WAIT 300
	FORX %&Curdir%\Custom\*.ini,&My,,LOAD  "%&My%"
	FORX %&CurDir%\WirelessKey*.exe,&exPath,1,ENVI &exPath=%&exPath%
	RAND &CurRa
	MDIR %SystemRoot%\Temp\Drvindex\%&CurRa%
	FDRV &Dsr=%SystemRoot%
	FORX @\ProgramData\Microsoft\Wlansvc\Profiles,&Packa,,
	{*
		FIND $%&exPath%=, EXIT FORX
		FDRV &Tas=%&Packa%
		FIND $%&Tas%=%&Dsr%, EXIT -
		EXEC -hide -wait "%&exPath%" /LoadFrom 2 /ExternalWinDir "%&Tas%\Windows" /WlansvcFolder "%&Packa%" /export "%SystemRoot%\Temp\Drvindex\%&CurRa%\Wsy.txt"
		EXEC -hide -wait "%&exPath%" /LoadFrom 2 /ExternalWinDir "%&Tas%\Windows" /WlansvcFolder "%&Packa%" /import "%SystemRoot%\Temp\Drvindex\%&CurRa%\Wsy.txt"
		EXEC -hide -wait "%&exPath%" /LoadFrom 2 /ExternalWinDir "%&Tas%\Windows" /WlansvcFolder "%&Packa%" /stab "%SystemRoot%\Temp\Drvindex\%&CurRa%\Way.txt"
		READ "%SystemRoot%\Temp\Drvindex\%&CurRa%\Way.txt",**,&SKE
		FORX *NL &SKE,&KeyName,
		{*
			MSTR* &ssid,&Keya=<1><4>%&KeyName%
			STRL &iLen=%&ssid%
			STRL -8 &iLec=%&ssid%
			IFEX #%&iLen%=%&iLec%, EXIT -
			RPOS* &Astr=%,1,%&Keya%
			IFEX #%&Astr%>0, EXIT -
			CALL WISLAD "%&ssid%" "%&Keya%" "%&HWIc%"
		}
	}
	CODE *nobom -ANSI,%SystemRoot%\Temp\Drvindex\%&CurRa%\Wifi.ini,-UTF8,%SystemRoot%\Temp\Drvindex\%&CurRa%\AutoWifi.ini
	LOAD %SystemRoot%\Temp\Drvindex\%&CurRa%\Wifi.ini
	LOAD %SystemRoot%\Temp\Drvindex\%&CurRa%\AutoWifi.ini
_END
_SUB WISLAD
	ENVI &Han=%~3
	LOOP #1>0,
	{*
		CALC #&Han=%&Han% - 1
		ENVI &DATA=ADSL-wlan %~1,%~2,,%&Han%
		GETF -find %SystemRoot%\Temp\Drvindex\%&CurRa%\Wifi.ini,0#1M#100##1,&POS,*&DATA
		IFEX #%&POS%>0, EXIT -
		WRIT %SystemRoot%\Temp\Drvindex\%&CurRa%\Wifi.ini,$+0,ADSL-wlan %~1,%~2,,%&Han%
		IFEX #%&Han%=0,EXIT LOOP
	}
_END
_SUB OnTimer *
	CALC &ISTR=%&ISTR% + 0.1 #1
	ENVI @&RecordTime=%&ISTR%
_END
_SUB MakeID
	ENVI @&OutputShow=
	ENVI &Infthe=
	STRL &Cousa=%&DrvFolder%
	IFEX #%&Cousa%=3, MSTR -delims:\ &DrvFolder=<1>%&DrvFolder%
	ENVI @&OutputShow=%&OutputShow%%&Creatingindex%...%&NL%
	TEAM ENVI @&RecordTime.Visible=1| ENVI @&RecordTime=| ENVI &ISTR=0
	TIME TiCount,100, CALL OnTimer
	CALL UISet 0
	RAND &CurRe
	MDIR %SystemRoot%\Temp\Drvindex\%&CurRe%
	EXEC -hide -wait --exe:#100 =7z.exe
	IFEX %&DrvFolder%\,
	{
		FORX * 7Z ZIP CAB RAR WIM ISO,&Format,
		{
			FORX /S %&DrvFolder%\*.%&Format%,&zipFile,,
			{*
				THREAD*$  CALL S_Make "%&zipFile%"
			}
		}
	}!
	{
		FORX %&DrvFolder%,&zipFile,,THREAD*$  CALL S_Make "%&zipFile%"
	}
	WAIT -thread
	ENVI @TiCount=-del
	CALL UISet 1
	FIND $%&HH%=,ENVI @&OutputShow=%&OutputShow%%&NL%%&noindex%%&NL%! ENVI @&OutputShow=%&OutputShow%%&NL%%&Allindex%%&NL%
	IFEX %SystemRoot%\Temp\Drvindex\7z.exe, EXEC -hide CMD /C rd /s /q "%SystemRoot%\Temp\Drvindex"	
	FIND $%ExitS.Check%=1, KILL \
_END
_SUB S_Make
	ENVI Infthe=
	ENVI &zipFile=%~1
	FDIR &FilePath="%&zipFile%"
	NAME &FileInfo="%&zipFile%"
	EXEC -hide -wait "%SystemRoot%\Temp\Drvindex\7z.exe" x "%&zipFile%" -p%&Secret% -y -r -o"%SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%" *.inf
	ENVI &IndexFile=%SystemRoot%\Temp\Drvindex\%&CurRe%\%&FileInfo%.index
	STRL &iLEN="%SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%"
	IFEX %&IndexFile%, WRIT-ANSI *c %&IndexFile%,$-,
	FORX /S %SystemRoot%\Temp\Drvindex\InfFiles\%&FileInfo%\*.inf,&InfPath,,
	{*
		WAIT 0.1
		TEAM ENVI &NT=| ENVI &Class=| ENVI &DevHWID=
		MSTR &AllPath=%&iLEN%,0,%&InfPath%
		WRIT-ANSI *fix %&IndexFile%,$+0,
		WRIT-ANSI *-nl %&IndexFile%,$+,%&AllPath%|
		GETF %&InfPath%,0#2,&All
		FIND $'%&All%'='0xFE 0xFF',GETF# "%&InfPath%",1#*,&AllContent
		FIND $'%&All%'='0xFF 0xFE',GETF# "%&InfPath%",2#*,&AllContent
		FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#*,&AllContent| ENVI-tow &AllContent=&AllContent
		SED *ni &UF16=?:1,AddReg,,%&AllContent%
		IFEX #%&UF16%<1,ENVI &UF16=50000
		FIND $'%&All%'='0xFE 0xFF',TEAM CALC #&UF16= %&UF16% * 2| GETF# "%&InfPath%",1#%&UF16%,&AllContent
		FIND $'%&All%'='0xFF 0xFE',TEAM CALC #&UF16= %&UF16% * 2| GETF# "%&InfPath%",2#%&UF16%,&AllContent
		FIND $[ '%&All%'<>'0xFE 0xFF' & '%&All%'<>'0xFF 0xFE' ],TEAM GETF# "%&InfPath%",0#%&UF16%,&AllContent| ENVI-tow &AllContent=&AllContent
		FORX *NL &AllContent,&lists,
		{*
			WAIT 0.1
			LSTR &aStr=1,%&lists%
			FIND $%&aStr%=;,EXIT -
			FIND $%&DevHWID%=,
			{*
				SED *ni &iPOS=?,NTamd64,,%&lists%
				IFEX #%&iPOS%>0,
				{*
					LPOS* &iPOS=,,1,%&lists%
					IFEX #%&iPOS%>0,TEAM MSTR -delims:, &NT=<2->%&lists%| WRIT-ANSI *-nl %&IndexFile%,$+, %&NT% ,
				}!
				{*
					SED *ni &iPOS=?,NTx86,,%&lists%
					IFEX #%&iPOS%>0,
					{*
						LPOS* &iPOS=,,1,%&lists%
						IFEX #%&iPOS%>0,TEAM MSTR -delims:, &NT=<2->%&lists%| WRIT-ANSI *-nl %&IndexFile%,$+, %&NT% ,
					}
				}
			}
			MSTR -delims:, &DevHWID=<2>%&lists%
			FIND $%&DevHWID%=, MSTR -delims:, &DevHWID=<3>%&lists%
			FIND $%&DevHWID%=, EXIT -
			RPOS* &Astr=\,1,%DevHWID%
			IFEX #%&Astr%=0,EXIT -
			MSTR &DevHWID=<1>%&DevHWID%
			LPOS* &iPOS=&,2,%&DevHWID%
			CALC #&iPOS=%&iPOS% - 1
			MSTR &DevHWID=0,%&iPOS%,%&DevHWID%
			FIND $%&HWIDR%=%&DevHWID%, EXIT -
			ENVI &HWIDR=%&DevHWID%
			WRIT-ANSI *-nl %&IndexFile%,$+, "%&DevHWID%"
		}
		FIND $%&Infthe%=,
		{*
			FIND $%&InfPath%=,! ENVI< Infthe=%&InfPath%%&nl%
		}
	}
	FIND $%&Infthe%=,! TEAM ENVI @&OutputShow=%&OutputShow%%&FilePath%\%&FileInfo%.index %&Indexi%%&NL%| ENVI &::HH=%Infthe%
	FILE %SystemRoot%\Temp\Drvindex\%&CurRe%\%&FileInfo%.index=>%&FilePath%
_END
_SUB HelpMSG
	ENVI &VL1=Drvindex  驱动安装工具  
	ENVI &VL2=使用方法：
	ENVI &VL3=加载驱动压缩包需将压缩包放至程序当前目录下，或在当前目录下新建文件夹并将驱动压缩包放到新建的文件夹里面，
	ENVI &VL4=可多级文件夹路径，启动程序执行安装，自动搜索加载。      支持压缩包格式：7Z ZIP CAB RAR WIM ISO 
	ENVI &VL5="√" 勾选："搜索硬盘中的驱动选项"，将搜索多系统下的驱动进行匹配安装到当前系统中，将不加载当前目录下的驱动包。
	ENVI &VL6="√" 勾选："忽略安装显卡驱动选项"，即搜索匹配到显卡驱动时也不会安装此驱动，（不包含显卡）。
	ENVI &VL7=自动运行参数：%&nl%支持压缩包带密码解密，示例: 当前目录 Drvindex.exe -b ,123456   123456为密码 %&nl%Drvindex.exe -b D:\Drivers.7z,123456   123456为密码，密码支持 BASE64变异算法加密，以确保用户数据安全。
	ENVI &VL8=---------------------------------------------------------------------------------------------------------------
	ENVI &VL9=-b 	默认搜索当前目录下的驱动压缩包将自动匹配安装驱动。可自定义目录路径
	ENVI &VL10=	示例：EXEC Drvindex.exe -b D:\Drivers  或   EXEC Drvindex.exe -b     注意路径有空格需要加双引号
	ENVI &VL11=---------------------------------------------------------------------------------------------------------------
	ENVI &VL12= -t	忽略安装显卡驱动；搜索当前目录下的驱动压缩包将自动匹配安装驱动（不包含显卡）。
	ENVI &VL13=	可自定义目录路径。示例：EXEC Drvindex.exe -t D:\Drivers  或   EXEC Drvindex.exe -t 
	ENVI &VL14=---------------------------------------------------------------------------------------------------------------
	ENVI &VL15= -y	搜索硬盘中的驱动；搜索本机硬盘离线系统下所有可用驱动匹配安装到当前系统；
	ENVI &VL16=	示例：EXEC Drvindex.exe -y
	ENVI &VL17=---------------------------------------------------------------------------------------------------------------
	ENVI &VL18= -h	搜索硬盘中的驱动 + 忽略安装显卡驱动；搜索本机硬盘离线系统下
	ENVI &VL19=	所有可用驱动匹配安装到当前系统（不包含显卡）；示例：EXEC Drvindex.exe -h
	ENVI &VL20=---------------------------------------------------------------------------------------------------------------
	ENVI &VL21=完成操作自动退出。									感谢：
	ENVI &VL22=											杉     @Fir
	ENVI &VL23=											晓月   @xiaojinglf
	ENVI &VL24=											秋刀鱼 @Anson4
	ENVI &VL25=Lightning   QQ: 2574740313							    	相     @szwp
	MESS. %&VL1%%NL%%NL%%&VL2%%NL%%&VL3%%NL%%&VL4%%NL%%NL%%&VL5%%NL%%NL%%&VL6%%NL%%NL%%&VL7%%NL%%&VL8%%NL%%&VL9%%NL%%&VL10%%NL%%&VL11%%NL%%&VL12%%NL%%&VL13%%NL%%&VL14%%NL%%&VL15%%NL%%&VL16%%NL%%&VL17%%NL%%&VL18%%NL%%&VL19%%NL%%&VL20%%NL%%&VL21%%NL%%&VL22%%NL%%&VL23%%NL%%&VL24%%&nl%%&VL25%
_END
_SUB HelpMSGYW
	ENVI &VL1=Drvindex  Drive installation tool  
	ENVI &VL2=Usage method：
	ENVI &VL3=To load the driver compressed package, you need to put the compressed package in the current directory of the program，Or create a new folder in the current directory and put the drive package into the new folder，
	ENVI &VL4=Multi level folder paths are supported，Start the program to perform the installation，Automatic search loading。      Support compressed package format type：7Z ZIP CAB RAR WIM ISO 
	ENVI &VL5="√" Tick："Search for drive options on your hard drive"，Match the drivers under the search multi system and install them into the current system，The driver package in the current directory will not be loaded。
	ENVI &VL6="√" Tick："Ignore the install graphics driver option"，That is, the driver will not be installed when a matching graphics card driver is searched，（Not including graphics card）。
	ENVI &VL7=Automatic operation parameters：%&nl%Support compressed packets with password decryption，Example: Current directory Drvindex.exe -b ,123456   123456For password %&nl%Drvindex.exe -b D:\Drivers.7z,123456   123456For password，Password support Base64 mutation algorithm encryption，To ensure user data security。
	ENVI &VL8=---------------------------------------------------------------------------------------------------------------
	ENVI &VL9=-b 	By default, the driver compressed package under the current directory will automatically match the installed driver。Customizable directory path
	ENVI &VL10=	Example：EXEC Drvindex.exe -b D:\Drivers  Or   EXEC Drvindex.exe -b     Note that there are spaces in the path and double quotes are required
	ENVI &VL11=---------------------------------------------------------------------------------------------------------------
	ENVI &VL12= -t	Ignore installing graphics driver；Searching for the driver package in the current directory will automatically match the installed driver（Not including graphics card）。
	ENVI &VL13=	Customizable directory path。Example：EXEC Drvindex.exe -t D:\Drivers  Or   EXEC Drvindex.exe -t 
	ENVI &VL14=---------------------------------------------------------------------------------------------------------------
	ENVI &VL15= -y	Search for drives on your hard drive；Search for all available drives under the local hard disk offline system and install them to the current system；
	ENVI &VL16=	Example：EXEC Drvindex.exe -y
	ENVI &VL17=---------------------------------------------------------------------------------------------------------------
	ENVI &VL18= -h	Search for drives on your hard drive + Ignore installing graphics driver；Search local hard disk offline system
	ENVI &VL19=	All available drivers are matched and installed to the current system（Not including graphics card）；Example：EXEC Drvindex.exe -h
	ENVI &VL20=---------------------------------------------------------------------------------------------------------------
	ENVI &VL21=Automatic exit after operation。							Thank：
	ENVI &VL22=											Fir     @Fir
	ENVI &VL23=											Saury   @Anson4
	ENVI &VL24=											Xiaoyue @xiaojinglf
	ENVI &VL25=Lightning   QQ: 2574740313							    	Xiang  @szwp
	MESS. %&VL1%%NL%%NL%%&VL2%%NL%%&VL3%%NL%%&VL4%%NL%%NL%%&VL5%%NL%%NL%%&VL6%%NL%%NL%%&VL7%%NL%%&VL8%%NL%%&VL9%%NL%%&VL10%%NL%%&VL11%%NL%%&VL12%%NL%%&VL13%%NL%%&VL14%%NL%%&VL15%%NL%%&VL16%%NL%%&VL17%%NL%%&VL18%%NL%%&VL19%%NL%%&VL20%%NL%%&VL21%%NL%%&VL22%%NL%%&VL23%%NL%%&VL24%%&nl%%&VL25%
_END
_SUB Mouse_In_TIPS
	TEAM TIPS -| ENVI &ShowHot=
	ENVI @%1.POS=?@&CurX:&CurY:@&CurW:&CurH
	ENVI @@Cur=?&CurXM;&CurYM
	CALC #&RelX=%&CurX%+%&CurW%
	CALC #&RelY=%&CurY%+%&CurH%
	ENVI &ShowHot=%~2
	FIND $[ '%&IMG_MGR_BT_AC%'='M' & '%1'='VolumeNUM' ], ENVI &ShowHot=%~3! ENVI &ShowHot=%~2
	IFEX $[ %&CurXM%>=%&CurX% & %&CurXM%<=%&RelX% & %&CurYM%>=%&CurY% & %&CurYM%<=%&RelY% ], TEAM ENVI @@Cur=?&hotL;&hotT| TIPS ,%&ShowHot%,1000000000,1,@AL%&hotL%T%&hotT%
_END
