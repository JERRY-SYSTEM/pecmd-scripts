#code=936T950
LOGS
//IFEX "%CurFile%.LOG", LOGS **t=1 **ON=1 **2 * "%CurFile%.LOG"
ENVI^ EnviMode=1
ENVI^ ForceLocal=1
SET$ &NL=0d 0a
SET$ &NL1=0d
SET$ &TAB=09
SITE ?&exeVER=FVER,%MyName%
ENVI &Win_Title=< 单文件制作工具 >制作：JexChan  QQ：527104427  版本：%&exeVER%

MSTR * &Build=<-1>&PECMDBUILD
SED &Build=0,[^0-9],,%&Build%
IFEX $[ %&PECMDVER%<201201880585 | %&Build%<20210314 ], TEAM MESS+icon6 %&NL%%&NL%PECMD 版本低于 201201.88.05.85  Build: 2021-03-14，程序无法运行！ @%&Win_Title%   #OK*5000| EXIT

SET &::EN_CHANGE=0x0300
SET &::WM_KEYDOWN=0x0100
SET &::WM_LBUTTONDOWN=0x0201
SET &::WM_RBUTTONDOWN=0x0204
SET &::WM_LBUTTONDBLCLK=0x0203
SET &::WM_MOUSEENTER=0x1000
SET &::WM_MOUSELEAVE=0x02A3
SET &::WM_DROPFILES=0x0233
SET &::WM_SIZE=0x0005
SET &::SIZE_MAXSHOW=3
SET &::SIZE_MAXIMIZED=2
SET &::SIZE_RESTORED=0
SET &::CBN_HOVER=0x7001
SET &::SB_VERT=1
SET &::SIF_POS=0x0004
SET &::WM_VSCROLL=0x0115
SET &::SB_BOTTOM=7
SET &::EM_GETSEL=0x00B0
SET &::EM_SETSEL=0x00B1
//LOCK --try  #GreenSoft_Start_exe,&dha
//IFEX $%&dha%<>0, TEAM ENVI &dha=| FIND --wid &dha,%&Win_Title%| ENVI @@Visible=%&dha%:2| ENVI @@POS=%&dha%:::::::1| EXIT
ENVI &verSTR=FileVersion CompanyName Comments FileDescription ProductVersion ProductName LegalCopyright LegalTrademarks InternalName OriginalFileName SpecialBuild PrivateBuild
ENVI &newVERcode=File Version(文件版本)%&NL%Company Name(公司名称)%&NL%Comments(注释)%&NL%File Description(文件描述)%&NL%Product Version(产品版本)%&NL%Product Name(产品名称)%&NL%Legal Copyright(合法版权)%&NL%Legal Trademarks(合法商标)%&NL%Internal Name(内部名称)%&NL%Original FileName(源文件名)%&NL%Special Build(特殊构建)%&NL%Private Build(私有构建)
ENVI &tmpVERcode=&xa%&NL%&xb%&NL%&xc%&NL%&xd%&NL%&xe%&NL%&xf%&NL%&xg%&NL%&xh%&NL%&xi%&NL%&xj%&NL%&xk%&NL%&xl
ENVI &Font_Cmd=IFEX %windir%\fonts\simsun*, ENVI @this.Font=9:simsun! ENVI @this.Font=9
ENVI &ResHacker=*#1
ENVI &mpress=*#2
ENVI &makecab=*#3
ENVI &RC=*cab:#4:RC.exe
ENVI &Compatible=#5
ENVI &verSOURCE=#6
ENVI &adminSOURCE=#7
ENVI &UPX=*#8
//ENVI &icon=#9
ENVI &zh-cn=#10
ENVI &zh-tw=#11
ENVI &extractIcon=*#12
ENVI ?&WinVer=WinVer
ENVI &Wide=561
ENVI &High=580
ENVI &myPWD=
ENVI &7zPWD=
ENVI &top=
ENVI &CV.autoRUN=0  //每次开机运行(单文件自身)
ENVI &CW.autoRUN=0  //每次开机运行(包内程序)
ENVI &recoverOLD=0  //跳过已有文件
ENVI &vordCANCEL=0  //隐藏取消按钮
//CALL resetVAR
ENVI &verHEX=0x00 0x00 0x00 0x00 0x20 0x00 0x00 0x00 0xFF 0xFF 0x00 0x00 0xFF 0xFF 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x20 0x00 0x00 0x00 0xFF 0xFF 0x10 0x00 0xFF 0xFF 0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x04 0x08 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//zipPACH，160字节，SFX单文件补丁
ENVI &zipPACH=0x50 0x4B 0x03 0x04 0x0A 0x00 0x00 0x00 0x00 0x00 0x98 0xA9 0x3E 0x3E 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x08 0x00 0x00 0x00 0xFF 0x2E 0x72 0x73 0x64 0x61 0x74 0x61 0x50 0x4B 0x01 0x02 0x3F 0x00 0x0A 0x00 0x00 0x00 0x00 0x00 0x98 0xA9 0x3E 0x3E 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x08 0x00 0x24 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x20 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0x2E 0x72 0x73 0x64 0x61 0x74 0x61 0x0A 0x00 0x20 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x18 0x00 0x96 0xBD 0xCF 0x0F 0xBA 0xC0 0xCB 0x01 0xB5 0x82 0xC7 0x2D 0xBB 0xC0 0xCB 0x01 0x1C 0xC5 0xDC 0x00 0xBA 0xC0 0xCB 0x01 0x50 0x4B 0x05 0x06 0x00 0x00 0x00 0x00 0x01 0x00 0x01 0x00 0x5A 0x00 0x00 0x00 0x26 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//sfxPACH，155字节，PECMD单文件补丁
ENVI &sfxPACH=0x00 0x00 0x00 0x00 0x00 0x5A 0xA9 0x3E 0x3E 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x08 0x00 0x00 0x00 0xFC 0x2E 0x72 0x73 0x64 0x61 0x74 0x61 0x50 0x4B 0x01 0x02 0x3F 0x00 0x0A 0x00 0x00 0x00 0x00 0x00 0x98 0xA9 0x3E 0x3E 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x08 0x00 0x24 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x20 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xFF 0x55 0x72 0x73 0x64 0x61 0x74 0x61 0x0A 0x00 0x20 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x3B 0x00 0x96 0xBD 0xCF 0x0F 0xBA 0xC0 0xCB 0x01 0xB5 0x82 0xC7 0x2D 0xBB 0xC0 0xCB 0x01 0x1C 0xC5 0xDC 0x00 0xBA 0xC0 0xCB 0x01 0x50 0x4B 0x05 0x06 0x00 0x00 0x00 0x00 0x01 0x00 0x01 0x00 0x5A 0x00 0x00 0x00 0x26 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
ENVI &sfxOLDpach=0x98 0x4B 0x03 0x04 0x0A %&sfxPACH%
ENVI &tmpHEAD=0x96 0xBD 0xCF 0x0F 0xBA 0xC0 0xCB 0x01
ENVI &cabHEAD=0x4D 0x53 0x43 0x46 0x00 0x00 0x00 0x00
ENVI &7zHEAD=0x37 0x7A 0xBC 0xAF 0x27 0x1C 0x00 0x04
ENVI &.mprss=0x2E 0x4D 0x50 0x52 0x45 0x53 0x53    //.MPRESS
ENVI &.mprss1=%&.mprss% 0x31    //.MPRESS1
ENVI &.mprss2=%&.mprss% 0x32    //.MPRESS2
ENVI &.cab=0x00 0x2E 0x43 0x41 0x42   //.CAB，5字节
ENVI &.7z=0x00 0x2E 0x37 0x5A 0x00    //.7Z，5字节
ENVI &newSTR=0x00 0x4E 0x45 0x57 0x00   //字符串“NEW”，标志字符，5字节
ENVI &headCMPa=0x43 0x4D 0x50 0x61    //CMPa
ENVI &tempCMPa=0x98 0xA9 0x3E 0x3E    //替换CMPa的字符串
//内核为PECMD不勾选防修改补丁时以此标志结束  //内核+标志+压缩包  //#####!@PECMDEnd@!#####
ENVI &sfxEND=0x23 0x23 0x23 0x23 0x23 0x21 0x40 0x50 0x45 0x43 0x4D 0x44 0x45 0x6E 0x64 0x40 0x21 0x23 0x23 0x23 0x23 0x23
ENVI &sfxENDstr=#####!@PECMDEnd@!#####

//隐藏资源管理器左边的快速访问，只处理了64位注册表，没有除了WOW64的注册表。会导致FILE加了-force参数时会在桌面上生成“快速访问”的快捷方式
IFEX $[ %&::bX64%=1 & %&WinVer%>=0xA00000000 ],
{
	ENVI &CLSID=CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder\Attributes
	ENVI &Ates=2690646016
	ENVI &regCMD=REGI #HKCR\%&CLSID%,&Attributes
	%&regCMD%
	IFEX $%&Attributes%=%&Ates%,
	{
		ENVI &regCMD=REGI #HKCR\WOW6432Node\%&CLSID%,&Attributes
		%&regCMD%
		IFEX $%&Attributes%<>%&Ates%,
		{
			ENVI &regCMD=REGI #HKCR\WOW6432Node\%&CLSID%=%&Ates%
			%&regCMD%
		}
	}
}

//IFEX #%&WinVer%>=0xA00000000, CALL $--ret:&DPI_Aware user32.dll,SetProcessDPIAwareness,#1! CALL $--ret:&DPI_Aware user32.dll,SetProcessDPIAware   //设置DPI-aware，用于感知 DPI，强制使用XP风格DPI缩放比,0xA00000000为win10
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
CALL @WIN1

_SUB resetVAR *
	ENVI &myVER%&L1.isel%=       //版本信息(所有内容)
	ENVI &valueSTR%&L1.isel%=    //版本信息(value值)
	ENVI &tablMSG%&L1.isel%=     //版本信息(表格值)
	ENVI &tablAMSG%&L1.isel%=    //插入
	ENVI &tablBMSG%&L1.isel%=    //快捷方式
	ENVI &tablCMSG%&L1.isel%=    //版本信息源文件
	ENVI &tablDMSG%&L1.isel%=    //排除不需要隐藏的文件
	ENVI &tablEMSG%&L1.isel%=    //排除不需要压缩的文件
	ENVI &tablJMSG%&L1.isel%=    //变量
	ENVI &myFileVersion%&L1.isel%=     //文件版本
	ENVI &myProductVersion%&L1.isel%=  //产品版本
	ENVI &extractPATH%&L1.isel%=       //解压路径
	FORX * 1 2 3 4 5 6 7 8 ,&xPOS, ENVI &EI%&xPOS%_%&L1.isel%=   //版本号中以逗号为分隔的内容
_END

_SUB WIN1,W%&Wide%H%&High%,%&Win_Title%,TEAM TIPS -| CALL KillMe,%MyName%,,, %&ScaleCMD% //-maxb //-discloseb
	ENVI @this.POS=?::&djc:&djd
	ENVI @this.HitTest=%&djd%:::20
	IFEX $[ %&djc%=%&Wide% | %&djd%=%&High% ], ENVI @this.POS=::%&Wide%:%&High%
	ENVI @this.POS=?::&Wide2:&High2
	CALC &DPI=%&Wide2%/%&Wide%
	%&Font_Cmd%
	ENVI &WinID=%__WinID%
	ITEM-def &I9,L436T508W55H28,关闭,KILL \,
	ITEM &I8,L373T508W55H28,开始,CALL startCAB,
	ITEM &IA,L265T508W100H28,提取/修改/创建,CALL @WIN8,
	CHEK &CX,L17T2W84H19,本窗口置顶,CALL SETtop,
	LABE ,L38T42W66H25,源文件夹：,,
	LIST -h &L1,L96T38W376H200,,TEAM ENVI &dir=%&L1%| ENVI &oldL1=%&LC%| THREAD* CALL checkSOURCE,,0x10100
	ITEM &I1,L477T38W40H21,...,CALL view_drv,
	LABE ,L38T78W66H25,保存位置：,,
	LIST -h &L2,L96T74W308H200,,,,0x10100
	CHEK &CV,L410T69W66H30,开机运行,CALL @--popmenu autoRUN &CV,
	ITEM &I2,L477T74W40H21,...,CALL save_file,
	LABE ,L38T125W45H25,内核：,,
	LIST -h &LD,L74T121W67H200,PECMD|7zSFX,CALL setL5,PECMD,0x10100
	LABE ,L165T125W45H25,参数：,,
	EDIT+ -3D &E1,L202T120W188H23,,,
	LABE ,L414T125W45H25,加壳：,,
	LIST &LE,L449T121W67H200,不加壳|Mpress|UPX压缩,,UPX压缩,0x100
	LABE ,L38T160W66H25,程序位数：,,
	LIST -h &L5,L98T156W115H200,64位|32位|32位/64位自适应,CALL setBIT,32位/64位自适应,0x10100
	LABE ,L237T160W70H25,压缩方式：,,
	LIST &L6,L297T156W50H200,7z|cab,TEAM CALL setPROG| CALL setPWDchk,7z,0x10100
	LABE ,L370T160W70H25,压缩级别：,,
	LIST &L7,L430T156W86H200,仅存储|极速压缩|快速压缩|标准压缩|最大压缩|极限压缩,,极限压缩,0x100
	CHEK &C1,L43T190W55H25,运行：,,1
	LABE ,L100T196W38H25,x86：,,
	LIST -h &L3,L128T192W90H200,,TEAM ENVI &fir=%&L1%\%&L3%| CALL setSOURCE,,0x10100
	ITEM &I3,L223T192W40H21,...,CALL view_file &L3,
	LABE ,L283T196W38H25,x64：,,
	LIST -h &L4,L312T192W90H200,,TEAM ENVI &fir=%&L1%\%&L4%| CALL setSOURCE,,0x10100
	ITEM &I4,L407T192W40H21,...,CALL view_file &L4,
	CHEK &CW,L452T188W66H30,开机运行,TEAM CALL PingPangCheck &CW &CA| CALL @--popmenu autoRUN &CW,
	CHEK &C4,L38T236W70H30,隐藏运行,,
	CHEK &C5,L122T236W80H30,请求管理员,,1
	CHEK &C6,L219T236W70H30,兼容算法,,1
	CHEK &C7,L306T236W70H30,解压路径,TEAM CALL checkDELsfx| CALL checkWIN6,-
	CHEK &CS,L306T236W70H30,CMPS加密,,17
	CHEK &C8,L392T236W48H30,插入,CALL checkWIN3,-
	CHEK &C2,L452T236W76H30,解压进度,CALL @--popmenu VisCancel,
	CHEK &C9,L38T270W70H30,快捷方式,CALL checkWIN4,-
	CHEK &CA,L120T270W98H30,删除释放文件,TEAM CALL PingPangCheck &CA &CW| CALL checkSFXpath,1
	CHEK &CB,L225T270W72H30,自我删除,CALL PingPangCheck &CB &CV,
	CHEK &CR,L308T270W143H30,排除不需要打包的文件,CALL checkWIN7 压缩 E "$" &CR,-  //去掉$则不显示文件夹
	CHEK &CC,L464T270W60H30,不等待,CALL PingPangCheck &CC &CN,
	CHEK &CD,L38T304W76H30,允许多开,CALL checkRUNmore,1
	CHEK &CE,L123T304W114H30,隐藏释放文件夹,,1
	CHEK &CF,L246T304W126H30,隐藏所有释放文件,CALL checkWIN7 隐藏 D "$",-
	CHEK &CK,L380T304W145H30,解压前删除目标文件夹,,
	CHEK &CI,L38T338W102H30,覆盖现有文件,CALL @--popmenu forceREC,1
	CHEK &C3,L150T338W113H30,解压后打开目录,,
	CHEK &CQ,L275T338W52H30,变量,CALL checkWINA,
	CHEK &CL,L340T338W63H30,防修改,CALL checkIFpwd,
	CHEK &CN,L416T338W108H30,等待所有子进程,TEAM CALL PingPangCheck &CN &CC| CALL @--popmenu SuperWait,-1
	CHEK &CT,L38T372W76H30,解压密码,CALL checkWINC,
	CHEK &CU,L130T372W239H30,运行时自动输入解压密码，不弹出输入框,,-
	CHEK &CJ,L391T372W131H30,提取压缩包需要密码,CALL checkWIN9,
	//RADI &R1,L367T364W58H30,不加壳,,1,
	//RADI &R2,L440T364W87H30,Mpress加壳,,,
	CHEK &CG,L38T424W77H25,图标文件：,,1
	LIST -h &L8,L117T427W355H200,,,,0x10100
	ITEM &I5,L477T427W40H21,...,CALL view_icon,
	CHEK &CH,L38T460W77H25,版本信息：,,1
	LIST -h &L9,L117T463W310H200,,,,0x100
	ITEM &I7,L429T463W47H21,编辑,TEAM CALL getMSG| CALL @WIN2,
	ITEM &I6,L477T463W40H21,...,CALL view_ver,
	//LIST &LA,L1T1W1H1,
	//LIST &LB,L1T1W1H1,
	LIST &LC,L1T1W1H1,
	EDIT &saveCODE,L1T1W1H1,0,,0x18
	EDIT &exitCODE,L1T1W1H1,0,,0x18
	EDIT &KernelCODE,L1T1W1H1,,,0x18
	LABE -3D ,L17T23W518H2,,,
	LABE -3D ,L17T108W518H2,,,
	LABE -3D ,L17T227W518H2,,,
	LABE -3D ,L17T411W518H2,,,
	LABE -3D ,L17T497W518H2,,,
	LABE -3D ,L17T23W2H476,,,
	LABE -3D ,L534T23W2H476,,,
	PBAR &PartBar,L27T512W230H20,0
	ENVI @&PartBar.color=0xFFFFFF   //0xFF(红)     //进度条上的数字
	//ENVI @&PartBar.bkcolor=0x00FF00  //背景(绿)
	LABE &STATUS1,L490T516W52H20,?)关于,EXEC -incmd PECMD EXEC $http://bbs.wuyou.net/forum.php?mod=viewthread&tid=419412&fromuid=378114,0xDF0029  //0xFF9933
	ENVI @this.Visible=1
	WAIT 0.9
	//ENVI @&LA.Visible=0
	//ENVI @&LB.Visible=0
	ENVI @&LC.Visible=0
	CALL Cursor &I1 &I2 &I3 &I4 &I5 &I6 &I7 &I8 &I9 &IA &C1 &C2 &C3 &C4 &C5 &C6 &C7 &C8 &C9 &CA &CB &CC &CD &CE &CF &CG &CH &CI &CJ &CK &CL &CN &CQ &CR &CS &CT &CU &CV &CW &CX //&R1 &R2
	CALL Disable &L2 &L3 &L4 &L5 &L6 &L7 &L8 &L9 &LD &LE &I2 &I3 &I4 &I5 &I6 &I7 &I8   //&C7 &C8 &C9 &CN &CF &CR &CU
	ENVI @&L1.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getSOURCE "%&wp%" "%&lp%"
	ENVI @&L2.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getRES &L2 "%&wp%" "%&lp%"
	ENVI @&L3.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &L3 "%&wp%" "%&lp%"
	ENVI @&L4.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &L4 "%&wp%" "%&lp%"
	ENVI @&L8.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getRES &L8 "%&wp%" "%&lp%"
	ENVI @&L9.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getRES &L9 "%&wp%" "%&lp%"
	ENVI @&L1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L1%"
	ENVI @&L2.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L2%"
	ENVI @&L3.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L3%"
	ENVI @&L4.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L4%"
	ENVI @&L8.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L8%"
	ENVI @&L9.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&L9%"
	//ENVI @&LD.MSG=%&WM_MOUSEENTER%: CALL Mouse_In "" %&LD%
	//ENVI @&R2.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 注意： "Mpress加壳后，可能导致单文件不能运行！"
	ENVI @&CB.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "在单文件运行结束后，删除源文件！"
	ENVI @&CA.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "在单文件运行结束后，删除释放出来的文件！"
	ENVI @&C9.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "在单文件运行前创建快捷方式！"
	ENVI @&C8.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "在单文件运行前后运行其它EXE、VBS、WCS、批处理、或导入注册表文件！"
	ENVI @&CD.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "允许同时运行多个相同的单文件！"
	ENVI @&CN.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "“变态等待模式”专门为ATILauncher.exe设计，其它程序不要用，否则会有预料不到的后果！"
	ENVI @&CR.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "制作单文件时，排除文件夹内不需要打包的文件！"
	//ENVI @&CI.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "不勾选此项，解压时将跳过已存在的文件！"
	ENVI @&CJ.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 提示： "用于提取压缩包时所用的密码，非解压密码，压缩包不加密！"
	FORX * &L1 &L2 &L3 &L4 &L8 &L9 &CB &CA &C9 &C8 &CD &CI &CJ &CN &CR,&tmpITEM, CALL Mouse_Out %&tmpITEM%  //&R2
_END

_SUB WIN2,W543H422,版本信息编辑,CALL saveMSG,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	TEAM CALC &df1=int(140*%&DPI%)| CALC &df2=int(990*%&DPI%)
	ENVI &dfz=*%&df1%:         键%&TAB%*%&df2%:                值
	ITEM-def &II4,L430T352W78H27,取消,KILL \,
	ITEM &II3,L330T352W78H27,保存,TEAM ENVI @&saveCODE=1| KILL \,
	TABL -font:::::0.5:::::21 &TABL,L12T15W512H232,%&dfz%,%&msg7%,0x10040
	LABE ,L111T275W8H13,，,,
	LABE ,L156T275W8H13,，,,
	LABE ,L201T275W8H13,，,,
	LABE ,L387T275W8H13,，,,
	LABE ,L432T275W8H13,，,,
	LABE ,L477T275W8H13,，,,
	LABE ,L12T262W76H24,文件版本：,,
	EDIT+ -3D &EI1,L70T257W43H24,%&EI1_%,,0x400,,   //11
	EDIT+ -3D &EI2,L115T257W43H24,%&EI2_%,,0x400,,  //11
	EDIT+ -3D &EI3,L160T257W43H24,%&EI3_%,,0x400,,  //11
	EDIT+ -3D &EI4,L205T257W43H24,%&EI4_%,,0x400,,  //11
	LABE ,L288T262W76H24,产品版本：,,
	EDIT+ -3D &EI5,L346T257W43H24,%&EI5_%,,0x400,,  //11
	EDIT+ -3D &EI6,L391T257W43H24,%&EI6_%,,0x400,,  //11
	EDIT+ -3D &EI7,L436T257W43H24,%&EI7_%,,0x400,,  //11
	EDIT+ -3D &EI8,L481T257W43H24,%&EI8_%,,0x400,,  //11
	EDIT+ -3D &EI9,L12T302W116H24,,,   //,,9:simsun
	EDIT+ -3D &EIA,L145T302W261H24,,,
	ITEM &II1,L420T302W46H24,新增,CALL changeTABL,
	ITEM &II2,L479T302W46H24,删除,CALL delTABL,
	ITEM &II5,L26T352W78H27,重新载入,TEAM CALL getMSG noSAVE| MESS+icon%&top% %&NL%%&NL%    刷新成功！ @提示#OK*5000,
	LABE -center ,L134T360W169H26,提示：可用鼠标右键操作,,0xDF0029
	LABE -3D ,L12T290W512H2,,,
	LABE -3D ,L12T336W512H2,,,
	EDIT &EIB,L1T1W1H1,0,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	CALL Cursor &II1 &II2 &II3 &II4 &II5
	ENVI @&EI9.ID=?;&EI9_ID
	ENVI @this.MSG=_COMMAND#%&EI9_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&EIB%<1, CALL checkCHANGE
	ENVI @&TABL.MSG=_%&WM_KEYDOWN%::&wp,&lp, CALL getHOTkey
	ENVI @&TABL.MSG=_%&WM_RBUTTONDOWN%: TEAM CALL setTABL| CALL @--popmenu rightMENU
	ENVI @&TABL.MSG=_%&WM_LBUTTONDOWN%: TEAM CALL setTABL
_END

_SUB WIN3,W543H422,插入EXE/VBS/WCS/批处理/注册表文件,TEAM TIPS -| CALL saveMSG "%&saveBAT%" noSAVEver &C8 A,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	TEAM CALC &df1=int(200*%&DPI%)| CALC &df2=int(70*%&DPI%)| CALC &df3=int(95*%&DPI%)
	ENVI &dfz=*%&df1%: EXE/VBS/WCS/批处理/注册表文件%&TAB%+%&df2%:隐藏运行%&TAB%+%&df3%:运行时机%&TAB%+%&df2%:运行模式%&TAB%+%&df3%:运行参数
	ITEM-def &IA6,L447T352W78H27,取消,KILL \,
	ITEM &IA5,L355T352W78H27,保存,TEAM ENVI &saveBAT=A| KILL \,
	ITEM &IA7,L12T352W78H27,PECMD 脚本,CALL @WINB,
	TABL -font:::::0.5:::::21 &TABLA,L12T15W512H239,%&dfz%,%&tmpTABL%,0x10040
	LIST -h &LA1,L12T270W470H200,,CALL resetTABL,,0x10100
	ITEM &IA1,L485T269W40H22,...,CALL viewREGBAT,
	LABE ,L12T308W41H21,参数：,,
	EDIT+ -3D &EA1,L45T303W80H22,,,
	ITEM &IA2,L133T303W40H22,删除,CALL redelTABL A %&LA1.isel% &LA1,
	ITEM &IA3,L180T303W40H22,上移,CALL updownTABL A %&LA1.isel% &LA1 -1,
	ITEM &IA4,L227T303W40H22,下移,CALL updownTABL A %&LA1.isel% &LA1 +1,
	LIST -h &LA2,L275T304W95H200,主程序运行前|主程序结束后,ENVI @&TABLA.Val=%&LA1.isel%.3;%&LA2%,主程序运行前,0x10100
	LIST -h &LA3,L379T304W95H195,等待结束|不等待,TEAM ENVI @&TABLA.Val=%&LA1.isel%.4;%&LA3%| CALL checkWAIT,等待结束,0x10100
	CHEK &CA1,L483T300W50H30,隐藏,CALL setCHECK,1
	LABE -center ,L107T360W230H26,提示：可用鼠标右键点击需要修改的列项,,0xDF0029
	LABE -3D ,L12T336W512H2,,,
	EDIT &EA2,L1T1W1H1,0,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	FIND $%&LD%=7zSFX, TEAM CALL Disable &IA7| ENVI @&LA3.ADD=等待所有子进程
	ENVI @&LA1.VAL=%&listLA%
	CALL resetTABL
	CALL Cursor &IA1 &IA2 &IA3 &IA4 &IA5 &IA6 &IA7 &CA1
	ENVI @&EA1.ID=?;&EA1_ID
	ENVI @this.MSG=_COMMAND#%&EA1_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&EA2%<1, TEAM ENVI @&EA2=1| SED &EA1x=0,%&TAB%, ,%&EA1%| ENVI @&TABLA.Val=%&LA1.isel%.5;%&EA1x%| ENVI @&EA2=0
	ENVI @&TABLA.MSG=_%&WM_LBUTTONDOWN%: CALL setTABL A &LA1
	ENVI @&TABLA.MSG=_%&WM_KEYDOWN%::&wp,&lp, CALL getHOTkey A &LA1
	ENVI @&TABLA.MSG=_%&WM_RBUTTONDOWN%: TEAM CALL setTABL A &LA1| CALL @--popmenu rightMENUa
	ENVI @this.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LA1 "%&wp%" "%&lp%" &LA1
	ENVI @&LA1.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LA1 "%&wp%" "%&lp%" &LA1
	ENVI @&LA1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LA1%"
	CALL Mouse_Out &LA1
_END

_SUB WIN4,W543H422,创建快捷方式,TEAM TIPS -| ENVI @&exitCODE=1| CALL saveMSG "%&saveBAT%" noSAVEver &C9 B,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	ENVI @&exitCODE=0
	TEAM CALC &df1=int(90*%&DPI%)| CALC &df8=int(120*%&DPI%)| CALC &df2=int(310*%&DPI%)| CALC &df3=int(230*%&DPI%)| CALC &df4=int(70*%&DPI%)| CALC &df5=int(290*%&DPI%)| CALC &df6=int(990*%&DPI%)
	ENVI &dfz=*%&df1%:   启动方式%&TAB%+%&df8%:目标路径%&TAB%+%&df8%:目标子目录%&TAB%*%&df1%:    名称%&TAB%*%&df2%:            源文件%&TAB%+%&df3%:运行参数%&TAB%*%&df2%:            图标路径%&TAB%+%&df4%:图标索引%&TAB%+%&df5%:备注%&TAB%*%&df6%:           工作目录
	ITEM-def &IB5,L430T352W78H27,取消,KILL \,
	ITEM &IB4,L339T352W78H27,保存,TEAM ENVI &saveBAT=B| KILL \,
	ITEM &IB7,L248T352W78H27,中止,TEAM ENVI @&exitCODE=1| ENVI @&IB7.Enable=0,
	TABL -font:::::0.5:::::21 &TABLB,L12T15W512H168,%&dfz%,,0x10040
	LABE ,L12T197W65H20,源文件：,,
	LIST -h &LB1,L58T193W466H200,,CALL setDIR,,0x10100
	LABE ,L12T226W65H20,目标路径：,,
	LIST -h &LB2,L70T222W110H200,桌面|开始菜单|开始程序菜单|开始菜单启动项,,桌面,0x10100
	LABE ,L213T226W65H20,工作目录：,,
	LIST -h &LB3,L271T222W253H200,,,,0x10100
	LABE ,L12T255W45H20,名称：,,
	EDIT+ -3D &EB1,L47T250W110H22,,,
	LABE ,L186T255W65H20,运行参数：,,
	EDIT+ -3D &EB2,L246T250W108H22,,,
	LABE ,L384T255W45H20,备注：,,
	EDIT+ -3D &EB3,L420T250W105H22,,,
	LABE ,L12T284W104H20,快捷方式子目录：,,
	EDIT+ -3D &EB5,L108T279W72H22,,,
	LABE ,L212T284W45H20,图标：,,
	LIST -h &LB4,L246T280W200H200,shell32.dll|imageres.dll|explorer.exe,TEAM ENVI @&EB4=,,0x100
	ITEM &IB6,L450T279W75H22,查看图标,CALL @WIN5,
	LABE ,L12T312W65H20,图标索引：,,
	EDIT+ -3D &EB4,L74T308W65H22,,,0x400
	LABE ,L170T312W65H20,启动方式：,,
	LIST -h &LB5,L230T308W100H200,默认|最小化窗口|最大化窗口|隐藏启动,,默认,0x10100
	ITEM &IB1,L360T307W46H22,修改,CALL changeTABLB,
	ITEM &IB2,L420T307W46H22,新增,CALL addTABLB 0,
	ITEM &IB3,L479T307W46H22,删除,CALL delTABLB,
	LABE -center &BB2,L30T360W200H26,,,0xDF0029
	LABE -3D ,L12T336W512H2,,,
	ENVI @this.Visible=1
	WAIT 0.9
	FIND $%&LD%=7zSFX,
	{
		CALL Disable &LB5
	}!
	{
		ENVI @&LB2.ADD=我的文档
		ENVI @&LB2.ADD=发送到目录
		ENVI @&LB2.ADD=锁定到任务栏
	}
	CALL Cursor &IB1 &IB2 &IB3 &IB4 &IB5 &IB6 &IB7
	ENVI @this.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LB1 "%&wp%" "%&lp%" "" &LB1
	ENVI @&LB1.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LB1 "%&wp%" "%&lp%" "" &LB1
	ENVI @&LB3.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getSOURCE "%&wp%" "%&lp%" &LB3
	ENVI @&LB4.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LB4 "%&wp%" "%&lp%" "" ""  &LB4
	ENVI @&TABLB.MSG=_%&WM_LBUTTONDOWN%: CALL setTABL B &LB1
	ENVI @&TABLB.MSG=_%&WM_KEYDOWN%::&wp,&lp, CALL getHOTkey B &LB1
	ENVI @&TABLB.MSG=_%&WM_RBUTTONDOWN%: TEAM CALL setTABL B &LB1| CALL @--popmenu delTABLB "MENU ,删除, "
	ENVI @&LB1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LB1%"
	ENVI @&LB3.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LB3%"
	ENVI @&LB4.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LB4%"
	FORX * 1 3 4,&tmpNUMB, CALL Mouse_Out &LB%&tmpNUMB%
	THREAD* CALL threadWIN4
_END

_SUB WIN5,W543H422,查看图标,,%&MyName%,,,-maxb -size %&ScaleCMD%
	CALL setPOS WIN4
	CALL SETtop
	%&Font_Cmd%
	FIND $[ '%&LB4%'='shell32.dll' | '%&LB4%'='imageres.dll' | '%&LB4%'='explorer.exe' ], ENVI &SRC=%&LB4%! ENVI &SRC=%&L1%\%&LB4%
	TEAM SET &I0=0| SET &PAGES=77| SET &I=0| SET &NX=| SET &NUM=0| SET &NUMx=| SET &W=543| SET &H=422| SET &y0=0| SET &x0=0| SET &w0=0| SET &bs=1| SET &TT=0| SET &step=1
	TEAM SET-def hv=0| SET-def IDX=0
	LABE ,L52T16W237H23,请用鼠标左键单击需要选择的图标编号！,,0xDF0029
	ITEM-def &ITEM1,L426T10W60H22,下一页,CALL OnNext,
	ITEM &ITEM2,L346T10W60H22,上一页,CALL OnPre,
	LABE -3D &BB1,L-8T40W559H2,,,
	ENVI @this.Visible=1
	WAIT 0.9
	ENVI @this.MSG=%&WM_SIZE%::&&wParm,&&lParm,CALL OnSize_WIN5 %&wParm% %&lParm%
	CALL OnInit
_END

_SUB WIN6,W543H215,解压路径设置,TEAM TIPS -| CALL savePATH "%&saveBAT%",%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	ITEM-def &IC4,L424T140W71H26,关闭,KILL \,
	ITEM &IC3,L334T140W71H26,保存,TEAM ENVI &saveBAT=C| KILL \,
	LABE ,L23T31W47H22,路径：,,
	LIST -h &LC1,L57T27W457H200,%&allLC1%,CALL setBC1,,0x10100
	LABE ,L23T66W47H22,目录：,,
	EDIT+ -3D &EC1,L57T62W255H22,%&pathDRV%,,
	ITEM &IC1,L321T61W60H24,随机,ENVI @&EC1=~%%RanDom%%,
	ITEM &IC5,L388T61W60H24,目录名,CALL setDIRname,
	ITEM &IC2,L455T61W60H24,程序名,CALL setFILEname,
	LABE -center &BC1,L23T95W491H30,,,0xDF0029
	LABE ,L23T147W261H22,注意：实际的变量值以单文件运行的系统为准！,,0xDF0029
	LABE -3D ,L23T127W491H2,,,
	EDIT &EC2,L1T1W1H1,0,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	ENVI @&LC1.ADD=解压前手动选择
	FIND $%&LD%=7zSFX, CALL Disable &IC1
	ENVI @&LC1.SEL=%&selectNUM%
	FIND $%&LC1%=, ENVI @&LC1=%%TEMP%%
	CALL setBC1
	ENVI @&EC1.ID=?;&EC1_ID
	ENVI @this.MSG=_COMMAND#%&EC1_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&EC2%<1, CALL checkEC1
	CALL Cursor &IC1 &IC2 &IC3 &IC4 &IC5
	ENVI @&LC1.MSG=%&WM_MOUSEENTER%: CALL myTIPS &LC1
	CALL Mouse_Out &LC1
_END

//隐藏 D "$"
//压缩 E "$" &CR
_SUB WIN7,W543H422,排除不需要%1的文件,TEAM ENVI @&exitCODE=1| CALL getSELECT "%&saveBAT%" %2 %4,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	ENVI @&exitCODE=0
	TEAM CALC &df1=int(1200*%&DPI%)
	ENVI &dfz=*%&df1%:   文件列表%&TAB%+0:
	ITEM-def &ID2,L447T352W78H27,取消,KILL \,
	ITEM &ID1,L358T352W78H27,保存,TEAM ENVI &saveBAT=%2| KILL \,
	ITEM &ID3,L12T352W78H27,中止,TEAM ENVI @&exitCODE=1| ENVI @&ID3.Enable=0,
	TABL -font:::::0.5:::::21 &TABLD,L12T15W512H324,%&dfz%,%&tabldVAR%,0x10440
	LABE -center &BD1,L95T360W259H26,,,0xDF0029
	ENVI @this.Visible=1
	WAIT 0.9
	ENVI &forxCMD=FORX /S %~3%&L1%\*,&tE,,
	THREAD*$ CALL checkFILElist "" %2 %3
	CALL Cursor &ID1 &ID2
	ENVI @&TABLD.MSG=_%&WM_LBUTTONDOWN%: CALL selectTABL
	ENVI @&TABLD.MSG=_%&WM_RBUTTONDOWN%: CALL selectTABL
	ENVI @&TABLD.MSG=_%&WM_LBUTTONDBLCLK%: CALL selectSAMEtype &TABLD
	ENVI @this.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getTABLD "%&wp%" "%&lp%" %2 %3
_END

_SUB WIN8,W568H518,提取压缩包/修改单文件/创建单文件,TIPS -,%MyName%,,, %&ScaleCMD% -discloseb
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &txtBE1=提示：可提取 7zSFX 制作的单文件！
	ITEM-def &IE5,L450T447W71H26,关闭,KILL \,
	ITEM &IE6,L360T447W71H26,开始,CALL ExtractOrBuild,
	CHEK &CE1,L23T26W62H22,单文件：,,-1
	LIST -h &LE1,L87T27W340H200,,CALL setLE1,,0x10100
	ITEM &IE1,L431T26W42H22,...,CALL view_exe,
	CHEK &CEA,L475T26W70H22,自动刷新,,-1
	CHEK &CE2,L23T61W62H22,压缩包：,,1
	LIST -h &LE2,L87T62W340H199,,,,0x10100
	ITEM &IE2,L431T61W42H22,...,CALL view_cab,
	CHEK &CEB,L475T61W70H22,自动刷新,CALL setLE2,-1
	CHEK &CE3,L23T96W62H22,配置  ：,CALL PingPangCheck &CE3 &CE5,
	LIST -h &LE3,L87T97W340H199,,,,0x10100
	ITEM &IE3,L431T96W42H22,...,CALL view_config,
	CHEK &CEC,L475T96W70H22,自动刷新,CALL setLE3,-1
	CHEK &CE4,L23T131W62H22,SFX   ：,TEAM CALL PingPangCheck &CE4 &CE7| CALL PingPangCheck &CE4 &CE8,
	LIST -h &LE4,L87T132W340H199,,,,0x10100
	ITEM &IE4,L431T131W42H22,...,CALL view_sfx,
	CHEK &CED,L475T131W70H22,自动刷新,CALL setLE4,-1
	LABE ,L27T171W72H22,提取密码：,,
	EDIT+ -3D &EE1,L87T167W340H22,,,
	LIST &LE5,L432T167W107H200,     不加壳|     Mpress|     UPX压缩,,     不加壳,0x100
	LABE ,L27T207W60H19,内置SFX：,,
	CHEK &CE7,L86T202W42H22,x86,TEAM CALL PingPangCheck &CE7 &CE8| CALL PingPangCheck &CE7 &CE4,-
	CHEK &CE8,L130T202W42H22,x64,TEAM CALL PingPangCheck &CE8 &CE7| CALL PingPangCheck &CE8 &CE4,-
	CHEK &CE6,L220T202W104H22,防止右键修改,,-
	RADI &RE1,L370T202W54H22,提取,CALL DisExtract,1,
	RADI &RE2,L468T202W83H22,修改/创建,CALL DisExtract,,
	CHEK &CE5,L23T237W84H22,修改配置：,CALL PingPangCheck &CE5 &CE3,-
	CHEK &CEE,L110T237W70H22,自动刷新,CALL viewCONFIG,1
	MEMO+ -3D &EE2,L23T260W516H165,,,
	LABE &BE1,L43T452W214H22,%&txtBE1%,,0xDF0029
	//LABE -3D ,L23T467W491H2,,,
	EDIT &EE3,L1T1W1H1,,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	CALL Disable &LE5
	CALL Cursor &IE1 &IE2 &IE3 &IE4 &IE5 &IE6 &CE1 &CE2 &CE3 &CE4 &CE5 &CE6 &CE7 &CE8 &CEA &CEB &CEC &CED &CEE &RE1 &RE2
	ENVI @&LE1.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LE1 "%&wp%" "%&lp%" "" "" "" EXE
	ENVI @&LE2.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LE2 "%&wp%" "%&lp%" "" "" "" 7Z
	ENVI @&LE3.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LE3 "%&wp%" "%&lp%" "" "" "" TXT
	ENVI @&LE4.MSG=%&WM_DROPFILES%::&wp,&lp, CALL getFILE &LE4 "%&wp%" "%&lp%" "" "" "" SFX
	ENVI @&LE1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LE1%"
	ENVI @&LE2.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LE2%"
	ENVI @&LE3.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LE3%"
	ENVI @&LE4.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。 "%&LE4%"
	FORX * 1 2 3 4,&tmpITEM, CALL Mouse_Out &LE%&tmpITEM%
_END

_SUB WIN9,W543H157,设置密码,CALL savePWD "%&saveBAT%" &CJ,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	ITEM-def &IF2,L430T85W71H26,关闭,KILL \,
	ITEM &IF1,L344T85W71H26,保存,TEAM ENVI &saveBAT=F| KILL \,
	LABE ,L23T31W57H22,密码：,,
	EDIT+ -3D &EF1,L57T27W457H22,%&myPWD%,,
	LABE ,L23T92W317H22,提示：用于提取压缩包时所用的密码，可任意字符或汉字,,0xDF0029
	LABE -3D ,L23T70W491H2,,,
	ENVI @this.Visible=1
	WAIT 0.9
	CALL Cursor &IF1 &IF2
_END

_SUB WINA,W543H422,内部环境变量设置,CALL saveMSG "%&saveBAT%" noSAVEver &CQ J,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	TEAM CALC &df1=int(140*%&DPI%)| CALC &df2=int(990*%&DPI%)
	ENVI &dfz=*%&df1%:         变量名%&TAB%*%&df2%:                变量值
	ITEM-def &II4J,L475T352W50H27,取消,KILL \,
	ITEM &II3J,L410T352W50H27,保存,TEAM ENVI &saveBAT=J| KILL \,
	^TABL -font:::::0.5:::::21 &TABLJ,L12T15W512H273,%%&dfz%%,%%&tablJMSG%&L1.isel%%%,0x10040
	EDIT+ -3D &EI9J,L12T302W116H24,,,   //,,9:simsun
	EDIT+ -3D &EIAJ,L145T302W261H24,,,
	ITEM &II1J,L420T302W46H24,新增,CALL changeTABL J,
	ITEM &II2J,L479T302W46H24,删除,CALL delTABL J,
	ITEM &II5J,L12T352W50H27,清空,TEAM ENVI @&TABLJ.Val=-*| ENVI @&II1J=新增,
	LABE -3D ,L12T336W512H2,,,
	LABE -center ,L72T360W329H26,提示：支持填入变量，比如 %%TEMP%%，不会被扩展为当前值,,0xDF0029
	EDIT &EIBJ,L1T1W1H1,0,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	CALL Cursor &II1J &II2J &II3J &II4J &II5J
	ENVI @&EI9J.ID=?;&EI9J_ID
	ENVI @this.MSG=_COMMAND#%&EI9J_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&EIBJ%<1, CALL checkCHANGE J
	ENVI @&TABLJ.MSG=_%&WM_LBUTTONDOWN%: CALL setTABL J
	ENVI @&TABLJ.MSG=_%&WM_RBUTTONDOWN%: TEAM CALL setTABL J| CALL @--popmenu rightMENUb
	ENVI @&TABLJ.MSG=_%&WM_KEYDOWN%::&wp,&lp, CALL getHOTkey J
_END

_SUB WINB,W543H422,内置PECMD脚本,TEAM TIPS -| CALL saveSCRIPT %&saveSCR%,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN3
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveSCR=
	MEMO+ -3D &EG1,L23T22W489H321,,,
	ITEM &IG1,L22T356W80H25,重新载入,TEAM CALL reloadSCRIPT| MESS+icon%&top% %&NL%%&NL%    刷新成功！ @提示#OK*5000,
	ITEM &IG2,L109T356W60H25,清空,ENVI @&EG1=,
	LABE -center &BG1,L178T362W67H26,支持拖入,,0xDF0029
	ITEM &IG3,L253T356W60H25,浏览,CALL viewWCS,
	ITEM &IG4,L320T356W60H25,新增,TEAM ENVI &saveSCR=B| KILL \,
	ITEM &IG5,L387T356W60H25,保存,TEAM ENVI &saveSCR=A| KILL \,
	ITEM &IG6,L454T356W60H25,取消,KILL \,
	ENVI @this.Visible=1
	WAIT 0.9
	CALL Cursor &IG1 &IG2 &IG3 &IG4 &IG5 &IG6
	CALL reloadSCRIPT
	ENVI @&EG1.MSG=+%&WM_DROPFILES%::&wp,&lp, CALL getBG1 "%&wp%" "%&lp%"
	ENVI @&BG1.MSG=%&WM_MOUSEENTER%: CALL Mouse_In 支持拖入。
	CALL Mouse_Out &BG1
_END

_SUB WINC,W543H157,解压密码设置,CALL save7zPWD "%&saveBAT%" &CT,%MyName%,,, %&ScaleCMD%
	CALL setPOS WIN1
	CALL SETtop
	%&Font_Cmd%
	ENVI &saveBAT=
	ITEM-def &IH2,L430T85W71H26,关闭,KILL \,
	ITEM &IH1,L344T85W71H26,保存,TEAM ENVI &saveBAT=H| KILL \,
	LABE ,L23T31W57H22,密码：,,
	EDIT+ -3D &EH1,L57T27W457H22,%&7zPWD%,,
	LABE ,L23T92W317H22,注意：不支持标点符号、特殊字符和空格,,0xDF0029
	LABE -3D ,L23T70W491H2,,,
	EDIT &EH2,L1T1W1H1,0,,0x18
	ENVI @this.Visible=1
	WAIT 0.9
	CALL Cursor &IH1 &IH2
	ENVI @&EH1.ID=?;&EH1_ID
	ENVI @this.MSG=_COMMAND#%&EH1_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&EH2%<1, CALL checkEH1
_END

_SUB SETtop *
	IFEX $%&CX.Check%=1,
	{*
		ENVI &top=+top
		ENVI @@POS=%&WinID%:::::4
		ENVI @this.POS=::::4
	}!   
	{*
		ENVI &top=
		ENVI @@POS=%&WinID%:::::2
		ENVI @this.POS=::::2
	}
_END

_SUB DisExtract
	IFEX $%&RE1.Check%=1,
	{
		CALL DisCheck &CE5 &CE6 &CE7 &CE8
		CALL Disable &CE5 &CE6 &CE7 &CE8 &LE5
	}
	IFEX $%&RE2.Check%=1,
	{
		CALL Enable &CE5 &CE6 &CE7 &CE8 &LE5
	}
_END

_SUB checkRUNmore
	IFEX $[ %&CD.Check%=1 & %&C7.Check%=1 ],
	{
		FIND $%&LD%=PECMD,
		{
			LPOS* * &tmpPOS=%%RanDom%%,1,&extractPATH%&L1.isel%
			IFEX $%&tmpPOS%<1, ENVI @&C7.Check=0
		}!   
		{
			ENVI @&C7.Check=0
		}
	}
_END

_SUB checkEH1
	ENVI @&EH2=1
	SED &EH3=0,[^0-9a-zA-Z],,%&EH1%
	FIND $'%&EH3%'<>'%&EH1%',
	{
		CALL getSEL &EH1 &PosStart &PosEnd
		ENVI @&EH1=%&EH3%
		CALL setSEL &EH1 %&PosEnd%
	}
	ENVI @&EH2=0
_END

_SUB getSEL
	SET$# &p6=*8 0
	SET$# &p7=*8 0
	ENVI @%1.SENDMSG=%&EM_GETSEL%,@&p6,@&p7
	ENVI?long &p6=&p8
	ENVI?long &p7=&p9
	ENVI-ret %~2=%&p8%
	ENVI-ret %~3=%&p9%
_END

_SUB setSEL
	ENVI @%1.POSTMSG=%&EM_SETSEL%,%~2,%~2
_END

_SUB getBG1
 	ENVI ?,&Allfile=DROPFILE,%~1
	FORX *NL &Allfile,&oneFILE,
	{
		READ %&oneFILE%,**,&fileSTR
		FIND $%&fileSTR%<>,
		{
			ENVI @&EG1=%&fileSTR%
			EXIT
		}
	}
_END

_SUB reloadSCRIPT
	ENVI &noEG1=
	ENVI @&TABLA.Sel=?&SEL
	IFEX $%&SEL%>0,
	{*
		ENVI @&TABLA.Val=?%&SEL%.1;&scriptNAME
		FEXT &sEXT=%&scriptNAME%
		FIND $%&sEXT%=,
		{*
			ENVI @&BG1=%&scriptNAME%
			^ENVI @&EG1=%%%&scriptNAME%%%
		}!   
		{*
			ENVI &noEG1=1
		}
	}!
	{*
		ENVI &noEG1=1
	}
	IFEX $%&noEG1%=1, ENVI @&EG1=#code=936T950%&NL%ENVI^ EnviMode=1%&NL%ENVI^ ForceLocal=1%&NL%
_END

_SUB viewWCS
	BROW &wir,%&L1%\setup.wcs,指定要插入的文件,WCS、INI|*.wcs;*.ini,0x10001000
	FIND $%&wir%<>,
	{
		READ %&wir%,**,&wirSTR
		ENVI @&EG1=%&wirSTR%
	}
_END

_SUB saveSCRIPT *
	FIND $%1=B, CALL addSCRIPT
	FIND $%1=A,
	{*
		ENVI &scriptHAVE=
		ENVI @&TABLA.Sel=?&SEL
		IFEX $%&SEL%>0,
		{*
			ENVI @&TABLA.Val=?%&SEL%.1;&scriptNAME
			FEXT &sEXT=%&scriptNAME%
			FIND $%&sEXT%=, ENVI &scriptHAVE=1
		}
		FIND $%&scriptHAVE%=,
		{*
			CALL addSCRIPT
		}!   
		{*
			ENVI-ret &%&scriptNAME%=%&EG1%
		}
	}
_END

_SUB addSCRIPT *
	ENVI @&TABLA.Val=?*.*;&allxMSG
	ENVI &allxMSG=%&NL%%&allxMSG%%&NL%
	ENVI &scriptNUM=1
	LOOP #1=1,
	{*
		LPOS* * &tmpPOS=%&NL%SCRIPT_%&scriptNUM%%&TAB%,1,&allxMSG
		IFEX $%&tmpPOS%<1, EXIT
		CALC #&scriptNUM=%&scriptNUM%+1
	}
	ENVI @&TABLA.Val=0;SCRIPT_%&scriptNUM%%&TAB%是%&TAB%主程序运行前%&TAB%等待结束
	ENVI-ret &SCRIPT_%&scriptNUM%=%&EG1%
	ENVI @&LA1.ADDSEL=SCRIPT_%&scriptNUM%
	ENVI @&LA2.SEL=主程序运行前
	ENVI @&LA3.SEL=等待结束
	ENVI @&CA1.Check=1
	ENVI @&EA2=1
	ENVI @&EA1=
	ENVI @&EA2=0
	CALL SB_BOTTOM A
_END

_SUB checkWINC *
	IFEX $%&CT.Check%=1, CALL @WINC! TEAM CALL Disable &CU| CALL DisCheck &CU
_END

_SUB checkWINA *
	IFEX $%&CQ.Check%=1, CALL @WINA
_END

_SUB checkWAIT
	FIND $%&LA3%=等待所有子进程, CALL Warning
_END

_SUB Warning
	MESS+icon0%&top% %&NL%%&NL%“等待所有子进程”会导致操作文件或注册表时被重定向，请谨慎选择！ @警告#OK*5000
_END

_SUB checkSFXpath
	^IFEX $[ '%%&LD%%'='7zSFX' & %%&CA.Check%%=0 & ( %%&C7.Check%%=0 | '%%&extractPATH%&L1.isel%%%'='' ) ], 
	{
		ENVI @&CA.Check=1
		MESS+icon6%&top% %&NL%%&NL%请先设置解压路径！ @错误#OK*5000
	}
_END

_SUB checkDELsfx
	IFEX $[ '%&LD%'='7zSFX' & %&C7.Check%=0 & %&CA.Check%=0 ], TEAM ENVI @&CA.Check=1| ENVI @&CW.Check=0
_END

_SUB setL5
	CALL checkDELsfx
	ENVI &tmpL5=%&L5%
	ENVI &tmpL6=%&L6%
	ENVI &xSTR=32位/64位自适应
	FIND $%&LD%=7zSFX,
	{
		FIND $%&KernelCODE%<>%&LD%,
		{
			//ENVI @&L5.DEL=%&xSTR%
			ENVI @&L6.DEL=cab
			CALL DisCheck &CJ &CD &CK &CN &CU
		}
		CALL Disable &CJ &CD &CK &CU
	}!   
	{
		FIND $%&KernelCODE%<>%&LD%,
		{
			//ENVI @&L5.Query=;&aL5
			ENVI @&L6.Query=;&aL6
			//LPOS* * &nL5=%&xSTR%,1,&aL5
			LPOS* * &nL6=cab,1,&aL6
			//IFEX $%&nL5%=0, ENVI @&L5.ADD=%&xSTR%
			IFEX $%&nL6%=0, ENVI @&L6.ADD=cab
			CALL DisCheck &CC
			CALL EnCheck &CN
		}
		IFEX $%&CT.Check%=1, CALL Enable &CU
		CALL Enable &CJ &CD &CK
	}
	FIND $%&L5%<>%&tmpL5%, CALL setBIT
	FIND $%&L6%<>%&tmpL6%, TEAM CALL setPROG| CALL setPWDchk
	ENVI @&KernelCODE=%&LD%
_END

_SUB checkIFpwd
	IFEX $%&CL.Check%=0, ENVI @&CJ.Check=0
_END

_SUB checkWIN9 *
	IFEX $%&CJ.Check%=1,
	{*
		IFEX $%&CL.Check%=0,
		{
			ENVI @&CJ.Check=0
			MESS+icon6%&top% %&NL%%&NL%请先勾选“防修改”！ @错误#OK*5000
		}!   
		{*
			CALL @WIN9
		}
	}
_END

_SUB savePWD *
	FIND $%~1<>, ENVI-ret &myPWD=%&EF1%
	FIND $'%&myPWD%'='', ENVI @&CJ.Check=0
_END

_SUB save7zPWD *
	FIND $%~1<>, ENVI-ret &7zPWD=%&EH1%
	FIND $'%&7zPWD%'='',
	{
		ENVI @&CT.Check=0
		ENVI @&CU.Enable=0
		ENVI @&CU.Check=0
	}!
	{
		IFEX $[ '%&LD%'<>'7zSFX' & %&CT.Check%=1 ], ENVI @&CU.Enable=1
	}
_END

_SUB PingPangCheck
	^IFEX $%%%1.Check%%=1,
	{
		IFEX $[ '%1'='&CW' & %&CA.Check%=1 & %&C7.Check%=0 & '%&LD%'='7zSFX' ],
		{
			ENVI @%1.Check=0
			MESS+icon6%&top% %&NL%%&NL%请不要勾选“删除释放文件”！ @错误#OK*5000
		}!   
		{
			ENVI @%2.Check=0
			FIND $[ '%1'='&CN' & '%&LD%'='7zSFX' ], CALL Warning
		}
	}
_END

_SUB autoRUN *
	^IFEX $%%%1.Check%%=1,
	{*
		FIND $%1=&CV, ENVI @&CB.Check=0
		^IFEX $%%%1.autoRUN%%=1, ENVI %1.autoRUN1=4!  ENVI %1.autoRUN1=
		^IFEX $%%%1.autoRUN%%=0, ENVI %1.autoRUN0=4!  ENVI %1.autoRUN0=
		^MENU ,仅开机运行一次, ENVI %1.autoRUN=1,%%%1.autoRUN1%%
		^MENU ,每次开机都运行, ENVI %1.autoRUN=0,%%%1.autoRUN0%%
	}
_END

_SUB VisCancel *
	IFEX $%&C2.Check%=1,
	{*
		IFEX $%&vordCANCEL%=1, ENVI &vordCANCEL1=4!  ENVI &vordCANCEL1=
		IFEX $%&vordCANCEL%=0, ENVI &vordCANCEL0=4!  ENVI &vordCANCEL0=
		MENU ,显示取消按钮, ENVI &vordCANCEL=1,%&vordCANCEL1%
		MENU ,隐藏取消按钮, ENVI &vordCANCEL=0,%&vordCANCEL0%
	}
_END

_SUB SuperWait *
	IFEX $%&CN.Check%=1,
	{*
		IFEX $%&vordSUPER%=1, ENVI &vordSUPER1=4!  ENVI &vordSUPER1=
		MENU ,变态等待模式, CALL SetSuperWait,%&vordSUPER1%
	}
_END

_SUB SetSuperWait *
	IFEX $%&vordSUPER%=1, ENVI &vordSUPER=0! ENVI &vordSUPER=1
_END

_SUB forceREC *
	IFEX $%&CI.Check%=0,
	{*
		ENVI @&CA.Check=0
		IFEX $%&recoverOLD%=1, ENVI &recoverOLD1=4!  ENVI &recoverOLD1=
		IFEX $%&recoverOLD%=0, ENVI &recoverOLD0=4!  ENVI &recoverOLD0=
		MENU ,仅替换旧文件, ENVI &recoverOLD=1,%&recoverOLD1%
		MENU ,跳过已有文件, ENVI &recoverOLD=0,%&recoverOLD0%
	}
_END

_SUB viewCONFIG
	ENVI &hSr=
	IFEX [ ( %&LE1% ) & '%&LE1%'<>'' ],
	{*
		ENVI &hSg=;!@Install@!UTF-8!
		STRL &hSh=%&hSg%
		CODE *,%&hSg%,**-ANSI,&hSi
		GETF -find "%&LE1%",0#*#%&hSh%#0#1#0,&hSj,*&hSi
		IFEX $%&hSj%>0,
		{*
			ENVI &hSa=;!@InstallEnd@!
			STRL &hSb=%&hSa%
			CODE *,%&hSa%,**-ANSI,&hSd
			GETF -find "%&LE1%",0#*#%&hSb%#0#1#0,&hSe,*&hSd
			IFEX $%&hSe%>0,
			{*
				CALC #&hSn=%&hSj%-3
				GETF "%&LE1%",%&hSn%#3,&hSp
				FIND $%&hSp%=0xEF 0xBB 0xBF, ENVI &hSj=%&hSn%
				CALC #&hSf=%&hSe%+%&hSb%
				CALC #&hSk=%&hSf%-%&hSj%
				GETF "%&LE1%",%&hSj%#%&hSk%,&hSq
				CODE ***UTF8,&hSq,**UNI,&hSr
				CALC #&hSl=%&hSj%-160
				GETF "%&LE1%",%&hSl%#160,&hSm
				FIND $%&hSm%<>%&zipPACH%, ENVI &hSl=%&hSj%
				IFEX $[ '%~1'='' & %&CEE.Check%=1 ], ENVI @&EE2=%&hSr%
				ENVI @&EE3=%&hSj% %&hSk% %&hSf% %&hSl% //配置起始位置、配置长度、压缩包起始位置、SFX长度
			}
		}
	}
	FIND $%&hSr%=,
	{
		IFEX $[ '%~1'='' & %&CEE.Check%=1 ], ENVI @&EE2=
		ENVI @&EE3=
	}
_END

_SUB ExtractOrBuild
	FIND $%&LE1%=, TEAM MESS+icon6%&top% %&NL%%&NL%请先指定一个单文件！ @错误#OK*5000| EXIT
	FORX * &IE1 &IE2 &IE3 &IE4 &IE5 &IE6 &LE1 &LE2 &LE3 &LE4 &LE5 &EE1 &EE2 &CE2 &CE3 &CE4 &CE5 &CE6 &CE7 &CE8 &CEB &CEC &CED &CEE &RE1 &RE2,&tmpITEM, ENVI @%&tmpITEM%.Enable=0
	ENVI @&BE1=请稍等...
	ENVI &extractCODEx=
	CALL viewCONFIG noSETconfig
	IFEX $%&RE1.Check%=1,
	{*
		IFEX "%&LE1%",
		{*
			FIND $%&EE3%<>,
			{*
				//sfx+zipfix+config+7zfile
				//&hSj、&hSk、&hSf、&hSl //配置起始位置、配置长度、压缩包起始位置、SFX长度
				ENVI &extractCODE=1
				MSTR * &hSj,&hSk,&hSf,&hSl=<1*>&EE3
				IFEX $%&CE2.Check%=1,!! TEAM EXEC -incmd =PECMD PUTF -dd -skipb=%&hSf% "%&LE2%",,"%&LE1%"| IFEX $%error%<>0, ENVI &extractCODE=0
				IFEX $%&CE3.Check%=1,!! TEAM EXEC -incmd =PECMD PUTF -dd -skipb=%&hSj% -len=%&hSk% "%&LE3%",,"%&LE1%"| IFEX $%error%<>0, ENVI &extractCODE=0
				IFEX $%&CE4.Check%=1,!! TEAM EXEC -incmd =PECMD PUTF -dd -len=%&hSl% "%&LE4%",,"%&LE1%"| IFEX $%error%<>0, ENVI &extractCODE=0
			}!   
			{*
				CALL extractCAB
			}
		}!   
		{*
			TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，单文件不存在
		}
	}!   
	{*
		TEAM MSTR * &LE51=<1>&LE5| ENVI &extractCODE=1| ENVI &+sfxFILE=| ENVI &+zipFIX=| ENVI &+configTXT=| ENVI &+extFILE=| ENVI &-extFILE=| ENVI &-configTXT=| ENVI &-zipFIX=| ENVI &-sfxFILE=
		IFEX $[ %&CE2.Check%=1 & %&extractCODE%=1 ],
		{*
			IFEX "%&LE2%", TEAM ENVI &extFILE="%&LE2%"| ENVI &+extFILE= + "%&LE2%"! TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，压缩包不存在
		}
		IFEX $[ %&CE3.Check%=1 & %&extractCODE%=1 ],
		{*
			IFEX "%&LE3%", TEAM ENVI &configTXT="%&LE3%"| ENVI &+configTXT= + "%&LE3%"! TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，配置文件不存在
		}
		IFEX $[ %&CE4.Check%=1 & %&extractCODE%=1 ],
		{*
			IFEX "%&LE4%",
			{*
				FIND $%&LE51%=不加壳,
				{*
					ENVI &sfxFILE="%&LE4%"
					ENVI &+sfxFILE="%&LE4%"
				}!   
				{*
					ENVI &sfxFILE="%TEMP%\~%RanDom%~8.tmp"
					ENVI &+sfxFILE=%&sfxFILE%
					ENVI &-sfxFILE=FILE -force %&sfxFILE%
					%&-sfxFILE%
					FILE "%&LE4%"=>%&sfxFILE%
					IFEX $%error%<>0, TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，临时目录不可写
				}
			}!   
			{*
				TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，sfx文件不存在
			}
		}
		IFEX $[ ( %&CE7.Check%=1 | %&CE8.Check%=1 ) & %&extractCODE%=1 ],
		{*
			ENVI &sfxFILE="%TEMP%\~%RanDom%~1.tmp"
			ENVI &+sfxFILE=%&sfxFILE%
			ENVI &-sfxFILE=FILE -force %&sfxFILE%
			%&-sfxFILE%
			IFEX $%&CE7.Check%=1, ENVI &sfxRES=#486! ENVI &sfxRES=#464
			//CALL extractRES %&sfxRES% %&sfxFILE%
			PUTF %&sfxFILE%,,"%MyName%""%&sfxRES%|EXEDATA"
			IFEX $%error%<>0, ENVI &extractCODE=0
		}
		IFEX $[ %&CE5.Check%=1 & %&extractCODE%=1 & '%&EE2%'<>'' ],
		{*
			ENVI &configTXT="%TEMP%\~%RanDom%~2.tmp"
			ENVI &+configTXT= + %&configTXT%
			ENVI &-configTXT=FILE -force %&configTXT%
			%&-configTXT%
			WRIT-UTF8 *fv %&configTXT%,$+0,&EE2
			IFEX $%error%<>0, TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，配置文件无法写入
		}
		IFEX $[ %&CE6.Check%=1 & %&extractCODE%=1 ],
		{*
			ENVI &zipFIX="%TEMP%\~%RanDom%~3.tmp"
			ENVI &+zipFIX= + %&zipFIX%
			ENVI &-zipFIX=FILE -force %&zipFIX%
			%&-zipFIX%
			PUTF %&zipFIX%,,%&zipPACH%
			IFEX $%error%<>0, TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，“防止右键修改”选项无法写入
		}
		IFEX $%&extractCODE%=1,
		{*
			FIND $%&EE3%=,
			{*
				IFEX [ $%&extractCODE%=1 & $%&CE2.Check%=1 & ( ! %&LE2% ) ], TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，压缩包不存在
				IFEX [ $%&extractCODE%=1 & $%&CE3.Check%=1 & ( ! %&LE3% ) ], TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，配置文件不存在
				IFEX [ $%&extractCODE%=1 & $%&CE4.Check%=1 & ( ! %&LE4% ) ], TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，sfx文件不存在
			}!   
			{*
				IFEX "%&LE1%",! TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，单文件不存在
				MSTR * &hSj,&hSk,&hSf,&hSl=<1*>&EE3
				IFEX $[ %&extractCODE%=1 & ( '%&+extFILE%'='' | ! "%&extFILE%" ) ],
				{*
					ENVI &extFILE="%TEMP%\~%RanDom%~4.tmp"
					ENVI &+extFILE= + %&extFILE%
					ENVI &-extFILE=FILE -force %&extFILE%
					%&-extFILE%
					EXEC -incmd =PECMD PUTF -dd -skipb=%&hSf% %&extFILE%,,"%&LE1%"
					IFEX $%error%<>0, ENVI &extractCODE=0
				}
				IFEX $[ %&extractCODE%=1 & ( '%&+configTXT%'='' | ! "%&configTXT%" ) ],
				{*
					ENVI &configTXT="%TEMP%\~%RanDom%~5.tmp"
					ENVI &+configTXT= + %&configTXT%
					ENVI &-configTXT=FILE -force %&configTXT%
					%&-configTXT%
					EXEC -incmd =PECMD PUTF -dd -skipb=%&hSj% -len=%&hSk% %&configTXT%,,"%&LE1%"
					IFEX $%error%<>0, ENVI &extractCODE=0
				}
				IFEX $[ %&extractCODE%=1 & ( '%&+sfxFILE%'='' | ! "%&sfxFILE%" ) ],
				{*
					ENVI &sfxFILE="%TEMP%\~%RanDom%~6.tmp"
					ENVI &+sfxFILE=%&sfxFILE%
					ENVI &-sfxFILE=FILE -force %&sfxFILE%
					%&-sfxFILE%
					EXEC -incmd =PECMD PUTF -dd -len=%&hSl% %&sfxFILE%,,"%&LE1%"
					IFEX $%error%<>0, ENVI &extractCODE=0
				}
				IFEX $[ %&extractCODE%=1 & %&hSj%<>%&hSl% & '%&+zipFIX%'='' ],
				{*
					ENVI &zipFIX="%TEMP%\~%RanDom%~7.tmp"
					ENVI &+zipFIX= + %&zipFIX%
					ENVI &-zipFIX=FILE -force %&zipFIX%
					%&-zipFIX%
					PUTF %&zipFIX%,,%&zipPACH%
				}
			}
		}
		IFEX $%&extractCODE%=1,
		{*
			FIND $[ '%&+sfxFILE%'<>'' & '%&+configTXT%'<>'' & '%&+extFILE%'<>'' ],
			{*
				FIND $%&LE51%=Mpress,
				{
					EXEC -hide -wd:"%TEMP%\" -exe:%&mpress% =mpress_exe -i -q -m %&sfxFILE%
					FILE -force "%Temp%\mpr*.tmp"
				}
				FIND $%&LE51%=UPX压缩,
				{
					ENVI &sfxFILE1="%TEMP%\~%RanDom%~9.tmp"
					EXEC -hide -wd:"%TEMP%\" -exe:%&UPX% =UPX_exe --best --compress-icons=0 %&sfxFILE% -o %&sfxFILE1%
					FILE %&sfxFILE1%->%&sfxFILE%
				}
				EXEC -hide =cmd.exe /c copy /b %&+sfxFILE%%&+zipFIX%%&+configTXT%%&+extFILE% "%&LE1%"
				ENVI &xerror=%&error%
				IFEX $%&xerror%=2,
				{*
					SIZE &eSIZE1=%&sfxFILE%
					FIND $%&+zipFIX%<>,!! PUTF -dd %&sfxFILE%,%&eSIZE1%,%&zipFIX%
					SIZE &fSIZE1=%&sfxFILE%
					PUTF -dd %&sfxFILE%,%&fSIZE1%,%&configTXT%
					SIZE &gSIZE1=%&sfxFILE%
					PUTF -dd %&sfxFILE%,%&gSIZE1%,%&extFILE%
					IFEX $%&error%=0,
					{*
						FILE %&sfxFILE%->"%&LE1%"
						IFEX $%&error%=0, ENVI &xerror=0
					}
				}
				IFEX $%&xerror%<>0, ENVI &extractCODE=0! CALL viewCONFIG
			}!   
			{*
				IFEX $[ %&extractCODE%=1 & '%&+extFILE%'='' ], TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，请先指定一个压缩包
				IFEX $[ %&extractCODE%=1 & '%&+configTXT%'='' ], TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，请先指定配置文件
				IFEX $[ %&extractCODE%=1 & '%&+sfxFILE%'='' ], TEAM ENVI &extractCODE=0| ENVI &extractCODEx=，请先指定sfx文件
			}
		}
	}
	%&-zipFIX%
	%&-sfxFILE%
	%&-extFILE%
	%&-configTXT%
	ENVI @&BE1=%&txtBE1%
	ENVI @@DeskTopFresh=1
	IFEX $%&extractCODE%=1, MESS+icon%&top% %&NL%%&NL%    成功完成 ！ @提示#OK*5000! MESS+icon6%&top% %&NL%%&NL%失败%&extractCODEx% ！ @错误#OK*5000
	FORX * &IE1 &IE2 &IE3 &IE4 &IE5 &IE6 &LE1 &LE2 &LE3 &LE4 &LE5 &EE1 &EE2 &CE2 &CE3 &CE4 &CE5 &CE6 &CE7 &CE8 &CEB &CEC &CED &CEE &RE1 &RE2,&tmpITEM, ENVI @%&tmpITEM%.Enable=1
	IFEX $%&RE1.Check%=1, CALL Disable &CE5 &CE6 &CE7 &CE8 &LE5
_END

_SUB extractCAB
	ENVI-ret &extractCODE=0
	SIZE &aSIZE="%&LE1%"
	CALC #&bSIZE=%&aSIZE%-160
	GETF %&LE1%,%&bSIZE%#*,&aSTR
	GETF %&LE1%,312#8,&tmp1
	GETF %&LE1%,352#8,&tmp2
	FIND $%&aSTR%=%&sfxOLDpach%,
	{*
		FIND $[ '%&tmp1%'<>'%&.mprss1%' & '%&tmp2%'<>'%&.mprss2%' ],
		{*
			FILE -force "%&LE2%"
			EXEC -incmd =PECMD PUTF "%&LE2%",,"%&LE1%""#102|SCRIPT"  //加壳会死掉
			IFEX $%error%=0,
			{*
				ENVI-ret &extractCODE=1
				PUTF "%&LE2%",0#8,%&7zHEAD%
				FIND $%&::bX64%=3, ENVI &tmp1=64! ENVI &tmp1=86
				EXEC -err+ -hide -exe:*#3%&tmp1% =7za_exe t "%&LE2%"
				IFEX $%error%<>0, PUTF "%&LE2%",0#8,%&cabHEAD%
			}
		}
	}!   
	{*
		FIND $[ '%&aSTR%'='%&.cab% %&sfxPACH%' | '%&aSTR%'='%&.7z% %&sfxPACH%' ],
		{*
			FIND $[ '%&tmp1%'='%&.mprss1%' & '%&tmp2%'='%&.mprss2%' ],
			{*
				ENVI &tmpFILE=%Temp%\~~%RanDom%.tmp
				FILE -force "%&tmpFILE%"
				EXEC -wd:"%Temp%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract "%&LE1%","%&tmpFILE%",SCRIPT,107,
				ENVI @@DeskTopFresh=1
				IFEX "%&tmpFILE%",
				{*
					ENVI &cSTR="%&LE2%" "%&EE1%"
				}!   
				{*
					CALC #&cSIZE=%bSIZE%-19
					GETF %&LE1%,%&cSIZE%#19,&dSTR
					FIND $%&dSTR%=0x00 %&.mprss1% 0x00 %&.mprss2% 0x00,
					{*
						ENVI &cSTR="%&LE2%" "%&EE1%"
					}!   
					{*
						ENVI &cSTR=%&LE2%
					}
				}
				FILE -force "%&tmpFILE%"
				EXEC -hide ="%&LE1%" --extract-myresouce+script- %&cSTR%
				ENVI-ret &extractCODE=1
			}!   
			{*
				GETF "%&LE1%""#107|SCRIPT",0#1,&bSTR  //加壳会死掉
				ENVI &mySCRIPT=
				FIND $%&bSTR%=,
				{*
					ENVI &mySCRIPT=#102
				}!   
				{*
					ENVI &pwdOK=
					ENVI &myRELpwd=
					ENVI &tmpFILE=%Temp%\~~%RanDom%.tmp
					FILE -force "%&tmpFILE%"
					PUTF "%&tmpFILE%",,"%&LE1%""#.102|SCRIPT"
					LOAD -this "%&tmpFILE%"
					FILE -force "%&tmpFILE%"
					FIND $%&pwdOK%<>1, EXIT BLOCK
					FIND $'%&EE1%'<>'%&myRELpwd%', EXIT BLOCK
					ENVI &mySCRIPT=#107
				}
				FIND $%&mySCRIPT%<>,
				{*
					FILE -force "%&LE2%"
					EXEC -incmd =PECMD PUTF "%&LE2%",,"%&LE1%""%&mySCRIPT%|SCRIPT"
					IFEX $%error%=0,
					{*
						ENVI-ret &extractCODE=1
						MSTR * &tmp3=1,24,&aSTR
						FIND $%&tmp3%=%&.cab%, ENVI &tmp4=%&cabHEAD%! ENVI &tmp4=%&7zHEAD%
						PUTF "%&LE2%",0#8,%&tmp4%
					}
				}
			}
		}!   
		{*
			FIND $%&aSTR%=%&newSTR% %&sfxPACH%,
			{*
				ENVI &myRELpwd=
				ENVI &mySFXsize=
				ENVI &myCMPSsize=
				CALC #&hc1=%&aSIZE%-177
				GETF %&LE1%,%&hc1%#17,&hc2
				CODE *ANSI,%&hc2%,**UNI,&hc3
				MSTR * -delims:# &hc4=<2>&hc3
				LPOS* * &hc9=#,2,&hc3
				LPOS* * &hca=#,3,&hc3
				CALC #&hcb=%&hc4%
				IFEX $[ %&hc4%>0 & %&hc4%<1k & %&hc9%>0 & %&hca%=0 & %&hc4%=%&hcb% ],
				{*
					CALC #&hc5=%&hc1%-%&hc4%
					GETF %&LE1%,%&hc5%#8,&hcd
					FIND $%&hcd%=0x00 0x00 0x00 0x00 %&tempCMPa%,
					{*
						GETF %&LE1%,%&hc5%#%&hc4%,&hc6
						ENVI &tmpFILE=%Temp%\~~%RanDom%.tmp
						FILE -force "%&tmpFILE%"
						PUTF "%&tmpFILE%",,%&hc6%
						PUTF "%&tmpFILE%",4#4,%&headCMPa%
						LOAD -this "%&tmpFILE%"
						FILE -force "%&tmpFILE%"
						FIND $[ '%&mySFXsize%'<>'' & '%&myCMPSsize%'<>'' & '%&EE1%'='%&myRELpwd%' ],
						{*
							CALC #&hc7=%&hc5%-%&mySFXsize%
							FILE -force "%&LE2%"
							EXEC -incmd =PECMD PUTF -dd -skipb=%&hc7% -len=%&mySFXsize% "%&LE2%",,%&LE1%
							IFEX $%error%=0,
							{*
								ENVI-ret &extractCODE=1
								FIND $%&myCMPSsize%=CAB, ENVI &hc8=%&cabHEAD%! ENVI &hc8=%&7zHEAD%
								PUTF "%&LE2%",0#8,%&hc8%
							}
						}
					}
				}
				//主程序+压缩包+WCS+WCS大小信息+NEW标志+ZIP补丁
			}!   
			{*
				STRL &hx1=%&sfxENDstr%
				CODE *,%&sfxENDstr%,**-ANSI,&hx2
				GETF -find %&LE1%,0#*#%&hx1%#0#1#0,&hx3,*&hx2
				IFEX $%&hx3%>0,
				{*
					CALC #&hx4=%&hx3%+%&hx1%
					FILE -force "%&LE2%"
					EXEC -incmd =PECMD PUTF -dd -skipb=%&hx4% "%&LE2%",,%&LE1%
					IFEX $%error%=0, ENVI-ret &extractCODE=1
				}
			}
		}
	}
_END

_SUB setLE1
	CALL Disable &IE5 &IE6
	FIND $%&LE2%=, ENVI &CEfresh=1! ENVI &CEfresh=0
	CALL setLE2
	CALL setLE3
	CALL setLE4
	IFEX $%&CEfresh%=1,
	{
		CALL Enable &CEB &CEC &CED
		CALL DisCheck &CEB &CEC &CED
	}
	CALL viewCONFIG
	CALL Enable &IE5 &IE6
_END

_SUB setLE2
	IFEX $%&CEB.Check%=1,
	{
		ENVI @&LE2.SEL=%&LE1%.7z
		FIND $%&LE2%<>%&LE1%.7z, ENVI @&LE2.ADDSEL=%&LE1%.7z
	}
_END

_SUB setLE3
	IFEX $%&CEC.Check%=1,
	{
		ENVI @&LE3.SEL=%&LE1%.txt
		FIND $%&LE3%<>%&LE1%.txt, ENVI @&LE3.ADDSEL=%&LE1%.txt
	}
_END

_SUB setLE4
	IFEX $%&CED.Check%=1,
	{
		ENVI @&LE4.SEL=%&LE1%.sfx
		FIND $%&LE4%<>%&LE1%.sfx, ENVI @&LE4.ADDSEL=%&LE1%.sfx
	}
_END

_SUB selectTABL
	ENVI @&TABLD.Sel=?&SEL
	IFEX $%&SEL%=0, EXIT
	ENVI @&TABLD.VAL=?%&SEL%.2;&rMSG
	IFEX $%&rMSG%=0,
	{
		ENVI @&TABLD.Check=%&SEL%;1
		ENVI @&TABLD.VAL=%&SEL%.2;1
	}!   
	{
		ENVI @&TABLD.Check=%&SEL%;0
		ENVI @&TABLD.VAL=%&SEL%.2;0
	}
_END

_SUB selectSAMEtype
	WAIT 10
	ENVI @%1.Sel=?&aMG
	IFEX $%&aMG%=0, EXIT
	ENVI @%1.VAL=?%&aMG%.1;&bMG
	ENVI @%1.VAL=?%&aMG%.2;&cMG
	RPOS* * &dMG=\,1,&bMG
	CALC #&dMG=%&dMG%-1
	MSTR * &eMG=1,%&dMG%,&bMG
	ENVI &fMG=1
	LOOP #1=1,
	{*
		ENVI @%1.Val=?%&fMG%.1;&gMG
		FIND $%&gMG%=, EXIT
		RPOS* * &hMG=\,1,&gMG
		CALC #&hMG=%&hMG%-1
		MSTR * &iMG=1,%&hMG%,&gMG
		IFEX $[ '%&iMG%'='%&eMG%' | '%&gMG%'='%&eMG%' | ( %&dMG%<1 & %&hMG%<1 ) ],
		{
			ENVI @%1.Check=%&fMG%;%&cMG%
			ENVI @%1.VAL=%&fMG%.2;%&cMG%
		}
		CALC #&fMG=%&fMG%+1
	}
_END

//"D" D
//"E" E &CR
_SUB getSELECT *
	FIND $%~1<>,
	{*
		ENVI &tablVAR=
		ENVI @&TABLD.Check=?*&selNUM
		FORX * %&selNUM%,&oneNUM,
		{*
			ENVI @&TABLD.Val=?%&oneNUM%.1;&myTABLDvar
			ENVI &tablVAR=%&tablVAR%%&myTABLDvar%%&NL%
		}
		ENVI-ret &tabl%~1MSG%&L1.isel%=%&tablVAR%
	}
	FIND $%3<>,!! ^FIND $%%&tabl%2MSG%&L1.isel%%%=, ENVI @%3.Check=0
_END

//隐藏 D "$"
//压缩 E "$" &CR
_SUB checkWIN7 *
	IFEX $[ %&CF.Check%=1 & '%1'='隐藏' & '%&LD%'='PECMD' ], CALL @--popmenu startWIN7 %*
	IFEX $[ %&CR.Check%=1 & '%1'='压缩' ], CALL @WIN7 %*
_END

//隐藏 D "$"
_SUB startWIN7 *
	MENU ,排除文件,CALL @WIN7 %*
_END

//"%&wp%" "%&lp%" D "$"
_SUB getTABLD
	ENVI ?,&Allfile=DROPFILE,%~1
	STRL * &nLen=&L1
	MSTR * &nPath=1,%&nLen%,&Allfile
	FIND $%&nPath%<>%&L1%, TEAM MESS+icon6%&top% %&NL%%&NL%请在源文件夹内进行选择！ @错误#OK*5000| EXIT
	ENVI &forxCMD=FORX *NL &Allfile,&tE,
	THREAD*$ CALL checkFILElist listDIR %3 %4
_END

//"" D "$"
_SUB checkFILElist *
	ENVI @&BD1=提示：正在初始化，请稍等...
	CALL Disable &TABLD &ID1 &ID2
	ENVI &tabldVAR=
	STRL * &sL=&L1
	CALC #&sL=%&sL%+2
	%&forxCMD%
	{*
		IFEX $%&exitCODE%=1, EXIT
		MSTR * &tF=%&sL%,0,&tE
		FIND $%&tF%<>,
		{*
			IFEX [ ( %&tE%\ ) & '%~3'='' ], ENVI &tF=
			FIND $%&tF%<>, SET< &tabldVAR=%&tF%%&NL%
		}
		IFEX [ ( %&tE%\ ) & '%~1'<>'' ],
		{*
			ENVI &forxCMD2=FORX /S %~3%&tE%\*,&tG,,
			%&forxCMD2%
			{*
				IFEX $%&exitCODE%=1, EXIT
				MSTR * &tF=%&sL%,0,&tG
				FIND $%&tF%<>, SET< &tabldVAR=%&tF%%&NL%
			}
		}
	}
	ENVI @&TABLD.Val=-*
	ENVI @&TABLD.Val=1*#;%&tabldVAR%
	ENVI &tabldVAR=%&NL%%&tabldVAR%
	ENVI &forxCMD3=FORX *NL &tabl%2MSG%&L1.isel%,&tmpMSG,
	%&forxCMD3%
	{*
		IFEX $%&exitCODE%=1, EXIT
		LPOS* * ,&bnPOS=%&NL%%&tmpMSG%%&NL%,1,&tabldVAR
		IFEX $%&bnPOS%>0,
		{
			ENVI @&TABLD.Check=%&bnPOS%;1
			ENVI @&TABLD.VAL=%&bnPOS%.2;1
		}
	}
	CALL Disable &TABLD &ID3
	CALL Enable &TABLD &ID1 &ID2
	ENVI @&BD1=可拖入。双击可选择同级目录下的文件
	ENVI @&exitCODE=0
	//ENVI @@Enable=%&WinID%:1
_END

_SUB setPROG
	FIND $%&L6%=7z,
	{
		ENVI @&L7.VAL=仅存储|极速压缩|快速压缩|标准压缩|最大压缩|极限压缩
	}!   
	{
		ENVI @&L7.VAL=15|16|17|18|19|20|21
	}
_END

_SUB setPWDchk
	FIND $%&L6%=7z,
	{
		IFEX $%&L6.Enable%=1, CALL Enable &CT
		IFEX $[ %&CT.Check%=0 & %&CU.Check%=0 ], CALL Disable &CU
	}!   
	{
		CALL Disable &CT &CU
		CALL DisCheck &CT &CU
	}
_END

_SUB checkFILEname *
	IFEX $[ %&L3.Enable%=1 & '%&L3%'<>'' ], ENVI &tmpEXE=%&L3%! ENVI &tmpEXE=%&L4%
	FNAM &tmpNAM=%&tmpEXE%
_END

_SUB checkDIRname *
	FNAM -ext &tmpNAM=%&L1%
_END

_SUB setFILEname
	CALL checkFILEname
	FIND $%&tmpNAM%<>, ENVI @&EC1=%&tmpNAM%! MESS+icon6%&top% %&NL%%&NL%找不到程序！ @错误#OK*5000
_END

_SUB setDIRname
	CALL checkDIRname
	FIND $%&tmpNAM%<>, ENVI @&EC1=%&tmpNAM%! MESS+icon6%&top% %&NL%%&NL%找不到目录！ @错误#OK*5000
_END

_SUB checkEC1
	ENVI @&EC2=1
	CALL setBC1
	ENVI @&EC2=0
_END

_SUB setBC1
	ENVI @&BC1=%&LC1%\%&EC1%
_END

_SUB savePATH *
	FIND $%~1<>,
	{*
		ENVI &dir1=%&EC1%
		CALL loopSED &dir1
		ENVI-ret &extractPATH%&L1.isel%=%&LC1%\%&dir1%
	}!   
	{
		^FIND $%%&extractPATH%&L1.isel%%%=, ENVI @&C7.Check=0
	}
	^IFEX $[ %%&CD.Check%%=1 & %%&C7.Check%%=1 & '%%&extractPATH%&L1.isel%%%'<>'' ],
	{
		FIND $%&LD%=PECMD,
		{
			LPOS* * &tmpPOS=%%RanDom%%,1,&extractPATH%&L1.isel%
			IFEX $%&tmpPOS%<1, ENVI @&CD.Check=0
		}!   
		{
			ENVI @&CD.Check=0
		}

	}
_END

_SUB loopSED *
	^SED %1=0,[\/\:\*\?\"\<\>\|],,%%%1%%
	^SED %1=0,%&TAB%, ,%%%1%%
	^SED %1=0,  *\\,\\,%%%1%%
	LOOP #1=1,
	{*
		LPOS* * &lsd1=\\,1,%1
		IFEX $%&lsd1%>0, ^SED %1=0,\\\\,\\,%%%1%%! EXIT
	}
	^SED %1=0,^[\\],,%%%1%%
	^SED %1=1,\\$,,%%%1%%
_END

_SUB checkWIN6 *
	IFEX $%&C7.Check%=1,
	{*
		SED &allLC1=0,{.},\1:|,CDEFGHIJKLMNOPQRSTUVWXYZAB
		ENVI &selectNUM=
		EXEC* -hide &varSTR=cmd.exe /c set
		FORX *NL &varSTR,&oneSTR,
		{*
			MSTR * -delims:= &var1,&var2=<1><2->&oneSTR
			FIND $[ '%&LD%'='7zSFX' & ( '%&var1%'='CurDir' | '%&var1%'='CurDrv' | '%&var1%'='CurFile' | '%&var1%'='Desktop' | '%&var1%'='Favorites' | '%&var1%'='IECache' | '%&var1%'='MyName' | '%&var1%'='MyName0' | '%&var1%'='Personal' | '%&var1%'='Programs' | '%&var1%'='SendTo' | '%&var1%'='StartMenu' | '%&var1%'='Startup' | '%&var1%'='_CD' ) ], EXIT -
			SED &var2=1,\\$,,%&var2%
			LPOS* * &var3=;,1,&var2
			MSTR * &var4=2,2,&var2
			FEXT &var5=%&var2%
			IFEX $[ %&var3%<1 & '%&var5%'='' & ( '%&var4%'=':\' | '%&var4%'=':' ) ],
			{*
				ENVI-env &%&var1%=%&var2%
				ENVI &var6=%%%&var1%
				ENVI &var6=%&var6%%
				ENVI &allLC1=%&allLC1%%&var6%|
				FIND $%&var1%=TEMP,
				{*
					ENVI &selectNUM=%&var6%
					FIND $%&LD%=PECMD, ENVI &pathDRV=~%%RanDom%%! TEAM CALL checkDIRname| ENVI &pathDRV=%&tmpNAM%
				}
			}
		}
		FIND $%&LD%=7zSFX,
		{*
			ENVI-env &UserDesktop=%Desktop%
			ENVI-env &MyDocuments=%Personal%
			SET< &allLC1=%%UserDesktop%%|%%MyDocuments%%|%%%%S
		}
		^FIND $%%&extractPATH%&L1.isel%%%<>,
		{*
			MSTR * -delims:\ &selectNUM,&pathDRV=<1><2->&extractPATH%&L1.isel%
			FIND $%&LD%=7zSFX,
			{*
				FIND $'%&selectNUM%'='%%CurDir%%', ENVI &selectNUM=%%%%S
				FIND $'%&selectNUM%'='%%Desktop%%', ENVI &selectNUM=%%UserDesktop%%
				FIND $'%&selectNUM%'='%%Personal%%', ENVI &selectNUM=%%MyDocuments%%
				LPOS* * &xPATHtmp=%%RanDom%%,1,&pathDRV
				IFEX $%&xPATHtmp%>0,
				{*
					CALL checkDIRname
					ENVI &pathDRV=%&tmpNAM%
				}
			}!   
			{*
				FIND $'%&selectNUM%'='%%%%S', ENVI &selectNUM=%%CurDir%%
				FIND $'%&selectNUM%'='%%UserDesktop%%', ENVI &selectNUM=%%Desktop%%
				FIND $'%&selectNUM%'='%%MyDocuments%%', ENVI &selectNUM=%%Personal%%
			}
		}
		CALL @WIN6
	}
_END

_SUB addTABLB
	FIND $%&LB1%=, TEAM MESS+icon6%&top% %&NL%%&NL%请先选择源文件！ @错误#OK*5000| EXIT
	ENVI &_EB1=%&EB1%
	ENVI &_EB5=%&EB5%
	CALL loopSED &_EB1
	CALL loopSED &_EB5
	SED &_EB2=0,%&TAB%, ,%&EB2%
	SED &_EB3=0,%&TAB%, ,%&EB3%
	ENVI @&TABLB.Val=%1;%&LB5%%&TAB%%&LB2%%&TAB%%&_EB5%%&TAB%%&_EB1%%&TAB%%&LB1%%&TAB%%&_EB2%%&TAB%%&LB4%%&TAB%%&EB4%%&TAB%%&_EB3%%&TAB%%&LB3%
	IFEX $%1=0, CALL SB_BOTTOM B
_END

_SUB delTABLB
	ENVI &delCMD=%~1
	ENVI @&TABLB.Sel=?&SEL
	IFEX $%&SEL%=0,!! TEAM FIND $%~1=, MESS+icon6%&top% %&NL%%&NL%请先在表格中选择！ @错误#OK*5000| EXIT
	%&delCMD%ENVI @&TABLB.Val=-%&SEL%
	ENVI @&TABLB.Val=?*;&selectLINE
	IFEX $%&selectLINE%>%&SEL%,
	{*
		IFEX $%&SEL%>1, CALC #&selectLINE=%&SEL%-1! ENVI &selectLINE=1
	}
	ENVI @&TABLB.Sel=%&selectLINE%
_END

_SUB changeTABLB
	ENVI @&TABLB.Sel=?&SEL
	IFEX $%&SEL%=0, TEAM MESS+icon6%&top% %&NL%%&NL%请先在表格中选择！ @错误#OK*5000| EXIT
	CALL addTABLB %&SEL%
_END

_SUB setDIR
	CALL getDIR &LB1 &myTMP
	FNAM &tmpNAME=%&LB1%
	ENVI @&LB3.SEL=%&myTMP%
	ENVI @&LB4.SEL=%&LB1%
	ENVI @&EB1=%&tmpNAME%
	//ENVI @&EB4=0
_END

_SUB getDIR *
	RPOS* * &aPOS=\,1,%1
	IFEX $%&aPOS%>0, MSTR * %2=1,%&aPOS%,%1! TEAM ENVI %2= |
_END

_SUB checkWIN4 *
	IFEX $%&C9.Check%=1, CALL @WIN4
_END

_SUB threadWIN4
	ENVI @&BB2=提示：正在初始化，请稍等...
	CALL Disable &TABLB &IB6 &IB1 &IB2 &IB3 &IB4 &IB5 &EB1 &EB2 &EB3
	ENVI &listLB=
	STRL &aNUM=%&L1%\.
	FORX /S %&L1%\*,&tmpf,,
	{*
		IFEX $%&exitCODE%=1, EXIT
		MSTR * &tmpB=%&aNUM%,0,&tmpf
		SET< &listLB=%&tmpB%|
	}
	ENVI &listLB3=| |
	FORX /S @%&L1%\*,&tmpf,,
	{*
		IFEX $%&exitCODE%=1, EXIT
		MSTR * &tmpB=%&aNUM%,0,&tmpf
		SET< &listLB3=%&tmpB%\|
	}
	ENVI &tmpTABL=
	FORX *NL &tablBMSG%&L1.isel%,&oneTABL,
	{*
		IFEX $%&exitCODE%=1, TEAM ^ENVI &tmpTABL=%%&tablBMSG%&L1.isel%%%| EXIT
		MSTR* * &tmpONE=<5>&oneTABL
		FIND $%&tmpONE%<>,
		{*
			IFEX "%&L1%\%&tmpONE%",
			{*
				FIND $%&LD%=7zSFX,
				{*
					MSTR* * &tmpX2,&tmpX1=<2><2->&oneTABL
					FIND $[ '%&tmpX2%'<>'锁定到任务栏' & '%&tmpX2%'<>'发送到目录' & '%&tmpX2%'<>'我的文档' ], SET< &tmpTABL=默认%&TAB%%&tmpX1%%&NL%
				}!   
				{*
					SET< &tmpTABL=%&oneTABL%%&NL%
				}
			}
		}
	}
	//ENVI-env &tablBMSG%&L1.isel%=%&tmpTABL%
	ENVI @&TABLB.Val=-*
	ENVI @&TABLB.Val=1*#;%&tmpTABL%
	IFEX $[ %&L3.Enable%=1 & '%&L3%'<>'' ], ENVI &selectEXE=%&L3%! ENVI &selectEXE=%&L4%
	FNAM &selectNAME=%&selectEXE%
	ENVI @&EB1=%&selectNAME%
	IFEX $%&exitCODE%=0,
	{
		CALL getDIR &selectEXE &selectDIR
		ENVI &listLB3=%%SystemDrive%%\|%%WinDir%%\|%%Temp%%\|%%ProgramFiles%%\|%%ProgramFiles(x86)%%\|%&listLB3%
		ENVI @&LB1.Val=%&listLB%
		ENVI @&LB1.Sel=%&selectEXE%
		ENVI @&LB3.Val=%&listLB3%
		ENVI @&LB3.Sel=%&selectDIR%
		ENVI @&LB4.Val=shell32.dll|imageres.dll|explorer.exe|%&listLB%
		ENVI @&LB4.Sel=%&selectEXE%
	}
	FIND $%&tmpTABL%=,
	{
		ENVI @&TABLB.VAL=1*#;A
		ENVI @&TABLB.Val=-*
	}!   
	{
		ENVI @&TABLB.SEL=1
		CALL setTABL B &LB1
	}
	ENVI @&IB7.Enable=0
	CALL Enable &TABLB &IB6 &IB1 &IB2 &IB3 &IB4 &IB5 &EB1 &EB2 &EB3
	ENVI @&BB2=提示：可用鼠标右键进行删除操作
	ENVI @&exitCODE=0
	//ENVI @@Enable=%&WinID%:1
_END

_SUB checkWIN3 *
	IFEX $%&C8.Check%=1,
	{*
		ENVI &listLA=
		ENVI &tmpTABL=
		FORX *NL &tablAMSG%&L1.isel%,&oneTABL,
		{*
			MSTR* * &tmpONE=<1>&oneTABL
			FIND $%&tmpONE%<>,
			{*
				ENVI &scriptHAVE=
				FEXT &sEXT=%&tmpONE%
				FIND $%&sEXT%=, ENVI &scriptHAVE=1
				IFEX [ ( %&L1%\%&tmpONE% ) | $%&scriptHAVE%=1 ],
				{*
					ENVI &tz6=%&oneTABL%
					FIND $%&LD%=PECMD,
					{*
						MSTR* * &tz1,&tz2,&tz3,&tz4,&tz5=<1*>&oneTABL
						FIND $%&tz4%=等待所有子进程,
						{*
							ENVI &tz4=等待结束
							ENVI &tz6=%&tz1%%&TAB%%&tz2%%&TAB%%&tz3%%&TAB%%&tz4%%&TAB%%&tz5%
						}
					}
					FIND $%&LD%=7zSFX,!! TEAM FEXT &tz7=%&tmpONE%| FIND $%&tz7%=WCS, EXIT -| FIND $%&scriptHAVE%=1, EXIT -
					SET< &tmpTABL=%&tz6%%&NL%
					SET< &listLA=%&tmpONE%|
				}
			}
		}
		//ENVI &tablAMSG%&L1.isel%=%&tmpTABL%
		CALL @WIN3
	}
_END

_SUB rightMENUb
	ENVI @&TABLJ.Sel=?&SEL
	IFEX $%&SEL%>0, CALL MENU1 J %&SEL% ""
_END

_SUB rightMENUa
	ENVI @&TABLA.SEL=?.&tX;&tY
	IFEX $[ %&tX%>0 & %&tY%>0 ],
	{
		IFEX $%&tY%=1, CALL MENU1 A %&LA1.isel% &LA1
		IFEX $%&tY%=2, CALL MENU2
		IFEX $%&tY%=3, CALL MENU3
		IFEX $%&tY%=4, CALL MENU4
		IFEX $%&tY%=5,!! MENU ,修改, CALL setMENU %&tX%.5 "" 运行参数 "%&EA1%" A
	}
_END

_SUB MENU1
	MENU ,上移, CALL updownTABL %* -1
	MENU ,下移, CALL updownTABL %* +1
	MENU ,删除, CALL redelTABL %*
_END

_SUB MENU2
	MENU ,是, TEAM ENVI @&TABLA.Val=%&tX%.2;是| ENVI @&CA1.Check=1
	MENU ,否, TEAM ENVI @&TABLA.Val=%&tX%.2;否| ENVI @&CA1.Check=0
_END

_SUB MENU3
	MENU ,主程序运行前, TEAM ENVI @&TABLA.Val=%&tX%.3;主程序运行前| ENVI @&LA2.SEL=主程序运行前
	MENU ,主程序结束后, TEAM ENVI @&TABLA.Val=%&tX%.3;主程序结束后| ENVI @&LA2.SEL=主程序结束后
_END

_SUB MENU4
	MENU ,等待结束, TEAM ENVI @&TABLA.Val=%&tX%.4;等待结束| ENVI @&LA3.SEL=等待结束
	MENU ,不等待, TEAM ENVI @&TABLA.Val=%&tX%.4;不等待| ENVI @&LA3.SEL=不等待
_END

_SUB updownTABL
	ENVI &tmpU=%2%4
	CALC #&tmpD=%&tmpU%
	IFEX $%&tmpD%>0,
	{
		ENVI @&TABL%1.Val=?%&tmpD%;&msgD
		FIND $%&msgD%<>,
		{
			ENVI @&TABL%1.Val=?%2;&msgU
			ENVI @&TABL%1.Val=%2;%&msgD%%&TAB%
			ENVI @&TABL%1.Val=%&tmpD%;%&msgU%%&TAB%
			ENVI @&TABL%1.Sel=%&tmpD%
			FIND $%~3<>,
			{
				ENVI @&TABL%1.Val=?*.*;&msgA
				ENVI &msgF=
				FORX *NL &msgA,&msgB,
				{*
					MSTR* * &msgC=<1>&msgB
					SET< &msgF=%&msgC%|
				}
				^ENVI &msgG=%%%~3%%
				ENVI @%~3.VAL=%&msgF%
				ENVI @%~3.SEL=%&msgG%
			}
		}
	}
_END

_SUB setCHECK
	IFEX $%&CA1.Check%=1, ENVI &tmpCHECK=是! ENVI &tmpCHECK=否
	ENVI @&TABLA.Val=%&LA1.isel%.2;%&tmpCHECK%
_END

_SUB redelTABL
	FIND $%~3=,
	{
		ENVI @&TABL%1.Val=-%2
		ENVI @&II1%1=新增
	}!   
	{
		FIND $%&LA1%<>,
		{
			ENVI @&EA2=1
			ENVI @&EA1=
			ENVI @&EA2=0
			ENVI @&TABLA.Val=-%&LA1.isel%
			ENVI @&LA1.DEL=%&LA1%
			FIND $%&LA1%=, ENVI @&LA1.VAL=
			CALL resetTABL
		}
	}
_END

_SUB viewREGBAT
	FIND $%1=,
	{*
		ENVI &_fir=%&LA1%
		FIND $%&_fir%=, ENVI &_fir=setup.bat
		ENVI &_fir=%&L1%\%&_fir%
		BROW &fir,%&_fir%,指定要插入的文件,exe、reg、bat、cmd、vbs、wcs|*.exe;*.reg;*.bat;*.cmd;*.vbs;*.wcs,0x10001000
	}
	FIND $%&fir%<>,
	{
		FEXT &xEXT=%&fir%
		FIND $[ '%&LD%'='7zSFX' & '%&xEXT%'='wcs' ], TEAM MESS+icon6%&top% %&NL%%&NL%7zSFX 模块不支持运行 WCS 文件！ @错误#OK*5000| EXIT
		FIND $[ '%&xEXT%'<>'exe' & '%&xEXT%'<>'bat' & '%&xEXT%'<>'cmd' & '%&xEXT%'<>'reg' & '%&xEXT%'<>'vbs' & '%&xEXT%'<>'wcs' ], TEAM MESS+icon6%&top% %&NL%%&NL%请指定EXE、VBS、WCS、注册表或批处理文件！ @错误#OK*5000| EXIT
		STRL * &sL=&L1
		MSTR * &tE=1,%&sL%,&fir
		FIND $%&tE%<>%&L1%, TEAM MESS+icon6%&top% %&NL%%&NL%请在源文件夹内进行选择！ @错误#OK*5000| EXIT
		CALC #&sL=%&sL%+2
		MSTR * &tE=%&sL%,0,&fir
		ENVI @&LA1.SEL=%&tE%
		FIND $%&LA1%<>%&tE%,
		{
			ENVI @&LA1.ADDSEL=%&tE%
			ENVI @&CA1.Check=1
			ENVI @&LA2.SEL=主程序运行前
			ENVI @&LA3.SEL=等待结束
			ENVI @&EA2=1
			ENVI @&EA1=
			ENVI @&EA2=0
			ENVI @&TABLA.Val=0;%&tE%%&TAB%是%&TAB%主程序运行前%&TAB%等待结束
			CALL SB_BOTTOM A
		}!   
		{
			CALL resetTABL
		}
	}
_END

_SUB resetTABL
	ENVI @&TABLA.Sel=%&LA1.isel%
	CALL setTABL A &LA1
_END

_SUB saveMSG *
	IFEX $[ %&saveCODE%=1 | '%~1'<>'' ],
	{*
		ENVI @&TABL%~1.Val=?*.*;&allMSG
		ENVI-ret &tabl%~1MSG%&L1.isel%=%&allMSG%
		FIND $%~1=A,
		{*
			FORX *NL &allMSG,&axMSG,
			{*
				MSTR* * &scriptNAME=<1>&axMSG
				FEXT &sEXT=%&axMSG%
				FIND $%&sEXT%=, ^TEAM ENVI-ret &%scriptNAME%=%%%&scriptNAME%%%| ENVI-ret &%scriptNAME%_%&L1.isel%=%%%&scriptNAME%%%
			}
		}
		FIND $%2=,
		{*
			ENVI-ret &valueSTR%&L1.isel%=
			FORX *NL &allMSG,&aMSG,
			{*
				MSTR* * &bMSG,&cMSG=<1*>&aMSG
				^ENVI-ret &valueSTR%&L1.isel%=%%&valueSTR%&L1.isel%%%%%&NL%%		VALUE "%%&bMSG%%", "%%&cMSG%%"
			}
			FORX * 1 2 3 4 5 6 7 8 ,&xPOS, TEAM ^FIND $%%&EI%&xPOS%%%=, ENVI @&EI%&xPOS%=| ^ENVI-ret &EI%&xPOS%_%&L1.isel%=%%&EI%&xPOS%%%
			ENVI-ret &myFileVersion%&L1.isel%=%&EI1%,%&EI2%,%&EI3%,%&EI4%
			ENVI-ret &myProductVersion%&L1.isel%=%&EI5%,%&EI6%,%&EI7%,%&EI8%
			ENVI-ret &myVER%&L1.isel%=%&verMSG%
			ENVI-ret &tablCMSG%&L1.isel%=%&L9%
			ENVI @&saveCODE=0
		}
		FIND $%3<>,!! FIND $%&allMSG%=, ENVI @%3.Check=0
		EXIT
	}
	FIND $%3<>,!! ^FIND $%%&tabl%4MSG%&L1.isel%%%=, ENVI @%3.Check=0
_END

_SUB setPOS
	ENVI @%1.POS=?&leftPOS:&rightPOS:&Wide2:&High2
	ENVI @this.POS=?::&Wide3:&High3
	CALC #&leftPOS2=%&leftPOS%+(%&Wide2%-%&Wide3%)/2
	CALC #&rightPOS2=%&rightPOS%+(%&High2%-%&High3%)/2
	IFEX $[ %&leftPOS2%=%&leftPOS% & %&leftPOS2%>3 ], CALC #&leftPOS2=%&leftPOS2%-4
	IFEX $[ %&rightPOS2%=%&rightPOS% & %&rightPOS2%>3 ], CALC #&rightPOS2=%&rightPOS2%-4
	ENVI @this.POS=%&leftPOS2%:%&rightPOS2%
_END

_SUB rightMENU
	ENVI @&TABL.Sel=?&aSEL
	ENVI @&TABL.Val=?%&aSEL%;&za
	MSTR* * &za,&zb=<1*>&za
	ENVI @&TABL.Val=?*.*;&uMSG
	ENVI &uMSG=%&NL%%&uMSG%
	ENVI &myNUM=1
	FORX * %&verSTR%,&uSTR,
	{*
		LPOS* * &uPOS=%&NL%%&uSTR%%&TAB%,1,&uMSG
		READ -*,%&myNUM%,&uq,&newVERcode
		READ -*,%&myNUM%,&ur,&tmpVERcode
		IFEX $%&uPOS%>0, ENVI %&ur%x=-1, ENVI %&ur%x=0
		ENVI %&ur%=%&uq%
		ENVI %&ur%y=%&uSTR%
		CALC #&myNUM=%&myNUM%+1
	}
	MENU -bar -sub childMENU,新增
	IFEX $%&aSEL%>0,
	{
		MENU ,修改, CALL setMENU %&aSEL%.2 "" "%&za%" "%&zb%"
		MENU ,删除, TEAM ENVI @&TABL.Val=-%&aSEL%| ENVI @&II1=新增
	}
_END

_SUB childMENU
	MENU ,%&xa%, CALL setMENU 0 %&xay% "%&xa%",%&xax%
	MENU ,%&xb%, CALL setMENU 0 %&xby% "%&xb%",%&xbx%
	MENU ,%&xc%, CALL setMENU 0 %&xcy% "%&xc%",%&xcx%
	MENU ,%&xd%, CALL setMENU 0 %&xdy% "%&xd%",%&xdx%
	MENU ,%&xe%, CALL setMENU 0 %&xey% "%&xe%",%&xex%
	MENU ,%&xf%, CALL setMENU 0 %&xfy% "%&xf%",%&xfx%
	MENU ,%&xg%, CALL setMENU 0 %&xgy% "%&xg%",%&xgx%
	MENU ,%&xh%, CALL setMENU 0 %&xhy% "%&xh%",%&xhx%
	MENU ,%&xi%, CALL setMENU 0 %&xiy% "%&xi%",%&xix%
	MENU ,%&xj%, CALL setMENU 0 %&xjy% "%&xj%",%&xjx%
	MENU ,%&xk%, CALL setMENU 0 %&xky% "%&xk%",%&xkx%
	MENU ,%&xl%, CALL setMENU 0 %&xly% "%&xl%",%&xlx%
_END

_SUB setMENU,W502H137,%~3,,%MyName%,,, %&ScaleCMD%
	FIND $%~5=, CALL setPOS WIN2! CALL setPOS WIN3
	CALL SETtop
	%&Font_Cmd%
	EDIT+ -3D &AE1,L17T21W464H28,%~4,,,0xDF0029,12
	ITEM &AI1,L290T65W78H27,确定,TEAM CALL doSET %1 %2 %5| KILL \,
	ITEM &AI2,L380T65W78H27,取消,KILL \,
	CALL Cursor &AI1 &AI2
_END

_SUB doSET
	ENVI &xaq=%&AE1%
	SED &xaq=0,%&TAB%, ,%&xaq%
	FIND $%~3=, TEAM CALL DelStr &xaq| ENVI @&EIA=%&xaq%! TEAM ENVI @&EA2=1| ENVI @&EA1=%&xaq%| ENVI @&EA2=0
	FIND $%~1=0,
	{
		ENVI @&TABL%~3.Val=%~1;%~2%&TAB%%&xaq%
		ENVI @&EI9=%~2
		ENVI @&II1=修改
		CALL SB_BOTTOM %3
	}!   
	{
		ENVI @&TABL%~3.Val=%~1;%&xaq%
	}
_END

//typedef struct tagSCROLLINFO {
//  UINT cbSize;
//  UINT fMask;
//  int  nMin;
//  int  nMax;
//  UINT nPage;
//  int  nPos;
//  int  nTrackPos;
//} SCROLLINFO, *LPCSCROLLINFO;

//标准滚动条：
//  SCROLLINFO VScrollinfo = {sizeof(SCROLLINFO)};
//  VScrollinfo.fMask = SIF_POS;
//  VScrollinfo.nPos = 0;
//  SetScrollInfo(SB_VERT, &VScrollinfo);

_SUB SB_BOTTOM
	ENVI @&TABL%~1.ID=?&hTABLid
	ENVI @&TABL%~1.SENDMSG=%&WM_VSCROLL%;%&SB_BOTTOM% //数据 滚
	SET#% &si=(4*7) 0 0 0  *(4*6) 0  //SCROLLINFO  4*7 个字节
	SET-long &si=%&SIF_POS%:4  // fMask
	SET-long &si=0x7FFFFFFF:(4*5) // nPos
	CALL $--qd User32.dll,SetScrollInfo,#%&hTABLid%,#%&SB_VERT%,*si,#1  //滚动条(本身) 滚
	ENVI @&TABL%~1.Val=?*;&selectLINE
	ENVI @&TABL%~1.Sel=%&selectLINE%
_END

_SUB getHOTkey
	IFEX $[ %&wp%=0x26 | %&wp%=0x28 ], CALL setTABL %*
_END

_SUB checkCHANGE
	ENVI @&EIB%1=1
	^FIND $%%&EI9%1%%=,
	{
		ENVI @&II1%1=新增
	}!   
	{
		^ENVI &tmpG=%%&EI9%1%%
		SED &tmpG=0,%&TAB%, ,%&tmpG%
		CALL DelStr &tmpG %1
		FIND $%&tmpG%<>,
		{
			ENVI &lq=1
			LOOP #1=1,
			{*
				ENVI @&TABL%1.Val=?%&lq%;&zMSG
				FIND $%&zMSG%=, EXIT
				MSTR* * &xMSG=<1>&zMSG
				FIND $%&xMSG%=%&tmpG%, TEAM ENVI @&II1%1=修改| ENVI @&EIB%1=0| EXIT _SUB
				CALC #&lq=%&lq%+1
			}
			ENVI @&II1%1=新增
		}!   
		{
			ENVI @&II1%1=新增
		}
	}
	ENVI @&EIB%1=0
_END

_SUB changeTABL
	^ENVI &tmpE=%%&EI9%~1%%
	^ENVI &tmpF=%%&EIA%~1%%
	SED &tmpE=0,%&TAB%, ,%&tmpE%
	SED &tmpF=0,%&TAB%, ,%&tmpF%
	CALL DelStr &tmpE %~1
	CALL DelStr &tmpF %~1
	FIND $%&tmpE%<>,
	{
		^FIND $%%&II1%~1%%=新增, ENVI @&II1%~1=修改
		ENVI &lm=1
		ENVI &xPOS=
		LOOP #1=1,
		{*
			ENVI @&TABL%~1.Val=?%&lm%;&pMSG
			FIND $%&pMSG%=, EXIT
			MSTR* * &tMSG=<1>&pMSG
			FIND $%&tMSG%=%&tmpE%, TEAM ENVI &xPOS=%&lm%| EXIT
			CALC #&lm=%&lm%+1
		}
		IFEX $%&xPOS%>0,
		{
			ENVI @&TABL%~1.Val=%&xPOS%.2;%&tmpF%
			ENVI @&TABL%~1.Sel=%&xPOS%
		}!   
		{
			ENVI @&TABL%~1.Val=0;%&tmpE%%&TAB%%&tmpF%
			CALL SB_BOTTOM %*
		}
	}
_END

_SUB DelStr
	MSTR * &y2=<1->%1
	LOOP $%&y2%<>,
	{*
		MSTR &y3=-1,1,%&y2%
		FIND $%&y3%=, MSTR &y2=-2,0,%&y2%! EXIT
	}
	FIND $%~2=, SED &y4=0,\",,%&y2%! ENVI &y4=%&y2%
	ENVI-ret %1=%&y4%
_END

_SUB delTABL
	^ENVI &qMSG=%%&EI9%~1%%
	CALL DelStr &qMSG %~1
	FIND $%&qMSG%<>,
	{
		ENVI &ln=1
		LOOP #1=1,
		{*
			ENVI @&TABL%~1.Val=?%&ln%;&lMSG
			FIND $%&lMSG%=, EXIT
			MSTR* * &mMSG=<1>&lMSG
			FIND $%&mMSG%=%&qMSG%, TEAM ENVI @&TABL%~1.Val=-%&ln%| ENVI @&II1%~1=新增| EXIT
			CALC #&ln=%&ln%+1
		}
	}
_END

_SUB setTABL
	ENVI @&TABL%~1.Sel=?&SEL
	IFEX $%&SEL%=0, EXIT
	ENVI @&TABL%~1.Val=?%&SEL%;&MSG
	MSTR* * &aMSG,&bMSG,&cMSG,&dMSG,&eMSG,&fMSG,&gMSG,&hMSG,&iMSG,&jMSG=<1*>&MSG
	FIND $%~1=,
	{
		ENVI @&EI9=%&aMSG%
		ENVI @&EIA=%&bMSG%
	}
	FIND $%~1=J,
	{
		ENVI @&EI9J=%&aMSG%
		ENVI @&EIAJ=%&bMSG%
	}
	FIND $%~1=A,
	{
		ENVI @&EA2=1
		ENVI @&EA1=%&eMSG%
		ENVI @&EA2=0
		ENVI @%~2.SEL=%&aMSG%
		ENVI @&LA2.SEL=%&cMSG%
		ENVI @&LA3.SEL=%&dMSG%
		FIND $%&bMSG%=是, ENVI @&CA1.Check=1! ENVI @&CA1.Check=0
	}
	FIND $%~1=B,
	{
		ENVI @&LB5.SEL=%&aMSG%
		ENVI @&LB2.SEL=%&bMSG%
		ENVI @&EB5=%&cMSG%
		ENVI @&EB1=%&dMSG%
		ENVI @&LB1.SEL=%&eMSG%
		ENVI @&EB2=%&fMSG%
		ENVI @&LB4.SEL=%&gMSG%
		ENVI @&EB4=%&hMSG%
		ENVI @&EB3=%&iMSG%
		ENVI @&LB3.SEL=%&jMSG%
	}
_END

_SUB get7Zmsg
	FIND --forpid:%&sgPID% --class:#32770 --wid*@ &sgWID,
	MSTR * &sgBar=<8>&sgWID
	RSTR * &bar1=1,&sgBar
	FIND $%&bar1%=%,
	{
		MSTR * &bar2=-2,0,&sgBar
		ENVI @&PartBar=%&bar2%;正在压缩，请稍等 ...  %&sgBar%
		FIND $%&bar2%=100,
		{
			FIND --forpid:%&sgPID% --class:#32770 --wid* &sgWID2,
			FIND --forpid:%&sgPID% --wid*@%&sgWID2% &sgWID3,
			LPOS* * &sgPOS=(&C),1,&sgWID3
			IFEX $%&sgPOS%>0, ENVI @@POSTMSG=%&sgWID2%;0x0010;0;0
		}
	}
_END

_SUB startCAB
	FIND $[ '%&L1%'='' | '%&L2%'='' ], EXIT
	ENVI &errCODE=
	ENVI &MakeErr=
	ENVI @&exitCODE=0
	IFEX "%&L2%", TEAM FILE -force "%&L2%"| CALL Fresh
	IFEX "%&L2%", ENVI &errCODE=保存目录
	PUTF -dd -len=0 "%&L2%",0,zero
	//WRIT "%&L2%",+0,
	IFEX "%&L2%", FILE -force "%&L2%"! ENVI &errCODE=保存目录
	ENVI-ret &tmpdir=%Temp%\~%RanDom%.tmp
	IFEX "%&tmpdir%", TEAM FILE -force "%&tmpdir%"| CALL Fresh
	IFEX "%&tmpdir%\", ENVI &errCODE=临时目录
	MDIR %&tmpdir%
	SITE "%&tmpdir%",+H
	CALL Fresh
	IFEX "%&tmpdir%\",! ENVI &errCODE=临时目录
	FIND $%&errCODE%<>, TEAM FILE -force "%&tmpdir%"| MESS+icon6.%&top% %&NL%%&NL%%&errCODE%不可写！ @错误#OK*5000| EXIT
	PATH @%&tmpdir%\
	ENVI @&PartBar=0;正在准备文件，请稍等... //  0%%
	CALL Disable &L1 &L2 &L3 &L4 &L5 &L6 &L7 &L8 &L9 &LD &LE &I1 &I2 &I3 &I4 &I5 &I6 &I7 &I8 &IA &C1 &C2 &C3 &C4 &C5 &C6 &C7 &C8 &C9 &CA &CB &CC &CD &CE &CF &CG &CH &CI &CJ &CK &CL &CN &CQ &CR &CS &CT &CU &CV &CW &E1 //&R1 &R2
	IFEX $%&CS.Visible%=0,
	{*
		FIND $%&L6%=7z,
		{*
			ENVI &mhc=-m0=LZMA2
			FIND $%&L7%=仅存储, TEAM ENVI &mx=0| ENVI &mhc=
			FIND $%&L7%=极速压缩, ENVI &mx=1
			FIND $%&L7%=快速压缩, ENVI &mx=3
			FIND $%&L7%=标准压缩, ENVI &mx=5
			FIND $%&L7%=最大压缩, ENVI &mx=7
			FIND $%&L7%=极限压缩, ENVI &mx=9
			MDIR Lang
			FIND $%&::bX64%=0, ENVI &tmpBIT=86! ENVI &tmpBIT=64
			CALL extractRES #1%&tmpBIT% SG.tmp
			CALL extractRES #2%&tmpBIT% 7z.dll
			CALL extractRES %zh-cn% Lang\zh-cn.txt
			CALL extractRES %zh-tw% Lang\zh-tw.txt
			//ENVI &expLIST=-x!*.wav
			//FIND $%&LD%=PECMD, ENVI &expLIST=
			ENVI &expLIST=
			IFEX $%&CR.Check%=1,
			{*
				^FIND $%%&tablEMSG%&L1.isel%%%<>,
				{*
					^WRIT *c *fv ~expLIST~.tmp,$+0,&tablEMSG%&L1.isel%
					SET< &expLIST= -scsWIN -xr-@"%&tmpdir%\~expLIST~.tmp"
				}
			}
			IFEX $[ %&CT.Check%=1 & '%&7zPWD%'<>'' ], ENVI &7zPWDcmd=-p%&7zPWD%! ENVI &7zPWDcmd=
			EXEC*- -cmd::100:get7Zmsg -err+ -hide -pid:&sgPID -exe:SG.tmp =7zG_exe a -t7z "%&tmpdir%\path.tmp" "%&L1%\*" -mx=%&mx% -ms=200m -mf -mhc -mhcf %&mhc% -mmt -r %&expLIST% %&7zPWDcmd%
			ENVI &error2=%&error%
			IFEX $%&error2%<>0, FILE -force path.tmp
			IFEX $%&error2%=2, ENVI &MakeErr=MESS+icon6%&top% %%&NL%%%%&NL%%未知错误，压缩失败！ @错误#OK*5000
			IFEX $%&error2%=7, ENVI &MakeErr=MESS+icon6%&top% %%&NL%%%%&NL%%命令行错误！ @错误#OK*5000
			IFEX $%&error2%=8, ENVI &MakeErr=MESS+icon6%&top% %%&NL%%%%&NL%%没有足够的内存！ @错误#OK*5000
			//7z.exe a -mx9 -md64m -mfb=273 -slp -ssw -mmt -r "F:\doc\desktop\EasyU_3.3.2017.0527a9.7z" "%&L1%\*"
			//7zG.exe x "F:\doc\desktop\EasyU_3.3.2017.0527aSST.7z" -y -aos -o"F:\doc\desktop\EasyU_3.3.2017.0527aAA\"
			//http://blog.csdn.net/wqxyk/article/details/7071907
		}!   
		{
			CALL CabFiles "%&L1%" "path.tmp"
		}
		CALL Fresh
		IFEX [ '%&LD%'='PECMD' & $%&CL.Check%=1 & ( "%&tmpdir%\path.tmp" ) ],!! PUTF path.tmp,0#8,%&tmpHEAD%
	}
	IFEX $%&exitCODE%=1, EXIT
	IFEX [ ( path.tmp ) | $%&CS.Visible%=1 ],
	{*
		ENVI &ico=
		IFEX $%&CG.Check%=1,
		{*
			FIND $%&L8%<>,
			{*
				ENVI &ico=tmp.ico
				FEXT &ext=%&L8%
				FIND $%&ext%=ico,
				{*
					SIZE &tmpSIZE=%&L8%
					IFEX $%&tmpSIZE%>0, FILE %&L8%=>%&ico%
					CALL Fresh
				}!   
				{*
					EXEC -wd:"%&tmpdir%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract "%&L8%",icon.rc,ICONGROUP,,
					CALL Fresh
					FORX /S .\*.ico,&tmpICO,,
					{
						SIZE &tmpSIZE=%&tmpICO%
						IFEX $%&tmpSIZE%>0,
						{
							FILE %&tmpICO%->%&ico%
							EXIT
						}
					}
					IFEX "%&tmpdir%\%&ico%",! EXEC -wd:"%&tmpdir%\" -hide -exe:%&extractIcon% =extractIcon_exe "%&L8%" -1 %&ico%
				}
				IFEX "%&tmpdir%\%&ico%",
				{*
					SIZE &tmpSIZE=%&ico%
					IFEX $%&tmpSIZE%>0,! ENVI &ico=
				}!  
				{*
					ENVI &ico=
				}
			}
		}
		IFEX $%&exitCODE%=1, EXIT
		ENVI &ver=
		IFEX $%&CH.Check%=1,
		{*
			ENVI &ver=version.res
			ENVI &Dou=,
			^SED &xV1=0,%%&Dou%%,,%%&myFileVersion%&L1.isel%%%
			^SED &xV2=0,%%&Dou%%,,%%&myProductVersion%&L1.isel%%%
			FIND $%&xV1%=, ENVI &xV1=
			FIND $%&xV2%=, ENVI &xV2=
			^FIND $[ '%%&tablCMSG%&L1.isel%%%'='%%&L9%%' & ( '%%&valueSTR%&L1.isel%%%'<>'' | '%%&xV1%%'<>'' | '%%&xV2%%'<>'' ) ],
			{*
				ENVI &reLOAD=
				^FIND $%%&myVER%&L1.isel%%%=,
				{*
					ENVI &reLOAD=1
				}!   
				{*
					LPOS* * &bPOS=%&NL%{%&NL%BLOCK "StringFileInfo"%&NL%{%&NL%,1,&myVER%&L1.isel%
					IFEX $%&bPOS%<1, ENVI &reLOAD=1
				}
				IFEX $%&reLOAD%=1,
				{*
					ENVI &sRC=myTMP.rc
					CALL extractRES %&verSOURCE% %&sRC%
					IFEX "%&tmpdir%\%&sRC%",!
					{
						//CALL extractVER "%&sRC%.res" "%&MyName%"
						//EXEC -wd:"%&tmpdir%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract %&sRC%.res,%&sRC%,VERSIONINFO,,
						EXEC -wd:"%&tmpdir%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract "%&MyName%",%&sRC%,VERSIONINFO,,
					}
					READ %&sRC%,**,&myVER%&L1.isel%
				}
				LPOS* * &tPOS={%&NL%		VALUE ",1,&myVER%&L1.isel%
				IFEX $%&tPOS%>0,
				{*
					MSTR * &lSTR=1,%&tPOS%,&myVER%&L1.isel%
					MSTR * &rSTR=%&tPOS%,0,&myVER%&L1.isel%
					LPOS* * &sPOS=	},1,&rSTR
					IFEX $%&sPOS%>0,
					{*
						MSTR * &rSTR=%&sPOS%,0,&rSTR
						CALL changeVER FILEVERSION &myFileVersion%&L1.isel%
						CALL changeVER PRODUCTVERSION &myProductVersion%&L1.isel%
						ENVI &tRC=tmp.rc
						FILE -force %&tRC%
						CALL Fresh
						^WRIT %%&tRC%%,$+0,%%&lSTR%%%%&valueSTR%&L1.isel%%%%%&NL%%%%&rSTR%%
						CALL Fresh
						//CALL extractDLL
						EXEC -hide -wd:"%&tmpdir%\" -exe:%&RC% =rc_exe /l 0x804 /fo %&ver% %&tRC%
						CALL Fresh
					}
				}
			}!   
			{*
				FIND $%&L9%<>,
				{*
					FEXT &ext=%&L9%
					FIND $[ '%&ext%'='rc' | '%&ext%'='txt' ],
					{*
						//CALL extractDLL
						EXEC -hide -wd:"%&tmpdir%\" -exe:%&RC% =rc_exe /l 0x804 /fo %&ver% "%&L9%"
						CALL Fresh
					}!   
					{*
						FIND $%&ext%=res,
						{*
							FILE %&L9%=>%&ver%
							CALL Fresh
						}!    
						{*
							EXEC -wd:"%&tmpdir%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract "%&L9%",%&ver%,VERSIONINFO,,
							IFEX "%&tmpdir%\%&ver%",! CALL extractVER "%&tmpdir%\%&ver%" "%&L9%"
							CALL Fresh
						}
					}
				}
			}
			IFEX "%&tmpdir%\%&ver%",! ENVI &ver=
		}
		IFEX $%&exitCODE%=1, EXIT
		//%&::bX64%=0, PECMD32+Win32  //%&::bX64%=1, PECMD32+WIN64  //%&::bX64%=3, PECMD64+WIN64
		//PUTF -dd -bs=10M admin.tmp,0,"%MyName%""#.1|#24"
		CALL extractRES %&adminSOURCE% admin.tmp
		CALL Fresh
		FIND $%&L5%=64位,
		{*
			FIND $%&LD%=PECMD,
			{*
				IFEX $%&CS.Visible%=0, CALL Check7z =0 64
				CALL extractRES #64 tmp.tmp
			}!   
			{
				CALL extractRES #464 tmp.tmp
			}
			IFEX $[ %&::bX64%=0 | %&::bX64%=1 ], CALL changeBIT X86 AMD64! CALL changeBIT
		}!   
		{*
			FIND $%&LD%=PECMD,
			{*
				IFEX $%&CS.Visible%=0, CALL Check7z <>0 86
				CALL extractRES #86 tmp.tmp
			}!   
			{
				CALL extractRES #486 tmp.tmp
			}
			IFEX $%&::bX64%=3, CALL changeBIT AMD64 X86! CALL changeBIT
		}
		//CALL ProtectMODE tmp.tmp
		CALL Fresh
		ENVI &insSCRIPT=
		FIND $%&LD%=PECMD,
		{*
			IFEX $%&CS.Visible%=0, CALL buildWCS
		}!   
		{*
			CALL buildSFX
		}
		CALL buildEXE
		ENVI &MakeErr=
		IFEX new.tmp,
		{*
			//IFEX $%&R2.Check%=1,
			FIND $%&LE%=Mpress,
			{
				EXEC -hide -wd:"%&tmpdir%\" -exe:%&mpress% =mpress_exe -i -q -m new.tmp
				FILE -force "%Temp%\mpr*.tmp"
				//CALL ProtectMODE new.tmp
				CALL Fresh
			}
			FIND $%&LE%=UPX压缩,
			{
				//EXEC -hide -wd:"%&tmpdir%\" -exe:%&UPX% =UPX_exe --best --compress-resources=0 --compress-icons=0 new.tmp -o newx.tmp
				EXEC -hide -wd:"%&tmpdir%\" -exe:%&UPX% =UPX_exe --best --compress-icons=0 new.tmp -o newx.tmp
				FILE newx.tmp->new.tmp
				//CALL ProtectMODE new.tmp
				CALL Fresh
			}
			IFEX $%&CS.Visible%=1, FILE new.tmp>>new2.tmp
			FIND $%&LD%=PECMD,
			{
				IFEX $%&CS.Visible%=0,
				{
					IFEX $%&CL.Check%=1,
					{
						SIZE &xSIZE1=new.tmp
						SIZE &xSIZE2=path.tmp
						EXEC -hide =cmd.exe /c copy /b "%&tmpdir%\new.tmp" + "%&tmpdir%\path.tmp" "%&tmpdir%\new2.tmp"
						IFEX $%&error%=2,
						{
							SIZE &dSIZE1=new.tmp
							PUTF -dd new.tmp,%&dSIZE1%,path.tmp
							IFEX $%&error%=0,!! FILE new.tmp->new2.tmp
						}
						SIZE &xSIZE3=new2.tmp
						IFEX $%&xSIZE3%>0,
						{
							IFEX $%&CJ.Check%=1, ENVI &tmpPWD=%&myPWD%! ENVI &tmpPWD=
							FILE -force pathtmp.tmp
							WRIT pathtmp.tmp,$+0,LOGS
							WRIT pathtmp.tmp,$+0,TEAM ENVI &myRELpwd=%&tmpPWD%|
							WRIT pathtmp.tmp,$+0,ENVI &mySFXsize=%&xSIZE2%
							WRIT pathtmp.tmp,$+0,ENVI &myCMPSsize=%&L6%
							CMPS pathtmp.tmp pathtmps.tmp
							FILE -force pathtmp.tmp
							PUTF pathtmps.tmp,4,%&tempCMPa%
							GETF pathtmps.tmp,0#*,&wcsSTR
							PUTF* new2.tmp,%&xSIZE3%,%&wcsSTR%
							SIZE &xSIZE4=new2.tmp
							CALL ProtectMODE new2.tmp
							SIZE &xSIZE5=pathtmps.tmp
							CODE *,#%&xSIZE5%#,*ANSI,&sizeSTR
							PUTF new2.tmp,%&xSIZE4%,%&sizeSTR%
							//主程序+压缩包+WCS+WCS大小信息+NEW标志+ZIP补丁
						}
					}!   
					{
						SIZE &xSIZE1=new.tmp
						PUTF* new.tmp,%&xSIZE1%,%&sfxEND%
						EXEC -hide =cmd.exe /c copy /b "%&tmpdir%\new.tmp" + "%&tmpdir%\path.tmp" "%&tmpdir%\new2.tmp"
						IFEX $%&error%=2,
						{
							SIZE &aSIZE1=new.tmp
							PUTF -dd new.tmp,%&aSIZE1%,path.tmp
							IFEX $%&error%=0,!! FILE new.tmp->new2.tmp
						}
					}
				}
			}!   
			{
				IFEX $%&CL.Check%=1,!! TEAM SIZE &xSIZE1=new.tmp| PUTF* new.tmp,%&xSIZE1%,%&zipPACH%
				EXEC -hide =cmd.exe /c copy /b "%&tmpdir%\new.tmp" + "%&tmpdir%\SFX.tmp" + "%&tmpdir%\path.tmp" "%&tmpdir%\new2.tmp"
				IFEX $%&error%=2,
				{
					SIZE &bSIZE1=new.tmp
					PUTF -dd new.tmp,%&bSIZE1%,SFX.tmp
					IFEX $%&error%=0,
					{
						SIZE &cSIZE1=new.tmp
						PUTF -dd new.tmp,%&cSIZE1%,path.tmp
						IFEX $%&error%=0,!! FILE new.tmp->new2.tmp
					}
				}
				//sfx+zipfix+config+7zfile
			}
			FILE new2.tmp=>%&L2%
			IFEX $%&error%=2, ENVI &MakeErr=MESS+icon6%&top% %%&NL%%%%&NL%%制作失败！ @错误#OK*5000
			ENVI @@DeskTopFresh=1
		}!    
		{*
			ENVI &MakeErr=MESS+icon6%&top% %%&NL%%%%&NL%%制作失败！ @错误#OK*5000
		}
	}!   
	{*
		FIND $%&MakeErr%=, ENVI &MakeErr=MESS+icon6%&top% %%&NL%%%%&NL%%制作失败！ @错误#OK*5000
	}
	PATH @%CurDir%\
	FILE -force "%&tmpdir%"
	CALL Fresh
	ENVI @&PartBar=100;完成...  100%%
	IFEX $%&exitCODE%=1, EXIT
	FIND $%&MakeErr%=, MESS+icon%&top% %&NL%%&NL%    成功完成！ @提示#OK*5000! %&MakeErr%
	CALL Enable &L1 &L2 &L3 &L4 &L5 &L6 &L7 &L8 &L9 &LD &LE &I1 &I2 &I3 &I4 &I5 &I6 &I7 &I8 &IA &C1 &C2 &C3 &C4 &C5 &C6 &C7 &C8 &C9 &CA &CB &CC &CD &CE &CF &CG &CH &CI &CJ &CK &CL &CN &CQ &CR &CS &CT &CU &CV &CW &E1 //&R1 &R2
	CALL setBIT
	ENVI @&PartBar=0;
	CALL setL5
	IFEX $%&CS.Visible%=1, CALL DisPECMD
	CALL setPWDchk
_END

_SUB mySED *
	^SED %1=0,\\,\\\\,%%%1%
	^SED %1=0,",%2,%%%1%
_END

_SUB SETEXE *
	FIND $%&L5%=32位, ENVI &EXE=%&L3%! ENVI &EXE=%&L4%
	SED &EXE=0,\\,\\\\,%&EXE%
_END

_SUB SETEXE3264 *
	ENVI &EXE32=%&L3%
	ENVI &EXE64=%&L4%
	SED &EXE32=0,\\,\\\\,%&EXE32%
	SED &EXE64=0,\\,\\\\,%&EXE64%
_END

_SUB buildSFX
	FILE -force SFX.tmp
	ENVI &sfxWcmd=WRIT-UTF8 SFX.tmp,$+0,
	IFEX $%&C4.Check%=1, ENVI &hide=hidcon:
	//waitall:参数会导致32位单文件在64位系统中运行时，批处理中对注册表、文件的操作存在重定向问题。即使用waitall:x64:也存在重定向问题，其它参数和x64:组合无问题。
	//https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=0&rsv_idx=1&tn=baidu&wd=%E6%89%B9%E5%A4%84%E7%90%86%E5%9C%A864%E4%BD%8D%E7%B3%BB%E7%BB%9F%E4%B8%AD%E9%87%8D%E5%AE%9A%E5%90%91&rsv_pq=e895d77a0007c7c3&rsv_t=2f03JFQhfzPyaDzWGgmEHwhloxawgYHIywBkcSUCVOezAQnQ8vTLNOvPx9Y&rqlang=cn&rsv_enter=1&rsv_sug3=35&rsv_sug1=21&rsv_sug7=101
	//https://blog.csdn.net/chenlycly/article/details/53119127
	//https://blog.csdn.net/xringm/article/details/50971750
	ENVI &wait=
	IFEX $%&CN.Check%=1, ENVI &wait=waitall:
	IFEX $%&CC.Check%=1, ENVI &wait=forcenowait:
	%&sfxWcmd%;!@Install@!UTF-8!
	MSTR * -delims:\ &ifSELECTpath,&mySFXpath=<1><2->&extractPATH%&L1.isel%
	FIND $%&ifSELECTpath%=解压前手动选择,
	{
		%&sfxWcmd%ExtractPathText="选择路径:"
		%&sfxWcmd%ExtractDialogText="正在解压文件, 请稍候..."
		%&sfxWcmd%Title="7z SFX"
		%&sfxWcmd%ExtractPathTitle="7z SFX"
		%&sfxWcmd%ExtractTitle="7z SFX"
		%&sfxWcmd%CancelPrompt="确认退出?"
		%&sfxWcmd%GUIFlags="7592"
	}!   
	{*
		^ENVI &mySFXpath=%%&extractPATH%&L1.isel%%%
	}
	CALL mySED &mySFXpath
	FNAM -ext &tmpDIRnam=%&L1%
	FIND $[ '%&ifSELECTpath%'='%%CurDrv%%' | '%&ifSELECTpath%'='%%CurFile%%' | '%&ifSELECTpath%'='%%Favorites%%' | '%&ifSELECTpath%'='%%IECache%%' | '%&ifSELECTpath%'='%%MyName%%' | '%&ifSELECTpath%'='%%MyName0%%' | '%&ifSELECTpath%'='%%Programs%%' | '%&ifSELECTpath%'='%%SendTo%%' | '%&ifSELECTpath%'='%%StartMenu%%' | '%&ifSELECTpath%'='%%Startup%%' | '%&ifSELECTpath%'='%%_CD%%' ],
	{*
		FIND $%&mySFXpath%=, ENVI &mySFXpath=\\%&tmpDIRnam%! ENVI &mySFXpath=
		^SED &mySFXpath=0,%%&ifSELECTpath%%,%%%%TEMP%%%%,%%&extractPATH%&L1.isel%%%%%&mySFXpath%%
	}
	SED *ni &mySFXpath=0:0**,%CurDir%,%%S,%&mySFXpath%
	SED *ni &mySFXpath=0:0**,%Desktop%,%UserDesktop%,%&mySFXpath%
	SED *ni &mySFXpath=0:0**,%Personal%,%MyDocuments%,%&mySFXpath%
	SED *ni &mySFXpath=0,~%%RanDom%%,%&tmpDIRnam%,%&mySFXpath%
	SED *ni &mySFXpath=0,%%RanDom%%,%&tmpDIRnam%,%&mySFXpath%
	FIND $%&mySFXpath%=, ENVI &mySFXpath=
	WRIT-UTF8 SFX.tmp,$+0,SetEnvironment="sfxcmd=\"%%%%S\\%%%%M\""
	WRIT-UTF8 SFX.tmp,$+0,SetEnvironment="sfxname=%%%%S\\%%%%M"
	IFEX $%&CQ.Check%=1,
	{
		FORX *NL &tablJMSG%&L1.isel%,&tmpENV,
		{
			CALL mySED &tmpENV \\"
			SED &tmpENV=0,%,%%%%,%&tmpENV%
			MSTR* * &env1,&env2=<1*>&tmpENV
			%&sfxWcmd%SetEnvironment="%&env1%=%&env2%"
		}
	}
	IFEX $%&C2.Check%=1,
	{
		IFEX $%&vordCANCEL%=1, %&sfxWcmd%GUIMode="0"! %&sfxWcmd%GUIMode="1"
	}!   
	{
		%&sfxWcmd%Progress="no"
		%&sfxWcmd%GUIMode="2"
	}
	IFEX $%&CB.Check%=1, %&sfxWcmd%SelfDelete="1"
	IFEX $[ %&C7.Check%=1 & '%&mySFXpath%'<>'' ],!! WRIT-UTF8 SFX.tmp,$+0,InstallPath="%&mySFXpath%"
	IFEX $%&CA.Check%=1, WRIT-UTF8 SFX.tmp,$+0,Delete="%%%%T"
	IFEX $%&CI.Check%=1,
	{
		%&sfxWcmd%OverwriteMode="0"
	}!   
	{
		IFEX $%&recoverOLD%=1,
		{
			%&sfxWcmd%OverwriteMode="2"
		}!   
		{
			%&sfxWcmd%OverwriteMode="1"
		}
	}
	//SfxVarModulePlatform
	IFEX $%&CE.Check%=1,!! WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:%%SfxVarSystemPlatform%%:\"cmd.exe\" /c attrib +h \"%%%%T\""
	IFEX $%&CF.Check%=1,
	{
		WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:%%SfxVarSystemPlatform%%:\"cmd.exe\" /c attrib -H -R -S \"%%%%T\\~%%%%M-hide~.bat\"&echo attrib +h \"%%~dp0.\" > \"%%%%T\\~%%%%M-hide~.bat\"&echo attrib +h \"%%~f0\" >> \"%%%%T\\~%%%%M-hide~.bat\"&echo for /f \"delims=\" %%%%i in ('dir /s /b \"%%~dp0\"') do (attrib +h \"%%%%i\") >> \"%%%%T\\~%%%%M-hide~.bat\"&echo del /a /f /q \"%%~f0\" >> \"%%%%T\\~%%%%M-hide~.bat\""
		WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:%%SfxVarSystemPlatform%%:\"%%%%T\\~%%%%M-hide~.bat\""
	}
	IFEX $%&CV.Check%=1,
	{
		CALL SETRunKEY &CV
		WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:%%SfxVarSystemPlatform%%:\"cmd.exe\" /c reg add \"%&runKEY%\" /f /v \"%%%%M\" /t REG_SZ /d \"%%%%S\\%%%%M\""
	}
	IFEX $%&CW.Check%=1,
	{
		CALL SETRunKEY &CW
		FIND $[ '%&L5%'='32位/64位自适应' & '%&L3%'<>'%&L4%' ],
		{
			CALL SETEXE3264
			FNAM -ext &runNAME32=%&EXE32%
			FNAM -ext &runNAME64=%&EXE64%
			WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:x86:\"cmd.exe\" /c reg add \"%&runKEY%\" /f /v \"%&runNAME32%\" /t REG_SZ /d \"%%%%T\\%&EXE32%\""
			WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:x64:\"cmd.exe\" /c reg add \"%&runKEY%\" /f /v \"%&runNAME64%\" /t REG_SZ /d \"%%%%T\\%&EXE64%\""
		}!   
		{
			CALL SETEXE
			FNAM -ext &runNAME=%&EXE%
			WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:%%SfxVarSystemPlatform%%:\"cmd.exe\" /c reg add \"%&runKEY%\" /f /v \"%&runNAME%\" /t REG_SZ /d \"%%%%T\\%&EXE%\""
		}
	}
	IFEX $%&C9.Check%=1,
	{
		FORX *NL &tablBMSG%&L1.isel%,&oneTABL,
		{
			MSTR* * &aMSG,&bMSG,&cMSG,&dMSG,&eMSG,&fMSG,&gMSG,&hMSG,&iMSG,&jMSG=<1*>&oneTABL
			FIND $%&eMSG%<>,
			{
				IFEX "%&L1%\%&eMSG%",
				{
					ENVI &linkPATH=
					FIND $%&bMSG%=我的文档, EXIT -
					FIND $%&bMSG%=发送到目录, EXIT -
					FIND $%&bMSG%=锁定到任务栏, EXIT -
					FIND $%&bMSG%=桌面, ENVI &linkPATH=D
					FIND $%&bMSG%=开始菜单, ENVI &linkPATH=S
					FIND $%&bMSG%=开始程序菜单, ENVI &linkPATH=P
					FIND $%&bMSG%=开始菜单启动项, ENVI &linkPATH=T
					ENVI &workPATH=
					FIND $%&jMSG%<>,
					{*
						FIND $[ '%&jMSG%'='%%SystemDrive%%\' | '%&jMSG%'='%%WinDir%%\' | '%&jMSG%'='%%Temp%%\' | '%&jMSG%'='%%ProgramFiles%%\' | '%&jMSG%'='%%ProgramFiles(x86)%%\' ],
						{*
							ENVI &workPATH=%&jMSG%
						}!    
						{*
							SED &jMSG=0,\\,\\\\,%&jMSG%
							ENVI &workPATH=%%%%T\\%&jMSG%
						}
					}
					ENVI &icoNUM=0
					FIND $%&hMSG%<>, ENVI &icoNUM=%&hMSG%
					ENVI &icoFILE=
					FIND $[ '%&gMSG%'='shell32.dll' | '%&gMSG%'='imageres.dll' | '%&gMSG%'='explorer.exe' ],
					{*
						ENVI &icoFILE=%&gMSG%
					}!    
					{*
						FIND $%&gMSG%<>,
						{*
							SED &gMSG=0,\\,\\\\,%&gMSG%
							ENVI &icoFILE=%%%%T\\%&gMSG%
						}
					}
					SED &eMSG=0,\\,\\\\,%&eMSG%
					FIND $%&dMSG%=, FNAM &linkNAME=%&eMSG%! ENVI &linkNAME=%&dMSG%
					SED &cMSG=0,^[\\],,%&cMSG%
					SED &cMSG=1,\\$,,%&cMSG%
					CALL mySED &cMSG
					CALL mySED &fMSG \\"
					CALL mySED &iMSG \\"
					CALL mySED &linkNAME
					//Shortcut1="Du,{源文件},{参数},{快捷方式子目录},{描述},{名称1－桌面当前用户},{工作目录},{图标},{2}"
					WRIT-UTF8 SFX.tmp,$+0,Shortcut="%&linkPATH%,{%%%%T\\%&eMSG%},{%&fMSG%},{%&cMSG%},{%&iMSG%},{%&linkNAME%},{%&workPATH%},{%&icoFILE%},{%&icoNUM%}"
				}
			}
		}
	}
	IFEX $%&C3.Check%=1,!! WRIT-UTF8 SFX.tmp,$+0,RunProgram="hidcon:%%SfxVarSystemPlatform%%:\"cmd.exe\" /c start \"\" \"%%%%T\""
	ENVI &fCMD1=
	ENVI &eCMD1=
	IFEX $%&C8.Check%=1,
	{*
		FORX *NL &tablAMSG%&L1.isel%,&tg1,
		{*
			FIND $%&tg1%<>,
			{*
				ENVI &tcmd=
				MSTR* * &tg2,&tg3,&tg4,&tg5,&tg6=<1*>&tg1
				FEXT &tg8=%&tg2%
				IFEX [ ( ! %&L1%\%&tg2% ) | '%&tg8%'='WCS' | '%&tg8%'='' ], EXIT -
				SED &tg2=0,\\,\\\\,%&tg2%
				CALL mySED &tg6 \\"
				FIND $%&tg6%=, ENVI &tg6=
				ENVI &tgb=
				FIND $%&tg5%=等待结束, ENVI &tgb=
				FIND $%&tg5%=不等待, ENVI &tgb=forcenowait:
				FIND $%&tg5%=等待所有子进程, ENVI &tgb=waitall:
				FIND $%&tg3%=是,
				{*
					ENVI &tg7=reg.exe import
					ENVI &tga=regedit.exe /s
					ENVI &tg9=hidcon:
				}!   
				{*
					ENVI &tg7=regedit.exe
					ENVI &tga=reg.exe import
					ENVI &tg9=
				}
				FIND $%&tg8%=reg,
				{*
					ENVI &tcmd=%&sfxWcmd%RunProgram="%&tgb%hidcon:%%%%SfxVarSystemPlatform%%%%:\"cmd.exe\" /c %&tg7% \"%%%%%%T\\%&tg2%\" || %&tga% \"%%%%%%T\\%&tg2%\""
				}!   
				{*
					FIND $[ '%&tg8%'='cmd' | '%&tg8%'='bat' ],
					{*
						ENVI &tcmd=%&sfxWcmd%RunProgram="%&tgb%%&tg9%%%%%SfxVarSystemPlatform%%%%:\"cmd.exe\" /c @pushd \"%%%%%%T\" >nul 2>&1 & CALL \"%%%%%%T\\%&tg2%\" %&tg6%"
					}!   
					{*
						ENVI &tcmd=%&sfxWcmd%RunProgram="%&tgb%%&tg9%%%%%SfxVarSystemPlatform%%%%:\"%%%%%%T\\%&tg2%\" %&tg6%"
					}
				}
				FIND $%&tg4%=主程序运行前,
				{*
					SET< &fCMD1=%&NL%%&tcmd%
				}!   
				{*
					SET< &eCMD1=%&NL%%&tcmd%
				}
			}
		}
	}
	FORX *NL &fCMD1,&zCMD1, %&zCMD1%
	IFEX $%&C1.Check%=1,
	{
		ENVI &SfxVarCmdLine=%&E1%
		CALL mySED &SfxVarCmdLine \\"
		FIND $[ '%&L5%'='32位/64位自适应' & '%&L3%'<>'%&L4%' ],
		{
			CALL SETEXE3264
			%&sfxWcmd%RunProgram="%&wait%%&hide%x86:\"%&EXE32%\" %&SfxVarCmdLine% %%SfxVarCmdLine0%%"
			%&sfxWcmd%RunProgram="%&wait%%&hide%x64:\"%&EXE64%\" %&SfxVarCmdLine% %%SfxVarCmdLine0%%"
		}!   
		{
			CALL SETEXE
			%&sfxWcmd%RunProgram="%&wait%%&hide%%%%%SfxVarSystemPlatform%%%%:\"%&EXE%\" %&SfxVarCmdLine% %%SfxVarCmdLine0%%"
		}
	}
	FORX *NL &eCMD1,&zCMD2, %&zCMD2%
	%&sfxWcmd%;!@InstallEnd@!
_END

_SUB ProtectMODE
	SIZE &tSIZE=%1
	ENVI &tpr=*17 0x00 %&newSTR% //17字节，用于存放WCS大小信息+5字节标志字符“NEW”
	PUTF* %1,%&tSIZE%,%&tpr% %&sfxPACH%  //17+5+155=177字节   不能用 %&tSIZE%#*，因为#后面的长度优先于PUTF*，会使大于源文件的数据被丢弃
_END

_SUB Check7z
	IFEX $[ '%&L6%'='7z' | %&C2.Check%=1 | ( %&CI.Check%=0 & '%&L6%'='cab' ) | ( %&CI.Check%=0 & %&recoverOLD%=1 ) ],
	{
		IFEX $[ ( %&C2.Check%=0 & %&CT.Check%=0 ) | ( %&C2.Check%=0 & %&CT.Check%=1 & %&CU.Check%=1 ) ],
		{
			CALL extractRES #3%2 AG.tmp
		}!   
		{
			IFEX $[ %&CI.Check%=0 & %&recoverOLD%=1 ], CALL extractRES #3%2 AG.tmp
			ENVI &myfind=IFEX $[ %&::bX64%%1 | '%&L6%'='cab' ],
			%&myfind%
			{
				FILE -force SG.tmp
				FILE -force 7z.dll
				CALL extractRES #1%2 SG.tmp
				CALL extractRES #2%2 7z.dll
			}
			IFEX "%&tmpdir%\7z.dll", FILE 7z.dll->SD.tmp
		}
	}
_END

_SUB buildEXE
	TEAM ENVI &CMD=WRIT command.tmp,$+0,| ENVI &CMD+=%&CMD%-addoverwrite| ENVI &CMD-=%&CMD%-delete
	%&CMD%[FILENAMES]
	%&CMD%Exe=tmp.tmp
	%&CMD%SaveAs=new.tmp
	%&CMD%Log=log.tmp
	%&CMD%[COMMANDS]
	FIND $%&ver%<>,
	{
		FIND $%&LD%=7zSFX, %&CMD-% VERSIONINFO,,
		%&CMD%-add %&ver%,,,
	}
	FIND $%&ico%<>,
	{
		FIND $%&LD%=7zSFX, %&CMD-% ICONGROUP,,
		%&CMD+% %&ico%,ICONGROUP,1,2052
	}
	FIND $%&LD%=7zSFX, %&CMD-% 24,,
	%&CMD+% admin.tmp,24,1,2052
	FIND $%&LD%=PECMD,
	{
		IFEX $%&CS.Visible%=1,
		{
			ENVI &xh=
			ENVI &xh2=
			ENVI &xWCS="%&L1%"
			%&CMD-% INDATA,,
			FEXT &xEXT="%&L1%"
			FILE -force x101.tmp
			ENVI &xCMD=WRIT x101.tmp,$+0,
			%&xCMD%ENVI-env sfxcmd="%%MyName%%"
			%&xCMD%ENVI-env sfxname=%%MyName%%
			FIND $%&xEXT%=wcs, ENVI &xm=! ENVI &xm=-m
			IFEX $%&C4.Check%=1, TEAM ENVI &xh=-hide| ENVI &xh2=*
			IFEX $%&CS.Check%=1,!! TEAM CMPS %&xm% "%&L1%" setup.tmp| IFEX $%&error%=0, ENVI &xWCS=setup.tmp
			IFEX $%&CV.Check%=1,
			{
				CALL SETRunKEY &CV
				%&xCMD%FNAM -ext &runNAME="%%&MyName%%"
				%&xCMD%REGI $%&runKEY%\%%&runNAME%%="%%&MyName%%"
			}
			FIND $%&xEXT%=wcs,
			{*
				ENVI &xh3=
				ENVI &delMEcmd=
				IFEX $%&CB.Check%=1,
				{*
					CALL DelME
					%&xCMD%
					TEAM ENVI &xh3=EXEC -incmd =%&xh2%PECMD | ENVI &delMEcmd=THREAD*$ CALL DelMySelf "del /a /f /q" "%%%%MyName%%%%"
				}
				IFEX $[ %&C4.Check%=1 & %&CB.Check%=0 ], TEAM ENVI &xh3=EXEC -incmd %&xh2%PECMD | 
				%&xCMD%%&xh3%LOAD #102 %&E1% %%*
				%&xCMD%%&delMEcmd%
			}!   
			{*
				%&xCMD%ENVI &xEXE=%%Temp%%\~~%%RanDom%%.tmp.%&xEXT%
				%&xCMD%FILE -force "%%&xEXE%%"
				%&xCMD%PATH @"%%CurDir%%\"
				%&xCMD%EXEC -incmd =PECMD PUTF "%%&xEXE%%",,"%%MyName%%""#102|SCRIPT"
				%&xCMD%SITE "%%&xEXE%%",+H
				FIND $%&xEXT%=reg,
				{
					ENVI &zEXE=EXEC -err+ -hide =reg.exe import "%%%%&xEXE%%%%"
					SET< &zEXE=%&NL%IFEX $%%%%&error%%%%<>0, EXEC -err+ -hide =regedit.exe /s "%%%%&xEXE%%%%"
					%&xCMD%%&zEXE%
				}!   
				{
					FIND $[ %&xEXT%'='cmd' | '%&xEXT%'='bat' ],
					{
						%&xCMD%SET$ &NL=0D 0A
						%&xCMD%ENVI &cmdHEAD=@pushd "%%CurDir%%\" >nul 2>&1
						%&xCMD%READ "%%&xEXE%%",1,&cmdINFO
						%&xCMD%FIND $[ '%%&cmdINFO%%'<>'%%&cmdHEAD%%' & '%%&cmdINFO%%'<>'MZ?' ], WRIT "%%&xEXE%%",$+1,%%&cmdHEAD%%%%&NL%%
					}
					%&xCMD%EXEC %&xh% ="%%&xEXE%%" %&E1% %%*
				}
				%&xCMD%WAIT 500
				%&xCMD%FILE -force "%%&xEXE%%"
				%&xCMD%THREAD*$ CALL DelMySelf "del /a /f /q" "%%&xEXE%%"
				IFEX $%&CB.Check%=1, %&xCMD%THREAD*$ CALL DelMySelf "del /a /f /q" "%%MyName%%"
				CALL DelME
				%&xCMD%
			}
			//WRIT *c *fv x101.tmp,$+0,&xCMD
			CMPS x101.tmp 101.tmp
			%&CMD+% 101.tmp,SCRIPT,101,2052
			%&CMD+% %&xWCS%,SCRIPT,102,2052
		}!   
		{
			%&CMD+% setup.tmp,SCRIPT,101,2052
			IFEX $%&C8.Check%=1,
			{
				FORX *NL &insSCRIPT,&aSCR,
				{
					FIND $%&aSCR%<>,
					{
						MSTR * &bSCR,&cSCR=<1*>&aSCR
						SED -ex &bSCR=0,&,,&bSCR
						ENVI &dSCR=%&bSCR%.%&cSCR%
						^WRIT-UNICODE *c *fv %&dSCR%,$+0,%&bSCR%
						CMPS %&dSCR% %&dSCR%.tmp
						//IFEX $%&error%<>0, FILE %&dSCR%->%&dSCR%.tmp
						%&CMD+% %&dSCR%.tmp,SCRIPT,%&cSCR%,2052
					}
				}
			}
			IFEX $[ '%&L6%'='7z' | %&C2.Check%=1 | %&CI.Check%=0 ],
			{
				%&CMD-% INDATA,,
				IFEX $[ ( %&C2.Check%=0 & %&CT.Check%=0 ) | ( %&C2.Check%=0 & %&CT.Check%=1 & %&CU.Check%=1 ) ],
				{
					CMPS -m AG.tmp AG1.tmp
					%&CMD+% AG1.tmp,SCRIPT,103,2052
				}!   
				{
					CMPS -m SG.tmp SG1.tmp
					CMPS -m SD.tmp SD1.tmp
					%&CMD+% SG1.tmp,SCRIPT,103,2052
					%&CMD+% SD1.tmp,SCRIPT,104,2052
					//FIND $%&L6%=cab,
					//{
					//	MDIR Lang
					//	CALL extractRES %zh-cn% Lang\zh-cn.txt
					//	CALL extractRES %zh-tw% Lang\zh-tw.txt
					//}
					FIND $%&L6%=7z,
					{
						CMPS -m Lang\zh-cn.txt zh-cn.tmp
						CMPS -m Lang\zh-tw.txt zh-tw.tmp
						%&CMD+% zh-cn.tmp,SCRIPT,105,2052
						%&CMD+% zh-tw.tmp,SCRIPT,106,2052
					}
					IFEX $[ %&CI.Check%=0 & %&recoverOLD%=1 ],
					{
						CMPS -m AG.tmp AG1.tmp
						%&CMD+% AG1.tmp,SCRIPT,108,2052
					}
				}
			}
		}
	}
	CALL Fresh
	EXEC -wd:"%&tmpdir%\" -hide -exe:%&ResHacker% =ResHacker_exe -script command.tmp
	CALL Fresh
_END

_SUB exportRES
	IFEX $%&CL.Check%=1,
	{
		%&xCMD%	ENVI &tmpET=%%Temp%%\~%%RanDom%%.tmp
		%&xCMD%	SIZE &hfc="%%&MyName%%"
		%&xCMD%	CALC #&hfd=%%&hfc%%-160
		%&xCMD%	GETF %%&MyName%%,%%&hfd%%#*,&hfe
		%&xCMD%	FIND $%%&hfe%%=%&newSTR% %&sfxPACH%,
		%&xCMD%	{
		%&xCMD%		ENVI &myCMPSsize=
		%&xCMD%		ENVI &mySFXsize=
		%&xCMD%		CALC #&hf1=%%&hfc%%-177
		%&xCMD%		GETF %%&MyName%%,%%&hf1%%#17,&hf2
		%&xCMD%		CODE *ANSI,%%&hf2%%,**UNI,&hf3
		%&xCMD%		MSTR * -delims:# &hf4=<2>&hf3
		%&xCMD%		LPOS* * &hf9=#,2,&hf3
		%&xCMD%		LPOS* * &hfa=#,3,&hf3
		%&xCMD%		CALC #&hfb=%%&hf4%%
		%&xCMD%		IFEX $[ %%&hf4%%>0 & %%&hf4%%<1k & %%&hf9%%>0 & %%&hfa%%=0 & %%&hf4%%=%%&hfb%% ],
		%&xCMD%		{
		%&xCMD%			CALC #&hf5=%%&hf1%%-%%&hf4%%
		%&xCMD%			GETF %%&MyName%%,%%&hf5%%#8,&hfd
		%&xCMD%			FIND $%%&hfd%%=0x00 0x00 0x00 0x00 %&tempCMPa%,
		%&xCMD%			{
		%&xCMD%				GETF %%&MyName%%,%%&hf5%%#%%&hf4%%,&hf6
		%&xCMD%				ENVI &tmpFILE=%%Temp%%\~~%%RanDom%%.tmp
		%&xCMD%				FILE -force "%%&tmpFILE%%"
		%&xCMD%				CALL Fresh
		%&xCMD%				PUTF "%%&tmpFILE%%",,%%&hf6%%
		%&xCMD%				CALL Fresh
		%&xCMD%				PUTF "%%&tmpFILE%%",4#4,%&headCMPa%
		%&xCMD%				CALL Fresh
		%&xCMD%				LOAD -this "%%&tmpFILE%%"
		%&xCMD%				FILE -force "%%&tmpFILE%%"
		%&xCMD%				FIND $[ '%%&mySFXsize%%'<>'' & '%%&myCMPSsize%%'<>'' ],
		%&xCMD%				{
		%&xCMD%					CALC #&hf7=%%&hf5%%-%%&mySFXsize%%
		%&xCMD%					FILE -force "%%&tmpET%%"
		%&xCMD%					CALL Fresh
		%&xCMD%					EXEC -incmd =PECMD PUTF -dd -skipb=%%&hf7%% -len=%%&mySFXsize%% "%%&tmpET%%",,%%&MyName%%
		%&xCMD%					FIND $%%&myCMPSsize%%=CAB, ENVI &hf8=%&cabHEAD%! ENVI &hf8=%&7zHEAD%
		%&xCMD%					CALL Fresh
		%&xCMD%					PUTF "%%&tmpET%%",0#8,%%&hf8%%
		%&xCMD%					CALL Fresh
		%&xCMD%					SITE "%%&tmpET%%",+H
		%&xCMD%				}
		%&xCMD%			}
		%&xCMD%		}
		%&xCMD%	}
		%&xCMD%	IFEX "%%&tmpET%%",! KILL *force *tree *%%&__PID%%
	}!   
	{
		%&xCMD%	ENVI &tmpET=%%&MyName%%
	}
_END

_SUB DoForPath
	IFEX $%&CK.Check%=1, %&xCMD%	FILE -force "%%&Dir%%"
	%&xCMD%	MDIR %%&Dir%%
	%&xCMD%	CALL Fresh
	IFEX $[ %&CE.Check%=1 | %&CF.Check%=1 ], %&xCMD%	SITE "%%&Dir%%",+H
	%&xCMD%	CALL Fresh
_END

_SUB export7Z
	%&xCMD%	ENVI &tmpRT=%%Temp%%\~%%RanDom%%~
	%&xCMD%	FILE -force "%%&tmpRT%%"
	%&xCMD%	MDIR %%&tmpRT%%
	%&xCMD%	SITE "%%&tmpRT%%",+H
	IFEX $[ ( %&C2.Check%=0 & %&CT.Check%=0 ) | ( %&C2.Check%=0 & %&CT.Check%=1 & %&CU.Check%=1 ) ],
	{
		//%&xCMD%	ENVI &hide7z=-hide
		%&xCMD%	PUTF "%%&tmpRT%%\sg.tmp",,"%%MyName%%""#103|SCRIPT"
	}!   
	{
		//%&xCMD%	ENVI &hide7z=
		%&xCMD%	PUTF "%%&tmpRT%%\sg.tmp",,"%%MyName%%""#103|SCRIPT"
		%&xCMD%	PUTF "%%&tmpRT%%\7z.dll",,"%%MyName%%""#104|SCRIPT"
		%&xCMD%	MDIR %%&tmpRT%%\Lang
		%&xCMD%	PUTF "%%&tmpRT%%\Lang\zh-cn.txt",,"%%MyName%%""#105|SCRIPT"
		%&xCMD%	PUTF "%%&tmpRT%%\Lang\zh-tw.txt",,"%%MyName%%""#106|SCRIPT"
	}
	%&xCMD%	CALL Fresh
_END

_SUB delOLDfile *
	IFEX $[ %&CI.Check%=0 & %&recoverOLD%=1 ],
	{*
		ENVI &forceRecover=a
		%&xCMD%	ENVI &includeCMD=
		%&xCMD%	IFEX $%%&exitCODE%%=0,
		%&xCMD%	{*
		%&xCMD%		ENVI &fileLIST=
		%&xCMD%		ENVI &listCODE=0
		%&xCMD%		SIZE &DirSIZE="%%&Dir%%"
		%&xCMD%		IFEX [ ( "%%&Dir%%\" ) & $%%&DirSIZE%%>0 ],
		%&xCMD%		{*
		%&xCMD%			ENVI &listCODE=1
		%&xCMD%			GETF "%%MyName%%""#108|SCRIPT",0#1,&tmpZZ
		%&xCMD%			FIND $%%&tmpZZ%%<>,
		%&xCMD%			{*
		%&xCMD%				ENVI &tmpXZ="%%&tmpRT%%\sg2.tmp"
		%&xCMD%				FILE -force %%&tmpXZ%%
		%&xCMD%				PUTF %%&tmpXZ%%,,"%%MyName%%""#108|SCRIPT"
		%&xCMD%			}!   
		%&xCMD%			{*
		%&xCMD%				ENVI &tmpXZ="%%&tmpRT%%\sg.tmp"
		%&xCMD%			}
		%&xCMD%			IFEX $%%&exitCODE%%=1, EXIT -
		%&xCMD%			EXEC*- -wd:"%%&tmpRT%%\" -err+ -hide -exe:%%&tmpXZ%% &tmpWZ=7zG_exe l "%%&tmpET%%"  //2017-07-17 10:36:48 ....A           25      1370375  Bandicam Portable\App\Bandicam\bandicam.ini
		%&xCMD%			ENVI &error2=%%&error%%
		%&xCMD%			IFEX $%%&error2%%<>0, EXIT -
		%&xCMD%			ENVI &aPOS=------------------- ----- ------------ ------------  ------------------------
		%&xCMD%			LPOS* * ,&bPOS=%%&aPOS%%,1,&tmpWZ
		%&xCMD%			RPOS* * ,&cPOS=%%&aPOS%%,1,&tmpWZ
		%&xCMD%			CALC #&dPOS=%%&cPOS%%-%%&bPOS%%-1
		%&xCMD%			CALC #&ePOS=%%&bPOS%%+1
		%&xCMD%			READ -*,%%&ePOS%%+%%&dPOS%%,&fPOS,&tmpWZ
		%&xCMD%			FORX *NL &fPOS,&gPOS,
		%&xCMD%			{*
		%&xCMD%				IFEX $%%&exitCODE%%=1, EXIT
		%&xCMD%				MSTR * &hPOS,&iPOS,&jPOS,&kPOS=<1*>&gPOS
		%&xCMD%				MSTR * &mPOS=54,0,&gPOS
		%&xCMD%				MSTR * &lPOS=1,1,&jPOS
		%&xCMD%				IFEX $[ '%%&lPOS%%'<>'D' & %%&kPOS%%>0 ],
		%&xCMD%				{*
		%&xCMD%					IFEX "%%&Dir%%\%%&mPOS%%",
		%&xCMD%					{*
		%&xCMD%						SITE ?-local ,&nPOS,=FTIME,"%%&Dir%%\%%&mPOS%%"   //2017 07 27 22 01 45 424 4
		%&xCMD%						MSTR * &oPOS,&pPOS,&qPOS,&rPOS,&sPOS,&tPOS=<1*>&nPOS
		%&xCMD%						SED &uPOS=0,[^0-9],,%%&hPOS%%%%&iPOS%%
		%&xCMD%						IFEX $%%&uPOS%%>%%&oPOS%%%%&pPOS%%%%&qPOS%%%%&rPOS%%%%&sPOS%%%%&tPOS%%, SET< &fileLIST=%%&mPOS%%%%&NL%%  //TEAM SITE "%%&Dir%%\%%&mPOS%%",-H-R-S-A| FILE -force "%%&Dir%%\%%&mPOS%%"
		%&xCMD%					}!   
		%&xCMD%					{*
		%&xCMD%						SET< &fileLIST=%%&mPOS%%%%&NL%%
		%&xCMD%					}
		%&xCMD%				}
		%&xCMD%			}
		%&xCMD%		}
		%&xCMD%		IFEX $%%&exitCODE%%=1, EXIT -
		%&xCMD%		FIND $%%&fileLIST%%<>,
		%&xCMD%		{*
		%&xCMD%			ENVI &includeLIST="%%&tmpRT%%\~includeLIST~.tmp"
		%&xCMD%			^WRIT *c *fv %%&includeLIST%%,$+0,&fileLIST
		%&xCMD%			ENVI &includeCMD=-scsWIN -ir-@%%&includeLIST%%
		%&xCMD%		}
		//%&xCMD%		EXEC%&get7Zmsg% -wd:"%%&tmpRT%%\" -err+ -hide -pid:&sgPID -exe:"%%&tmpRT%%\sg.tmp" =7zG_exe x "%%&tmpET%%" -y -aoa -o"%%&Dir%%" %%&includeCMD%% %&pwdCMD%
		//%&xCMD%		ENVI &error2=%%&error%%
		//%&xCMD%		IFEX $[ %%&error2%%=0 & %%&exitCODE%%=0 & %%&listCODE%%=1 ], EXEC -wd:"%%&tmpRT%%\" -err+ -hide -exe:%%&tmpXZ%% &tmpWZ=7zG_exe x "%%&tmpET%%" -y -aos -o"%%&Dir%%" %&pwdCMD%
		%&xCMD%	}
	}
_END

_SUB DelME
	%&xCMD%
	%&xCMD%_SUB DelMySelf
	%&xCMD%	ENVI &cmdFILE="%%Temp%%\~%%RanDom%%.cmd"
	%&xCMD%	FILE -force %%&cmdFILE%%
	//%&xCMD%	EXEC -hide =cmd.exe /c echo %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a %%%%%%%%a >%%&cmdFILE%%
	//%&xCMD%	WRIT %%&cmdFILE%%,$+0,cls
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,@echo off
	//%&xCMD%	WRIT %%&cmdFILE%%,$+0,ping -n 2 127.0.0.1 >nul 2>&1
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,set num=1
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,:LOOP
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,if not exist %%2 goto :END
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,%%~1 %%2 >nul 2>&1
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,if exist %%2 ping -n 2 127.0.0.1 >nul 2>&1
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,if %%%%num%%%% gtr 3 goto :END
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,set /a num+=1
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,goto LOOP
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,:END
	//%&xCMD%	WRIT %%&cmdFILE%%,$+0,%%~1 %%2 >nul 2>&1 & if exist %%2 goto :END
	%&xCMD%	WRIT %%&cmdFILE%%,$+0,del /a /f /q "%%~f0" >nul 2>&1
	//%&xCMD%	EXEC -hide =cmd.exe /c echo.>>%%&cmdFILE%%
	%&xCMD%	CALL Fresh
	%&xCMD%	SITE %%&cmdFILE%%,+H
	%&xCMD%	CALL Fresh
	//%&xCMD%	EXEC -incmd PECMD EXEC -wd:%%SystemDrive%% -IDLE --hide cmd /c %%&cmdFILE%%
	%&xCMD%	EXEC* -timeout:500 -incmd =pecmd EXEC -wd:%%SystemDrive%% -hide cmd /c %%&cmdFILE%%
	%&xCMD%_END
	%&xCMD%
	%&xCMD%_SUB Fresh
	//%&xCMD%	ENVI @@DeskTopFresh=1
	%&xCMD%_END
	%&xCMD%
_END

_SUB buildWCS
	ENVI &hide=
	ENVI &wait=
	ENVI &hide2=
	ENVI &myWAIT=
	ENVI &forceWAIT=
	ENVI &SuperWAIT=
	IFEX $%&C4.Check%=1, TEAM ENVI &hide=-hide| ENVI &hide2=*
	IFEX $%&CC.Check%=0, TEAM ENVI &myWAIT=-wait| ENVI &wait==
	IFEX $%&CN.Check%=1,
	{*
		IFEX $%&vordSUPER%=1, ENVI &SuperWAIT=* -cmd::1:getSuperPid
		ENVI &forceWAIT=-pid:&pidc
	}
	ENVI &xCMD=WRIT-UNICODE wcs.tmp,$+0,
	FILE -force wcs.tmp
	%&xCMD%#code=936T950
	%&xCMD%LOGS
	//%&xCMD%LOGS **t=1 **ON=1 **2 * "C:\XXX.LOG"
	%&xCMD%ENVI ?&adminMODE=ISADMIN
	%&xCMD%IFEX $%%&adminMODE%%<>1, TEAM MESS+icon6 \n\n请以管理员身份运行！ @错误#OK*5000| EXIT
	%&xCMD%ENVI^ EnviMode=1
	%&xCMD%ENVI^ ForceLocal=1
	%&xCMD%SET$ &NL=0d 0a
	%&xCMD%ENVI ?&WinVer=WinVer
	%&xCMD%IFEX $[ %%&::bX64%%=1 & %%&WinVer%%>=0xA00000000 ],
	%&xCMD%{
	%&xCMD%	ENVI &CLSID=CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder\Attributes
	%&xCMD%	ENVI &Ates=2690646016
	%&xCMD%	ENVI &regCMD=REGI #HKCR\%%&CLSID%%,&Attributes
	%&xCMD%	%%&regCMD%%
	%&xCMD%	IFEX $%%&Attributes%%=%%&Ates%%,
	%&xCMD%	{
	%&xCMD%		ENVI &regCMD=REGI #HKCR\WOW6432Node\%%&CLSID%%,&Attributes
	%&xCMD%		%%&regCMD%%
	%&xCMD%		IFEX $%%&Attributes%%<>%%&Ates%%,
	%&xCMD%		{
	%&xCMD%			ENVI &regCMD=REGI #HKCR\WOW6432Node\%%&CLSID%%=%%&Ates%%
	%&xCMD%			%%&regCMD%%
	%&xCMD%		}
	%&xCMD%	}
	%&xCMD%}
	%&xCMD%ENVI-env sfxcmd="%%MyName%%"
	%&xCMD%ENVI-env sfxname=%%MyName%%
	IFEX $%&CD.Check%=0,
	{
		TEAM ENVI &myEXEname1=| &myEXEname2=
		FNAM-ext &myEXEname1=%&L3%
		FNAM-ext &myEXEname2=%&L4%
		FIND $%&myEXEname1%<>,
		{
			%&xCMD%LOCK --try  #%&myEXEname1%_Init_exe,&myEXITcode1
			%&xCMD%IFEX $%%&myEXITcode1%%<>0, EXIT
		}
		FIND $%&myEXEname2%<>,
		{
			%&xCMD%LOCK --try  #%&myEXEname2%_Init_exe,&myEXITcode2
			%&xCMD%IFEX $%%&myEXITcode2%%<>0, EXIT
		}
	}
	%&xCMD%EXEC* -hide &varSTR=cmd.exe /c set
	%&xCMD%FORX *NL &varSTR,&oneSTR,
	%&xCMD%{*
	%&xCMD%	MSTR * -delims:= &var1,&var2=<1><2->&oneSTR
	%&xCMD%	ENVI %%&var1%%=%%&var2%%
	%&xCMD%}
	%&xCMD%FIND $%%ProgramFiles(x86)%%=,       ENVI ProgramFiles(x86)=%%ProgramFiles%%
	%&xCMD%FIND $%%CommonProgramFiles(x86)%%=, ENVI CommonProgramFiles(x86)=%%CommonProgramFiles%%
	%&xCMD%FIND $%%ProgramW6432%%=,            ENVI ProgramW6432=%%ProgramFiles%%
	%&xCMD%FIND $%%CommonProgramW6432%%=,      ENVI CommonProgramW6432=%%CommonProgramFiles%%
	%&xCMD%FIND $%%^UserName%%=,
	%&xCMD%{*
	%&xCMD%	REGI --av HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders\\,&DataList
	%&xCMD%	FORX *NL &DataList,&Dataname,
	%&xCMD%	{*
	%&xCMD%		REGI ~HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders\\%%&Dataname%%,&Datavalue
	%&xCMD%		SED &Datavalue=1:0,%%,%%^,%%&Datavalue%%
	%&xCMD%		FIND $%%&Dataname%%=Common AppData,    ^ENVI AppData=%%&Datavalue%%
	%&xCMD%		FIND $%%&Dataname%%=Common Desktop,    ^ENVI Desktop=%%&Datavalue%%
	%&xCMD%		FIND $%%&Dataname%%=Common Documents,  ^ENVI Personal=%%&Datavalue%%
	%&xCMD%		FIND $%%&Dataname%%=Common Programs,   ^ENVI Programs=%%&Datavalue%%
	%&xCMD%		FIND $%%&Dataname%%=Common Start Menu, ^ENVI StartMenu=%%&Datavalue%%
	%&xCMD%		FIND $%%&Dataname%%=Common Startup,    ^ENVI Startup=%%&Datavalue%%
	%&xCMD%	}
	%&xCMD%}
	IFEX $%&CQ.Check%=1,
	{
		%&xCMD%THREAD+& -wait CALL setENV
		%&xCMD%
		%&xCMD%_SUB setENV
		FORX *NL &tablJMSG%&L1.isel%,&tmpENV,
		{
			MSTR* * &env1,&env2=<1*>&tmpENV
			%&xCMD%	ENVI-env %&env1%=%&env2%
		}
		%&xCMD%_END
		%&xCMD%
	}
	%&xCMD%FIND $%%&::bX64%%=0,
	%&xCMD%{*
	FIND $%&L5%=64位, %&xCMD%	ENVI &EXE=%&L4%! %&xCMD%	ENVI &EXE=%&L3%
	%&xCMD%}!    
	%&xCMD%{*
	FIND $%&L5%=32位, %&xCMD%	ENVI &EXE=%&L3%! %&xCMD%	ENVI &EXE=%&L4%
	%&xCMD%}
	IFEX $%&C7.Check%=0,
	{
		//IFEX $%&CI.Check%=0,
		//{
		//	%&xCMD%FNAM &myTMPDir=%%&EXE%%
		//	%&xCMD%FIND $%%&myTMPDir%%=, ENVI &myTMPDir=~%%RanDom%%
		//	%&xCMD%ENVI &Dir=%%Temp%%\%%&myTMPDir%%
		//}!   
		//{
			%&xCMD%ENVI &Dir=%%Temp%%\~%%RanDom%%
		//}
	}!   
	{
		^ENVI &pecmdEXTPATH=%%&extractPATH%&L1.isel%%%
		SED *ni &pecmdEXTPATH=0:0**,%%S,%CurDir%,%&pecmdEXTPATH%
		SED *ni &pecmdEXTPATH=0:0**,%UserDesktop%,%Desktop%,%&pecmdEXTPATH%
		SED *ni &pecmdEXTPATH=0:0**,%MyDocuments%,%Personal%,%&pecmdEXTPATH%
		MSTR * -delims:\ &path1,&path2=<1><2->&pecmdEXTPATH
		FIND $%&path2%<>, ENVI &path2x=\%&path2%! ENVI &path2x=
		FIND $%&path1%=解压前手动选择,
		{
			SED &path2=0,%,%%%%,%&path2%
			SED &path2x=0,%,%%%%,%&path2x%
			%&xCMD%CALL @WIN1
			%&xCMD%
			%&xCMD%_SUB WIN1,W299H138,解压,CALL WIN3,%%MyName%%,,, -scalef -scale  //-discloseb
			%&xCMD%	ENVI &savePATHcode=0
			%&xCMD%	LABE ,L13T10W77H23,选择路径：,,
			%&xCMD%	ITEM-def ,L53T69W88H26,确定,TEAM ENVI &savePATHcode=1| KILL \,
			%&xCMD%	ITEM ,L152T69W88H26,取消,KILL \,
			%&xCMD%	EDIT+ -3D &path3,L13T34W243H22,%&path2%,,
			%&xCMD%	IMAG ,L262T36W18H18,shell32.dll#3,CALL WIN2,,
			%&xCMD%	GROU ,L258T27W26H30,,
			%&xCMD%_END
			%&xCMD%
			%&xCMD%_SUB WIN2
			%&xCMD%	FIND $%%&path3%%=, ENVI &path5=%%Temp%%! ENVI &path5=%%&path3%%
			%&xCMD%	BROW &path4,*%%&path5%%,请指定解压目录,,0x10000000
			%&xCMD%	FIND $%%&path4%%<>, TEAM SED *ni &path3x=0:0**,\\\\,\\,%%&path4%%%&path2x%| ENVI @&path3=%%&path3x%%
			%&xCMD%_END
			%&xCMD%
			%&xCMD%_SUB WIN3 *
			%&xCMD%	IFEX $%%&savePATHcode%%=1, ENVI-ret &path3=%%&path3%%! KILL *force *tree *%%&__PID%%
			%&xCMD%_END
			%&xCMD%
			%&xCMD%FDIR --fullfile &path3=%%&path3%%
			%&xCMD%SED &path3=0,[\/\*\?\"\<\>\|],,%%&path3%%
			%&xCMD%SED &path3=0,%&TAB%, ,%%&path3%%
			%&xCMD%SED &path3=0:1,:,,%%&path3%%
			%&xCMD%SED &path3=0,  *\\,\\,%%&path3%%
			%&xCMD%SED &path3=0,^[\\],,%%&path3%%
			%&xCMD%SED &path3=1,\\$,,%%&path3%%
			%&xCMD%FDIR --fullfile &Dir=%%&path3%%
			%&xCMD%FIND $%%&Dir%%=, ENVI &Dir=%%Temp%%\~%%RanDom%%
		}!   
		{
			%&xCMD%MSTR -delims:\ &path1,&path2=<1><2->%&pecmdEXTPATH%
			%&xCMD%^FIND $%%&path1%%=,
			%&xCMD%{*
			%&xCMD%	ENVI &Dir=%%Temp%%\%%&path2%%
			%&xCMD%}!   
			%&xCMD%{*
			%&xCMD%	IFEX %%&path1%%, ENVI &Dir=%%&path1%%\%%&path2%%! ENVI &Dir=%%Temp%%\%%&path2%%
			%&xCMD%}
		}
	}
	//%&xCMD%TIPS -dummy R*-20B*-20
	//%&xCMD%TIPS 提示：,正在启动程序，请稍等...,1000000000,1,
	//%&xCMD%TIPS 提示：,正在启动程序，请稍等...,1000000000,1,
	//%&xCMD%TIPS -dummy
	CALL DelSUB
	IFEX $[ %&CA.Check%=1 | %&CB.Check%=1 ], CALL DelME
	IFEX $[ '%&L6%'='7z' | %&C2.Check%=1 | %&CI.Check%=0 ],
	{
		IFEX $[ %&C2.Check%=0 & %&CT.Check%=1 & %&CU.Check%=1 ],
		{*
			ENVI &get7Zmsg=
		}!
		{*
			ENVI &get7Zmsg=*- -cmd::100:WIN5
			%&xCMD%
			%&xCMD%_SUB WIN5
			%&xCMD%	IFEX $%%&exitCODE%%=1, EXIT
			%&xCMD%	FIND --forpid:%%&sgPID%% --class:#32770 --wid*@ &sgWID,
			%&xCMD%	MSTR * &sgBar=<8>&sgWID
			%&xCMD%	RSTR * &bar1=1,&sgBar
			%&xCMD%	FIND $%%&bar1%%=%%,
			%&xCMD%	{
			%&xCMD%		MSTR * &bar2=-2,0,&sgBar
			%&xCMD%		ENVI @&PBAR1=%%&bar2%%;%%&sgBar%%
			%&xCMD%		ENVI @this=正在解压  %%&sgBar%%
			%&xCMD%		FIND $%%&bar2%%=100,
			%&xCMD%		{
			%&xCMD%			FIND --forpid:%%&sgPID%% --class:#32770 --wid* &sgWID2,
			%&xCMD%			FIND --forpid:%%&sgPID%% --wid*@%%&sgWID2%% &sgWID3,
			%&xCMD%			LPOS* * &sgPOS=(&C),1,&sgWID3
			%&xCMD%			IFEX $%%&sgPOS%%>0, ENVI @@POSTMSG=%%&sgWID2%%;0x0010;0;0
			%&xCMD%		}
			%&xCMD%	}
			%&xCMD%_END
			%&xCMD%
		}
		%&xCMD%ENVI &exitCODE=0
		IFEX $%&C2.Check%=1,
		{
			IFEX $%&vordCANCEL%=1, TEAM CALL killCHILD| ENVI &win4H=106! ENVI &win4H=81
			%&xCMD%CALL @WIN4
			%&xCMD%
			%&xCMD%_SUB WIN4,W298H%&win4H%,正在解压  0%%%%,,%%MyName%%,,, -scalef -scale -discloseb -disminb
			%&xCMD%	ENVI @@style=%%__WinID%%:*0x40000:0x80
			IFEX $%&vordCANCEL%=1,
			{
				%&xCMD%	ITEM-def &ITEM1,L113T40W65H25,取消,TEAM ENVI @this.Visible=0| ENVI @&exitCODE=1| CALL KillMe,
				%&xCMD%	ENVI @&ITEM1.Cursor=32649
				%&xCMD%	EDIT &exitCODE,L1T1W1H1,0,,0x18
			}
			%&xCMD%	PBAR &PBAR1,L16T13W259H20,
			%&xCMD%	ENVI @&PBAR1.color=0xFFFFFF
			%&xCMD%	ENVI @&PBAR1=0;0%%%%
			%&xCMD%	ENVI @this.Visible=1
			%&xCMD%	WAIT 0.9
			%&xCMD%	THREAD* CALL extractFILE
			%&xCMD%_END
		}!   
		{
			%&xCMD%CALL extractFILE
		}
		%&xCMD%
		%&xCMD%_SUB extractFILE
		CALL exportRES
		CALL export7Z
		CALL DoForPath
		//-aoa 直接覆盖现有文件，而没有任何提示。 
		//-aos 跳过现有文件，其不会被覆盖。 
		//-aou 如果相同文件名的文件以存在，将自动重命名被释放的文件。举个例子，文件 file.txt 将被自动重命名为 file_1.txt。 
		//-aot 如果相同文件名的文件以存在，将自动重命名现有的文件。举个例子，文件 file.txt 将被自动重命名为 file_1.txt。 
		IFEX $%&CI.Check%=1, ENVI &forceRecover=a! ENVI &forceRecover=s
		IFEX $[ %&CT.Check%=1 & %&CU.Check%=1 & '%&7zPWD%'<>'' ], ENVI &pwdCMD=-p%&7zPWD%! ENVI &pwdCMD=
		%&xCMD%	ENVI &error2=0
		CALL delOLDfile
		%&xCMD%	IFEX $%%&error2%%=0,
		%&xCMD%	{*
		//%&xCMD%	EXEC -wd:"%%&tmpRT%%\" %%&hide7z%% -exe:"%%&tmpRT%%\sg.tmp" =7zG_exe x "%%&tmpET%%" -y -ao%&forceRecover% -o"%%&Dir%%"
		%&xCMD%		EXEC%&get7Zmsg% -wd:"%%&tmpRT%%\" -err+ -hide -pid:&sgPID -exe:"%%&tmpRT%%\sg.tmp" =7zG_exe x "%%&tmpET%%" -y -ao%&forceRecover% -o"%%&Dir%%" %%&includeCMD%% %&pwdCMD%
		%&xCMD%		ENVI &error2=%%&error%%
		%&xCMD%	}
		%&xCMD%	FILE -force "%%&tmpRT%%"
		IFEX $%&CL.Check%=1, %&xCMD%	FILE -force "%%&tmpET%%"
		%&xCMD%	IFEX $%%&error2%%=2, MESS+icon6 %%&NL%%%%&NL%%解压失败！压缩包损坏，或输入了无效密码（不能有特殊字符和空格）！ @错误#OK*5000
		%&xCMD%	IFEX $%%&error2%%=7, MESS+icon6 %%&NL%%%%&NL%%命令行错误！ @错误#OK*5000
		%&xCMD%	IFEX $%%&error2%%=8, MESS+icon6 %%&NL%%%%&NL%%没有足够的内存！ @错误#OK*5000
		%&xCMD%	IFEX $%%&error2%%<>0, TEAM CALL DelSUB| KILL *force *tree *%%&__PID%%
		IFEX $%&C2.Check%=1, %&xCMD%	KILL \
		%&xCMD%_END
		%&xCMD%
	}!   
	{
		//%&::bX64%=0, PECMD32+Win32  //%&::bX64%=1, PECMD32+WIN64  //%&::bX64%=3, PECMD64+WIN64
		//%&xCMD%FIND $%%&::bX64%%=1, ENVI &mySYSroot=SysWOW64! ENVI &mySYSroot=System32
		//%&xCMD%IFEX "%%WinDir%%\%%&mySYSroot%%\cabinet.dll",! PUTF "%%WinDir%%\%%&mySYSroot%%\cabinet.dll",,"%%MyName%%""#103|SCRIPT"
		CALL exportRES
		IFEX $%&CL.Check%=0,
		{
			%&xCMD%ENVI &tmpET=%%Temp%%\~%%RanDom%%.tmp
			%&xCMD%FILE -force "%%&tmpET%%"
			%&xCMD%STRL &hx1=%&sfxENDstr%
			%&xCMD%CODE *,%&sfxENDstr%,**-ANSI,&hx2
			%&xCMD%GETF -find %%&MyName%%,0#*#%%&hx1%%#0#1#0,&hx3,*&hx2
			%&xCMD%IFEX $%%&hx3%%>0,
			%&xCMD%{
			%&xCMD%	CALC #&hx4=%%&hx3%%+%%&hx1%%
			%&xCMD%	EXEC -incmd =PECMD PUTF -dd -skipb=%%&hx4%% "%%&tmpET%%",,%%&MyName%%
			%&xCMD%}
			%&xCMD%IFEX "%%&tmpET%%",! EXIT FILE
		}
		CALL DoForPath
		%&xCMD%DEVI *extract %%&tmpET%%,,%%&Dir%%
		%&xCMD%FILE -force "%%&tmpET%%"
	}
	%&xCMD%CALL Fresh
	%&xCMD%PATH @"%%&Dir%%"
	IFEX $%&C9.Check%=1,
	{
		ENVI &myCMDstr=!
		FORX *NL &tablBMSG%&L1.isel%,&oneTABL,
		{*
			MSTR* * &aMSG,&bMSG,&cMSG,&dMSG,&eMSG,&fMSG,&gMSG,&hMSG,&iMSG,&jMSG=<1*>&oneTABL
			FIND $%&eMSG%<>,
			{*
				IFEX "%&L1%\%&eMSG%",
				{*
					ENVI &argCMD=
					FIND $%&aMSG%=最小化窗口, ENVI &argCMD=_
					FIND $%&aMSG%=最大化窗口, ENVI &argCMD=^
					FIND $%&aMSG%=隐藏启动, ENVI &argCMD=%&myCMDstr%
					ENVI &linkPATH=
					FIND $%&bMSG%=桌面, ENVI &linkPATH=%%Desktop%%
					FIND $%&bMSG%=开始菜单, ENVI &linkPATH=%%StartMenu%%
					FIND $%&bMSG%=开始程序菜单, ENVI &linkPATH=%%Programs%%
					FIND $%&bMSG%=开始菜单启动项, ENVI &linkPATH=%%Startup%%
					FIND $%&bMSG%=我的文档, ENVI &linkPATH=%%Personal%%
					FIND $%&bMSG%=发送到目录, ENVI &linkPATH=%%SendTo%%
					FIND $%&bMSG%=锁定到任务栏, ENVI &linkPATH=%%Temp%%\~%RanDom%~
					ENVI &workPATH=
					FIND $%&jMSG%<>,
					{*
						FIND $[ '%&jMSG%'='%%SystemDrive%%\' | '%&jMSG%'='%%WinDir%%\' | '%&jMSG%'='%%Temp%%\' | '%&jMSG%'='%%ProgramFiles%%\' | '%&jMSG%'='%%ProgramFiles(x86)%%\' ],
						{*
							ENVI &workPATH=%&jMSG%
						}!    
						{*
							ENVI &workPATH=%%&Dir%%\%&jMSG%
						}
					}
					ENVI &icoNUM=
					FIND $%&hMSG%<>, ENVI &icoNUM=#%&hMSG%
					ENVI &icoFILE=
					FIND $[ '%&gMSG%'='shell32.dll' | '%&gMSG%'='imageres.dll' | '%&gMSG%'='explorer.exe' ],
					{*
						ENVI &icoFILE=%&gMSG%
					}!    
					{*
						FIND $%&gMSG%<>,
						{*
							ENVI &icoFILE=%%&Dir%%\%&gMSG%
						}!   
						{*
							ENVI &icoNUM=
						}
					}
					FIND $%&dMSG%=, FNAM &linkNAME=%&eMSG%! ENVI &linkNAME=%&dMSG%
					SED &cMSG=0,^[\\],,%&cMSG%
					SED &cMSG=1,\\$,,%&cMSG%
					FIND $%&cMSG%<>,!! ENVI< &linkPATH=\%&cMSG%
					FIND $%&bMSG%=锁定到任务栏, %&xCMD%TEAM FILE -force "%&linkPATH%"| PUTF -dd -len=0  "%%Temp%%\explorer.exe",0,zero
					%&xCMD%LINK %&argCMD%%&linkPATH%\%&linkNAME%,%%&Dir%%\%&eMSG%,%&fMSG%,%&icoFILE%%&icoNUM%,%&iMSG%,%&workPATH%,
					//FIND $%&bMSG%=锁定到任务栏,!! %&xCMD%TEAM IFEX "%%QuickLaunch%%\User Pinned\TaskBar\%&linkNAME%.LNK", FILE -force "%&linkPATH%"! TEAM PINT %&linkPATH%\%&linkNAME%.LNK,TaskBand|| FILE -force "%&linkPATH%"| FILE -force "%%Temp%%\explorer.exe"
					//"%Temp%\Explorer.exe" PINT -dir -base: "D:\a.exe" %Temp%\~%RanDom%~\exeinfope.LNK,TaskBand  //D:\a.exe为单文件路径，exeinfope.LNK为释放后路径
					FIND $%&bMSG%=锁定到任务栏,!! %&xCMD%TEAM IFEX "%%QuickLaunch%%\User Pinned\TaskBar\%&linkNAME%.LNK",! PINT %&linkPATH%\%&linkNAME%.LNK,TaskBand| FILE -force "%&linkPATH%"| FILE -force "%%Temp%%\explorer.exe"
				}
			}
		}
	}
	IFEX $%&CV.Check%=1,
	{
		CALL SETRunKEY &CV
		%&xCMD%FNAM -ext &runNAME="%%&MyName%%"
		%&xCMD%REGI $%&runKEY%\%%&runNAME%%="%%&MyName%%"
	}
	IFEX $%&CW.Check%=1,
	{
		CALL SETRunKEY &CW
		%&xCMD%FNAM -ext &runNAME="%%&Dir%%\%%&EXE%%"
		%&xCMD%REGI $%&runKEY%\%%&runNAME%%="%%&Dir%%\%%&EXE%%"
	}
	IFEX $%&CF.Check%=1,
	{
		ENVI &expLIST=%%&NL%%
		FORX *NL &tablDMSG%&L1.isel%,&oneMSG, ENVI &expLIST=%&expLIST%%%&Dir%%\%&oneMSG%%%&NL%%
		%&xCMD%ENVI &expLIST=%&expLIST%
		%&xCMD%FORX /S $%%&Dir%%\*,&tmpf,,
		%&xCMD%{
		%&xCMD%	LPOS* * &aPOS=%%&NL%%%%&tmpf%%%%&NL%%,1,&expLIST
		%&xCMD%	IFEX $%%&aPOS%%=0, SITE "%%&tmpf%%",+H
		%&xCMD%}
		%&xCMD%CALL Fresh
	}
	%&xCMD%ENVI &cmdHEAD=@pushd "%%~dp0" >nul 2>&1
	ENVI &FCMD=
	ENVI &ECMD=
	ENVI-ret &insSCRIPT=
	IFEX $%&C8.Check%=1,
	{*
		ENVI &numSCRIPT=111
		FORX *NL &tablAMSG%&L1.isel%,&tg1,
		{*
			FIND $%&tg1%<>,
			{*
				ENVI &tcmd=
				MSTR* * &tg2,&tg3,&tg4,&tg5,&tg6=<1*>&tg1
				FEXT &tg8=%&tg2%
				IFEX [ ( ! %&L1%\%&tg2% ) & '%&tg8%'<>'' ], EXIT -
				FIND $[ '%&tg5%'='等待结束' | '%&tg5%'='等待所有子进程' ], TEAM ENVI &tg9=-wait| ENVI &tg7==! TEAM ENVI &tg9=| ENVI &tg7=
				FIND $%&tg8%=reg,
				{*
					FIND $%&tg3%=是,
					{*
						ENVI &tcmd=EXEC -err+ -hide %&tg7%reg.exe import "%%%%&Dir%%%%\%&tg2%"
						SET< &tcmd=%&NL%IFEX $%%%%&error%%%%<>0, EXEC -err+ -hide %&tg7%regedit.exe /s "%%%%&Dir%%%%\%&tg2%"
					}!   
					{*
						ENVI &tcmd=EXEC -err+ %&tg7%regedit.exe "%%%%&Dir%%%%\%&tg2%"
						SET< &tcmd=%&NL%IFEX $%%%%&error%%%%<>0, EXEC -err+ -hide %&tg7%reg.exe import "%%%%&Dir%%%%\%&tg2%"
					}
				}!   
				{*
					FIND $%&tg8%=wcs,
					{*
						//ENVI &tcmd=THREAD* %&tg9% TEAM ENVI^ EnviMode=0| ENVI^ ForceLocal=0| LOAD "%%%%&Dir%%%%\%&tg2%" %&tg6%| LOGS
						ENVI &tcmd=EXEC -incmd %&tg7%PECMD TEAM LOAD "%%%%&Dir%%%%\%&tg2%" %&tg6%| LOGS
					}!   
					{*
						FIND $%&tg8%=,
						{*
							FIND $%&tg3%=是, ENVI &tga=*! ENVI &tga=
							SET-ret< &insSCRIPT=&%&tg2%_%&L1.isel%  %&numSCRIPT%%&NL%
							ENVI &tcmd=EXEC -incmd %&tg7%%&tga%PECMD TEAM LOAD #%&numSCRIPT% %&tg6%| LOGS
							CALC #&numSCRIPT=%&numSCRIPT%+1
						}!   
						{*
							FIND $[ '%&tg8%'='cmd' | '%&tg8%'='bat' ],
							{
								%&xCMD%READ "%%&Dir%%\%&tg2%",1,&cmdINFO
								%&xCMD%FIND $[ '%%&cmdINFO%%'<>'%%&cmdHEAD%%' & '%%&cmdINFO%%'<>'MZ?' ], WRIT "%%&Dir%%\%&tg2%",$+1,%%&cmdHEAD%%%%&NL%%
							}
							FIND $%&tg3%=是, ENVI &tga=-hide! ENVI &tga=
							ENVI &tcmd=EXEC %&tga% %&tg7%"%%%%&Dir%%%%\%&tg2%" %&tg6%
						}
					}
				}
				FIND $%&tg4%=主程序运行前,
				{*
					SET< &FCMD=%&NL%%&tcmd%
				}!   
				{*
					SET< &ECMD=%&NL%%&tcmd%
				}
			}
		}
		%&xCMD%CALL Fresh
	}
	IFEX $%&C3.Check%=1, %&xCMD%EXEC $"%%&Dir%%"
	//%&xCMD%TIPS -
	%&xCMD%%&FCMD%
	%&xCMD%ENVI &pidc=0
	%&xCMD%ENVI &pidcx=0
	IFEX $%&C1.Check%=1,
	{
		%&xCMD%FEXT &myEXT=%%&EXE%%
		%&xCMD%FIND $[ '%%&myEXT%%'='cmd' | '%%&myEXT%%'='bat' ],
		%&xCMD%{
		%&xCMD%	READ "%%&Dir%%\%%&EXE%%",1,&cmdINFO
		%&xCMD%	FIND $[ '%%&cmdINFO%%'<>'%%&cmdHEAD%%' & '%%&cmdINFO%%'<>'MZ?' ], WRIT "%%&Dir%%\%%&EXE%%",$+1,%%&cmdHEAD%%%%&NL%%
		%&xCMD%}
		%&xCMD%FIND $%%&myEXT%%=wcs,
		%&xCMD%{*
		//%&xCMD%	ENVI &pidc=%%&__PID%%
		%&xCMD%	TEAM WRIT "%%&Dir%%\cgipath.dat",$+1,%%CurDir%%| SITE "%%&Dir%%\cgipath.dat",+H
		%&xCMD%	IFEX [ ( %%&Dir%%\HDSIZEID.EXE ) & ( %%&Dir%%\USORT.EXE ) ],
		%&xCMD%	{
		%&xCMD%		ENVI &onekey=
		%&xCMD%		ENVI &onekeyCMD=FDIR --short --fullfile &onekey
		FIND $%&E1%<>, %&xCMD%		%%&onekeyCMD%%=%&E1%
		%&xCMD%		FIND $%%&onekey%%=, %%&onekeyCMD%%=%%*
		%&xCMD%		FIND $%%&onekey%%=, %%&onekeyCMD%%=%%CurDir%%\onekey.ini
		%&xCMD%		FIND $%%&onekey%%<>, TEAM FILE "%%&onekey%%"=>"%%&Dir%%\"| SITE "%%&Dir%%\onekey.ini",+H
		%&xCMD%	}
		%&xCMD%	EXEC -incmd %&forceWAIT% %&wait%%&hide2%PECMD TEAM LOAD "%%&Dir%%\%%&EXE%%" %&E1% %%*| LOGS
		//%&xCMD%	THREAD* %&myWAIT% TEAM ENVI^ EnviMode=0| ENVI^ ForceLocal=0| LOAD "%%&Dir%%\%%&EXE%%" %&E1% %%*| LOGS
		%&xCMD%}!   
		%&xCMD%{*
		%&xCMD%	FIND $%%&myEXT%%=reg,
		%&xCMD%	{*
		%&xCMD%		EXEC -err+ -hide =reg.exe import "%%&Dir%%\%%&EXE%%"
		%&xCMD%		IFEX $%%&error%%<>0, EXEC -err+ -hide =regedit.exe /s "%%&Dir%%\%%&EXE%%"
		%&xCMD%	}!   
		%&xCMD%	{*
		%&xCMD%		EXEC%&SuperWAIT% %&hide% %&forceWAIT% %&wait%"%%&Dir%%\%%&EXE%%" %&E1% %%*
		//%&xCMD%		EXEC %&hide% %&forceWAIT% -exe:"%%&Dir%%\%%&EXE%%" %&wait%my_exe %&E1% %%*
		%&xCMD%	}
		%&xCMD%}
	}
	FIND $%&SuperWAIT%<>,
	{
		%&xCMD%_SUB getSuperPid
		%&xCMD%	IFEX $%%&pidcx%%>0, EXIT
		%&xCMD%	ENVI &childPID=
		%&xCMD%	FIND --pid*@.#%%&pidc%% &childPID,
		%&xCMD%	FORX *NL &childPID,&onePID,
		%&xCMD%	{*
		%&xCMD%		FIND $%%&onePID%%<>,
		%&xCMD%		{*
		%&xCMD%			MSTR* * &pids=<1>&onePID
		%&xCMD%			FIND --pid*@.%%&pids%% &pidSTR,
		%&xCMD%			MSTR* * &pidt,&tidFILE=<2><6>&pidSTR
		%&xCMD%			IFEX $[ %%&pidt%%=%%&pidc%% & '%%&tidFILE%%'<>'' ], ENVI &pidcx=%%&pids%%
		%&xCMD%		}
		%&xCMD%	}
		%&xCMD%_END
	}
	%&xCMD%IFEX $%%&pidc%%>0,
	%&xCMD%{
	%&xCMD%	ENVI &childPID=
	%&xCMD%	FIND --pid*@.#%%&pidc%% &childPID,
	%&xCMD%	FIND $%%&childPID%%=,!! TEAM ENVI &pidc=%%&pidcx%%| FIND --pid*@.#%%&pidc%% &childPID,
	%&xCMD%	FORX *NL &childPID,&onePID,
	%&xCMD%	{
	%&xCMD%		FIND $%%&onePID%%<>,
	%&xCMD%		{
	%&xCMD%			MSTR* * &pids=<1>&onePID
	%&xCMD%			FIND --pid*@.%%&pids%% &pidSTR,
	%&xCMD%			MSTR* * &pidt,&tidFILE=<2><6>&pidSTR
	%&xCMD%			IFEX $[ %%&pidt%%=%%&pidc%% & '%%&tidFILE%%'<>'' ], WAIT *%%&pids%%
	%&xCMD%		}
	%&xCMD%	}
	%&xCMD%}
	%&xCMD%%&ECMD%
	%&xCMD%WAIT 500
	%&xCMD%CALL DelSUB
	CMPS wcs.tmp setup.tmp
	FILE -force wcs.tmp
	CALL Fresh
_END

_SUB SETRunKEY *
	^IFEX $%%%1.autoRUN%%=0,
	{*
		ENVI &runKEY=HKCU\Software\Microsoft\Windows\CurrentVersion\Run
	}!   
	{*
		ENVI &runKEY=HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce
	}
_END

_SUB killCHILD
	%&xCMD%
	%&xCMD%_SUB KillMe
	%&xCMD%	ENVI &childPID=
	%&xCMD%	FIND --pid*@.#%%&__PID%% &childPID,
	%&xCMD%	LOOP $%%&childPID%%<>,
	%&xCMD%	{*
	%&xCMD%		FORX *NL &childPID,&OnePid,
	%&xCMD%		{
	%&xCMD%			FIND $%%&OnePid%%<>,
	%&xCMD%			{
	%&xCMD%				MSTR* * &pids=<1>&OnePid
	%&xCMD%				FIND --pid*@.%%&pids%% &pidSTR,
	%&xCMD%				MSTR* * &pidt,&tidFILE=<2><6>&pidSTR
	%&xCMD%				IFEX $[ %%&pidt%%=%%&__PID%% & '%%&tidFILE%%'<>'' ], KILL *force *%%&pids%%
	%&xCMD%			}
	%&xCMD%		}
	%&xCMD%		ENVI &childPID=
	%&xCMD%		FIND --pid*@.#%%&__PID%% &childPID,
	%&xCMD%	}
	%&xCMD%_END
	%&xCMD%
_END

_SUB DelSUB
	%&xCMD%_SUB DelSUB
	IFEX $%&CA.Check%=1,
	{
		%&xCMD%	FILE -force "%%&Dir%%"
		%&xCMD%	CALL Fresh
		%&xCMD%	THREAD*$ CALL DelMySelf "rd /s /q" "%%&Dir%%"
	}
	IFEX $%&CB.Check%=1, %&xCMD%	THREAD*$ CALL DelMySelf "del /a /f /q" "%%MyName%%"
	%&xCMD%_END
_END

_SUB Fresh
	//ENVI @@DeskTopFresh=1
_END

_SUB changeCODE
	GETF "%MyName%""%2|EXEDATA",0#*,&pX
	CODE *ANSI,%&pX%,**UNI,&pX
	ENVI-ret %1=%&pX%
_END

_SUB changeBIT
	READ admin.tmp,**,&tmpMSG
	IFEX $%&C5.Check%=0, SED &tmpMSG=0,requireAdministrator,asInvoker,%&tmpMSG%
	FIND $[ '%~1'<>'' & '%~2'<>'' ], SED &tmpMSG=0,'%1','%2',%&tmpMSG%
	IFEX $%&C6.Check%=1,
	{*
		CALL changeCODE &tmpCOM %&Compatible%
		LPOS* * &aPOS=%&NL%</assembly>,1,&tmpMSG
		IFEX $%&aPOS%>0,
		{*
			CALC #&aPOS=%&aPOS%-1
			MSTR * &tmpMSG=1,%&aPOS%,&tmpMSG
			SET< &tmpMSG=%&NL%%&tmpCOM%%&NL%</assembly>
		}
	}
	PUTF -dd -len=0 admin.tmp,0,zero
	CALL Fresh
	WRIT admin.tmp,$+0,%&tmpMSG%
	CALL Fresh
_END

_SUB extractRES
	PUTF %2,,"%MyName%""%1|EXEDATA"
_END

_SUB changeVER *
	ENVI &Dou=,
	MSTR * -delims:, &fs1,&fs2,&fs3,&fs4=<1*>%2
	FORX * 1 2 3 4,&ft, ^FIND $%%&fs%&ft%%%=, ENVI &fs%&ft%=0
	ENVI &qSTR=%&fs1%,%&fs2%,%&fs3%,%&fs4%
	//^ENVI &qSTR=%%%2%%
	//SED &fSTR=0,%&Dou%,,%&qSTR%
	//FIND $%&fSTR%=, ENVI &qSTR=0,0,0,0
	SED &lSTR=0,%1 *[0-9]*%&Dou%*[0-9]*%&Dou%*[0-9]*%&Dou%*[0-9]*%&NL%,%1 %&qSTR%%&NL%,%&lSTR%
_END

_SUB CabFiles
	ENVI &z4=%&tmpdir%\%RanDom%
	ENVI &z3=
	STRL &z2=%~1..
	FORX /S %~1\*,&z1,,
	{*
		MSTR &z6=%&z2%,0,%&z1%
		SET< &z3="%&z1%" "%&z6%"%&NL%
	}
	FORX *NL &tablEMSG%&L1.isel%,&z5,
	{*
		FIND $%&z5%<>,
		{*
			LPOS* * ,&z7="%&z5%"%&NL%,1,&z3
			IFEX $%&z7%>0, WRIT *v *fv &z3,-%&z7%,&z3
		}
	}
	FIND $%&z3%=,
	{*
		FNAM -ext &z2=%1
		ENVI &z3="%~1" "%&z2%"
	}
	PUTF -dd -len=0 "%&z4%~.tmp",0,zero
	CALL Fresh
	WRIT "%&z4%~.tmp",$0,%&z3%
	CALL Fresh
	SIZE &Size=%~1
	ENVI &Cabexe=%&makecab%
	ENVI &tmpcabexe="%SystemRoot%\System32\makecab.exe"
	IFEX $%&WinVer%<0x600011DB1,! IFEX %&tmpcabexe%, ENVI &Cabexe=%&tmpcabexe%
	ENVI &CabCMD=/V3 /D CompressionType=LZX /D CompressionMemory=%&L7% /D MaxDiskSize=0 /D FolderSizeThreshold=%&Size% /D DiskDirectoryTemplate="%&tmpdir%\." /D CabinetNameTemplate="%~2" /D InfFileName="%&z4%~.inf" /D RptFileName="%&z4%~.rpt" /F "%&z4%~.tmp" 
	FIND $%3=, TEAM ENVI &msgSTR=&bMsg| ENVI &exeCMD=EXEC*- -cmd::5000:MakeCabMsg! TEAM ENVI &msgSTR=| ENVI &exeCMD=EXEC
	TEAM ENVI &Progress=| %&exeCMD% -err+ -hide -exe:%&Cabexe% %&msgSTR%=makecab_exe %&CabCMD%| ENVI &cabERR=%&error%
	IFEX $[ %&error%=2 & %&WinVer%>=0x600011DB1 ], TEAM ENVI &Progress=| %&exeCMD% -err+ -hide -exe:%&makecab% %&msgSTR%=makecab_exe %&CabCMD%| ENVI &cabERR=%&error%
	IFEX $%&cabERR%<>0, FILE -force %~2
	FILE -force "%TEMP%\cab_*"
	FILE -force "%TEMP%\inf_*"
_END

_SUB getRES
	ENVI ?,&Allfile=DROPFILE,%~2
	FORX *NL &Allfile,&OneFile,
	{
		FIND $%&OneFile%<>,
		{
			IFEX %&OneFile%\,!
			{
				ENVI @%1.SEL=%&OneFile%
				^FIND $%%%1%%<>%%&OneFile%%, ENVI @%1.ADDSEL=%&OneFile%
				EXIT
			}
		}
	}
_END

_SUB getSOURCE *
	ENVI ?,&Allfile=DROPFILE,%~1
	FORX *NL &Allfile,&dir,
	{*
		FIND $%&dir%<>,
		{*
			IFEX %&dir%\,
			{*
				FIND $%3=,
				{*
					THREAD* TEAM ENVI &oldL1=%&L1%| CALL checkSOURCE
				}!   
				{
					ENVI &fir=%&dir%\
					CALL checkFILE %3 "" %3
				}
				EXIT
			}!   
			{*
				//FEXT &xEXT=%&dir%
				//IFEX [ ( "%&dir%" ) & '%3'='' & ( '%&xEXT%'='exe' | '%&xEXT%'='bat' | '%&xEXT%'='cmd' | '%&xEXT%'='reg' | '%&xEXT%'='vbs' | '%&xEXT%'='wcs' ) ], TEAM ENVI &oldL1=%&L1%| THREAD* CALL checkSOURCE| EXIT
				IFEX [ ( "%&dir%" ) & '%3'='' ], TEAM ENVI &oldL1=%&L1%| THREAD* CALL checkSOURCE| EXIT
			}
		}
	}
_END

_SUB getFILE
	ENVI ?,&Allfile=DROPFILE,%~2
	FORX *NL &Allfile,&fir,
	{
		FIND $%&fir%<>,
		{
			IFEX %&fir%\,!
			{
				FIND $%~4=,
				{
					FIND $%~7=,
					{
						CALL checkFILE %1 "%~5" %6
					}!   
					{
						FEXT &tmpEXT=%&fir%
						FIND $'%&tmpEXT%'<>'%~7', EXIT
						ENVI @%1.SEL=%&fir%
						^FIND $%%%1%%<>%%&fir%%, ENVI @%1.ADDSEL=%&fir%
						FIND $'%~7'='EXE', CALL setLE1
					}
					EXIT
				}!   
				{
					CALL viewREGBAT noVIEW
				}
			}
		}
	}
_END

_SUB checkFILE
	STRL * &sL=&L1
	MSTR * &tE=1,%&sL%,&fir
	FIND $%&tE%<>%&L1%, TEAM MESS+icon6%&top% %&NL%%&NL%请在源文件夹内选择程序！ @错误#OK*5000| EXIT
	CALC #&sL=%&sL%+2
	MSTR * &tE=%&sL%,0,&fir
	ENVI @%~1.SEL=%&tE%
	^FIND $%%%1%%<>%%&tE%%, ENVI @%1.ADDSEL=%&tE%
	FIND $%~2<>, CALL setDIR
	FIND $%3=, CALL setSOURCE
_END

_SUB setSOURCE
	FORX * &L8 &L9,&sK,
	{
		FNAM-ext &tmpNAME=%&fir%
		FIND $%&tmpNAME%=, TEAM ENVI &fir= |
		ENVI @%&sK%.SEL=%&fir%
		^FIND $%%%&sK%%%<>%%&fir%%, ENVI @%&sK%.ADDSEL=%&fir%
	}
_END

_SUB view_file
	^ENVI &tmpFILE=%%%1%%
	FNAM-ext &tmpNAME=%&tmpFILE%
	FIND $%&tmpNAME%=, ENVI &tmpFILE=setup.exe
	ENVI &_fir=%&L1%\%&tmpFILE%
	BROW &fir,%&_fir%,请选择一个可执行程序,exe、cmd、bat、vbs、wcs|*.exe;*.cmd;*.bat;*.vbs;*.wcs|所有文件|*.*,0x10001000
	FIND $%&fir%<>, CALL checkFILE %1
_END

_SUB view_ver
	FNAM-ext &tmpNAME=%&L9%
	FIND $%&tmpNAME%=, ENVI &_fir=%&L1%\setup.exe! ENVI &_fir=%&L9%
	BROW &fir,%&_fir%,版本信息,rc、res、exe、dll、cpl|*.ico;*.res;*.exe;*.dll;*.cpl|所有文件|*.*,0x10001000
	FIND $%&fir%<>,
	{
		ENVI @&L9.SEL=%&fir%
		FIND $%&L9%<>%&fir%, ENVI @&L9.ADDSEL=%&fir%
	}
_END

_SUB view_icon
	FNAM-ext &tmpNAME=%&L8%
	FIND $%&tmpNAME%=, ENVI &_fir=%&L1%\setup.exe! ENVI &_fir=%&L8%
	BROW &fir,%&_fir%,请指定图标资源,ico、res、exe、dll、cpl|*.ico;*.res;*.exe;*.dll;*.cpl|所有文件|*.*,0x10001000
	FIND $%&fir%<>,
	{
		ENVI @&L8.SEL=%&fir%
		FIND $%&L8%<>%&fir%, ENVI @&L8.ADDSEL=%&fir%
	}
_END

_SUB save_file
	FIND $%&L2%=, ENVI &_sir=%&L1%.exe! ENVI &_sir=%&L2%
	BROW &sir,&%&_sir%,保存位置,exe|*.exe|,0x2
	FIND $%&sir%<>,
	{
		FEXT &tmpEXT=%&sir%
		FIND $%&tmpEXT%<>EXE, ENVI &sir=%&sir%.exe
		ENVI @&L2.SEL=%&sir%
		FIND $%&L2%<>%&sir%, ENVI @&L2.ADDSEL=%&sir%
	}
_END

_SUB view_sfx
	IFEX $%&RE1.Check%=1,
	{*
		ENVI &str1=SFX文件保存位置
		ENVI &str2=0x2
		ENVI &str3=&
	}!   
	{*
		ENVI &str1=请指定一个SFX文件
		ENVI &str2=0x10001000
		ENVI &str3=
	}
	FIND $%&LE4%=, ENVI &_sir=%CurDir%\setup.sfx! ENVI &_sir=%&LE4%
	^BROW &sir,%&str3%%%&_sir%%,%%&str1%%,sfx|*.sfx|,%&str2%
	FIND $%&sir%<>,
	{
		FEXT &tmpEXT=%&sir%
		FIND $'%&tmpEXT%'<>'sfx',
		{*
			IFEX $%&RE2.Check%=1, EXIT
			ENVI &sir=%&sir%.sfx
		}
		ENVI @&LE4.SEL=%&sir%
		FIND $%&LE4%<>%&sir%, ENVI @&LE4.ADDSEL=%&sir%
	}
_END

_SUB view_config
	IFEX $%&RE1.Check%=1,
	{*
		ENVI &str1=配置文件保存位置
		ENVI &str2=0x2
		ENVI &str3=&
	}!   
	{*
		ENVI &str1=请指定一个配置文件
		ENVI &str2=0x10001000
		ENVI &str3=
	}
	FIND $%&LE3%=, ENVI &_sir=%CurDir%\setup.txt! ENVI &_sir=%&LE3%
	^BROW &sir,%&str3%%%&_sir%%,%%&str1%%,txt|*.txt|,%&str2%
	FIND $%&sir%<>,
	{
		FEXT &tmpEXT=%&sir%
		FIND $'%&tmpEXT%'<>'txt',
		{*
			IFEX $%&RE2.Check%=1, EXIT
			ENVI &sir=%&sir%.txt
		}
		ENVI @&LE3.SEL=%&sir%
		FIND $%&LE3%<>%&sir%, ENVI @&LE3.ADDSEL=%&sir%
	}
_END

_SUB view_cab
	IFEX $%&RE1.Check%=1,
	{*
		ENVI &str1=压缩包保存位置
		ENVI &str2=0x2
		ENVI &str3=&
	}!   
	{*
		ENVI &str1=请指定一个压缩包
		ENVI &str2=0x10001000
		ENVI &str3=
	}
	FIND $%&LE2%=, ENVI &_sir=%CurDir%\setup.7z! ENVI &_sir=%&LE2%
	^BROW &sir,%&str3%%%&_sir%%,%%&str1%%,7z|*.7z|,%&str2%
	FIND $%&sir%<>,
	{
		FEXT &tmpEXT=%&sir%
		FIND $'%&tmpEXT%'<>'7Z',
		{*
			IFEX $%&RE2.Check%=1, EXIT
			ENVI &sir=%&sir%.7z
		}
		ENVI @&LE2.SEL=%&sir%
		FIND $%&LE2%<>%&sir%, ENVI @&LE2.ADDSEL=%&sir%
	}
_END

_SUB view_exe
	IFEX $%&RE1.Check%=1,
	{*
		ENVI &str1=请指定一个单文件
		ENVI &str2=0x10001000
		ENVI &str3=
	}!   
	{*
		ENVI &str1=单文件保存位置
		ENVI &str2=0x2
		ENVI &str3=&
	}
	FNAM-ext &tmpNAME=%&LE1%
	FIND $%&tmpNAME%=, ENVI &_sir=%CurDir%\setup.exe! ENVI &_sir=%&LE1%
	^BROW &sir,%&str3%%%&_sir%%,%%&str1%%,exe|*.exe|,%&str2%
	FIND $%&sir%<>,
	{
		FEXT &tmpEXT=%&sir%
		FIND $%&tmpEXT%<>EXE,
		{*
			IFEX $%&RE1.Check%=1, TEAM MESS+icon6%&top% %&NL%%&NL%请选择一个 EXE 文件！ @错误#OK*5000| EXIT
			ENVI &sir=%&sir%.exe
		}
		ENVI @&LE1.SEL=%&sir%
		FIND $%&LE1%<>%&sir%, ENVI @&LE1.ADDSEL=%&sir%
		CALL setLE1
	}
_END

_SUB view_drv *
	//FIND $%&LD%=PECMD, ENVI &argBROW=0x10004200! ENVI &argBROW=0x10000200
	FIND $%&L1%=, ENVI &_dir=%&CurDir%! ENVI &_dir=%&L1%
	BROW &dir,*%&_dir%,请指定一个目录,,0x10000200  //0x10004200
	FIND $%&dir%<>,
	{*
		//IFEX "%&dir%\",!   
		//{
		//	FEXT &xEXT=%&dir%
		//	FIND $[ '%&xEXT%'<>'exe' & '%&xEXT%'<>'bat' & '%&xEXT%'<>'cmd' & '%&xEXT%'<>'reg' & '%&xEXT%'<>'vbs' & '%&xEXT%'<>'wcs' ], EXIT _SUB
		//}
		THREAD* TEAM ENVI &oldL1=%&L1%| CALL checkSOURCE
	}
_END

_SUB checkSOURCE
	FIND $%&dir%=%&oldL1%, EXIT
	IFEX [ ( ! %&dir%\ ) & ( ! %&dir% ) ], TEAM ENVI @&L1.Sel=%&oldL1%| EXIT
	IFEX "%&dir%\",!! TEAM SIZE &sizeL1=%&dir%| IFEX $%&sizeL1%=0, TEAM ENVI @&L1.Sel=%&oldL1%|| EXIT
	ENVI @&PartBar=0;正在初始化，请稍等...
	CALL Disable &L1 &L2 &L3 &L4 &L5 &L6 &L7 &L8 &L9 &LD &LE &I1 &I2 &I3 &I4 &I5 &I6 &I7 &I8 &IA &C1 &C2 &C3 &C4 &C5 &C6 &C7 &C8 &C9 &CA &CB &CC &CD &CE &CF &CG &CH &CI &CJ &CK &CL &CN &CQ &CR &CS &CT &CU &CV &CW &E1 //&R1 &R2
	//CALL Disable &I8 &IA
	ENVI @&L1.SEL=%&dir%
	FIND $%&L1%<>%&dir%, ENVI @&L1.ADDSEL=%&dir%
	ENVI @&L2.SEL=%&dir%.exe
	FIND $%&L2%<>%&dir%.exe, ENVI @&L2.ADDSEL=%&dir%.exe
	FIND $%&LC%=, ENVI @&LC.ADDSEL=%&L1%
	FIND $%&LC%<>%&L1%,
	{*
		//CALL resetVAR
		ENVI @&LC.SEL=%&L1%
		FIND $%&LC%<>%&L1%, ENVI @&LC.ADDSEL=%&L1%
		^IFEX $[ %%&C7.Check%%=1 & '%%&extractPATH%&L1.isel%%%'='' ], ENVI @&C7.Check=0
		^IFEX $[ %%&C8.Check%%=1 & '%%&tablAMSG%&L1.isel%%%'='' ], ENVI @&C8.Check=0
		^IFEX $[ %%&C9.Check%%=1 & '%%&tablBMSG%&L1.isel%%%'='' ], ENVI @&C9.Check=0
		^IFEX $[ %%&CF.Check%%=1 & '%%&tablDMSG%&L1.isel%%%'='' ], ENVI @&CF.Check=0
		^IFEX $[ %%&CQ.Check%%=1 & '%%&tablJMSG%&L1.isel%%%'='' ], ENVI @&CQ.Check=0
		^IFEX $[ %%&CR.Check%%=1 & '%%&tablEMSG%&L1.isel%%%'='' ], ENVI @&CR.Check=0
	}
	TEAM ENVI &myEXE=| ENVI &myCMDVBS=| ENVI &t64=| ENVI &t86=| ENVI &tE=
	IFEX "%&L1%\",
	{*
		ENVI &foxCMD=FORX /S %&L1%\*,&tE,,
		STRL * &sL=&L1
		CALC #&sL=%&sL%+2
		ENVI &fir=
	}!   
	{*
		ENVI &foxCMD=FORX %&L1%,&tE,1,
		FDIR --long &pathL1=%&L1%
		STRL * &sL=&pathL1
		CALC #&sL=%&sL%+2
		ENVI &fir=%&L1%
	}
	%&foxCMD%
	{*
		MSTR * &tE=%&sL%,0,&tE
		FEXT &tN=%&tE%
		FIND $%&tN%=EXE,
		{*
			FIND $[ '%&t64%'='' | '%&t86%'='' ],
			{*
				LPOS* * &tT=64,1,&tE
				IFEX $%&tT%>0,
				{*
					FIND $%&t64%=, ENVI &t64=%&tE%
				}!    
				{*
					FIND $%&t86%=, ENVI &t86=%&tE%
				}
			}
			SET< &myEXE=|%&tE%
		}!    
		{*
			FIND $[ '%&tN%'='CMD' | '%&tN%'='BAT' | '%&tN%'='VBS' | '%&tN%'='WCS' ],
			{*
				SET< &myCMDVBS=|%&tE%
			}
		}
	}
	FIND $%&myEXE%=, ENVI &myEXE=%&tE%
	SET< &myEXE=|%&myCMDVBS%
	ENVI @&L3.VAL=%&myEXE%
	ENVI @&L4.VAL=%&myEXE%
	FIND $%&t86%=, ENVI @&L3.isel=1! ENVI @&L3.SEL=%&t86%
	FIND $%&t64%=, ENVI @&L4.isel=1! ENVI @&L4.SEL=%&t64%
	FIND $%&fir%=, ENVI &fir=%&L1%\%&L3%
	CALL setSOURCE
	ENVI @&PartBar=0;
	CALL Enable &L1 &L2 &L3 &L4 &L5 &L6 &L7 &L8 &L9 &LD &LE &I1 &I2 &I3 &I4 &I5 &I6 &I7 &I8 &IA &C1 &C2 &C3 &C4 &C5 &C6 &C7 &C8 &C9 &CA &CB &CC &CD &CE &CF &CG &CH &CI &CJ &CK &CL &CN &CQ &CR &CS &CT &CU &CV &CW &E1 //&R1 &R2
	IFEX $[ %&CT.Check%=0 | '%&LD%'='7zSFX' ], CALL Disable &CU
	IFEX [ "%&L1%" & ! "%&L1%\" ],
	{
		IFEX $%&CS.Visible%=0,
		{
			CALL DisCheck &C2 &C3 &C8 &C9 &CA &CC &CD &CE &CF &CI &CJ &CK &CL &CN &CQ &CR &CT &CU &CW
			CALL DisPECMD
			//ENVI @&L5.DEL=32位/64位自适应
			ENVI @&CS.Visible=1
			ENVI @&C7.Visible=0
			ENVI @&LD=PECMD
			CALL setBIT
			FIND $%&KernelCODE%=,
			{
				ENVI @&KernelCODE=PECMD
			}!   
			{
				FIND $%&KernelCODE%=7zSFX,
				{
					ENVI @&L6.ADD=cab
					CALL EnCheck &CN
					CALL DisCheck &CC
					ENVI @&KernelCODE=PECMD
				}!   
				{
					FIND $%&L6%<>7z,
					{
						ENVI @&L6.SEL=7z
						CALL setPROG
						CALL setPWDchk
					}
				}
			}
		}!   
		{
			CALL DisPECMD
			CALL setBIT
		}
	}!   
	{
		CALL setL5
		CALL setBIT
		IFEX $%&CS.Visible%=1,
		{
			CALL Enable &L6 &L7 &LD &C2 &C3 &C8 &C9 &CA &CC &CD &CE &CF &CI &CJ &CK &CL &CN &CQ &CR &CT &CW
			//ENVI @&L5.ADD=32位/64位自适应
			ENVI @&CS.Visible=0
			ENVI @&C7.Visible=1
		}
	}
_END

_SUB DisPECMD
	CALL Disable &L6 &L7 &LD &C2 &C3 &C8 &C9 &CA &CC &CD &CE &CF &CI &CJ &CK &CL &CN &CQ &CR &CT &CU &CW
_END

_SUB Mouse_Out
	ENVI @%1.MSG=%&WM_MOUSELEAVE%: TIPS -
_END

_SUB Mouse_In
	FIND $%~2=, ENVI &d2=%&NL%! ENVI &d2=%~2
	TEAM ENVI @@Cur=?&bwd;&bwe| TIPS. %~1,%&d2%,1000000000,1,@AL%&bwd%T%&bwe%
_END

_SUB myTIPS
	^ENVI &myTMPtips=%%%1%%
	FIND $%&myTMPtips%=%%%%S, ENVI &myTMPtips=%CurDir%
	MSTR * &aPOS=1,1,&myTMPtips
	MSTR * &bPOS=-2,1,&myTMPtips
	FIND $[ '%&aPOS%'='%' & '%&bPOS%'='%' ], SED &myTMPtips=1:0,%,%^,%&myTMPtips%  //快捷方式%Program Files%\
	FIND $%&myTMPtips%<>,
	{
		CALL Mouse_In "" "%&myTMPtips%"
	}!   
	{
		TIPS -
	}
_END

_SUB EnCheck
	FORX * %*,&vCS, ENVI @%&vCS%.Check=1
_END

_SUB DisCheck
	FORX * %*,&zCS, ENVI @%&zCS%.Check=0
_END

_SUB Disable
	FORX * %*,&xCS, ENVI @%&xCS%.Enable=0
_END

_SUB Enable
	FORX * %*,&tCS, ENVI @%&tCS%.Enable=1
_END

_SUB setBIT
	FIND $%&L5%=32位, CALL SetEnable 1 0
	FIND $%&L5%=64位, CALL SetEnable 0 1
	FIND $%&L5%=32位/64位自适应, CALL SetEnable 1 1
_END

_SUB SetEnable
	FORX * &L3 &I3,&xS1,ENVI @%&xS1%.Enable=%1
	FORX * &L4 &I4,&xS2,ENVI @%&xS2%.Enable=%2
_END

_SUB Cursor
	FORX * %* ,&bwg, ENVI @%&bwg%.Cursor=32649
_END

_SUB extractVER
	PUTF %1,,%&verHEX%
	SIZE &tmpSIZE=%1
	PUTF -dd %1,%&tmpSIZE%,%2"#.1|#16"
	SIZE &tmpSIZE2=%1
	IFEX $%&tmpSIZE%=%&tmpSIZE2%, TEAM FILE -force %1| EXIT
	GETF %1,0x40#2,&b
	PUTF %1,0x20,%&b%
_END

_SUB getMSG *
	^FIND $[ '%%&tablCMSG%&L1.isel%%%'<>'%%&L9%%' | '%%~1'='noSAVE' ],
	{*
		ENVI &msg7=
		FEXT &ext=%&L9%
		FIND $[ '%&ext%'='rc' | '%&ext%'='txt' ],
		{*
			READ "%&L9%",**,&verMSG
		}!   
		{*
			ENVI &myRC=%Temp%\~%RanDom%.rc
			FILE -force "%&myRC%"
			EXEC -wd:"%Temp%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract "%&L9%","%&myRC%",VERSIONINFO,,
			IFEX "%&myRC%",!
			{
				FILE -force "%&myRC%.res"
				FIND $%&ext%=res,
				{
					FILE "%&L9%"=>"%&myRC%.res"
				}!   
				{
					CALL extractVER "%&myRC%.res" "%&L9%"
				}
				EXEC -wd:"%Temp%\" -hide -exe:%&ResHacker% =ResHacker_exe -extract "%&myRC%.res","%&myRC%",VERSIONINFO,,
				FILE -force "%&myRC%.res"
			}
			READ "%&myRC%",**,&verMSG
			FILE -force "%&myRC%"
		}
		LPOS* * &aPOS=%&NL%		VALUE ",1,&verMSG
		IFEX $%&aPOS%>0,
		{*
			MSTR * &msg1=%&aPOS%,0,&verMSG
			LPOS* * &bPOS=%&NL%	}%&NL%,1,&msg1
			IFEX $%&bPOS%>0,
			{*
				MSTR * &msg2=3,%&bPOS%,&msg1
				ENVI &num=1
				LOOP #1=1,
				{*
					READ -*,%&num%,&msg3,&msg2
					FIND $%&msg3%=, EXIT
					MSTR * -delims:" &msg4,&msg5,&msg6=<1><2><4>&msg3
					FIND $'%&msg4%'<>'		VALUE ', EXIT
					SED &msg5=0,%&TAB%, ,%&msg5%
					SED &msg6=0,%&TAB%, ,%&msg6%
					CALL DelStr &msg5
					CALL DelStr &msg6
					ENVI &msg7=%&msg7%%&msg5%%&TAB%%&msg6%%&NL%
					CALC #&num=%&num%+1
				}
			}
		}
		CALL checkVER FILEVERSION &myFVER
		CALL checkVER PRODUCTVERSION &myPVER
		FIND $%~1=noSAVE,
		{
			ENVI @&TABL.Val=-*
			ENVI @&TABL.Val=1*#;%&msg7%
			CALL setEI +
			FORX * 1 2 3 4 5 6 7 8 ,&xPOS, ^ENVI @&EI%&xPOS%=%%&EI%&xPOS%+%%
		}!   
		{*
			CALL setEI _
		}
	}!   
	{*
		^ENVI &msg7=%%&tablMSG%&L1.isel%%%
		FORX * 1 2 3 4 5 6 7 8 ,&xPOS, ^ENVI &EI%&xPOS%_=%%&EI%&xPOS%_%&L1.isel%%%
	}
_END

_SUB setEI *
	MSTR * -delims:, &EI1%1,&EI2%1,&EI3%1,&EI4%1=<1*>&myFVER
	MSTR * -delims:, &EI5%1,&EI6%1,&EI7%1,&EI8%1=<1*>&myPVER
_END

_SUB checkVER
	ENVI &fPOS=
	TEAM ENVI &aPOS=%&NL%%1 |
	LPOS* * &bPOS=%&aPOS%,1,&verMSG
	IFEX $%&bPOS%>0,
	{*
		MSTR * &cPOS=%&bPOS%,0,&verMSG
		READ -*,2,&dPOS,&cPOS
		MSTR * &ePOS=<2->&dPOS
		SED &fPOS=0, ,,%&ePOS%
	}
	ENVI-ret %2=%&fPOS%
_END

_SUB KillMe
	ENVI @&exitCODE=1
	ENVI &childPID=  //必需清空，FIND --pid找不到进程时不会重置该变量
	ENVI &myPID=
	//FIND --pid*@.%&__PID% &myPID,      //%&__PID%详细信息
	FIND --pid*@.#%&__PID% &childPID,    //%&__PID%子进程详细信息，多行
	LOOP $%&childPID%<>,
	{*
		FORX *NL &childPID,&OnePid,
		{
			FIND $%&OnePid%<>,
			{
				MSTR* * &pids=<1>&OnePid
				//ENVI ?&pidt=PPID,%&pids%  //BUG：“ENVI ?返回名=PPID,进程号”查询父进程号失败，始终返回0
				FIND --pid*@.%&pids% &pidSTR,
				MSTR* * &pidt,&tidFILE=<2><6>&pidSTR
				IFEX $[ %&pidt%=%&__PID% & '%&tidFILE%'<>'' ], KILL *force *%&pids%
			}
		}
		ENVI &childPID=
		FIND --pid*@.#%&__PID% &childPID,
	}
	FIND $%&tmpdir%<>, FILE -force "%&tmpdir%" //EXEC -incmd PECMD WAIT * -del "%&tmpdir%"
	//{
	//	ENVI &cmdFILE="%Temp%\~%RanDom%.cmd"
	//	FILE -force %&cmdFILE%
	//	//EXEC -hide =cmd.exe /c echo %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a >%&cmdFILE%
	//	//WRIT %&cmdFILE%,$+0,cls
	//	WRIT %&cmdFILE%,$+0,@echo off
	//	//WRIT %&cmdFILE%,$+0,ping -n 2 127.0.0.1 >nul 2>&1
	//	WRIT %&cmdFILE%,$+0,set num=1
	//	WRIT %&cmdFILE%,$+0,:LOOP
	//	WRIT %&cmdFILE%,$+0,if not exist "%&tmpdir%" goto :END
	//	WRIT %&cmdFILE%,$+0,rd /s /q "%&tmpdir%" >nul 2>&1
	//	WRIT %&cmdFILE%,$+0,if exist "%&tmpdir%" ping -n 2 127.0.0.1 >nul 2>&1
	//	WRIT %&cmdFILE%,$+0,if %%num%% gtr 3 goto :END
	//	WRIT %&cmdFILE%,$+0,set /a num+=1
	//	WRIT %&cmdFILE%,$+0,goto LOOP
	//	WRIT %&cmdFILE%,$+0,:END
	//	//WRIT %&cmdFILE%,$+0,rd /s /q "%&tmpdir%" >nul 2>&1 & if exist "%&tmpdir%" goto :END
	//	//WRIT %&cmdFILE%,$+0,del /a /f /q %&cmdFILE% >nul 2>&1
	//	WRIT %&cmdFILE%,$+0,del /a /f /q "%~f0" >nul 2>&1
	//	//EXEC -hide =cmd.exe /c echo.>>%&cmdFILE%
	//	CALL Fresh
	//	SITE %&cmdFILE%,+H
	//	CALL Fresh
	//	//EXEC -incmd pecmd EXEC -wd:%SystemDrive% -IDLE --hide cmd /c %&cmdFILE%
	//	EXEC* -timeout:500 -incmd =pecmd EXEC -wd:%SystemDrive% -hide cmd /c %&cmdFILE%
	//}
	KILL *force *tree *%&__PID%
_END

_SUB MakeCabMsg
	IFEX $%&exitCODE%=1, EXIT
	IFEX $%&Progress%=1000, EXIT
	STRL * &echoSIZE=&bMsg
	IFEX $%&echoSIZE%=, EXIT
	RPOS* * &bum=%&NL1%,1,&bMsg
	MSTR * &buj=%&bum%,0,&bMsg
	MSTR * &buk,&bus=<1><2->&buj
	MSTR * &bue=-1,1,&buk
	MSTR * &buf=-2,0,&buk
	IFEX $[ '%&bue%'='%' & %&buf%>0 & %&buf%<100 & %&buf%>%&Progress% ],
	{
		ENVI &Progress=%&buf%
		ENVI @&PartBar=%&buf%;正在压缩，请稍等 ...  %&buf%%%
	}!    
	{
		MSTR* * &but=2,23,&bus
		IFEX $[ '%&buk%'='**' | '%&but%'='flushing current folder' | ( '%&bue%'='%' & %&buf%=100 ) ],
		{
			FIND $%&buk%=**,
			{
				ENVI &Progress=1000
				ENVI @&PartBar=100;正在生成单文件，请稍等 ...
			}!   
			{
				ENVI &Progress=100
				IFEX $%&buf%>0,
				{
					ENVI @&PartBar=100;正在刷新当前文件夹，请稍等 ...  %&buf%%%
				}
			}
		}!   
		{
			IFEX $[ %&Progress%=0 & %&buf%>0 ], ENVI @&PartBar=0;正在检查第 %&buf% 个指令文件，请稍等...
		}
	}
_END

_SUB OnInit
	ENVI @this.POS=?x:y:w:h:x0:y0
	CALC x0=%x0%+2
	CALC y0=%y0%+22
	CALC w0=%x0%+%x0%-10
	CALC #IDX=%IDX%+1
	IMAG -numicong NUMx,L%xi%T%yi%W32H32,%SRC%
	MSTR NUM=<1>%NUMx%
	CALC I0=0-%PAGES%
	IFEX $%NUM%<>0, CALL OnNext
_END

_SUB OnNext
	CALC #IDX=%IDX%+1
	SET-def idy=%IDX%
	SET-def hv=0
	LOOP $%hv%:%idy%=0:%IDX%,
	{
		CALC &&I02=%I0%+%PAGES%
		IFEX $%I02%>=%NUM%, EXIT _SUB
		TEAM SET I0=%I02%| CALL OnPic
	}
_END

_SUB OnPic
	ENVI @this.POS=?x:y:w:h
	CALC #w=%w%-%w0%
	CALC #&NX=%&w%/48
	SET I=%PAGES%
	LOOP #%I%>0,
	{
		CALC I=%I%-1
		ENVI @&IMAG%I%.*del=
		ENVI @&LABE%I%.*del=
	}
	SET I=0
	CALC #&NUMz=%NUM%-%I0%
	LOOP #%I%<%PAGES%,
	{*
		IFEX $%I%>=%&NUMz%, EXIT
		CALC &&II=%I0%+%I%
		CALC #&&xi=%x0%+((%I%/1) % %NX%)*48
		CALC #&&yi=%y0%+((%I%/1)/%NX%)*48
		CALC #&&y2=%yi%+32
		^IMAG &IMAG%I%,L%xi%T%yi%W32H32,%SRC%#%II%,TEAM ENVI @&EB4=%II%| KILL \| EXIT,#0xFF00FF,   //#0xC0C0C0,3
		ENVI @&IMAG%I%.stat=&&v
		IFEX $0<>%v%, TEAM SET hv=1| LABE -center &LABE%I%,L%xi%T%y2%W32H16,%II%
		CALC I=%I%+1
	}
	SET bs=1
_END

_SUB OnPre
	CALC #IDX=%IDX%+1
	SET-def idy=%IDX%
	SET-def hv=0
	LOOP $%hv%:%idy%=0:%IDX%,
	{
		IFEX $%I0%<1, EXIT _SUB
		TEAM CALC I0=%I0%-%PAGES%| IFEX $%I0%<0, SET I0=0| CALL OnPic
	}
_END

_SUB OnSize_WIN5
	FIND $1=%bs%,! EXIT
	TEAM SET &sz=0 
	IFEX $%1=%&SIZE_MAXIMIZED%, ENVI &sz=1
	IFEX $%1=%&SIZE_MAXSHOW%, ENVI &sz=1
	IFEX $%1=%&SIZE_RESTORED%, ENVI &sz=1
	IFEX $1=%&sz%,
	{
		ENVI @this.POS=?::&&w1:&&h1
		CALC #&w2=%&w1%+16
		CALC #&w1=%&w1%-%x0%
		CALC #&h1=%&h1%-%y0%
		IFEX $%w%=%w1%,!! IFEX $%h%=%h1%, EXIT _SUB
		ENVI @&BB1.POS=::%&w2%
		SET w=%w1%
		SET h=%h1%
		CALL OnPic
	}
_END

//暂时未使用
_SUB extractDLL
	//%&::bX64%=0, PECMD32+Win32  //%&::bX64%=1, PECMD32+WIN64  //%&::bX64%=3, PECMD64+WIN64
	FIND $%&::bX64%=1, ENVI &mySYSroot=SysWOW64! ENVI &mySYSroot=System32
	IFEX "%WinDir%\%&mySYSroot%\cabinet.dll",! PUTF "%WinDir%\%&mySYSroot%\cabinet.dll",,"%MyName%""#103|SCRIPT"
_END
//暂时未使用


