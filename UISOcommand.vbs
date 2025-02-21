code=936T950
LOGS
ENVI^ EnviMode=1
ENVI^ ForceLocal=1
ENVI &::SC_CLOSE=0xF060
ENVI &::MF_GRAYED=0x00000001
ENVI &::MF_BYCOMMAND=0x00000000
ENVI &::BM_CLICK=0x00F5
ENVI &::CB_SETCURSEL=0x014E
ENVI &::CB_GETCOUNT=0x0146
ENVI &::CB_GETCURSEL=0x0147
ENVI &::CB_GETLBTEXT=0x0148
ENVI &::CB_GETLBTEXTLEN=0x0149
ENVI &::CB_FINDSTRINGEXACT=0x0158
ENVI &::WM_LBUTTONDOWN=0x0201
ENVI &::WM_KEYDOWN=0x0100
ENVI &::VK_DOWN=0x28    //DOWN ARROW key
ENVI &::VK_RIGHT=0x27   //RIGHT ARROW key
ENVI &::VK_RETURN=0x0D  //ENTER key
SET$ &NL=0d 0a
SET$ &TAB=09
ENVI &UI=
ENVI &ISO=
ENVI &Disk=
ENVI &Drv=
ENVI &Mode=
ENVI &Mbr=
ENVI &ResMbr=
ENVI &ResDbr=
ENVI &HidePart=
ENVI &ShowProgress=
ENVI &ba2=
ENVI &Level=
@FIND $%1<>,
{*
	ENVI &ba1=1
	ENVI &ba2=%#
	LOOP #%&ba1%<%&ba2%,
	{*
		MSTR &ba3=<~%&ba1%>%*
		MSTR * -delims:: -trimp++ -trim++ -rq++ &ba4,&ba5=<1><2->&ba3
		@FIND $%&ba4%=UI,             ENVI &UI=%&ba5%
		@FIND $%&ba4%=ISO,            ENVI &ISO=%&ba5%
		@FIND $%&ba4%=Disk,           ENVI &Disk=%&ba5%
		@FIND $%&ba4%=Drv,            ENVI &Drv=%&ba5%
		@FIND $%&ba4%=Mode,           ENVI &Mode=%&ba5%
		@FIND $%&ba4%=Mbr,            ENVI &Mbr=%&ba5%
		@FIND $%&ba4%=ResMbr,         ENVI &ResMbr=%&ba5%
		@FIND $%&ba4%=ResDbr,         ENVI &ResDbr=%&ba5%
		@FIND $%&ba4%=HidePart,       ENVI &HidePart=%&ba5%
		@FIND $%&ba4%=ShowProgress,   ENVI &ShowProgress=%&ba5%
		CALC #&ba1=%&ba1%+1
	}
}
MSTR * &Build=<-1>&PECMDBUILD
SED &Build=0,[^0-9],,%&Build%
IFEX $[ %&PECMDVER%<201201880585 | %&Build%<20210321 ],
{*
	ENVI &ExitCODE=38
	ENVI &ErrSTR=PECMD版本低于：201201.88.05.85      Build：2021-03-21，程序无法运行 ！
	FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
	WRIT --,$+0,%&ExitCODE% %&ErrSTR%
	EXIT= %&ExitCODE%
	EXIT
}
ENVI &bad=%*
@IFEX [ *=&bad | ( $%&ba2%=2 & *<>&Mode ) ],
{
	MSTR * &ba8=-4,5,&CurFile
	FIND $%&ba8%=.exe#,
	{*
		FNAM -ext &bab="%&MyName%"
		RSTR * &ba9=4,&CurFile
		FIND $%&ba9%=#101, ENVI &baa="%&bab%"! ENVI &baa="%&bab%"  LOAD  %&ba9%
	}!   
	{*
		FNAM -ext &bab="%&CurFile%"
		ENVI &baa=PECMD.EXE  LOAD  %&bab%
	}
	CALL helpTips
	EXIT= 9
	EXIT
}
IFEX [ *=&ISO | ! %&ISO% ],
{
	ENVI &ExitCODE=10
	ENVI &ErrSTR=找不到 ISO 文件 ！
	FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
	WRIT --,$+0,%&ExitCODE% %&ErrSTR%
	EXIT= %&ExitCODE%
	EXIT
}
IFEX [ *=&UI | ! %&UI% ],
{*
	IFEX "%CurDir%\UltraISO.exe",
	{*
		ENVI &UI=%CurDir%\UltraISO.exe
	}!   
	{*
		ENVI &bac=
		REGI HKCU\Software\EasyBoot Systems\UltraISO\5.0\,&bac
		IFEX [ *<>&bac & ( %&bac%\UltraISO.exe ) ],
		{*
			ENVI &UI=%&bac%\UltraISO.exe
		}!   
		{
			ENVI &ExitCODE=11
			ENVI &ErrSTR=找不到 UltraISO.exe ！
			FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
			WRIT --,$+0,%&ExitCODE% %&ErrSTR%
			EXIT= %&ExitCODE%
			EXIT
		}
	}
}
FIND *&ResMbr<>,
{*
	ENVI &baf=
	FIND $%&ResMbr%=USB-HDD,  ENVI &baf=USB-HDD
	FIND $%&ResMbr%=USB-HDD+, ENVI &baf=USB-HDD+
	FIND $%&ResMbr%=USB-ZIP+, ENVI &baf=USB-ZIP+
	FIND $%&ResMbr%=HDD,      ENVI &baf=HDD
	FIND *&baf=, ENVI &ResMbr=! ENVI &ResMbr=%&baf%
}
FIND *&ResDbr<>,
{*
	ENVI &bae=
	FIND $%&ResDbr%=Windows 9x,               ENVI &bae=Win9x
	FIND $%&ResDbr%=Win9x,                    ENVI &bae=Win9x
	FIND $%&ResDbr%=Windows NT/2K/XP,         ENVI &bae=WinNT/2K/XP
	FIND $%&ResDbr%=WinNT/2K/XP,              ENVI &bae=WinNT/2K/XP
	FIND $%&ResDbr%=Windows XP/2K/NT,         ENVI &bae=WinXP/2K/NT
	FIND $%&ResDbr%=WinXP/2K/NT,              ENVI &bae=WinXP/2K/NT
	FIND $%&ResDbr%=NT5,                      ENVI &bae=WinXP/2K/NT
	FIND $%&ResDbr%=Windows Vista/7/8,        ENVI &bae=WinVista/7/8
	FIND $%&ResDbr%=WinVista/7/8,             ENVI &bae=WinVista/7/8
	FIND $%&ResDbr%=Windows 10/8.1/8/7/Vista, ENVI &bae=Win10/8.1/8/7/Vista
	FIND $%&ResDbr%=Win10/8.1/8/7/Vista,      ENVI &bae=Win10/8.1/8/7/Vista
	FIND $%&ResDbr%=NT6,                      ENVI &bae=Win10/8.1/8/7/Vista
	FIND $%&ResDbr%=MS-DOS 6.22,              ENVI &bae=MSDOS 6.22
	FIND $%&ResDbr%=MSDOS 6.22,               ENVI &bae=MSDOS 6.22
	FIND $%&ResDbr%=MSDOS,                    ENVI &bae=MSDOS 6.22
	FIND $%&ResDbr%=PCDOS 7.1,                ENVI &bae=PCDOS 7.1
	FIND $%&ResDbr%=PCDOS,                    ENVI &bae=PCDOS 7.1
	FIND $%&ResDbr%=FreeDOS 1.0,              ENVI &bae=FreeDOS
	FIND $%&ResDbr%=FreeDOS,                  ENVI &bae=FreeDOS
	FIND $%&ResDbr%=EasyBoot,                 ENVI &bae=EasyBoot
	FIND $%&ResDbr%=Syslinux,                 ENVI &bae=Syslinux
	FIND $%&ResDbr%=grldr,                    ENVI &bae=grldr
	FIND *&bae=, ENVI &ResDbr=! ENVI &ResDbr=%&bae%
}
ENVI &DrvOrDiskErr=
FIND *&Drv<>,
{*
	SED -ex &ba6=0,[^A-Za-z],,&Drv
	SED -ex &ba7=0,.*,\u,&ba6
	MSTR * &ba8=1,1,&ba7
	FIND *&ba8<>,
	{*
		PART list drv %&ba8%:,&ba81
		FIND *&ba81<>, ENVI &ba8=%&ba8%:! ENVI &ba8=
	}
	FIND *&ba8<>, TEAM ENVI &Drv=%&ba8%| ENVI &Disk=! TEAM~ ENVI &Drv=~ ENVI &DrvOrDiskErr=指定的盘符不存在 ！
}
FIND *&Disk<>,
{*
	MSTR * &ba91=1,1,&Disk
	FIND $%&ba91%=L,
	{*
		MSTR * &Level=2,0,&Disk
		MSTR * -trim &Level=&Level
		ENVI &Disk=
		CALC #&ba9=abs(%&Level%)
		FIND [ *&ba9<>&Level | $%&Level%<1 ],
		{*
			ENVI &Level=
			FIND *&DrvOrDiskErr=, ENVI &DrvOrDiskErr=Disk:L后面必须是一个合法的正整数 ！
		}
	}!   
	{*
		CALC #&ba9=abs(%&Disk%)
		FIND *&ba9=&Disk,
		{*
			PART list part %&Disk%,&bh1
			FIND *&bh1<>,
			{*
				SED -ex &bh3=0,[-\@][1-9][0-9]*[ ]*,,&bh1
				ENVI &bh4=
				FORX *v &bh3,&bh5,
				{*
					PART -iv=8 -fill list part %&Disk%:%&bh5%,&bh6
					FIND $%&bh6%<>*, ENVI< &bh4=%&bh6%
				}
				FIND *&bh4<>,
				{*
					SED -ex &bh4=0,[ :],,&bh4
					SED -ex &bh4=0,{.},\1: ,&bh4
					ENVI &Drv=%&bh4%
					ENVI &ba9=
				}
			}!   
			{*
				ENVI &ba9=
			}
		}
		FIND *&ba9<>&Disk,
		{*
			ENVI &Disk=
			FIND *&DrvOrDiskErr=, ENVI &DrvOrDiskErr=指定的磁盘不存在 ！
		}
	}
}
FIND [ *=&Drv & *=&Disk & *=&Level ],
{
	FIND *&DrvOrDiskErr<>,
	{*
		ENVI &ExitCODE=12
		ENVI &ErrSTR=%&DrvOrDiskErr%
	}!   
	{*
		ENVI &ExitCODE=13
		ENVI &ErrSTR=请指定要写入的磁盘或分区 ！
	}
	FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
	WRIT --,$+0,%&ExitCODE% %&ErrSTR%
	EXIT= %&ExitCODE%
	EXIT
}
CALL @WriteUSB
EXIT
_SUB WriteUSB,#,,CALL exitCMD
	CALC -base=10 &thisWid=%&__WinID%
	ENVI @this.Visible=0
	EDIT &ErrSTR,L0T0W0H0,,,0x18
	EDIT &Percent,L0T0W0H0,,,0x18
	EDIT &ExitCODE,L0T0W0H0,0,,0x18
	EDIT &ChildTid3,L0T0W0H0,0,,0x18
	EDIT &CancelCode,L0T0W0H0,,,0x18
	EDIT &StopCode1,L0T0W0H0,0,,0x18
	EDIT &StopCode2,L0T0W0H0,0,,0x18
	EDIT &StopCode3,L0T0W0H0,0,,0x18
	EDIT &StopCode4,L0T0W0H0,0,,0x18
	EDIT &StopCode5,L0T0W0H0,0,,0x18
	EDIT &StopCode8,L0T0W0H0,0,,0x18
	EDIT &StopCode9,L0T0W0H0,0,,0x18
	EDIT &forceStop3,L0T0W0H0,0,,0x18
	EDIT &UiWindowWid,L0T0W0H0,,,0x18
	EDIT &UiWindowPos,L0T0W0H0,,,0x18
	EDIT &ThisChildWid,L0T0W0H0,0,,0x18
	EDIT &XpressBootText,L0T0W0H0,,,0x18
	EDIT &XpressBootTitle,L0T0W0H0,,,0x18
	EDIT &UiPidTotalTime,L0T0W0H0,0,,0x18
	EDIT &UiWidTotalTime,L0T0W0H0,0,,0x18
	EDIT &XpressBootTitle2,L0T0W0H0,,,0x18
	EDIT &XpressBootButtonHid,L0T0W0H0,0,,0x18
	EDIT &XpressBootTotalTime,L0T0W0H0,0,,0x18
	EDIT &XpressBootRetryTime,L0T0W0H0,0,,0x18
	EDIT &XpressBootChildWidTotalTime,L0T0W0H0,0,,0x18
	EDIT &ShowXpressBootChildWindowTime,L0T0W0H0,0,,0x18
	EDIT &ShowThisChildWindowTime,L0T0W0H0,0,,0x18
	EDIT &HideBootPartition,L0T0W0H0,,,0x18
	EDIT &WriteButtonHid,L0T0W0H0,0,,0x18
	EDIT &WriteMethod,L0T0W0H0,,,0x18
	EDIT &DiskDrive,L0T0W0H0,,,0x18
	TIME &Timer1,1, THREAD* CALL checkUiPid
	TIME &Timer2,0, THREAD* CALL checkUiWid
	TIME &Timer3,0, THREAD* CALL checkUiChildWid
	TIME &Timer4,0, THREAD* CALL waitUiWindow
	TIME &Timer8,0, THREAD* CALL monitorXpressBoot
	TIME &Timer9,0, THREAD* CALL checkXpressBootChildWid
	WAIT 0.9
	EXEC -hide -pid:&UiPid -exe:"%&UI%" UltraISO -silent -infile "%&ISO%" -writeusb  //UltraISO.exe -input "%&ISO%" -writeUSB
	ENVI @this.MSG=_#2: ENVI @&Timer2=1
	ENVI @this.MSG=_#3: ENVI @&Timer3=1
	ENVI @this.MSG=_#4: ENVI @&Timer4=1
	ENVI @this.MSG=_#5: THREAD* TEAM FIND --pid*.%&UiPid% &bl3,| IFEX $%&bl3%>0, CALL @ProgressBar
	ENVI @this.MSG=_#6::&bl1,, TEAM ENVI-mkfixdummy &bl2=%&bl1%| ENVI @&ThisChildWid=%&bl2%
	ENVI @this.MSG=_#7: CALL exitWindow
	ENVI @this.MSG=_#8: ENVI @&Timer8=1
	ENVI @this.MSG=_#9: ENVI @&Timer9=1
_END
_SUB ProgressBar,W466H140,正在写入,WAIT *=%&ChildTid%,%MyName%,,, -scalef -scale -discloseb -disminb
	ENVI @@style=%__WinID%:*0x40000:0x80
	ENVI &ChildWindowTEXT=%ProgressBar%
	ENVI @@SENDMSG=%&thisWid%;#6;$%__WinID%
	EDIT &StopCode,L0T0W0H0,0,,0x18
	EDIT &ChildTid,L0T0W0H0,0,,0x18
	EDIT &forceStop,L0T0W0H0,0,,0x18
	EDIT &ChildPercent,L0T0W0H0,,,0x18
	LABE ,L16T14W93H23,硬盘驱动器：,,
	LABE ,L89T14W354H23,%&DiskDrive%,,
	PBAR &ProgBar,L16T46W428H20,0,0%
	ENVI @&ProgBar.color=0xFFFFFF
	LABE ,L16T80W66H23,写入方式：,,
	LABE ,L77T80W93H23,%&WriteMethod%,,
	LABE ,L177T80W93H23,隐藏启动分区：,,
	LABE ,L263T80W116H23,%&HideBootPartition%,,
	IFEX $%&CancelCode%=1,
	{
		ITEM-def &ITEM1,L380T73W65H25,取消, ENVI @@POSTMSG=%&thisWid%;#7,
		ENVI @&ITEM1.Cursor=32649
	}
	TIME &Timer,1, THREAD* CALL monitorProgress
	WAIT 0.9
	ENVI @this.MSG=_#1: CALL exitChildWindow
_END
_SUB monitorProgress
	IFEX $%&StopCode%=1, EXIT
	ENVI @&StopCode=1
	ENVI @&Timer=0
	ENVI @&ChildTid=%&__TID%
	FIND --forpid:%&UiPid% --class:TfrmUSBWrite --wid* &bm1,
	IFEX $%&bm1%>0,
	{
		FIND --wid*@%&bm1% &bm2,
		LPOS* * ,&bm3=%&TAB%TStaticText%&TAB%,4,&bm2
		IFEX $%&bm3%>0,
		{
			READ -*,%&bm3%,&bm4,&bm2
			MSTR* * &bm5=<-1>&bm4
			MSTR * &bm5=<1>&bm5
			RSTR * &bm6=1,&bm5
			FIND $[ '%&bm6%'='%' & '%&ChildPercent%'<>'%&bm5%' ],
			{
				MSTR * &bm7=-2,0,&bm5
				ENVI @&ProgBar=%&bm7%;%&bm5%
				ENVI @this=%&ChildWindowTEXT%  %&bm5%
				WRIT -,$+0,%&bm5%
				ENVI @&ChildPercent=%&bm5%
			}
		}
	}!   
	{
		ENVI @@POSTMSG=%&ThisChildWid%;#1
		EXIT
	}
	IFEX $%&forceStop%=0,
	{
		ENVI @&StopCode=0
		ENVI @&Timer=1
	}
_END
_SUB exitChildWindow
	ENVI @&forceStop=1
	ENVI @&Timer=0
	IFEX $%&ChildTid%>0, WAIT *=%&ChildTid%
	KILL @@%&ThisChildWid%
_END
_SUB exitWindow
	ENVI @&forceStop3=1
	ENVI @&Timer1=0
	ENVI @&Timer2=0
	ENVI @&Timer3=0
	ENVI @&StopCode5=1
	KILL *force *%&UiPid%
	IFEX $%&ThisChildWid%>0, ENVI @@SENDMSG=%&ThisChildWid%;#1
	ENVI @&ExitCODE=29
	ENVI @&ErrSTR=用户取消 ！
	KILL @@%&thisWid%
_END
_SUB exitCMD
	WAIT -thread
	IFEX $%&ExitCODE%<>0,!! WRIT --,$+0,%&ExitCODE% %&ErrSTR%
	EXIT= %&ExitCODE%
_END
_SUB checkUiPid
	IFEX $%&StopCode1%=1, EXIT
	ENVI @&StopCode1=1
	ENVI @&Timer1=0
	IFEX $%&UiPid%>0,
	{
		ENVI @@POSTMSG=%&thisWid%;#2
		WAIT *%&UiPid%
		IFEX $%&StopCode5%=0,
		{
			ENVI @&forceStop3=1
			ENVI @&Timer1=0
			ENVI @&Timer2=0
			ENVI @&Timer3=0
			ENVI @&ExitCODE=28
			ENVI @&ErrSTR=UltraISO 意外终止 ！
			FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
			IFEX $%&ThisChildWid%>0, ENVI @@SENDMSG=%&ThisChildWid%;#1
			KILL @@%&thisWid%
		}!   
		{
			IFEX $%&StopCode5%=2, KILL @@%&thisWid%
		}
	}!   
	{
		IFEX $%&UiPidTotalTime%>100,
		{
			ENVI @&ExitCODE=30
			ENVI @&ErrSTR=无法开启 UltraISO 进程 ！
			FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
			KILL @@%&thisWid%
			EXIT
		}
		CALC #&_UiPidTotalTime=%&UiPidTotalTime%+1
		ENVI @&UiPidTotalTime=%&_UiPidTotalTime%
		ENVI @&StopCode1=0
		ENVI @&Timer1=1
	}
_END
_SUB checkUiWid
	IFEX $%&StopCode2%=1, EXIT
	ENVI @&StopCode2=1
	ENVI @&Timer2=0
	FIND --forpid:%&UiPid% --class:TApplication --wid* &bb1,
	IFEX $%&bb1%>0, ENVI @@Visible=%&bb1%:*0
	FIND --forpid:%&UiPid% --class:TfrmUSBWrite --wid* &bb2,
	IFEX $%&bb2%>0,
	{
		ENVI @@Visible=?%&bb2%:&bb3
		IFEX $%&bb3%<1, EXIT -
		ENVI @@POS=%&bb2%:::::::1
		ENVI @@Visible=%&bb2%:*0   //隐藏窗口，秘密地干活
		ENVI @@POS=?%&bb2%:@&bd3:&bd4:&bd2:&bdc
		CALC #&bdr=%&bd2%*2
		ENVI @@POS=%&bb2%:-%&bdr%:-%&bdc%  //移到屏幕外
		ENVI @&UiWindowPos=%&bd3%:%&bd4%
		FIND --wid*@%&bb2% &bb4,
		LPOS* * ,&bb5=%&TAB%TComboBox%&TAB%%&NL%,1,&bb4  //隐藏启动分区
		LPOS* * ,&bb6=%&TAB%TComboBox%&TAB%%&NL%,3,&bb4  //写入方式
		LPOS* * ,&bb7=%&TAB%TComboBox%&TAB%%&NL%,4,&bb4  //硬盘驱动器
		LPOS* * ,&bb8=%&TAB%TButton%&TAB%,1,&bb4         //便捷启动
		LPOS* * ,&bb9=%&TAB%TButton%&TAB%,2,&bb4         //返回
		LPOS* * ,&bba=%&TAB%TButton%&TAB%,3,&bb4         //终止[&A]
		LPOS* * ,&bbb=%&TAB%TButton%&TAB%,4,&bb4         //写入
		LPOS* * ,&bbc=%&TAB%TButton%&TAB%,5,&bb4         //格式化
		LPOS* * ,&bbd=%&TAB%TButton%&TAB%,6,&bb4         //保存
		IFEX $[ %&bb5%=0 | %&bb6%=0 | %&bb7%=0 | %&bb8%=0 | %&bb9%=0 | %&bba%=0 | %&bbb%=0 | %&bbc%=0 | %&bbd%=0 ], EXIT -
		READ -*,%&bb6%,&bbe,&bb4
		MSTR* * &bbf=<2>&bbe
		ENVI @@SENDMSG=:&bbg;%&bbf%;%&CB_GETCOUNT%;0;0
		ENVI @@SENDMSG=:&bbh;%&bbf%;%&CB_FINDSTRINGEXACT%;1;$USB-HDD
		IFEX $[ %&bbh%<0 | %&bbh%>=%&bbg% ],
		{
			ENVI @&ExitCODE=14
			ENVI @&ErrSTR=本工具不支持此版本的 UltraISO，请更换版本 ！
			FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
			ENVI @&StopCode5=1
			KILL *force *%&UiPid%
			KILL @@%&thisWid%
			EXIT
		}
		READ -*,%&bb7%,&bbi,&bb4
		MSTR* * &ListID=<2>&bbi
		ENVI @@SENDMSG=:&ListCount;%&ListID%;%&CB_GETCOUNT%;0;0
		IFEX $%&ListCount%<1,
		{
			ENVI @&ExitCODE=15
			ENVI @&ErrSTR=无法识别 U 盘，请更换 UltraISO 版本或关闭后重试 ！
			FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
			ENVI @&StopCode5=1
			KILL *force *%&UiPid%
			KILL @@%&thisWid%
			EXIT
		}
		FIND *&Level<>,
		{*
			IFEX #%&Level%>%&ListCount%,
			{
				ENVI @&ExitCODE=36
				ENVI @&ErrSTR=所指定的索引超出范围 ！
				FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
				ENVI @&StopCode5=1
				KILL *force *%&UiPid%
				KILL @@%&thisWid%
				EXIT
			}
			CALC #&Level=%&Level%-1
			ENVI &bbbr=0
			LOOP #%&bbbr%<10,  //最多重复9次，检验选中项是否正确
			{*
				ENVI @@SENDMSG=:&bbbs;%&ListID%;%&CB_GETCURSEL%;0;0
				IFEX $%&bbbs%=%&Level%,
				{
					EXIT
				}!   
				{
					IFEX $%&bbbr%>8,
					{
						ENVI @&ExitCODE=37
						ENVI @&ErrSTR=无法选中目标 U 盘 ！
						FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
						ENVI @&StopCode5=1
						KILL *force *%&UiPid%
						KILL @@%&thisWid%
						EXIT _SUB
					}!   
					{
						CALL autoSEL %&Level% %&ListID%
					}
				}
				CALC #&bbbr=%&bbbr%+1
			}
		}
		FIND $%&Drv%<>,
		{
			ENVI &bbm=0
			ENVI &bbn=
			ENVI &bbo=
			LOOP #%&bbm%<%&ListCount%,
			{*
				CALL getListText %&ListID% %&bbm% &bbp
				FORX *v &Drv,&bbl,
				{*
					ENVI &bbl+=%&bbl%,
					LPOS* * &bbq=%&bbl+%,1,&bbp
					IFEX $%&bbq%>0, EXIT
				}
				IFEX $%&bbq%>0, TEAM ENVI &bbn=%&bbm%| ENVI &bbo=%&bbp%| EXIT
				CALC #&bbm=%&bbm%+1
			}
			FIND $%&bbn%=,
			{
				ENVI @&ExitCODE=16
				ENVI @&ErrSTR=无法识别 U 盘，请更换 UltraISO 版本或关闭后重试 ！
				FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
				ENVI @&StopCode5=1
				KILL *force *%&UiPid%
				KILL @@%&thisWid%
				EXIT
			}!   
			{
				ENVI &bbr=0
				LOOP #%&bbr%<10,  //最多重复9次，检验选中项是否正确
				{*
					ENVI @@SENDMSG=:&bbs;%&ListID%;%&CB_GETCURSEL%;0;0
					CALL getListText %&ListID% %&bbs% &bbt
					IFEX $[ %&bbs%=%&bbn% & '%&bbt%'='%&bbo%' ],
					{
						EXIT
					}!   
					{
						IFEX $%&bbr%>8,
						{
							ENVI @&ExitCODE=17
							ENVI @&ErrSTR=无法选中目标 U 盘 ！
							FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
							ENVI @&StopCode5=1
							KILL *force *%&UiPid%
							KILL @@%&thisWid%
							EXIT _SUB
						}!   
						{
							CALL autoSEL %&bbn% %&ListID%
						}
					}
					CALC #&bbr=%&bbr%+1
				}
			}
		}
		FIND $%&Disk%<>,
		{
			CALL getDevId %&Disk% &allDevText &DevId
			ENVI &bbu=0
			ENVI &bc3=
			LOOP #%&bbu%<%&ListCount%,
			{*
				CALL getListText %&ListID% %&bbu% &bc1
				LPOS* * ,&bc2=%&NL%%&bc1%%&NL%,1,&allDevText
				IFEX $%&bc2%>0, ENVI< &bc3= %&bbu%
				CALC #&bbu=%&bbu%+1
			}
			MSTR * &bc4=<#>&bc3
			IFEX $%&bc4%=0,
			{
				ENVI @&ExitCODE=19
				ENVI @&ErrSTR=无法识别 U 盘，请更换 UltraISO 版本或关闭后重试 ！
				FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
				ENVI @&StopCode5=1
				KILL *force *%&UiPid%
				KILL @@%&thisWid%
				EXIT
			}!   
			{
				IFEX $%&bc4%=1,
				{
					MSTR * -trim &bc5=&bc3
					ENVI &bc6=0
					LOOP #%&bc6%<10,
					{*
						ENVI @@SENDMSG=:&bc7;%&ListID%;%&CB_GETCURSEL%;0;0
						IFEX $%&bc7%=%&bc5%,
						{
							EXIT
						}!   
						{
							IFEX $%&bc6%>8,
							{
								ENVI @&ExitCODE=18
								ENVI @&ErrSTR=无法选中目标 U 盘 ！
								FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
								ENVI @&StopCode5=1
								KILL *force *%&UiPid%
								KILL @@%&thisWid%
								EXIT _SUB
							}!   
							{
								CALL autoSEL %&bc5% %&ListID%
							}
						}
						CALC #&bc6=%&bc6%+1
					}
				}!   
				{
					ENVI &bcc=1
					PART list disk ,&bc8
					FORX *v &bc8,&bc9,
					{*
						IFEX $%&bc9%=%&Disk%, EXIT
						CALL GetDrv &bcg %&bc9%
						IFEX #%&error%=0,
						{*
							PART -iv=12 -devid list disk %&bc9%,&bca
							MSTR * -delims:\ &bcb=<2>&bca
							FIND *&bcb=&DevId, CALC #&bcc=%&bcc%+1
						}
					}
					MSTR * &bcd=<%&bcc%>&bc3
					FIND *&bcd=,
					{
						ENVI @&ExitCODE=20
						ENVI @&ErrSTR=无法识别 U 盘，请更换 UltraISO 版本或关闭后重试 ！
						FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
						ENVI @&StopCode5=1
						KILL *force *%&UiPid%
						KILL @@%&thisWid%
						EXIT
					}!   
					{
						ENVI &bce=0
						LOOP #%&bce%<10,
						{*
							ENVI @@SENDMSG=:&bcf;%&ListID%;%&CB_GETCURSEL%;0;0
							IFEX $%&bcf%=%&bcd%,
							{
								EXIT
							}!   
							{
								IFEX $%&bce%>8,
								{
									ENVI @&ExitCODE=21
									ENVI @&ErrSTR=无法选中目标 U 盘 ！
									FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
									ENVI @&StopCode5=1
									KILL *force *%&UiPid%
									KILL @@%&thisWid%
									EXIT _SUB
								}!   
								{
									CALL autoSEL %&bcd% %&ListID%
								}
							}
							CALC #&bce=%&bce%+1
						}
					}
				}
			}
		}
		ENVI @@SENDMSG=:&bda;%&ListID%;%&CB_GETCURSEL%;0;0
		CALL getListText %&ListID% %&bda% &bdb
		ENVI @&DiskDrive=%&bdb%
		FIND $[ '%&ResMbr%'<>'' | '%&ResDbr%'<>'' ],
		{
			FIND $%&ResDbr%=WinNT/2K/XP, ENVI @&XpressBootTitle2=WinXP/2K/NT
			FIND $%&ResDbr%=WinXP/2K/NT, ENVI @&XpressBootTitle2=WinNT/2K/XP
			FIND $%&ResDbr%=WinVista/7/8, ENVI @&XpressBootTitle2=Win10/8.1/8/7/Vista
			FIND $%&ResDbr%=Win10/8.1/8/7/Vista, ENVI @&XpressBootTitle2=WinVista/7/8
			FIND $[ '%&ResDbr%'='Win9x' | '%&ResDbr%'='WinNT/2K/XP' | '%&ResDbr%'='WinVista/7/8' | '%&ResDbr%'='WinXP/2K/NT' | '%&ResDbr%'='Win10/8.1/8/7/Vista' | '%&ResDbr%'='MSDOS 6.22' | '%&ResDbr%'='PCDOS 7.1' | '%&ResDbr%'='FreeDOS' | '%&ResDbr%'='EasyBoot' | '%&ResDbr%'='Syslinux' | '%&ResDbr%'='grldr' ], TEAM ENVI @&XpressBootTitle=%&ResDbr%| ENVI @&XpressBootText=引导扇区
			FIND $[ '%&ResMbr%'='USB-HDD' | '%&ResMbr%'='USB-HDD+' | '%&ResMbr%'='USB-ZIP+' ], TEAM ENVI @&XpressBootTitle=%&ResMbr%| ENVI @&XpressBootText=主引导记录(MBR)
			FIND $%&ResMbr%=HDD, TEAM ENVI @&XpressBootTitle=RAW| ENVI @&XpressBootText=主引导记录(MBR)
			FIND $%&ResDbr%<>,   TEAM ENVI &bdp=%&ResDbr%|   ENVI &bdq=ResDbr
			FIND $%&ResMbr%<>,   TEAM ENVI &bdp=%&ResMbr%|   ENVI &bdq=ResMbr
			FIND $%&XpressBootTitle%=,
			{
				ENVI @&ExitCODE=31
				ENVI @&ErrSTR=“%&bdq%” 开关无此参数：“%&bdp%” ！
				FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
				ENVI @&StopCode5=1
				KILL *force *%&UiPid%
				KILL @@%&thisWid%
				EXIT
			}
			READ -*,%&bb8%,&bdn,&bb4
			MSTR* * &bdo=<2>&bdn
			ENVI @&XpressBootButtonHid=%&bdo%
			ENVI @@POSTMSG=%&thisWid%;#8   //monitorXpressBoot
			ENVI @@SENDMSG=%&bdo%;%&BM_CLICK%;0;0
			EXIT _SUB
		}
		FIND $%&Mbr%<>,
		{
			ENVI @@Enable=?%&bbf%:&bcm
			IFEX $%&bcm%<>0,
			{
				ENVI @@SENDMSG=:&bcn;%&bbf%;%&CB_FINDSTRINGEXACT%;1;@&Mbr
				IFEX $[ %&bcn%<0 | %&bcn%>=%&bbg% ],
				{
					ENVI @&ExitCODE=22
					ENVI @&ErrSTR=此版 UltraISO 不支持 “%&Mbr%” 参数，请更换版本 ！
					FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
					ENVI @&StopCode5=1
					KILL *force *%&UiPid%
					KILL @@%&thisWid%
					EXIT
				}
				ENVI &bco=0
				LOOP #%&bco%<10,
				{*
					ENVI @@SENDMSG=:&bcp;%&bbf%;%&CB_GETCURSEL%;0;0
					CALL getListText %&bbf% %&bcp% &bcq
					IFEX $[ %&bcp%=%&bcn% & '%&bcq%'='%&Mbr%' ],
					{
						EXIT
					}!   
					{
						IFEX $%&bco%>8,
						{
							ENVI @&ExitCODE=23
							ENVI @&ErrSTR=无法选中 “%&Mbr%” 参数 ！
							FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
							ENVI @&StopCode5=1
							KILL *force *%&UiPid%
							KILL @@%&thisWid%
							EXIT _SUB
						}!   
						{
							CALL autoSEL %&bcn% %&bbf%
						}
					}
					CALC #&bco=%&bco%+1
				}
			}
		}
		ENVI &bcs=
		FIND $%&HidePart%<>,
		{*
			READ -*,%&bb5%,&bcr,&bb4
			MSTR* * &bcs=<2>&bcr
			ENVI @@Enable=?%&bcs%:&bct
			IFEX $%&bct%<>0,
			{
				ENVI @@SENDMSG=:&bcu;%&bcs%;%&CB_GETCOUNT%;0;0
				ENVI &bcv=
				FIND $%&HidePart%=L1, ENVI &bcv=0
				FIND $%&HidePart%=L2, ENVI &bcv=1
				FIND $%&HidePart%=L3, ENVI &bcv=2
				FIND $%&HidePart%=L4, ENVI &bcv=3
				FIND $%&bcv%=,
				{*
					ENVI @@SENDMSG=:&bcv;%&bcs%;%&CB_FINDSTRINGEXACT%;1;@&HidePart
				}!   
				{*
					CALL getListText %&bcs% %&bcv% &HidePart
					FIND $%&HidePart%=,
					{*
						IFEX $%&bcv%=0, ENVI &HidePart=不隐藏启动分区
						IFEX $%&bcv%=1, ENVI &HidePart=隐藏启动分区
						IFEX $%&bcv%=2, ENVI &HidePart=高端隐藏启动分区
						IFEX $%&bcv%=3, ENVI &HidePart=深度隐藏启动分区
					}
				}
				IFEX $[ %&bcv%<0 | %&bcv%>=%&bcu% ],
				{
					ENVI @&ExitCODE=24
					ENVI @&ErrSTR=“%&Mbr%” 模式不支持 “%&HidePart%” ！
					FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
					ENVI @&StopCode5=1
					KILL *force *%&UiPid%
					KILL @@%&thisWid%
					EXIT
				}
				ENVI &bcw=0
				LOOP #%&bcw%<10,
				{*
					ENVI @@SENDMSG=:&bcx;%&bcs%;%&CB_GETCURSEL%;0;0
					CALL getListText %&bcs% %&bcx% &bcy
					IFEX $[ %&bcx%=%&bcv% & '%&bcy%'='%&HidePart%' ],
					{
						EXIT
					}!   
					{
						IFEX $%&bcw%>8,
						{
							ENVI @&ExitCODE=25
							ENVI @&ErrSTR=无法选中 “%&HidePart%” 参数 ！
							FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
							ENVI @&StopCode5=1
							KILL *force *%&UiPid%
							KILL @@%&thisWid%
							EXIT _SUB
						}!   
						{
							CALL autoSEL %&bcv% %&bcs%
						}
					}
					CALC #&bcw=%&bcw%+1
				}
			}
		}
		READ -*,%&bbb%,&bcz,&bb4
		MSTR* * &bd1=<2>&bcz
		ENVI @&WriteButtonHid=%&bd1%
		FIND $[ '%&ShowProgress%'='-UI' | '%&ShowProgress%'='-UI-C' ],
		{
			CALC #&bdd=%&MF_GRAYED% | %&MF_BYCOMMAND%
			CALL $--ret:&bde user32.dll,GetSystemMenu,#%&bb2%,#0
			CALL $user32.dll,EnableMenuItem,#%&bde%,#%&SC_CLOSE%,#%&bdd%%  //禁止关闭按钮
			FIND $%&ShowProgress%=-UI,
			{
				READ -*,%&bba%,&bdf,&bb4  //隐藏终止按钮
				MSTR* * &bdg=<2>&bdf
				ENVI @@POS=?%&bdg%:&bdh
				ENVI @@Visible=%&bdg%:*0
				READ -*,%&bbb%,&bdi,&bb4  //写入
				MSTR* * &bdj=<2>&bdi
				ENVI @@POS=?%&bdj%:&bdk
				READ -*,%&bbc%,&bdl,&bb4  //格式化
				MSTR* * &bdm=<2>&bdl
				ENVI @@POS=%&bdj%:%&bdh%  //位置交换：写入-->终止
				ENVI @@POS=%&bdm%:%&bdk%  //位置交换：格式化-->写入
			}
			ENVI @&UiWindowWid=%&bb2%
		}
		FIND $[ '%&ShowProgress%'='-Y' | '%&ShowProgress%'='-Y-C' ],
		{
			FIND $%&ShowProgress%=-Y-C, ENVI @&CancelCode=1
			FIND $%&bcs%=,
			{*
				READ -*,%&bb5%,&bd5,&bb4
				MSTR* * &bcs=<2>&bd5
			}
			ENVI @@SENDMSG=:&bd6;%&bcs%;%&CB_GETCURSEL%;0;0
			CALL getListText %&bcs% %&bd6% &bd7
			ENVI @&HideBootPartition=%&bd7%
			ENVI @@SENDMSG=:&bd8;%&bbf%;%&CB_GETCURSEL%;0;0
			CALL getListText %&bbf% %&bd8% &bd9
			ENVI @&WriteMethod=%&bd9%
		}
		FIND $%&ShowProgress%=-UI-P,
		{
			ENVI @&StopCode5=2
			ENVI @@POS=%&bb2%:%&UiWindowPos%
			ENVI @@Visible=%&bb2%:*2
		}!   
		{
			ENVI @@POSTMSG=%&thisWid%;#3   //checkUiChildWid
			ENVI @@SENDMSG=%&bd1%;%&BM_CLICK%;0;0
			ENVI @@POSTMSG=%&thisWid%;#4   //waitUiWindow
		}
		EXIT _SUB
	}
	IFEX $%&UiWidTotalTime%>100,
	{
		ENVI @&ExitCODE=26
		ENVI @&ErrSTR=获取 UltraISO 窗口信息失败，请更换 UltraISO 版本 ！
		FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
		ENVI @&StopCode5=1
		KILL *force *%&UiPid%
		KILL @@%&thisWid%
		EXIT
	}
	CALC #&_UiWidTotalTime=%&UiWidTotalTime%+1
	ENVI @&UiWidTotalTime=%&_UiWidTotalTime%
	ENVI @&StopCode2=0
	ENVI @&Timer2=1
_END
_SUB checkUiChildWid
	IFEX $%&StopCode3%=1, EXIT
	ENVI @&StopCode3=1
	ENVI @&Timer3=0
	ENVI @&ChildTid3=%&__TID%
	FIND --forpid:%&UiPid% --class:TMessageForm --wid* &ben,
	IFEX $%&ben%>0,
	{
		ENVI @&ExitCODE=35
		ENVI @&ErrSTR=UltraISO 内存冲突 ！
		ENVI @&StopCode5=1
		KILL *force *%&UiPid%
	}
	FIND --forpid:%&UiPid% --class:#32770 --wid*@ &be1,
	FIND $[ '%&be1%'='' & '%&ShowProgress%'<>'-Y' & '%&ShowProgress%'<>'-Y-C' ],
	{
		FIND --forpid:%&UiPid% --class:TfrmUSBWrite --wid* &beo,
		IFEX $%&beo%>0,
		{
			FIND --wid*@%&beo% &bep,
			LPOS* * ,&beq=%&TAB%TStaticText%&TAB%,4,&bep
			IFEX $%&beq%>0,
			{
				READ -*,%&beq%,&ber,&bep
				MSTR* * &bes=<-1>&ber
				MSTR * &bes=<1>&bes
				RSTR * &bet=1,&bes
				FIND $[ '%&bet%'='%' & '%&Percent%'<>'%&bes%' ],
				{
					WRIT -,$+0,%&bes%
					ENVI @&Percent=%&bes%
				}
			}
		}
	}
	FORX *NL &be1,&be2,
	{
		MSTR* * &be3=<2>&be2
		ENVI @@Visible=?%&be3%:&bed
		IFEX $%&bed%<1, EXIT -
		FIND --wid*@%&be3% &be4,
		LPOS* * ,&be5=%&TAB%Button%&TAB%,1,&be4
		LPOS* * ,&be6=%&TAB%Button%&TAB%,2,&be4
		LPOS* * ,&bea=&S,1,&be4
		IFEX $%&bea%>0, EXIT -
		READ -*,%&be5%,&be7,&be4
		MSTR* * &be8,&bei=<2><5>&be7
		IFEX $%&be6%>0,
		{
			ENVI @@Visible=%&be3%:*0
			FIND $%&Mode%=-S,
			{
				ENVI &beg=1
				LOOP #%&beg%>0,
				{*
					ENVI @@POS=%&be3%:::::::1
					ENVI @@SENDMSG=%&be8%;%&BM_CLICK%;0;0
					ENVI @@IsWindow=?%&be3%:&beg
				}
				IFEX $%&ShowThisChildWindowTime%=0,
				{
					FIND $[ '%&ShowProgress%'='-Y' | '%&ShowProgress%'='-Y-C' ], ENVI @@SENDMSG=%&thisWid%;#5
					FIND $[ '%&ShowProgress%'='-UI' | '%&ShowProgress%'='-UI-C' ],
					{
						ENVI @@POS=%&UiWindowWid%:%&UiWindowPos%
						ENVI @@Visible=%&UiWindowWid%:*2
					}
					ENVI @&ShowThisChildWindowTime=1
				}
			}!   
			{
				IFEX $%&ShowThisChildWindowTime%=0,
				{
					MESS=.+icon1 驱动器 %&DiskDrive% 上的所有数据将丢失，是否继续？数据无价，请谨慎操作！ @警告#yn
					FIND $%YESNO%=NO,
					{
						READ -*,%&be6%,&beb,&be4
						MSTR* * &bec=<2>&beb
						ENVI &bee=1
						LOOP #%&bee%>0,
						{*
							ENVI @@POS=%&be3%:::::::1
							ENVI @@SENDMSG=%&bec%;%&BM_CLICK%;0;0
							ENVI @@IsWindow=?%&be3%:&bee
						}
						ENVI @&ExitCODE=29
						ENVI @&ErrSTR=用户取消 ！
					}!   
					{
						ENVI &bef=1
						LOOP #%&bef%>0,
						{*
							ENVI @@POS=%&be3%:::::::1
							ENVI @@SENDMSG=%&be8%;%&BM_CLICK%;0;0
							ENVI @@IsWindow=?%&be3%:&bef
						}
						FIND $[ '%&ShowProgress%'='-Y' | '%&ShowProgress%'='-Y-C' ], ENVI @@SENDMSG=%&thisWid%;#5
						FIND $[ '%&ShowProgress%'='-UI' | '%&ShowProgress%'='-UI-C' ],
						{
							ENVI @@POS=%&UiWindowWid%:%&UiWindowPos%
							ENVI @@Visible=%&UiWindowWid%:*2
						}
					}
					ENVI @&ShowThisChildWindowTime=1
				}!   
				{
					ENVI @@POS=%&be3%:::::::1
					WAIT *=%&bei%
				}
			}
		}
		IFEX $[ %&be5%>0 & %&be6%<1 ],
		{
			RPOS* * ,&bej=%&TAB%Static%&TAB%,1,&be4
			FORX *v &bej,&bek,
			{
				IFEX $%&bek%>0,
				{
					READ -*,%&bek%,&bel,&be4
					MSTR* * &bem=<8>&bel
					FIND $%&bem%<>,
					{
						ENVI @&ErrSTR=%&bem%
						EXIT
					}
				}
			}
			FIND $%&Mode%=-S,
			{
				ENVI @@Visible=%&be3%:*0
				ENVI &beh=1
				LOOP #%&beh%>0,
				{*
					ENVI @@POS=%&be3%:::::::1
					ENVI @@SENDMSG=%&be8%;%&BM_CLICK%;0;0
					ENVI @@IsWindow=?%&be3%:&beh
				}
				ENVI @&StopCode5=1
				KILL *force *%&UiPid%
			}!   
			{
				ENVI @@POS=%&be3%:::::::1
				WAIT *=%&bei%
			}
		}
	}
	IFEX $%&forceStop3%=0,
	{
		ENVI @&StopCode3=0
		ENVI @&Timer3=1
	}
_END
_SUB waitUiWindow
	IFEX $%&StopCode4%=1, EXIT
	ENVI @&StopCode4=1
	ENVI @&Timer4=0
	FIND --pid*.%&UiPid% &br1,
	ENVI @@Enable=?%&WriteButtonHid%:&br2
	IFEX $[ ( %&br2%>0 & %&WriteButtonHid%>0 ) | %&br1%=0 ],
	{
		ENVI @&forceStop3=1
		ENVI @&Timer1=0
		ENVI @&Timer2=0
		ENVI @&Timer3=0
		FIND $%&ErrSTR%=,
		{
			FIND --forpid:%&UiPid% --class:TfrmUSBWrite --wid* &bn3,
			IFEX $%&bn3%>0,
			{
				FIND --wid*@%&bn3% &bn4,
				LPOS* * &bn5=100.00%,1,&bn4
				IFEX $%&bn5%>0, ENVI @&ErrSTR=成功 ！
			}
		}
		LPOS* * &bn1=成功,1,&ErrSTR
		LPOS* * &bn2=successfully,1,&ErrSTR
		IFEX $[ %&bn1%>0 | %&bn2%>0 ],
		{
			ENVI @&ExitCODE=0
		}!   
		{
			IFEX $%&ExitCODE%=0,
			{
				ENVI @&ExitCODE=27
				FIND $%&ErrSTR%=, ENVI @&ErrSTR=写入失败 ！
			}
		}
		ENVI @&StopCode5=1
		KILL *force *%&UiPid%
		IFEX $%&ChildTid3%>0, WAIT *=%&ChildTid3%
		IFEX $%&ThisChildWid%>0, ENVI @@SENDMSG=%&ThisChildWid%;#1
		FIND $%&Mode%<>-S,
		{
			IFEX $%&ExitCODE%=0, MESS=. 成功完成 ！ @提示   #OK *5000! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
		}
		KILL @@%&thisWid%
		EXIT
	}
	ENVI @&StopCode4=0
	ENVI @&Timer4=1
_END
_SUB autoSEL
	ENVI @@SENDMSG=%2;%&CB_SETCURSEL%;0;0
	ENVI @@SENDMSG=%2;%&WM_LBUTTONDOWN%;0;0
	ENVI &bf1=0
	LOOP #%&bf1%<%1,
	{*
		CALC #&bf1=%&bf1%+1
		ENVI @@SENDMSG=%2;%&WM_KEYDOWN%;%&VK_DOWN%;1
	}
	ENVI @@SENDMSG=%2;%&WM_KEYDOWN%;%&VK_RETURN%;1
_END
_SUB getListText *
	ENVI @@SENDMSG=:&bg1;%1;%&CB_GETLBTEXTLEN%;%2;0
	IFEX $[ %&bg1%>=0 & %&bg1%<>0xFFFFFFFF ],
	{*
		CALC #&bg2=%&bg1%+100
		ENVI$ %3=*%&bg2% 0
		ENVI @@SENDMSG=%1;%&CB_GETLBTEXT%;%2;@%3
	}!   
	{*
		ENVI %3=
	}
_END
_SUB GetDrv
	ENVI &bj1=*
	PART list part %2,&bj2
	FIND *&bj2<>,
	{*
		SED -ex &bj3=0,[-\@][1-9][0-9]*[ ]*,,&bj2
		FORX *v &bj3,&bj4,
		{*
			PART -iv=8 -fill list part %2:%&bj4%,&bj1
			FIND $%&bj1%<>*, EXIT
		}
	}
	FIND $%&bj1%=*, EXIT= 0! EXIT= 1
_END
_SUB getDevId
	ENVI &bi1=PhysicalDrive%~1
	PART -devid list disk %~1,&bi2
	MSTR * &bi3,&bi4=<2><-1>&bi2
	MSTR * -delims:\ &bi5=<2>&bi4
	SED -ex &bi6=1,DISK\&VEN_,,&bi5
	SED -ex &bi7=1,\&PROD,,&bi6
	SED -ex &bi8=1,\&REV,,&bi7
	SED -ex &bi9=0,_,,&bi8
	REGI *$HKLM\SYSTEM\CurrentControlSet\Enum\%&bi4%\HardwareID,&bia
	REGI *$HKLM\SYSTEM\CurrentControlSet\Enum\%&bi4%\CompatibleIDs,&bib
	FORX *NL &bib,&bic, SED -ts -ex -ex -ex &bia=0,&bic,,&bia
	READ -*,1,&bid,&bia
	SED -ex &bie=0,_,,&bid
	FIND *&bie<>&bi9, REGI $HKLM\SYSTEM\ControlSet001\Enum\%&bi4%\FriendlyName,&bid
	ENVI< &bi1=%&NL%%&bid%
	CALL CalcSize &bif %&bi3%
	ENVI &big=%&NL%(%&bif%)%&NL%
	FORX *NL &bi1,&bih,
	{*
		MSTR * &bii=1,28,&bih
		ENVI< &big=%&NL%%&bii%
		ENVI< &big=%&NL%(%&bif%)%&bii%
		ENVI< &big=%&NL%%&bii% (%&bif%)%&NL%
	}
	SED -ex &bij=0,_, ,&big
	ENVI-ret %2=%&bij%
	ENVI-ret %3=%&bi5%
_END
_SUB CalcSize
	TEAM                                                                ENVI &bs1=1|                      ENVI &bs2= B   //Byte
	IFEX $[ %2>=1000 & %2<1000000 ],                               TEAM ENVI &bs1=1000|                   ENVI &bs2= KB  //KiloByte  （10的3次幂）
	IFEX $[ %2>=1000000 & %2<1000000000 ],                         TEAM ENVI &bs1=1000000|                ENVI &bs2= MB  //MegaByte  （10的6次幂）
	IFEX $[ %2>=1000000000 & %2<1000000000000 ],                   TEAM ENVI &bs1=1000000000|             ENVI &bs2= GB  //GigaByte  （10的9次幂）
	IFEX $[ %2>=1000000000000 & %2<1000000000000000 ],             TEAM ENVI &bs1=1000000000000|          ENVI &bs2= TB  //TeraByte  （10的12次幂）
	IFEX $[ %2>=1000000000000000 & %2<1000000000000000000 ],       TEAM ENVI &bs1=1000000000000000|       ENVI &bs2= PB  //PetaByte  （10的15次幂）
	IFEX $[ %2>=1000000000000000000 & %2<1000000000000000000000 ], TEAM ENVI &bs1=1000000000000000000|    ENVI &bs2= EB  //ExaByte   （10的18次幂）
	IFEX $%2>=1000000000000000000000,                              TEAM ENVI &bs1=1000000000000000000000| ENVI &bs2= ZB  //ZettaByte （10的21次幂）
	^CALC &bs3=%2/%&bs1%#0
	ENVI-ret %1=%&bs3%%&bs2%
_END
_SUB SendKeyDownMsg
	ENVI &bo1=0
	LOOP #%&bo1%<%1,
	{*
		ENVI @@SENDMSG=%2;%3;%4;1
		CALC #&bo1=%&bo1%+1
	}
_END
_SUB monitorXpressBoot
	IFEX $%&StopCode8%=1, EXIT
	ENVI @&StopCode8=1
	ENVI @&Timer8=0
	FIND --forpid:%&UiPid% --class:#32768 --wid* &bp1,
	IFEX $%&bp1%>0,
	{
		ENVI @@POS=?%&bp1%:::&bp3:&bp4
		CALC #&bp9=%&bp3%*3
		ENVI @@POS=%&bp1%:-%&bp9%:-%&bp4%
		FIND $%&XpressBootTitle%=USB-HDD,             TEAM ENVI &bp7=4| ENVI &bp8=1
		FIND $%&XpressBootTitle%=USB-HDD+,            TEAM ENVI &bp7=4| ENVI &bp8=2
		FIND $%&XpressBootTitle%=USB-ZIP+,            TEAM ENVI &bp7=4| ENVI &bp8=3
		FIND $%&XpressBootTitle%=RAW,                 TEAM ENVI &bp7=4| ENVI &bp8=4
		FIND $%&XpressBootTitle%=Win9x,               TEAM ENVI &bp7=7| ENVI &bp8=2
		FIND $%&XpressBootTitle%=WinXP/2K/NT,         TEAM ENVI &bp7=7| ENVI &bp8=3
		FIND $%&XpressBootTitle%=WinNT/2K/XP,         TEAM ENVI &bp7=7| ENVI &bp8=3
		FIND $%&XpressBootTitle%=Win10/8.1/8/7/Vista, TEAM ENVI &bp7=7| ENVI &bp8=4
		FIND $%&XpressBootTitle%=WinVista/7/8,        TEAM ENVI &bp7=7| ENVI &bp8=4
		FIND $%&XpressBootTitle%=MSDOS 6.22,          TEAM ENVI &bp7=7| ENVI &bp8=5
		FIND $%&XpressBootTitle%=PCDOS 7.1,           TEAM ENVI &bp7=7| ENVI &bp8=6
		FIND $%&XpressBootTitle%=FreeDOS,             TEAM ENVI &bp7=7| ENVI &bp8=7
		FIND $%&XpressBootTitle%=EasyBoot,            TEAM ENVI &bp7=7| ENVI &bp8=8
		FIND $%&XpressBootTitle%=Syslinux,            TEAM ENVI &bp7=7| ENVI &bp8=9
		FIND $%&XpressBootTitle%=grldr,               TEAM ENVI &bp7=7| ENVI &bp8=10
		CALL SendKeyDownMsg %&bp7% %&bp1% %&WM_KEYDOWN% %&VK_DOWN%
		CALL SendKeyDownMsg 1 %&bp1% %&WM_KEYDOWN% %&VK_RIGHT%
		FIND --forpid:%&UiPid% --class:#32768 --wid* &bp2,
		IFEX $[ %&bp2%<>%&bp1% & %&bp2%>0 & ( %&bp7%=4 | %&bp7%=7 ) ],
		{
			ENVI @@POS=?%&bp2%:::&bp5:&bp6
			CALC #&bpa=%&bp5%*3
			ENVI @@POS=%&bp2%:-%&bpa%:-%&bp6%
			CALL SendKeyDownMsg %&bp8% %&bp2% %&WM_KEYDOWN% %&VK_DOWN%
			CALL SendKeyDownMsg 1 %&bp2% %&WM_KEYDOWN% %&VK_RETURN%
			ENVI @@POSTMSG=%&thisWid%;#9   //checkXpressBootChildWid
			EXIT
		}
	}
	IFEX $%&XpressBootTotalTime%>100,
	{
		ENVI @&ExitCODE=32
		ENVI @&ErrSTR=打开“便捷启动”功能失败，请重试 ！
		FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
		ENVI @&StopCode5=1
		KILL *force *%&UiPid%
		KILL @@%&thisWid%
		EXIT
	}
	CALC #&_XpressBootTotalTime=%&XpressBootTotalTime%+1
	ENVI @&XpressBootTotalTime=%&_XpressBootTotalTime%
	IFEX $%&forceStop3%=0,
	{
		ENVI @&StopCode8=0
		ENVI @&Timer8=1
	}
_END
_SUB checkXpressBootChildWid
	IFEX $%&StopCode9%=1, EXIT
	ENVI @&StopCode9=1
	ENVI @&Timer9=0
	FIND --forpid:%&UiPid% --class:TMessageForm --wid* &bqp,
	IFEX $%&bqp%>0,
	{
		ENVI @&StopCode5=1
		KILL *force *%&UiPid%
		ENVI @&ExitCODE=35
		ENVI @&ErrSTR=UltraISO 内存冲突 ！
		KILL @@%&thisWid%
		EXIT
	}
	FIND --forpid:%&UiPid% --class:#32770 --wid*@ &bq1,
	FIND $%&bq1%=,
	{
		FIND --forpid:%&UiPid% --class:TfrmPart --wid* &bqt,
		IFEX $%&bqt%>0,
		{
			FIND --wid*@%&bqt% &bqu,
			@FIND $%&bqu%<>,
			{
				KILL @@%&bqt%
				FORX *NL &bqu,&bqv,
				{
					MSTR* * &bqw=<2>&bqv
					KILL @@%&bqw%
				}
				IFEX $%&XpressBootRetryTime%>8,
				{
					ENVI @&ExitCODE=33
					ENVI @&ErrSTR=打开指定参数“%&XpressBootTitle%”失败，请重试 ！
					FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
					ENVI @&StopCode5=1
					KILL *force *%&UiPid%
					KILL @@%&thisWid%
					EXIT _SUB
				}!   
				{
					CALC #&_XpressBootRetryTime=%&XpressBootRetryTime%+1
					ENVI @&XpressBootRetryTime=%&_XpressBootRetryTime%
					ENVI @&StopCode8=0
					ENVI @&StopCode9=0
					ENVI @@POSTMSG=%&thisWid%;#8   //monitorXpressBoot
					ENVI @@SENDMSG=%&XpressBootButtonHid%;%&BM_CLICK%;0;0
					EXIT _SUB
				}
			}
		}
		FIND --pid*.%&UiPid% &bqo,
		IFEX $[ %&XpressBootChildWidTotalTime%>100 | %&ShowXpressBootChildWindowTime%=2 | %&bqo%=0 ],
		{
			ENVI @&StopCode5=1
			KILL *force *%&UiPid%
			IFEX $[ '%&ErrSTR%'='' & %&ShowXpressBootChildWindowTime%=2 ],
			{
				ENVI @&ExitCODE=29
				ENVI @&ErrSTR=用户取消 ！
			}!   
			{
				FIND $%&ErrSTR%=,
				{
					ENVI @&ExitCODE=34
					ENVI @&ErrSTR=失败 ！
				}!   
				{
					LPOS* * &bqm=成功,1,&ErrSTR
					LPOS* * &bqn=successfully,1,&ErrSTR
					IFEX $[ %&bqm%>0 | %&bqn%>0 ],
					{
						ENVI @&ExitCODE=0
					}!   
					{
						ENVI @&ExitCODE=34
					}
				}
			}
			KILL @@%&thisWid%
			EXIT
		}!   
		{
			IFEX $%&ShowXpressBootChildWindowTime%>1,
			{
				CALC #&_XpressBootChildWidTotalTime=%&XpressBootChildWidTotalTime%+1
				ENVI @&XpressBootChildWidTotalTime=%&_XpressBootChildWidTotalTime%
			}
		}
	}
	FORX *NL &bq1,&bq2,
	{
		MSTR* * &bq3=<2>&bq2
		ENVI @@Visible=?%&bq3%:&bq4
		IFEX $%&bq4%<1, EXIT -
		FIND --wid*@%&bq3% &bq5,
		LPOS* * ,&bq6=%&TAB%Button%&TAB%,1,&bq5
		LPOS* * ,&bq7=%&TAB%Button%&TAB%,2,&bq5
		LPOS* * ,&bq8=&S,1,&bq5
		IFEX $%&bq8%>0, EXIT -
		READ -*,%&bq6%,&bq9,&bq5
		MSTR* * &bqa=<2>&bq9
		ENVI &XpressBootTitle3=%&XpressBootTitle%
		IFEX $%&bq7%>0,
		{
			ENVI @@Visible=%&bq3%:*0
			IFEX $%&ShowXpressBootChildWindowTime%=0,
			{
				LPOS* * &bqb= %&XpressBootTitle% ,1,&bq5
				IFEX $[ %&bqb%<1 & '%&XpressBootTitle2%'<>'' ],
				{*
					LPOS* * &bqb= %&XpressBootTitle2% ,1,&bq5
					IFEX $%&bqb%>0, ENVI &XpressBootTitle3=%&XpressBootTitle2%
				}
				IFEX $%&bqb%<1,
				{
					IFEX $%&XpressBootRetryTime%>8,
					{
						KILL @@%&bq3%
						ENVI @&ExitCODE=33
						ENVI @&ErrSTR=打开指定参数“%&XpressBootTitle%”失败，请重试 ！
						FIND $%&Mode%<>-S,!! MESS=.+icon6 %&ErrSTR% @错误:%&ExitCODE%   #OK *5000
						ENVI @&StopCode5=1
						KILL *force *%&UiPid%
						KILL @@%&thisWid%
						EXIT _SUB
					}!   
					{
						READ -*,%&bq7%,&bqq,&bq5
						MSTR* * &bqr=<2>&bqq
						ENVI &bqs=1
						LOOP #%&bqs%>0,
						{*
							ENVI @@POS=%&bq3%:::::::1
							ENVI @@SENDMSG=%&bqr%;%&BM_CLICK%;0;0
							ENVI @@IsWindow=?%&bq3%:&bqs
						}
						CALC #&_XpressBootRetryTime=%&XpressBootRetryTime%+1
						ENVI @&XpressBootRetryTime=%&_XpressBootRetryTime%
						ENVI @&StopCode8=0
						ENVI @&StopCode9=0
						ENVI @@POSTMSG=%&thisWid%;#8   //monitorXpressBoot
						ENVI @@SENDMSG=%&XpressBootButtonHid%;%&BM_CLICK%;0;0
						EXIT _SUB
					}
				}
			}
			FIND $%&Mode%=-S,
			{
				ENVI &bqc=1
				LOOP #%&bqc%>0,
				{*
					ENVI @@POS=%&bq3%:::::::1
					ENVI @@SENDMSG=%&bqa%;%&BM_CLICK%;0;0
					ENVI @@IsWindow=?%&bq3%:&bqc
				}
				IFEX $%&ShowXpressBootChildWindowTime%=0, ENVI @&ShowXpressBootChildWindowTime=1
			}!   
			{
				IFEX $%&ShowXpressBootChildWindowTime%=0,
				{
					MESS=.+icon1 确定将 %&XpressBootTitle3% %&XpressBootText%写入设备 %&DiskDrive% ？ @警告#yn
					FIND $%YESNO%=NO,
					{
						READ -*,%&bq7%,&bqd,&bq5
						MSTR* * &bqe=<2>&bqd
						ENVI &bqf=1
						LOOP #%&bqf%>0,
						{*
							ENVI @@POS=%&bq3%:::::::1
							ENVI @@SENDMSG=%&bqe%;%&BM_CLICK%;0;0
							ENVI @@IsWindow=?%&bq3%:&bqf
						}
						ENVI @&ShowXpressBootChildWindowTime=2
					}!   
					{
						ENVI &bqg=1
						LOOP #%&bqg%>0,
						{*
							ENVI @@POS=%&bq3%:::::::1
							ENVI @@SENDMSG=%&bqa%;%&BM_CLICK%;0;0
							ENVI @@IsWindow=?%&bq3%:&bqg
						}
						ENVI @&ShowXpressBootChildWindowTime=1
					}
				}!   
				{
					IFEX $%&ShowXpressBootChildWindowTime%<>%&bq3%,
					{
						ENVI @@POS=%&bq3%:::::::1
						ENVI @&ShowXpressBootChildWindowTime=%&bq3%
					}
				}
			}
		}
		IFEX $[ %&bq6%>0 & %&bq7%<1 ],
		{
			RPOS* * ,&bqk=%&TAB%Static%&TAB%,1,&bq5
			FORX *v &bqk,&bql,
			{
				IFEX $%&bql%>0,
				{
					READ -*,%&bql%,&bqi,&bq5
					MSTR* * &bqj=<8>&bqi
					FIND $%&bqj%<>,
					{
						ENVI @&ErrSTR=%&bqj%
						EXIT
					}
				}
			}
			FIND $%&Mode%=-S,
			{
				ENVI @&XpressBootChildWidTotalTime=0
				ENVI @&ShowXpressBootChildWindowTime=%&bq3%
				ENVI @@Visible=%&bq3%:*0
				ENVI &bqh=1
				LOOP #%&bqh%>0,
				{*
					ENVI @@POS=%&bq3%:::::::1
					ENVI @@SENDMSG=%&bqa%;%&BM_CLICK%;0;0
					ENVI @@IsWindow=?%&bq3%:&bqh
				}
				ENVI @&StopCode5=1
				KILL *force *%&UiPid%
			}!   
			{
				IFEX $%&ShowXpressBootChildWindowTime%<>%&bq3%,
				{
					ENVI @@POS=%&bq3%:::::::1
					ENVI @&ShowXpressBootChildWindowTime=%&bq3%
					ENVI @&XpressBootChildWidTotalTime=0
				}
			}
		}
	}
	IFEX $%&forceStop3%=0,
	{
		ENVI @&StopCode9=0
		ENVI @&Timer9=1
	}
_END
_SUB helpTips
ENVI &helpTEXT=%&NL%
\%&NL%格式：%&baa%  UI:UltraISO.exe路径  ISO:映像文件路径  mode:是否静默  drv:盘符  disk:磁盘物理序号  MBR:写入方式  HidePart:隐藏启动分区  ShowProgress:是否显示进度  ResMbr:快捷写入MBR  ResDbr:快捷写入DBR
\%&NL%示例：%&baa%  "iso:E:\2K3   2.ISO"  MODE:-s  disk:5  "MBR:USB-HDD+ v2"  HidePart:高端隐藏  ShowProgress:-y-c
\%&NL%示例：%&baa%  UI:C:\UltraISO.exe  iso:E:\A.ISO  DRV:Z
\%&NL%
\%&NL%参数解释：（各参数间无先后之分）
\%&NL%UI:UltraISO.exe路径：优先使用参数指定，省略此参数则用当前目录中的UltraISO，最后用系统中安装的UltraISO。
\%&NL%ISO:映像文件路径：要写入U盘的ISO文件。
\%&NL%mode:是否静默：-S 表示静默，省略表示有提示。
\%&NL%drv:盘符：目标U盘。drv和disk参数只能二选一，优先drv。
\%&NL%disk:磁盘物理序号：目标U盘，同drv。此为 BIOS 中的排序，从0开始。也可指定“硬盘驱动器”下拉框中的索引项，如 disk:L2 或 disk:L3 等。
\%&NL%MBR:写入方式：支持“USB-HDD、USB-ZIP、USB-HDD+、USB-ZIP+、USB-HDD+ v2、USB-ZIP+ v2、RAW”七种MBR类型。省略表示默认。指定了不支持的参数则拒绝运行。
\%&NL%HidePart:隐藏启动分区：“无、隐藏、高端隐藏、深度隐藏” 等参数。省略表示默认。指定了不支持的参数则拒绝运行。也可用L1、L2、L3、L4表示。
\%&NL%ShowProgress:是否显示进度：-Y 表示自画进度条。-Y-C 表示有“取消”按钮。-UI 表示 UltraISO 原生进度条。-UI-C 表示有“终止”按钮。省略表示不显示进度。-UI-P 表示操作仅交还用户，程序不再干预。
\%&NL%ResMbr:快捷写入MBR：“便捷启动”中的功能，如果指定了此参数，ShowProgress和MBR参数将失效，不再写入ISO。支持“USB-HDD、USB-HDD+、USB-ZIP+、HDD”四种MBR类型。ResMbr优先于ResDbr，两都不能共存。
\%&NL%ResDbr:快捷写入DBR：“便捷启动”中的功能，如果指定了此参数，ShowProgress和MBR参数将失效，不再写入ISO。支持“Win9x、NT5、NT6、MSDOS、PCDOS、FreeDOS、EasyBoot、Syslinux、grldr”九种DBR类型。
\%&NL%
\%&NL%本工具网址：   http://bbs.wuyou.net/forum.php?mod=viewthread&tid=419985&fromuid=378114
\%&NL%PECMD技术社区：https://pecmd.net/
WRIT -,$+0,%&helpTEXT%
FIND $%&Mode%<>-S,!! MESS+icon %&helpTEXT%@帮助#OK
_END
