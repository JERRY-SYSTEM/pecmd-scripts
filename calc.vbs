code=936T950
LOGS
ENVI ?&adminMODE=ISADMIN
IFEX $%&adminMODE%<>1, TEAM MESS+icon6 \n\n请以管理员身份运行！ @错误#OK*5000| EXIT
IFEX $%&PECMDVER%<201201880579, //201201880566
{
	MESS+icon6 \n\nPECMD 版本低于 201201.88.05.79，程序无法运行！   @错误#OK*3000
	EXIT FILE
}
ENVI^ EnviMode=1
ENVI^ ForceLocal=1
SET$ &NL=0d 0a
SET &WM_TRAYNOTIFY=1109
SET &WM_LBUTTONDOWN=0x0201
SET &WM_RBUTTONDOWN=0x0204
SET &WM_COMMAND=0x0111
SET &EN_CHANGE=0x0300
SET &WM_KEYDOWN=0x0100
SET &WM_SETFOCUS=0x0007
SET &EM_GETSEL=0x00B0
SET &EM_SETSEL=0x00B1
SET &FuHao=, + - * / | & @ < > % ^ ( ) [ ] { } ~ !
SED &FuHao2=0, ,,%&FuHao%
SET &FuHao2=%&FuHao2%=
SED &FuHao3=0,%,,%&FuHao%
SET &HanShu=arcsin arccos arctan arcctg sin cos tan ctg rad deg abs sqrt pow log ln ceil div exp frac floor hypot int lg max min mod pow10 rand round shl shr xor lnot not radius angle length
SED &HanShu2=0, ,( ,%&HanShu%
SET &HanShu2=%&HanShu2%(
SET &dou=,
SET &←=VK_BACK
SET &LABE=LABE -mod -center -vcenter
SET &Calc_Err=数据过大，无法计算！
SET &quanjiao=ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ
SET &banjiao=abcdefghijklmnopqrstuvwxyz
SET &quanjiao=%&quanjiao%ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
SET &banjiao=%&banjiao%abcdefghijklmnopqrstuvwxyz
SET &quanjiao=%&quanjiao%０１２３４５６７８９
SET &banjiao=%&banjiao%0123456789
SET &quanjiao=%&quanjiao%＋－—×＊÷〈〉＜＞《》～！。．，；（）〔〕［］【】
SET &banjiao=%&banjiao%+--**/<><><>~!..,;()()[][]
SET &quanjiao=%&quanjiao%﹛﹜｛｝§¦∣﹪％﹦﹫＠＾、＝｜—·
SET &banjiao=%&banjiao%{}{}|||%%%%=@@^/=|&@
TEAM ENVI &Wide2=430| ENVI &High2=370| ENVI &Font_Size=9| //ENVI &Font_Size1=| REGI #HKCU\Control Panel\Desktop\WindowMetrics\AppliedDPI,&Font_Size1| FIND $%&Font_Size1%=, ENVI &Font_Size1=96|
ENVI &Font_Cmd=IFEX %windir%\fonts\simsun*, ENVI @this.Font=%&Font_Size%:simsun! ENVI @this.Font=%&Font_Size%
ENVI ?&WinVer=WinVer
CALL $--ret:&DPI_Aware user32.dll,SetProcessDPIAware
CALL $--ret:&DPI_Aware user32.dll,SetProcessDPIAwareness,#1
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
CALL @Calc_exe
EXIT FILE
_SUB Calc_exe,W%&Wide2%H%&High2%,计算器   By:JexChan   QQ:527104427,,%MyName%#4,,, -csize %&ScaleCMD% //-scale:%&DPI%
	ENVI @this.POS=?::&CW0:&CH0
	ENVI @this.HitTest=%&CH0%:::20
	IFEX $[ %&CW0%=%&Wide2% | %&CH0%=%&High2% ], ENVI @this.POS=::%&Wide2%:%&High2%
	ENVI @this.POS=?::&CW0:&CH0
	CALC &DPI=%&CH0%/%&High2%
	CALC &CH2=187*%&DPI%+%&CH0%
	CALC #&CH2=%&CH2%
	ENVI &WID0=%&__WinID%
	%&Font_Cmd%
	EDIT+ -3D &EC,L12T10W406H37,,,,0xDF0029,22
	ITEM -na &I1,L12T57W30H30,1,Rad_Deg &I1 1,
	ITEM -na &I2,L54T57W30H30,2,Rad_Deg &I2 2,
	ITEM -na &I3,L96T57W30H30,3,Rad_Deg &I3 3,
	ITEM -na &I4,L12T99W30H30,4,Rad_Deg &I4 4,
	ITEM -na &I5,L54T99W30H30,5,Rad_Deg &I5 5,
	ITEM -na &I6,L96T99W30H30,6,Rad_Deg &I6 6,
	ITEM -na &I7,L12T141W30H30,7,Rad_Deg &I7 7,
	ITEM -na &I8,L54T141W30H30,8,Rad_Deg &I8 8,
	ITEM -na &I9,L96T141W30H30,9,Rad_Deg &I9 9,
	ITEM -na &I0,L12T183W30H30,0,Rad_Deg &I0 0,
	ITEM -na &IA,L54T183W30H30,.,Rad_Deg &IA .,
	ITEM -na &IB,L96T183W30H30,=,Enter &IB,
	ITEM -na &IC,L138T57W30H30,+,Rad_Deg &IC +,
	ITEM -na &ID,L138T99W30H30,-,Rad_Deg &ID -,
	ITEM -na &IE,L138T141W30H30,×,Rad_Deg &IE *,
	ITEM -na &IF,L138T183W30H30,÷,Rad_Deg &IF /,
	ITEM -na &IG,L222T57W30H30,sin,Rad_Deg &IG,
	ITEM -na &IH,L222T99W30H30,cos,Rad_Deg &IH,
	ITEM -na &II,L222T141W30H30,tan,Rad_Deg &II,
	ITEM -na &IJ,L222T183W30H30,ctg,Rad_Deg &IJ,
	ITEM -na &IK,L264T57W50H30,arcsin,Rad_Deg &IK,
	ITEM -na &IL,L264T99W50H30,arccos,Rad_Deg &IL,
	ITEM -na &IM,L264T141W50H30,arctan,Rad_Deg &IM,
	ITEM -na &IN,L264T183W50H30,arcctg,Rad_Deg &IN,
	ITEM -na &IO,L180T57W30H30,(,Rad_Deg &IO (,
	ITEM -na &IP,L180T99W30H30,),Rad_Deg &IP ),
	ITEM -na &IQ,L378T183W40H30,π,Rad_Deg &IQ pi,
	ITEM -na &IR,L326T183W40H30,e,Rad_Deg &IR e,
	ITEM -na &IS,L378T57W40H30,←,SEND %&←%,
	ITEM -na &IT,L326T99W40H30,Xⁿ,Rad_Deg &IT ^,
	ITEM -na &IU,L326T57W40H30,C,ENVI @&EC=,
	ITEM -na &IV,L378T99W40H30,√,Rad_Deg &IV,
	ITEM -na &IW,L378T141W40H30,ⁿ√,Rad_Deg &IW,
	ITEM -na &IX,L264T309W30H30,%,Rad_Deg &IX %,
	ITEM -na &IY,L180T183W30H30,~,Rad_Deg &IY ~,
	ITEM -na &IZ,L326T141W40H30,ln,Rad_Deg &IZ,
	ITEM -na &I11,L180T141W30H30,!,Rad_Deg &I11 !,
	RADI &R3,L331T225W70H19,十六进制,Binary_Change,
	RADI &R4,L331T246W70H19,十  进制,Binary_Change,1,
	RADI &R5,L331T267W70H19,八  进制,Binary_Change,
	RADI &R6,L331T288W70H19,二  进制,Binary_Change,
	LIST -h &I23,L310T319W54H202, 角度| 弧度,ENVI @TFOCUS=200, 角度,
	ITEM -na &I12,L12T225W30H30,A,Rad_Deg &I12 A,
	ITEM -na &I13,L54T225W30H30,B,Rad_Deg &I13 B,
	ITEM -na &I14,L96T225W30H30,C,Rad_Deg &I14 C,
	ITEM -na &I15,L12T267W30H30,D,Rad_Deg &I15 D,
	ITEM -na &I16,L54T267W30H30,E,Rad_Deg &I16 E,
	ITEM -na &I17,L96T267W30H30,F,Rad_Deg &I17 F,
	ITEM -na &I18,L12T309W30H30,S,Rad_Deg &I18 S,
	ITEM -na &I19,L54T309W30H30,K,Rad_Deg &I19 K,
	ITEM -na &I20,L96T309W30H30,M,Rad_Deg &I20 M,
	ITEM -na &I21,L138T309W30H30,G,Rad_Deg &I21 G,
	ITEM -na &I22,L180T309W30H30,T,Rad_Deg &I22 T,
	ITEM -na &I24,L264T267W30H30,＆,Rad_Deg &I24 &,
	ITEM -na &I25,L264T225W30H30,｜,Rad_Deg &I25 |,
	ITEM -na &I26,L222T309W30H30,@,Rad_Deg &I26 @,
	ITEM -na &I27,L222T267W30H30,>=,Rad_Deg &I27 >=,
	ITEM -na &I28,L222T225W30H30,<=,Rad_Deg &I28 <=,
	ITEM -na &I29,L180T225W30H30,{,Rad_Deg &I29 {,
	ITEM -na &I30,L180T267W30H30,},Rad_Deg &I30 },
	ITEM -na &I31,L138T225W30H30,[,Rad_Deg &I31 [,
	ITEM -na &I32,L138T267W30H30,],Rad_Deg &I32 ],
	GROU ,L310T214W108H98,
	LABE &I33,L400T103W16H6,—,
	LABE &I34,L402T145W14H6,—,
	ITEM -na &I35,L28T371W40H30,rad,Rad_Deg &I35,,16
	ITEM -na &I36,L82T371W40H30,deg,Rad_Deg &I36,,16
	ITEM -na &I37,L136T371W40H30,pow10,Rad_Deg &I37,,16
	ITEM -na &I38,L190T371W40H30,lg,Rad_Deg &I38,,16
	ITEM -na &I39,L244T371W40H30,log,Rad_Deg &I39,,16
	ITEM -na &I42,L28T413W40H30,max,Rad_Deg &I42,,16
	ITEM -na &I43,L82T413W40H30,min,Rad_Deg &I43,,16
	ITEM -na &I44,L136T413W40H30,not,Rad_Deg &I44,,16
	ITEM -na &I45,L190T413W40H30,lnot,Rad_Deg &I45,,16
	ITEM -na &I46,L244T413W40H30,frac,Rad_Deg &I46,,16
	ITEM -na &I40,L298T413W40H30,hypot,Rad_Deg &I40,,16
	ITEM -na &I41,L352T413W50H30,length,Rad_Deg &I41,,16
	ITEM -na &I49,L28T455W40H30,shr,Rad_Deg &I49,,16
	ITEM -na &I50,L82T455W40H30,shl,Rad_Deg &I50,,16
	ITEM -na &I51,L136T455W40H30,div,Rad_Deg &I51,,16
	ITEM -na &I52,L190T455W40H30,xor,Rad_Deg &I52,,16
	ITEM -na &I53,L244T455W40H30,exp,Rad_Deg &I53,,16
	ITEM -na &I47,L298T455W40H30,floor,Rad_Deg &I47,,16
	ITEM -na &I48,L352T455W50H30,angle,Rad_Deg &I48,,16
	ITEM -na &I56,L28T497W40H30,round,Rad_Deg &I56,,16
	ITEM -na &I57,L82T497W40H30,rand,Rad_Deg &I57,,16
	ITEM -na &I58,L136T497W40H30,ceil,Rad_Deg &I58,,16
	ITEM -na &I59,L190T497W40H30,int,Rad_Deg &I59,,16
	ITEM -na &I60,L244T497W40H30,abs,Rad_Deg &I60,,16
	ITEM -na &I54,L298T497W40H30,mod,Rad_Deg &I54,,16
	ITEM -na &I55,L352T497W50H30,radius,Rad_Deg &I55,,16
	LABE -left &I64,L300T380W33H22,整G：,*,
	EDIT+ -3D &I65,L327T371W75H29,,,0x410,0xDF0029,15
	EDIT &awf,L1T1W1H1,0,,0x18
	EDIT &awk,L1T1W1H1,0,,0x18
	ENVI @&I64.Visible=0
	%LABE% &I61,L-1T351W438H20,︾,More,
	%LABE% &I62,L-1T554W438H20,︽,Less,,-16
	LABE -left ,L380T323W44H18,?)关于,EXEC $http://blog.sina.com.cn/s/blog_6fd804fe0102wqsm.html,0xFF9933
	GROU &I63,L12T348W406H194,
	ENVI @&IU.color=0x000eef
	ENVI @&I63.Visible=0
	FORX * 2 3 4 5 6 7 ,&to,TEAM ENVI @&I1%&to%.Enable=0
	ENVI @&EC.ID=?;&EC_ID
	ENVI @&I65.ID=?;&I65_ID
	ENVI @this.MSG=_%&WM_TRAYNOTIFY%::&wp,&lp, CALL DoMenu %&wp% %&lp%
	CALL SetTray
	ENVI @this.MSG=_COMMAND#%&EC_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&awk%<1, CALL Loop_Change
	ENVI @this.MSG=_COMMAND#%&I65_ID%#%&EN_CHANGE%::&wp,&lp, IFEX $%&awf%<1, CALL _Check_G
	ENVI @&EC.MSG=+%&WM_KEYDOWN%::&vx1,&vx2, Hot_Key
	ENVI @&IQ.MSG=0x1000: Mouse_In 圆周率,3.14159265358979
	ENVI @&IR.MSG=0x1000: Mouse_In 自然常数,2.71828182845905
	ENVI @&IU.MSG=0x1000: Mouse_In 清除输入框的内容,%&NL%
	ENVI @&IV.MSG=0x1000: Mouse_In 开平方, 比如将4开平方，%&NL% 请键入sqrt(4)
	ENVI @&IW.MSG=0x1000: Mouse_In 幂函数, 比如将99开5次方，%&NL% 请键入pow(99，1/5)
	ENVI @&IX.MSG=0x1000: Mouse_In 余数,比如求5除以3的余数，%&NL%请键入5 % 3
	ENVI @&IY.MSG=0x1000: Mouse_In 按位反,%&NL%
	ENVI @&IZ.MSG=0x1000: Mouse_In 自然对数,底数为自然常数 e的对数函数
	ENVI @&I11.MSG=0x1000: Mouse_In 逻辑反,%&NL%
	ENVI @&I18.MSG=0x1000: Mouse_In 字节单位,表示扇区，1S=512字节
	ENVI @&I19.MSG=0x1000: Mouse_In 字节单位,1K=1024字节
	ENVI @&I20.MSG=0x1000: Mouse_In 字节单位,1M=1024K
	ENVI @&I21.MSG=0x1000: Mouse_In 字节单位,1G=1024M
	ENVI @&I22.MSG=0x1000: Mouse_In 字节单位,1T=1024G
	ENVI @&I23.MSG=0x1000: Mouse_In 角度转换,计算正弦(切)、余弦(切)时使用。
	ENVI @&I35.MSG=0x1000: Mouse_In 角度转弧度,%&NL%
	ENVI @&I36.MSG=0x1000: Mouse_In 弧度转角度,%&NL%
	ENVI @&I37.MSG=0x1000: Mouse_In 10的幂函数,%&NL%
	ENVI @&I38.MSG=0x1000: Mouse_In 常用对数,又称“十进对数”，以10为底的对数。
	ENVI @&I39.MSG=0x1000: Mouse_In 对数函数,比如求以10为底，78的对数，%&NL%请键入log(78，10)
	ENVI @&I40.MSG=0x1000: Mouse_In 弦长函数,%&NL%
	ENVI @&I41.MSG=0x1000: Mouse_In 弧长函数,比如高5，弦长100，求弧长：length(5，100)
	ENVI @&I42.MSG=0x1000: Mouse_In 最大值函数,%&NL%
	ENVI @&I43.MSG=0x1000: Mouse_In 最小值函数,%&NL%
	ENVI @&I44.MSG=0x1000: Mouse_In 按位反,not(6) 等价于：~6
	ENVI @&I45.MSG=0x1000: Mouse_In 逻辑反,lnot(6) 等价于：!6
	ENVI @&I46.MSG=0x1000: Mouse_In 取小数函数,%&NL%
	ENVI @&I47.MSG=0x1000: Mouse_In 向下整数,%&NL%
	ENVI @&I48.MSG=0x1000: Mouse_In 圆心角函数,比如高5，弦长100，求圆心角：angle(5，100)
	ENVI @&I49.MSG=0x1000: Mouse_In 位右移函数,%&NL%
	ENVI @&I50.MSG=0x1000: Mouse_In 位左移函数,%&NL%
	ENVI @&I51.MSG=0x1000: Mouse_In 整除函数,%&NL%
	ENVI @&I52.MSG=0x1000: Mouse_In 位异或函数,%&NL%
	ENVI @&I53.MSG=0x1000: Mouse_In e的幂函数,%&NL%
	ENVI @&I54.MSG=0x1000: Mouse_In 余数函数,%&NL%
	ENVI @&I55.MSG=0x1000: Mouse_In 半径函数,比如高5，弦长100，求半径：radius(5，100)
	ENVI @&I56.MSG=0x1000: Mouse_In 4舍5入取整,%&NL%
	ENVI @&I57.MSG=0x1000: Mouse_In 随机函数,%&NL%
	ENVI @&I58.MSG=0x1000: Mouse_In 向上整数,%&NL%
	ENVI @&I59.MSG=0x1000: Mouse_In 取整函数,%&NL%
	ENVI @&I60.MSG=0x1000: Mouse_In 绝对值函数,%&NL%
	ENVI @&I61.MSG=0x1000: Mouse_In 展开更多功能,%&NL%
	ENVI @&I62.MSG=0x1000: Mouse_In 收起,%&NL%
	ENVI &vx3=整G计算,请输入数字，实时将 GB 转换成 MB ，同时显示到结果栏。%&NL%用转换后的大小进行磁盘分区，可在资源管理器显示整数大小。
	ENVI @&I64.MSG=0x1000: Mouse_In %&vx3%
	ENVI @&I65.MSG=0x1000: Mouse_In %&vx3%
	ENVI @&IQ.MSG=0x02A3: TIPS -
	ENVI @&IR.MSG=0x02A3: TIPS -
	ENVI @&IU.MSG=0x02A3: TIPS -
	ENVI @&IV.MSG=0x02A3: TIPS -
	ENVI @&IW.MSG=0x02A3: TIPS -
	ENVI @&IX.MSG=0x02A3: TIPS -
	ENVI @&IY.MSG=0x02A3: TIPS -
	ENVI @&IZ.MSG=0x02A3: TIPS -
	ENVI @&I11.MSG=0x02A3: TIPS -
	ENVI @&I18.MSG=0x02A3: TIPS -
	ENVI @&I19.MSG=0x02A3: TIPS -
	ENVI @&I20.MSG=0x02A3: TIPS -
	ENVI @&I21.MSG=0x02A3: TIPS -
	ENVI @&I22.MSG=0x02A3: TIPS -
	ENVI @&I23.MSG=0x02A3: TIPS -
	ENVI @&I35.MSG=0x02A3: TIPS -
	ENVI @&I36.MSG=0x02A3: TIPS -
	ENVI @&I37.MSG=0x02A3: TIPS -
	ENVI @&I38.MSG=0x02A3: TIPS -
	ENVI @&I39.MSG=0x02A3: TIPS -
	ENVI @&I40.MSG=0x02A3: TIPS -
	ENVI @&I41.MSG=0x02A3: TIPS -
	ENVI @&I42.MSG=0x02A3: TIPS -
	ENVI @&I43.MSG=0x02A3: TIPS -
	ENVI @&I44.MSG=0x02A3: TIPS -
	ENVI @&I45.MSG=0x02A3: TIPS -
	ENVI @&I46.MSG=0x02A3: TIPS -
	ENVI @&I47.MSG=0x02A3: TIPS -
	ENVI @&I48.MSG=0x02A3: TIPS -
	ENVI @&I49.MSG=0x02A3: TIPS -
	ENVI @&I50.MSG=0x02A3: TIPS -
	ENVI @&I51.MSG=0x02A3: TIPS -
	ENVI @&I52.MSG=0x02A3: TIPS -
	ENVI @&I53.MSG=0x02A3: TIPS -
	ENVI @&I54.MSG=0x02A3: TIPS -
	ENVI @&I55.MSG=0x02A3: TIPS -
	ENVI @&I56.MSG=0x02A3: TIPS -
	ENVI @&I57.MSG=0x02A3: TIPS -
	ENVI @&I58.MSG=0x02A3: TIPS -
	ENVI @&I59.MSG=0x02A3: TIPS -
	ENVI @&I60.MSG=0x02A3: TIPS -
	ENVI @&I61.MSG=0x02A3: TIPS -
	ENVI @&I62.MSG=0x02A3: TIPS -
	ENVI @&I64.MSG=0x02A3: TIPS -
	ENVI @&I65.MSG=0x02A3: TIPS -
	ENVI @&EC.ID=?&EC_ID
	TIME TFOCUS,1, OnTFOCUS
	FORX * 3 4 5 6 ,&ps, ENVI @&R%&ps%.MSG=_%&WM_SETFOCUS%: ENVI @TFOCUS=200
	ENVI @&I23.MSG=_%&WM_SETFOCUS%: ENVI @TFOCUS=1500
_END
_SUB _Check_G
	ENVI @&awf=1
	CALC #&zi1=0x7FFFFFFFFFFFFFFF
	CALC #&zi2=%&I65%G
	STRL &zi3=%&zi1%
	STRL &zi4=%&zi2%
	STRL &zi5=%&I65%
	IFEX $[ %&I65%G>0x7FFFFFFFFFFFFFFF | %&zi2%>%&zi1% | %&zi4%>%&zi3% | %&zi5%>%&zi3% ],
	{
		ENVI @&EC=%&Calc_Err%
		ENVI @&awf=0
		EXIT _SUB
	}
	CALC &ziu=512*255*63/1024/1024
	CALC &zix=%&I65%G/1024/1024/%&ziu%
	CALC #&ziv=%&zix%
	IFEX $%&zix%>%&ziv%, CALC &ziv=%&ziv%+1  //有小数点就进一位
	CALC &ziw=%&ziu%*%&ziv%
	CALC #&ziy=%&ziw%
	IFEX $%&ziw%>%&ziy%, CALC &ziy=%&ziy%+1  //有小数点就进一位
	IFEX $%&ziy%<0, ENVI &ziy=%&Calc_Err%! IFEX $%&ziy%<1, ENVI &ziy=
	ENVI @&EC=%&ziy%
	ENVI @&awf=0
_END
_SUB SetTray
	TIPS* 计算器,,,,%MyName%#4
_END
_SUB OnShow
	TEAM ENVI @@Visible=%&WID0%:2| ENVI @@POS=%&WID0%:::::::1|
_END
_SUB DoMenu
	IFEX $%&WM_LBUTTONDOWN%=%2, TEAM OnShow| EXIT
	IFEX $%&WM_RBUTTONDOWN%=%2, CALL @--popmenu MyMenu1
_END
_SUB MyMenu1
	MENU ,还原, OnShow
	MENU -
	MENU ,退出, KILL @
	MENU -
	MENU ,复制到剪贴板, ENVI^ Clipboard=%&EC%
_END
_SUB More
	ENVI @Calc_exe.POS=:::%&CH2%
	ENVI @&I61.Visible=0
	FORX * 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 62 63 64 65 ,&more, ENVI @&I%&more%.Visible=1
_END
_SUB Less
	ENVI @Calc_exe.POS=:::%&CH0%
	ENVI @&I61.Visible=1
	FORX * 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 62 63 64 65 ,&Less, ENVI @&I%&Less%.Visible=0
_END
_SUB Vis_Labe
	TEAM ENVI @%1.Visible=0| ENVI @%1.Visible=1|
_END
_SUB SetPos
	FIND $%&EC%<>%Calc_Err%, ENVI &pa=%~1! ENVI &pa=0
	ENVI @&EC.POSTMSG=%EM_SETSEL%,%&pa%,%~1
_END
_SUB OnTFOCUS
	ENVI @TFOCUS=0
	CALL $USER32.DLL,SetFocus,#%EC_ID%  //移走焦点
_END
_SUB Mouse_In
	TEAM MSTR -delims:, &zd5,&zd6=<1><2->%*| ENVI @@Cur=?&pq;&pr| TIPS. %&zd5%,%&zd6%,1000000000,1,@AL%&pq%T%&pr%
_END
_SUB Hot_Key
	IFEX $%&vx1%=0x1B, ENVI @&EC=
	IFEX $%&vx1%=0x0D, Enter
_END
_SUB GetPos
	SET$# &p6=*8 0
	SET$# &p7=*8 0
	ENVI @%1.SENDMSG=%EM_GETSEL%,@&p6,@&p7
	ENVI?long &p6=&p8
	ENVI?long &p7=&p9
	ENVI-ret %~2=%&p8%
	ENVI-ret %~3=%&p9%
_END
_SUB Enter
	SED &pb=0, ,,%&EC%
	FIND $%&pb%=, EXIT
	FIND $%&pb%=%Calc_Err%, EXIT
	LOOP #1=1,
	{*
		FORX * radius angle length ,&z0,
		{*
			SED &y0=?,%&z0%\(,,%&pb%
			IFEX $%&y0%>0,
			{*
				SET &z2=
				CALC &y1=%&y0%-1
				IFEX $%&y1%>0, MSTR &z2=1,%&y1%,%&pb% //函数前面所有
				MSTR &z3=%&y0%,0,%&pb% //函数和后面所有
				MSTR -delims:( &z4=<2->%&z3%  //括号后面所有
				Loop_Num %&dou% %&z4%
				MSTR &z9=-2,0,%&z6%  //%&z9%为括号内前半部分
				CALC &y7=%&y2%+1
				MSTR &za=%&y7%,0,%&z4%  //%&za%为逗号后面的所有
				SET &zb=
				Loop_Num ) %&za%
				FIND $%&z5%<>,
				{*
					IFEX $[ %&y6%=1 & %&y4%=0 ], TEAM CALC &z5=%&z5%+1| MSTR &z6=-2,0,%&z6%! CALC &z5=%&z5%+2  //%&z6%为括号内后半部分
					MSTR &zb=%&z5%,0,%&za%  //%&zb%为函数后面所有
				}
				MyFUN %&z9% %&z6%
				FIND $%&z0%=radius, ENVI &pb=%&z2%%&r%%&zb%
				FIND $%&z0%=angle, ENVI &pb=%&z2%%&a%%&zb%
				FIND $%&z0%=length, ENVI &pb=%&z2%%&l%%&zb%
				SED &pb=0, ,,%&pb%
				EXIT FORX
			}
		}
		IFEX $%&y0%<1, EXIT LOOP
	}
	IFEX $%&R3.check%=1,ENVI &Calc=CALC -base=16
	IFEX $%&R4.check%=1,ENVI &Calc=CALC
	IFEX $%&R5.check%=1,ENVI &Calc=CALC -base=8
	IFEX $%&R6.check%=1,ENVI &Calc=CALC -base=2
	ENVI &l4=
	ENVI &l1=%&pb%
	FORX * %&FuHao3% ,&l2, SED &l1=0,\%&l2%, %&l2% ,%&l1%
	FORX * %&l1% ,&l3,
	{*
		SED &l5=?,\%,,%&l3%
		IFEX $%&l5%>0,
		{*
			MSTR -delims:% &l6,&l7=<1*>%&l3%
			FIND $%&l7%=, CALC &l3=%&l6%/100
		}
		ENVI &l4=%&l4%%&l3%
	}
	ENVI &pb=%&l4%
	SED &pd=0,0x[0-9a-fA-F]*,,%&pb%
	SED &pe=?,[\./a-zA-Z],,%&pd%
	IFEX $%&pe%>0, %&Calc% &pc=%&pb%#15g! %&Calc% #&pc=%&pb%
	IFEX $%&pc%=-0, ENVI &pc=0
	Loop_Change "%&pc%"
_END
_SUB Loop_Num *
	SET &yy=%1
	SET &yx=%2
	SET &yz=0
	SET &z6=
	LOOP #1=1,
	{*
		SED &z5=?:%&yz%,\%&yy%,,%&yx%
		STRL &yw=%&z6%
		MSTR &z6=1,%&z5%,%&yx%
		STRL &yv=%&z6%
		IFEX $%&yw%=%&yv%, TEAM SET &z5=| EXIT LOOP
		STRL &y2=%&z6%
		SED &z7=0,\(,,%&z6%
		STRL &y3=%&z7%
		CALC &y4=%&y2%-%&y3%  // ( 数量
		SED &z8=0,\),,%&z6%
		STRL &y5=%&z8%
		CALC &y6=%&y2%-%&y5%  // ) 数量
		IFEX $[ %&y4%=%&y6% | %&y4%=0 ], EXIT LOOP! CALC &yz=%&yz%+1
	}
_END
_SUB MyFUN *
	SET &h=%~1
	SET &c=%~2
	CALC &h=%&h%#15g
	CALC &c=%&c%#15g
	CALC &r=((%&c%/2)^2+%&h%^2)/(2*%&h%)#15g
	CALC &z=(%&c%/2)/%&r%#15g
	CALC &a=2*deg(arcsin(%&z%))#15g
	CALC &l=2*%&r%*pi*%&a%/360#15g
_END
_SUB Binary_Change
	FORX * 2 3 4 5 6 7 8 9 12 13 14 15 16 17 23 33 34 A G H I J K L M N Q R V W Z ,&p1, ENVI @&I%&p1%.Enable=0
	IFEX $%&R3.check%=1, TEAM LESS| ENVI @&I61.Enable=0| FORX * 2 3 4 5 6 7 8 9 12 13 14 15 16 17 ,&p2, ENVI @&I%&p2%.Enable=1
	IFEX $%&R4.check%=1, TEAM ENVI @&I61.Enable=1| FORX * 2 3 4 5 6 7 8 9 23 33 34 A G H I J K L M N Q R V W Z ,&p3, ENVI @&I%&p3%.Enable=1
	IFEX $%&R5.check%=1, TEAM LESS| ENVI @&I61.Enable=0| FORX * 2 3 4 5 6 7 ,&p4, ENVI @&I%&p4%.Enable=1
	IFEX $%&R6.check%=1, TEAM LESS| ENVI @&I61.Enable=0|
	FORX * 3 4 ,&p5, Vis_Labe &I3%&p5%
	Loop_Change
_END
_SUB Rad_Deg
	TEAM ENVI &rad=| ENVI &deg=| ENVI &s2=| ENVI &s4=| ENVI &sb=| ENVI &si=|
	GetPos &EC &PosStart &PosEnd
	ENVI &s1=%&EC%
	FIND $%&s1%=%Calc_Err%, ENVI &s1=
	FIND $%&s1%<>,
	{*
		IFEX $%&PosStart%>0, MSTR &s2=1,%&PosStart%,%&s1%  //截取光标前面的所有
		CALC #&s5=%&PosEnd%+1
		MSTR &s3=%&s5%,0,%&s1%   //截取光标后面的所有
		CALC #&s6=%&PosEnd%-%&PosStart%
		IFEX $%&s6%>0,   //有选中内容，截取选中内容
		{*
			CALC #&s7=%&PosStart%+1
			MSTR &s4=%&s7%,%&s6%,%&s1%
		}
	}
	FIND $%&s2%<>,
	{*  //%&s2%不为空
		MSTR &s8=-1,1,%&s2%
		SED &s9=?,\%&s8%,,%&FuHao2%
		SED &sa=?,\%&s8%,,)]}
		IFEX $%&sa%>0, ENVI &sb=*
		IFEX $%&s9%<1,  //%&s2%最后一个字符非运算符
		{*
			FIND $%2=,  //输入的是函数
			{*
				IFEX $%&s6%<1,  //无选中内容
				{*
					ENVI &sd=%&s2%
					FORX *  %&FuHao% ,&sc, SED &sd=0,\%&sc%, ,%&sd%
					MSTR &s4=<-1>%&sd%
					STRL &se=%&s4%
					CALC #&se=%&se%+1
					MSTR &s2=-%&se%,0,%&s2%
				}
				MSTR &sf=-1,1,%&s2%
				SED &sg=?,\%&sf%,,%&FuHao2%
				SED &sh=?,\%&sf%,,)]}
				FIND $%&s2%<>,!! IFEX $[ %&sg%<1 | %&sh%>0 ], ENVI &s2=%&s2%*
			}!    
			{*         //输入的是非函数
				ENVI &s2=%&s2%%2
			}
		}!   
		{*              //%&s2%最后一个字符是运算符
			FIND $%2<>,  //输入的是非函数
			{*
				Loop_Car "%&s2%" %&s4%%2 "%&sb%" &s2
			}!      
			{*  //输入的是函数
				ENVI &s2=%&s2%%&sb%
			}
		}
	}!    
	{*  //%&s2%为空
		ENVI &s2=%2
	}
	FIND $%I23%=角度, TEAM ENVI &rad=rad(%&s4%)| ENVI &deg=deg(| ENVI &si=)! ENVI &rad=%&s4%
	FIND $%1=&IG, ENVI &s2=%&s2%sin(%&rad%)
	FIND $%1=&IH, ENVI &s2=%&s2%cos(%&rad%)
	FIND $%1=&II, ENVI &s2=%&s2%tan(%&rad%)
	FIND $%1=&IJ, ENVI &s2=%&s2%ctg(%&rad%)
	FIND $%1=&IK, ENVI &s2=%&s2%%&deg%arcsin(%&s4%)%&si%
	FIND $%1=&IL, ENVI &s2=%&s2%%&deg%arccos(%&s4%)%&si%
	FIND $%1=&IM, ENVI &s2=%&s2%%&deg%arctan(%&s4%)%&si%
	FIND $%1=&IN, ENVI &s2=%&s2%%&deg%arcctg(%&s4%)%&si%
	FIND $%1=&IV, ENVI &s2=%&s2%sqrt(%&s4%)
	FIND $%1=&IW, ENVI &s2=%&s2%pow(%&s4%%dou%1/)
	FIND $%1=&IZ, ENVI &s2=%&s2%ln(%&s4%)
	FIND $%1=&I35, ENVI &s2=%&s2%rad(%&s4%)
	FIND $%1=&I36, ENVI &s2=%&s2%deg(%&s4%)
	FIND $%1=&I37, ENVI &s2=%&s2%pow10(%&s4%)
	FIND $%1=&I38, ENVI &s2=%&s2%lg(%&s4%)
	FIND $%1=&I39, ENVI &s2=%&s2%log(%&s4%%dou%)
	FIND $%1=&I40, ENVI &s2=%&s2%hypot(%&s4%%dou%)
	FIND $%1=&I41, ENVI &s2=%&s2%length(%&s4%%dou%)
	FIND $%1=&I42, ENVI &s2=%&s2%max(%&s4%%dou%)
	FIND $%1=&I43, ENVI &s2=%&s2%min(%&s4%%dou%)
	FIND $%1=&I44, ENVI &s2=%&s2%not(%&s4%)
	FIND $%1=&I45, ENVI &s2=%&s2%lnot(%&s4%)
	FIND $%1=&I46, ENVI &s2=%&s2%frac(%&s4%)
	FIND $%1=&I47, ENVI &s2=%&s2%floor(%&s4%)
	FIND $%1=&I48, ENVI &s2=%&s2%angle(%&s4%%dou%)
	FIND $%1=&I49, ENVI &s2=%&s2%shr(%&s4%%dou%)
	FIND $%1=&I50, ENVI &s2=%&s2%shl(%&s4%%dou%)
	FIND $%1=&I51, ENVI &s2=%&s2%div(%&s4%%dou%)
	FIND $%1=&I52, ENVI &s2=%&s2%xor(%&s4%%dou%)
	FIND $%1=&I53, ENVI &s2=%&s2%exp(%&s4%)
	FIND $%1=&I54, ENVI &s2=%&s2%mod(%&s4%%dou%)
	FIND $%1=&I55, ENVI &s2=%&s2%radius(%&s4%%dou%)
	FIND $%1=&I56, ENVI &s2=%&s2%round(%&s4%)
	FIND $%1=&I57, ENVI &s2=%&s2%rand(%&s4%)
	FIND $%1=&I58, ENVI &s2=%&s2%ceil(%&s4%)
	FIND $%1=&I59, ENVI &s2=%&s2%int(%&s4%)
	FIND $%1=&I60, ENVI &s2=%&s2%abs(%&s4%)
	SED &s2=0, ,,%&s2%
	SED &s3=0, ,,%&s3%
	Loop_Car "%&s2%" "" &sj
	FIND $%&s2%<>,
	{*
		FIND $%&s3%<>,
		{*
			MSTR &sk=-1,1,%&s2%
			MSTR &sl=1,1,%&s3%
			SED &sm=?,\%&sk%,,%&FuHao2%
			SED &sn=?,\%&sl%,,%&FuHao2%
			SED &so=?,\%&sk%,,)]}
			SED &sp=?,\%&sl%,,([{
			IFEX $[ %&so%>0 & %&sp%>0 ],! IFEX $[ %&so%>0 & %&sn%<1 ],! IFEX $[ %&sm%<1 & %&sp%>0 ],! EXIT BLOCK
			ENVI &s2=%&s2%*
		}
	}
	FIND $%&s2%<>,
	{*
		MSTR &sq=-2,0,%&s2%
		MSTR &sr=-2,1,%&s2%
		MSTR &ss=-1,1,%&s2%
		FIND $%&sr%<>,
		{*
			SED &st=?,\%&sr%,,%&FuHao2%
			SED &su=?,\%&ss%,,%&FuHao2%
			SED &sv=?,\%&sr%,,)]}
			SED &sw=?,\%&ss%,,([{
			IFEX $[ %&sv%>0 & %&sw%>0 ],! IFEX $[ %&sv%>0 & %&su%<1 ],! IFEX $[ %&st%<1 & %&sw%>0 ],! EXIT BLOCK
			ENVI &s2=%&sq%*%&ss%
			CALC #&sj=%&sj%+1
		}
	}
	Loop_Change "%&s2%%&s3%" %&sj%
_END
_SUB Loop_Car
	ENVI &x1=
	ENVI &x2=
	ENVI &x3=1
	LOOP #1=1,
	{*
		MSTR &x4=-%&x3%,1,%~1
		SED &x5=?,\%&x4%,,)]}
		IFEX $%&x5%<1, EXIT LOOP
		ENVI &x1=%&x1%%&x4%
		CALC &x3=%&x3%+1
	}
	STRL &x6=%~1
	SED &x7=?,\%~2,,%&FuHao2%
	SED &x8=?,\%~2,,([{
	IFEX $[ %&x3%=1 | %&x7%>0 ],  //没有括号，或输入的是运算符，就不要丢到括号里面去
	{*
		FIND $%~2=, ENVI-ret %~3=%&x6%
		FIND $%4<>,!! IFEX $%&x8%>0, ENVI-ret %~4=%~1%~3%2! ENVI-ret %~4=%~1%2
		EXIT _SUB
	}
	MSTR &x9=<~1>%&x1%
	CALC &xa=%&x3%-1
	CALC &xb=%&xa%+4
	CALC &xc=%&xa%+2
	MSTR &xd=-%&x3%,1,%~1
	MSTR &xe=-%&xa%,2,%~1
	MSTR &xf=-%&xa%,3,%~1
	MSTR &xg=-%&xa%,4,%~1
	MSTR &xh=-%&xa%,5,%~1
	SED &xi=?,\%&xd%,,%&FuHao2%
	ENVI &xj=()
	ENVI &xk=,)
	ENVI &xl=(,)
	ENVI &xm=,1/)
	ENVI &xn=(,1/)
	FIND $[ %&xh%=%&xn% | %&xg%=%&xm% ],
	{*
		ENVI &x2=1
		MSTR &xo=-%&xb%,0,%~1
		CALC #&x6=%&x6%-%&x3%-2
		FIND $%~2=, ENVI-ret %~3=%&x6%
		FIND $%4<>, ENVI-ret %~4=%&xo%%2,1/%&x9%
	}
	FIND $%&x2%=,
	{*
		FIND $[ %&xf%=%&xl% | %&xe%=%&xk% ],
		{*
			ENVI &x2=1
			MSTR &xo=-%&xc%,0,%~1
			CALC #&x6=%&x6%-%&x3%
			FIND $%~2=, ENVI-ret %~3=%&x6%
			FIND $%4<>, ENVI-ret %~4=%&xo%%2,%&x9%
		}
	}
	FIND $%&x2%=,
	{*
		IFEX $[ %&xi%<1 | '%&xe%'='%&xj%' ],
		{*
			ENVI &x2=1
			TEAM MSTR &xo=-%&x3%,0,%~1
			CALC #&x6=%&x6%-%&x3%+1
			FIND $%~2=, ENVI-ret %~3=%&x6%
			FIND $%4<>, ENVI-ret %~4=%&xo%%2%&x9%
		}
	}
	FIND $%&x2%=,
	{*
		CALC #&x6=%&x6%-%&x3%+1
		FIND $%~2=, ENVI-ret %~3=%&x6%
		FIND $%4<>, ENVI-ret %~4=%~1%~3%2
	}
_END
_SUB Loop_Change
	ENVI @&awk=1
	IFEX $%&R3.check%=1,ENVI &Calc=CALC -base=16
	IFEX $%&R4.check%=1,ENVI &Calc=CALC
	IFEX $%&R5.check%=1,ENVI &Calc=CALC -base=8
	IFEX $%&R6.check%=1,ENVI &Calc=CALC -base=2
	FIND $%~1=, SED &t1=0, ,,%&EC%! ENVI &t1=%~1
	FIND $%&t1%=, TEAM ENVI @&awk=0| EXIT
	FIND $%&t1%=%Calc_Err%, TEAM ENVI @&awk=0| EXIT
	SED &t1=0,≤,<=,%&t1%
	SED &t1=0,≦,<=,%&t1%
	SED &t1=0,≯,<=,%&t1%
	SED &t1=0,≥,>=,%&t1%
	SED &t1=0,≧,>=,%&t1%
	SED &t1=0,≮,>=,%&t1%
	SED &t1=0,……,^,%&t1%
	SED -t &t1=0,[%&quanjiao%],%&banjiao%,%&t1%
	FORX *  %&FuHao% ,&t2, SED &t1=0,\%&t2%, %&t2% ,%&t1%
	FORX *  %&HanShu% ,&t2, SED *ni &t1=0,%&t2% \(, %&t2%(,%&t1%
	SED &t1=0,\%&dou% 1 \/,%&dou%1/,%&t1%
	SED &t1=0,\< \=,<= ,%&t1%
	SED &t1=0,\> \=,>= ,%&t1%
	ENVI &t3=
	FORX *  %&t1% ,&t4,
	{*
		FIND $%&t3%<>,
		{*
			MSTR &t5=-1,1,%&t3%
			MSTR &t6=1,1,%&t4%
			SED &t7=?,\%&t5%,,)]}
			SED &t8=?,\%&t6%,,([{
			SED &t9=?,\%&t6%,,%&FuHao2%
			SED &ta=?,\%&t5%,,%&FuHao2%
			ENVI &tb=%&t4%
			FORX * %&FuHao% ,&tc, SED &tb=0,\%&tc%,\\%&tc%,%&tb%
			SED *ni &tc=?,%&tb%,,%&HanShu2%
			IFEX $[ %&ta%<1 & %&tc%>0 ], TEAM ENVI &t3=%&t3%*| EXIT BLOCK  // 1 sin(
			IFEX $[ %&t7%>0 & %&t8%>0 ], TEAM ENVI &t3=%&t3%*| EXIT BLOCK  // ) (
			IFEX $[ %&t7%>0 & %&t9%<1 ], TEAM ENVI &t3=%&t3%*| EXIT BLOCK  // ) 2
			IFEX $[ %&ta%<1 & %&t8%>0 ], TEAM ENVI &t3=%&t3%*| EXIT BLOCK  // 3 (
		}
		ENVI &tb=
		FORX *  %&FuHao% ,&t2,
		{*
			SED &tb=?,\%&t2%,,%&t4%
			IFEX $%&tb%>0, TEAM ENVI &t3=%&t3%%&t4%| EXIT FORX
		}
		IFEX $[ %&tb%<1 & %&R4.check%=1 ],
		{*
			FORX *  %&HanShu2% ,&t2,
			{*
				MSTR &tc=1,1,%&t2%
				MSTR &td=1,2,%&t2%
				MSTR &te=1,3,%&t2%
				MSTR &tf=1,4,%&t2%
				MSTR &tg=1,5,%&t2%
				MSTR &th=1,6,%&t2%
				MSTR &ti=1,7,%&t2%
				FIND $[ %&t4%=%&tc% | %&t4%=%&td% | %&t4%=%&te% | %&t4%=%&tf% | %&t4%=%&tg% | %&t4%=%&th% | %&t4%=%&ti% ], TEAM ENVI &tb=1| ENVI &t3=%&t3%%&t4%| EXIT FORX
			}
		}
		IFEX $%&tb%>0, EXIT -
		MSTR &t2=1,2,%&t4%
		FIND $[ %&t2%=0x | %&t2%=0o | %&t2%=0b ],
		{*
			ENVI &tk=1
			LOOP #1=1,
			{*
				MSTR &ti=3,1,%&t4%
				MSTR &tj=4,1,%&t4%
				FIND $[ %&ti%=0 & '%&tj%'<>'' ], SED &t4=1:1,0,,%&t4%! EXIT LOOP
				CALC &tk=%&tk%+1
			}
		}!    
		{*
			ENVI &tk=1
			LOOP #1=1,
			{*
				MSTR &ti=1,1,%&t4%
				MSTR &tj=2,1,%&t4%
				FIND $[ %&ti%=0 & '%&tj%'<>'' & '%&tj%'<>'.' ], SED &t4=1:0,0,,%&t4%! EXIT LOOP
				CALC &tk=%&tk%+1
			}
		}
		IFEX $%&R4.check%=1,
		{*
			FORX *  e pi ,&t2,
			{*
				FIND $%&t4%=%&t2%, TEAM ENVI &tb=1| ENVI &t3=%&t3%%&t4%| EXIT FORX
			}
		}
		IFEX $[ %&tb%<1 & %&R4.check%=1 ],
		{*
			SED &t2=0,[^0-9.],,%&t4%
			SED &ti=?:0,\.,,%&t2%   //小数点只能出现一次
			SED &tj=?:1,\.,,%&t2%
			IFEX $[ '%&t2%'='%&t4%' & %&tj%<1 & %&ti%>0 ],
			{*
				ENVI &tb=1
				MSTR -delims:. &tl=<1>%&t4%
				MSTR -delims:. &tm=<2>%&t4%
				LOOP #1=1,  //整数部分，删前面的0
				{*
					MSTR &tp=1,1,%&tl%
					FIND $%&tp%=0, MSTR &tl=2,0,%&tl%! EXIT LOOP
				}
				FIND $%&tl%=,  //整数部分为0
				{*
					LOOP #1=1,  //小数部分，删前面的0
					{*
						MSTR &tp=1,1,%&tm%
						FIND $%&tp%=0, MSTR &tm=2,0,%&tm%! EXIT LOOP
					}
				}
				LOOP #1=1,  //小数部分删后面的0
				{*
					MSTR &tp=-1,1,%&tm%
					FIND $%&tp%=0, MSTR &tm=-2,0,%&tm%! EXIT LOOP
				}
				ENVI &tn=%&tl%%&tm%
				SED &tn=0, ,,%&tn%
				STRL &tk=%&tn%
				IFEX $%&tk%>15, TEAM ENVI &t3=%Calc_Err%| EXIT FORX
				TEAM ENVI &t3=%&t3%%&t4%| EXIT BLOCK
			}
		}
		IFEX $%&tb%<1,
		{*
			MSTR &t2=1,2,%&t4%
			FIND $[ %&t2%<>0x & %&t2%<>0o & %&t2%<>0b ],
			{*
				SED &t2=0,[^0-9.],,%&t4%
				SED &tn=?,[skmgtSKMGT],,%&t4%
				FIND $[ %&t2%<>%&t4% & %&tn%<1 ], ENVI &t4=0x%&t4%
			}
			FIND $[ %&t4%=0 | %&t4%=0x0 | %&t4%=0o0 | %&t4%=0b0 ], TEAM ENVI &t3=%&t3%0| EXIT BLOCK
			FIND $[ %&t4%=0x | %&t4%=0o | %&t4%=0b ], TEAM ENVI &t3=%&t3%0| EXIT BLOCK
			ENVI &Calc2=
			MSTR &t2=1,2,%&t4%
			FIND $%&t2%=0x, ENVI &Calc2=CALC -base=16
			FIND $%&t2%=0o, ENVI &Calc2=CALC -base=8
			FIND $%&t2%=0b, ENVI &Calc2=CALC -base=2
			FIND $%&Calc2%=, ENVI &Calc2=CALC
			%&Calc2% #&tl=0x7FFFFFFFFFFFFFFF  //这个是最大值  //-0x8000000000000000  这个是最小值
			%&Calc% &tu=%&t4%
			MSTR -delims:. &t4=<1>%&t4%
			STRL &tn=%&tl%
			STRL &to=%&t4%
			IFEX $[ %&to%>%&tn% | %&t4%>0x7FFFFFFFFFFFFFFF ], TEAM ENVI &t3=%Calc_Err%| EXIT FORX
			%&Calc% #&tp=0x7FFFFFFFFFFFFFFF
			%&Calc% #&tq=%&t4%
			CALC #&tr=%&tq%
			CALC #&ts=%&t4%
			IFEX $[ %&tq%>%&tp% | %&tq%<0 ], TEAM ENVI &t3=%Calc_Err%| EXIT FORX
			IFEX $[ %&tq%<>0 & '%&tr%'<>'%&ts%' ], TEAM ENVI &t3=%Calc_Err%| EXIT FORX! ENVI &t3=%&t3%%&tu%
		}
	}
	SED &t3=0, ,,%&t3%
	FIND $'%&EC%'<>'%&t3%',
	{*
		ENVI @&EC=%&t3%
		ENVI &tt=
		FIND $%~1<>, FIND $%~2<>, FIND $%~1=%&t3%, ENVI &tt=%~2
		FIND $%&tt%=, Loop_Car "%&t3%" "" &tt
		SetPos %&tt%
	}
	ENVI @&awk=0
_END
