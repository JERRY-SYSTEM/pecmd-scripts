code=936T950
ENVI^ EnviMode=1
ENVI^ ForceLocal=1
SET$ &NL=0D 0A
SET$ &TAB=09
ENVI &Win_Title=< 文件属性显示、修改 >制作：JexChan  QQ：527104427
MSTR * &Build=<-1>&PECMDBUILD
SED &Build=0,[^0-9],,%&Build%
IFEX $[ %&PECMDVER%<201201880585 | %&Build%<20210321 ], TEAM MESS+icon6 %&NL%%&NL%PECMD 版本低于 201201.88.05.85  Build: 2021-03-21，程序无法运行！ @%&Win_Title%   #OK*5000| EXIT
SET &::WS_EX_CONTROLPARENT=0x00010000
SET &::WM_RBUTTONDOWN=0x0204
SET &::WM_MOUSEENTER=0x1000
SET &::WM_MOUSELEAVE=0x02A3
SET &::WM_DROPFILES=0x0233
SET &::WM_KEYDOWN=0x0100
SET &rMENU1=修改文件时间、属性
SET &rMENU2=文件名大小写转换
SET &rMENU3=查看占用程序
SET &rMENU4=查看文件碎片
FIND $%1=--setFileCase, TEAM CALL AutoFileCase %*| EXIT= %&error%| EXIT
FIND $%1=--getFileOcc, TEAM CALL * chkWCSorEXE| CALL SETdpi| CALL SETfont| CALL @OccupyAPP %~2| EXIT
FIND $%1=--getFragment, TEAM CALL * chkWCSorEXE| CALL SETdpi| CALL SETfont| CALL @FragmentsMSG %2| EXIT
CALL * chkWCSorEXE
SET &KeyDown=0
SET &KeyDown2=0
SET &Defpage=1
SET &ExitCODE=0
SET &PageCODE=0
FIND $%~1<>,
{*
	ENVI &bz2=1
	ENVI &bzc=%#
	LOOP #%&bz2%<%&bzc%,
	{*
		MSTR &bz1=<~%&bz2%>%*
		FIND $%&bz1%=--Reg-FileOcc,                     TEAM CALL Reg_unReg %&rMENU3% getFileOcc|  SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--UnReg-FileOcc,                   TEAM CALL Reg_unReg --U getFileOcc|        SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--Reg-Fragment,                    TEAM CALL Reg_unReg %&rMENU4% getFragment| SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--UnReg-Fragment,                  TEAM CALL Reg_unReg --U getFragment|       SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--Reg-FileTime,                    TEAM CALL Reg_unReg %&rMENU1% setFILEtime| SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--UnReg-FileTime,                  TEAM CALL Reg_unReg --U setFILEtime|       SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--Reg-FileCase,                    TEAM CALL Reg_unReg %&rMENU2% setFILEcase| SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		FIND $%&bz1%=--UnReg-FileCase,                  TEAM CALL Reg_unReg --U setFILEcase|       SET &ExitCODE=1| CALC #&bz2=%&bz2%+1| EXIT -
		TEAM MSTR * &bz3=1,6,&bz1| MSTR * &bz4=7,1,&bz1| MSTR * &bz5=8,1,&bz1
		IFEX $[ '%&bz3%'='--PAGE' & %&bz4%>=1 & %&bz4%<=2 & '%&bz5%'='' ], TEAM SET &PageCODE=1| SET &Defpage=%&bz4%
		CALC #&bz2=%&bz2%+1
	}
}
IFEX $[ %&ExitCODE%=1 & %&PageCODE%=0 ], EXIT
CALL SETdpi
CALL SETfont
DATE &DateTime     //2020-2-11|2|14:12:34.692    //年-月-日|星期|时:分:秒.毫秒
MSTR * -delims:| &Date,&Time=<1><3>&DateTime
CALL @WIN1 %*
_SUB WIN1,W543H500,%&Win_Title%,,%&MyName%,,, %&ScaleCMD%
	%&Font_Cmd%
	TABS &TS1,L21T17W497H432,Page1:-:时间属性;Page2:-:命令行:,
	ENVI @this.Visible=1
	WAIT 0.9
	ENVI @&TS1.style=:%WS_EX_CONTROLPARENT%
	CALL Cursor &TS1
	ENVI @&TS1.Select=%&Defpage%
_END
_SUB Page1,W496H441,
	%&Font_Cmd%
	LABE ,L30T20W73H22,目标文件：,,
	LIST -h &L1,L88T16W240H200,,CALL getTIME,,0x10100
	CHEK &CC,L335T16W48H22,全选,,
	ITEM &IC,L383T16W37H20,清空,ENVI @&L1.Val=,
	ITEM &I1,L425T16W37H20,浏览,CALL OnSrc,
	LABE -3D,L-8T50W512H2,,,
	CHEK &C1,L30T65W73H22,创建时间：,,
	DTIM &D1,L106T64W175H24,%&Date%,,0x20
	DTIM &D2,L287T64W104H24,%&Time%,,0x40
	CHEK &I2,L396T64W80H23,锁定时间,,
	CHEK &C2,L30T98W73H22,修改时间：,,
	DTIM &D3,L106T97W175H24,%&Date%,,0x20
	DTIM &D4,L287T97W104H24,%&Time%,,0x40
	CHEK &I3,L396T97W80H23,锁定时间,,
	CHEK &C3,L30T131W73H22,访问时间：,,
	DTIM &D5,L106T130W175H24,%&Date%,,0x20
	DTIM &D6,L287T130W104H24,%&Time%,,0x40
	CHEK &I4,L396T130W80H23,锁定时间,,
	LABE -3D,L-8T166W512H2,,,
	CHEK &C4,L30T177W73H22,文件属性：,,
	CHEK &C5,L135T177W69H22,系统(S),,
	CHEK &C6,L225T177W69H22,隐藏(H),,
	CHEK &C7,L315T177W69H22,只读(R),,
	CHEK &C8,L404T177W69H22,存档(A),,
	LABE -3D,L-8T208W512H2,,,
	LABE ,L30T225W56H22,文件名：,,
	EDIT+ -3D &E7,L77T221W140H23,,,0x8,, //11
	CHEK &CD,L244T218W63H30,转大写,CALL CheckOrNo &CD &CE,
	CHEK &CE,L322T218W63H30,转小写,CALL CheckOrNo &CE &CD,
	CHEK &CF,L397T218W79H30,注册右键,CALL CheckReg &CF %&rMENU2% setFILEcase,
	LABE -3D,L-8T255W512H2,,,
	LABE ,L30T271W73H22,版本信息：,,
	EDIT+ -3D &E1,L88T267W140H23,,,0x8,, //11
	LABE ,L253T271W45H22,位宽：,,
	EDIT+ -3D &E2,L287T267W175H23,,,0x8,, //11
	LABE ,L30T301W73H22,碎片信息：,,
	EDIT+ -3D &E3,L88T297W140H23,,,0x8,, //11
	LABE ,L253T301W45H22,大小：,,
	EDIT+ -3D &E4,L287T297W175H23,,,0x8,, //11
	LABE -3D,L-8T330W512H2,,,
	CHEK &R1,L30T337W148H30,遍历目录(不含文件),CALL SetCheck &R1 &R2 &R3,,
	CHEK &R2,L195T337W149H30,遍历文件(不含目录),CALL SetCheck &R2 &R1 &R3,,
	CHEK &R3,L367T337W110H30,遍历目录+文件,CALL SetCheck &R3 &R1 &R2,,
	CHEK &CA,L30T368W75H30,注册右键,CALL CheckReg &CA %&rMENU1% setFILEtime,
	CHEK &C9,L112T368W99H30,包含目标文件,,1
	ITEM &IG,L218T372W93H24,查看占用程序,CALL @OccupyAPP %&L1%,
	ITEM &I6,L326T372W61H24,确定,THREAD* CALL reSETtime,
	ITEM &I5,L401T372W61H24,刷新,CALL getTIME,
	WAIT 0.9
	CALL Cursor &I1 &I2 &I3 &I4 &I5 &I6 &IC &IG &D1 &D2 &D3 &D4 &D5 &D6 &C1 &C2 &C3 &C4 &C5 &C6 &C7 &C8 &C9 &CA &CC &CD &CE &CF &R1 &R2 &R3
	ENVI @&E3.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 按下回车键查看详情
	ENVI @&E1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "文件版本 / 产品版本"
	ENVI @&CF.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 注册右键“%&rMENU2%”。
	ENVI @&CA.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 注册右键“%&rMENU1%”，即打开本页面。
	ENVI @&L1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L1%"
	ENVI @&E7.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "按下键盘左方向键，复制列表框中所有文件名到剪贴板，%&NL%右方向键复制完整路径，%&NL%上方向键复制选中条目完整路径！"
	ENVI @&CC.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 注意： 如果勾选此项，左边下拉列表框中列出的所有文件将被选中！
	ENVI @&I2.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 锁定后不会跟随目标文件同步刷新！
	ENVI @&I3.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 锁定后不会跟随目标文件同步刷新！
	ENVI @&I4.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 锁定后不会跟随目标文件同步刷新！
	ENVI @&D1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 可右键点击设置为当前系统日期！
	ENVI @&D3.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 可右键点击设置为当前系统日期！
	ENVI @&D5.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 可右键点击设置为当前系统日期！
	ENVI @&D2.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 可右键点击设置为当前系统时间！
	ENVI @&D4.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 可右键点击设置为当前系统时间！
	ENVI @&D6.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： 可右键点击设置为当前系统时间！
	ENVI @&E3.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&E1.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&CF.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&CA.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&L1.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&E7.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&CC.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&I2.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&I3.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&I4.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D1.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D3.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D5.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D2.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D4.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D6.MSG=%&WM_MOUSELEAVE%: TIPS -
	ENVI @&D1.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu fixDATE &D1
	ENVI @&D2.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu fixTIME &D2
	ENVI @&D3.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu fixDATE &D3
	ENVI @&D4.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu fixTIME &D4
	ENVI @&D5.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu fixDATE &D5
	ENVI @&D6.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu fixTIME &D6
	ENVI @&L1.MSG=%&WM_DROPFILES%::&wp,&lp, THREAD*$ CALL getSOURCE &L1 "%&wp%" "%&lp%"
	ENVI @&E7.MSG=+%&WM_KEYDOWN%::&wp,&lp, THREAD* -here CALL getFILEmsg
	ENVI @&E3.MSG=+%&WM_KEYDOWN%::&wp,&lp, CALL getFragments
	THREAD*$ TEAM CALL Monitor_Reg &CA %&rMENU1% setFILEtime| CALL Monitor_Reg &CF %&rMENU2% setFILEcase
	FIND $%~1=--setFILEtime, THREAD*$ CALL getRfile %*
_END
_SUB Page2,W496H441,
	%&Font_Cmd%
	FNAM -ext &ak1="%&MyName%"
	FIND $%&regCMD%=, SET &ak2=%&ak1%! SET &ak2=PECMD.EXE %&regCMD%
	SET  &ak3=%&NL%   --Page(n)                 切换属性页。例：--Page2
	SET< &ak3=%&NL%   --Reg-FileOcc             将“%&rMENU3%”注册到右键
	SET< &ak3=%&NL%   --Reg-FileTime            将“%&rMENU1%”注册到右键
	SET< &ak3=%&NL%   --Reg-FileCase            将“%&rMENU2%”注册到右键
	SET< &ak3=%&NL%   --Reg-Fragment            将“%&rMENU4%”注册到右键
	SET< &ak3=%&NL%   --UnReg-FileOcc           取消“%&rMENU3%”右键菜单
	SET< &ak3=%&NL%   --UnReg-FileTime          取消“%&rMENU1%”右键菜单
	SET< &ak3=%&NL%   --UnReg-FileCase          取消“%&rMENU2%”右键菜单
	SET< &ak3=%&NL%   --UnReg-Fragment          取消“%&rMENU4%”右键菜单%&NL%
	SET< &ak3=%&NL%   示例：%&NL%
	SET< &ak3=%&NL%   %&ak2%  --Page2
	SET< &ak3=%&NL%   %&ak2%  --Reg-FileTime%&NL%
	SET< &ak3=%&NL%   PECMD技术社区：  https://pecmd.net/
	SET< &ak3=%&NL%   本人博客：       http://blog.sina.com.cn/a527104427
	SET< &ak3=%&NL%   本工具网址：     http://bbs.wuyou.net/forum.php?mod=viewthread&tid=419224&fromuid=378114
	EDIT+-| ,L0T1W492H408,%&ak3%,,0x8
	WAIT 0.9
_END
_SUB OccupyAPP,W496H475,%&rMENU3%,,%&MyName%,,, %&ScaleCMD%
	%&Font_Cmd%
	TABL -font:::::0.5:::::21 &TL1,L22T21W446H371,+50:进程号%&TAB%+50:父进程%&TAB%+65:内存(KB) %&TAB%*0:CPU使用时间(100ns) %&TAB%*0:总时间%&TAB%*150:文件路径%&TAB%*999:参数,,0x10040
	CHEK &CH,L22T404W81H30,注册右键,CALL CheckReg &CH %&rMENU3% getFileOcc,
	ITEM &IH,L396T406W73H24,结束进程,CALL killAPP %*,
	WAIT 0.9
	CALL Cursor &CH &IH
	THREAD*$ CALL Monitor_Reg &CH %&rMENU3% getFileOcc
	THREAD*$ CALL getPROCESS %*
	FNAM -ext &thisNAME=%*
	ENVI @this=%OccupyAPP% "%&thisNAME%"
_END
_SUB FragmentsMSG,W496H475,%&rMENU4%,,%&MyName%,,, %&ScaleCMD%
	%&Font_Cmd%
	TABL -font:::::0.5:::::21 &TL2,L22T21W446H341,*50:  序号%&TAB%*250:              起始位置(字节)%&TAB%*250:       长度(字节),,0x10040
	LABE ,L22T379W53H22,起始：,,
	EDIT+ -3D &E8,L55T375W90H23,,,0x8,,
	LABE ,L177T379W53H22,长度：,,
	EDIT+ -3D &E9,L210T375W90H23,,,0x8,,
	LABE ,L333T379W60H22,簇大小：,,
	EDIT+ -3D &EA,L378T375W90H23,,,0x8,,
	LABE ,L22T413W75H22,分区起始：,,
	EDIT+ -3D &EB,L79T409W90H23,,,0x8,,
	LABE -center &LB3,L223T413W124H24,,,0xDF0029
	CHEK &CI,L404T404W81H30,注册右键, CALL CheckReg &CI %&rMENU4% getFragment,
	WAIT 0.9
	ENVI @&TL2.MSG=_%&WM_RBUTTONDOWN%: CALL @--popmenu rightMENU
	CALL Cursor &CI
	THREAD*$ CALL Monitor_Reg &CI %&rMENU4% getFragment
	THREAD*$ CALL Fragments %*
	FNAM -ext &thisNAME=%*
	ENVI @this=%FragmentsMSG% "%&thisNAME%"
_END
_SUB MyMess,W170H140,错误,,,,, -disminb %&ScaleCMD%
	%&Font_Cmd%
	IMAG ,L13T12W32H32,imageres.dll#93,
	LABE ,L68T27W74H26,修改失败！,,
	ITEM &IE,L95T67W50H25,关闭,KILL \,
	ITEM &IF,L20T67W65H25,错误报告,EXEC $%&ac9%,
	SET &ar1=5
	TIME &T3,1000, CALL TimeOut %MyMess%
	CALL TimeOut %MyMess%
	CALL Cursor &IE &IF
_END
_SUB rightMENU
	ENVI @&TL2.Sel=?.&au2;&au3
	ENVI @&TL2.Sel=?&au1
	IFEX $%&au1%>0,
	{
		IFEX $%&au3%=1, SET &au4=该行
		IFEX $%&au3%=2, SET &au4=起始位置
		IFEX $%&au3%=3, SET &au4=长度
		MENU ,复制%&au4%, CALL copyMSG %&au2% %&au3%
	}
_END
_SUB copyMSG
	IFEX $%2<>1,
	{*
		ENVI @&TL2.Val=?%1.%2;&au5
		MSTR * &au6=<1>&au5
	}!   
	{*
		ENVI @&TL2.Val=?%1;&au6
	}
	ENVI^ Clipboard=%&au6%
_END
_SUB Fragments
	ENVI &at1=
	ENVI &at2=1
	ENVI ?&at3,&at4,&at5,&at6,&at7,&at8=FPOS,%*
	IFEX $[ %&at7%=0 | %&at7%=1 ], ENVI &at7=文件连续，无碎片！! ENVI &at7=碎片数：%&at7%
	FIND $%&at6%=, SET &at6=%&at3% %&at4%
	FORX *NL &at6,&at9,
	{*
		MSTR * &ata,&atb=<1*>&at9
		FIND $[ '%&ata%'<>'-1' & '%&ata%'<>'-38' ], CALL CalcSize &atc %&ata%
		CALL CalcSize &atd %&atb%
		FIND $%&ata%=-1, SET &atc=特殊压缩或洞
		FIND $%&ata%=-38, SET &atc=驻留文件
		SET< &ata= (%&atc%)
		SET< &atb= (%&atd%)
		SET< &at1=%&at2%%&TAB%%&ata%%&TAB%%&atb%%&NL%
		CALC &at2=%&at2%+1
	}
	ENVI @&TL2.Val=1*#;%&at1%
	CALL CalcSize &ate %&at3%
	CALL CalcSize &atf %&at4%
	CALL CalcSize &atg %&at5%
	CALL CalcSize &ath %&at8%
	ENVI @&E8=%&at3% (%&ate%)
	ENVI @&E9=%&at4% (%&atf%)
	ENVI @&EA=%&at5% (%&atg%)
	ENVI @&EB=%&at8% (%&ath%)
	ENVI @&LB3=%&at7%
	SET$ &at6=*0
_END
_SUB getFragments *
	IFEX $[ %&wp%=0xD & %&KeyDown2%=0 & '%&L1%'<>'' & ! "%&L1%\" ],
	{*
		ENVI-ret &KeyDown2=1
		CALL @FragmentsMSG "%&L1%"
		ENVI-ret &KeyDown2=0
	}
_END
_SUB killAPP
	ENVI @&TL1.Sel=?&ase
	IFEX $%&ase%<1, EXIT
	ENVI @&IH.Enable=0
	ENVI @&TL1.Val=?%&ase%.1;&asf
	MESS+icon %&NL%%&NL%    确定结束进程 %&asf% 吗？   @提示#YN $N *5000
	FIND $%&YESNO%=YES, TEAM KILL *force *%&asf%| CALL getPROCESS %*
	ENVI @&IH.Enable=1
_END
_SUB getPROCESS
	SET &as1=
	SET &as3=
	SET &asg=
	FIND --pid*@ &as2,
	FDIR --short --fullfile &as6=%*
	LPOS* * ,*&as7=%&as6%,1,&as2
	FIND $%&as6%<>%*,!! LPOS* * ,*&as3=%*,1,&as2
	IFEX $%&as7%=0, SET &as7=
	IFEX $%&as3%=0, SET &as3=
	FORX * %&as3% %&as7%,&as4,
	{*
		FIND $%&asg%=%&as4%, EXIT -
		SET &asg=%&as4%
		READ -*,%&as4%,&as5,&as2
		SET &asd=
		CALL loop %&as6%
		FIND $[ '%&asd%'='' & '%&as6%'<>'%*' ], CALL loop %*
		FIND $%&asd%<>,!! ENVI< &as1=%&as5%%&NL%
	}
	ENVI @&TL1.Val=1*#;%&as1%
_END
_SUB loop *
	LPOS* * *&as8=%*,1,&as5
	IFEX $%&as8%=0, SET &as8=
	STRL &as9=%*
	FORX * %&as8%,&asa,
	{*
		CALC #&asb=%&asa%+%&as9%
		MSTR * &asc=%&asb%,1,&as5
		FIND $[ '%&asc%'='\' | '%&asc%'='' | '%&asc%'='"' | '%&asc%'='%&TAB%' ], TEAM SET &asd=OK| EXIT
	}
_END
_SUB SetCheck
	^IFEX $%%%1.Check%%=1, TEAM ENVI @%2.Check=0| ENVI @%3.Check=0
_END
_SUB CheckOrNo
	^IFEX $%%%1.Check%%=1, ENVI @%2.Check=0
_END
_SUB Monitor_Reg
	SET &dva=
	SET &dv7=%2
	SET &dv8="%&MyName%",0
	SET &dv9="%&MyName%" %&regCMD% --%3 "%%1"
	FIND $%3=getFragment, SET &dvb=*! SET &dvb=Directory *
	FORX * %&dvb% ,&dv3,
	{*
		REGI $HKCR\%&dv3%\shell\%3\,&dv4
		REGI $HKCR\%&dv3%\shell\%3\Icon,&dv5
		REGI $HKCR\%&dv3%\shell\%3\command\,&dv6
		FIND $[ '%&dv4%'<>'%&dv7%' | '%&dv5%'<>'%&dv8%' | '%&dv6%'<>'%&dv9%' ], SET &dva=err
	}
	FIND $%&dva%=, ENVI @%1.Check=1
_END
_SUB Reg_unReg
	SET &dv1=!
	FIND $%2=getFragment, SET &dvc=*! SET &dvc=Directory *
	FORX * %&dvc% ,&dv2,
	{
		FIND $%1=--U,
		{
			REGI HKCR\%&dv2%\shell\%2\%&dv1%
		}!     
		{
			REGI $HKCR\%&dv2%\shell\%2\\=%1
			REGI $HKCR\%&dv2%\shell\%2\Icon="%&MyName%",0
			REGI $HKCR\%&dv2%\shell\%2\command\\="%&MyName%" %&regCMD% --%2 "%%1"
		}
	}
_END
_SUB CheckReg
	^IFEX $%%%1.Check%%=0, CALL Reg_unReg --U %3! CALL Reg_unReg %2 %3
_END
_SUB SetEnable
	FORX * %* ,&acz, ENVI @%&acz%.Enable=1
_END
_SUB SetDisable
	FORX * %* ,&acz, ENVI @%&acz%.Enable=0
_END
_SUB reSETtime
	FIND $%&L1%=, EXIT
	IFEX %&L1%,! EXIT
	CALL SetDisable &TS1 &L1 &CC &IC &IG &I1 &C1 &D1 &D2 &I2 &C2 &D3 &D4 &I3 &C3 &D5 &D6 &I4 &C4 &C5 &C6 &C7 &C8 &R1 &R2 &R3 &C9 &CA &CD &CE &CF &I5 &I6
	FNAM &ac9=%&MyName%
	SET &ac9="%Temp%\%&ac9%-%Random%.log"
	FILE -force %&ac9%
	SET &aca=
	SET &ack=
	SET &acm=
	SET &acw=
	SET &errCODE=0
	IFEX $%&CD.Check%=1, SET &acm=\u
	IFEX $%&CE.Check%=1, SET &acm=\l
	IFEX $%&R1.Check%=1, SET &aca=@
	IFEX $%&R2.Check%=1, SET &aca=
	IFEX $%&R3.Check%=1, SET &aca=$
	IFEX $[ %&CD.Check%=1 | %&CE.Check%=1 | %&CC.Check%=1 ],
	{*
		ENVI @&L1.Query=;&ack
		ENVI< &ack=%&NL%
	}
	IFEX $%&CC.Check%=1,
	{*
		SET &acl=FORX *NL &ack,&acj,
	}!   
	{*
		SET &acj=%&L1%
		SET &acl=FIND $%%&L1%%<>,
	}
	%&acl%
	{*
		ENVI &acb=
		ENVI &acd=
		ENVI &acc=
		ENVI &ac7=1
		IFEX $%&C9.Check%=1, SET &acb=%&acj%%&NL%
		IFEX $[ %&R1.Check%=1 | %&R2.Check%=1 | %&R3.Check%=1 ],!! SET &acc=FORX /S %&aca%%%&acj%%\*,&acd,,*
		%&acc%
		ENVI> &acd=%&acb%
		FORX *NL &acd,&ace,
		{*
			IFEX $%&C1.Check%=1,
			{*
				ENVI @&D1.VAL=?&ac1;&ac2;&ac3
				ENVI @&D2.VAL=?&ac4;&ac5;&ac6
				SITE *touch:c*local0:%&ac1%/%&ac2%/%&ac3%:%&ac4%:%&ac5%:%&ac6%,%&ace%,&errCODE1
				IFEX $%&errCODE1%<>0,
				{*
					SET &errCODE=%&errCODE1%
					WRIT %&ac9%,$+0,创建时间更改失败  错误码:%&errCODE1%  %&ace%
				}
			}
			IFEX $%&C2.Check%=1,
			{*
				ENVI @&D3.VAL=?&ac1;&ac2;&ac3
				ENVI @&D4.VAL=?&ac4;&ac5;&ac6
				SITE *touch:*local0:%&ac1%/%&ac2%/%&ac3%:%&ac4%:%&ac5%:%&ac6%,%&ace%,&errCODE1
				IFEX $%&errCODE1%<>0,
				{*
					SET &errCODE=%&errCODE1%
					WRIT %&ac9%,$+0,修改时间更改失败  错误码:%&errCODE1%  %&ace%
				}
			}
			IFEX $%&C3.Check%=1,
			{*
				ENVI @&D5.VAL=?&ac1;&ac2;&ac3
				ENVI @&D6.VAL=?&ac4;&ac5;&ac6
				SITE *touch:r*local0:%&ac1%/%&ac2%/%&ac3%:%&ac4%:%&ac5%:%&ac6%,%&ace%,&errCODE1
				IFEX $%&errCODE1%<>0,
				{*
					SET &errCODE=%&errCODE1%
					WRIT %&ac9%,$+0,访问时间更改失败  错误码:%&errCODE1%  %&ace%
				}
			}
			IFEX $%&C4.Check%=1,
			{*
				IFEX $%&C5.Check%=1, SET &acf=+S! SET &acf=-S
				IFEX $%&C6.Check%=1, SET &acg=+H! SET &acg=-H
				IFEX $%&C7.Check%=1, SET &ach=+R! SET &ach=-R
				IFEX $%&C8.Check%=1, SET &aci=+A! SET &aci=-A
				SITE %&ace%,%&aci%%&acg%%&ach%%&acf%
				SET &errCODE1=%&error%
				IFEX $%&errCODE1%<>0,   //IFEX $[ %&errCODE1%<>0 | '%&ac8%'<>'' ],
				{*
					WRIT %&ac9%,$+0,文件属性更改失败  错误码:%&errCODE1%  %&ace%  //-%&ac8%
					SET &errCODE=1
				}
			}
			FIND $%&acm%<>,
			{*
				FDIR --short --fullfile &act=%&ace%
				FDIR --long --fullfile &acu=%&act%
				FIND $%&acu%<>,
				{*
					FNAM -ext &acn=%&acu%
					FDIR &aco=%&acu%
					SED -ex &acp=0,.*,%&acm%,&acn
					CODE **,&acn,*ANSI,&acq
					CODE **,&acp,*ANSI,&acr
					FIND $%&acq%<>%&acr%,
					{*
						IFEX %&aco%\%&acp%\, SET &acs=>>! SET &acs=->
						FILE "%&acu%"%&acs%"%&aco%\%&acp%"
						SET &errCODE1=%&error%
						IFEX $[ %&C9.Check%=1 & %&ac7%=1 & %&errCODE1%=0 ], ENVI< &acw=%&aco%\%&acp%%&NL%
						IFEX $%&errCODE1%<>0,
						{*
							SET &errCODE=%&errCODE1%
							WRIT %&ac9%,$+0,文件名大小写转换失败  错误码:%&errCODE1%  %&ace%
						}
					}
				}
			}
			CALC #&ac7=%&ac7%+1
		}
	}
	FIND $%&acw%<>,
	{
		ENVI @@DeskTopFresh=1
		SET &acx=%&L1.isel%
		FORX *NL &acw,&acy,
		{*
			LPOS* * ,&ap1=%&acy%%&NL%,1,&ack
			IFEX $%&ap1%>0, WRIT *v *fv &ack,%&ap1%,&acy
		}
		SED -ex &ap2=0,%&NL%,|,&ack
		ENVI @&L1.Val=%&ap2%
		ENVI @&L1.isel=%&acx%
		FNAM -ext &acv=%&L1%
		ENVI @&E7=%&acv%
	}
	IFEX $%&errCODE%=0, MESS+icon %&NL%%&NL%    成功完成！ @提示#OK*5000! CALL @MyMess
	FILE -force %&ac9%
	CALL SetEnable &TS1 &L1 &CC &IC &IG &I1 &C1 &D1 &D2 &I2 &C2 &D3 &D4 &I3 &C3 &D5 &D6 &I4 &C4 &C5 &C6 &C7 &C8 &R1 &R2 &R3 &C9 &CA &CD &CE &CF &I5 &I6
_END
_SUB TimeOut *
	ENVI @this=%~1 %&ar1%
	CALC #&ar1=%&ar1%-1
	IFEX $%&ar1%<0, TEAM ENVI @&T3=0| KILL \
_END
_SUB AutoFileCase
	MSTR &ao1=<2->%*
	FNAM -ext &ao2=%&ao1%
	SED -ex &ao3=0,.*,\u,&ao2
	SED -ex &ao4=0,.*,\l,&ao2
	FIND*c *&ao4=&ao2, ENVI &ao4=%&ao3%  //CODE **,&ao2,*ANSI,&ao4  //有了*c，就不用转成16进制比较了
	FDIR &ao5=%&ao1%
	IFEX "%&ao5%\%&ao4%\", ENVI &ao6=>>! SET &ao6=->
	FILE %&ao1%%&ao6%"%&ao5%\%&ao4%"
	ENVI &ao7=%&error%
	ENVI @@DeskTopFresh=1
	EXIT= %&ao7%
_END
_SUB Cursor
	FORX * %* ,&bwg, ENVI @%&bwg%.Cursor=32649  //32651
_END
_SUB OnSrc
	FIND $%&L1%=, ENVI &f=%CurDir%! ENVI &f=%&L1%
	BROW &f,*%&f%,请选择一个文件或文件夹,,0x10004000
	FIND $%&f%<>,
	{
		CALL SETlist &L1 %&f%
		CALL getTIME
	}
_END
_SUB SETlist
	MSTR &tLIST=<2->%*
	ENVI @%1.SEL=%&tLIST%
	^FIND $%%%~1%%<>%%&tLIST%%, ENVI @%1.ADDSEL=%&tLIST%
_END
_SUB Mouse_In
	FIND $%~2=, ENVI &d2=%&NL%! ENVI &d2=%~2
	TEAM ENVI @@Cur=?&bwd;&bwe| TIPS. %~1,%&d2%,1000000000,1,@AL%&bwd%T%&bwe%
_END
_SUB getRfile
	IFEX %2, TEAM ENVI @&L1.ADDSEL=%~2| CALL getTIME
_END
_SUB getSOURCE
	ENVI ?,&Allfile=DROPFILE,%~2
	CALL SetDisable &TS1 &L1 &CC &IC &IG &I1 &C1 &D1 &D2 &I2 &C2 &D3 &D4 &I3 &C3 &D5 &D6 &I4 &C4 &C5 &C6 &C7 &C8 &R1 &R2 &R3 &C9 &CA &CD &CE &CF &I5 &I6
	FORX *NL &Allfile,&fir, CALL SETlist %1 %&fir%
	CALL getTIME
	CALL SetEnable  &TS1 &L1 &CC &IC &IG &I1 &C1 &D1 &D2 &I2 &C2 &D3 &D4 &I3 &C3 &D5 &D6 &I4 &C4 &C5 &C6 &C7 &C8 &R1 &R2 &R3 &C9 &CA &CD &CE &CF &I5 &I6
_END
_SUB getTIME
	FIND $%&L1%=, EXIT
	IFEX %&L1%,! EXIT
	IFEX $[ %&I2.Check%=0 | %&I3.Check%=0 | %&I4.Check%=0 ],!! SITE ?-local &a1,&a2,&a3=FTIME,"%&L1%"           //[2020 02 10 20 04 36 000 1]  [年 月 日 时 分 秒 毫秒 星期]
	IFEX $%&I2.Check%=0,
	{
		MSTR * &aa1,&aa2,&aa3,&aa4,&aa5,&aa6=<1*>&a1
		ENVI @&D1.VAL=%&aa1%;%&aa2%;%&aa3%
		ENVI @&D2.VAL=%&aa4%;%&aa5%;%&aa6%
	}
	IFEX $%&I3.Check%=0,
	{
		MSTR * &aa1,&aa2,&aa3,&aa4,&aa5,&aa6=<1*>&a2
		ENVI @&D3.VAL=%&aa1%;%&aa2%;%&aa3%
		ENVI @&D4.VAL=%&aa4%;%&aa5%;%&aa6%
	}
	IFEX $%&I4.Check%=0,
	{
		MSTR * &aa1,&aa2,&aa3,&aa4,&aa5,&aa6=<1*>&a3
		ENVI @&D5.VAL=%&aa1%;%&aa2%;%&aa3%
		ENVI @&D6.VAL=%&aa4%;%&aa5%;%&aa6%
	}
	SITE ?&aa7,&aa8,&aa9,&aaa=FATTR,"%&L1%"
	ENVI @&C5.Check=%&aaa%
	ENVI @&C6.Check=%&aa8%
	ENVI @&C7.Check=%&aa9%
	ENVI @&C8.Check=%&aa7%
	FNAM -ext &aah=%&L1%
	ENVI @&E7=%&aah%
	IFEX %&L1%\,
	{
		ENVI @&E1=
		ENVI @&E2=
		ENVI @&E3=
	}!   
	{
		ENVI ?&aab,&aac=PEBIT,"%&L1%"
		SITE ?&aad,&aae=FVER,"%&L1%"
		ENVI ?,,,,&aai=FPOS,"%&L1%"
		SET &aac=%&aab% (%&aac%)
		FIND $%&aab%=,
		{*
			ENVI &aac=
			ENVI$ &lpBinaryType=*8 0
			CALL $--qd --bool --ret:&GetBinaryTypeWRet Kernel32.dll,GetBinaryTypeW,$\\?\%&L1%,*&lpBinaryType
			IFEX $%&GetBinaryTypeWRet%<>0,
			{*
				ENVI?ptr &lpBinaryType=&BinaryType
				IFEX $%&BinaryType%=0, ENVI &aac=x86
				IFEX $%&BinaryType%=1, ENVI &aac=MS-DOS
				IFEX $%&BinaryType%=2, ENVI &aac=x16
				IFEX $%&BinaryType%=3, ENVI &aac=MS-DOS PIF
				IFEX $%&BinaryType%=4, ENVI &aac=POSIX
				IFEX $%&BinaryType%=5, ENVI &aac=x16 OS/2
				IFEX $%&BinaryType%=6, ENVI &aac=x64
			}
			FIND $%&aac%=,
			{*
				GETF "%&L1%",0#0x2,&aal
				FIND $%&aal%=0x4D 0x5A,
				{*
					GETF "%&L1%",0x3C#0x2,&aam
					SED &aan=0,0x,,%&aam%
					MSTR &aao,&aap=<1*>%&aan%
					GETF "%&L1%",0x%&aap%%&aao%#0x2,&aaq
					FIND $[ '%&aaq%'='0x50 0x45' | '%&aaq%'='0x4E 0x45' ],  //win32程序  //16位程序
					{*
						CALC -base=16 &aar=0x%&aap%%&aao%+4
						GETF "%&L1%",%&aar%#0x2,&aas
						FIND $%&aas%=0x15 0x01, ENVI &aac=x16 (0x01153C05454E)
						FIND $%&aas%=0x4C 0x01, ENVI &aac=x86 (0x014C00004550)
						FIND $%&aas%=0x00 0x02, ENVI &aac=ia64 (0x020000004550) //Intel Itanium
						FIND $%&aas%=0x64 0x86, ENVI &aac=x64 (0x866400004550)
						FIND $%&aas%=0xC4 0x01, ENVI &aac=arm (0x01C400004550)
						FIND $%&aas%=0x64 0xAA, ENVI &aac=arm64 (0xAA6400004550)
					}
				}
			}
		}
		IFEX $[ %&aai%=0 | %&aai%=1 ], SET &aaj=文件连续，无碎片！! SET &aaj=%&aai% 个碎片
		FIND $%&aad%%&aae%=, ENVI &aak=! ENVI &aak=%&aad% / %&aae%
		ENVI @&E1=%&aak%
		ENVI @&E2=%&aac%
		ENVI @&E3=%&aaj%
	}
	SIZE -link &aaf="%&L1%"
	CALL CalcSize &aag %&aaf%
	ENVI @&E4=%&aag% (%&aaf% 字节)
_END
_SUB CalcSize
	^CALC &Absolute=abs(%2)  //负数取绝对值
	TEAM                                                            ENVI &Divisor=1|       ENVI &Unit=B   //Byte
	IFEX $[ %&Absolute%>=1K & %&Absolute%<1M ],                TEAM ENVI &Divisor=1K|      ENVI &Unit=KB  //KiloByte  （10的3次幂）
	IFEX $[ %&Absolute%>=1M & %&Absolute%<1G ],                TEAM ENVI &Divisor=1M|      ENVI &Unit=MB  //MegaByte  （10的6次幂）
	IFEX $[ %&Absolute%>=1G & %&Absolute%<1T ],                TEAM ENVI &Divisor=1G|      ENVI &Unit=GB  //GigaByte  （10的9次幂）
	IFEX $[ %&Absolute%>=1T & %&Absolute%<1024T ],             TEAM ENVI &Divisor=1T|      ENVI &Unit=TB  //TeraByte  （10的12次幂）
	IFEX $[ %&Absolute%>=1024T & %&Absolute%<1048576T ],       TEAM ENVI &Divisor=(1K*1T)| ENVI &Unit=PB  //PetaByte  （10的15次幂）
	IFEX $[ %&Absolute%>=1048576T & %&Absolute%<1073741824T ], TEAM ENVI &Divisor=(1M*1T)| ENVI &Unit=EB  //ExaByte   （10的18次幂）
	IFEX $%&Absolute%>=1073741824T,                            TEAM ENVI &Divisor=(1G*1T)| ENVI &Unit=ZB  //ZettaByte （10的21次幂）
	^CALC &Quotient=%2/%&Divisor%#2
	ENVI-ret %1=%&Quotient% %&Unit%
_END
_SUB fixDATE
	MENU ,设置为当前系统日期, CALL setDATE %*
_END
_SUB fixTIME
	MENU ,设置为当前系统时间, CALL setTIME %*
_END
_SUB setDATE
	DATE &ab1     //2020-2-11|2|14:12:34.692    //年-月-日|星期|时:分:秒.毫秒
	MSTR * -delims:| &ab2=<1>&ab1
	SED &ab3=0,\-,;,%&ab2%
	ENVI @%1.VAL=%&ab3%
_END
_SUB setTIME
	DATE &ab4
	MSTR * -delims:| &ab5=<3>&ab4
	SED &ab6=0,\:,;,%&ab5%
	ENVI @%1.VAL=%&ab6%
_END
_SUB getFILEmsg *
	IFEX $[ ( %&wp%=0x25 | %&wp%=0x26 | %&wp%=0x27 ) & %&KeyDown%=0 & '%&L1%'<>'' ],  //0x25 左     0x27 右     0x26 上
	{*
		ENVI-ret &KeyDown=1
		IFEX $%&wp%=0x25,
		{
			SET &aq1=
			ENVI @&L1.Query=;&aq2
			FORX *NL &aq2,&aq3,
			{*
				FNAM -ext &aq4=%&aq3%
				ENVI< &aq1=%&aq4%%&NL%
				ENVI^ Clipboard=%&aq1%
			}
		}
		IFEX $%&wp%=0x27,
		{
			ENVI @&L1.Query=;&aq5
			ENVI^ Clipboard=%&aq5%
		}
		IFEX $%&wp%=0x26,
		{
			ENVI^ Clipboard=%&L1%
		}
		MESS+icon %&NL%%&NL%    成功完成！ @提示#OK*5000
		ENVI-ret &KeyDown=0
	}
_END
_SUB chkWCSorEXE
	MSTR * &tmpSTR=-4,5,&CurFile
	FIND $%&tmpSTR%=.exe#,
	{*
		RSTR * &myWCS=4,&CurFile
		FIND $%&myWCS%=#101, ENVI &regCMD=! ENVI &regCMD=LOAD %&myWCS%
	}!   
	{*
		ENVI &regCMD=LOAD "%&CurFile%"
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
