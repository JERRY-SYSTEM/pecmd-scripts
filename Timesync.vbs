code=936T950
ENVI^ EnviMode=1
ENVI^ ForceLocal=1
ENVI$ &NL=0D 0A
ENVI$ &TAB=09
ENVI &Win_Title=< 时间校对 >制作：JexChan  QQ：527104427
MSTR * &Build=<-1>&PECMDBUILD
SED &Build=0,[^0-9],,%&Build%
IFEX $[ %&PECMDVER%<201201880585 | %&Build%<20210321 ], TEAM MESS+icon6 %&NL%%&NL%PECMD 版本低于 201201.88.05.85  Build: 2021-03-21，程序无法运行！ @%&Win_Title%   #OK*5000| EXIT
ENVI &::WM_TRAYNOTIFY=1109
ENVI &::WS_EX_CONTROLPARENT=0x00010000
ENVI &::WM_LBUTTONDBLCLK=0x0203
ENVI &::WM_LBUTTONDOWN=0x0201
ENVI &::WM_RBUTTONDOWN=0x0204
ENVI &::WM_MOUSEENTER=0x1000
ENVI &::WM_MOUSELEAVE=0x02A3
ENVI &::WM_KEYDOWN=0x0100
CALL * SetDEFserver
CALL * chkWCSorEXE
CALL * SetINIserver
ENVI &Tray=0
ENVI &Defpage=1
ENVI &ExitCODE=0
ENVI &PageCODE=0
FIND $%~1<>,
{*
	ENVI &bz2=1
	ENVI &bzc=%#
	LOOP #%&bz2%<%&bzc%,
	{*
		MSTR &bz1=<~%&bz2%>%*
		FIND $%&bz1%=--Tray,                            TEAM                                       ENVI &Tray=1|     CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--AutoNetTime,                     TEAM THREAD* CALL AutoNetTime|             ENVI &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--Reg-AutoNetTime,                 TEAM CALL Reg_unReg_NetTime|               ENVI &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--UnReg-AutoNetTime,               TEAM CALL Reg_unReg_NetTime --U|           ENVI &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--Deskclock,!! FIND $%&regCMD%=,!! TEAM EXEC -incmd PECMD EXEC -exe:*#999|    ENVI &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		TEAM MSTR * &bz3=1,6,&bz1| MSTR * &bz4=7,1,&bz1| MSTR * &bz5=8,1,&bz1
		IFEX $[ '%&bz3%'='--PAGE' & %&bz4%>=1 & %&bz4%<=2 & '%&bz5%'='' ], TEAM ENVI &PageCODE=1| ENVI &Defpage=%&bz4%
		CALC #&bz2=%&bz2%+1
	}
}
IFEX $[ %&ExitCODE%=1 & %&PageCODE%=0 & %&Tray%=0 ], TEAM WAIT -thread| EXIT
CALL SETdpi
CALL SETfont
DATE &DateTime     //2020-2-11|2|14:12:34.692    //年-月-日|星期|时:分:秒.毫秒
MSTR * -delims:| &Date,&Time=<1><3>&DateTime
MSTR * -delims:. &Milliseconds=<2>&DateTime
CALL @WIN0 %*
WAIT -thread
EXIT
_SUB WIN0,#
	ENVI &WID0=%&__WinID%
	ENVI @this.Visible=0
	EDIT &WID1,L0T0W0H0,%&WID0%,,0x18
	EDIT &ExitCode,L0T0W0H0,0,,0x18
	WAIT 0.9
	ENVI @this.MSG=_%&WM_TRAYNOTIFY%::&wp,&lp, CALL DoMenu %&wp% %&lp%
	ENVI @this.MSG=_#1: TEAM ENVI @&ExitCode=1| TIPS* 时间校对,,,,%MyName%#1
	ENVI @this.MSG=_#2: TEAM ENVI @&ExitCode=0| TIPS*
	ENVI @this.MSG=_#3::&wParam,, TEAM ENVI-mkfixdummy &wp=%&wParam%| ENVI @&WID1=%&wp%
	IFEX $%&Tray%=0, CALL @WIN1 %*! ENVI @@POSTMSG=%&WID0%;#1
_END
_SUB WIN1,W543H500,%&Win_Title%,CALL ExitCMD,%&MyName%,,, %&ScaleCMD%
	%&Font_Cmd%
	ENVI @@SENDMSG=%&WID0%;#3;$%&__WinID%;
	TABS &TS1,L21T17W497H432,Page1:-:网络对时;Page2:-:命令行:,
	EDIT &DisOrShowTimer1,L0T0W0H0,1,,0x18
	EDIT &DisOrShowTimer2,L0T0W0H0,1,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	ENVI @&TS1.style=:%WS_EX_CONTROLPARENT%
	ENVI @&TS1.MSG=_%&WM_LBUTTONDOWN%: CALL DisOrShowTimer
	ENVI @&TS1.MSG=_%&WM_KEYDOWN%::&am1,&am2, CALL HotKey
	CALL Cursor &TS1
	IFEX $%&Defpage%<>1, TEAM ENVI @&DisOrShowTimer1=0| ENVI @Page1:&T1=0
	ENVI @&TS1.Select=%&Defpage%
_END
_SUB Page1,W496H441,
	%&Font_Cmd%
	EDIT &IPAddress,L1T1W1H1,,,0x18
	LABE ,L39T24W81H23,服务器：,,
	LIST -h &L2,L86T20W229H200,%&AllName%,CALL SetAddress,%&AddName1%,0x10100
	CHEK &CG,L322T16W48H30,内置,CALL CheckServer,
	ITEM &I7,L370T19W83H22,重新解析域名,CALL reSetAddress,
	LABE -3D,L-8T57W512H2,,,
	LABE ,L39T80W81H23,IP地址：,,
	IPAD &IP1,L87T75W176H24,%&Address1_1%,
	IPAD &IP2,L276T75W176H24,%&Address1_2%,
	IPAD &IP3,L87T114W176H24,%&Address1_3%,
	IPAD &IP4,L276T114W176H24,%&Address1_4%,
	LABE -3D,L-8T153W512H2,,,
	LABE ,L39T178W81H23,网络时间：,,
	DTIM &D7,L100T172W207H24,%&Date%,,0x30
	DTIM &D8,L315T172W137H24,%&Time%,,0x50
	EDIT+ -3D &E5,L100T172W207H24,,, //0x18
	EDIT+ -3D &E6,L315T172W137H24,,, //0x18
	LABE ,L39T218W81H23,本地时间：,,
	DTIM &D9,L100T212W207H24,%&Date%,,0x20
	DTIM &DA,L315T212W137H24,%&Time%,,0x40
	LABE -3D,L-8T252W512H2,,,
	LABE ,L39T273W69H23,计划任务：,,
	LABE ,L118T273W108H23,自动校时频率：,,
	LIST -h &L3,L201T269W75H200,每月|每周|每天|每小时|每分钟|每次开机|每次登陆,,每天,
	ITEM &I8,L308T268W67H22,添加任务,CALL AddPlanTask,
	ITEM &I9,L386T268W67H22,删除任务,CALL DelPlanTask,
	LABE ,L39T313W81H23,开始时间：,,
	DTIM &DB,L100T307W207H24,%&Date%,,0x20
	DTIM &DC,L315T307W137H24,%&Time%,,0x40
	LABE -3D,L-8T348W512H2,,,
	CHEK &CB,L39T366W70H30,开机对时,CALL CheckReg_NetTime,
	CHEK &CC,L114T366W70H30,托盘图标,CALL SetTray,%&ExitCode%
	FIND $%&regCMD%=, ITEM &ID,L187T367W86H26,桌面时钟挂件,EXEC -incmd PECMD EXEC -exe:*#999
	ITEM &IB,L277T367W86H26,同步网络时间,CALL synNETtime -q,
	ITEM &IA,L367T367W86H26,获取网络时间,CALL synNETtime -qo,
	TIME &T1,100,THREAD* CALL OnLocalTime
	TIME &T2,0,THREAD* CALL OnNetTime
	WAIT 0.9
	ENVI @&L2.MSG=%&WM_MOUSEENTER%: CALL Mouse_In "" "%&L2%"
	ENVI @&L2.MSG=%&WM_MOUSELEAVE%: TIPS -
	THREAD* CALL Monitor_Reg_NetTime
	CALL Cursor &D7 &D8 &D9 &DA &CB &CG &I7 &I8 &I9 &IA &IB &ID
_END
_SUB Page2,W496H441,
	%&Font_Cmd%
	FNAM -ext &ak1="%&MyName%"
	FNAM -ext &ak4="%&iniFILE%"
	FIND $%&regCMD%=, SET &ak2=%&ak1%! SET &ak2=PECMD.EXE %&regCMD%
	SET  &ak3=%&NL%   --Tray                    启动到托盘
	SET< &ak3=%&NL%   --Page(n)                 切换属性页。例：--Page1
	FIND $%&regCMD%=,
	{*
	SET< &ak3=%&NL%   --Deskclock               桌面时钟挂件
	}
	SET< &ak3=%&NL%   --AutoNetTime             静默同步网络时间
	SET< &ak3=%&NL%   --Reg-AutoNetTime         开机自动同步网络时间
	SET< &ak3=%&NL%   --UnReg-AutoNetTime       取消开机自动同步网络时间%&NL%
	SET< &ak3=%&NL%   当本程序同目录下存在“%&ak4%”时，将自动读取此文件，
	SET< &ak3=%&NL%   用于配置网络服务器。格式如下：%&NL%
	SET< &ak3=%&NL%    1    国家授时中心   ntp.ntsc.ac.cn     114.118.7.163     114.118.7.161
	SET< &ak3=%&NL%    2    阿里云1        ntp1.aliyun.com    120.25.115.20
	SET< &ak3=%&NL%    3    阿里云2        ntp2.aliyun.com    203.107.6.88%&NL%
	SET< &ak3=%&NL%   第1列序号，第2列服务器名，第3列域名，第4~8列为IP地址%&NL%
	SET< &ak3=%&NL%   示例：%&NL%
	SET< &ak3=%&NL%   %&ak2%  --Page1
	SET< &ak3=%&NL%   %&ak2%  --Reg-AutoNetTime%&NL%
	SET< &ak3=%&NL%   PECMD技术社区：  https://pecmd.net/
	SET< &ak3=%&NL%   本人博客：       http://blog.sina.com.cn/a527104427
	SET< &ak3=%&NL%   本工具网址：     http://bbs.wuyou.net/forum.php?mod=viewthread&tid=419224&fromuid=378114
	EDIT+-| ,L0T1W492H408,%&ak3%,,0x8
	WAIT 0.9
_END
_SUB ExitCMD
	IFEX $%&ExitCode%=0, KILL @@%&WID0% //KILL *force *%&__PID%
_END
_SUB SetTray
	IFEX $%&CC.Check%=1, ENVI @@POSTMSG=%&WID0%;#1! ENVI @@POSTMSG=%&WID0%;#2
_END
_SUB DoMenu
	IFEX $%&WM_LBUTTONDBLCLK%=%2, TEAM CALL OnShow| EXIT
	IFEX $%&WM_RBUTTONDOWN%=%2, CALL @--popmenu rightMENU
_END
_SUB OnShow
	FIND --forpid:%&__PID% --class:#32770 --wid*@ &AllWidStr,
	LPOS* * ,&Pos=%&Win_Title%,1,&AllWidStr
	IFEX #%&Pos%>0,
	{
		READ -*,%&Pos%,&WidStr,&AllWidStr
		MSTR* * &MainWid=<2>&WidStr
		ENVI @@Visible=%&MainWid%:2
		ENVI @@POS=%&MainWid%:::::::1
	}!   
	{
		CALL @WIN1
	}
_END
_SUB rightMENU
	MENU ,显示主窗口, CALL OnShow
	MENU -
	MENU ,同步网络时间（静默）, CALL AutoNetTime
	MENU -
	MENU ,退出, TEAM TIPS*| KILL @@%&WID0%| KILL @@%&WID1% //KILL *force *%&__PID%
_END
_SUB AutoNetTime
	SED -ex &aj6=0,|,%&NL%,&AllName
	READ -*,-1,&aj7,&aj6
	SET &aj1=1
	SET &ajt=
	LOOP #%&aj1%<%&aj7%,
	{*
		^MSTR * &aj5,&aj8=<2><3>&AddName%&aj1%
		^FIND $[ '%%&Address%&aj1%_1%%'='' & '%%&aj5%%'<>'默认服务器' ],!! TEAM CALL lookupAddress| ^IFEX $%%&error%%<>0,!! TEAM CALC #&aj1=%&aj1%+1|| EXIT -
		^EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC -q %%&Address%&aj1%_1%%
		IFEX $%&error%=0,
		{
			EXIT
		}!   
		{
			^FIND $%%&Address%&aj1%_2%%<>,
			{
				^EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC -q %%&Address%&aj1%_2%%
				IFEX $%&error%=0, EXIT
				^FIND $%%&Address%&aj1%_3%%<>,
				{
					^EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC -q %%&Address%&aj1%_3%%
					IFEX $%&error%=0, EXIT
					^FIND $%%&Address%&aj1%_4%%<>,
					{
						^EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC -q %%&Address%&aj1%_4%%
						IFEX $%&error%=0, EXIT
						^FIND $%%&Address%&aj1%_5%%<>,
						{
							^EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC -q %%&Address%&aj1%_5%%
							IFEX $%&error%=0, EXIT
						}
					}
				}
			}
		}
		CALC #&aj1=%&aj1%+1
		FIND $%&aj5%=默认服务器, SET &ajt=1
		IFEX $[ %&aj1%>=%&aj7% & '%&ajt%'='' ], EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC -q
	}
_END
_SUB lookupAddress *
	EXEC*- -timeout:3000:1 -err+ -incmd &aj9=pecmd TEAM EXEC*- -hide &aja="%WinDir%\system32\nslookup.exe" %&aj8%| WRIT -,$+0,%%&aja%%
	IFEX $%&error%<>0,!! TEAM EXIT=1| EXIT
	LPOS* * ,&ajb=Addresses:,1,&aj9
	IFEX $%&ajb%>0,
	{*
		CALC #&ajc=%&ajb%+1
		READ -*,%&ajb%,&ajd,&aj9
		READ -*,%&ajc%,&aje,&aj9
		MSTR * &ajf=<-1>&ajd
		MSTR * &ajg=<1>&aje
		SET &Address%&aj1%_1=%&ajf%
		SET &Address%&aj1%_2=%&ajg%
		CALC #&ajh=%&ajc%+1
		READ -*,%&ajh%,&aji,&aj9
		FIND $%&aji%<>,
		{*
			LPOS* * &ajj=:,1,&aji
			IFEX $%&ajj%<1,
			{*
				MSTR * &ajk=<1>&aji
				SET &Address%&aj1%_3=%&ajk%
				CALC #&ajl=%&ajh%+1
				READ -*,%&ajl%,&ajm,&aj9
				FIND $%&ajm%<>,
				{*
					LPOS* * &ajn=:,1,&ajm
					IFEX $%&ajn%<1,
					{*
						MSTR * &ajo=<1>&ajm
						SET &Address%&aj1%_4=%&ajo%
						CALC #&ajp=%&ajl%+1
						READ -*,%&ajp%,&ajq,&aj9
						FIND $%&ajq%<>,
						{*
							LPOS* * &ajr=:,1,&ajq
							IFEX $%&ajr%<1,
							{*
								MSTR * &ajs=<1>&ajq
								SET &Address%&aj1%_5=%&ajs%
							}
						}
					}
				}
			}
		}
	}!   
	{*
		LPOS* * ,&ajc=Address:,2,&aj9
		IFEX $%&ajc%>0,
		{*
			READ -*,%&ajc%,&ajd,&aj9
			MSTR * &aje=<-1>&ajd
			SET &Address%&aj1%_1=%&aje%
		}
	}
	^FIND $[ '%%&Address%&aj1%_1%%'='' & '%%&Address%&aj1%_2%%'='' ],!! EXIT=1
_END
_SUB Monitor_Reg_NetTime
	SET &ai2="%&MyName%" %&regCMD% --AutoNetTime
	REGI $HKCU\Software\Microsoft\Windows\CurrentVersion\Run\\AutoNetTime,&ai3
	FIND $%&ai2%=%&ai3%, ENVI @&CB.Check=1
_END
_SUB Mouse_In
	FIND $%~2=, ENVI &d2=%&NL%! ENVI &d2=%~2
	TEAM ENVI @@Cur=?&bwd;&bwe| TIPS. %~1,%&d2%,1000000000,1,@AL%&bwd%T%&bwe%
_END
_SUB OnNetTime
	ENVI @&T2=0
	NTPC -qo %&IPAddress%,&ah1  //2020-03-04:23:22:41:841257
	MSTR * -delims:: &ah2,&ah3=<1><2->&ah1
	SED &ah5=0,\-,;,%&ah2%
	SED &ah6=0,\:,;,%&ah3%
	ENVI @&D7.VAL=%&ah5%
	ENVI @&D8.VAL=%&ah6%
	IFEX $%&DisOrShowTimer2%=1, ENVI @&T2=100
_END
_SUB OnLocalTime
	ENVI @&T1=0
	DATE &ad1     //2020-2-11|2|14:12:34.692    //年-月-日|星期|时:分:秒.毫秒
	MSTR * -delims:| &ad2,&ad3=<1><3>&ad1
	SED &ad5=0,\-,;,%&ad2%
	SED &ad6=0,\:,;,%&ad3%
	ENVI @&D9.VAL=%&ad5%
	ENVI @&DA.VAL=%&ad6%
	IFEX $%&DisOrShowTimer1%=1, ENVI @&T1=100
_END
_SUB synNETtime
	ENVI @&T1=0
	ENVI @&T2=0
	SET &ag5=
	CALL getAddress
	MSTR * &ag6=<-1>&L2
	SET &ag7=-1.-1.-1.-1
	CALL SetDisable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4
	SET &ag8='%%&ag1%%'='%%&ag7%%' & '%%&ag2%%'='%%&ag7%%' & '%%&ag3%%'='%%&ag7%%' & '%%&ag4%%'='%%&ag7%%' & '%%&ag6%%'<>'默认服务器'
	^FIND $[ %&ag8% ],
	{*
		CALL reSetAddress 1
		IFEX $%&error%<>0, TEAM CALL reSETnetTIME 1 0| CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4| ENVI @&T1=100| EXIT
		CALL getAddress
		^FIND $[ %&ag8% ], TEAM MESS+icon6 %&NL%%&NL%没有指定IP地址！ @错误#OK*5000| CALL reSETnetTIME 1 0| CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4| ENVI @&T1=100| EXIT
	}
	FIND $[ '%&ag1%'='%&ag7%' & '%&ag6%'='默认服务器' ], SET &ag1=
	FIND $%&ag1%<>%&ag7%,!!                                                 TEAM EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC %1 %&ag1%| ^IFEX $%%&error%%=0,  SET &ag9=%&ag1%! SET &ag5=err
	FIND $[ '%&ag2%'<>'%&ag7%' & '%&ag6%'<>'默认服务器' & '%&ag5%'<>'' ],!! TEAM EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC %1 %&ag2%| ^IFEX $%%&error%%<>0, SET &ag9=%&ag2%! SET &ag5=err
	FIND $[ '%&ag3%'<>'%&ag7%' & '%&ag6%'<>'默认服务器' & '%&ag5%'<>'' ],!! TEAM EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC %1 %&ag3%| ^IFEX $%%&error%%<>0, SET &ag9=%&ag3%! SET &ag5=err
	FIND $[ '%&ag4%'<>'%&ag7%' & '%&ag6%'<>'默认服务器' & '%&ag5%'<>'' ],!! TEAM EXEC*- -timeout:3000:1 -err+ -incmd =pecmd NTPC %1 %&ag4%| ^IFEX $%%&error%%<>0, SET &ag9=%&ag4%! SET &ag5=err
	FIND $%&ag5%<>, TEAM MESS+icon6 %&NL%%&NL%连接服务器失败！ @错误#OK*5000| CALL reSETnetTIME 1 0| CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4| ENVI @&T1=100| EXIT
	ENVI @&DisOrShowTimer2=1
	ENVI @&IPAddress=%&ag9%
	ENVI @&T1=100
	ENVI @&T2=100
	CALL reSETnetTIME 0 1
	FIND $%1=-q, MESS+icon %&NL%%&NL%    成功完成！ @提示#OK*5000
	CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4
_END
_SUB getAddress *
	ENVI @&IP1.VAL=?.&ag1
	ENVI @&IP2.VAL=?.&ag2
	ENVI @&IP3.VAL=?.&ag3
	ENVI @&IP4.VAL=?.&ag4
_END
_SUB CheckReg_NetTime
	IFEX $%&CB.Check%=0, CALL Reg_unReg_NetTime --U! CALL Reg_unReg_NetTime
_END
_SUB Reg_unReg_NetTime
	SET &ai1=!
	FIND $%1=--U,
	{
		REGI HKCU\Software\Microsoft\Windows\CurrentVersion\Run\\AutoNetTime%&ai1%
	}!     
	{
		REGI $HKCU\Software\Microsoft\Windows\CurrentVersion\Run\\AutoNetTime="%&MyName%" %&regCMD% --AutoNetTime
	}
_END
_SUB AddPlanTask
	CALL SetDisable &I8 &I9
	ENVI @&DB.Val=?&an1;&an2;&an3
	ENVI @&DC.Val=?&an5;&an6
	STRL * &ana=&an2
	STRL * &anb=&an3
	STRL * &anc=&an5
	STRL * &and=&an6
	IFEX $%&ana%<2, ENVI> &an2=0
	IFEX $%&anb%<2, ENVI> &an3=0
	IFEX $%&anc%<2, ENVI> &an5=0
	IFEX $%&and%<2, ENVI> &an6=0
	FIND $%&L3%=每月,     SET &an8=monthly
	FIND $%&L3%=每周,     SET &an8=weekly
	FIND $%&L3%=每天,     SET &an8=daily
	FIND $%&L3%=每小时,   SET &an8=hourly
	FIND $%&L3%=每分钟,   SET &an8=minute
	FIND $%&L3%=每次开机, SET &an8=onstart
	FIND $%&L3%=每次登陆, SET &an8=onlogon
	SED &an9=0,\",\\",%&regCMD%
	SET &anf=/st %&an5%:%&an6% /sd %&an1%/%&an2%/%&an3%
	FIND $[ '%&an8%'='onstart' | '%&an8%'='onlogon' ], SET &anf=
	EXEC*- -err+ -hide &ane="%WinDir%\system32\schtasks.exe" /create /tn "AutoNetTime" /ru system /tr "'%&MyName%' %&an9% --AutoNetTime" /sc %&an8% %&anf% /f
	IFEX $%&error%=0, MESS+icon %&NL%%&NL%    添加成功！ @提示#OK*5000! TEAM FIND $%&ane%=, SET &ane=添加失败！| MESS+icon6 %&NL%%&NL%%&ane% @错误#OK*5000
	CALL SetEnable &I8 &I9
_END
_SUB DelPlanTask
	CALL SetDisable &I8 &I9
	EXEC*- -err+ -hide &ane="%WinDir%\system32\schtasks.exe" /delete /tn "AutoNetTime" /f
	IFEX $%&error%=0, MESS+icon %&NL%%&NL%    删除成功！ @提示#OK*5000! TEAM FIND $%&ane%=, SET &ane=删除失败！| MESS+icon6 %&NL%%&NL%%&ane% @错误#OK*5000
	CALL SetEnable &I8 &I9
_END
_SUB CheckServer *
	IFEX $%&CG.Check%=1, CALL * SetDEFserver! CALL * SetINIserver
	ENVI @&L2.Val=%&AllName%
	ENVI @&L2.isel=1
	CALL SetAddress
_END
_SUB SetAddress
	ENVI @&DisOrShowTimer2=0
	ENVI @&T2=0
	MSTR * &ae1=<1>&L2
	MSTR * &ae2=<-1>&L2
	FIND $%&ae2%=默认服务器,
	{
		CALL RePaintIPAD 1
		CALL RePaintIPAD 2
		CALL RePaintIPAD 3
		CALL RePaintIPAD 4
	}!   
	{
		^FIND $%%&Address%&ae1%_1%%=, CALL RePaintIPAD 1! ^ENVI @&IP1.VAL=%%&Address%&ae1%_1%%
		^FIND $%%&Address%&ae1%_2%%=, CALL RePaintIPAD 2! ^ENVI @&IP2.VAL=%%&Address%&ae1%_2%%
		^FIND $%%&Address%&ae1%_3%%=, CALL RePaintIPAD 3! ^ENVI @&IP3.VAL=%%&Address%&ae1%_3%%
		^FIND $%%&Address%&ae1%_4%%=, CALL RePaintIPAD 4! ^ENVI @&IP4.VAL=%%&Address%&ae1%_4%%
	}
	CALL reSETnetTIME 1 0
_END
_SUB RePaintIPAD
	ENVI @&IP%1.POS=?&af9:&afa:&afb:&afc
	ENVI @&IP%1.*del=
	IPAD &IP%1,L%&af9%T%&afa%W%&afb%H%&afc%,,
_END
_SUB reSETnetTIME
	ENVI @&E5.Visible=%1
	ENVI @&E6.Visible=%1
	ENVI @&D7.Visible=%2
	ENVI @&D8.Visible=%2
	ENVI @&E5=
	ENVI @&E6=
_END
_SUB Cursor
	FORX * %* ,&bwg, ENVI @%&bwg%.Cursor=32649  //32651
_END
_SUB HotKey
	IFEX $[ %&am1%=0x25 | %&am1%=0x27 ], CALL DisOrShowTimer
_END
_SUB DisOrShowTimer
	IFEX $%&TS1.Select%=1,
	{
		ENVI @&DisOrShowTimer1=1
		IFEX $%&D7.Visible%=1, TEAM ENVI @&DisOrShowTimer2=1| ENVI @Page1:&T2=100
		ENVI @Page1:&T1=100
	}!   
	{
		ENVI @&DisOrShowTimer1=0
		ENVI @&DisOrShowTimer2=0
		ENVI @Page1:&T1=0
		ENVI @Page1:&T2=0
	}
_END
_SUB SetDEFserver
	SET &AddName1=1  国家授时中心  ntp.ntsc.ac.cn
	SET &AddName2=2  NIM网络授时1(NTSS)  ntp1.nim.ac.cn
	SET &AddName3=3  NIM网络授时2(NTSS)  ntp2.nim.ac.cn
	SET &AddName4=4  阿里云1  ntp1.aliyun.com
	SET &AddName5=5  阿里云2  ntp2.aliyun.com
	SET &AddName6=6  默认服务器
	FORX * 1 2 3 4 5 6 ,&alb,
	{*
		FORX * 1 2 3 4 5 ,&alc, SET &Address%&alb%_%&alc%=
	}
	SET &Address1_1=114.118.7.163
	SET &Address1_2=114.118.7.161
	SET &Address2_1=111.203.6.13
	SET &Address3_1=111.203.6.12
	SET &Address4_1=120.25.115.20
	SET &Address5_1=203.107.6.88
	SET &AllName=|%&AddName1%|%&AddName2%|%&AddName3%|%&AddName4%|%&AddName5%|%&AddName6%
_END
_SUB SetINIserver
	READ "%&iniFILE%",**,&al1
	SET &al2=1
	FORX *NL &al1,&al3,
	{*
		IFEX $%&al2%=1, SET &AllName=
		MSTR * &al4,&al5,&al6,&al7,&al8,&al9,&ala=<2*>&al3
		FIND $%&al5%=, EXIT -
		SET &AddName%&al2%=%&al2%  %&al4%  %&al5%
		SET &Address%&al2%_1=%&al6%
		SET &Address%&al2%_2=%&al7%
		SET &Address%&al2%_3=%&al8%
		SET &Address%&al2%_4=%&al9%
		SET &Address%&al2%_5=%&ala%
		^SET< &AllName=|%%&AddName%&al2%%%
		CALC #&al2=%&al2%+1
	}
_END
_SUB chkWCSorEXE
	MSTR * &tmpSTR=-4,5,&CurFile
	FIND $%&tmpSTR%=.exe#,
	{*
		RSTR * &myWCS=4,&CurFile
		FIND $%&myWCS%=#101, ENVI &regCMD=! ENVI &regCMD=LOAD %&myWCS%
		ENVI &iniFILE=%&MyName%.ini
	}!   
	{*
		ENVI &regCMD=LOAD "%&CurFile%"
		ENVI &iniFILE=%&CurFile%.ini
	}
_END
_SUB SETdpi *
	CALL $--ret:&DPI_Aware user32.dll,SetProcessDPIAware
	CALL $--ret:&DPI_Aware user32.dll,SetProcessDPIAwareness,#1
	CALL $--qd --bool --ret:&SetProcessDpiAwarenessContextRet User32.dll,SetProcessDpiAwarenessContext,#-4
	ENVI &hdcNUM=0
	LOOP #1=1,
	{*
		CALL $--ret:&hdc user32.dll,GetDC,#0
		CALC #&hdcNUM=%&hdcNUM%+1
		IFEX $%&hdcNUM%>50, EXIT
		IFEX $%&hdc%>0, EXIT
		WAIT 0.9
	}
	ENVI &ScaleCMD=-scalef -scale
	IFEX $%&hdc%>0,
	{*
		CALL $--ret:&LOGPIXELSX Gdi32.dll,GetDeviceCaps,#%&hdc%,#88
		ENVI &ScaleCMD=-scalef:%&LOGPIXELSX% -scale:%&LOGPIXELSX%
	}
_END
_SUB SETfont *
	ENVI &Font_Size=9
	ENVI &Font_Cmd=IFEX %windir%\fonts\simsun*, ENVI @this.Font=%&Font_Size%:simsun! ENVI @this.Font=%&Font_Size%
_END
_SUB reSetAddress
	MSTR * &af1=<-1>&L2
	FIND $%&af1%=默认服务器, EXIT
	ENVI @&DisOrShowTimer2=0
	ENVI @&T2=0
	FIND $%1=, CALL SetDisable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4
	EXEC*- -timeout:3000:1 -err+ -incmd &af2=pecmd TEAM EXEC*- -hide &afz=%WinDir%\system32\nslookup.exe %&af1%| WRIT -,$+0,%%&afz%%
	IFEX $%&error%<>0,!! TEAM MESS+icon6 %&NL%%&NL%域名解析失败，无法获取IP地址！ @错误#OK*5000| FIND $%1=,!! CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4| EXIT=1| EXIT
	CALL RePaintIPAD 1
	CALL RePaintIPAD 2
	CALL RePaintIPAD 3
	CALL RePaintIPAD 4
	LPOS* * ,&af3=Addresses:,1,&af2
	IFEX $%&af3%>0,
	{
		CALC #&af4=%&af3%+1
		READ -*,%&af3%,&af5,&af2
		READ -*,%&af4%,&af6,&af2
		MSTR * &af7=<-1>&af5
		MSTR * &af8=<1>&af6
		ENVI @&IP1.VAL=%&af7%
		ENVI @&IP2.VAL=%&af8%
		CALC #&afd=%&af4%+1
		READ -*,%&afd%,&afe,&af2
		FIND $%&afe%<>,
		{
			LPOS* * &aff=:,1,&afe
			IFEX $%&aff%<1,
			{
				MSTR * &afg=<1>&afe
				ENVI @&IP3.VAL=%&afg%
				CALC #&afh=%&afd%+1
				READ -*,%&afh%,&afi,&af2
				FIND $%&afi%<>,
				{
					LPOS* * &afj=:,1,&afi
					IFEX $%&afj%<1,
					{
						MSTR * &afk=<1>&afi
						ENVI @&IP4.VAL=%&afk%
					}
				}
			}
		}
	}!   
	{*
		LPOS* * ,&af4=Address:,2,&af2
		IFEX $%&af4%>0,
		{
			READ -*,%&af4%,&af5,&af2
			MSTR * &af6=<-1>&af5
			ENVI @&IP1.VAL=%&af6%
		}!   
		{*
			TEAM MESS+icon6 %&NL%%&NL%域名解析失败，无法获取IP地址！ @错误#OK*5000| FIND $%1=,!! CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4| EXIT=1| EXIT
		}
	}
	FIND $%1=,
	{
		CALL SetEnable &TS1 &L2 &I7 &IA &IB &CG &IP1 &IP2 &IP3 &IP4
		CALL reSETnetTIME 1 0
	}
_END
_SUB SetEnable
	FORX * %* ,&acz, ENVI @%&acz%.Enable=1
_END
_SUB SetDisable
	FORX * %* ,&acz, ENVI @%&acz%.Enable=0
_END
