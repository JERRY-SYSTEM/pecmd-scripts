code=950T936
logs
set^ EnviMode=1
set^ ForceLocal=1
set wm_lbuttondown=0x0201
call $--ret:ret user32.dll,SetProcessDPIAware
set ?adminMODE=IsAdmin
ifex $%adminMODE%<>1, team mess=+icon6. 请以管理员身份运行！ @错误#OK*5000| exit
set Win_Title=< PassPass >制作：Jet Chan    QQ：527104427
mstr * Build=<-1>pecmdbuild
sed Build=0,[^0-9],,%Build%
ifex $[ %pecmdver%<201201880594 | %Build%<20220825 ], team mess=+icon6. PECMD 版本低于 201201.88.05.94  Build: 2022-08-25，程序无法运行！ @%Win_Title%   #OK*5000| exit
set dll1=System32\msv1_0.dll
set dll2=System32\NtlmShared.dll
set exe=System32\winlogon.exe
scrn ,,,,,,LogPixels
set Font_Size=9
set Wide=688
set High=142
call @main
exit
_sub main,w%Wide% h%High%,%Win_Title%,kill *force *%__pid%,%MyName%,,, -scalef:%LogPixels% -scale:%LogPixels%
	set @this.pos=?::Wide2:High2
	set @this.HitTest=%High2%:::20
	ifex $[ %Wide2%=%Wide% | %High2%=%High% ], set @this.pos=::%Wide%:%High%
	ifex %windir%\fonts\simsun*, set @this.Font=%Font_Size%:simsun! set @this.Font=%Font_Size%
	labe ,l11 t15 w661 h22,选择操作系统所在分区:                             (支持 Windows 2000/2003/XP/Vista/7/8/8.1/10/11 - 32/64 位),,
	list -h list,l11 t39 w661 h200,,,,0x20104
	labe help,l11 t77 w40 h31,官网,exec $https://pecmd.net/thread-424.htm,0xA00000,11:**BU  //0xDF0029
	labe labe,l51 t78 w275 h30,,,0xff0000
	item item1,l326 t68 w60 h30,备份DLL,call bakdll 备份,
	item item2,l401 t68 w60 h30,恢复DLL,call bakdll 恢复,
	item item3,l476 t68 w91 h30,禁止密码验证,call dispwd 禁止,
	item item4,l582 t68 w91 h30,恢复密码验证,call dispwd 恢复,
	call Cursor item1 item2 item3 item4
	set @this.Visible=1
	wait 0.9
	set @list.ID=?WidHandlelist
	thread* call findSystem
_end
_sub Cursor
	forx * %* ,bwg, set @%bwg%.Cursor=32649  //32651
_end
_sub findSystem
	set @labe=正在搜索 Windows 系统，请稍等...
	call enable 0
	set systemlist=
	set drvlist=
	part list disk,alldisk
	forx *v alldisk,onedisk,
	{*
		part list part %onedisk%,partlist
		sed -ex partlist=0,[-\@][1-9][0-9]*[ ]*,,partlist
		forx *v partlist,onepartRel,
		{*
			part -iv=8 list part %onedisk%#%onepartRel%,drv1
			mstr * drv=1,2,drv1
			find *<>drv,
			{*
				set< drvlist=%drv1%
				set part=%drv%
			}!   
			{*
				|set drv=  |
				sed -ex onepart=0,\=,,onepartRel
				find *onepart=onepartRel, set part=\\?\GLOBALROOT\device\harddisk%onedisk%\partition%onepart%! set part=
			}
			find *<>part, call getSystemMsg "%part%"
		}
	}
	sed -ex drvlist=0,:,,drvlist
	sed -ex drvlist=0,{.},\1 ,drvlist
	fdrv alldrv=*
	forx *v drvlist,drv1, sed -ex alldrv=0,%drv1%,,alldrv
	find *<>alldrv,
	{*
		forx *v alldrv,drv,
		{*
			|set onedisk= |
			|set onepartRel= |
			call getSystemMsg "%drv%:"
		}
	}
	set @list.val=%systemlist%
	set @list.isel=1
	call enable 1
	set @labe=提示：禁止密码验证后，可用任意密码登陆系统
	set @@sendmsg=%WidHandlelist%;%wm_lbuttondown%;0;0
_end
_sub getSystemMsg *
	forx @%~1\*,dirlist,0,*
	forx *nl dirlist,onedir,
	{*
		ifex [ ( %onedir%\%dll1% ) & ( %onedir%\%exe% ) ],
		{*
			find *=drv,
			{*
				mstr * -delims:\ dir=<8->onedir
				set sysdir=%drv%\%dir%
			}!   
			{*
				set sysdir=%onedir%
			}
			fdrv -vol label,fileSystem=%~1
			call getSysVer "%onedir%\%dll1%"
			set os=
			ifex $%ver%>=5.0,                      set os=Windows 2000
			ifex $%ver%>=5.1,                      set os=Windows XP
			ifex $%ver%>=5.2,                      set os=Windows XP 64位 / Server 2003
			ifex $%ver%>=6.0,                      set os=Windows Vista / Server 2008
			ifex $%ver%>=6.1,                      set os=Windows 7 / Server 2008 R2
			ifex $%ver%>=6.2,                      set os=Windows 8 / Server 2012
			ifex $%ver%>=6.3,                      set os=Windows 8.1 / Server 2012 R2
			ifex $%ver%>=10.0,                     set os=Windows 10 (%ver3%) / Server 2016-2019
			ifex $[ %ver%>=10.0 & %ver3%>=22000 ], set os=Windows 11 (%ver3%) / Server 2022
			find *=os,                             set os=Windows %ver% (%ver3%)
			set< systemlist=%onedisk%#%onepartRel% * "%sysdir%" * %sysbit% * %os% * %fileSystem% * %label%|
		}
	}
_end
_sub bakdll
	set @labe=正在%~1DLL，请稍等...
	call enable 0
	call setdll
	set err=
	set ret=
	find $%~1=备份,
	{*
		set exitcode=0
		ifex %file%.pas,
		{*
			mess=+icon1. 备份文件已存在，是否替换？ @提示#yn$y
			find $%yesno%=no, set exitcode=1
		}
		ifex $%exitcode%=0,
		{*
			file %file%=>%file%.pas
			set ret=%error%
			ifex $%ret%<>0, set err=备份失败，拒绝写入！
		}
	}
	find $%~1=恢复,
	{*
		ifex %file%.pas,
		{*
			file %file%.pas=>%file%
			set ret=%error%
			ifex $%ret%<>0, set err=恢复失败，拒绝写入！
		}!   
		{*
			set err=备份文件不存在！
		}
	}
	ifex $%exitcode%=0,!! find *<>err, mess=+icon6. %err% @错误 %ret%#ok*5000! mess=+icon2. 成功完成！ @提示#ok*5000
	call enable 1
	set @labe=提示：禁止密码验证后，可用任意密码登陆系统
_end
_sub enable
	set @item1.enable=%1
	set @item2.enable=%1
	set @item3.enable=%1
	set @item4.enable=%1
	set @list.enable=%1
_end
_sub setdll *
	mstr * -rq++ -trim++ partid,sysdir=<1><3>list
	mstr * -delims:\ drv,dir=<1><2->sysdir
	find *=drv,
	{*
		sed -ex partid=0,[^0-9], ,partid
		mstr * disk,part=<1*>partid
		set sysdir=\\?\GLOBALROOT\device\harddisk%disk%\partition%part%\%dir%
	}
	call getSysVer "%sysdir%\%dll1%"
	ifex $%ver%>=10.0, set file=%sysdir%\%dll2%! set file=%sysdir%\%dll1%
_end
_sub dispwd
	set @labe=正在%~1密码验证，请稍等...
	call enable 0
	call setdll
	set rpatt=
	find $%sysbit%=x86,
	{*
		                                       team set patt=0x83 0xF8 0x10|           set rpatt=0x33 0xC0 0x90
		ifex $%ver%>=6.2,                      team set patt=0x3B 0xC6 0x75 0x13|      set rpatt=0x33 0xC0 0x75 0x13
		ifex $%ver%>=6.3,                      team set patt=0x4d 0x3b 0xc6 0x0F 0x85| set rpatt=0x4d 0x33 0xc0 0x0F 0x85
		ifex $%ver%>=10.0,                     team set patt=0x10 0x3B 0xC7 0x0F|      set rpatt=0x10 0x33 0xC0 0x0F
		ifex $[ %ver%>=10.0 & %ver3%>=17763 ], team set patt=0x10 0x3B 0xC6 0x0F|      set rpatt=0x10 0x33 0xC0 0x0F
	}
	find $%sysbit%=x64,
	{*
		                                       team set patt=0x48 0x3B 0xC6 0x0F 0x85|                     set rpatt=0x33 0xC0 0x90 0x0F 0x85
		ifex $%ver%>=6.2,                      team set patt=0x49 0x3B 0xC6 0x0F 0x85|                     set rpatt=0x33 0xC0 0x90 0x0F 0x85
		ifex $%ver%>=6.3,                      team set patt=0x49 0x3B 0xC6 0x0F 0x85|                     set rpatt=0x33 0xC0 0x90 0x0F 0x85
		ifex $%ver%>=10.0,                     team set patt=0x49 0x3B 0xC6 0x0F 0x85|                     set rpatt=0x33 0xC0 0x90 0x0F 0x85
		ifex $[ %ver%>=10.0 & %ver3%>=17763 ], team set patt=0x49 0x3B 0xC6 0x0F|                          set rpatt=0x90 0x33 0xC0 0x0F
		ifex $[ %ver%>=10.0 & %ver3%>=19041 ], team set patt=0x0F 0x1F 0x44 0x00 0x00 0x49 0x3B 0xC6 0x0F| set rpatt=0x90 0x90 0x90 0x90 0x90 0x90 0x33 0xC0 0x0F
	}
	find $%~1=恢复,
	{*
		set v1=%patt%
		set v2=%rpatt%
		set patt=%v2%
		set rpatt=%v1%
	}
	set err=
	set ret=
	find *<>patt,
	{*
		set#$ pattstr=%patt%
		strl -bin len=pattstr
		getf -find %file%,0#*#%len%#0#1#0,*pos,*pattstr
		set ret=%error%
		find $%pos%=0xFFFFFFFF, set err=错误%pos%，搜索字符串出错！
		ifex $%pos%<=0, set err=错误，无需%~1！
		ifex [ $%pos%>0 & *=err ],
		{*
			ifex ! %file%.pas, file %file%=>%file%.pas
			forx *v pos,pos1,
			{*
				putf %file%,%pos1%,%rpatt%
				set ret=%error%
				ifex $%ret%<>0, team set err=错误，写入失败！| exit
			}
		}
	}
	find *<>err, mess=+icon6. %err% @错误 %ret%#ok*5000! mess=+icon2. 成功完成！ @提示#ok*5000
	call enable 1
	set @labe=提示：禁止密码验证后，可用任意密码登陆系统
_end
_sub getSysVer *
	set ?sysbit=pebit,%~1
	site ?sysver=fver,%~1
	mstr * -delims:. ver1,ver2,ver3=<1><2><3>sysver
	find *<>ver2, set> ver2=.
	set ver=%ver1%%ver2%
_end
