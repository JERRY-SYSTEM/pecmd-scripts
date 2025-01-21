code=936T950
LOGS
ENVI^ EnviMode=1
ENVI^ ForceLocal=1
ENVI ?&&adminMODE=ISADMIN
IFEX $%adminMODE%<>1, TEAM MESS=.+icon6 请以管理员身份运行！ @错误#OK*5000| EXIT
MSTR * &&Build=<-1>PECMDBUILD
SED &&Build=0,[^0-9],,%Build%
IFEX $[ %PECMDVER%<201201880585 | %Build%<20210326 ], TEAM MESS=.+icon6 PECMD 版本低于 201201.88.05.85  Build: 2021-03-26，程序无法运行！ @%Win_Title%   #OK*5000| EXIT
SET$ &TAB=09
SET$ &NL=0d 0a
SET &SIZE_MAXHIDE=4
SET &SIZE_MAXSHOW=3
SET &SIZE_MAXIMIZED=2
SET &SIZE_MINIMIZED=1
SET &SIZE_RESTORED=0
SET &WM_SIZE=0x0005
SET &WM_RBUTTONDOWN=0x0204
SET &WM_KEYDOWN=0x0100
SET &EN_CHANGE=0x0300
SET &WM_MOUSEENTER=0x1000
SET &WM_MOUSELEAVE=0x02A3
SET &WM_VSCROLL=0x0115
SET &WM_HSCROLL=0x0114
SET &ECM_FIRST=0x1500          //不支持NT5.1(xp)
CALC -base=16 &&EM_SETCUEBANNER=%ECM_FIRST%+1
SET &Wide2=450
SET &High2=475
CALL SETdpi
CALL SETfont
FIND --pid &&V,
MSTR* * &&IdleTimeStart,&&TotalTimeStart,&&CpuCount=<1*>V
CALL @WIN1
EXIT
_SUB WIN1,W%Wide2%H%High2%,进程管理器   By: JexChan   QQ: 527104427,,%MyName%#13,,, -maxb -size %ScaleCMD%
	ENVI @this.POS=?::&&wideDef:&&highDef
	IFEX $[ %wideDef%=%Wide2% | %highDef%=%High2% ], ENVI @this.POS=::%Wide2%:%High2%
	%Font_Cmd%
	EDIT TimerControl,L0T0W0H0,1,,0x18
	EDIT IdleTimeBegin,L0T0W0H0,%IdleTimeStart%,,0x18
	EDIT TotalTimeBegin,L0T0W0H0,%TotalTimeStart%,,0x18
	SET &Title=+50:进程%TAB%+50:父进程%TAB%+65:内存(KB)%TAB%*0:CPU使用时间(100ns) %TAB%*0:总时间%TAB%*800:文件路径%TAB%*4800:参数
	TABL -font::::0xFFFFFF:0.5:::::21 -color:###0xC0C0C0 TL1,L14T17W416H363,%Title%,,0x10040
	CHEK C2,L14T390W111H20,自动刷新(毫秒)：, CALL Fresh,1
	EDIT+ -3D -vcenter E1,L127T390W60H20,1000,,0x400,,10
	LIST -h L1,L212T390W65H200,进程|父进程|文件名|参数,,文件名,0x10100
	EDIT+ -3D E2,L280T390W102H20,,,,,10
	ITEM I1,L385T389W46H22,跳转,CALL findTitle,
	LABE -3d LB1,L-5T419W460H1,
	LABE -left LB2,L30T425W100H21,,
	LABE -left LB3,L140T425W140H21,,*,
	LABE -left LB4,L289T425W125H21,,*,
	LABE -left LB5,L420T426W22H13,?),EXEC $http://blog.sina.com.cn/s/blog_6fd804fe0102wqso.html,0x797979 //0xFF9933
	TIME TM1,0, THREAD* CALL Fresh
	WAIT 0.9
	ENVI @TL1.POS=?::&&wideTL1:&&highTL1
	ENVI @C2.POS=?:&&topC2
	ENVI @E1.POS=?:&&topE1
	ENVI @L1.POS=?:&&topL1
	ENVI @E2.POS=?:&&topE2:&&wideE2
	ENVI @I1.POS=?&&leftI1:&&topI1
	ENVI @LB1.POS=?:&&topLB1:&&wideLB1
	ENVI @LB2.POS=?:&&topLB2
	ENVI @LB3.POS=?&&leftLB3:&&topLB3
	ENVI @LB4.POS=?&&leftLB4:&&topLB4
	ENVI @LB5.POS=?&&leftLB5:&&topLB5
	ENVI @E1.ID=?;&&HandleE1
	ENVI @E2.ID=?&&WidHandleE2
	ENVI @@SENDMSG=%WidHandleE2%;%EM_SETCUEBANNER%;0;$  请在此输入
	ENVI @E2.MSG=+%WM_KEYDOWN%::&&wParm,&&lParm,CALL HotKey2 %wParm%
	ENVI @this.MSG=_COMMAND#%HandleE1%#%EN_CHANGE%::&&wParm,&&lParm,THREAD* CALL Fresh
	ENVI @TL1.MSG=_%WM_RBUTTONDOWN%: CALL @--popmenu rightMENU
	ENVI @TL1.MSG=_%WM_KEYDOWN%::&&wParm,&&lParm,CALL HotKey1 %wParm%
	ENVI @WIN1.MSG=%WM_SIZE%::&&wParm,&&lParm,CALL SizeChanged %wParm%
	ENVI @E2.MSG=%WM_MOUSEENTER%: CALL Mouse_In 提示,回车键跳转，ESC键清除。
	ENVI @I1.MSG=%WM_MOUSEENTER%: CALL Mouse_In 提示,可在所有符合条件的行中循环跳转。
	ENVI @LB3.MSG=%WM_MOUSEENTER%: CALL Mouse_In CPU,线程数：%CpuCount%
	ENVI @LB4.MSG=%WM_MOUSEENTER%: TEAM CALL GetMemory| CALL Mouse_In 物理内存概况,已用内存：%UsedMemoryWithUnit%%NL%可用内存：%AvailableMemoryWithUnit%%NL%总内存：%TotalMemoryWithUnit%
	ENVI @LB5.MSG=%WM_MOUSEENTER%: CALL Mouse_In 关于本工具：,点击可打开主页。
	ENVI @E2.MSG=%WM_MOUSELEAVE%: TIPS -
	ENVI @I1.MSG=%WM_MOUSELEAVE%: TIPS -
	ENVI @LB3.MSG=%WM_MOUSELEAVE%: TIPS -
	ENVI @LB4.MSG=%WM_MOUSELEAVE%: TIPS -
	ENVI @LB5.MSG=%WM_MOUSELEAVE%: TIPS -
	ENVI @I1.Cursor=32649
	THREAD* CALL Fresh
_END
_SUB Mouse_In
	TEAM MSTR -delims:, &&TipsTitle,&&TipsStr=<1><2->%*| ENVI @@Cur=?&&CurX;&&CurY| TIPS. %TipsTitle%,%TipsStr%,1000000000,1,@AL%CurX%T%CurY%
_END
_SUB Fresh
	IFEX $[ %C2.Check%=1 & %E1%>0 & %TimerControl%=1 ], CALL StartTimer! ENVI @TM1=0
_END
_SUB GetMemory *
	IFEX MEMBU=?,&&AvailableMem
	IFEX MEMBA=?,&&TotalMem
	CALC &&UsedMem=%TotalMem%-%AvailableMem%
	CALL CalcSize &&AvailableMemoryWithUnit %AvailableMem%
	CALL CalcSize &&TotalMemoryWithUnit %TotalMem%
	CALL CalcSize &&UsedMemoryWithUnit %UsedMem%
_END
_SUB StartTimer
	ENVI @TM1=0
	CALL init &&IdleTimeNow &&TotalTimeNow
	ENVI @IdleTimeBegin=%IdleTimeNow%
	ENVI @TotalTimeBegin=%TotalTimeNow%
	IFEX $[ %C2.Check%=1 & %E1%>0 & %TimerControl%=1 ], ENVI @TM1=%E1%
_END
_SUB init
	FIND --pid*@ &&TotalProcess,
	ENVI @TL1.Sel=?&&Sel
	ENVI @TL1.Val=?%Sel%.1;&&SelStr1
	ENVI @TL1.Val=1*#;%TotalProcess%
	ENVI @TL1.Val=?%Sel%.1;&&SelStr2
	FIND *SelStr1<>SelStr2, ENVI @TL1.Sel=%Sel%;0  //重置表格前后，对比选择行有无变化，有变化则清除选择
	ENVI @TL1.Val=?*;&&ProcessCount
	ENVI @LB2=进程数：%ProcessCount%
	IFEX MEMBU=?,&&AvailableMemory
	IFEX MEMBA=?,&&TotalMemory
	CALC &&MemoryUsage=abs(100-100*%AvailableMemory%/%TotalMemory%)#1
	ENVI @LB4=物理内存：%MemoryUsage%%
	FIND --pid &&TimeStr,
	MSTR* * &&IdleTimeNow,&&TotalTimeNow=<1*>TimeStr
	CALC &&CpuUsage=100-100*(%IdleTimeNow%-%IdleTimeBegin%)/(%TotalTimeNow%-%TotalTimeBegin%)/%CpuCount%#1
	IFEX $%CpuUsage%>=0,!! ENVI @LB3=CPU使用率：%CpuUsage%%%
	FIND $%1<>, ^ENVI-ret %1=%%%1%%
	FIND $%2<>, ^ENVI-ret %2=%%%2%%
_END
_SUB SelectFile
	ENVI @TL1.Sel=?&&Sel
	ENVI @TL1.Val=?%Sel%.6;&&object
	FIND *object<>,!! EXEC EXPLORER.EXE /n,/select,%object%
_END
_SUB Clipboard
	ENVI @TL1.Val=?%1;&&SelMsg
	ENVI^ Clipboard=%SelMsg%
_END
_SUB HotKey1
	IFEX $%1=0x2E, CALL DoKillProcess
_END
_SUB HotKey2
	IFEX $%1=0x1B, ENVI @E2=
	IFEX $%1=0x0D, CALL findTitle
_END
_SUB DoKillSame
	ENVI @TL1.Val=?%1;&&KillMSG
	FNAM -ext &&KillName=%KillMSG%
	MESS=.+icon1 确定结束所有 %KillName% 吗？   @提示#YN $N *5000
	FIND $%YESNO%=YES,
	{
		FIND --pid*@ &&TotalMsg,
		LPOS* * ,*&&Pos=\%KillName%%TAB%,,TotalMsg
		FORX *v Pos,&&nPos,
		{
			READ -*,%nPos%,&&nMsg,TotalMsg
			MSTR* * &&KillPid=<1>nMsg
			KILL *force *%KillPid%
		}
		CALL ClosureKill
	}
_END
_SUB ClosureKill
	ENVI @TL1.Sel=?&&Sel
	ENVI @TL1.Sel=%Sel%;0
	WAIT 100  //如果不延时，当结束最后一行程序时，表格中该行不会被清除
	THREAD* CALL init
_END
_SUB DoKillProcess
	ENVI @TL1.Sel=?&&Sel
	IFEX $%Sel%>0,
	{
		ENVI @TL1.Val=?%Sel%.1;&&Process
		CALL DoKill %Process%
	}
_END
_SUB DoKill
	MESS=.+icon1 确定结束 %1 进程%2吗？   @提示#YN $N *5000
	FIND $%YESNO%=YES, TEAM ^KILL *force %3 *%1| CALL ClosureKill
_END
_SUB rightMENU
	ENVI @TL1.Sel=?.&&Sel
	IFEX $%Sel%<1, EXIT! ENVI @TL1.Sel=%Sel%
	ENVI @TL1.Sel=?.&&Selx;&&Sely
	ENVI @TL1.Val=?%Sel%.1;&&Process
	ENVI @TL1.Val=?%Sel%.2;&&FatherProcess
	MENU ,打开文件位置, CALL SelectFile
	MENU -
	MENU ,复制单元格, CALL Clipboard %Selx%.%Sely%
	MENU ,复制整行, CALL Clipboard %Sel%
	MENU ,复制整个表格, CALL Clipboard *.*
	MENU -
	MENU ,结束进程, CALL DoKill %Process%
	MENU ,结束进程树, CALL DoKill %Process% 树 *tree
	MENU -
	MENU ,结束父进程, CALL DoKill %FatherProcess%
	MENU ,结束父进程树, CALL DoKill %FatherProcess% 树 *tree
	MENU -
	MENU ,结束同名进程, CALL DoKillSame %Sel%.6
_END
_SUB SizeChanged
	IFEX $[ %1=%SIZE_MAXIMIZED% | %1=%SIZE_MAXSHOW% | %1=%SIZE_RESTORED% ],
	{
		ENVI @WIN1.POS=?::&&wideNow:&&highNow
		IFEX $[ %wideNow%<%wideDef% | %highNow%<%highDef% ], 
		{
			ENVI @this.POS=::%wideDef%:%highDef%
			ENVI @TL1.POS=::%wideTL1%:%highTL1%
			ENVI @C2.POS=:%topC2%
			ENVI @E1.POS=:%topE1%
			ENVI @L1.POS=:%topL1%
			ENVI @E2.POS=:%topE2%:%wideE2%
			ENVI @I1.POS=%leftI1%:%topI1%
			ENVI @LB1.POS=:%topLB1%:%wideLB1%
			ENVI @LB2.POS=:%topLB2%
			ENVI @LB3.POS=%leftLB3%:%topLB3%
			ENVI @LB4.POS=%leftLB4%:%topLB4%
			ENVI @LB5.POS=%leftLB5%:%topLB5%
		}!   
		{
			CALC #&&wideLess=%wideNow%-%wideDef%
			CALC #&&highLess=%highNow%-%highDef%
			CALC #&&wideLess2=%wideLess%/3
			CALC #&&wideLess3=%wideLess2%*2
			CALC #&&TL1_W=%wideTL1%+%wideLess%
			CALC #&&TL1_H=%highTL1%+%highLess%
			CALC #&&C2_T=%topC2%+%highLess%
			CALC #&&E1_T=%topE1%+%highLess%
			CALC #&&L1_T=%topL1%+%highLess%
			CALC #&&E2_T=%topE2%+%highLess%
			CALC #&&E2_W=%wideE2%+%wideLess%
			CALC #&&I1_L=%leftI1%+%wideLess%
			CALC #&&I1_T=%topI1%+%highLess%
			CALC #&&LB1_T=%topLB1%+%highLess%
			CALC #&&LB1_W=%wideLB1%+%wideLess%
			CALC #&&LB2_T=%topLB2%+%highLess%
			CALC #&&LB3_L=%leftLB3%+%wideLess2%
			CALC #&&LB3_T=%topLB3%+%highLess%
			CALC #&&LB4_L=%leftLB4%+%wideLess3%
			CALC #&&LB4_T=%topLB4%+%highLess%
			CALC #&&LB5_L=%leftLB5%+%wideLess%
			CALC #&&LB5_T=%topLB5%+%highLess%
			ENVI @TL1.POS=::%TL1_W%:%TL1_H%
			ENVI @C2.POS=:%C2_T%
			ENVI @E1.POS=:%E1_T%
			ENVI @L1.POS=:%L1_T%
			ENVI @E2.POS=:%E2_T%:%E2_W%
			ENVI @I1.POS=%I1_L%:%I1_T%
			ENVI @LB1.POS=:%LB1_T%:%LB1_W%
			ENVI @LB2.POS=:%LB2_T%
			ENVI @LB3.POS=%LB3_L%:%LB3_T%
			ENVI @LB4.POS=%LB4_L%:%LB4_T%
			ENVI @LB5.POS=%LB5_L%:%LB5_T%
			ENVI @this.InvalidateRect=
		}
	}
_END
_SUB SETdpi *
	CALL $--ret:&&DPI_Aware user32.dll,SetProcessDPIAware  //9600(文件版本第3段)以下系统，开启DPI感知
	CALL $--ret:&&DPI_Aware user32.dll,SetProcessDPIAwareness,#1  //9600(文件版本第3段)或以上系统，开启DPI感知
	CALL $--qd --bool --ret:&&SetProcessDpiAwarenessContextRet User32.dll,SetProcessDpiAwarenessContext,#-4  //15063(文件版本第3段)或以上系统，界面随DPI动态拉伸
	SET &hdcCount=0
	LOOP #1=1,
	{*
		CALL $--ret:&&hdc user32.dll,GetDC,#0
		CALC #&&hdcCount=%hdcCount%+1
		IFEX $%hdcCount%>50, EXIT
		IFEX $%hdc%>0, EXIT
		WAIT 0.9
	}
	SET &ScaleCMD=-scalef -scale
	IFEX $%hdc%>0,
	{
		CALL $--ret:&&LogPixeLsx Gdi32.dll,GetDeviceCaps,#%hdc%,#88
		SET ScaleCMD=-scalef:%LogPixeLsx% -scale:%LogPixeLsx%
	}
_END
_SUB SETfont *
	SET &Font_Size=9
	SET &Font_Cmd=IFEX %windir%\fonts\simsun*, ENVI @this.Font=%Font_Size%:simsun! ENVI @this.Font=%Font_Size%
_END
_SUB CalcSize
	TEAM                                          SET &Divisor=1|       SET &Unit= B   //Byte
	IFEX $[ %2>=1K & %2<1M ],                TEAM SET &Divisor=1K|      SET &Unit= KB  //KiloByte  （10的3次幂）
	IFEX $[ %2>=1M & %2<1G ],                TEAM SET &Divisor=1M|      SET &Unit= MB  //MegaByte  （10的6次幂）
	IFEX $[ %2>=1G & %2<1T ],                TEAM SET &Divisor=1G|      SET &Unit= GB  //GigaByte  （10的9次幂）
	IFEX $[ %2>=1T & %2<1024T ],             TEAM SET &Divisor=1T|      SET &Unit= TB  //TeraByte  （10的12次幂）
	IFEX $[ %2>=1024T & %2<1048576T ],       TEAM SET &Divisor=(1K*1T)| SET &Unit= PB  //PetaByte  （10的15次幂）
	IFEX $[ %2>=1048576T & %2<1073741824T ], TEAM SET &Divisor=(1M*1T)| SET &Unit= EB  //ExaByte   （10的18次幂）
	IFEX $%2>=1073741824T,                   TEAM SET &Divisor=(1G*1T)| SET &Unit= ZB  //ZettaByte （10的21次幂）
	^CALC &&Quotient=%2/%Divisor%#2
	ENVI-ret %1=%Quotient%%Unit%
_END
_SUB findTitle
	IFEX [ *=E2 | $%TimerControl%=0 ], EXIT
	ENVI @TimerControl=0
	ENVI @L1.Enable=0
	ENVI @E2.Enable=0
	ENVI @I1.Enable=0
	ENVI @TL1.Val=?*.*;&&v1
	SET> &v1=%NL%
	SET< &v1=%NL%
	SET &v3=0
	SET &v4=1
	FIND $%L1%=参数, SET &v2=%TAB%%E2%%NL%
	FIND $%L1%=进程, TEAM SET &v2=%NL%%E2%%TAB%| SET &v4=0
	FIND $[ %L1%=父进程 | %L1%=文件名 ], SET &v2=%TAB%%E2%%TAB%
	LPOS* * ,*&&va=%v2%,,v1
	CALL GetLine
	IFEX $[ %v3%<1 & ( %L1%=文件名 | %L1%=参数 ) ],
	{
		SET &vh=
		SET &vi=
		FIND $%L1%=文件名, SET &ve=6
		FIND $%L1%=参数, SET &ve=7
		LPOS* * ,*&&vb=%E2%,,v1
		FORX *v vb,&&vc,
		{
			FIND *vi<>vc,
			{
				SET vi=%vc%
				CALC #&&vd=%vc%-%v4%
				ENVI @TL1.Val=?%vd%.%ve%;&&vf
				LPOS* * &&vg=%E2%,1,vf
				IFEX $%vg%>0, SET< vh= %vc%
			}
		}
		MSTR * -trim &&va=vh
		CALL GetLine
	}
	IFEX $%v3%>0,
	{
		CALC #&&v3=%v3%-%v4%
		ENVI @TL1.Sel=%v3%
		ENVI @TL1.SENDMSG=%WM_HSCROLL%;6
		CALL SetScroll TL1 %v3%
	}
	ENVI @TimerControl=1
	THREAD* CALL Fresh
	ENVI @L1.Enable=1
	ENVI @E2.Enable=1
	ENVI @I1.Enable=1
_END
_SUB GetLine
	IFEX $%va%>0,
	{
		MSTR * &&v8=<#>va
		IFEX $%v8%=1,
		{
			SET v3=%va%
		}!   
		{
			|SET &va= %va% |
			SED -ex &&va=0, ,%NL%,va
			ENVI @TL1.Sel=?&&v5  //当前选择行
			CALC #&&v6=%v5%+%v4%
			LPOS* * ,&&v7=%NL%%v6%%NL%,1,va
			SET &v9=1
			IFEX $[ %v7%>0 & %v7%<%v8% ], CALC &&v9=%v7%+1  //跳过当前选择行
			MSTR * &v3=<%v9%>va
		}
	}
_END
_SUB SetScroll
	ENVI @%1.SENDMSG=%WM_VSCROLL%;6
	SET &v=1
	LOOP #%v%<%2,
	{
		ENVI @%1.SENDMSG=%WM_VSCROLL%;1
		CALC #&v=%v%+1
	}
_END
