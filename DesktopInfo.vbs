Code=936T950
ENVI^ FORCELOCAL=1
ENVI^ EnviMode=1
ENVI$ &NL=0d 0a
ENVI^ zero=1
FIND $%~1=/S, ENVI &CANSHU=1
NAME &Config=%&MyName%
IFEX %&CurDir%\%&Config%.ini,
{*
	READ "%&CurDir%\%&Config%.ini",**,&ConfigID
	FORX *NL &ConfigID,&ConfigT,
	{*
		MSTR -delims:= &Astr,&ConfigB=<1><2>%&ConfigT%
		MSTR &iPs,&iPos,&art,&iYc=<1><2><3><4>%&ConfigB%
		FIND $%&Astr%=Pos,ENVI &DAIST=%&iPs%
		FIND $%&Astr%=MAX, ENVI &Maxsr=%&iPs%
		FIND $%&Astr%=运行时间,TEAM ENVI &LeftRT=%&iPs%| ENVI &RightRT=%&iPos%| ENVI &Timeyc=%&art%
		FIND $%&Astr%=操作系统,TEAM ENVI &LeftSM=%&iPs%| ENVI &RightSM=%&iPos%| ENVI &temyc=%&art%
		FIND $%&Astr%=启动模式,TEAM ENVI &LeftST=%&iPs%| ENVI &RightST=%&iPos%| ENVI &upTodeyc=%&art%
		FIND $%&Astr%=计算机名,TEAM ENVI &LeftCN=%&iPs%| ENVI &RightCN=%&iPos%| ENVI &Computeryc=%&art%
		FIND $%&Astr%=主板型号,TEAM ENVI &LeftMD=%&iPs%| ENVI &RightMD=%&iPos%| ENVI &Mainyc=%&art%
		FIND $%&Astr%=主板序号,TEAM ENVI &LeftJHAO=%&iPs%| ENVI &RightJHAO=%&iPos%| ENVI &Hostyc=%&art%
		FIND $%&Astr%=电池信息,TEAM ENVI &LeftBY=%&iPs%| ENVI &RightBY=%&iPos%| ENVI &Battyc=%&art%
		FIND $%&Astr%=处理器,TEAM ENVI &LeftCU=%&iPs%| ENVI &RightCU=%&iPos%| ENVI &CPUyc=%&art%
		FIND $%&Astr%=物理内存,TEAM ENVI &LeftMY=%&iPs%| ENVI &RightMY=%&iPos%| ENVI &RightMYo=%&art%| ENVI &Memyc=%&iYc%
		FIND $%&Astr%=图形显卡,TEAM ENVI &LeftGC=%&iPs%| ENVI &RightGC=%&iPos%| ENVI &Grapyc=%&art%
		FIND $%&Astr%=磁盘信息,TEAM ENVI &LeftDK=%&iPs%| ENVI &RightDK=%&iPos%| ENVI &Diskyc=%&art%
		FIND $%&Astr%=网络连接,TEAM ENVI &LeftNK=%&iPs%| ENVI &RightNK=%&iPos%| ENVI &Networkyc=%&art%
		FIND $%&Astr%=网络速率, TEAM ENVI &LeftTE=%&iPs%| ENVI &RightTE=%&iPos%| ENVI &RightTEo=%&art%| ENVI &Netrateyc=%&iYc%|EXIT FORX
	}
	FIND $%&LeftBY%=, ENVI &LeftBY=0x00FFFF
	FIND $%&RightBY%=, ENVI &RightBY=0xF5F5F8
	FIND $%&LeftJHAO%=, ENVI &LeftJHAO=0x00FFFF
	FIND $%&RightJHAO%=, ENVI &RightJHAO=0xF5F5F8
	FIND $%&LeftTE%=, ENVI &LeftTE=0x00FFFF
	FIND $%&RightTE%=, ENVI &RightTE=0x00FF80
	FIND $%&RightTEo%=, ENVI &RightTEo=0xF5F5F8
	FIND $%&RightMYo%=, ENVI &RightMYo=0x00FFFF
}!
{*
	TEAM ENVI &LeftRT=0x00FFFF| ENVI &RightRT=0xF5F5F8| ENVI &LeftST=0x00FFFF| ENVI &RightST=0xF5F5F8| ENVI &LeftCN=0x00FFFF| ENVI &RightCN=0xF5F5F8| ENVI &LeftMD=0x00FFFF| ENVI &RightMD=0xF5F5F8
	TEAM ENVI &LeftSM=0x00FFFF| ENVI &RightSM=0xF5F5F8| ENVI &LeftCU=0x00FFFF| ENVI &RightCU=0xF5F5F8| ENVI &LeftMY=0x00FFFF| ENVI &RightMY=0xF5F5F8| ENVI &RightMYo=0x00FFFF| ENVI &RightTEo=0xF5F5F8
	TEAM ENVI &LeftGC=0x00FFFF| ENVI &RightGC=0xF5F5F8| ENVI &LeftNK=0x00FFFF| ENVI &RightNK=0xF5F5F8| ENVI &LeftDK=0x00FFFF| ENVI &RightDK=0xF5F5F8| ENVI &LeftTE=0x00FFFF| ENVI &RightTE=0x00FF80
	TEAM ENVI &LeftJHAO=0x00FFFF| ENVI &RightJHAO=0xF5F5F8| ENVI &LeftBY=0x00FFFF| ENVI &RightBY=0xF5F5F8| ENVI &RightBYO=0x00FFFF| ENVI &Mr=1
}
IFEX #%&Maxsr%=0, ENVI &Maxsr=0
IFEX #%&DAIST%=0, ENVI &DAIST=0
IFEX #%&Timeyc%=0, ENVI &Timeyc=0
IFEX #%&temyc%=0, ENVI &temyc=0
IFEX #%&upTodeyc%=0, ENVI &upTodeyc=0
IFEX #%&Computeryc%=0, ENVI &Computeryc=0
IFEX #%&Mainyc%=0, ENVI &Mainyc=0
IFEX #%&Hostyc%=0, ENVI &Hostyc=0
IFEX #%&Battyc%=0, ENVI &Battyc=0
IFEX #%&CPUyc%=0, ENVI &CPUyc=0
IFEX #%&Memyc%=0, ENVI &Memyc=0
IFEX #%&Grapyc%=0, ENVI &Grapyc=0
IFEX #%&Diskyc%=0, ENVI &Diskyc=0
IFEX #%&Networkyc%=0, ENVI &Networkyc=0
IFEX #%&Netrateyc%=0, ENVI &Netrateyc=0
IFEX %SystemRoot%\System32\ntoskrnl.exe,
{*
	ENVI ?&SysBit,3=PEBIT,%SystemRoot%\System32\ntoskrnl.exe
	SITE ?,&SysVer=FVER,%SystemRoot%\System32\ntoskrnl.exe
}!
{*
	ENVI ?&SysBit,3=PEBIT,%SystemRoot%\System32\ntkrnlpa.exe
	SITE ?,&SysVer=FVER,%SystemRoot%\System32\ntkrnlpa.exe
}
ENVI ?&VER=WinVer
RSTR &aStrVer=4,%&VER%
CALC #&aStrVer=0x%&aStrVer%
MSTR -delims:. &VENar,&TStrVer,&SysVer=<1><2><-1>%&SysVer%
ENVI &::VENar=%&VENar%
FIND $%&VENar%=10,
{*
	IFEX #%&aStrVer%>=22000, ENVI &Winver=11! ENVI &Winver=10
}
FIND $%&VENar%.%&TStrVer%=6.3, ENVI &Winver=8.1
FIND $%&VENar%.%&TStrVer%=6.2, ENVI &Winver=8
FIND $%&VENar%.%&TStrVer%=6.1, ENVI &Winver=7
FIND $%&VENar%.%&TStrVer%=6.0, ENVI &Winver=Vista
FIND $%&VENar%.%&TStrVer%=5.2, ENVI &Winver=2003
FIND $%&VENar%.%&TStrVer%=5.1, ENVI &Winver=XP
FIND $%&VENar%.%&TStrVer%=5.0, ENVI &Winver=2000
ENVI ?&ispe=ispe
FIND $%&ispe%=0,ENVI &ispe=! ENVI &ispe=PE
REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName,&CoName
REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\NV Hostname,&CNa
FIND $%&CNa%=,! ENVI &CoName=%&CNa%
DEVI listdev:&GraphicsID *listdev=c *devid:"PCI\CC_0302""PCI\CC_0380""PCI\CC_0300" *inst
MSTR &GCard=<#>%&GraphicsID%
IFEX #0=%&GCard%,ENVI &GCard=1
ENVI &BootMODE=Unknown0
ENVI$# &ret=*4 0
CALL $--qd --bool --ret:&Ast %SystemRoot%\System32\Kernel32.dll,GetFirmwareType,*&ret
FIND $%&Ast%=,
{*
	CALL $--ret:&Ast %SystemRoot%\System32\Kernel32.dll,GetFirmwareEnvironmentVariableW,"",{00000000-0000-0000-0000-000000000000},0,0
	CALL $--ret:&modeon %SystemRoot%\System32\Kernel32.dll,GetLastError, ""
	IFEX #%&modeon%=998,ENVI &BootMODE=UEFI
	IFEX #%&modeon%=1,ENVI &BootMODE=Legacy
}!  
{*
	IFEX #%&Ast%=0,!
	{*
		ENVI?int &ret=&ret
		IFEX #%&ret%=0,ENVI &BootMODE=Unknown0
		IFEX #%&ret%=1,ENVI &BootMODE=Legacy
		IFEX #%&ret%=2,ENVI &BootMODE=UEFI
		IFEX #%&ret%=3,ENVI &BootMODE=Unknown9
	}
}
FIND $[ '%&BootMODE%'='Unknown0' | '%&BootMODE%'='Unknown9' ],
{*
	ENVI ?$&BootMODE=FVAR,BootOrder
	FIND *&BootMODE=,ENVI &BootMODE=Legacy! ENVI &BootMODE=UEFI
}
REGI --qk --init #HKLM\SYSTEM\CurrentControlSet\Control\SecureBoot\State\UEFISecureBootEnabled,&UEFIBoot
FIND $%&BootMODE%=Legacy,
{*
	ENVI &BIOSS=当前模式不支持
}!
{*
	FIND $%&UEFIBoot%=0x1, ENVI &BIOSS=已启用! ENVI &BIOSS=已禁用
}
SET$ &ToMemory=*16 0
CALL $--qd --ret:&&Astr %SystemRoot%\System32\Kernel32.dll,GetPhysicallyInstalledSystemMemory,*&ToMemory
ENVI?long &ToMemory=&TotalMemory
CALC &TotalMemory=%&TotalMemory% / 1M #2
IFEX $%&TotalMemory%<0.1,
{*
	IFEX MEMA=?,&TotalMemory
	CALC &TotalMemory=%&TotalMemory% / 1K #2
}
ENVI$ &CPUThread=*48 1
CALL $--qd --ret:&&Astr %SystemRoot%\System32\Kernel32.dll,GetSystemInfo,*&CPUThread
ENVI?short &CPUThread=&CPUThread:32
CALC #&CPUThread=%&CPUThread%
CALC #&cu=%&CPUThread% * 128 + 32
ENVI$ &CountCPU=*%&cu% 66
ENVI$ &ProCoreCount=%&cu%
CALL $--qd --ret:&&Astr %SystemRoot%\System32\Kernel32.dll,GetLogicalProcessorInformation,*&CountCPU,*&ProCoreCount
ENVI?short &ProCoreCount=&ProCoreCount
ENVI-make &CountCPU=&CountCPU@0;%&ProCoreCount%
ENVI &ai=-24
ENVI &ProCount=0
ENVI &CacheL1=0
ENVI &CacheL2=0
ENVI &CacheL3=0
LOOP %&ProCoreCount%>1,
{*
	CALC #&ai=%&ai% + 32
	ENVI?short &CountCPU=&&Ts:%&ai%
	ENVI?char &CountCPU=&&Hs:(%&ai%+8)
	IFEX #%&Hs%=1, TEAM ENVI?int &CountCPU=&C1:(%&ai%+12)| CALC #&CacheL1=%&CacheL1%+%&C1%
	IFEX #%&Hs%=2, TEAM ENVI?int &CountCPU=&C2:(%&ai%+12)| CALC #&CacheL2=%&CacheL2%+%&C2%
	IFEX #%&Hs%=3, TEAM ENVI?int &CountCPU=&C3:(%&ai%+12)| CALC #&CacheL3=%&CacheL3%+%&C3%
	IFEX #%&Ts%>0,EXIT -
	IFEX #%&ai%>%&ProCoreCount%, EXIT LOOP
	CALC #&ProCount=%&ProCount% + 1
}
IFEX #%&CacheL1%>1047552, TEAM CALC &CacheL1=%&CacheL1% / 1M| ENVI &CacheL1=%&CacheL1%MB! TEAM CALC #&CacheL1=%&CacheL1% / 1K| ENVI &CacheL1=%&CacheL1%KB
IFEX #%&CacheL2%>1047552, TEAM CALC &CacheL2=%&CacheL2% / 1M| ENVI &CacheL2=%&CacheL2%MB! TEAM CALC #&CacheL2=%&CacheL2% / 1K| ENVI &CacheL2=%&CacheL2%KB
IFEX #%&CacheL3%>1047552, TEAM CALC &CacheL3=%&CacheL3% / 1M| ENVI &CacheL3=%&CacheL3%MB! TEAM CALC #&CacheL3=%&CacheL3% / 1K| ENVI &CacheL3=%&CacheL3%KB
ENVI &CountCPU=
IFEX #%&ProCount%>%&CPUThread%,ENVI &ProCount=%&CPUThread%
REGI --qk --init #HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0\~MHz,&MHzName
CALC #&MHzName=%&MHzName%
ENVI &ProCoreCount=核心：%&ProCount%  线程：%&CPUThread%
REGI --qk --init $HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0\ProcessorNameString,&ProName
MSTR &CNa,&CNa2,&CNa3,&CNa4,&CNa5,&CNa6,&CNa7,&CNa8,&CNa9=<1*>%&ProName%
ENVI &ProName=%&CNa% %&CNa2% %&CNa3% %&CNa4% %&CNa5% %&CNa6% %&CNa7% %&CNa8% %&CNa9%
SCRN &ScarW,&Scart
CALL $--ret:&hdc user32.dll,GetDC,#0
CALL $--ret:&IXELSX %SystemRoot%\System32\Gdi32.dll,GetDeviceCaps,#%&hdc%,#88
IFEX #[ %&Scart%>1080 & %&IXELSX%=96 & %&Mr%=1 ], ENVI &Maxsr=1
IFEX #%&Maxsr%=0,TEAM ENVI &Tro=100|ENVI &Hcr=10|ENVI &HcA=9|ENVI &Hcn=+1|ENVI &IST=%&DAIST%
IFEX #%&Maxsr%=1,TEAM ENVI &Tro=112|ENVI &Hcr=11|ENVI &HcA=10|ENVI &Hcn=+2| CALC #&IST=%&DAIST% - 50
IFEX #%&Maxsr%=2,TEAM ENVI &Tro=124|ENVI &Hcr=12|ENVI &HcA=10|ENVI &Hcn=+3| CALC #&IST=%&DAIST% - 60
IFEX #%&Maxsr%=3,TEAM ENVI &Tro=130|ENVI &Hcr=13|ENVI &HcA=10|ENVI &Hcn=+3| CALC #&IST=%&DAIST% - 110
IFEX #%&IXELSX%>96,
{*
	CALC &Tro=%&IXELSX% / 96 * 100 + %&Tro% - 100 #0
	IFEX #%&Maxsr%=0,ENVI &IST=%&DAIST%+20
	IFEX #%&Maxsr%=1,CALC #&IST=%&DAIST%+10
	IFEX #%&Maxsr%=2,CALC #&IST=%&DAIST%-30
	IFEX #%&Maxsr%=3,CALC #&IST=%&DAIST%-80
	CALC &IST=%&IST% - %&IXELSX% / 96 * 100 #0
	ENVI &dPINFO=DPI：%&IXELSX%
}
ENVI &MaxsE=%&Maxsr%
IFEX #%&IST%>0, ENVI &IST=+%&IST%
FIND $%&IST%=0, ENVI &IST=
CALC #&ights=%&ScarW% - 380 %&IST%
ENVI$# &Battery=*0xC 68
CALL $--qd --ret:&ST %SystemRoot%\System32\Kernel32.dll,GetSystemPowerStatus,*&Battery
ENVI?char &Battery=&ACLine:0
ENVI?char &Battery=&BatteryFlag:1
ENVI?char &Battery=&BatteryLifePercent:2
IFEX #%&BatteryFlag%>127,
{*
	REGI --qk --init --ak HKLM\SYSTEM\CurrentControlSet\Enum\ACPI\ACPI0003\,&Laptop
	FIND $%&Laptop%=, ENVI &::Battry=无电池! ENVI &Batteryhelp=1
}!
{*
	ENVI &Batteryhelp=1
}
IFEX #%&ACLine%=1, ENVI &ACLine=AC电源已连接! ENVI &ACLine=电池使用中
CALL @DrvMGR
EXIT File
_SUB DrvMGR,L%&ights%T15W450H%&Scart%,,,,-#:,-nfocus -ntab -disaltmv -forcenomin,-scale:%&Tro% 
	IFEX #%&Netrateyc%=0,! ENVI &Networkyc=1
	ENVI &ncxst=0
	ENVI &Cortsa=0
	ENVI &Netar=0
	IFEX #%&Timeyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &KLabelef,L1T(%&ncxst%*15-10)W55H15,运行时间,,%&LeftRT%,%&Hcr%
		LABE -left -ncmd &RecordTime,L60T5W500H15,00时00分01秒,,%&RightRT%,%&Hcr%
	}
	IFEX #%&temyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &PLabelW,L1T(%&ncxst%*15-10)W55H15,操作系统,,%&LeftSM%,%&Hcr%
		LABE -left -ncmd &PLabelT,L60T(%&ncxst%*15-10)W400H15,Windows %&Winver% %&SysBit%  %&VENar%.%&TStrVer%.%&aStrVer%.%&SysVer% %&ispe%,,%&RightSM%,%&Hcr%
	}
	IFEX #%&upTodeyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &PLabeHR,L1T(%&ncxst%*15-10)W55H15,启动模式,,%&LeftST%,%&Hcr%
		LABE -left -ncmd &PLabelBT,L60T(%&ncxst%*15-10)W400H15,%&BootMODE%  安全引导：%&BIOSS%,,%&RightST%,%&Hcr%
	}
	IFEX #%&Computeryc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &PLabelH,L1T(%&ncxst%*15-10)W55H15,计算机名,,%&LeftCN%,%&Hcr%
		LABE -left -ncmd &PLabelJ,L60T(%&ncxst%*15-10)W400H15,%&CoName%,,%&RightCN%,%&Hcr%
	}
	IFEX #%&Mainyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &PLabelF,L1T(%&ncxst%*15-10)W55H15,主板型号,,%&LeftMD%,%&Hcr%
		LABE -left -ncmd &PLabelG,L60T(%&ncxst%*15-10)W400H15,%&BIOSX%,,%&RightMD%,%&Hcr%
	}
	IFEX #%&Hostyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &PLabelEA,L1T(%&ncxst%*15-10)W55H15,主机序号,,%&LeftJHAO%,%&Hcr%
		LABE -left -ncmd &JIbelWk,L60T(%&ncxst%*15-10)W500H15,,,%&RightJHAO%,%&Hcr%
	}
	IFEX #[ %&Battyc%=0 & %&Batteryhelp%=1 ],
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &BatteryA,L1T(%&ncxst%*15-10)W55H15,电池信息,,%&LeftBY%,%&Hcr%
		LABE -left -ncmd &BatteryLifeD,L60T(%&ncxst%*15-10)W85H15,%&ACLine%,,%&RightBY%,%&Hcr%
		LABE -left -ncmd &BatteryAC,L150T(%&ncxst%*15-10)W55H15,电量：,,%&RightBY%,%&Hcr%
		LABE -left -ncmd &BattLabeBY,L190T(%&ncxst%*15-10)W95H15,,,%&RightBY%,%&Hcr%
		PBAR &CPLabeBY,L190T(%&ncxst%*15-9)W106H10,0
	}
	IFEX #%&CPUyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &PLabelY,L1T(%&ncxst%*15-10)W55H15,处 理 器,,%&LeftCU%,%&Hcr%
		LABE -left -ncmd &PLabelCUA,L60T(%&ncxst%*15-10)W800H15,%&ProName%,,%&RightCU%,%&Hcr%
		LABE -left -ncmd &PLabelCT,L60T(%&ncxst%*15+5)W135H15,%&ProCoreCount%,,%&RightCU%,%&Hcr%
		LABE -left -ncmd &PLabelCT,L209T(%&ncxst%*15+5)W450H15,主频：%&MHzName%MHz,,%&RightCU%,%&Hcr%
		LABE -left -ncmd &PLabelCTLA,L60T(%&ncxst%*15+20)W800H15,高速缓存：L1=%&CacheL1% L2=%&CacheL2% L3=%&CacheL3%,,%&RightCU%,%&Hcr%
		LABE -left -ncmd &PLabelY2,L60T(%&ncxst%*15+35)W85H15,利用率：,,%&RightCU%,%&Hcr%
		PBAR &CPLabel,L114T(%&ncxst%*15+36)W182H10,0,
		ENVI @&CPLabel.percent=0.1F:0x0DCDCDC:0x23DC99:0x0000:                       0.1 %
		CALC &Cortsa=%&Cortsa%+47
	}
	IFEX #%&Memyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &mLabelc,L1T(%&ncxst%*15+%&Cortsa%-10)W55H15,物理内存,,%&LeftMY%,%&Hcr%
		LABE -left -ncmd &LabelWY,L60T(%&ncxst%*15+%&Cortsa%-10)W550H15,总内存：%&TotalMemory%GB 插槽数：- 最大支持：-,,%&RightMY%,%&Hcr%
		LABE -left -ncmd &MabelRAf,L60T(%&ncxst%*15+%&Cortsa%+5)W75H15,已使用：,,%&RightMY%,%&Hcr%
		LABE -left -ncmd &MLabelsy,L112T(%&ncxst%*15+%&Cortsa%+5)W65H15,0GB,,%&RightMYo%,%&Hcr%
		LABE -left -ncmd &MabelRAM,L198T(%&ncxst%*15+%&Cortsa%+5)W75H15,可使用：,,%&RightMY%,%&Hcr%
		LABE -left -ncmd &MabelRAL,L249T(%&ncxst%*15+%&Cortsa%+5)W65H15,0GB,,%&RightMYo%,%&Hcr%
		LABE -left -ncmd &mLabelnb1,L60T(%&ncxst%*15+%&Cortsa%+20)W195H15,使用率：,,%&RightMY%,%&Hcr%
		PBAR &MLabelP,L114T(%&ncxst%*15+%&Cortsa%+21)W182H10,0
		CALC #&WLNCS=%&ncxst%*15+%&Cortsa%+20
		CALL DISPAY %&WLNCS% &Netar
		CALC &Cortsa=32+%&Cortsa%+%&Netar%*15
	}
	IFEX #%&Grapyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &GULabela,L1T(%&ncxst%*15+%&Cortsa%-10)W55H15,图形显卡,,%&LeftGC%,%&Hcr%
		LABE -left -ncmd &LabelGkc,L60T(%&ncxst%*15+%&Cortsa%-10)W280H15,,,%&RightGC%,%&Hcr%
		CALC &GASSL=%&ncxst%*15+%&Cortsa%+5
		CALC &Cortsa=%&Cortsa%+%&GCard%*15+2
	}
	IFEX #%&Diskyc%=0,
	{*
		CALC &ncxst=%&ncxst%+1
		LABE -left -ncmd &dLabelda,L1T(%&ncxst%*15+%&Cortsa%-10)W55H15,磁盘信息,,%&LeftDK%,%&Hcr%
	}
	IFEX #%&Memyc%=0,! CALL DISPAY
	CALC &WLSS=%&ncxst%*15+%&Cortsa%-10 #0
	CALL DISPGPU %&GASSL%
	CALL CalulateElapsedTime
	CALL WinDiskList %&WLSS%
	TIME OTimer,1000, CALL CalulateElapsedTime
	TIME Timerae,40000, CALL DISPGPU %&GASSL%
	TIME Timeraf,4530, CALL WinDiskList %&WLSS%
	CALL WinMEF
	IFEX %SystemRoot%\System32\ipconfig.exe,
	{
		TIME -t:1 OTimeAO,1200,EXEC*1 -hide &nar=%SystemRoot%\System32\ipconfig.exe
	}
	IFEX #%&CANSHU%=1, CALL WinPZ
_END
_SUB CalulateElapsedTime
	IFEX #%&CPUyc%=0,
	{
		FIND --pid &TMS
		MSTR  &Icv,&tcv,&CPUXThread=<1><2><3>%&TMS%
		CALC &P= 100 - 100 * (%&Icv%-%&UcI%) / (%&tcv%-%&Uct%) / %&CPUXThread% #1
		IFEX $[ %&P%>=0 & %&UcI%>1 ],
		{
			ENVI &GGC=0x23DC99
			IFEX #%&p%>60, ENVI &GGC=0x2088FF
			IFEX #%&p%>85, ENVI &GGC=0x0000FF
			ENVI @&CPLabel.percent=%&p%F:0x0DCDCDC:%&GGC%:0x0000:                       %&p% %
			ENVI &::UcI=%&Icv%
			ENVI &::Uct=%&tcv%
		}!
		{
			ENVI &::UcI=%&Icv%
			ENVI &::Uct=%&tcv%	
		}
	}
	IFEX #%&Memyc%=0,
	{
		IFEX MEMU=?,&ReMemory
		CALC &ReMemory=%&ReMemory% / 1K ##2
		CALC &AvailableMemory=%&TotalMemory% - %&ReMemory% ##2
		CALC &UseMemory=%&AvailableMemory% / %&TotalMemory% * 100 #1
		FIND $%&AvailableMemory%<>%&SMemory%,
		{
			ENVI &::SMemory=%&AvailableMemory%
			ENVI @&MLabelsy=%&AvailableMemory%GB
			ENVI @&MabelRAL=%&ReMemory%GB
			ENVI &GGM=0x23DC99
			IFEX #%&UseMemory%>60, ENVI &GGM=0x2088FF
			IFEX #%&UseMemory%>85, ENVI &GGM=0x0000FF
			ENVI @&MLabelP.percent=%&UseMemory%F:0x0DCDCDC:%&GGM%:0x0000:                       %&UseMemory% %
		}
	}
	IFEX #%&Networkyc%=0,
	{
		IFEX #%&VENar%>5,
		{
			IFEX %SystemRoot%\System32\iphlpapi.dll,
			{
				ENVI &&Ln=Test
				CALL $--qd --ret:&R %SystemRoot%\System32\iphlpapi.dll,GetIfTable2,*&Ln
				ENVI?long &Ln=&&La
				ENVI-make &&Xi=%&La%;8
				ENVI?int &Xi=&Xi
				CALC #&Lc=%&Xi% * 1352 + 8
				ENVI-make &&NeTable=%&La%;%&Lc%
				CALL $--qd --ret:&R %SystemRoot%\System32\Kernel32.dll,GlobalFree,#%&La%
				ENVI &Tdo=0
				ENVI &Tup=0
				ENVI &Outputs=
				LOOP %&Xi%>0,
				{*
					CALC #&Xi=%&Xi% - 1
					ENVI?int &NeTable=&Flag:(%&Xi%*1352+1160)
					CALC &Flag=%&Flag% % 2
					IFEX #%&Flag%=0, EXIT -
					ENVI?longlong &NeTable=&InUcast:(%&Xi%*1352+1264)
					ENVI?longlong &NeTable=&OutUcast:(%&Xi%*1352+1328)
					CALC #&Tdo=%&Tdo% + %&InUcast%
					CALC #&Tup=%&Tup% + %&OutUcast%
					ENVI?longlong &NeTable=&dwSpeed:(%&Xi%*1352+1200)
					IFEX #%&dwSpeed%>0,
					{*
						CALC &dwSpeed=%&dwSpeed% / 1000000 #1
						IFEX #%&dwSpeed%>999,TEAM  CALC &dwSpeed=%&dwSpeed% / 1000 #1 |ENVI &dwSpeed=速度：%&dwSpeed%Gbps! ENVI &dwSpeed=速度：%&dwSpeed%Mbps
					}!
					{*
						ENVI &dwSpeed=
					}
					ENVI-make &bDescrName=&NeTable@(%&Xi%*1352+550)
					ENVI?char &NeTable=&MediaConnectState:(%&Xi%*1352+1172)
					GETF &NeTable,(%&Xi%*1352+1068)#6,&MacPhysicalAddress
					SED *ni &MacPhysicalAddress=0, 0x,-,%&MacPhysicalAddress%
					MSTR &MacPhysicalAddress=3,17,%&MacPhysicalAddress%
					ENVI-make &dwAlias=&NeTable@(%&Xi%*1352+36)
					ENVI< &Outputs=%&MacPhysicalAddress%|%&MediaConnectState%|%&dwSpeed%|%&dwAlias%|%&bDescrName%%&nl%
					IFEX #%&Xi%=0,EXIT Loop
				}
				ENVI &::OutputShow=%&Outputs%
				CALC &Netdos=(%&Tdo% - %&Netds%) / 1K #1
				CALC &Netups=(%&Tup% - %&NetUs%) / 1K #1
				IFEX #%&Netdos%>1023, TEAM CALC &Netdos=%&Netdos% / 1K #1| ENVI @&WLabedoload=%&Netdos% M/s! ENVI @&WLabedoload=%&Netdos% K/s
				IFEX #%&Netups%>1023, TEAM CALC &Netups=%&Netups% / 1K #1| ENVI @&WLabeUpload=%&Netups% M/s! ENVI @&WLabeUpload=%&Netups% K/s
				ENVI &::Netds=%&Tdo%
				ENVI &::NetUs=%&Tup%
				ENVI &NeTable=
				ENVI &Ln=
			}
		}
	}
	IFEX #%&Timeyc%=0,
	{
		DATE &&DSecr uptime
		CALC #&totalSec=%&DSecr% / 1000 - 1
		CALC #&cSec=%&totalSec% % 60
		CALC #&TMPto=%&totalSec% / 60
		CALC #&cMin=%&TMPto% % 60
		CALC #&cHour=%&TMPto% / 60
		IFEX $%&cSec%<10, ENVI &cSec=0%&cSec%
		IFEX $%&cMin%<10, ENVI &cMin=0%&cMin%
		IFEX $%&cHour%<10, ENVI &cHour=0%&cHour%
		DATE *space0 &&DSecT
		MSTR &TIa1,&TIa2,&TIa3,&TIa4,&TIa5,&TIa6,&TIa7,&TIa8=<1*>%&DSecT%
		CALC &TIa8=%&TIa8%+1
		MSTR &TIa8=<%&TIa8%>日 一 二 三 四 五 六
		ENVI @&RecordTime=%&cHour%时%&cMin%分%&cSec%秒 %&TIa1%-%&TIa2%-%&TIa3%[%&TIa8%] %&TIa4%:%&TIa5%:%&TIa6%
	}
	WAIT 0.1
_END
_SUB DISPAY
	ENVI &GOU=%1
	ENVI &WI=0
	CALL SysFirmware &SMbiosinfo
	FORX *NL &SMbiosinfo,&CPUme,
	{*
		MSTR -delims:| &MeNaR,&MeNaT,&MeNab=<1><2><3>%&CPUme%
		IFEX #%&MeNaR%=16,
		{*
			FIND $%&MeNaT%=,!
			{*
				MSTR &MeNa6,&MeNa9=<1><2>%&MeNaT%
				IFEX #%&MeNa9%>%&MeMRY%,
				{*
					ENVI &MeMRY=%&MeNa9%
					ENVI @&LabelWY=总内存：%&TotalMemory%GB 插槽数：%&MeNa6% 最大支持：%&MeMRY%
				}
			}
		}
		IFEX #%&MeNaR%=17,
		{*
			IFEX #%&Memyc%=0,
			{*
				CALC #&WI=%&WI% + 1
				FIND $%&MeNab%=, ENVI &MeNab=Unknown
				MSTR -trim &MeNab=%&MeNab%
				LABE -left -ncmd &LabelWk%&WI%,L60T(%&GOU%+%&WI%*15)W800H15,%&MeNab% %&MeNaT%,,%&RightMY%,%&Hcr%
				ENVI< &::Amoro=%&MeNab% %&MeNaT%%&NL%
				ENVI-ret %~2=%&WI%
			}
		}
		IFEX #%&MeNaR%=1,
		{*
			MSTR -trim &MeNaT=%&MeNaT%
			FIND $%&MeNaT%=,ENVI &MeNaT=Unknown
			ENVI @&JIbelWk=%&MeNaT%
		}
		FIND $%&MeNaR%=0x0,ENVI &DJYTWE=%&MeNaT%
		IFEX #%&MeNaR%=2,
		{*
			MSTR -trim &MeNaT=%&MeNaT%
			FIND $%&MeNab%=, REGI --qk --init $HKLM\HARDWARE\DESCRIPTION\System\BIOS\BaseBoardProduct,&MeNab
			MSTR -trim &MeNab=%&MeNab%
			ENVI @&PLabelG=%&MeNaT% %&MeNab%
			ENVI &BIOSX=%&MeNaT% %&MeNab%
		}
	}
	FIND $%&BIOSX%=,
	{*
		ENVI @&PLabelG=%&DJYTWE%
	}
_END
_SUB DISPGPU
	IFEX #%&Grapyc%=0,!TEAM ENVI @Timerae.*del=| EXIT _SUB
	ENVI &iPv=0
	ENVI &GraphicsName=
	ENVI &errGPU=1
	ENVI &GOURA=%1
	FORX *NL &GraphicsID,&GraphicsT,
	{*
		FIND $%&GraphicsT%=, EXIT -
		CALC &iPv=%&iPv% + 1
		REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Enum\%&GraphicsT%\DeviceDesc,&GPUName
		MSTR -delims:; &GPXUName,&GPXUName2=<1><2>%&GPUName%
		FIND $%&GPXUName2%=,! ENVI &GPXUName=%&GPXUName2%
		REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Enum\%&GraphicsT%\Driver,&Dversa
		REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\InfPath,&InfPt
		REGI --qk --init *$HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\IncludedInfs,&IncludedInfs
		FIND $%&InfPt%=display.inf, ENVI &InfPt=
		FIND $%&IncludedInfs%=basicdisplay.inf, ENVI &InfPt=
		FIND $%&Dversa%=, ENVI &InfPt=
		FIND $%&GPXUName%=, ENVI &InfPt=
		FIND $%&InfPt%=,
		{*
			ENVI &GPOName=0
			ENVI &GPUName=
			LSTR &VNarp=12,%&GraphicsT%
			MSTR &isd=18,4,%&GraphicsT%
			FIND $%&VNarp%=PCI\VEN_8086, TEAM CALL IntelINFO %&isd% &GPUName| ENVI &GPOName=1
			FIND $%&VNarp%=PCI\VEN_10DE, TEAM CALL NVIDIAINFO %&isd% &GPUName| ENVI &GPOName=1
			FIND $%&VNarp%=PCI\VEN_1002, TEAM CALL AMDATI %&isd% &GPUName| ENVI &GPOName=1
			FIND $%&VNarp%=PCI\VEN_15AD, TEAM ENVI &GPUName=VMware SVGA 3D| ENVI &GPOName=1
			FIND $%&GPOName%=0,ENVI &GPUName=%&GPXUName%
			ENVI &errGPU=2
		}!
		{*
			MSTR &InfoMemorygtx=<-1>%&GPXUName%
			REGI --qk --init ?HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\HardwareInformation.qwMemorySize,&InfoMemorySize
			FIND $%&InfoMemorySize%=ERROR,
			{*
				REGI --qk --init ?HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\HardwareInformation.MemorySize,&InfoMemorySize
				FIND $%&InfoMemorySize%=REG_DWORD, REGI --qk --init #HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\HardwareInformation.MemorySize,&InfoMemorySize
				FIND $%&InfoMemorySize%=REG_BINARY,
				{*
					REGI --qk --init @HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa%\HardwareInformation.MemorySize,&InfoMemorySize
					ENVI$# &InfoMemorySize=%&InfoMemorySize%
					ENVI?int &InfoMemorySize=&InfoMemorySize
				}
			}!
			{*
				EXEC* -hide &VidMem=REG Query HKLM\SYSTEM\CurrentControlSet\Control\Class\%&Dversa% /V HardwareInformation.qwMemorySize
				MSTR &REGDWORD,&InfoMemorySize=<-2><-1>%&VidMem%
				FIND $%&REGDWORD%=REG_BINARY,
				{*
					ENVI$# &InfoMemorySize=%&InfoMemorySize%
					ENVI?int &InfoMemorySize=&InfoMemorySize
				}
			}
			CALC &InfoMemorySize=%&InfoMemorySize% / 1M #1
			IFEX $%&InfoMemorySize%=0,
			{*
				ENVI &InfoMemorySize=
			}!
			{*
				IFEX #%&InfoMemorySize%>1023,
				{*
					CALC &InfoMemorySize=%&InfoMemorySize% / 1024 #0
					ENVI &InfoMemorySize=%&InfoMemorySize%GB
				}!
				{*
					ENVI &InfoMemorySize=%&InfoMemorySize%MB
				}
			}
			FIND $%&InfoMemorySize%=%&InfoMemorygtx%,ENVI &InfoMemorySize=
			ENVI &GPUName=%&GPXUName% %&InfoMemorySize%
		}
		ENVI< &GraphicsName=%&nl%%&iPv%：%&GPUName%
	}
	FIND $%&GLLON%=,
	{
		ENVI &iPs=0
		FORX *NL &GraphicsName,&GNANT,
		{*
			FIND $%&GNANT%=, EXIT -
			CALC #&iPs=%&iPs% + 1
			SED *ni &GNANT=1:0,(PE64) ,,%&GNANT%
			LABE -left -ncmd &LabelGkG%&iPs%,L60T(%&GOURA%-15+%&iPs%*15)W800H15,%&GNANT%,,%&RightGC%,%&Hcr%
		}
		ENVI &::GLLON=2
		ENVI &::GrapName=%&GraphicsName%
	}
	FIND $%&GrapName%=%&GraphicsName%,!
	{
		ENVI &iPs=0
		FORX *NL &GraphicsName,&GNANT,
		{*
			FIND $%&GNANT%=, EXIT -
			CALC #&iPs=%&iPs% + 1
			SED *ni &GNANT=1:0,(PE64) ,,%&GNANT%
			ENVI @&LabelGkG%&iPs%=%&GNANT%
		}
		ENVI &::GrapName=%&GraphicsName%
	}
	IFEX #%&errGPU%=1, ENVI @Timerae.*del=
_END
_SUB WinDiskList
	ENVI &DLSSK=%1
	IFEX #%&Diskyc%=0,
	{
		FDRV &&Drvs=*:
		PART list disk ,&&Alldsk
		FIND $%&DRsti%=%&Drvs%%&Alldsk%,!
		{*
			FORX * %&Drvs%,&&Dy,
			{*
				PART -raw list drv %&Dy%,&&V
				MSTR &&hd=<1>%&V%
				^SET &Drv[%&hd%]=%%&Drv[%&hd%]%%%&Dy%
			}
			ENVI &DskLIST=
			ENVI &Drode=0
			FORX * %&Alldsk%,&Dsc,
			{*
				FIND $%&Dsc%=,EXIT -
				ENVI &DiskName=
				CALC #&Drode=%&Drode% + 1
				PART list disk %&Dsc%,&iDskInf
				MSTR &DiskCapy,&BusType,&DiskFormat=<2><9><10>%&iDskInf%
				CALL $--qd --ret:&&Rec %SystemRoot%\System32\Kernel32.dll,CreateFileW,$\\.\PhysicalDrive%&Dsc%,#0,#3,#0,#3,#0,#0
				ENVI$ &&T=07*11 0
				ENVI$ &&gsC=*12 0
				CALC #&an=0
				CALL $--qd --ret:&S %SystemRoot%\System32\Kernel32.dll,DeviceIoControl,#%&Rec%,#2954240,*&T,#12,*&gsC,#12,*&an,#0
				ENVI?char &gsC=&gsC:8
				IFEX #%&gsC%=1,
				{*
					ENVI &GD=<HDD>
				}!
				{*
					ENVI$ &T=08*11 0
					ENVI$ &&sC=*12 0
					CALC #&an=0
					CALL $--qd --ret:&S %SystemRoot%\System32\Kernel32.dll,DeviceIoControl,#%&Rec%,#2954240,*&T,#12,*&sC,#12,*&an,#0
					ENVI?char &sC=&sC:8
					IFEX #%&sC%=1, ENVI &GD=<SSD>! ENVI &GD=<HDD>
				}
				ENVI$ &T=*12 0
				ENVI$ &&Col=*512 0
				CALC #&an=0
				CALL $--qd --ret:&S %SystemRoot%\System32\Kernel32.dll,DeviceIoControl,#%&Rec%,#2954240,*&T,#12,*&Col,#512,*&an,#0
				ENVI?char &Col=&me:12
				ENVI?char &Col=&dwe:16
				ENVI-make &dam=&Col@%&me%
				ENVI-make &dwName=&Col@%&dwe%
				ENVI-tow &dwName=&dwName
				ENVI-tow &dam=&dam
				CALL $--ret:&T %SystemRoot%\System32\Kernel32.dll,CloseHandle,#%&Rec%
				MSTR -trim &dwName=%&dwName%
				IFEX #%&me%=0, ENVI &DiskName=%&dwName%! TEAM MSTR -trim &dam=%&dam%| ENVI &DiskName=%&dam% %&dwName%
				MSTR -trim &DiskName=%&DiskName%
				CALC #&BusType=%&BusType%+1
				MSTR -delims:| &BusType=<%&BusType%>RAMDISK|SCSI|ATAPI|ATA||SSA||USB|RAID|ISCSI|SAS|SATA|SD|MMC|虚拟|虚拟|Spaces|NVME|SCM|UFS|MAX
				FIND $[ %&BusType%=USB & '%&GD%='<HDD>' ], TEAM ENVI &GD=<Udisk>
				IFEX #%&DiskCapy%>1G, TEAM CALC &DiskCapy=%&DiskCapy% / 1G #2| SET &DiskCapy=%&DiskCapy%GB! TEAM CALC &DiskCapy=%&DiskCapy% / 1M #2|SET &DiskCapy=%&DiskCapy%MB
				^SET &DskLIST=%&DskLIST%%nl%%&Drode%：%&DiskName% %&GD% | %&BusType% %&DiskFormat% %&DiskCapy% [ %%&Drv[%&Dsc%]%% ]
				ENVI &::Drode=%&Drode%
			}
			FIND $%&Dkeroa%<>%&Drode%,
			{*
				ENVI &iPos=0
				FORX *NL &DKASI,&DM,
				{
					FIND $%&DM%=,EXIT -
					CALC #&iPos=%&iPos% + 1
					ENVI @&LabelDisk%&iPos%.*del=
				}
				ENVI &Wlanbere=
			}
			ENVI &iPos=0
			IFEX #%&Drode%=0, ENVI &DskLIST=0
			FORX *NL &DskLIST,&DAV,
			{*
				FIND $%&DAV%=,EXIT -
				CALC #&iPos=%&iPos% + 1
				MSTR -delims:| &SKevic,&SGevic=<1><2>%&DAV%
				MSTR -trim &SGevic=%&SGevic%
				FIND $%&Dkeroa%<>%&Drode%,LABE -left -ncmd &LabelDisk%&iPos%,L61T(%&iPos%*27+%&DLSSK%-27)W800H27,%&SKevic%%&NL%   %&SGevic%,,%&RightDK%,%&Hcr%
				FIND $%&Dkeroa%=%&Drode%,ENVI @&LabelDisk%&iPos%=%&SKevic%%&NL%   %&SGevic%
			}
			ENVI &::DKASI=%&DskLIST%
			ENVI &::DRsti=%&Drvs%%&Alldsk%
			IFEX #%&Drode%=0,ENVI &::Dkeroa=1! ENVI &::Dkeroa=%&Drode%
		}
	}
	IFEX #%&Networkyc%=0,
	{
		IFEX %SystemRoot%\System32\iphlpapi.dll,
		{*
			ENVI &IpAdds=
			ENVI$ &&NetIP=*0
			ENVI$ &&Ls=0
			CALL $--qd --ret:&&Rt %SystemRoot%\System32\iphlpapi.dll,GetAdaptersInfo,*&NetIP,*&&Ls
			ENVI?short &Ls=&&Ld
			CALC #&Ld=%&Ld%
			ENVI$ &NetIP=*%&Ld%
			CALL $--qd --ret:&&Rt %SystemRoot%\System32\iphlpapi.dll,GetAdaptersInfo,*&NetIP,*&Ls
			ENVI &Xs=0
			LOOP %&Ld%>0,
			{*
				CALC #&ina=%&Xs% * 704 + 448
				IFEX #%&ina%>%&Ld%,EXIT  LOOP
				ENVI-make &IPW=&NetIP@%&ina%
				ENVI-make &IPaos=&NetIP@(%&ina%-436)
				ENVI-make &IPane=&NetIP@(%&ina%-176)
				ENVI-make &NetType=&NetIP@(%&ina%+48)
				ENVI-tow &NetType=&NetType
				ENVI-tow &IPane=&IPane
				ENVI-tow &IPaos=&IPaos
				ENVI-tow &IPW=&IPW
				GETF &NetIP,(%&ina%-40)#6,&PhysicalAddress
				SED *ni &PhysicalAddress=0, 0x,-,%&PhysicalAddress%
				MSTR &PhysicalAddress=3,17,%&PhysicalAddress%
				ENVI< &IpAdds=%&PhysicalAddress%|%&IPW%|%&IPaos%|%&IPane%|%&NetType%%&nl%
				CALC #&Xs=%&Xs% + 1
			}
			ENVI &Ls=
			ENVI &NetIP=
		}
		ENVI &Wllti=0
		ENVI &AudoNet=
		FORX *NL &IpAdds,&Netid,
		{*
			FIND $%&Netid%=, EXIT -
			ENVI &WTXIP=0
			MSTR -delims:| &Net07,&DhcpID,&Net09,&NetName,&NetWG=<1><2><3><4><5>%&Netid%
			IFEX #%&VENar%>5,
			{*
				FORX *NL &OutputShow,&Netse,
				{*
					MSTR -delims:| &Net01,&Net02,&Net03,&WLIDS=<1><2><3><4>%&Netse%
					FIND $%&Net07%=%&Net01%,
					{*
						IFEX #%&Net02%=1,ENVI &Disconnected=! ENVI &Disconnected=未连接
						ENVI &WTXIP=1
						EXIT FORX
					}
				}
			}!
			{*
				ENVI &WTXIP=1
			}
			FIND $%&WTXIP%=0, EXIT -
			CALC #&Wllti=%&Wllti% + 1
			FIND $%&DhcpID%=0.0.0.0,
			{*
				REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%&Net09%\DhcpIPAddress,&DhcpID
				FIND $%&DhcpID%=,TEAM REGI --qk --init *$HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%&Net09%\IPAddress,&DhcpID
				MSTR &DhcpID=<1>%&DhcpID%
			}
			FIND $%&DhcpID%=,ENVI &DhcpID=0.0.0.0
			SED *ni &NetName=1:0, Connection,,%&NetName%
			STRL &BersA=%&NetName%
			IFEX #%&BersA%>31, LPOS$ &iPoa= ,5,%&NetName%! LPOS$ &iPoa= ,6,%&NetName%
			MSTR &NetName=0,%&iPoa%,%&NetName%
			SED *ni &NetName=1:0, LAN,,%&NetName%
			IFEX #%&NetWG%=0, ENVI &NetWG=0.0.0.0
			ENVI< &AudoNet=%&nl%%&Wllti%：%&NetName%|MAC：%&Net07% %&Net03%|IP：%&DhcpID% %&WLIDS% %&Disconnected%|网关：%&NetWG%
			ENVI &::Wllti=%&Wllti%
		}
		IFEX #%&Wllti%=0,
		{*
			ENVI &AudoNet=
			REGI --qk --init --ak HKLM\SYSTEM\CurrentControlSet\Enum\PCI\,&PCIE
			FORX *NL &PCIE,&PCISU,
			{*
				REGI --qk --init --ak HKLM\SYSTEM\CurrentControlSet\Enum\PCI\%&PCISU%\,&PCID
				MSTR &PCID=<1>%&PCID%
				REGI --qk --init *$HKLM\SYSTEM\CurrentControlSet\Enum\PCI\%&PCISU%\%&PCID%\CompatibleIDs,&bleIDs
				MSTR  &bleIDs=<-1>%&bleIDs%
				FIND $%&bleIDs%=PCI\CC_0200,TEAM ENVI &bleIDs=1|ENVI &WLANINFO=LAN
				FIND $%&bleIDs%=PCI\CC_0280,TEAM ENVI &bleIDs=1|ENVI &WLANINFO=WLAN
				IFEX #%&bleIDs%=1,! EXIT -
				DEVI *status:&PCICC:PCI\%&PCISU%\%&PCID%
				FIND $%&PCICC%=, EXIT -
				CALC #&Wllti=%&Wllti% + 1
				MSTR &PCICC=<3>%&PCICC%
				FIND $%&PCICC%=0x1806000, ENVI &PCICC=1
				FIND $%&PCICC%=0x1802400, ENVI &PCICC=1
				FIND $%&PCICC%=0x1806400, ENVI &PCICC=1
				FIND $%&PCICC%=1,ENVI &PCICC=未安装驱动! ENVI &PCICC=
				REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Enum\PCI\%&PCISU%\%&PCID%\DeviceDesc,&DeviceName
				FIND $%&DeviceName%=, REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Enum\PCI\%&PCISU%\%&PCID%\FriendlyName,&DeviceName
				REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%&Net19%\DhcpIPAddress,&DhcpID
				FIND $%&DhcpID%=,TEAM REGI --qk --init *$HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%&Net19%\IPAddress,&DhcpID
				REGI --qk --init $HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%&Net19%\DhcpNameServer,&NetWG
				IFEX #%&NetWG%=0, ENVI &NetWG=0.0.0.0
				IFEX #%&DhcpID%=0,ENVI &DhcpID=0.0.0.0
				MSTR  -delims:; &DeviINF,&DeviName=<1><2>%&DeviceName%
				FIND $%&DeviName%=,! ENVI &DeviINF=%&DeviName%
				ENVI< &AudoNet=%&Wllti%：%&DeviINF%|MAC：00-00-00-00-00-00 %&PCICC%|IP：%&DhcpID% %&WLANINFO%|网关：%&NetWG%%&NL%
			}
		}
		IFEX #%&Wllti%=0,TEAM ENVI &Wllti=1| ENVI &AudoNet=0
		IFEX #%&Wlanbere%<>%&Wllti%, ENVI &NetIS=%&NetIS%1
		FIND $%&NetIS%=%&AudoNet%,!
		{
			IFEX #%&Diskyc%=0,! ENVI &Dkeroa=14+0
			CALC #&DLSAT=%&DLSSK% + (%&Dkeroa% * 27) + 2
			FIND $%&Wlanbere%<>%&Wllti%,
			{*
				ENVI &iPoa=0
				FORX *NL &NetIS,&DO,
				{*
					FIND $%&DO%=,EXIT -
					CALC #&iPoa=%&iPoa% + 1
					ENVI @&NetaoWifi%&iPoa%.*del=
				}
				TEAM ENVI @&WLabela.*del=| ENVI @&WLabelo1.*del=| ENVI @&WLabeload1.*del=| ENVI @&WLabeload2.*del=| ENVI @&WLabedoload.*del=| ENVI @&WLabeUpload.*del=
				LABE -left -ncmd &WLabela,L1T(%&DLSAT%+1)W55H15,网络连接,,%&LeftNK%,%&Hcr%
			}
			ENVI &::NetIS=%&AudoNet%
			ENVI &iPoa=0
			FORX *NL &AudoNet,&WLANT,
			{*
				FIND $%&WLANT%=,EXIT -
				CALC #&iPoa=%&iPoa% + 1
				MSTR -delims:| &WLANID,&WLANName,&Macdz,&DHPCNA=<1><2><3><4>%&WLANT%
				CALC #&WBM=%&DLSAT%-54+%&iPoa%*54
				IFEX #%&Wlanbere%<>%&Wllti%,LABE -left -ncmd &NetaoWifi%&iPoa%,L61T%&WBM%W800H53,%&WLANID%%&nl%   %&WLANName%%&nl%   %&Macdz%%&nl%   %&DHPCNA%,,%&RightNK%,%&Hcr%
				IFEX #%&Wlanbere%=%&Wllti%,ENVI @&NetaoWifi%&iPoa%=%&WLANID%%&nl%   %&WLANName%%&nl%   %&Macdz%%&nl%   %&DHPCNA%
			}
			IFEX #%&Wlanbere%<>%&Wllti%,
			{
				LABE -left -ncmd &WLabelo1,L1T(%&WBM%+56)W55H15,网络速率,,%&LeftTE%,%&Hcr%
				LABE -left -ncmd &WLabeload1,L77T(%&WBM%+56%&Hcn%)W40H15,↓：,,%&RightTE%,%&HcA%
				LABE -left -ncmd &WLabeload2,L187T(%&WBM%+56%&Hcn%)W40H15,↑：,,%&RightTE%,%&HcA%
				LABE -left -ncmd &WLabedoload,L100T(%&WBM%+56)W85H15,0 KB/s,,%&RightTEo%,%&Hcr%
				LABE -left -ncmd &WLabeUpload,L210T(%&WBM%+56)W85H15,0 KB/s,,%&RightTEo%,%&Hcr%
			}
			ENVI &::Wlanbere=%&Wllti%
		}
	}
	SCRN &&ScarW,&&Scart
	DISP  ? &&DISPUI
	MSTR* &&Right,&&Hight,&&FPS=<1><2><4>%&DISPUI%
	FIND $%&DISPhsf%<>%&ScarW%%&FPS%%Dkeroa%%Wlanbere%,
	{
		FIND $%&Dkeroa%=, ENVI &Dkeroa=0
		FIND $%&Wlanbere%=, ENVI &Wlanbere=0
		CALC #&ights=%&ScarW% - 380 %&IST%
		ENVI @DrvMGR.POS=%&ights%:15:650:%&Scart%:2
		IFEX #%&Grapyc%=0,ENVI @&LabelGkc=分辨率：%&Right% x %&Hight% %&FPS%Hz  %&dPINFO%
		ENVI &::DISPhsf=%&ScarW%%&FPS%%Dkeroa%%Wlanbere%
	}
	IFEX #[ %&Battyc%=0 & %&Batteryhelp%=1 ],
	{
		ENVI$# &&Battery=*0xC 68
		CALL $--qd --ret:&ST Kernel32.dll,GetSystemPowerStatus,*&Battery
		ENVI?char &Battery=&&ACLine:0
		ENVI?char &Battery=&&BatteryFlag:1
		ENVI?char &Battery=&&BatteryLifePercent:2
		CALC #&BatteryLifePercent=%&BatteryLifePercent%
		IFEX #%&ACLine%=1, ENVI &ACLine=AC电源已连接! ENVI &ACLine=电池使用中
		IFEX #[ %&BatteryLifePercent%>127 & %&BatteryFlag%>127 ],
		{*
			ENVI @&CPLabeBY.Visible=0
			ENVI @&BattLabeBY=电池未装载
			ENVI &::Battry=电池未装载
		}!
		{*
			IFEX #[ %&BatteryLifePercent%=0 & %&BatteryFlag%<128 ],
			{*
				ENVI @&CPLabeBY.Visible=0
				ENVI @&BattLabeBY=电池已损坏
				ENVI &::Battry=电池已损坏
			}!
			{*
				IFEX #[ %&BatteryLifePercent%>127 & %&BatteryFlag%<128 ],
				{*
					ENVI @&CPLabeBY.Visible=0
					ENVI @&BattLabeBY=电池已损坏
					ENVI &::Battry=电池已损坏
				}!
				{*
					ENVI @&BattLabeBY=
					ENVI @&CPLabeBY.Visible=1
					ENVI &Gbaty=0x23DC99
					IFEX #%&BatteryLifePercent%<21, ENVI &Gbaty=0x0000FF
					ENVI @&CPLabeBY.percent=%&BatteryLifePercent%F:0x0DCDCDC:%&Gbaty%:0x0000:          %&BatteryLifePercent% %
					ENVI &::Battry=电量：%&BatteryLifePercent% %
				}
			}
		}
		FIND $%&ACine%<>%&ACLine%, ENVI @&BatteryLifeD=%&ACLine%
		ENVI &::ACine=%&ACLine%
	}
_END
_SUB SysFirmware
	IFEX #%&VENar%=5,
	{*
		REGI --qk --init --16 @HKLM\SYSTEM\CurrentControlSet\Services\mssmbios\Data\SMBiosData,&SMBdata
		ENVI$# &SMB=%&SMBdata%
	}!
	{*
		CALL $--qd --ret:&RC Kernel32.dll,GetSystemFirmwareTable,#1381190978,#0,#0,#0
		ENVI$# &SMB=*%&RC% 68
		CALL $--qd --ret:&ST Kernel32.dll,GetSystemFirmwareTable,#1381190978,#0,*&SMB,#%&RC%
	}
	ENVI %~1=
	ENVI &Ber=0
	ENVI &DMIde=
	ENVI-make &SMB=&SMB@7
	LOOP 1,
	{*
		ENVI?char &SMB=&one:1
		ENVI?char &SMB=&two:2
		IFEX #%&two%=0, EXIT LOOP
		IFEX #%&one%=0,
		{*
			ENVI?char &SMB=&Manufacturer:5
			ENVI &Asr=1
		}
		IFEX #%&one%=1,
		{*
			ENVI?char &SMB=&Manufacturer:8
			ENVI &Asr=1
		}
		IFEX #%&one%=2,
		{*
			ENVI?char &SMB=&Manufacturer:5
			ENVI?char &SMB=&PartNumber:6
			ENVI &Asr=1
		}
		IFEX #%&one%=16,
		{*
			ENVI?int &SMB=&MaxCapacity:8
			IFEX #%&MaxCapacity%>1M,
			{*
				ENVI?wchar &SMB=&MemDevices:14
				CALC &MaxCapacity=%&MaxCapacity% / 1M #2
				CALC #&MemDevices=%&MemDevices%
				ENVI< &DMIde=%&NL%%&one% | %&MemDevices% %&MaxCapacity%GB
			}
		}
		IFEX #%&one%=17,
		{*
			ENVI &AsG=
			ENVI?short &SMB=&GM_B:13
			IFEX #%&GM_B%>0,
			{*
				IFEX #%&GM_B%>1023,TEAM CALC &GM_B=%&GM_B% / 1024 #2| ENVI &GM_B=%&GM_B%GB! TEAM CALC #&GM_B=%&GM_B%|ENVI &GM_B=%&GM_B%MB
				ENVI?char &SMB=&DD_R:19
				ENVI?short &SMB=&Speed:22
				ENVI?char &SMB=&Manufacturer:24
				ENVI?char &SMB=&PartNumber:27
				IFEX #%&Speed%>0,TEAM CALC #&Speed=%&Speed%|ENVI &Speed=/%&Speed%! ENVI &Speed=
				FIND $%&Speed%=, ENVI &GM_D= %&GM_B%! ENVI &GM_D=%&Speed% %&GM_B%
				MSTR -delims:| &R_AM=<%&DD_R%>Other||DRAM|EDRAM|VRAM|SRAM|RAM||||||CDRAM|3DRAM|SDRAM|SGRAM|RDRAM|DDR1|DDR2|DDR2||||DDR3|FBD2|DDR4|LPDDR1|LPDDR2|LPDDR3|LPDDR4||HBM1|HBM2|DDR5|LPDDR5
				ENVI &Asr=1
				ENVI &AsG=2
				FIND $%&R_AM%=, ENVI &Asr=
			}
		}
		IFEX #%&Asr%=1,
		{*
			ENVI< &DMIde=%&nl%%&one% |
			IFEX $[ %&one%=17 & %&AsG%=2 ], ENVI< &DMIde=%&R_AM%%&GM_D%|
		}
		ENVI-make &SMB=&SMB@%&two%
		ENVI?wchar &SMB=&TCl:1
		IFEX #%&TCl%=0, TEAM ENVI-make &SMB=&SMB@2|EXIT -
		FORX * 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25,&Single,
		{*
			ENVI-make &SMB=&SMB@(%&Ber%+1)
			ENVI-tow &Str=&SMB
			STRL &Ber=%&Str%
			IFEX #%&Ber%=0, EXIT FORX
			IFEX #%&Manufacturer%=%&Single%,
			{*
				MSTR -trim &Str=%&Str%
				IFEX #%&one%=17,
				{*
					SED *ni &ARC=?,:,,%&Str%
					IFEX #%&ARC%>0, MSTR -delims:: &Str=<2>%&Str%
					LSTR &Sarha=2,%&Str%
					FIND $%&Sarha%=0x, SED *ni &Str=1:0,0x,,%&Str%
					LSTR &Sarhe=5,%&Str%
					SED *ni &Sarhe=1:0, ,,%&Sarhe%
					LSTR &Sarhe=4,%&Sarhe%
					FIND $%&Sarhe%=0420, ENVI &Str=G.SKILL
					FIND $%&Sarhe%=04CD, ENVI &Str=G.SKILL
					FIND $%&Sarhe%=017A, ENVI &Str=Apacer
					FIND $%&Sarhe%=04CB, ENVI &Str=A-Data
					FIND $%&Sarhe%=0198, ENVI &Str=Kingston
					FIND $%&Sarhe%=1319, ENVI &Str=Geil
					FIND $%&Sarhe%=80AD, ENVI &Str=Hynix
					FIND $%&Sarhe%=802C, ENVI &Str=Micron
					FIND $%&Sarhe%=859B, ENVI &Str=Crucial
					FIND $%&Sarhe%=0B92, ENVI &Str=Kingbank
					FIND $%&Sarhe%=0710, ENVI &Str=KingTiger
					FIND $%&Sarhe%=1337, ENVI &Str=Kingmax
					FIND $%&Sarhe%=830B, ENVI &Str=Nanya
					FIND $%&Sarhe%=8A76, ENVI &Str=lexar
					FIND $%&Sarhe%=8892, ENVI &Str=Galaxy
					FIND $%&Sarhe%=0467, ENVI &Str=Ramaxel
					FIND $%&Sarhe%=0423, ENVI &Str=Team
					FIND $%&Sarhe%=80CE, ENVI &Str=SamSung
					FIND $%&Sarhe%=0914, ENVI &Str=JingYi
					FIND $%&Sarhe%=0898, ENVI &Str=KLEVV
					FIND $%&Sarhe%=0443, ENVI &Str=Ramaxel
					FIND $%&Sarhe%=0215, ENVI &Str=CORSAIR
					FIND $%&Sarhe%=89F8, ENVI &Str=PCCOOLER
				}
				IFEX #%&one%=2,
				{*
					MSTR &Str=<1>%&Str%
					ENVI &Str=%&Str%|
				}
				ENVI< &DMIde= %&Str%
				ENVI &Manufacturer=1112
			}
			IFEX #%&PartNumber%=%&Single%,
			{*
				MSTR -trim &Str=%&Str%
				LSTR &Sarha=2,%&Str%
				FIND $%&Sarha%=0x,ENVI &Str=Unknown
				ENVI< &DMIde= %&Str%
				ENVI &PartNumber=1112
			}
		}
		ENVI &Asr=
	}
	ENVI-ret %~1=%&DMIde%
_END
_SUB WinMEF
	MENU AMenu,桌面信息 @lightn,,-
	MENU -
	MENU BMenu,隐藏/显示,CALL WinYC
	MENU -
	MENU -sub MyMenuSub1,字体大小
	MENU -
	MENU -sub MyMenuSub2,偏移位置
	MENU -
	MENU CMenu,刷新信息,TEAM TIPS *| KILL \| EXEC %&MyName%
	MENU -
	MENU DMenu,生成配置,CALL WinPZ
	MENU -
	MENU EMenu,退出程序,KILL  \,
_END
_SUB WinYC
	ENVI @DrvMGR.Visible=?&dot
	IFEX $%&dot%=1, ENVI @DrvMGR.Visible=0! ENVI @DrvMGR.Visible=1
_END
_SUB MyMenuSub1
    MENU Menu12,小,CALL WinMenu 0
    MENU Menu13,中,CALL WinMenu 1
    MENU Menu14,大,CALL WinMenu 2
	MENU Menu10,超大,CALL WinMenu 3
_END
_SUB MyMenuSub2
    MENU Menu18,默认位置,CALL WinMenu %&Maxsr% 0
    MENU Menu15,左移 +10,CALL WinMenu %&Maxsr% -10
    MENU Menu16,右移 +10,CALL WinMenu %&Maxsr% +10
_END
_SUB WinMenu
	FIND $%~1=,! ENVI &Maxsr=%~1
	FIND $%~2=,!
	{*
		ENVI &DFTYX=%~2
		SCRN &ScarW,&Scart
		CALC #&DAIST=%&DAIST% %&DFTYX%
		FIND $%~3=0, ENVI &DAIST=0
		CALL $--ret:&hdc user32.dll,GetDC,#0
		CALL $--ret:&IXELSX Gdi32.dll,GetDeviceCaps,#%&hdc%,#88
		IFEX #%&IXELSX%>96,
		{*
			CALC &Tro=%&IXELSX% / 96 * 100 +  %&Tro% - 100 #0
			IFEX #%&Maxsr%=0,ENVI &IST=%&DAIST% + 20
			IFEX #%&Maxsr%=1,CALC #&IST=%&DAIST% + 10
			IFEX #%&Maxsr%=2,CALC #&IST=%&DAIST% - 30
			IFEX #%&Maxsr%=3,CALC #&IST=%&DAIST% - 80
			CALC &IST=%&IST% - %&IXELSX% / 96 * 100 #0
		}!
		{*
			IFEX #%&Maxsr%=0,ENVI &IST=%&DAIST%
			IFEX #%&Maxsr%=1,CALC #&IST=%&DAIST% - 50
			IFEX #%&Maxsr%=2,CALC #&IST=%&DAIST% - 60
			IFEX #%&Maxsr%=3,CALC #&IST=%&DAIST% - 110
		}
		IFEX #%&IST%>0, ENVI &IST=+%&IST%
		FIND $%&IST%=0, ENVI &IST=
		CALC #&ights=%&ScarW% - 380 %&IST%
		ENVI @DrvMGR.POS=%&ights%:15:650:%&Scart%:2::1
		SED *ni &DAIST=1:0,+,,%&DAIST%
		ENVI &::DAIST=%&DAIST%
		ENVI &::IST=%&IST%
	}
	ENVI &CA=运行时间 = %&LeftRT% %&RightRT% %&Timeyc%%&nl%操作系统 = %&LeftSM% %&RightSM% %&temyc%%&NL%启动模式 = %&LeftST% %&RightST% %&upTodeyc%%&nl%计算机名 = %&LeftCN% %&RightCN% %&Computeryc%%&nl%
	ENVI &COF=主板型号 = %&LeftMD% %&RightMD% %&Mainyc%%&NL%主板序号 = %&LeftJHAO% %&RightJHAO% %&Hostyc%%&nl%电池信息 = %&LeftBY% %&RightBY% %&Battyc%%&nl%
	ENVI &CB=处理器   = %&LeftCU% %&RightCU% %&CPUyc%%&nl%物理内存 = %&LeftMY% %&RightMY% %&RightMYo% %&Memyc%%&nl%图形显卡 = %&LeftGC% %&RightGC% %&Grapyc%%&nl%
	ENVI &tea=磁盘信息 = %&LeftDK% %&RightDK% %&Diskyc%%&nl%网络连接 = %&LeftNK% %&RightNK% %&Networkyc%%&nl%网络速率 = %&Leftte% %&Rightte% %&RightTEo% %&Netrateyc%%&nl%
	ENVI &CfR=;调节字体大小: MAX = 0-3 ,默认%&MaxsE%%&NL%MAX = %&Maxsr%%&NL%%&NL%
	ENVI &Cfo=;设置窗口偏移位置,POS 小于0为左, 大于0为右, 默认0 。%&NL%POS = %&DAIST%%&NL%%&NL%
	ENVI &Index=%&NL%设置颜色文字更改 "=" 后第一个为标记颜色  第二个为信息颜色%&nl%自定义显示、隐藏分类信息设置第三个数值，(物理内存、网络速率，设置第四个数值)0为显示、1为隐藏。%&nl%注：(网络速率和网络连接不能单独隐藏, 设置隐藏其中一个, 两个都会被隐藏)
	ENVI &IndeA=%&nl%@Lightning QQ群：1067888280%&nl%%&nl%颜色代码示例:%&NL%大红#0000FF%&NL%紫色#800080%&NL%玫瑰棕色#8F8FBC%&NL%深橙色#008CFF%&NL%黄褐#60F4A4%&NL%金色#FFD70%&NL%黄色#00FFFF%&NL%绿色#808000%&NL%深蓝#8B0000%&NL%
	ENVI &IndeB=深青色#008B8B%&NL%天蓝#CECB87%&NL%青色#FFFF00%&NL%黑#000000%&NL%暗灰#696969%&NL%灰#808080%&NL%银灰#C0C0C0%&NL%浅灰#D3D3D3%&NL%亮灰#DCDCDC%&NL%烟白色#F5F5F5%&NL%幽灵白#FFF8F8%&NL%瓷白#D7FAEB%&NL%雪白#FAFAFF
	WRIT-ANSI *c "%&CurDir%\%&Config%.ini",$-,
	WRIT-ANSI "%&CurDir%\%&Config%.ini",$+,%&Cfo%%&CfR%%&CA%%&COF%%&CB%%&tea%%&Index%%&IndeA%%&IndeB%
	FIND $%~1=,!
	{
		FIND $%~2=,TEAM TIPS *| KILL \| EXEC %&MyName%
	}
_END
_SUB WinPZ
	NAME &Config=%&MyName%
	ENVI &MBX=
	ENVI &MBd=
	ENVI &Ast=0
	ENVI &NKL=
	FORX *NL &NetIS,&CpuSO,
	{*
		FIND $%&CpuSO%=,EXIT -
		ENVI &WTXIPO=0
		MSTR -delims:| &NADVC,&NeNam33,&NeNamT3,&DPCHIP=<1><2><3><4>%&CpuSO%
		MSTR &NeNam33=<1>%&NeNam33%
		FIND $%&NeNam33%=MAC：00-00-00-00-00-00,
		{*
			MSTR -delims:：&NADVC=<2>%&NADVC%
			ENVI &NetName22=%&NADVC%
			ENVI &WTXIPO=1
		}!
		{*
			IFEX #%&VENar%>5,
			{*
				FORX *NL &OutputShow,&NetsSO,
				{*
					MSTR -delims:| &Net11,&NetName22=<1><5>%&NetsSO%
					FIND $%&NeNam33%=MAC：%&Net11%,
					{*
						ENVI &WTXIPO=1
						EXIT FORX
					}
				}
			}
		}
		IFEX #%&WTXIPO%=0, EXIT -
		CALC #&Ast=%&Ast% + 1
		ENVI< &NKL=%&NL%%&Ast%: %&NetName22%%&NL%%&NeNam33%%&nl%%&NeNamT3%%&nl%%&DPCHIP%
	}
	ENVI &MBX=运行时间  %&RecordTime%%&nl%%&nl%操作系统  %&PLabelT%%&nl%%&nl%启动模式  %&BootMODE%  安全启动: %&BIOSS%%&nl%%&nl%
	ENVI &MBd=计算机名  %&CoName%%&nl%%&nl%主板型号  %&PLabelG%%&nl%%&nl%主机序号  %&JIbelWk%%&nl%%&nl%电池信息  %Battry%%&nl%%&nl%处 理 器%&nl%%&ProName%%&nl%%&ProCoreCount%%&NL%
	ENVI &MBT=Cache缓存：L1=%&CacheL1%  L2=%&CacheL2%  L3=%&CacheL3%%&nl%%&nl%物理内存%&nl%%&LabelWY%%&nl%%Amoro%%&nl%图形显卡%&nl%%&LabelGkc%%&GrapName%%&nl%%&nl%磁盘信息%&DKASI%%&NL%%&nl%网络连接%&NKL%%&nl%%&nl%
	WRIT-ANSI "%&CurDir%\%&Config%_%&CoName%.ini",$+,%&MBX%%&MBd%%&MBT%
	CALL WinMenu
	IFEX #%&CANSHU%=1,!
	{
		BROW &Boot_Ini,%&CurDir%\%&Config%.ini,请选择一个文件,INI
		FIND $%&Boot_Ini%=,! EXEC $"%&Boot_Ini%"
	}
_END
_SUB IntelINFO
	FIND $%~1=9bc8, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=9bc5, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=9bc4, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9b41, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9a68, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9a60, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9a49, TEAM ENVI-ret %~2=Intel(R) Iris Xe Graphics| EXIT _SUB
	FIND $%~1=8a5c, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=8a5a, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=8a56, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=8a51, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=4e71, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4e61, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4e55, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4c9a, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4c90, TEAM ENVI-ret %~2=Intel(R) UHD Graphics P750| EXIT _SUB
	FIND $%~1=4c8b, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 730| EXIT _SUB
	FIND $%~1=4c8a, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 750| EXIT _SUB
	FIND $%~1=4908, TEAM ENVI-ret %~2=Intel(R) Iris Xe Graphics| EXIT _SUB
	FIND $%~1=4906, TEAM ENVI-ret %~2=Intel(R) Iris Xe Pod| EXIT _SUB
	FIND $%~1=4905, TEAM ENVI-ret %~2=Intel(R) Iris Xe MAX Graphics| EXIT _SUB
	FIND $%~1=46a3, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=3ea5, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics 655| EXIT _SUB
	FIND $%~1=3ea0, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 620| EXIT _SUB
	FIND $%~1=3e9b, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=3e98, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=3e96, TEAM ENVI-ret %~2=Intel(R) UHD Graphics P630| EXIT _SUB
	FIND $%~1=3e93, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 610| EXIT _SUB
	FIND $%~1=3e92, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=3e91, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=3e90, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 610| EXIT _SUB
	FIND $%~1=3185, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 600| EXIT _SUB
	FIND $%~1=3184, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 605| EXIT _SUB
	FIND $%~1=9BC8, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=9BC5, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=8A52, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=8A5A, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=8A51, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=9B21, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9BAC, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9B41, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9BCA, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9BCC, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=87CA, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=8A5C, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics| EXIT _SUB
	FIND $%~1=8A58, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=8A56, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9a49, TEAM ENVI-ret %~2=Intel(R) Xe Graphics| EXIT _SUB
	FIND $%~1=9a60, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9a68, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=9bc4, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=2E5B, TEAM ENVI-ret %~2=Intel(R) 500| EXIT _SUB   
	FIND $%~1=8108, TEAM ENVI-ret %~2=Intel(R) 500| EXIT _SUB   
	FIND $%~1=8109, TEAM ENVI-ret %~2=Intel(R) 500| EXIT _SUB   
	FIND $%~1=4102, TEAM ENVI-ret %~2=Intel(R) 600| EXIT _SUB   
	FIND $%~1=7800, TEAM ENVI-ret %~2=Intel(R) 740| EXIT _SUB                     
	FIND $%~1=1240, TEAM ENVI-ret %~2=Intel(R) 752| EXIT _SUB                     
	FIND $%~1=7121, TEAM ENVI-ret %~2=Intel(R) 3D graphics 810| EXIT _SUB
	FIND $%~1=7123, TEAM ENVI-ret %~2=Intel(R) 3D graphics 810| EXIT _SUB
	FIND $%~1=7125, TEAM ENVI-ret %~2=Intel(R) 3D graphics 810| EXIT _SUB
	FIND $%~1=1132, TEAM ENVI-ret %~2=Intel(R) 3D graphics 815| EXIT _SUB
	FIND $%~1=3e96, TEAM ENVI-ret %~2=Intel(R) UHD Graphics P630| EXIT _SUB
	FIND $%~1=3e9b, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB
	FIND $%~1=3ea0, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 620| EXIT _SUB
	FIND $%~1=4c8a, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 750| EXIT _SUB
	FIND $%~1=4c8b, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 730| EXIT _SUB
	FIND $%~1=4c90, TEAM ENVI-ret %~2=Intel(R) UHD Graphics P750| EXIT _SUB
	FIND $%~1=4c9a, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4e55, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4e61, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=4e71, TEAM ENVI-ret %~2=Intel(R) UHD Graphics| EXIT _SUB
	FIND $%~1=87C0, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 617| EXIT _SUB
	FIND $%~1=591C, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 615| EXIT _SUB
	FIND $%~1=3EA9, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 620| EXIT _SUB
	FIND $%~1=5926, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics 640| EXIT _SUB
	FIND $%~1=591E, TEAM ENVI-ret %~2=Intel(R) HD Graphics 615| EXIT _SUB
	FIND $%~1=5902, TEAM ENVI-ret %~2=Intel(R) HD Graphics 630| EXIT _SUB
	FIND $%~1=5912, TEAM ENVI-ret %~2=Intel(R) HD Graphics 630| EXIT _SUB
	FIND $%~1=5927, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics 650| EXIT _SUB
	FIND $%~1=591B, TEAM ENVI-ret %~2=Intel(R) HD Graphics 630| EXIT _SUB
	FIND $%~1=5916, TEAM ENVI-ret %~2=Intel(R) HD Graphics 620| EXIT _SUB
	FIND $%~1=5917, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 620| EXIT _SUB
	FIND $%~1=591d, TEAM ENVI-ret %~2=Intel(R) HD Graphics P630| EXIT _SUB
	FIND $%~1=5923, TEAM ENVI-ret %~2=Intel(R) HD Graphics 635| EXIT _SUB
	FIND $%~1=3577, TEAM ENVI-ret %~2=Intel(R) Extreme Graphics 830| EXIT _SUB    
	FIND $%~1=357B, TEAM ENVI-ret %~2=Intel(R) Extreme Graphics 835| EXIT _SUB    
	FIND $%~1=2562, TEAM ENVI-ret %~2=Intel(R) Extreme Graphics 845| EXIT _SUB    
	FIND $%~1=358E, TEAM ENVI-ret %~2=Intel(R) Extreme Graphics 2 854| EXIT _SUB  
	FIND $%~1=3582, TEAM ENVI-ret %~2=Intel(R) Extreme Graphics 2 855| EXIT _SUB  
	FIND $%~1=2572, TEAM ENVI-ret %~2=Intel(R) Extreme Graphics 2 865| EXIT _SUB  
	FIND $%~1=2582, TEAM ENVI-ret %~2=Intel(R) GMA 900| EXIT _SUB                 
	FIND $%~1=258A, TEAM ENVI-ret %~2=Intel(R) GMA 900| EXIT _SUB                 
	FIND $%~1=2782, TEAM ENVI-ret %~2=Intel(R) GMA 900| EXIT _SUB                 
	FIND $%~1=2592, TEAM ENVI-ret %~2=Intel(R) GMA 900| EXIT _SUB                 
	FIND $%~1=2792, TEAM ENVI-ret %~2=Intel(R) GMA 900| EXIT _SUB                 
	FIND $%~1=2772, TEAM ENVI-ret %~2=Intel(R) GMA 950| EXIT _SUB                 
	FIND $%~1=2776, TEAM ENVI-ret %~2=Intel(R) GMA 950| EXIT _SUB                 
	FIND $%~1=27A2, TEAM ENVI-ret %~2=Intel(R) GMA 950| EXIT _SUB                 
	FIND $%~1=27A6, TEAM ENVI-ret %~2=Intel(R) GMA 950| EXIT _SUB                 
	FIND $%~1=27AE, TEAM ENVI-ret %~2=Intel(R) GMA 950| EXIT _SUB                 
	FIND $%~1=29B2, TEAM ENVI-ret %~2=Intel(R) GMA 3100| EXIT _SUB                
	FIND $%~1=29B3, TEAM ENVI-ret %~2=Intel(R) GMA 3100| EXIT _SUB                
	FIND $%~1=29C2, TEAM ENVI-ret %~2=Intel(R) GMA 3100| EXIT _SUB                
	FIND $%~1=29C3, TEAM ENVI-ret %~2=Intel(R) GMA 3100| EXIT _SUB                
	FIND $%~1=29D2, TEAM ENVI-ret %~2=Intel(R) GMA 3100| EXIT _SUB                
	FIND $%~1=29D3, TEAM ENVI-ret %~2=Intel(R) GMA 3100| EXIT _SUB                
	FIND $%~1=A001, TEAM ENVI-ret %~2=Intel(R) GMA 3150| EXIT _SUB                
	FIND $%~1=A002, TEAM ENVI-ret %~2=Intel(R) GMA 3150| EXIT _SUB                
	FIND $%~1=A011, TEAM ENVI-ret %~2=Intel(R) GMA 3150| EXIT _SUB                
	FIND $%~1=A012, TEAM ENVI-ret %~2=Intel(R) GMA 3150| EXIT _SUB                
	FIND $%~1=2972, TEAM ENVI-ret %~2=Intel(R) GMA 3000| EXIT _SUB                
	FIND $%~1=2973, TEAM ENVI-ret %~2=Intel(R) GMA 3000| EXIT _SUB                
	FIND $%~1=2992, TEAM ENVI-ret %~2=Intel(R) GMA 3000| EXIT _SUB                
	FIND $%~1=2993, TEAM ENVI-ret %~2=Intel(R) GMA 3000| EXIT _SUB                
	FIND $%~1=29A2, TEAM ENVI-ret %~2=Intel(R) GMA X3000| EXIT _SUB               
	FIND $%~1=29A3, TEAM ENVI-ret %~2=Intel(R) GMA X3000| EXIT _SUB               
	FIND $%~1=2A02, TEAM ENVI-ret %~2=Intel(R) GMA X3100| EXIT _SUB               
	FIND $%~1=2A03, TEAM ENVI-ret %~2=Intel(R) GMA X3100| EXIT _SUB               
	FIND $%~1=2A12, TEAM ENVI-ret %~2=Intel(R) GMA X3100| EXIT _SUB               
	FIND $%~1=2A13, TEAM ENVI-ret %~2=Intel(R) GMA X3100| EXIT _SUB               
	FIND $%~1=2982, TEAM ENVI-ret %~2=Intel(R) GMA X3500| EXIT _SUB               
	FIND $%~1=2983, TEAM ENVI-ret %~2=Intel(R) GMA X3500| EXIT _SUB               
	FIND $%~1=2E02, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E03, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E12, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E13, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E42, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E43, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E92, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E93, TEAM ENVI-ret %~2=Intel(R) GMA 4500| EXIT _SUB                
	FIND $%~1=2E32, TEAM ENVI-ret %~2=Intel(R) GMA X4500| EXIT _SUB               
	FIND $%~1=2E33, TEAM ENVI-ret %~2=Intel(R) GMA X4500| EXIT _SUB               
	FIND $%~1=2E22, TEAM ENVI-ret %~2=Intel(R) GMA X4500| EXIT _SUB               
	FIND $%~1=2E23, TEAM ENVI-ret %~2=Intel(R) GMA X4500HD| EXIT _SUB             
	FIND $%~1=2A42, TEAM ENVI-ret %~2=Intel(R) GMA X4500MHD| EXIT _SUB            
	FIND $%~1=2A43, TEAM ENVI-ret %~2=Intel(R) GMA X4500MHD| EXIT _SUB            
	FIND $%~1=0042, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=0046, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=0102, TEAM ENVI-ret %~2=Intel(R) HD Graphics 2000| EXIT _SUB        
	FIND $%~1=0106, TEAM ENVI-ret %~2=Intel(R) HD Graphics 2000| EXIT _SUB        
	FIND $%~1=010A, TEAM ENVI-ret %~2=Intel(R) HD Graphics P3000| EXIT _SUB       
	FIND $%~1=0112, TEAM ENVI-ret %~2=Intel(R) HD Graphics 3000| EXIT _SUB        
	FIND $%~1=0116, TEAM ENVI-ret %~2=Intel(R) HD Graphics 3000| EXIT _SUB        
	FIND $%~1=0122, TEAM ENVI-ret %~2=Intel(R) HD Graphics 3000| EXIT _SUB        
	FIND $%~1=0126, TEAM ENVI-ret %~2=Intel(R) HD Graphics 3000| EXIT _SUB        
	FIND $%~1=0152, TEAM ENVI-ret %~2=Intel(R) HD Graphics 2500| EXIT _SUB        
	FIND $%~1=0156, TEAM ENVI-ret %~2=Intel(R) HD Graphics 2500| EXIT _SUB        
	FIND $%~1=015A, TEAM ENVI-ret %~2=Intel(R) HD Graphics 2500| EXIT _SUB                  
	FIND $%~1=0162, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4000| EXIT _SUB        
	FIND $%~1=0166, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4000| EXIT _SUB        
	FIND $%~1=016A, TEAM ENVI-ret %~2=Intel(R) HD Graphics P4000| EXIT _SUB                   
	FIND $%~1=0412, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4600| EXIT _SUB        
	FIND $%~1=0416, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4600| EXIT _SUB        
	FIND $%~1=041A, TEAM ENVI-ret %~2=Intel(R) HD Graphics P4600| EXIT _SUB                  
	FIND $%~1=041E, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4400| EXIT _SUB        
	FIND $%~1=0422, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5000| EXIT _SUB        
	FIND $%~1=0426, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5000| EXIT _SUB        
	FIND $%~1=042A, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5000| EXIT _SUB
	FIND $%~1=0407, TEAM ENVI-ret %~2=Intel(R) HD Graphics 8600M GT| EXIT _SUB   
	FIND $%~1=0A06, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB
	FIND $%~1=0A16, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4400| EXIT _SUB                    
	FIND $%~1=0A1E, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4200| EXIT _SUB        
	FIND $%~1=0A22, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 5100| EXIT _SUB      
	FIND $%~1=0A26, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5000| EXIT _SUB        
	FIND $%~1=0A2A, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 5100| EXIT _SUB      
	FIND $%~1=0A2B, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 5100| EXIT _SUB      
	FIND $%~1=0A2E, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 5100| EXIT _SUB                 
	FIND $%~1=0D12, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4600| EXIT _SUB        
	FIND $%~1=0D16, TEAM ENVI-ret %~2=Intel(R) HD Graphics 4600| EXIT _SUB                   
	FIND $%~1=0D22, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 5200| EXIT _SUB  
	FIND $%~1=0D26, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 5200| EXIT _SUB  
	FIND $%~1=0D2A, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 5200| EXIT _SUB  
	FIND $%~1=0D2B, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 5200| EXIT _SUB  
	FIND $%~1=0D2E, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 5200| EXIT _SUB  
	FIND $%~1=0F30, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=0F31, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=0F32, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=0F33, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB
	FIND $%~1=0BE0, TEAM ENVI-ret %~2=Intel(R) GMA 3600| EXIT _SUB   
	FIND $%~1=0BE1, TEAM ENVI-ret %~2=Intel(R) GMA 3600| EXIT _SUB   
	FIND $%~1=0BE2, TEAM ENVI-ret %~2=Intel(R) GMA 3650| EXIT _SUB   
	FIND $%~1=0BE3, TEAM ENVI-ret %~2=Intel(R) GMA 3650| EXIT _SUB   
	FIND $%~1=08C7, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08C8, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08C9, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08CA, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08CB, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08CC, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08CD, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08CE, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB   
	FIND $%~1=08CF, TEAM ENVI-ret %~2=Intel(R) GMA| EXIT _SUB           
	FIND $%~1=0155, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=0157, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=1612, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5600| EXIT _SUB        
	FIND $%~1=1616, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5500| EXIT _SUB                 
	FIND $%~1=161E, TEAM ENVI-ret %~2=Intel(R) HD Graphics 5300| EXIT _SUB        
	FIND $%~1=1626, TEAM ENVI-ret %~2=Intel(R) HD Graphics 6000| EXIT _SUB        
	FIND $%~1=162B, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 6100| EXIT _SUB      
	FIND $%~1=162D, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 6300| EXIT _SUB        
	FIND $%~1=22B0, TEAM ENVI-ret %~2=Intel(R) HD Graphics 400| EXIT _SUB         
	FIND $%~1=22B1, TEAM ENVI-ret %~2=Intel(R) HD Graphics 405| EXIT _SUB         
	FIND $%~1=22B2, TEAM ENVI-ret %~2=Intel(R) HD Graphics 400| EXIT _SUB         
	FIND $%~1=22B3, TEAM ENVI-ret %~2=Intel(R) HD Graphics 405| EXIT _SUB                           
	FIND $%~1=190B, TEAM ENVI-ret %~2=Intel(R) HD Graphics 510| EXIT _SUB                            
	FIND $%~1=1916, TEAM ENVI-ret %~2=Intel(R) HD Graphics 520| EXIT _SUB                     
	FIND $%~1=191B, TEAM ENVI-ret %~2=Intel(R) HD Graphics 530| EXIT _SUB         
	FIND $%~1=191D, TEAM ENVI-ret %~2=Intel(R) HD Graphics P530| EXIT _SUB        
	FIND $%~1=191E, TEAM ENVI-ret %~2=Intel(R) HD Graphics 515| EXIT _SUB                          
	FIND $%~1=1923, TEAM ENVI-ret %~2=Intel(R) HD Graphics 535| EXIT _SUB         
	FIND $%~1=1926, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 540| EXIT _SUB       
	FIND $%~1=1927, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 550| EXIT _SUB       
	FIND $%~1=192B, TEAM ENVI-ret %~2=Intel(R) Iris Graphics 555| EXIT _SUB       
	FIND $%~1=192D, TEAM ENVI-ret %~2=Intel(R) Iris Graphics P555| EXIT _SUB                 
	FIND $%~1=1932, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 580| EXIT _SUB   
	FIND $%~1=193A, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 580| EXIT _SUB  
	FIND $%~1=193B, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 580| EXIT _SUB   
	FIND $%~1=193D, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics P580| EXIT _SUB  
	FIND $%~1=0A84, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=1A84, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=1A85, TEAM ENVI-ret %~2=Intel(R) HD Graphics| EXIT _SUB             
	FIND $%~1=5A84, TEAM ENVI-ret %~2=Intel(R) HD Graphics 505| EXIT _SUB         
	FIND $%~1=5A85, TEAM ENVI-ret %~2=Intel(R) HD Graphics 500| EXIT _SUB               
	FIND $%~1=5906, TEAM ENVI-ret %~2=Intel(R) HD Graphics 610| EXIT _SUB                              
	FIND $%~1=591A, TEAM ENVI-ret %~2=Intel(R) HD Graphics 630| EXIT _SUB      
	FIND $%~1=3E90, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 610| EXIT _SUB        
	FIND $%~1=3E93, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 610| EXIT _SUB                
	FIND $%~1=3E91, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB        
	FIND $%~1=3E92, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB               
	FIND $%~1=3E98, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 630| EXIT _SUB                
	FIND $%~1=3EA5, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics 655| EXIT _SUB                                              
	FIND $%~1=3184, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 605| EXIT _SUB        
	FIND $%~1=3185, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 600| EXIT _SUB
	FIND $%~1=3EA1, TEAM ENVI-ret %~2=Intel(R) UHD Graphics 620| EXIT _SUB
	FIND $%~1=3EA6, TEAM ENVI-ret %~2=Intel(R) Iris Plus Graphics 645| EXIT _SUB
	FIND $%~1=1622, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 6200| EXIT _SUB
	FIND $%~1=162a, TEAM ENVI-ret %~2=Intel(R) Iris Pro Graphics 6300| EXIT _SUB
	FIND $%~1=1902, TEAM ENVI-ret %~2=Intel(R) HD Graphics 510| EXIT _SUB
	FIND $%~1=1906, TEAM ENVI-ret %~2=Intel(R) HD Graphics 510| EXIT _SUB
	FIND $%~1=1921, TEAM ENVI-ret %~2=Intel(R) HD Graphics 520| EXIT _SUB
	FIND $%~1=1912, TEAM ENVI-ret %~2=Intel(R) HD Graphics 530| EXIT _SUB
	ENVI-ret %~2=Intel(R) Graphics
_END
_SUB NVIDIAINFO
	FIND $%~1=14ae, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070 16GB| EXIT _SUB
	FIND $%~1=146b, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=146d, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080 20GB| EXIT _SUB
	FIND $%~1=1467, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=066d, TEAM ENVI-ret %~2=NVIDIA GeForce 8400GS| EXIT _SUB
	FIND $%~1=0711, TEAM ENVI-ret %~2=NVIDIA HICx8 + Graphics| EXIT _SUB
	FIND $%~1=042b, TEAM ENVI-ret %~2=NVIDIA GeForce NX 7900 GTO| EXIT _SUB
	FIND $%~1=0179, TEAM ENVI-ret %~2=NVIDIA GeForce4 MX (Mac)| EXIT _SUB
	FIND $%~1=00f9, TEAM ENVI-ret %~2=NVIDIA NV40 GeForce 6800 GT| EXIT _SUB
	FIND $%~1=06d1, TEAM ENVI-ret %~2=NVIDIA Tesla C2070| EXIT _SUB
	FIND $%~1=0771, TEAM ENVI-ret %~2=NVIDIA Tesla C2050| EXIT _SUB
	FIND $%~1=0772, TEAM ENVI-ret %~2=NVIDIA Tesla C2070| EXIT _SUB
	FIND $%~1=06d2, TEAM ENVI-ret %~2=NVIDIA Tesla M2070| EXIT _SUB
	FIND $%~1=0774, TEAM ENVI-ret %~2=NVIDIA Tesla M2070| EXIT _SUB
	FIND $%~1=0830, TEAM ENVI-ret %~2=NVIDIA Tesla M2070| EXIT _SUB
	FIND $%~1=0842, TEAM ENVI-ret %~2=NVIDIA Tesla M2050/M2070| EXIT _SUB
	FIND $%~1=088f, TEAM ENVI-ret %~2=NVIDIA Tesla X2070| EXIT _SUB
	FIND $%~1=06de, TEAM ENVI-ret %~2=NVIDIA Tesla T20| EXIT _SUB
	FIND $%~1=0773, TEAM ENVI-ret %~2=NVIDIA Tesla S2050| EXIT _SUB
	FIND $%~1=082f, TEAM ENVI-ret %~2=NVIDIA Tesla M2050| EXIT _SUB
	FIND $%~1=0840, TEAM ENVI-ret %~2=NVIDIA Tesla X2070| EXIT _SUB
	FIND $%~1=0846, TEAM ENVI-ret %~2=NVIDIA Tesla M2050| EXIT _SUB
	FIND $%~1=0866, TEAM ENVI-ret %~2=NVIDIA Tesla M2050| EXIT _SUB
	FIND $%~1=0907, TEAM ENVI-ret %~2=NVIDIA Tesla M2050| EXIT _SUB
	FIND $%~1=091e, TEAM ENVI-ret %~2=NVIDIA Tesla M2050| EXIT _SUB
	FIND $%~1=06df, TEAM ENVI-ret %~2=NVIDIA Tesla M2070-Q| EXIT _SUB
	FIND $%~1=0697, TEAM ENVI-ret %~2=NVIDIA Tesla M1060| EXIT _SUB
	FIND $%~1=0714, TEAM ENVI-ret %~2=NVIDIA Tesla M1060| EXIT _SUB
	FIND $%~1=0743, TEAM ENVI-ret %~2=NVIDIA Tesla M1060| EXIT _SUB
	FIND $%~1=0908, TEAM ENVI-ret %~2=NVIDIA Tesla M2070| EXIT _SUB
	FIND $%~1=087F, TEAM ENVI-ret %~2=NVIDIA Tesla M2070-Q| EXIT _SUB
	FIND $%~1=1021, TEAM ENVI-ret %~2=NVIDIA Tesla K20Xm| EXIT _SUB
	FIND $%~1=1022, TEAM ENVI-ret %~2=NVIDIA Tesla K20c| EXIT _SUB
	FIND $%~1=1026, TEAM ENVI-ret %~2=NVIDIA Tesla K20s| EXIT _SUB
	FIND $%~1=084D, TEAM ENVI-ret %~2=NVIDIA Tesla M2070-Q| EXIT _SUB
	FIND $%~1=1091, TEAM ENVI-ret %~2=NVIDIA Tesla M2090| EXIT _SUB
	FIND $%~1=1094, TEAM ENVI-ret %~2=NVIDIA Tesla M2075| EXIT _SUB
	FIND $%~1=1096, TEAM ENVI-ret %~2=NVIDIA Tesla C2050/C2075| EXIT _SUB
	FIND $%~1=118F, TEAM ENVI-ret %~2=NVIDIA Tesla K10| EXIT _SUB
	FIND $%~1=0197, TEAM ENVI-ret %~2=NVIDIA Tesla C870| EXIT _SUB
	FIND $%~1=05E7, TEAM ENVI-ret %~2=NVIDIA Tesla C1060| EXIT _SUB
	FIND $%~1=0595, TEAM ENVI-ret %~2=NVIDIA Tesla T10 Pro| EXIT _SUB
	FIND $%~1=068f, TEAM ENVI-ret %~2=NVIDIA Tesla T10 Pro| EXIT _SUB
	FIND $%~1=0842, TEAM ENVI-ret %~2=NVIDIA Tesla M2050| EXIT _SUB
	FIND $%~1=101f, TEAM ENVI-ret %~2=NVIDIA Tesla K20| EXIT _SUB
	FIND $%~1=1020, TEAM ENVI-ret %~2=NVIDIA Tesla K20X| EXIT _SUB
	FIND $%~1=1023, TEAM ENVI-ret %~2=NVIDIA Tesla K40m| EXIT _SUB
	FIND $%~1=1024, TEAM ENVI-ret %~2=NVIDIA Tesla K40c| EXIT _SUB
	FIND $%~1=1027, TEAM ENVI-ret %~2=NVIDIA Tesla K40st| EXIT _SUB
	FIND $%~1=1028, TEAM ENVI-ret %~2=NVIDIA Tesla K20m| EXIT _SUB
	FIND $%~1=1029, TEAM ENVI-ret %~2=NVIDIA Tesla K40s| EXIT _SUB
	FIND $%~1=102a, TEAM ENVI-ret %~2=NVIDIA Tesla K40t| EXIT _SUB
	FIND $%~1=102d, TEAM ENVI-ret %~2=NVIDIA Tesla K80| EXIT _SUB
	FIND $%~1=102e, TEAM ENVI-ret %~2=NVIDIA Tesla K40d| EXIT _SUB
	FIND $%~1=102f, TEAM ENVI-ret %~2=NVIDIA Tesla Stella Solo| EXIT _SUB
	FIND $%~1=103a, TEAM ENVI-ret %~2=NVIDIA Quadro K6000| EXIT _SUB
	FIND $%~1=103c, TEAM ENVI-ret %~2=NVIDIA Quadro K5200| EXIT _SUB
	FIND $%~1=103f, TEAM ENVI-ret %~2=NVIDIA Tesla Stella SXM| EXIT _SUB
	FIND $%~1=108e, TEAM ENVI-ret %~2=NVIDIA Tesla C2090| EXIT _SUBB
	FIND $%~1=088e, TEAM ENVI-ret %~2=NVIDIA Tesla X2090| EXIT _SUB
	FIND $%~1=0891, TEAM ENVI-ret %~2=NVIDIA Tesla X2090| EXIT _SUB
	FIND $%~1=0974, TEAM ENVI-ret %~2=NVIDIA Tesla X2090| EXIT _SUB
	FIND $%~1=098d, TEAM ENVI-ret %~2=NVIDIA Tesla X2090| EXIT _SUB
	FIND $%~1=0888, TEAM ENVI-ret %~2=NVIDIA Tesla M2075| EXIT _SUB
	FIND $%~1=0910, TEAM ENVI-ret %~2=NVIDIA Tesla C2075| EXIT _SUB
	FIND $%~1=0911, TEAM ENVI-ret %~2=NVIDIA Tesla C2050| EXIT _SUB
	FIND $%~1=1191, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760| EXIT _SUB
	FIND $%~1=1193, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760 Ti| EXIT _SUB
	FIND $%~1=1194, TEAM ENVI-ret %~2=NVIDIA Tesla K8| EXIT _SUB
	FIND $%~1=13bd, TEAM ENVI-ret %~2=NVIDIA Tesla M10| EXIT _SUB
	FIND $%~1=1160, TEAM ENVI-ret %~2=NVIDIA Tesla M10| EXIT _SUB
	FIND $%~1=13f2, TEAM ENVI-ret %~2=NVIDIA Tesla M60| EXIT _SUB
	FIND $%~1=114d, TEAM ENVI-ret %~2=NVIDIA GRID M60-1Q| EXIT _SUB
	FIND $%~1=114e, TEAM ENVI-ret %~2=NVIDIA GRID M60-2Q| EXIT _SUB
	FIND $%~1=1150, TEAM ENVI-ret %~2=NVIDIA GRID M60-8Q| EXIT _SUB
	FIND $%~1=11b0, TEAM ENVI-ret %~2=NVIDIA GRID M60-4A| EXIT _SUB
	FIND $%~1=13f3, TEAM ENVI-ret %~2=NVIDIA Tesla M6| EXIT _SUB
	FIND $%~1=1431, TEAM ENVI-ret %~2=NVIDIA Tesla M4| EXIT _SUB
	FIND $%~1=1436, TEAM ENVI-ret %~2=NVIDIA Quadro M2200 Mobile| EXIT _SUB
	FIND $%~1=15f0, TEAM ENVI-ret %~2=NVIDIA Quadro GP100| EXIT _SUB
	FIND $%~1=15f7, TEAM ENVI-ret %~2=NVIDIA Tesla P100 PCIe 12GB| EXIT _SUB
	FIND $%~1=15f8, TEAM ENVI-ret %~2=NVIDIA Tesla P100 PCIe 16GB| EXIT _SUB
	FIND $%~1=15f9, TEAM ENVI-ret %~2=NVIDIA Tesla P100 SXM2 16GB| EXIT _SUB
	FIND $%~1=17fd, TEAM ENVI-ret %~2=NVIDIA Tesla M40| EXIT _SUB
	FIND $%~1=1b38, TEAM ENVI-ret %~2=NVIDIA Tesla P40| EXIT _SUB
	FIND $%~1=1b39, TEAM ENVI-ret %~2=NVIDIA Tesla P10| EXIT _SUB
	FIND $%~1=1bb3, TEAM ENVI-ret %~2=NVIDIA Tesla P4| EXIT _SUB
	FIND $%~1=1bb4, TEAM ENVI-ret %~2=NVIDIA Tesla P6| EXIT _SUB
	FIND $%~1=1db1, TEAM ENVI-ret %~2=NVIDIA Tesla V100 SXM2 16GB| EXIT _SUB
	FIND $%~1=1db2, TEAM ENVI-ret %~2=NVIDIA Tesla V100 DGXS 16GB| EXIT _SUB
	FIND $%~1=1db3, TEAM ENVI-ret %~2=NVIDIA Tesla V100 FHHL 16GB| EXIT _SUB
	FIND $%~1=1db4, TEAM ENVI-ret %~2=NVIDIA Tesla V100 PCIe 16GB| EXIT _SUB
	FIND $%~1=1db5, TEAM ENVI-ret %~2=NVIDIA Tesla V100 SXM2 32GB| EXIT _SUB
	FIND $%~1=1db6, TEAM ENVI-ret %~2=NVIDIA Tesla V100 PCIe 32GB| EXIT _SUB
	FIND $%~1=1db7, TEAM ENVI-ret %~2=NVIDIA Tesla V100 DGXS 32GB| EXIT _SUB
	FIND $%~1=1db8, TEAM ENVI-ret %~2=NVIDIA Tesla V100 SXM3 32GB| EXIT _SUB
	FIND $%~1=1dba, TEAM ENVI-ret %~2=NVIDIA Quadro GV100| EXIT _SUB
	FIND $%~1=12eb, TEAM ENVI-ret %~2=NVIDIA TITAN V CEO Edition
	FIND $%~1=1df0, TEAM ENVI-ret %~2=NVIDIA Tesla PG500-216| EXIT _SUB
	FIND $%~1=1df2, TEAM ENVI-ret %~2=NVIDIA Tesla PG503-216| EXIT _SUB
	FIND $%~1=1df5, TEAM ENVI-ret %~2=NVIDIA Tesla V100 SXM2 16GB| EXIT _SUB
	FIND $%~1=1df6, TEAM ENVI-ret %~2=NVIDIA Tesla V100S PCIe 32GB| EXIT _SUB
	FIND $%~1=1eb8, TEAM ENVI-ret %~2=NVIDIA Tesla T4| EXIT _SUB
	FIND $%~1=1182, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760 Ti| EXIT _SUB
	FIND $%~1=1183, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 660 Ti| EXIT _SUB
	FIND $%~1=1184, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 770| EXIT _SUB
	FIND $%~1=1185, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 660 OEM| EXIT _SUB
	FIND $%~1=106f  TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760 OEM| EXIT _SUB
	FIND $%~1=1186, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 660 Ti| EXIT _SUB
	FIND $%~1=1187, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760| EXIT _SUB
	FIND $%~1=1188, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 690| EXIT _SUB
	FIND $%~1=1189, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 670| EXIT _SUB
	FIND $%~1=1074, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760 Ti OEM| EXIT _SUB
	FIND $%~1=1191, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760| EXIT _SUB
	FIND $%~1=1193, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760 Ti OEM| EXIT _SUB
	FIND $%~1=1195, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 660| EXIT _SUB
	FIND $%~1=1198, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 880M| EXIT _SUB
	FIND $%~1=1199, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 870M| EXIT _SUB
	FIND $%~1=119a, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 860M| EXIT _SUB
	FIND $%~1=119d, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 775M Mac Edition| EXIT _SUB
	FIND $%~1=119e, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 780M Mac Edition| EXIT _SUB
	FIND $%~1=119f, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 780M| EXIT _SUB
	FIND $%~1=11a0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 680M| EXIT _SUB
	FIND $%~1=11a1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 670MX| EXIT _SUB
	FIND $%~1=11a2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 675MX Mac Edition| EXIT _SUB
	FIND $%~1=11a3, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 680MX| EXIT _SUB
	FIND $%~1=11c0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 660| EXIT _SUB
	FIND $%~1=11c3, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650 Ti OEM| EXIT _SUB
	FIND $%~1=1030, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650 Ti| EXIT _SUB
	FIND $%~1=11c5, TEAM ENVI-ret %~2=NVIDIA GeForce GT 740| EXIT _SUB
	FIND $%~1=11c6, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650 Ti| EXIT _SUB
	FIND $%~1=11c7, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 750 Ti| EXIT _SUB
	FIND $%~1=11cb, TEAM ENVI-ret %~2=NVIDIA GeForce GT 740| EXIT _SUB
	FIND $%~1=11e0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 770M| EXIT _SUB
	FIND $%~1=11e1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 765M| EXIT _SUB
	FIND $%~1=11e2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 765M| EXIT _SUB
	FIND $%~1=11e3, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760M| EXIT _SUB
	FIND $%~1=1200, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560 Ti| EXIT _SUB
	FIND $%~1=1201, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560| EXIT _SUB
	FIND $%~1=1202, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560 Ti OEM| EXIT _SUB
	FIND $%~1=1203, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 460 SE v2| EXIT _SUB
	FIND $%~1=1205, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 460 v2| EXIT _SUB
	FIND $%~1=1206, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 555| EXIT _SUB
	FIND $%~1=1208, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560 SE| EXIT _SUB
	FIND $%~1=1210, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 570M| EXIT _SUB
	FIND $%~1=1211, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 580M| EXIT _SUB
	FIND $%~1=1212, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 675M| EXIT _SUB
	FIND $%~1=1213, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 670M| EXIT _SUB
	FIND $%~1=1241, TEAM ENVI-ret %~2=NVIDIA GeForce GT 545 OEM| EXIT _SUB
	FIND $%~1=1244, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 550 Ti| EXIT _SUB
	FIND $%~1=1245, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 450| EXIT _SUB
	FIND $%~1=1246, TEAM ENVI-ret %~2=NVIDIA GeForce GT 550M| EXIT _SUB
	FIND $%~1=1249, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 450| EXIT _SUB
	FIND $%~1=124d, TEAM ENVI-ret %~2=NVIDIA GeForce GT 555M| EXIT _SUB
	FIND $%~1=1251, TEAM ENVI-ret %~2=NVIDIA GeForce GT 560M| EXIT _SUB
	FIND $%~1=1280, TEAM ENVI-ret %~2=NVIDIA GeForce GT 635| EXIT _SUB
	FIND $%~1=1281, TEAM ENVI-ret %~2=NVIDIA GeForce GT 710| EXIT _SUB
	FIND $%~1=1282, TEAM ENVI-ret %~2=NVIDIA GeForce GT 640| EXIT _SUB
	FIND $%~1=1284, TEAM ENVI-ret %~2=NVIDIA GeForce GT 630| EXIT _SUB
	FIND $%~1=1286, TEAM ENVI-ret %~2=NVIDIA GeForce GT 720| EXIT _SUB
	FIND $%~1=1287, TEAM ENVI-ret %~2=NVIDIA GeForce GT 730| EXIT _SUB
	FIND $%~1=1288, TEAM ENVI-ret %~2=NVIDIA GeForce GT 720| EXIT _SUB
	FIND $%~1=1289, TEAM ENVI-ret %~2=NVIDIA GeForce GT 710| EXIT _SUB
	FIND $%~1=128b, TEAM ENVI-ret %~2=NVIDIA GeForce GT 710| EXIT _SUB
	FIND $%~1=1291, TEAM ENVI-ret %~2=NVIDIA GeForce GT 735M| EXIT _SUB
	FIND $%~1=1292, TEAM ENVI-ret %~2=NVIDIA GeForce GT 740M| EXIT _SUB
	FIND $%~1=1293, TEAM ENVI-ret %~2=NVIDIA GeForce GT 730M| EXIT _SUB
	FIND $%~1=1294, TEAM ENVI-ret %~2=NVIDIA GeForce GT 740M| EXIT _SUB
	FIND $%~1=1295, TEAM ENVI-ret %~2=NVIDIA GeForce 710M| EXIT _SUB
	FIND $%~1=1296, TEAM ENVI-ret %~2=NVIDIA GeForce 825M| EXIT _SUB
	FIND $%~1=1298, TEAM ENVI-ret %~2=NVIDIA GeForce GT 720M| EXIT _SUB
	FIND $%~1=1299, TEAM ENVI-ret %~2=NVIDIA GeForce 920M| EXIT _SUB
	FIND $%~1=129a, TEAM ENVI-ret %~2=NVIDIA GeForce 910M| EXIT _SUB
	FIND $%~1=1340, TEAM ENVI-ret %~2=NVIDIA GeForce 830M| EXIT _SUB
	FIND $%~1=1341, TEAM ENVI-ret %~2=NVIDIA GeForce 840M| EXIT _SUB
	FIND $%~1=1344, TEAM ENVI-ret %~2=NVIDIA GeForce 845M| EXIT _SUB
	FIND $%~1=1346, TEAM ENVI-ret %~2=NVIDIA GeForce 930M| EXIT _SUB
	FIND $%~1=1347, TEAM ENVI-ret %~2=NVIDIA GeForce 940M| EXIT _SUB
	FIND $%~1=1348, TEAM ENVI-ret %~2=NVIDIA GeForce 945M| EXIT _SUB
	FIND $%~1=1349, TEAM ENVI-ret %~2=NVIDIA GeForce 930M| EXIT _SUB
	FIND $%~1=134b, TEAM ENVI-ret %~2=NVIDIA GeForce 940MX| EXIT _SUB
	FIND $%~1=134d, TEAM ENVI-ret %~2=NVIDIA GeForce 940MX| EXIT _SUB
	FIND $%~1=134e, TEAM ENVI-ret %~2=NVIDIA GeForce 930MX| EXIT _SUB
	FIND $%~1=134f, TEAM ENVI-ret %~2=NVIDIA GeForce 920MX| EXIT _SUB
	FIND $%~1=137d, TEAM ENVI-ret %~2=NVIDIA GeForce 940A| EXIT _SUB
	FIND $%~1=1380, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 750 Ti| EXIT _SUB
	FIND $%~1=1381, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 750| EXIT _SUB
	FIND $%~1=1382, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 745| EXIT _SUB
	FIND $%~1=1390, TEAM ENVI-ret %~2=NVIDIA GeForce 845M| EXIT _SUB
	FIND $%~1=1391, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 850M| EXIT _SUB
	FIND $%~1=1392, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 860M| EXIT _SUB
	FIND $%~1=1393, TEAM ENVI-ret %~2=NVIDIA GeForce 840M| EXIT _SUB
	FIND $%~1=1398, TEAM ENVI-ret %~2=NVIDIA GeForce 845M| EXIT _SUB
	FIND $%~1=1399, TEAM ENVI-ret %~2=NVIDIA GeForce 945M| EXIT _SUB
	FIND $%~1=139a, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 950M| EXIT _SUB
	FIND $%~1=139b, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 960M| EXIT _SUB
	FIND $%~1=2b4c, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 960A| EXIT _SUB
	FIND $%~1=139c, TEAM ENVI-ret %~2=NVIDIA GeForce 940M| EXIT _SUB
	FIND $%~1=139d, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 750 Ti| EXIT _SUB
	FIND $%~1=13c0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980| EXIT _SUB
	FIND $%~1=1043, TEAM ENVI-ret %~2=NVIDIA GeForce GTX980-4GD5| EXIT _SUB
	FIND $%~1=8504, TEAM ENVI-ret %~2=NVIDIA GeForce GTX980-4GD5| EXIT _SUB
	FIND $%~1=13c2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 970| EXIT _SUB
	FIND $%~1=13d7, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980M| EXIT _SUB
	FIND $%~1=13d8, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 970M| EXIT _SUB
	FIND $%~1=13d9, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 965M| EXIT _SUB
	FIND $%~1=13da, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980| EXIT _SUB
	FIND $%~1=13e7, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980| EXIT _SUB
	FIND $%~1=1401, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 960| EXIT _SUB
	FIND $%~1=1402, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 950| EXIT _SUB
	FIND $%~1=1404, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 960 FAKE| EXIT _SUB
	FIND $%~1=1406, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 960 OEM| EXIT _SUB
	FIND $%~1=1407, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 750 v2| EXIT _SUB
	FIND $%~1=1427, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 965M| EXIT _SUB
	FIND $%~1=1617, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980M| EXIT _SUB
	FIND $%~1=1618, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 970M| EXIT _SUB
	FIND $%~1=1619, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 965M| EXIT _SUB
	FIND $%~1=161a, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980| EXIT _SUB
	FIND $%~1=1667, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 965M| EXIT _SUB
	FIND $%~1=174d, TEAM ENVI-ret %~2=NVIDIA GeForce MX130| EXIT _SUB
	FIND $%~1=174e, TEAM ENVI-ret %~2=NVIDIA GeForce MX110| EXIT _SUB
	FIND $%~1=179c, TEAM ENVI-ret %~2=NVIDIA GeForce 940MX| EXIT _SUB
	FIND $%~1=17c2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX TITAN X| EXIT _SUB
	FIND $%~1=17c8, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 980 Ti| EXIT _SUB
	FIND $%~1=1b01, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080 Ti 10GB| EXIT _SUB
	FIND $%~1=1b80, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080| EXIT _SUB
	FIND $%~1=1b81, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1b82, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070 Ti| EXIT _SUB
	FIND $%~1=1b83, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060 6GB| EXIT _SUB
	FIND $%~1=1b84, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060 3GB| EXIT _SUB
	FIND $%~1=1ba0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080| EXIT _SUB
	FIND $%~1=1ba1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1458, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1651, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1462, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=11e8, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=11e9, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1558, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=9501, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1ba2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1be0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080| EXIT _SUB
	FIND $%~1=1028, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080| EXIT _SUB
	FIND $%~1=07c0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080| EXIT _SUB
	FIND $%~1=355b, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1080| EXIT _SUB
	FIND $%~1=1be1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1070| EXIT _SUB
	FIND $%~1=1c02, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060 3GB| EXIT _SUB
	FIND $%~1=1c03, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060 6GB| EXIT _SUB
	FIND $%~1=1c04, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060 5GB| EXIT _SUB
	FIND $%~1=1c06, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060 6GB| EXIT _SUB
	FIND $%~1=1c20, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060| EXIT _SUB
	FIND $%~1=17aa, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060| EXIT _SUB
	FIND $%~1=39b9, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060  3GB| EXIT _SUB
	FIND $%~1=1c21, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 Ti| EXIT _SUB
	FIND $%~1=1c22, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050| EXIT _SUB
	FIND $%~1=1c23, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060| EXIT _SUB
	FIND $%~1=1c60, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060  6GB| EXIT _SUB
	FIND $%~1=103c, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060  6GB| EXIT _SUB
	FIND $%~1=8390, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1060  6GB| EXIT _SUB
	FIND $%~1=1c61, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 Ti| EXIT _SUB
	FIND $%~1=1c62, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050| EXIT _SUB
	FIND $%~1=1c81, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050| EXIT _SUB
	FIND $%~1=1c82, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 Ti| EXIT _SUB
	FIND $%~1=1c83, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 3GB| EXIT _SUB
	FIND $%~1=1c8c, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 Ti| EXIT _SUB
	FIND $%~1=1c8d, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050| EXIT _SUB
	FIND $%~1=1c8f, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 Ti| EXIT _SUB
	FIND $%~1=1c90, TEAM ENVI-ret %~2=NVIDIA GeForce MX150| EXIT _SUB
	FIND $%~1=1c91, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 3 GB| EXIT _SUB
	FIND $%~1=1c92, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050| EXIT _SUB
	FIND $%~1=1c94, TEAM ENVI-ret %~2=NVIDIA GeForce MX350| EXIT _SUB
	FIND $%~1=1c96, TEAM ENVI-ret %~2=NVIDIA GeForce MX350| EXIT _SUB
	FIND $%~1=1ccc, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050 Ti| EXIT _SUB
	FIND $%~1=1ccd, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1050| EXIT _SUB
	FIND $%~1=1d01, TEAM ENVI-ret %~2=NVIDIA GeForce GT 1030| EXIT _SUB
	FIND $%~1=1d10, TEAM ENVI-ret %~2=NVIDIA GeForce MX150| EXIT _SUB
	FIND $%~1=1d11, TEAM ENVI-ret %~2=NVIDIA GeForce MX230| EXIT _SUB
	FIND $%~1=1d12, TEAM ENVI-ret %~2=NVIDIA GeForce MX150| EXIT _SUB
	FIND $%~1=1d13, TEAM ENVI-ret %~2=NVIDIA GeForce MX250| EXIT _SUB
	FIND $%~1=1d16, TEAM ENVI-ret %~2=NVIDIA GeForce MX330| EXIT _SUB
	FIND $%~1=1d52, TEAM ENVI-ret %~2=NVIDIA GeForce MX250| EXIT _SUB
	FIND $%~1=1d56, TEAM ENVI-ret %~2=NVIDIA GeForce MX330| EXIT _SUB
	FIND $%~1=1e04, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080 Ti| EXIT _SUB
	FIND $%~1=1e07, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080 Ti| EXIT _SUB
	FIND $%~1=1e2d, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080 Ti| EXIT _SUB
	FIND $%~1=1e2e, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080 Ti| EXIT _SUB
	FIND $%~1=1e81, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1e82, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1e84, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1e87, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1e89, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1e90, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1e91, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1e93, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1ec2, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1ec7, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1ed0, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1ed1, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1ed3, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2080| EXIT _SUB
	FIND $%~1=1f02, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1f06, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f07, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1f08, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f09, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1660| EXIT _SUB
	FIND $%~1=1f0a, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1f10, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1f11, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f12, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f14, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1f15, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f42, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f47, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f50, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1f51, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f54, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2070| EXIT _SUB
	FIND $%~1=1f55, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 2060| EXIT _SUB
	FIND $%~1=1f82, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1f91, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1f92, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1f94, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1f95, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650 Ti| EXIT _SUB
	FIND $%~1=1f96, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1f97, TEAM ENVI-ret %~2=NVIDIA GeForce MX450| EXIT _SUB
	FIND $%~1=1f98, TEAM ENVI-ret %~2=NVIDIA GeForce MX450| EXIT _SUB
	FIND $%~1=1f9c, TEAM ENVI-ret %~2=NVIDIA GeForce MX450| EXIT _SUB
	FIND $%~1=1f9d, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1fd9, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=1fdd, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=2182, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1660 Ti| EXIT _SUB
	FIND $%~1=2184, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1660| EXIT _SUB
	FIND $%~1=2187, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=2188, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650| EXIT _SUB
	FIND $%~1=2191, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1660 Ti| EXIT _SUB
	FIND $%~1=2192, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1650 Ti| EXIT _SUB
	FIND $%~1=21c4, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1660| EXIT _SUB
	FIND $%~1=21d1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 1660 Ti| EXIT _SUB
	FIND $%~1=2204, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3090| EXIT _SUB
	FIND $%~1=2205, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080 Ti| EXIT _SUB
	FIND $%~1=2206, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=1467, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=146d, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=2208, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080 Ti| EXIT _SUB
	FIND $%~1=2216, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=222b, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3090| EXIT _SUB
	FIND $%~1=222f, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=2420, TEAM ENVI-ret %~2=NVIDIA Geforce RTX 3080 Ti| EXIT _SUB
	FIND $%~1=2482, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070 Ti| EXIT _SUB
	FIND $%~1=2484, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=146b, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=14ae, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=2486, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060 Ti| EXIT _SUB
	FIND $%~1=2487, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2488, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=2489, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060 Ti| EXIT _SUB
	FIND $%~1=249c, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=249d, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=24a0, TEAM ENVI-ret %~2=NVIDIA Geforce RTX 3070 Ti| EXIT _SUB
	FIND $%~1=24ac, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 30x0| EXIT _SUB
	FIND $%~1=24ad, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=24af, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=24b6, TEAM ENVI-ret %~2=NVIDIA GeForce RTX A5000| EXIT _SUB
	FIND $%~1=24b7, TEAM ENVI-ret %~2=NVIDIA GeForce RTX A4000| EXIT _SUB
	FIND $%~1=24b8, TEAM ENVI-ret %~2=NVIDIA GeForce RTX A3000| EXIT _SUB
	FIND $%~1=24bf, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=24dc, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3080| EXIT _SUB
	FIND $%~1=24dd, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3070| EXIT _SUB
	FIND $%~1=2501, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2503, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2504, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2520, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2523, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050 Ti| EXIT _SUB
	FIND $%~1=252f, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2560, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3060| EXIT _SUB
	FIND $%~1=2563, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050 Ti| EXIT _SUB
	FIND $%~1=2583, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050| EXIT _SUB
	FIND $%~1=25a0, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050 Ti| EXIT _SUB
	FIND $%~1=25a2, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050| EXIT _SUB
	FIND $%~1=25a5, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050| EXIT _SUB
	FIND $%~1=25af, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050| EXIT _SUB
	FIND $%~1=25e0, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050 Ti| EXIT _SUB
	FIND $%~1=25e2, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050| EXIT _SUB
	FIND $%~1=25e5, TEAM ENVI-ret %~2=NVIDIA GeForce RTX 3050| EXIT _SUB
	FIND $%~1=0ca0, TEAM ENVI-ret %~2=NVIDIA GeForce GT 330| EXIT _SUB
	FIND $%~1=0ca2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 320| EXIT _SUB
	FIND $%~1=0ca3, TEAM ENVI-ret %~2=NVIDIA GeForce GT 240| EXIT _SUB
	FIND $%~1=0ca4, TEAM ENVI-ret %~2=NVIDIA GeForce GT 340| EXIT _SUB
	FIND $%~1=0ca5, TEAM ENVI-ret %~2=NVIDIA GeForce GT 220| EXIT _SUB
	FIND $%~1=0ca7, TEAM ENVI-ret %~2=NVIDIA GeForce GT 330| EXIT _SUB
	FIND $%~1=0ca8, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 260M| EXIT _SUB
	FIND $%~1=0cac, TEAM ENVI-ret %~2=NVIDIA GeForce GT 220| EXIT _SUB
	FIND $%~1=0cb0, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 350M| EXIT _SUB
	FIND $%~1=0cb1, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 360M| EXIT _SUB
	FIND $%~1=0dcd, TEAM ENVI-ret %~2=NVIDIA GeForce GT 555M| EXIT _SUB
	FIND $%~1=0dce, TEAM ENVI-ret %~2=NVIDIA GeForce GT 555M| EXIT _SUB
	FIND $%~1=0dd2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 445M| EXIT _SUB
	FIND $%~1=0dd3, TEAM ENVI-ret %~2=NVIDIA GeForce GT 435M| EXIT _SUB
	FIND $%~1=0dd6, TEAM ENVI-ret %~2=NVIDIA GeForce GT 550M| EXIT _SUB
	FIND $%~1=0dda, TEAM ENVI-ret %~2=NVIDIA Quadro 2000M| EXIT _SUB
	FIND $%~1=0de0, TEAM ENVI-ret %~2=NVIDIA GeForce GT 440| EXIT _SUB
	FIND $%~1=0de1, TEAM ENVI-ret %~2=NVIDIA GeForce GT 430| EXIT _SUB
	FIND $%~1=0de2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 420| EXIT _SUB
	FIND $%~1=0de3, TEAM ENVI-ret %~2=NVIDIA GeForce GT 635M| EXIT _SUB
	FIND $%~1=0de4, TEAM ENVI-ret %~2=NVIDIA GeForce GT 520| EXIT _SUB
	FIND $%~1=0de5, TEAM ENVI-ret %~2=NVIDIA GeForce GT 530| EXIT _SUB
	FIND $%~1=0de7, TEAM ENVI-ret %~2=NVIDIA GeForce GT 610| EXIT _SUB
	FIND $%~1=0de8, TEAM ENVI-ret %~2=NVIDIA GeForce GT 620M| EXIT _SUB
	FIND $%~1=0deb, TEAM ENVI-ret %~2=NVIDIA GeForce GT 555M| EXIT _SUB
	FIND $%~1=0dec, TEAM ENVI-ret %~2=NVIDIA GeForce GT 525M| EXIT _SUB
	FIND $%~1=0ded, TEAM ENVI-ret %~2=NVIDIA GeForce GT 520M| EXIT _SUB
	FIND $%~1=0dee, TEAM ENVI-ret %~2=NVIDIA GeForce GT 415M| EXIT _SUB
	FIND $%~1=0df0, TEAM ENVI-ret %~2=NVIDIA GeForce GT 425M| EXIT _SUB
	FIND $%~1=0df1, TEAM ENVI-ret %~2=NVIDIA GeForce GT 420M| EXIT _SUB
	FIND $%~1=0df2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 435M| EXIT _SUB
	FIND $%~1=0df3, TEAM ENVI-ret %~2=NVIDIA GeForce GT 420M| EXIT _SUB
	FIND $%~1=0df4, TEAM ENVI-ret %~2=NVIDIA GeForce GT 540M| EXIT _SUB
	FIND $%~1=0df5, TEAM ENVI-ret %~2=NVIDIA GeForce GT 525M| EXIT _SUB
	FIND $%~1=0df6, TEAM ENVI-ret %~2=NVIDIA GeForce GT 550M| EXIT _SUB
	FIND $%~1=0df7, TEAM ENVI-ret %~2=NVIDIA GeForce GT 520M| EXIT _SUB
	FIND $%~1=0617, TEAM ENVI-ret %~2=NVIDIA GeForce 9800M GTX| EXIT _SUB
	FIND $%~1=0618, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 260M| EXIT _SUB
	FIND $%~1=0620, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GT| EXIT _SUB
	FIND $%~1=0621, TEAM ENVI-ret %~2=NVIDIA GeForce GT 230| EXIT _SUB
	FIND $%~1=0622, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GT| EXIT _SUB
	FIND $%~1=0623, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GS| EXIT _SUB
	FIND $%~1=0624, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GT| EXIT _SUB
	FIND $%~1=0625, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GSO 512| EXIT _SUB
	FIND $%~1=0626, TEAM ENVI-ret %~2=NVIDIA GeForce GT 130| EXIT _SUB
	FIND $%~1=0627, TEAM ENVI-ret %~2=NVIDIA GeForce GT 140| EXIT _SUB
	FIND $%~1=0628, TEAM ENVI-ret %~2=NVIDIA GeForce 9800M GTS| EXIT _SUB
	FIND $%~1=062a, TEAM ENVI-ret %~2=NVIDIA GeForce 9700M GTS| EXIT _SUB
	FIND $%~1=062b, TEAM ENVI-ret %~2=NVIDIA GeForce 9800M GS| EXIT _SUB
	FIND $%~1=062c, TEAM ENVI-ret %~2=NVIDIA GeForce 9800M GTS| EXIT _SUB
	FIND $%~1=062d, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GT| EXIT _SUB
	FIND $%~1=062e, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GT| EXIT _SUB
	FIND $%~1=062f, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 S| EXIT _SUB
	FIND $%~1=0630, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GT| EXIT _SUB
	FIND $%~1=0631, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 160M| EXIT _SUB
	FIND $%~1=0632, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 150M| EXIT _SUB
	FIND $%~1=0633, TEAM ENVI-ret %~2=NVIDIA GeForce GT 220| EXIT _SUB
	FIND $%~1=0635, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GSO| EXIT _SUB
	FIND $%~1=0637, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GT| EXIT _SUB
	FIND $%~1=063f, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GE| EXIT _SUB
	FIND $%~1=0640, TEAM ENVI-ret %~2=NVIDIA GeForce 9500 GT| EXIT _SUB
	FIND $%~1=0641, TEAM ENVI-ret %~2=NVIDIA GeForce 9400 GT| EXIT _SUB
	FIND $%~1=0643, TEAM ENVI-ret %~2=NVIDIA GeForce 9500 GT| EXIT _SUB
	FIND $%~1=0644, TEAM ENVI-ret %~2=NVIDIA GeForce 9500 GS| EXIT _SUB
	FIND $%~1=0645, TEAM ENVI-ret %~2=NVIDIA GeForce 9500 GS| EXIT _SUB
	FIND $%~1=0646, TEAM ENVI-ret %~2=NVIDIA GeForce GT 120| EXIT _SUB
	FIND $%~1=0647, TEAM ENVI-ret %~2=NVIDIA GeForce 9600M GT| EXIT _SUB
	FIND $%~1=0648, TEAM ENVI-ret %~2=NVIDIA GeForce 9600M GS| EXIT _SUB
	FIND $%~1=0649, TEAM ENVI-ret %~2=NVIDIA GeForce 9600M GT| EXIT _SUB
	FIND $%~1=064a, TEAM ENVI-ret %~2=NVIDIA GeForce 9700M GT| EXIT _SUB
	FIND $%~1=064b, TEAM ENVI-ret %~2=NVIDIA GeForce 9500M G| EXIT _SUB
	FIND $%~1=064c, TEAM ENVI-ret %~2=NVIDIA GeForce 9650M GT| EXIT _SUB
	FIND $%~1=064e, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GSO| EXIT _SUB
	FIND $%~1=0651, TEAM ENVI-ret %~2=NVIDIA GeForce G 110M| EXIT _SUB
	FIND $%~1=0652, TEAM ENVI-ret %~2=NVIDIA GeForce GT 130M| EXIT _SUB
	FIND $%~1=0653, TEAM ENVI-ret %~2=NVIDIA GeForce GT 120M| EXIT _SUB
	FIND $%~1=0654, TEAM ENVI-ret %~2=NVIDIA GeForce GT 220M| EXIT _SUB
	FIND $%~1=0655, TEAM ENVI-ret %~2=NVIDIA GeForce GT 120| EXIT _SUB
	FIND $%~1=0656, TEAM ENVI-ret %~2=NVIDIA GeForce GT 120| EXIT _SUB
	FIND $%~1=065b, TEAM ENVI-ret %~2=NVIDIA GeForce 9400 GT| EXIT _SUB
	FIND $%~1=065d, TEAM ENVI-ret %~2=NVIDIA GeForce 9500 GA| EXIT _SUB
	FIND $%~1=065f, TEAM ENVI-ret %~2=NVIDIA GeForce G210| EXIT _SUB
	FIND $%~1=06c0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 480| EXIT _SUB
	FIND $%~1=06c4, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 465| EXIT _SUB
	FIND $%~1=06ca, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 480M| EXIT _SUB
	FIND $%~1=06cb, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 480| EXIT _SUB
	FIND $%~1=06cd, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 470| EXIT _SUB
	FIND $%~1=05ea, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 260| EXIT _SUB
	FIND $%~1=05eb, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 295| EXIT _SUB
	FIND $%~1=05f1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 280| EXIT _SUB
	FIND $%~1=05f2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 260| EXIT _SUB
	FIND $%~1=0600, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GTS 512| EXIT _SUB
	FIND $%~1=0601, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GT| EXIT _SUB
	FIND $%~1=0602, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GT| EXIT _SUB
	FIND $%~1=0604, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GX2| EXIT _SUB
	FIND $%~1=0605, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GT| EXIT _SUB
	FIND $%~1=0606, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GS| EXIT _SUB
	FIND $%~1=0607, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 240| EXIT _SUB
	FIND $%~1=0608, TEAM ENVI-ret %~2=NVIDIA GeForce 9800M GTX| EXIT _SUB
	FIND $%~1=0609, TEAM ENVI-ret %~2=NVIDIA GeForce 8800M GTS| EXIT _SUB
	FIND $%~1=106b, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GS| EXIT _SUB
	FIND $%~1=00a7, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GS| EXIT _SUB
	FIND $%~1=060a, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 280M| EXIT _SUB
	FIND $%~1=060b, TEAM ENVI-ret %~2=NVIDIA GeForce 9800M GT| EXIT _SUB
	FIND $%~1=060c, TEAM ENVI-ret %~2=NVIDIA GeForce 8800M GTX| EXIT _SUB
	FIND $%~1=060d, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GS| EXIT _SUB
	FIND $%~1=060f, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 285M| EXIT _SUB
	FIND $%~1=0610, TEAM ENVI-ret %~2=NVIDIA GeForce 9600 GSO| EXIT _SUB
	FIND $%~1=0191, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GTX| EXIT _SUB
	FIND $%~1=0193, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GTS| EXIT _SUB
	FIND $%~1=0194, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 Ultra| EXIT _SUB
	FIND $%~1=0400, TEAM ENVI-ret %~2=NVIDIA GeForce 8600 GTS| EXIT _SUB
	FIND $%~1=0401, TEAM ENVI-ret %~2=NVIDIA GeForce 8600 GT| EXIT _SUB
	FIND $%~1=0402, TEAM ENVI-ret %~2=NVIDIA GeForce 8600 GT| EXIT _SUB
	FIND $%~1=0403, TEAM ENVI-ret %~2=NVIDIA GeForce 8600 GS| EXIT _SUB
	FIND $%~1=0404, TEAM ENVI-ret %~2=NVIDIA GeForce 8400 GS| EXIT _SUB
	FIND $%~1=0406, TEAM ENVI-ret %~2=NVIDIA GeForce 8300 GS| EXIT _SUB
	FIND $%~1=0410, TEAM ENVI-ret %~2=NVIDIA GeForce GT 330| EXIT _SUB
	FIND $%~1=0420, TEAM ENVI-ret %~2=NVIDIA GeForce 8400 SE| EXIT _SUB
	FIND $%~1=0421, TEAM ENVI-ret %~2=NVIDIA GeForce 8500 GT| EXIT _SUB
	FIND $%~1=0422, TEAM ENVI-ret %~2=NVIDIA GeForce 8400 GS| EXIT _SUB
	FIND $%~1=0423, TEAM ENVI-ret %~2=NVIDIA GeForce 8300 GS| EXIT _SUB
	FIND $%~1=0424, TEAM ENVI-ret %~2=NVIDIA GeForce 8400 GS| EXIT _SUB
	FIND $%~1=042C, TEAM ENVI-ret %~2=NVIDIA GeForce 9400 GT| EXIT _SUB
	FIND $%~1=05E0, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 295| EXIT _SUB
	FIND $%~1=05E1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 280| EXIT _SUB
	FIND $%~1=05E2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 260| EXIT _SUB
	FIND $%~1=05E3, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 285| EXIT _SUB
	FIND $%~1=05E6, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 275| EXIT _SUB
	FIND $%~1=0603, TEAM ENVI-ret %~2=NVIDIA GeForce GT 230| EXIT _SUB
	FIND $%~1=0611, TEAM ENVI-ret %~2=NVIDIA GeForce 8800 GT| EXIT _SUB
	FIND $%~1=0612, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GTX| EXIT _SUB
	FIND $%~1=0613, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GTX| EXIT _SUB
	FIND $%~1=0614, TEAM ENVI-ret %~2=NVIDIA GeForce 9800 GT| EXIT _SUB
	FIND $%~1=0615, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 250| EXIT _SUB
	FIND $%~1=06E0, TEAM ENVI-ret %~2=NVIDIA GeForce 9300 GE| EXIT _SUB
	FIND $%~1=06E1, TEAM ENVI-ret %~2=NVIDIA GeForce 9300 GS| EXIT _SUB
	FIND $%~1=06E2, TEAM ENVI-ret %~2=NVIDIA GeForce 8400| EXIT _SUB
	FIND $%~1=06E3, TEAM ENVI-ret %~2=NVIDIA GeForce 8400 SE| EXIT _SUB
	FIND $%~1=06E4, TEAM ENVI-ret %~2=NVIDIA GeForce 8400 GS| EXIT _SUB
	FIND $%~1=06E6, TEAM ENVI-ret %~2=NVIDIA GeForce G100| EXIT _SUB
	FIND $%~1=06E7, TEAM ENVI-ret %~2=NVIDIA GeForce 9300 SE| EXIT _SUB
	FIND $%~1=06E9, TEAM ENVI-ret %~2=NVIDIA GeForce 9300M GS| EXIT _SUB
	FIND $%~1=06FF, TEAM ENVI-ret %~2=NVIDIA HICx16 + Graphics| EXIT _SUB
	FIND $%~1=0A20, TEAM ENVI-ret %~2=NVIDIA GeForce GT 220| EXIT _SUB
	FIND $%~1=0A22, TEAM ENVI-ret %~2=NVIDIA GeForce 315| EXIT _SUB
	FIND $%~1=0A23, TEAM ENVI-ret %~2=NVIDIA GeForce 210| EXIT _SUB
	FIND $%~1=0A26, TEAM ENVI-ret %~2=NVIDIA GeForce 405| EXIT _SUB
	FIND $%~1=0A27, TEAM ENVI-ret %~2=NVIDIA GeForce 405| EXIT _SUB
	FIND $%~1=0A32, TEAM ENVI-ret %~2=NVIDIA GeForce GT 415| EXIT _SUB
	FIND $%~1=0A60, TEAM ENVI-ret %~2=NVIDIA GeForce G210| EXIT _SUB
	FIND $%~1=0A62, TEAM ENVI-ret %~2=NVIDIA GeForce 205| EXIT _SUB
	FIND $%~1=0A63, TEAM ENVI-ret %~2=NVIDIA GeForce 310| EXIT _SUB
	FIND $%~1=0A65, TEAM ENVI-ret %~2=NVIDIA GeForce 210| EXIT _SUB
	FIND $%~1=0A66, TEAM ENVI-ret %~2=NVIDIA GeForce 310| EXIT _SUB
	FIND $%~1=0A67, TEAM ENVI-ret %~2=NVIDIA GeForce 315| EXIT _SUB
	FIND $%~1=0DC0, TEAM ENVI-ret %~2=NVIDIA GeForce GT 440| EXIT _SUB
	FIND $%~1=0DC4, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 450| EXIT _SUB
	FIND $%~1=0DC5, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 450| EXIT _SUB
	FIND $%~1=0DC6, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 450| EXIT _SUB
	FIND $%~1=0GeF, TEAM ENVI-ret %~2=NVIDIA GeForce GT 420| EXIT _SUB
	FIND $%~1=0E22, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 460| EXIT _SUB
	FIND $%~1=0E23, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 460 SE| EXIT _SUB
	FIND $%~1=0E24, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 460| EXIT _SUB
	FIND $%~1=0F00, TEAM ENVI-ret %~2=NVIDIA GeForce GT 630| EXIT _SUB
	FIND $%~1=0F01, TEAM ENVI-ret %~2=NVIDIA GeForce GT 620| EXIT _SUB
	FIND $%~1=0FC0, TEAM ENVI-ret %~2=NVIDIA GeForce GT 640| EXIT _SUB
	FIND $%~1=0FC1, TEAM ENVI-ret %~2=NVIDIA GeForce GT 640| EXIT _SUB
	FIND $%~1=0FC2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 630| EXIT _SUB
	FIND $%~1=0FC6, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650| EXIT _SUB
	FIND $%~1=1004, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 780| EXIT _SUB
	FIND $%~1=1005, TEAM ENVI-ret %~2=NVIDIA GeForce GTX TITAN| EXIT _SUB
	FIND $%~1=100A, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 780 Ti| EXIT _SUB
	FIND $%~1=1040, TEAM ENVI-ret %~2=NVIDIA GeForce GT 520| EXIT _SUB
	FIND $%~1=1042, TEAM ENVI-ret %~2=NVIDIA GeForce 510| EXIT _SUB
	FIND $%~1=1048, TEAM ENVI-ret %~2=NVIDIA GeForce 605| EXIT _SUB
	FIND $%~1=1049, TEAM ENVI-ret %~2=NVIDIA GeForce GT 620| EXIT _SUB
	FIND $%~1=104A, TEAM ENVI-ret %~2=NVIDIA GeForce GT 610| EXIT _SUB
	FIND $%~1=1050, TEAM ENVI-ret %~2=NVIDIA GeForce GT 520M| EXIT _SUB
	FIND $%~1=1080, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 580| EXIT _SUB
	FIND $%~1=1081, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 570| EXIT _SUB
	FIND $%~1=1082, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560 Ti| EXIT _SUB
	FIND $%~1=1084, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560| EXIT _SUB
	FIND $%~1=1086, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 570| EXIT _SUB
	FIND $%~1=1087, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 560 Ti| EXIT _SUB
	FIND $%~1=1088, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 590| EXIT _SUB
	FIND $%~1=1089, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 580| EXIT _SUB
	FIND $%~1=108B, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 580| EXIT _SUB
	FIND $%~1=10C0, TEAM ENVI-ret %~2=NVIDIA GeForce 9300 GS| EXIT _SUB
	FIND $%~1=10C3, TEAM ENVI-ret %~2=NVIDIA GeForce 8400GS| EXIT _SUB
	FIND $%~1=10C5, TEAM ENVI-ret %~2=NVIDIA GeForce 405| EXIT _SUB
	FIND $%~1=10D8, TEAM ENVI-ret %~2=NVIDIA NVS 300| EXIT _SUB
	FIND $%~1=0DEF, TEAM ENVI-ret %~2=NVIDIA NVS 5400M| EXIT _SUB
	FIND $%~1=1180, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 680| EXIT _SUB
	FIND $%~1=118A, TEAM ENVI-ret %~2=NVIDIA GRID K520| EXIT _SUB
	FIND $%~1=11C2, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650 Ti| EXIT _SUB
	FIND $%~1=11C4, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 645| EXIT _SUB
	FIND $%~1=11C8, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650| EXIT _SUB
	FIND $%~1=1207, TEAM ENVI-ret %~2=NVIDIA GeForce GT 645| EXIT _SUB
	FIND $%~1=1243, TEAM ENVI-ret %~2=NVIDIA GeForce GT 545| EXIT _SUB
	FIND $%~1=124B, TEAM ENVI-ret %~2=NVIDIA GeForce GT 640| EXIT _SUB
	FIND $%~1=0847, TEAM ENVI-ret %~2=NVIDIA GeForce 9100| EXIT _SUB
	FIND $%~1=0848, TEAM ENVI-ret %~2=NVIDIA GeForce 8300| EXIT _SUB
	FIND $%~1=0849, TEAM ENVI-ret %~2=NVIDIA GeForce 8200| EXIT _SUB
	FIND $%~1=084A, TEAM ENVI-ret %~2=NVIDIA GeForce 730a| EXIT _SUB
	FIND $%~1=084B, TEAM ENVI-ret %~2=NVIDIA GeForce 9200| EXIT _SUB
	FIND $%~1=084C, TEAM ENVI-ret %~2=NVIDIA GeForce 780a SLI| EXIT _SUB
	FIND $%~1=084F, TEAM ENVI-ret %~2=NVIDIA GeForce 8100  720a| EXIT _SUB
	FIND $%~1=0860, TEAM ENVI-ret %~2=NVIDIA GeForce 9400| EXIT _SUB
	FIND $%~1=0861, TEAM ENVI-ret %~2=NVIDIA GeForce 9400| EXIT _SUB
	FIND $%~1=0864, TEAM ENVI-ret %~2=NVIDIA GeForce 9300| EXIT _SUB
	FIND $%~1=0868, TEAM ENVI-ret %~2=NVIDIA GeForce 760i SLI| EXIT _SUB
	FIND $%~1=086A, TEAM ENVI-ret %~2=NVIDIA GeForce 9400| EXIT _SUB
	FIND $%~1=086C, TEAM ENVI-ret %~2=NVIDIA GeForce 9300  730i| EXIT _SUB
	FIND $%~1=086D, TEAM ENVI-ret %~2=NVIDIA GeForce 9200| EXIT _SUB
	FIND $%~1=0871, TEAM ENVI-ret %~2=NVIDIA GeForce 9200| EXIT _SUB
	FIND $%~1=087A, TEAM ENVI-ret %~2=NVIDIA GeForce 9400| EXIT _SUB
	FIND $%~1=0DE9, TEAM ENVI-ret %~2=NVIDIA GeForce GT 630M| EXIT _SUB
	FIND $%~1=0FD2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 640M| EXIT _SUB
	FIND $%~1=0FE4, TEAM ENVI-ret %~2=NVIDIA GeForce GT 750M| EXIT _SUB
	FIND $%~1=104B, TEAM ENVI-ret %~2=NVIDIA GeForce GT 625| EXIT _SUB
	FIND $%~1=105A, TEAM ENVI-ret %~2=NVIDIA GeForce 610M| EXIT _SUB
	FIND $%~1=0A70, TEAM ENVI-ret %~2=NVIDIA GeForce 310M| EXIT _SUB
	FIND $%~1=DE10, TEAM ENVI-ret %~2=NVIDIA GeForce GT 430| EXIT _SUB
	FIND $%~1=0FE1, TEAM ENVI-ret %~2=NVIDIA GeForce GT 730M| EXIT _SUB
	FIND $%~1=1140, TEAM ENVI-ret %~2=NVIDIA GeForce GT 720M| EXIT _SUB
	FIND $%~1=1054, TEAM ENVI-ret %~2=NVIDIA GeForce 410M| EXIT _SUB
	FIND $%~1=610D, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 650 Ti| EXIT _SUB
	FIND $%~1=0A28, TEAM ENVI-ret %~2=NVIDIA GeForce GT 230| EXIT _SUB
	FIND $%~1=0A74, TEAM ENVI-ret %~2=NVIDIA GeForce G210| EXIT _SUB
	FIND $%~1=118E, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 760| EXIT _SUB
	FIND $%~1=1290, TEAM ENVI-ret %~2=NVIDIA GeForce GT 730M| EXIT _SUB
	FIND $%~1=1058, TEAM ENVI-ret %~2=NVIDIA GeForce 610M| EXIT _SUB
	FIND $%~1=0A34, TEAM ENVI-ret %~2=NVIDIA GeForce GT 240M| EXIT _SUB
	FIND $%~1=0CA9, TEAM ENVI-ret %~2=NVIDIA GeForce GTS 250M| EXIT _SUB
	FIND $%~1=0CAF, TEAM ENVI-ret %~2=NVIDIA GeForce GT 335M| EXIT _SUB
	FIND $%~1=0DD1, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 460M| EXIT _SUB
	FIND $%~1=0DEA, TEAM ENVI-ret %~2=NVIDIA GeForce 615| EXIT _SUB
	FIND $%~1=0FD1, TEAM ENVI-ret %~2=NVIDIA GeForce GT 650| EXIT _SUB
	FIND $%~1=0FE3, TEAM ENVI-ret %~2=NVIDIA GeForce GT 745A| EXIT _SUB
	FIND $%~1=105B, TEAM ENVI-ret %~2=NVIDIA GeForce 705M| EXIT _SUB
	FIND $%~1=11A7, TEAM ENVI-ret %~2=NVIDIA GeForce GTX 675MX| EXIT _SUB
	FIND $%~1=0426, TEAM ENVI-ret %~2=NVIDIA GeForce 8400M GT| EXIT _SUB
	FIND $%~1=0FD3, TEAM ENVI-ret %~2=NVIDIA GeForce GT 640M LE| EXIT _SUB
	FIND $%~1=0FE2, TEAM ENVI-ret %~2=NVIDIA GeForce GT 745M| EXIT _SUB
	FIND $%~1=019D, TEAM ENVI-ret %~2=NVIDIA Quadro FX 5600| EXIT _SUB
	FIND $%~1=019E, TEAM ENVI-ret %~2=NVIDIA Quadro FX 4600| EXIT _SUB
	FIND $%~1=040A, TEAM ENVI-ret %~2=NVIDIA Quadro FX 370| EXIT _SUB
	FIND $%~1=040D, TEAM ENVI-ret %~2=NVIDIA Quadro FX 1600M| EXIT _SUB
	FIND $%~1=040E, TEAM ENVI-ret %~2=NVIDIA Quadro FX 570| EXIT _SUB
	FIND $%~1=040F, TEAM ENVI-ret %~2=NVIDIA Quadro FX 1700| EXIT _SUB
	FIND $%~1=042F, TEAM ENVI-ret %~2=NVIDIA Quadro NVS 290| EXIT _SUB
	FIND $%~1=11FA, TEAM ENVI-ret %~2=NVIDIA Quadro K4000| EXIT _SUB
	FIND $%~1=06DC, TEAM ENVI-ret %~2=NVIDIA Quadro 6000| EXIT _SUB
	FIND $%~1=06DD, TEAM ENVI-ret %~2=NVIDIA Quadro 4000| EXIT _SUB
	FIND $%~1=06F8, TEAM ENVI-ret %~2=NVIDIA Quadro NVS 420| EXIT _SUB
	FIND $%~1=06F9, TEAM ENVI-ret %~2=NVIDIA Quadro FX 370 LP| EXIT _SUB
	FIND $%~1=06FA, TEAM ENVI-ret %~2=NVIDIA Quadro NVS 450| EXIT _SUB
	FIND $%~1=06FB, TEAM ENVI-ret %~2=NVIDIA Quadro FX 370M| EXIT _SUB
	FIND $%~1=06FD, TEAM ENVI-ret %~2=NVIDIA Quadro NVS 295| EXIT _SUB
	FIND $%~1=0658, TEAM ENVI-ret %~2=NVIDIA Quadro FX 380| EXIT _SUB
	FIND $%~1=0659, TEAM ENVI-ret %~2=NVIDIA Quadro FX 580| EXIT _SUB
	FIND $%~1=065a, TEAM ENVI-ret %~2=NVIDIA Quadro FX 1700M| EXIT _SUB
	FIND $%~1=065c, TEAM ENVI-ret %~2=NVIDIA Quadro FX 770M| EXIT _SUB
	FIND $%~1=06d8, TEAM ENVI-ret %~2=NVIDIA Quadro 6000| EXIT _SUB
	FIND $%~1=06d9, TEAM ENVI-ret %~2=NVIDIA Quadro 5000| EXIT _SUB
	FIND $%~1=06da, TEAM ENVI-ret %~2=NVIDIA Quadro 5000M| EXIT _SUB
	FIND $%~1=05ed, TEAM ENVI-ret %~2=NVIDIA Quadro Plex 2200 D2| EXIT _SUB
	FIND $%~1=05f8, TEAM ENVI-ret %~2=NVIDIA Quadro Plex 2200 S4| EXIT _SUB
	FIND $%~1=05f9, TEAM ENVI-ret %~2=NVIDIA Quadro CX| EXIT _SUB
	FIND $%~1=05fd, TEAM ENVI-ret %~2=NVIDIA Quadro FX 5800| EXIT _SUB
	FIND $%~1=05fe, TEAM ENVI-ret %~2=NVIDIA Quadro FX 4800| EXIT _SUB
	FIND $%~1=05ff, TEAM ENVI-ret %~2=NVIDIA Quadro FX 3800| EXIT _SUB
	FIND $%~1=0638, TEAM ENVI-ret %~2=NVIDIA Quadro FX 1800| EXIT _SUB
	FIND $%~1=063a, TEAM ENVI-ret %~2=NVIDIA Quadro FX 2700M| EXIT _SUB
	FIND $%~1=0619, TEAM ENVI-ret %~2=NVIDIA Quadro FX 4700 X2| EXIT _SUB
	FIND $%~1=061a, TEAM ENVI-ret %~2=NVIDIA Quadro FX 3700| EXIT _SUB
	FIND $%~1=061b, TEAM ENVI-ret %~2=NVIDIA Quadro VX 200| EXIT _SUB
	FIND $%~1=061c, TEAM ENVI-ret %~2=NVIDIA Quadro FX 3600M| EXIT _SUB
	FIND $%~1=061d, TEAM ENVI-ret %~2=NVIDIA Quadro FX 2800M| EXIT _SUB
	FIND $%~1=061e, TEAM ENVI-ret %~2=NVIDIA Quadro FX 3700M| EXIT _SUB
	FIND $%~1=061f, TEAM ENVI-ret %~2=NVIDIA Quadro FX 3800M| EXIT _SUB
	TEAM ENVI-ret %~2=NVIDIA GeForce| EXIT _SUB
_END
_SUB AMDATI
	FIND $%~1=940f , TEAM ENVI-ret %~2=ATI FireGL V7600| EXIT _SUB
	FIND $%~1=940b, TEAM ENVI-ret %~2=ATI FireGL V8600| EXIT _SUB
	FIND $%~1=940a, TEAM ENVI-ret %~2=ATI FireGL V8650| EXIT _SUB
	FIND $%~1=724e, TEAM ENVI-ret %~2=ATI FireGL V7350| EXIT _SUB
	FIND $%~1=71f2 , TEAM ENVI-ret %~2=ATI FireGL V3400| EXIT _SUB
	FIND $%~1=71d4, TEAM ENVI-ret %~2=ATI FireGL V5250| EXIT _SUB
	FIND $%~1=71d2, TEAM ENVI-ret %~2=ATI FireGL V3400| EXIT _SUB
	FIND $%~1=71c4, TEAM ENVI-ret %~2=ATI FireGL V5200| EXIT _SUB
	FIND $%~1=719b, TEAM ENVI-ret %~2=ATI FireMV 2250| EXIT _SUB
	FIND $%~1=7153, TEAM ENVI-ret %~2=ATI FireGL V3350| EXIT _SUB
	FIND $%~1=7152, TEAM ENVI-ret %~2=ATI FireGL V3300| EXIT _SUB
	FIND $%~1=712f , TEAM ENVI-ret %~2=ATI FireGL V7350| EXIT _SUB
	FIND $%~1=712e, TEAM ENVI-ret %~2=ATI FireGL V7300| EXIT _SUB
	FIND $%~1=7124, TEAM ENVI-ret %~2=ATI FireGL V7200| EXIT _SUB
	FIND $%~1=710f , TEAM ENVI-ret %~2=ATI FireGL V7350| EXIT _SUB
	FIND $%~1=710e, TEAM ENVI-ret %~2=ATI FireGL V7300| EXIT _SUB
	FIND $%~1=7104, TEAM ENVI-ret %~2=ATI FireGL V7200| EXIT _SUB
	FIND $%~1=9511, TEAM ENVI-ret %~2=ATI FireGL V7700| EXIT _SUB
	FIND $%~1=9489, TEAM ENVI-ret %~2=ATI FireGL V5725| EXIT _SUB
	FIND $%~1=9595, TEAM ENVI-ret %~2=ATI FireGL V5700| EXIT _SUB
	FIND $%~1=958d, TEAM ENVI-ret %~2=ATI FireGL V3600| EXIT _SUB
	FIND $%~1=958c, TEAM ENVI-ret %~2=ATI FireGL V5600| EXIT _SUB
	FIND $%~1=5e48, TEAM ENVI-ret %~2=ATI FireGL V5000| EXIT _SUB
	FIND $%~1=5d50, TEAM ENVI-ret %~2=ATI FireGL V7200	| EXIT _SUB
	FIND $%~1=5d49, TEAM ENVI-ret %~2=ATI FireGL V5100| EXIT _SUB
	FIND $%~1=5d45, TEAM ENVI-ret %~2=ATI FireMV 2200| EXIT _SUB
	FIND $%~1=5b75, TEAM ENVI-ret %~2=ATI FireMV 2200| EXIT _SUB
	FIND $%~1=5b74, TEAM ENVI-ret %~2=ATI FireGL V3100| EXIT _SUB
	FIND $%~1=5b65, TEAM ENVI-ret %~2=ATI FireMV 2200| EXIT _SUB
	FIND $%~1=5b64, TEAM ENVI-ret %~2=ATI FireGL V3100| EXIT _SUB
	FIND $%~1=5965, TEAM ENVI-ret %~2=ATI FireMV 2200 | EXIT _SUB
	FIND $%~1=564b, TEAM ENVI-ret %~2=ATI FireGL V5000| EXIT _SUB
	FIND $%~1=5571, TEAM ENVI-ret %~2=ATI FireGL V5100| EXIT _SUB
	FIND $%~1=5551, TEAM ENVI-ret %~2=ATI FireGL V5100| EXIT _SUB
	FIND $%~1=5550, TEAM ENVI-ret %~2=ATI FireGL V7100| EXIT _SUB
	FIND $%~1=5464, TEAM ENVI-ret %~2=ATI FireGL V3100| EXIT _SUB
	FIND $%~1=001c, TEAM ENVI-ret %~2=ATI Rage 128 Pro 4XL| EXIT _SUB
	FIND $%~1=5452, TEAM ENVI-ret %~2=ATI Rage 128 PRO 4XL| EXIT _SUB
	FIND $%~1=002b, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=002a, TEAM ENVI-ret %~2=ATI Rage 128 AIW Pro AGP| EXIT _SUB
	FIND $%~1=0029, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=0028, TEAM ENVI-ret %~2=ATI Rage 128 AIW Pro AGP| EXIT _SUB
	FIND $%~1=0018, TEAM ENVI-ret %~2=ATI Rage Fury Pro Pro| EXIT _SUB
	FIND $%~1=0008, TEAM ENVI-ret %~2=ATI Rage Fury Pro Pro| EXIT _SUB
	FIND $%~1=0004, TEAM ENVI-ret %~2=ATI Rage Fury Pro| EXIT _SUB
	FIND $%~1=5446, TEAM ENVI-ret %~2=ATI Rage 128 PRO  AGP 4x| EXIT _SUB
	FIND $%~1=534d, TEAM ENVI-ret %~2=ATI Rage 128 4X AGP 4x| EXIT _SUB
	FIND $%~1=524c, TEAM ENVI-ret %~2=ATI Rage 128 VR AGP| EXIT _SUB
	FIND $%~1=524b, TEAM ENVI-ret %~2=ATI Rage 128 VR| EXIT _SUB
	FIND $%~1=0448, TEAM ENVI-ret %~2=ATI Rage Fury| EXIT _SUB
	FIND $%~1=0068, TEAM ENVI-ret %~2=ATI Rage 128 AIW AGP| EXIT _SUB
	FIND $%~1=0044, TEAM ENVI-ret %~2=ATI Rage Fury 128| EXIT _SUB
	FIND $%~1=0028, TEAM ENVI-ret %~2=ATI Rage 128 AIW AGP| EXIT _SUB
	FIND $%~1=0008, TEAM ENVI-ret %~2=ATI Rage 128 AGP 2x| EXIT _SUB
	FIND $%~1=5246, TEAM ENVI-ret %~2=ATI Rage 128| EXIT _SUB
	FIND $%~1=0068, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=0029, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=0028, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=5245, TEAM ENVI-ret %~2=ATI Rage 128 GL| EXIT _SUB
	FIND $%~1=0172, TEAM ENVI-ret %~2=ATI FireGL 8700 64Mb| EXIT _SUB
	FIND $%~1=0162, TEAM ENVI-ret %~2=ATI FireGL 8700 32Mb| EXIT _SUB
	FIND $%~1=0152, TEAM ENVI-ret %~2=ATI FireGL 8800 128Mb| EXIT _SUB
	FIND $%~1=010a, TEAM ENVI-ret %~2=ATI FireGL 8800 64Mb| EXIT _SUB
	FIND $%~1=5148, TEAM ENVI-ret %~2=ATI FireGL 8800| EXIT _SUB
	FIND $%~1=5052, TEAM ENVI-ret %~2=ATI Rage 128 PRO AGP 4X| EXIT _SUB
	FIND $%~1=5050, TEAM ENVI-ret %~2=ATI Rage 128 PRO| EXIT _SUB
	FIND $%~1=2001, TEAM ENVI-ret %~2=ATI Rage Fury AGP 4x | EXIT _SUB
	FIND $%~1=2000, TEAM ENVI-ret %~2=ATI Rage Fury AGP 4x| EXIT _SUB
	FIND $%~1=0048, TEAM ENVI-ret %~2=ATI Rage Fury Pro| EXIT _SUB
	FIND $%~1=002a, TEAM ENVI-ret %~2=ATI Rage 128 Pro AIW AGP| EXIT _SUB
	FIND $%~1=0028, TEAM ENVI-ret %~2=ATI Rage 128 Pro AIW AGP| EXIT _SUB
	FIND $%~1=0018, TEAM ENVI-ret %~2=ATI Rage Fury Pro| EXIT _SUB
	FIND $%~1=0014, TEAM ENVI-ret %~2=ATI Rage Fury Pro| EXIT _SUB
	FIND $%~1=0008, TEAM ENVI-ret %~2=ATI Rage Fury Pro| EXIT _SUB
	FIND $%~1=0004, TEAM ENVI-ret %~2=ATI Rage Fury Pro| EXIT _SUB
	FIND $%~1=5046, TEAM ENVI-ret %~2=ATI Rage 128 PRO AGP 4X| EXIT _SUB
	FIND $%~1=0029, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=0028, TEAM ENVI-ret %~2=ATI Rage 128 AIW| EXIT _SUB
	FIND $%~1=4e67, TEAM ENVI-ret %~2=ATI FireGL X1| EXIT _SUB
	FIND $%~1=4e54, TEAM ENVI-ret %~2=ATI FireGL T2| EXIT _SUB
	FIND $%~1=4e4b, TEAM ENVI-ret %~2=ATI FireGL X2 AGP Pro| EXIT _SUB
	FIND $%~1=4e47, TEAM ENVI-ret %~2=ATI FireGL X1| EXIT _SUB
	FIND $%~1=4d46, TEAM ENVI-ret %~2=ATI Rage 128 AGP | EXIT _SUB
	FIND $%~1=4c66, TEAM ENVI-ret %~2=ATI FireGL 9000| EXIT _SUB
	FIND $%~1=4c58, TEAM ENVI-ret %~2=ATI FireGL 7800| EXIT _SUB
	FIND $%~1=4c52, TEAM ENVI-ret %~2=ATI Rage M1| EXIT _SUB
	FIND $%~1=4c50, TEAM ENVI-ret %~2=ATI Rage LT Pro| EXIT _SUB
	FIND $%~1=4c50, TEAM ENVI-ret %~2=ATI 3D Rage LT PRO| EXIT _SUB
	FIND $%~1=4c4d, TEAM ENVI-ret %~2=ATI Rage  AGP 2x| EXIT _SUB
	FIND $%~1=4c49, TEAM ENVI-ret %~2=ATI Rage LT Pro| EXIT _SUB
	FIND $%~1=0044, TEAM ENVI-ret %~2=ATI Rage LT Pro| EXIT _SUB
	FIND $%~1=0040, TEAM ENVI-ret %~2=ATI Rage LT Pro| EXIT _SUB
	FIND $%~1=0004, TEAM ENVI-ret %~2=ATI Rage LT Pro| EXIT _SUB
	FIND $%~1=4c49, TEAM ENVI-ret %~2=ATI 3D Rage LT PRO| EXIT _SUB
	FIND $%~1=4c47, TEAM ENVI-ret %~2=ATI 3D Rage II| EXIT _SUB
	FIND $%~1=4c46, TEAM ENVI-ret %~2=ATI Rage  128 AGP 2X| EXIT _SUB
	FIND $%~1=8001, TEAM ENVI-ret %~2=ATI Rage LT Pro AGP 2X| EXIT _SUB
	FIND $%~1=4c42, TEAM ENVI-ret %~2=ATI Rage LT Pro AGP 2X| EXIT _SUB
	FIND $%~1=0044, TEAM ENVI-ret %~2=ATI Rage LT Pro AGP 2X| EXIT _SUB
	FIND $%~1=0040, TEAM ENVI-ret %~2=ATI Rage LT Pro AGP 2X| EXIT _SUB
	FIND $%~1=4c42, TEAM ENVI-ret %~2=ATI 3D Rage LT PRO AGP| EXIT _SUB
	FIND $%~1=4a4d, TEAM ENVI-ret %~2=ATI FireGL X3-256| EXIT _SUB
	FIND $%~1=475a, TEAM ENVI-ret %~2=ATI Rage IIC AGP| EXIT _SUB
	FIND $%~1=0087, TEAM ENVI-ret %~2=ATI Rage 3D IIC| EXIT _SUB
	FIND $%~1=0084, TEAM ENVI-ret %~2=ATI Rage 3D Pro AGP 2x| EXIT _SUB
	FIND $%~1=475a, TEAM ENVI-ret %~2=ATI 3D Rage IIC AGP| EXIT _SUB
	FIND $%~1=4759, TEAM ENVI-ret %~2=ATI 3D Rage IIC| EXIT _SUB
	FIND $%~1=4757, TEAM ENVI-ret %~2=ATI Rage IIC AGP| EXIT _SUB
	FIND $%~1=4757, TEAM ENVI-ret %~2=ATI 3D Rage IIC AGP| EXIT _SUB
	FIND $%~1=4756, TEAM ENVI-ret %~2=ATI Rage IIC| EXIT _SUB
	FIND $%~1=4753, TEAM ENVI-ret %~2=ATI Rage XC| EXIT _SUB
	FIND $%~1=4753, TEAM ENVI-ret %~2=ATI Rage XC| EXIT _SUB
	FIND $%~1=8008, TEAM ENVI-ret %~2=ATI Rage XL| EXIT _SUB
	FIND $%~1=0008, TEAM ENVI-ret %~2=ATI Rage XL| EXIT _SUB
	FIND $%~1=4752, TEAM ENVI-ret %~2=ATI Rage XL| EXIT _SUB
	FIND $%~1=4750, TEAM ENVI-ret %~2=ATI Rage Pro Turbo| EXIT _SUB
	FIND $%~1=0084, TEAM ENVI-ret %~2=ATI Rage Pro Turbo| EXIT _SUB
	FIND $%~1=0080, TEAM ENVI-ret %~2=ATI Rage Pro Turbo| EXIT _SUB
	FIND $%~1=0044, TEAM ENVI-ret %~2=ATI Rage Pro Turbo| EXIT _SUB
	FIND $%~1=0040, TEAM ENVI-ret %~2=ATI Rage Pro Turbo| EXIT _SUB
	FIND $%~1=4750, TEAM ENVI-ret %~2=ATI 3D Rage Pro| EXIT _SUB
	FIND $%~1=474f , TEAM ENVI-ret %~2=ATI Rage XL| EXIT _SUB
	FIND $%~1=0008, TEAM ENVI-ret %~2=ATI Rage XL| EXIT _SUB
	FIND $%~1=474f , TEAM ENVI-ret %~2=ATI Rage XL| EXIT _SUB
	FIND $%~1=474e, TEAM ENVI-ret %~2=ATI Rage XC AGP| EXIT _SUB
	FIND $%~1=474e, TEAM ENVI-ret %~2=ATI Rage XC AGP| EXIT _SUB
	FIND $%~1=474d, TEAM ENVI-ret %~2=ATI Rage XL AGP| EXIT _SUB
	FIND $%~1=0080, TEAM ENVI-ret %~2=ATI Rage XL AGP 2X| EXIT _SUB
	FIND $%~1=474d, TEAM ENVI-ret %~2=ATI Rage XL AGP 2X| EXIT _SUB
	FIND $%~1=0062, TEAM ENVI-ret %~2=ATI Rage Pro AIW| EXIT _SUB
	FIND $%~1=0061, TEAM ENVI-ret %~2=ATI Rage Pro AIW| EXIT _SUB
	FIND $%~1=4749, TEAM ENVI-ret %~2=ATI 3D Rage PRO| EXIT _SUB
	FIND $%~1=4744, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP| EXIT _SUB
	FIND $%~1=4744, TEAM ENVI-ret %~2=ATI 3D Rage PRO AGP 1X| EXIT _SUB
	FIND $%~1=8001, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP 2X| EXIT _SUB
	FIND $%~1=4742, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP 2X| EXIT _SUB
	FIND $%~1=0084, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP 2X| EXIT _SUB
	FIND $%~1=0080, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP 2X| EXIT _SUB
	FIND $%~1=0063, TEAM ENVI-ret %~2=ATI Rage Pro AIW AGP 2X| EXIT _SUB
	FIND $%~1=0062, TEAM ENVI-ret %~2=ATI Rage Pro AIW AGP 2X| EXIT _SUB
	FIND $%~1=0061, TEAM ENVI-ret %~2=ATI Rage Pro AIW AGP 2X| EXIT _SUB
	FIND $%~1=0044, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP 2X| EXIT _SUB
	FIND $%~1=0040, TEAM ENVI-ret %~2=ATI Rage Pro Turbo AGP 2X| EXIT _SUB
	FIND $%~1=4742, TEAM ENVI-ret %~2=ATI 3D Rage PRO AGP 2X| EXIT _SUB
	FIND $%~1=4157, TEAM ENVI-ret %~2=ATI FireGL T2| EXIT _SUB
	FIND $%~1=4154, TEAM ENVI-ret %~2=ATI FireGL T2| EXIT _SUB
	FIND $%~1=4147, TEAM ENVI-ret %~2=ATI FireGL Z1| EXIT _SUB
	FIND $%~1=3e54, TEAM ENVI-ret %~2=ATI FireGL V3200| EXIT _SUB
	FIND $%~1=3171, TEAM ENVI-ret %~2=ATI FireMV 2400| EXIT _SUB
	FIND $%~1=3155, TEAM ENVI-ret %~2=ATI FireMV 2400| EXIT _SUB
	FIND $%~1=3154, TEAM ENVI-ret %~2=ATI FireGL V3200| EXIT _SUB
	FIND $%~1=3151, TEAM ENVI-ret %~2=ATI FireMV 2400| EXIT _SUB
	FIND $%~1=4e4a, TEAM ENVI-ret %~2=AMD Radeon 9800 XT| EXIT _SUB
	FIND $%~1=4e71, TEAM ENVI-ret %~2=AMD Radeon 9600| EXIT _SUB
	FIND $%~1=4e6a, TEAM ENVI-ret %~2=AMD Radeon 9800 XT| EXIT _SUB
	FIND $%~1=5954, TEAM ENVI-ret %~2=AMD Radeon Xpress 200G| EXIT _SUB
	FIND $%~1=3000, TEAM ENVI-ret %~2=AMD Radeon HD 7950 Boost| EXIT _SUB
	FIND $%~1=3001, TEAM ENVI-ret %~2=AMD Radeon R9 280X| EXIT _SUB
	FIND $%~1=3000, TEAM ENVI-ret %~2=AMD Radeon HD 7970| EXIT _SUB
	FIND $%~1=0b2a, TEAM ENVI-ret %~2=AMD FirePro S10000| EXIT _SUB
	FIND $%~1=0b0e, TEAM ENVI-ret %~2=AMD FirePro S10000 Passive| EXIT _SUB
	FIND $%~1=0710, TEAM ENVI-ret %~2=AMD FirePro S9050| EXIT _SUB
	FIND $%~1=0310, TEAM ENVI-ret %~2=AMD FirePro S9000| EXIT _SUB
	FIND $%~1=030c, TEAM ENVI-ret %~2=AMD FirePro W8000| EXIT _SUB
	FIND $%~1=678a, TEAM ENVI-ret %~2=AMD FirePro | EXIT _SUB
	FIND $%~1=6788, TEAM ENVI-ret %~2=AMD FirePro  Graphics Adapter| EXIT _SUB
	FIND $%~1=6784, TEAM ENVI-ret %~2=AMD FirePro  Graphics Adapter| EXIT _SUB
	FIND $%~1=6780, TEAM ENVI-ret %~2=AMD FirePro W9000| EXIT _SUB
	FIND $%~1=674a, TEAM ENVI-ret %~2=AMD FirePro V3900| EXIT _SUB
	FIND $%~1=6707, TEAM ENVI-ret %~2=AMD FirePro V5900| EXIT _SUB
	FIND $%~1=6704, TEAM ENVI-ret %~2=AMD FirePro V7900| EXIT _SUB
	FIND $%~1=664d, TEAM ENVI-ret %~2=AMD FirePro W5100| EXIT _SUB
	FIND $%~1=0b0c, TEAM ENVI-ret %~2=AMD FirePro W4300| EXIT _SUB
	FIND $%~1=6649, TEAM ENVI-ret %~2=AMD FirePro W5100| EXIT _SUB
	FIND $%~1=6640, TEAM ENVI-ret %~2=AMD FirePro M6100| EXIT _SUB
	FIND $%~1=6609, TEAM ENVI-ret %~2=AMD FirePro W2100| EXIT _SUB
	FIND $%~1=6608, TEAM ENVI-ret %~2=AMD FirePro W2100| EXIT _SUB
	FIND $%~1=9557, TEAM ENVI-ret %~2=AMD FirePro RG220| EXIT _SUB
	FIND $%~1=94a3, TEAM ENVI-ret %~2=AMD FirePro M7740| EXIT _SUB
	FIND $%~1=949f , TEAM ENVI-ret %~2=AMD FirePro V3750| EXIT _SUB
	FIND $%~1=949e, TEAM ENVI-ret %~2=AMD FirePro V5700| EXIT _SUB
	FIND $%~1=949c, TEAM ENVI-ret %~2=AMD FirePro V7750| EXIT _SUB
	FIND $%~1=946a, TEAM ENVI-ret %~2=AMD FirePro M7750| EXIT _SUB
	FIND $%~1=9456, TEAM ENVI-ret %~2=AMD FirePro V8700| EXIT _SUB
	FIND $%~1=9446, TEAM ENVI-ret %~2=AMD FirePro V7760| EXIT _SUB
	FIND $%~1=9444, TEAM ENVI-ret %~2=AMD FirePro V8750| EXIT _SUB
	FIND $%~1=693b, TEAM ENVI-ret %~2=AMD FirePro W7100| EXIT _SUB
	FIND $%~1=692f , TEAM ENVI-ret %~2=AMD FirePro S7150V| EXIT _SUB
	FIND $%~1=692b, TEAM ENVI-ret %~2=AMD FirePro W7100| EXIT _SUB
	FIND $%~1=6929, TEAM ENVI-ret %~2=AMD FirePro S7150| EXIT _SUB
	FIND $%~1=68f2 , TEAM ENVI-ret %~2=AMD FirePro 2270| EXIT _SUB
	FIND $%~1=68f1 , TEAM ENVI-ret %~2=AMD FirePro 2460| EXIT _SUB
	FIND $%~1=68e9, TEAM ENVI-ret %~2=AMD FirePro| EXIT _SUB
	FIND $%~1=68c9, TEAM ENVI-ret %~2=AMD FirePro V3800| EXIT _SUB
	FIND $%~1=68c8, TEAM ENVI-ret %~2=AMD FirePro V4800| EXIT _SUB
	FIND $%~1=68a9, TEAM ENVI-ret %~2=AMD FirePro V5800| EXIT _SUB
	FIND $%~1=030c, TEAM ENVI-ret %~2=AMD FirePro V9800P| EXIT _SUB
	FIND $%~1=688a, TEAM ENVI-ret %~2=AMD FirePro V9800| EXIT _SUB
	FIND $%~1=0301, TEAM ENVI-ret %~2=AMD FirePro V7800P| EXIT _SUB
	FIND $%~1=6889, TEAM ENVI-ret %~2=AMD FirePro V7800| EXIT _SUB
	FIND $%~1=6888, TEAM ENVI-ret %~2=AMD FirePro V8800| EXIT _SUB
	FIND $%~1=682d, TEAM ENVI-ret %~2=AMD FirePro M4000| EXIT _SUB
	FIND $%~1=682c, TEAM ENVI-ret %~2=AMD FirePro W4100| EXIT _SUB
	FIND $%~1=6828, TEAM ENVI-ret %~2=AMD FirePro W600| EXIT _SUB
	FIND $%~1=031e, TEAM ENVI-ret %~2=AMD FirePro SX4000| EXIT _SUB
	FIND $%~1=6809, TEAM ENVI-ret %~2=AMD FirePro W5000| EXIT _SUB
	FIND $%~1=0310, TEAM ENVI-ret %~2=AMD FirePro S7000| EXIT _SUB
	FIND $%~1=6808, TEAM ENVI-ret %~2=AMD FirePro W7000| EXIT _SUB
	FIND $%~1=0335, TEAM ENVI-ret %~2=AMD FirePro S9100| EXIT _SUB
	FIND $%~1=67a1, TEAM ENVI-ret %~2=AMD FirePro W8100| EXIT _SUB
	FIND $%~1=0735, TEAM ENVI-ret %~2=AMD FirePro S9170| EXIT _SUB
	FIND $%~1=0335, TEAM ENVI-ret %~2=AMD FirePro S9150| EXIT _SUB
	FIND $%~1=67a0, TEAM ENVI-ret %~2=AMD FirePro W9100| EXIT _SUB
	FIND $%~1=9906, TEAM ENVI-ret %~2=AMD FirePro A320| EXIT _SUB
	FIND $%~1=9905, TEAM ENVI-ret %~2=AMD FirePro A300| EXIT _SUB
	FIND $%~1=95cf , TEAM ENVI-ret %~2=AMD FirePro 2260| EXIT _SUB
	FIND $%~1=95cd, TEAM ENVI-ret %~2=AMD FirePro 2450| EXIT _SUB
	FIND $%~1=95cc , TEAM ENVI-ret %~2=AMD FirePro V3700| EXIT _SUB
	FIND $%~1=6570, TEAM ENVI-ret %~2=AMD Radeon HD 6570| EXIT _SUB
	FIND $%~1=6743, TEAM ENVI-ret %~2=AMD Radeon E6760| EXIT _SUB
	FIND $%~1=5d77, TEAM ENVI-ret %~2=AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=5d52, TEAM ENVI-ret %~2=AMD Radeon X850 XT| EXIT _SUB
	FIND $%~1=5d48, TEAM ENVI-ret %~2=AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=4c57, TEAM ENVI-ret %~2=AMD Radeon 7500| EXIT _SUB
	FIND $%~1=5d44, TEAM ENVI-ret %~2=AMD Radeon 9200 SE| EXIT _SUB
	FIND $%~1=6798, TEAM ENVI-ret %~2=AMD Radeon HD 7970| EXIT _SUB
	FIND $%~1=0422, TEAM ENVI-ret %~2=AMD Radeon Sky 900| EXIT _SUB
	FIND $%~1=0420, TEAM ENVI-ret %~2=AMD Radeon Sky 700| EXIT _SUB
	FIND $%~1=6613, TEAM ENVI-ret %~2=AMD Radeon R7 240| EXIT _SUB
	FIND $%~1=6611, TEAM ENVI-ret %~2=AMD Radeon HD 8570| EXIT _SUB
	FIND $%~1=6610, TEAM ENVI-ret %~2=AMD Radeon HD 8670| EXIT _SUB
	FIND $%~1=6647, TEAM ENVI-ret %~2=AMD Radeon R9 M280X| EXIT _SUB
	FIND $%~1=6646, TEAM ENVI-ret %~2=AMD Radeon R9 M280X| EXIT _SUB
	FIND $%~1=6641, TEAM ENVI-ret %~2=AMD Radeon HD 8930M| EXIT _SUB
	FIND $%~1=5d72, TEAM ENVI-ret %~2=AMD Radeon X850 XT| EXIT _SUB
	FIND $%~1=5d6f , TEAM ENVI-ret %~2=AMD Radeon X800 GTO| EXIT _SUB
	FIND $%~1=5d6d, TEAM ENVI-ret %~2=AMD Radeon X850 XT| EXIT _SUB
	FIND $%~1=5d57, TEAM ENVI-ret %~2=AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=5d4f , TEAM ENVI-ret %~2=AMD Radeon X800 GTO| EXIT _SUB
	FIND $%~1=5d4e, TEAM ENVI-ret %~2=AMD Radeon X850 SE| EXIT _SUB
	FIND $%~1=5d4d, TEAM ENVI-ret %~2=AMD Radeon X850 XT| EXIT _SUB
	FIND $%~1=5d4a, TEAM ENVI-ret %~2=AMD Radeon X800| EXIT _SUB
	FIND $%~1=5c63, TEAM ENVI-ret %~2=AMD Radeon 9200 AGP| EXIT _SUB
	FIND $%~1=5c61, TEAM ENVI-ret %~2=AMD Radeon 9200 AGP| EXIT _SUB
	FIND $%~1=5b73, TEAM ENVI-ret %~2=AMD Radeon X1050 | EXIT _SUB
	FIND $%~1=5b72, TEAM ENVI-ret %~2=AMD Radeon X1050 | EXIT _SUB
	FIND $%~1=5b70, TEAM ENVI-ret %~2=AMD Radeon X300 SE| EXIT _SUB
	FIND $%~1=5044, TEAM ENVI-ret %~2=AMD All-In-Wonder 128| EXIT _SUB
	FIND $%~1=4f73 , TEAM ENVI-ret %~2=AMD Radeon 9000 | EXIT _SUB
	FIND $%~1=4f72 , TEAM ENVI-ret %~2=AMD Radeon 9000 | EXIT _SUB
	FIND $%~1=4e71, TEAM ENVI-ret %~2=AMD Radeon 9600| EXIT _SUB
	FIND $%~1=4e6a, TEAM ENVI-ret %~2=AMD Radeon 9800 XT| EXIT _SUB
	FIND $%~1=4e69, TEAM ENVI-ret %~2=AMD Radeon 9800| EXIT _SUB
	FIND $%~1=4e68, TEAM ENVI-ret %~2=AMD Radeon 9800 PRO| EXIT _SUB
	FIND $%~1=4e52, TEAM ENVI-ret %~2=AMD Radeon 9500| EXIT _SUB
	FIND $%~1=4e51, TEAM ENVI-ret %~2=AMD Radeon 9550/9600/X1050 | EXIT _SUB
	FIND $%~1=4e50, TEAM ENVI-ret %~2=AMD Radeon 9700| EXIT _SUB
	FIND $%~1=4e4a, TEAM ENVI-ret %~2=AMD Radeon 9800 XT| EXIT _SUB
	FIND $%~1=4e49, TEAM ENVI-ret %~2=AMD Radeon 9800| EXIT _SUB
	FIND $%~1=4e48, TEAM ENVI-ret %~2=AMD Radeon 9800 | EXIT _SUB
	FIND $%~1=4c6e, TEAM ENVI-ret %~2=AMD Radeon 9000| EXIT _SUB
	FIND $%~1=4155, TEAM ENVI-ret %~2=AMD Radeon 9600| EXIT _SUB
	FIND $%~1=4337, TEAM ENVI-ret %~2=AMD Radeon IGP 350M| EXIT _SUB
	FIND $%~1=3152, TEAM ENVI-ret %~2=AMD Radeon X300| EXIT _SUB
	FIND $%~1=3e50, TEAM ENVI-ret %~2=AMD Radeon X600| EXIT _SUB
	FIND $%~1=4146, TEAM ENVI-ret %~2=AMD Radeon 9700 PRO| EXIT _SUB
	FIND $%~1=4144, TEAM ENVI-ret %~2=AMD Radeon 9500| EXIT _SUB
	FIND $%~1=4137, TEAM ENVI-ret %~2=AMD Radeon IGP 340| EXIT _SUB
	FIND $%~1=3e70, TEAM ENVI-ret %~2=AMD Radeon X600| EXIT _SUB
	FIND $%~1=4336, TEAM ENVI-ret %~2=AMD Radeon IGP 320M| EXIT _SUB
	FIND $%~1=4243, TEAM ENVI-ret %~2=AMD All-In-Wonder Radeon 8500DV| EXIT _SUB
	FIND $%~1=02aa, TEAM ENVI-ret %~2=AMD Radeon 8500 AIW DV| EXIT _SUB
	FIND $%~1=4242, TEAM ENVI-ret %~2=AMD All-In-Wonder Radeon 8500 DV| EXIT _SUB
	FIND $%~1=4173, TEAM ENVI-ret %~2=AMD Radeon 9550| EXIT _SUB
	FIND $%~1=4773, TEAM ENVI-ret %~2=AMD All-In-Wonder 9600 XT| EXIT _SUB
	FIND $%~1=0003, TEAM ENVI-ret %~2=AMD Radeon 9600XT| EXIT _SUB
	FIND $%~1=4172, TEAM ENVI-ret %~2=AMD Radeon 9600/X1050 | EXIT _SUB
	FIND $%~1=4171, TEAM ENVI-ret %~2=AMD Radeon 9600| EXIT _SUB
	FIND $%~1=4723, TEAM ENVI-ret %~2=AMD All-In-Wonder 2006 AGP| EXIT _SUB
	FIND $%~1=0003, TEAM ENVI-ret %~2=AMD  R9600 Pro secondary| EXIT _SUB
	FIND $%~1=4170, TEAM ENVI-ret %~2=AMD Radeon 9550/9600/X1050 | EXIT _SUB
	FIND $%~1=4168, TEAM ENVI-ret %~2=AMD Radeon 9800 SE| EXIT _SUB
	FIND $%~1=4166, TEAM ENVI-ret %~2=AMD Radeon 9700 PRO| EXIT _SUB
	FIND $%~1=4165, TEAM ENVI-ret %~2=AMD Radeon 9700 PRO| EXIT _SUB
	FIND $%~1=4164, TEAM ENVI-ret %~2=AMD Radeon 9500 PRO| EXIT _SUB
	FIND $%~1=4153, TEAM ENVI-ret %~2=AMD Radeon 9550| EXIT _SUB
	FIND $%~1=4772, TEAM ENVI-ret %~2=AMD All-In-Wonder 9600 XT| EXIT _SUB
	FIND $%~1=0002, TEAM ENVI-ret %~2=AMD Radeon 9600XT| EXIT _SUB
	FIND $%~1=4152, TEAM ENVI-ret %~2=AMD Radeon 9600| EXIT _SUB
	FIND $%~1=4151, TEAM ENVI-ret %~2=AMD Radeon 9600| EXIT _SUB
	FIND $%~1=4722, TEAM ENVI-ret %~2=AMD All-In-Wonder 2006 AGP| EXIT _SUB
	FIND $%~1=0003, TEAM ENVI-ret %~2=AMD  R9600 Pro secondary| EXIT _SUB
	FIND $%~1=0002, TEAM ENVI-ret %~2=AMD  R9600 Pro primary| EXIT _SUB
	FIND $%~1=4150, TEAM ENVI-ret %~2=AMD Radeon X1050| EXIT _SUB
	FIND $%~1=4148, TEAM ENVI-ret %~2=AMD Radeon 9800 SE| EXIT _SUB
	FIND $%~1=3150, TEAM ENVI-ret %~2=AMD Radeon X600| EXIT _SUB
	FIND $%~1=1714, TEAM ENVI-ret %~2=AMD Radeon HD 6500D| EXIT _SUB
	FIND $%~1=154c, TEAM ENVI-ret %~2=AMD Radeon RX 350| EXIT _SUB
	FIND $%~1=131d, TEAM ENVI-ret %~2=AMD Radeon R6 Graphics| EXIT _SUB
	FIND $%~1=131c, TEAM ENVI-ret %~2=AMD Radeon R7 Graphics| EXIT _SUB
	FIND $%~1=131b, TEAM ENVI-ret %~2=AMD Radeon R4 Graphics| EXIT _SUB
	FIND $%~1=1318, TEAM ENVI-ret %~2=AMD Radeon R5 Graphics| EXIT _SUB
	FIND $%~1=1316, TEAM ENVI-ret %~2=AMD Radeon R5 Graphics| EXIT _SUB
	FIND $%~1=1315, TEAM ENVI-ret %~2=AMD Radeon R5 Graphics| EXIT _SUB
	FIND $%~1=1313, TEAM ENVI-ret %~2=AMD Radeon R7 Graphics| EXIT _SUB
	FIND $%~1=130f , TEAM ENVI-ret %~2=AMD Radeon R7 Graphics| EXIT _SUB
	FIND $%~1=130e, TEAM ENVI-ret %~2=AMD Radeon R5 Graphics| EXIT _SUB
	FIND $%~1=130d, TEAM ENVI-ret %~2=AMD Radeon R6 Graphics| EXIT _SUB
	FIND $%~1=130c, TEAM ENVI-ret %~2=AMD Radeon R7 Graphics| EXIT _SUB
	FIND $%~1=130b, TEAM ENVI-ret %~2=AMD Radeon R4 Graphics| EXIT _SUB
	FIND $%~1=130a, TEAM ENVI-ret %~2=AMD Radeon R6 Graphics| EXIT _SUB
	FIND $%~1=0b01, TEAM ENVI-ret %~2=AMD Radeon HD 8950| EXIT _SUB
	FIND $%~1=679a, TEAM ENVI-ret %~2=AMD Radeon HD 7950| EXIT _SUB
	FIND $%~1=4000, TEAM ENVI-ret %~2=AMD Radeon HD 8970| EXIT _SUB
	FIND $%~1=679e, TEAM ENVI-ret %~2=AMD Radeon HD 7870 XT| EXIT _SUB
	FIND $%~1=0b2a, TEAM ENVI-ret %~2=AMD Radeon HD 7990| EXIT _SUB
	FIND $%~1=0b28, TEAM ENVI-ret %~2=AMD Radeon HD 8990| EXIT _SUB
	FIND $%~1=679b, TEAM ENVI-ret %~2=AMD Radeon HD 7990| EXIT _SUB
	FIND $%~1=0420, TEAM ENVI-ret %~2=AMD Radeon Sky 500| EXIT _SUB
	FIND $%~1=6827, TEAM ENVI-ret %~2=AMD Radeon HD 7850M| EXIT _SUB
	FIND $%~1=6826, TEAM ENVI-ret %~2=AMD Radeon HD 7700M | EXIT _SUB
	FIND $%~1=6825, TEAM ENVI-ret %~2=AMD Radeon HD 7870M| EXIT _SUB
	FIND $%~1=6823, TEAM ENVI-ret %~2=AMD Radeon HD 8850M| EXIT _SUB
	FIND $%~1=6822, TEAM ENVI-ret %~2=AMD Radeon E8860| EXIT _SUB
	FIND $%~1=682b, TEAM ENVI-ret %~2=AMD Radeon HD 8830M| EXIT _SUB
	FIND $%~1=68a8, TEAM ENVI-ret %~2=AMD Radeon HD 6850M| EXIT _SUB
	FIND $%~1=68a1, TEAM ENVI-ret %~2=AMD Radeon HD 5850| EXIT _SUB
	FIND $%~1=68a0, TEAM ENVI-ret %~2=AMD Radeon HD 5870| EXIT _SUB
	FIND $%~1=689e, TEAM ENVI-ret %~2=AMD Radeon HD 5830| EXIT _SUB
	FIND $%~1=689d, TEAM ENVI-ret %~2=AMD Radeon HD 5970| EXIT _SUB
	FIND $%~1=689c, TEAM ENVI-ret %~2=AMD Radeon HD 5970| EXIT _SUB
	FIND $%~1=689b, TEAM ENVI-ret %~2=AMD Radeon HD 6800 | EXIT _SUB
	FIND $%~1=6899, TEAM ENVI-ret %~2=AMD Radeon HD 5850| EXIT _SUB
	FIND $%~1=0b00, TEAM ENVI-ret %~2=AMD Radeon HD 5870| EXIT _SUB
	FIND $%~1=6898, TEAM ENVI-ret %~2=AMD Radeon HD 5870| EXIT _SUB
	FIND $%~1=68c7, TEAM ENVI-ret %~2=AMD Radeon HD 5570| EXIT _SUB
	FIND $%~1=68c1, TEAM ENVI-ret %~2=AMD Radeon HD 6550M| EXIT _SUB
	FIND $%~1=68c0, TEAM ENVI-ret %~2=AMD Radeon HD 6570M| EXIT _SUB
	FIND $%~1=68bf , TEAM ENVI-ret %~2=AMD Radeon HD 6750| EXIT _SUB
	FIND $%~1=68be, TEAM ENVI-ret %~2=AMD Radeon HD 5750| EXIT _SUB
	FIND $%~1=68ba, TEAM ENVI-ret %~2=AMD Radeon HD 6770| EXIT _SUB
	FIND $%~1=68b9, TEAM ENVI-ret %~2=AMD Radeon HD 5670 640SP| EXIT _SUB
	FIND $%~1=68b8, TEAM ENVI-ret %~2=AMD Radeon HD 5770| EXIT _SUB
	FIND $%~1=68da, TEAM ENVI-ret %~2=AMD Radeon HD 5550| EXIT _SUB
	FIND $%~1=68d9, TEAM ENVI-ret %~2=AMD Radeon HD 5550| EXIT _SUB
	FIND $%~1=68d8, TEAM ENVI-ret %~2=AMD Radeon HD 5670| EXIT _SUB
	FIND $%~1=68e5, TEAM ENVI-ret %~2=AMD Radeon HD 6330M| EXIT _SUB
	FIND $%~1=68e4, TEAM ENVI-ret %~2=AMD Radeon HD 6370M| EXIT _SUB
	FIND $%~1=68e1, TEAM ENVI-ret %~2=AMD Radeon HD 5430| EXIT _SUB
	FIND $%~1=68e0, TEAM ENVI-ret %~2=AMD Radeon HD 5430| EXIT _SUB
	FIND $%~1=6921, TEAM ENVI-ret %~2=AMD Radeon R9 M295X| EXIT _SUB
	FIND $%~1=6920, TEAM ENVI-ret %~2=AMD Radeon R9 M395| EXIT _SUB
	FIND $%~1=6907, TEAM ENVI-ret %~2=AMD Radeon R5 M315| EXIT _SUB
	FIND $%~1=6901, TEAM ENVI-ret %~2=AMD Radeon R5 M255| EXIT _SUB
	FIND $%~1=6900, TEAM ENVI-ret %~2=AMD Radeon R7 M260| EXIT _SUB
	FIND $%~1=68fa , TEAM ENVI-ret %~2=AMD Radeon HD 7350| EXIT _SUB
	FIND $%~1=68f9 , TEAM ENVI-ret %~2=AMD Radeon HD 5000| EXIT _SUB
	FIND $%~1=68f8 , TEAM ENVI-ret %~2=AMD Radeon HD 7300 | EXIT _SUB
	FIND $%~1=6939, TEAM ENVI-ret %~2=AMD Radeon R9 285/380| EXIT _SUB
	FIND $%~1=6938, TEAM ENVI-ret %~2=AMD Radeon R9 380X| EXIT _SUB
	FIND $%~1=7102, TEAM ENVI-ret %~2=AMD Radeon X1800| EXIT _SUB
	FIND $%~1=7101, TEAM ENVI-ret %~2=AMD Radeon X1800 XT| EXIT _SUB
	FIND $%~1=7100, TEAM ENVI-ret %~2=AMD Radeon X1800 XT| EXIT _SUB
	FIND $%~1=6fdf , TEAM ENVI-ret %~2=AMD Radeon RX 580 2048SP| EXIT _SUB
	FIND $%~1=69af , TEAM ENVI-ret %~2=AMD Radeon Pro Vega 20| EXIT _SUB
	FIND $%~1=69a3, TEAM ENVI-ret %~2=AMD Radeon 12| EXIT _SUB
	FIND $%~1=69a2, TEAM ENVI-ret %~2=AMD Radeon 12| EXIT _SUB
	FIND $%~1=69a1, TEAM ENVI-ret %~2=AMD Radeon 12| EXIT _SUB
	FIND $%~1=69a0, TEAM ENVI-ret %~2=AMD Radeon 12| EXIT _SUB
	FIND $%~1=699f , TEAM ENVI-ret %~2=AMD Radeon 540| EXIT _SUB
	FIND $%~1=6995, TEAM ENVI-ret %~2=AMD Radeon PRO WX 2100| EXIT _SUB
	FIND $%~1=698f , TEAM ENVI-ret %~2=AMD Radeon PRO WX 3100| EXIT _SUB
	FIND $%~1=6987, TEAM ENVI-ret %~2=AMD Radeon 540X| EXIT _SUB
	FIND $%~1=6985, TEAM ENVI-ret %~2=AMD Radeon PRO WX 3100| EXIT _SUB
	FIND $%~1=6981, TEAM ENVI-ret %~2=AMD Radeon PRO WX 3200| EXIT _SUB
	FIND $%~1=694f , TEAM ENVI-ret %~2=AMD Radeon Pro WX Vega M GL| EXIT _SUB
	FIND $%~1=694e, TEAM ENVI-ret %~2=AMD Radeon RX Vega M GL| EXIT _SUB
	FIND $%~1=694c, TEAM ENVI-ret %~2=AMD Radeon RX Vega M GH| EXIT _SUB
	FIND $%~1=710b, TEAM ENVI-ret %~2=AMD Radeon X1800 GTO| EXIT _SUB
	FIND $%~1=0b12, TEAM ENVI-ret %~2=AMD Radeon X1800 GTO| EXIT _SUB
	FIND $%~1=710a, TEAM ENVI-ret %~2=AMD Radeon X1800 GTO| EXIT _SUB
	FIND $%~1=0d02, TEAM ENVI-ret %~2=AMD Radeon X1800 CrossFire| EXIT _SUB
	FIND $%~1=0322, TEAM ENVI-ret %~2= AMD All-In-Wonder X1800XL| EXIT _SUB
	FIND $%~1=7109, TEAM ENVI-ret %~2=AMD Radeon X1800 XL| EXIT _SUB
	FIND $%~1=7120, TEAM ENVI-ret %~2=AMD Radeon X1800| EXIT _SUB
	FIND $%~1=0d03, TEAM ENVI-ret %~2=AMD Radeon X1800 CrossFire| EXIT _SUB
	FIND $%~1=0323, TEAM ENVI-ret %~2=AMD All-In-Wonder X1800 XL| EXIT _SUB
	FIND $%~1=7129, TEAM ENVI-ret %~2=AMD Radeon X1800| EXIT _SUB
	FIND $%~1=714a, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7149, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7147, TEAM ENVI-ret %~2=AMD Radeon X1550| EXIT _SUB
	FIND $%~1=0322, TEAM ENVI-ret %~2=AMD All-In-Wonder 2006-E| EXIT _SUB
	FIND $%~1=7146, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7145, TEAM ENVI-ret %~2=AMD Radeon X1400| EXIT _SUB
	FIND $%~1=7143, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=0322, TEAM ENVI-ret %~2=AMD All-In-Wonder 2006-E| EXIT _SUB
	FIND $%~1=7142, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7140, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7196, TEAM ENVI-ret %~2=AMD Radeon X1350| EXIT _SUB
	FIND $%~1=7193, TEAM ENVI-ret %~2=AMD Radeon X1550 | EXIT _SUB
	FIND $%~1=718d, TEAM ENVI-ret %~2=AMD Radeon X1450| EXIT _SUB
	FIND $%~1=718c, TEAM ENVI-ret %~2=AMD Radeon X1350| EXIT _SUB
	FIND $%~1=718b, TEAM ENVI-ret %~2=AMD Radeon X1350| EXIT _SUB
	FIND $%~1=718a, TEAM ENVI-ret %~2=AMD Radeon X2300| EXIT _SUB
	FIND $%~1=7188, TEAM ENVI-ret %~2=AMD Radeon X2300| EXIT _SUB
	FIND $%~1=7187, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7186, TEAM ENVI-ret %~2=AMD Radeon X1450| EXIT _SUB
	FIND $%~1=7183, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7181, TEAM ENVI-ret %~2=AMD Radeon X1600| EXIT _SUB
	FIND $%~1=7167, TEAM ENVI-ret %~2=AMD Radeon X1550| EXIT _SUB
	FIND $%~1=0323, TEAM ENVI-ret %~2=AMD All-In-Wonder 2006-E| EXIT _SUB
	FIND $%~1=7166, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=7163, TEAM ENVI-ret %~2=AMD Radeon X1550 | EXIT _SUB
	FIND $%~1=0323, TEAM ENVI-ret %~2=AMD All-In-Wonder 2006-E| EXIT _SUB
	FIND $%~1=7162, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=715f , TEAM ENVI-ret %~2=AMD Radeon X1550| EXIT _SUB
	FIND $%~1=71c3, TEAM ENVI-ret %~2=AMD Radeon X1600 PRO| EXIT _SUB
	FIND $%~1=71c2, TEAM ENVI-ret %~2=AMD Radeon X1600 PRO| EXIT _SUB
	FIND $%~1=71c1, TEAM ENVI-ret %~2=AMD Radeon X1650 PRO| EXIT _SUB
	FIND $%~1=e160, TEAM ENVI-ret %~2=AMD Radeon X1650 GTO| EXIT _SUB
	FIND $%~1=71c0, TEAM ENVI-ret %~2=AMD Radeon X1600 XT| EXIT _SUB
	FIND $%~1=71a7, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=71a3, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=71a1, TEAM ENVI-ret %~2=AMD Radeon X1600| EXIT _SUB
	FIND $%~1=71a0, TEAM ENVI-ret %~2=AMD Radeon X1300| EXIT _SUB
	FIND $%~1=719f , TEAM ENVI-ret %~2=AMD Radeon X1550 | EXIT _SUB
	FIND $%~1=71ce, TEAM ENVI-ret %~2=AMD Radeon X1300 XT| EXIT _SUB
	FIND $%~1=71c7, TEAM ENVI-ret %~2=AMD Radeon X1650 PRO| EXIT _SUB
	FIND $%~1=71c6, TEAM ENVI-ret %~2=AMD Radeon X1600| EXIT _SUB
	FIND $%~1=71c5, TEAM ENVI-ret %~2=AMD Radeon X1600| EXIT _SUB
	FIND $%~1=71e7, TEAM ENVI-ret %~2=AMD Radeon X1650 PRO| EXIT _SUB
	FIND $%~1=71e6, TEAM ENVI-ret %~2=AMD Radeon X1650| EXIT _SUB
	FIND $%~1=71e2, TEAM ENVI-ret %~2=AMD Radeon X1600| EXIT _SUB
	FIND $%~1=71e1, TEAM ENVI-ret %~2=AMD Radeon X1650 PRO| EXIT _SUB
	FIND $%~1=71e0, TEAM ENVI-ret %~2=AMD Radeon X1600| EXIT _SUB
	FIND $%~1=71de, TEAM ENVI-ret %~2=AMD Radeon X1700/X2500| EXIT _SUB
	FIND $%~1=71d6, TEAM ENVI-ret %~2=AMD Radeon X1700| EXIT _SUB
	FIND $%~1=71d5, TEAM ENVI-ret %~2=AMD Radeon X1700| EXIT _SUB
	FIND $%~1=0b13, TEAM ENVI-ret %~2=AMD Radeon X1900| EXIT _SUB
	FIND $%~1=0b12, TEAM ENVI-ret %~2=AMD Radeon X1900| EXIT _SUB
	FIND $%~1=724b, TEAM ENVI-ret %~2=AMD Radeon X1900 GT| EXIT _SUB
	FIND $%~1=0d02, TEAM ENVI-ret %~2=AMD Radeon X1900 CrossFire| EXIT _SUB
	FIND $%~1=0b12, TEAM ENVI-ret %~2=AMD Radeon X1900 XT| EXIT _SUB
	FIND $%~1=0412, TEAM ENVI-ret %~2=AMD All-In-Wonder X1900| EXIT _SUB
	FIND $%~1=7249, TEAM ENVI-ret %~2=AMD Radeon X1900 XT| EXIT _SUB
	FIND $%~1=7248, TEAM ENVI-ret %~2=AMD Radeon X1950| EXIT _SUB
	FIND $%~1=7244, TEAM ENVI-ret %~2=AMD Radeon X1950 XT| EXIT _SUB
	FIND $%~1=0d02, TEAM ENVI-ret %~2=AMD Radeon X1950 CrossFire| EXIT _SUB
	FIND $%~1=7240, TEAM ENVI-ret %~2=AMD Radeon X1950 XTX| EXIT _SUB
	FIND $%~1=7211, TEAM ENVI-ret %~2=AMD Radeon X2300 HD| EXIT _SUB
	FIND $%~1=7210, TEAM ENVI-ret %~2=AMD Radeon HD 2300| EXIT _SUB
	FIND $%~1=731f , TEAM ENVI-ret %~2=AMD Radeon RX 5700 XT| EXIT _SUB
	FIND $%~1=7312, TEAM ENVI-ret %~2=AMD Radeon Pro W5700| EXIT _SUB
	FIND $%~1=7310, TEAM ENVI-ret %~2=AMD Radeon Pro W5700X| EXIT _SUB
	FIND $%~1=1b36, TEAM ENVI-ret %~2=AMD Radeon Pro Duo| EXIT _SUB
	FIND $%~1=0b36, TEAM ENVI-ret %~2=AMD Radeon R9 FURY X| EXIT _SUB
	FIND $%~1=7300, TEAM ENVI-ret %~2=AMD Radeon R9 FURY| EXIT _SUB
	FIND $%~1=72b3, TEAM ENVI-ret %~2=AMD Radeon X1650 GT| EXIT _SUB
	FIND $%~1=72b1, TEAM ENVI-ret %~2=AMD Radeon X1650 XT| EXIT _SUB
	FIND $%~1=72a8, TEAM ENVI-ret %~2=AMD Radeon X1950 GT| EXIT _SUB
	FIND $%~1=72a0, TEAM ENVI-ret %~2=AMD Radeon X1950 PRO| EXIT _SUB
	FIND $%~1=7293, TEAM ENVI-ret %~2=AMD Radeon X1650 GT| EXIT _SUB
	FIND $%~1=7291, TEAM ENVI-ret %~2=AMD Radeon X1650 XT| EXIT _SUB
	FIND $%~1=7288, TEAM ENVI-ret %~2=AMD Radeon X1950 GT| EXIT _SUB
	FIND $%~1=7280, TEAM ENVI-ret %~2=AMD Radeon X1950 PRO| EXIT _SUB
	FIND $%~1=726b, TEAM ENVI-ret %~2=AMD Radeon X1900 GT| EXIT _SUB
	FIND $%~1=7269, TEAM ENVI-ret %~2=AMD Radeon X1900 XT| EXIT _SUB
	FIND $%~1=9405, TEAM ENVI-ret %~2=AMD Radeon HD 2900 GT| EXIT _SUB
	FIND $%~1=9403, TEAM ENVI-ret %~2=AMD Radeon HD 2900 PRO| EXIT _SUB
	FIND $%~1=9401, TEAM ENVI-ret %~2=AMD Radeon HD 2900 XT| EXIT _SUB
	FIND $%~1=3000, TEAM ENVI-ret %~2=AMD Radeon HD 2900 PRO| EXIT _SUB
	FIND $%~1=2552, TEAM ENVI-ret %~2=AMD Radeon HD 2900 XT| EXIT _SUB
	FIND $%~1=9400, TEAM ENVI-ret %~2=AMD Radeon HD 2900 PRO/XT| EXIT _SUB
	FIND $%~1=796e, TEAM ENVI-ret %~2=AMD Radeon 2100| EXIT _SUB
	FIND $%~1=7942, TEAM ENVI-ret %~2=AMD Radeon Xpress 1250| EXIT _SUB
	FIND $%~1=7941, TEAM ENVI-ret %~2=AMD Radeon Xpress 1250| EXIT _SUB
	FIND $%~1=793f , TEAM ENVI-ret %~2=AMD Radeon Xpress 1200| EXIT _SUB
	FIND $%~1=793b, TEAM ENVI-ret %~2=AMD Radeon Xpress 1250| EXIT _SUB
	FIND $%~1=791e, TEAM ENVI-ret %~2=AMD Radeon X1200| EXIT _SUB
	FIND $%~1=7919, TEAM ENVI-ret %~2=AMD Radeon Xpress 1200 | EXIT _SUB
	FIND $%~1=7835, TEAM ENVI-ret %~2=AMD Radeon 9000 IGP| EXIT _SUB
	FIND $%~1=7834, TEAM ENVI-ret %~2=AMD Radeon 9100 PRO/XT IGP| EXIT _SUB
	FIND $%~1=73ff  , TEAM ENVI-ret %~2=AMD Radeon RX 6600| EXIT _SUB
	FIND $%~1=73e3, TEAM ENVI-ret %~2=AMD Radeon PRO W6600| EXIT _SUB
	FIND $%~1=73e1, TEAM ENVI-ret %~2=AMD Radeon PRO W6600M| EXIT _SUB
	FIND $%~1=73df , TEAM ENVI-ret %~2=AMD Radeon RX 6700| EXIT _SUB
	FIND $%~1=0e3a, TEAM ENVI-ret %~2=AMD Radeon RX 6900 XT| EXIT _SUB
	FIND $%~1=73bf , TEAM ENVI-ret %~2=AMD Radeon RX 6800| EXIT _SUB
	FIND $%~1=73af , TEAM ENVI-ret %~2=AMD Radeon RX 6900 XT| EXIT _SUB
	FIND $%~1=73ab, TEAM ENVI-ret %~2=AMD Radeon Pro W6800| EXIT _SUB
	FIND $%~1=73a3, TEAM ENVI-ret %~2=AMD Radeon PRO W6800| EXIT _SUB
	FIND $%~1=73a2, TEAM ENVI-ret %~2=AMD Radeon Pro W6900| EXIT _SUB
	FIND $%~1=7362, TEAM ENVI-ret %~2=AMD Radeon Pro V520| EXIT _SUB
	FIND $%~1=7360, TEAM ENVI-ret %~2=AMD Radeon Pro 5600M| EXIT _SUB
	FIND $%~1=734f , TEAM ENVI-ret %~2=AMD Radeon Pro W5300M| EXIT _SUB
	FIND $%~1=7347, TEAM ENVI-ret %~2=AMD Radeon Pro W5500M| EXIT _SUB
	FIND $%~1=7341, TEAM ENVI-ret %~2=AMD Radeon Pro W5500| EXIT _SUB
	FIND $%~1=7340, TEAM ENVI-ret %~2=AMD Radeon RX 5500| EXIT _SUB
	FIND $%~1=955f , TEAM ENVI-ret %~2=AMD Radeon HD 4330| EXIT _SUB
	FIND $%~1=9515, TEAM ENVI-ret %~2=AMD Radeon HD 3850 AGP| EXIT _SUB
	FIND $%~1=9513, TEAM ENVI-ret %~2=AMD Radeon HD 3850 X2| EXIT _SUB
	FIND $%~1=9488, TEAM ENVI-ret %~2=AMD Radeon HD 4670| EXIT _SUB
	FIND $%~1=9480, TEAM ENVI-ret %~2=AMD Radeon HD 4650| EXIT _SUB
	FIND $%~1=9443, TEAM ENVI-ret %~2=AMD Radeon HD 4850 X2| EXIT _SUB
	FIND $%~1=0502, TEAM ENVI-ret %~2=AMDRadeon HD 4850 | EXIT _SUB
	FIND $%~1=9442, TEAM ENVI-ret %~2=AMD Radeon HD 4850| EXIT _SUB
	FIND $%~1=9441, TEAM ENVI-ret %~2=AMD Radeon HD 4870 X2| EXIT _SUB
	FIND $%~1=9440, TEAM ENVI-ret %~2=AMD Radeon HD 4870| EXIT _SUB
	FIND $%~1=944e, TEAM ENVI-ret %~2=AMD Radeon HD 4710| EXIT _SUB
	FIND $%~1=944c, TEAM ENVI-ret %~2=AMD Radeon HD 4830| EXIT _SUB
	FIND $%~1=944b, TEAM ENVI-ret %~2=AMD Radeon HD 4850 X2| EXIT _SUB
	FIND $%~1=944a, TEAM ENVI-ret %~2=AMD Radeon HD 4850| EXIT _SUB
	FIND $%~1=9462, TEAM ENVI-ret %~2=AMD Radeon HD 4860| EXIT _SUB
	FIND $%~1=9460, TEAM ENVI-ret %~2=AMD Radeon HD 4890| EXIT _SUB
	FIND $%~1=945a, TEAM ENVI-ret %~2=AMD Radeon HD 4870| EXIT _SUB
	FIND $%~1=9498, TEAM ENVI-ret %~2=AMD Radeon HD 4650| EXIT _SUB
	FIND $%~1=0028, TEAM ENVI-ret %~2=AMD Radeon HD 4650| EXIT _SUB
	FIND $%~1=9495, TEAM ENVI-ret %~2=AMD Radeon HD 4600 AGP | EXIT _SUB
	FIND $%~1=9491, TEAM ENVI-ret %~2=AMD Radeon E4690| EXIT _SUB
	FIND $%~1=9490, TEAM ENVI-ret %~2=AMD Radeon HD 4670| EXIT _SUB
	FIND $%~1=94a1, TEAM ENVI-ret %~2=AMD Radeon HD 4860| EXIT _SUB
	FIND $%~1=94a0, TEAM ENVI-ret %~2=AMD Radeon HD 4830| EXIT _SUB
	FIND $%~1=950f , TEAM ENVI-ret %~2=AMD Radeon HD 3870 X2| EXIT _SUB
	FIND $%~1=9509, TEAM ENVI-ret %~2=AMD Radeon HD 3870 X2| EXIT _SUB
	FIND $%~1=9508, TEAM ENVI-ret %~2=AMD Radeon HD 3870| EXIT _SUB
	FIND $%~1=9507, TEAM ENVI-ret %~2=AMD Radeon HD 3830| EXIT _SUB
	FIND $%~1=9506, TEAM ENVI-ret %~2=AMD Radeon HD 3850 X2| EXIT _SUB
	FIND $%~1=9505, TEAM ENVI-ret %~2=AMD Radeon HD 3850| EXIT _SUB
	FIND $%~1=9504, TEAM ENVI-ret %~2=AMD Radeon HD 3850| EXIT _SUB
	FIND $%~1=9501, TEAM ENVI-ret %~2=AMD Radeon HD 3870| EXIT _SUB
	FIND $%~1=9500, TEAM ENVI-ret %~2=AMD Radeon HD 3850 X2| EXIT _SUB
	FIND $%~1=94cc , TEAM ENVI-ret %~2=AMD Radeon HD 2400 PRO| EXIT _SUB
	FIND $%~1=94cb, TEAM ENVI-ret %~2=AMD Radeon E2400| EXIT _SUB
	FIND $%~1=94c9, TEAM ENVI-ret %~2=AMD Radeon HD2400| EXIT _SUB
	FIND $%~1=94c9, TEAM ENVI-ret %~2=AMD Radeon HD 2400| EXIT _SUB
	FIND $%~1=94c8, TEAM ENVI-ret %~2=AMD Radeon HD 2400 XT| EXIT _SUB
	FIND $%~1=94c7, TEAM ENVI-ret %~2=AMD Radeon HD 2350| EXIT _SUB
	FIND $%~1=94c5, TEAM ENVI-ret %~2=AMD Radeon HD 2400 LE| EXIT _SUB
	FIND $%~1=94c4, TEAM ENVI-ret %~2=AMD Radeon HD 2400 PRO AGP| EXIT _SUB
	FIND $%~1=94c3, TEAM ENVI-ret %~2=AMD Radeon HD 2400 PRO| EXIT _SUB
	FIND $%~1=94c1, TEAM ENVI-ret %~2=AMD Radeon HD 2400 PRO| EXIT _SUB
	FIND $%~1=94b4, TEAM ENVI-ret %~2=AMD Radeon HD 4750| EXIT _SUB
	FIND $%~1=94b3, TEAM ENVI-ret %~2=AMD Radeon HD 4770| EXIT _SUB
	FIND $%~1=9555, TEAM ENVI-ret %~2=AMD Radeon HD 4350| EXIT _SUB
	FIND $%~1=9553, TEAM ENVI-ret %~2=AMD Radeon HD 4530| EXIT _SUB
	FIND $%~1=9552, TEAM ENVI-ret %~2=AMD Radeon HD 4550| EXIT _SUB
	FIND $%~1=954f , TEAM ENVI-ret %~2=AMD Radeon HD 4550| EXIT _SUB
	FIND $%~1=9540, TEAM ENVI-ret %~2=AMD Radeon HD 4550| EXIT _SUB
	FIND $%~1=958b, TEAM ENVI-ret %~2=AMD Radeon HD 2600 XT| EXIT _SUB
	FIND $%~1=958a, TEAM ENVI-ret %~2=AMD Radeon HD 2600 X2| EXIT _SUB
	FIND $%~1=9589, TEAM ENVI-ret %~2=AMD Radeon HD 2600 PRO| EXIT _SUB
	FIND $%~1=9588, TEAM ENVI-ret %~2=AMD Radeon HD 2600 XT| EXIT _SUB
	FIND $%~1=9587, TEAM ENVI-ret %~2=AMD Radeon HD 2600 PRO AGP| EXIT _SUB
	FIND $%~1=9586, TEAM ENVI-ret %~2=AMD Radeon HD 2600 XT AGP| EXIT _SUB
	FIND $%~1=9583, TEAM ENVI-ret %~2=AMD Radeon HD 2600 XT| EXIT _SUB
	FIND $%~1=9581, TEAM ENVI-ret %~2=AMD Radeon HD 2600| EXIT _SUB
	FIND $%~1=9580, TEAM ENVI-ret %~2=AMD Radeon HD 2600 PRO| EXIT _SUB
	FIND $%~1=9593, TEAM ENVI-ret %~2=AMD Radeon HD 3670| EXIT _SUB
	FIND $%~1=9591, TEAM ENVI-ret %~2=AMD Radeon HD 3650| EXIT _SUB
	FIND $%~1=9591, TEAM ENVI-ret %~2=AMD Radeon HD 3650| EXIT _SUB
	FIND $%~1=95c9, TEAM ENVI-ret %~2=AMD Radeon HD 3450| EXIT _SUB
	FIND $%~1=95c6, TEAM ENVI-ret %~2=AMD Radeon HD 3450 AGP| EXIT _SUB
	FIND $%~1=95c5, TEAM ENVI-ret %~2=AMD Radeon HD 3450| EXIT _SUB
	FIND $%~1=95c4, TEAM ENVI-ret %~2=AMD Radeon HD 3400| EXIT _SUB
	FIND $%~1=95c4, TEAM ENVI-ret %~2=AMD Radeon HD 3450| EXIT _SUB
	FIND $%~1=95c2, TEAM ENVI-ret %~2=AMD Radeon HD 3430| EXIT _SUB
	FIND $%~1=95c0, TEAM ENVI-ret %~2=AMD Radeon HD 3470| EXIT _SUB
	FIND $%~1=95c0, TEAM ENVI-ret %~2=AMD Radeon HD 3470| EXIT _SUB
	FIND $%~1=9599, TEAM ENVI-ret %~2=AMD Radeon HD 3650 AGP| EXIT _SUB
	FIND $%~1=9598, TEAM ENVI-ret %~2=AMD Radeon HD 3600| EXIT _SUB
	FIND $%~1=9598, TEAM ENVI-ret %~2=AMD Radeon HD 3650| EXIT _SUB
	FIND $%~1=9597, TEAM ENVI-ret %~2=AMD Radeon HD 3650 AGP| EXIT _SUB
	FIND $%~1=9596, TEAM ENVI-ret %~2=AMD Radeon HD 3650 AGP| EXIT _SUB
	FIND $%~1=9904, TEAM ENVI-ret %~2=AMD Radeon HD 7560D| EXIT _SUB
	FIND $%~1=9903, TEAM ENVI-ret %~2=AMD Radeon HD 7640G| EXIT _SUB
	FIND $%~1=9901, TEAM ENVI-ret %~2=AMD Radeon HD 7660D| EXIT _SUB
	FIND $%~1=9900, TEAM ENVI-ret %~2=AMD Radeon HD 7660G| EXIT _SUB
	FIND $%~1=98e4, TEAM ENVI-ret %~2=AMD Radeon Graphics| EXIT _SUB
	FIND $%~1=1e20, TEAM ENVI-ret %~2=AMD Radeon R7 Graphics| EXIT _SUB
	FIND $%~1=1871, TEAM ENVI-ret %~2=AMD Radeon R5 Graphics| EXIT _SUB
	FIND $%~1=9874, TEAM ENVI-ret %~2=AMD Radeon  Graphics| EXIT _SUB
	FIND $%~1=9857, TEAM ENVI-ret %~2=AMD Radeon APU XX-2200M| EXIT _SUB
	FIND $%~1=9856, TEAM ENVI-ret %~2=AMD Radeon  Graphics| EXIT _SUB
	FIND $%~1=9855, TEAM ENVI-ret %~2=AMD Radeon R6 Graphics| EXIT _SUB
	FIND $%~1=9854, TEAM ENVI-ret %~2=AMD Radeon R3E Graphics| EXIT _SUB
	FIND $%~1=9853, TEAM ENVI-ret %~2=AMD Radeon R2 Graphics| EXIT _SUB
	FIND $%~1=9852, TEAM ENVI-ret %~2=AMD Radeon R2 Graphics| EXIT _SUB
	FIND $%~1=9851, TEAM ENVI-ret %~2=AMD Radeon Graphics| EXIT _SUB
	FIND $%~1=9850, TEAM ENVI-ret %~2=AMD Radeon R3 Graphics| EXIT _SUB
	FIND $%~1=983d, TEAM ENVI-ret %~2=AMD Radeon HD 8250| EXIT _SUB
	FIND $%~1=9839, TEAM ENVI-ret %~2=AMD Radeon HD 8180| EXIT _SUB
	FIND $%~1=9838, TEAM ENVI-ret %~2=AMD Radeon HD 8240| EXIT _SUB
	FIND $%~1=9837, TEAM ENVI-ret %~2=AMD Radeon HD 8280E| EXIT _SUB
	FIND $%~1=9836, TEAM ENVI-ret %~2=AMD Radeon HD 8280| EXIT _SUB
	FIND $%~1=9835, TEAM ENVI-ret %~2=AMD Radeon HD 8310E| EXIT _SUB
	FIND $%~1=9834, TEAM ENVI-ret %~2=AMD Radeon HD 8210| EXIT _SUB
	FIND $%~1=9833, TEAM ENVI-ret %~2=AMD Radeon HD 8330E| EXIT _SUB
	FIND $%~1=9832, TEAM ENVI-ret %~2=AMD Radeon HD 8330| EXIT _SUB
	FIND $%~1=9831, TEAM ENVI-ret %~2=AMD Radeon HD 8400E| EXIT _SUB
	FIND $%~1=9830, TEAM ENVI-ret %~2=AMD Radeon HD 8400| EXIT _SUB
	FIND $%~1=980a, TEAM ENVI-ret %~2=AMD Radeon HD 7290| EXIT _SUB
	FIND $%~1=9809, TEAM ENVI-ret %~2=AMD Radeon HD 7310| EXIT _SUB
	FIND $%~1=9808, TEAM ENVI-ret %~2=AMD Radeon HD 7340| EXIT _SUB
	FIND $%~1=9807, TEAM ENVI-ret %~2=AMD Radeon HD 6290| EXIT _SUB
	FIND $%~1=9806, TEAM ENVI-ret %~2=AMD Radeon HD 6320| EXIT _SUB
	FIND $%~1=9805, TEAM ENVI-ret %~2=AMD Radeon HD 6250| EXIT _SUB
	FIND $%~1=9804, TEAM ENVI-ret %~2=AMD Radeon HD 6250| EXIT _SUB
	FIND $%~1=9803, TEAM ENVI-ret %~2=AMD Radeon HD 6310| EXIT _SUB
	FIND $%~1=9802, TEAM ENVI-ret %~2=AMD Radeon HD 6310| EXIT _SUB
	FIND $%~1=9715, TEAM ENVI-ret %~2=AMD Radeon HD 4250| EXIT _SUB
	FIND $%~1=9714, TEAM ENVI-ret %~2=AMD Radeon HD 4290| EXIT _SUB
	FIND $%~1=9710, TEAM ENVI-ret %~2=AMD Radeon HD 4200| EXIT _SUB
	FIND $%~1=970f , TEAM ENVI-ret %~2=AMD Radeon HD 4200 | EXIT _SUB
	FIND $%~1=964a, TEAM ENVI-ret %~2=AMD Radeon HD 6530D| EXIT _SUB
	FIND $%~1=9649, TEAM ENVI-ret %~2=AMD Radeon HD 6480G| EXIT _SUB
	FIND $%~1=9648, TEAM ENVI-ret %~2=AMD Radeon HD 6480G| EXIT _SUB
	FIND $%~1=9647, TEAM ENVI-ret %~2=AMD Radeon HD 6520G| EXIT _SUB
	FIND $%~1=9645, TEAM ENVI-ret %~2=AMD Radeon HD 6410D| EXIT _SUB
	FIND $%~1=9644, TEAM ENVI-ret %~2=AMD Radeon HD 6410D| EXIT _SUB
	FIND $%~1=9643, TEAM ENVI-ret %~2=AMD Radeon HD 6380G| EXIT _SUB
	FIND $%~1=9642, TEAM ENVI-ret %~2=AMD Radeon HD 6370D| EXIT _SUB
	FIND $%~1=9641, TEAM ENVI-ret %~2= AMD Radeon HD 6620G| EXIT _SUB
	FIND $%~1=9640, TEAM ENVI-ret %~2= AMD Radeon HD 6550D| EXIT _SUB
	FIND $%~1=9616, TEAM ENVI-ret %~2= AMD Radeon 3000| EXIT _SUB
	FIND $%~1=9615, TEAM ENVI-ret %~2= AMD Radeon HD 3200| EXIT _SUB
	FIND $%~1=9614, TEAM ENVI-ret %~2= AMD Radeon HD 3300| EXIT _SUB
	FIND $%~1=9613, TEAM ENVI-ret %~2= AMD Radeon HD 3100| EXIT _SUB
	FIND $%~1=9612, TEAM ENVI-ret %~2= AMD Radeon HD 3200| EXIT _SUB
	FIND $%~1=9611, TEAM ENVI-ret %~2= AMD Radeon 3100| EXIT _SUB
	FIND $%~1=9610, TEAM ENVI-ret %~2= AMD Radeon HD 3200| EXIT _SUB
	FIND $%~1=960f , TEAM ENVI-ret %~2=AMD Radeon HD 3300| EXIT _SUB
	FIND $%~1=ab28, TEAM ENVI-ret %~2= AMD Radeon RX 6800| EXIT _SUB
	FIND $%~1=ab20, TEAM ENVI-ret %~2= AMD Radeon VII| EXIT _SUB
	FIND $%~1=ab00, TEAM ENVI-ret %~2= AMD Radeon RX 550 640SP| EXIT _SUB
	FIND $%~1=aaf8 , TEAM ENVI-ret %~2=AMD Radeon Vega 56/64| EXIT _SUB
	FIND $%~1=aaf0 , TEAM ENVI-ret %~2=AMD Radeon RX 470| EXIT _SUB
	FIND $%~1=aae8, TEAM ENVI-ret %~2= AMD Radeon R9 Nano| EXIT _SUB
	FIND $%~1=aae0, TEAM ENVI-ret %~2= AMD Radeon RX 550 640SP| EXIT _SUB
	FIND $%~1=aad8, TEAM ENVI-ret %~2= AMD Radeon R9 380| EXIT _SUB
	FIND $%~1=aac8, TEAM ENVI-ret %~2= AMD Radeon R9 290| EXIT _SUB
	FIND $%~1=aac0, TEAM ENVI-ret %~2= AMD Radeon R7 360| EXIT _SUB
	FIND $%~1=aab0, TEAM ENVI-ret %~2= AMD Radeon HD 7000 | EXIT _SUB
	FIND $%~1=aaa0, TEAM ENVI-ret %~2= AMD Radeon HD 7870 XT| EXIT _SUB
	FIND $%~1=aa98, TEAM ENVI-ret %~2= AMD Radeon HD 6450| EXIT _SUB
	FIND $%~1=aa90, TEAM ENVI-ret %~2= AMD Radeon HD 6500| EXIT _SUB
	FIND $%~1=aa88, TEAM ENVI-ret %~2= AMD Radeon HD 6790| EXIT _SUB
	FIND $%~1=aa80, TEAM ENVI-ret %~2= AMD Radeon HD 6930| EXIT _SUB
	FIND $%~1=aa68, TEAM ENVI-ret %~2= AMD Radeon HD 5400| EXIT _SUB
	FIND $%~1=aa60, TEAM ENVI-ret %~2= AMD Radeon HD 5000 | EXIT _SUB
	FIND $%~1=aa58, TEAM ENVI-ret %~2= AMD Radeon HD 5700 | EXIT _SUB
	FIND $%~1=aa50, TEAM ENVI-ret %~2= AMD Radeon HD 5830| EXIT _SUB
	FIND $%~1=aa38, TEAM ENVI-ret %~2= AMD Radeon HD 4000 | EXIT _SUB
	FIND $%~1=aa30, TEAM ENVI-ret %~2= AMD Radeon HD 4850| EXIT _SUB
	FIND $%~1=aa28, TEAM ENVI-ret %~2= AMD Radeon HD 3450| EXIT _SUB
	FIND $%~1=aa20, TEAM ENVI-ret %~2= AMD Radeon HD 3650| EXIT _SUB
	FIND $%~1=aa18, TEAM ENVI-ret %~2= AMD Radeon HD 3690| EXIT _SUB
	FIND $%~1=aa10, TEAM ENVI-ret %~2= AMD Radeon HD 2350 PRO| EXIT _SUB
	FIND $%~1=aa08, TEAM ENVI-ret %~2= AMD Radeon HD 2600 PRO| EXIT _SUB
	FIND $%~1=aa01, TEAM ENVI-ret %~2= AMD Radeon HD 3650| EXIT _SUB
	FIND $%~1=aa00, TEAM ENVI-ret %~2= AMD Radeon HD 2900 GT| EXIT _SUB
	FIND $%~1=99a4, TEAM ENVI-ret %~2= AMD Radeon HD 7400G| EXIT _SUB
	FIND $%~1=99a2, TEAM ENVI-ret %~2= AMD Radeon HD 7420G| EXIT _SUB
	FIND $%~1=99a0, TEAM ENVI-ret %~2= AMD Radeon HD 7520G| EXIT _SUB
	FIND $%~1=999d, TEAM ENVI-ret %~2= AMD Radeon HD 8550D| EXIT _SUB
	FIND $%~1=999c, TEAM ENVI-ret %~2= AMD Radeon HD 8650D| EXIT _SUB
	FIND $%~1=999b, TEAM ENVI-ret %~2= AMD Radeon HD 8310G| EXIT _SUB
	FIND $%~1=999a, TEAM ENVI-ret %~2= AMD Radeon HD 8410G| EXIT _SUB
	FIND $%~1=9999, TEAM ENVI-ret %~2= AMD Radeon HD 8510G| EXIT _SUB
	FIND $%~1=9998, TEAM ENVI-ret %~2= AMD Radeon HD 8370D| EXIT _SUB
	FIND $%~1=9997, TEAM ENVI-ret %~2= AMD Radeon HD 8350G| EXIT _SUB
	FIND $%~1=9996, TEAM ENVI-ret %~2= AMD Radeon HD 8470D| EXIT _SUB
	FIND $%~1=9995, TEAM ENVI-ret %~2= AMD Radeon HD 8450G| EXIT _SUB
	FIND $%~1=9994, TEAM ENVI-ret %~2= AMD Radeon HD 7400G| EXIT _SUB
	FIND $%~1=9993, TEAM ENVI-ret %~2= AMD Radeon HD 7480D| EXIT _SUB
	FIND $%~1=9992, TEAM ENVI-ret %~2= AMD Radeon HD 7420G| EXIT _SUB
	FIND $%~1=9991, TEAM ENVI-ret %~2= AMD Radeon HD 7540D| EXIT _SUB
	FIND $%~1=9990, TEAM ENVI-ret %~2= AMD Radeon HD 7520G| EXIT _SUB
	FIND $%~1=9919, TEAM ENVI-ret %~2= AMD Radeon HD 7500G| EXIT _SUB
	FIND $%~1=9918, TEAM ENVI-ret %~2= AMD Radeon HD 7600G| EXIT _SUB
	FIND $%~1=9917, TEAM ENVI-ret %~2= AMD Radeon HD 7620G| EXIT _SUB
	FIND $%~1=9913, TEAM ENVI-ret %~2= AMD Radeon HD 7640G| EXIT _SUB
	FIND $%~1=9910, TEAM ENVI-ret %~2= AMD Radeon HD 7660G| EXIT _SUB
	FIND $%~1=990f , TEAM ENVI-ret %~2=AMD Radeon HD 8610G| EXIT _SUB
	FIND $%~1=990e, TEAM ENVI-ret %~2= AMD Radeon HD 8570D| EXIT _SUB
	FIND $%~1=990d, TEAM ENVI-ret %~2= AMD Radeon HD 8550G| EXIT _SUB
	FIND $%~1=990c, TEAM ENVI-ret %~2= AMD Radeon HD 8670D| EXIT _SUB
	FIND $%~1=990b, TEAM ENVI-ret %~2= AMD Radeon HD 8650G| EXIT _SUB
	FIND $%~1=990a, TEAM ENVI-ret %~2= AMD Radeon HD 7500G| EXIT _SUB
	FIND $%~1=9909, TEAM ENVI-ret %~2= AMD Radeon HD 7500G| EXIT _SUB
	FIND $%~1=9908, TEAM ENVI-ret %~2= AMD Radeon HD 7600G| EXIT _SUB
	FIND $%~1=9907, TEAM ENVI-ret %~2= AMD Radeon HD 7620G| EXIT _SUB
	FIND $%~1=6880, TEAM ENVI-ret %~2= AMD Radeon HD 6550M| EXIT _SUB
	FIND $%~1=687f , TEAM ENVI-ret %~2=AMD Radeon RX Vega| EXIT _SUB
	FIND $%~1=686e, TEAM ENVI-ret %~2= AMD Radeon 10 GLXLA| EXIT _SUB
	FIND $%~1=686d, TEAM ENVI-ret %~2= AMD Radeon 10 GLXTA| EXIT _SUB
	FIND $%~1=686c, TEAM ENVI-ret %~2= AMD Radeon Instinct MI25 MxGPU| EXIT _SUB
	FIND $%~1=686b, TEAM ENVI-ret %~2= AMD Radeon Pro Vega| EXIT _SUB
	FIND $%~1=686a, TEAM ENVI-ret %~2= AMD Radeon 10 LEA| EXIT _SUB
	FIND $%~1=6869, TEAM ENVI-ret %~2= AMD Radeon Pro Vega| EXIT _SUB
	FIND $%~1=6868, TEAM ENVI-ret %~2= AMD Radeon PRO WX 8100/8200| EXIT _SUB
	FIND $%~1=6867, TEAM ENVI-ret %~2= AMD Radeon Pro Vega| EXIT _SUB
	FIND $%~1=6864, TEAM ENVI-ret %~2= AMD Radeon Pro V340| EXIT _SUB
	FIND $%~1=6863, TEAM ENVI-ret %~2= AMD Radeon Vega Frontier| EXIT _SUB
	FIND $%~1=6862, TEAM ENVI-ret %~2= AMD Radeon PRO SSG| EXIT _SUB
	FIND $%~1=6861, TEAM ENVI-ret %~2= AMD Radeon PRO WX 9100| EXIT _SUB
	FIND $%~1=6c75, TEAM ENVI-ret %~2= AMD Radeon PRO V320| EXIT _SUB
	FIND $%~1=0c35, TEAM ENVI-ret %~2= AMD Radeon PRO V320| EXIT _SUB
	FIND $%~1=6860, TEAM ENVI-ret %~2= AMD Radeon Instinct MI25| EXIT _SUB
	FIND $%~1=6843, TEAM ENVI-ret %~2= AMD Radeon HD 7670M| EXIT _SUB
	FIND $%~1=6842, TEAM ENVI-ret %~2= AMD Radeon HD 7000M | EXIT _SUB
	FIND $%~1=6841, TEAM ENVI-ret %~2= AMD Radeon HD 7550M| EXIT _SUB
	FIND $%~1=6840, TEAM ENVI-ret %~2= AMD Radeon HD 7500M| EXIT _SUB
	FIND $%~1=683f , TEAM ENVI-ret %~2=AMD Radeon HD 7750/8740| EXIT _SUB
	FIND $%~1=0030, TEAM ENVI-ret %~2= AMD Radeon HD 8760| EXIT _SUB
	FIND $%~1=683d, TEAM ENVI-ret %~2= AMD Radeon HD 7770| EXIT _SUB
	FIND $%~1=6837, TEAM ENVI-ret %~2= AMD Radeon HD 8730| EXIT _SUB
	FIND $%~1=6835, TEAM ENVI-ret %~2= AMD Radeon R9 255| EXIT _SUB
	FIND $%~1=682f , TEAM ENVI-ret %~2=AMD Radeon HD 7730M| EXIT _SUB
	FIND $%~1=6821, TEAM ENVI-ret %~2= AMD Radeon HD 8870M| EXIT _SUB
	FIND $%~1=6820, TEAM ENVI-ret %~2= AMD Radeon HD 8890M| EXIT _SUB
	FIND $%~1=6819, TEAM ENVI-ret %~2= AMD Radeon HD 7850| EXIT _SUB
	FIND $%~1=0b05, TEAM ENVI-ret %~2= AMD Radeon HD 8870| EXIT _SUB
	FIND $%~1=6818, TEAM ENVI-ret %~2= AMD Radeon HD 7870| EXIT _SUB
	FIND $%~1=6811, TEAM ENVI-ret %~2= AMD Radeon R7 370| EXIT _SUB
	FIND $%~1=6810, TEAM ENVI-ret %~2= AMD Radeon R7 370| EXIT _SUB
	FIND $%~1=0124, TEAM ENVI-ret %~2= AMD Radeon HD 8970M| EXIT _SUB
	FIND $%~1=6801, TEAM ENVI-ret %~2= AMD Radeon HD 8970M| EXIT _SUB
	FIND $%~1=0124, TEAM ENVI-ret %~2= AMD Radeon HD 7970M| EXIT _SUB
	FIND $%~1=6800, TEAM ENVI-ret %~2= AMD Radeon HD 7970M| EXIT _SUB
	FIND $%~1=0b04, TEAM ENVI-ret %~2= AMD Radeon RX 560| EXIT _SUB
	FIND $%~1=67ff , TEAM ENVI-ret %~2=AMD Radeon RX 550 640SP| EXIT _SUB
	FIND $%~1=67ef , TEAM ENVI-ret %~2=AMD Radeon RX 560D| EXIT _SUB
	FIND $%~1=67eb, TEAM ENVI-ret %~2= AMD Radeon Pro V5300X| EXIT _SUB
	FIND $%~1=67e8, TEAM ENVI-ret %~2= AMD Radeon Pro WX 4130| EXIT _SUB
	FIND $%~1=67e3, TEAM ENVI-ret %~2= AMD Radeon Pro WX 4100| EXIT _SUB
	FIND $%~1=67e0, TEAM ENVI-ret %~2= AMD Radeon Pro WX 4170| EXIT _SUB
	FIND $%~1=0b37, TEAM ENVI-ret %~2= AMD Radeon RX 480| EXIT _SUB
	FIND $%~1=67df, TEAM ENVI-ret %~2=AMD Radeon RX 470| EXIT _SUB
	FIND $%~1=67d7, TEAM ENVI-ret %~2= AMD Radeon Pro WX 5100| EXIT _SUB
	FIND $%~1=67d4, TEAM ENVI-ret %~2= AMD Radeon Pro WX 7100 | EXIT _SUB
	FIND $%~1=67d0, TEAM ENVI-ret %~2= AMD Radeon Pro V7300X| EXIT _SUB
	FIND $%~1=67c7, TEAM ENVI-ret %~2= AMD Radeon Pro WX 5100| EXIT _SUB
	FIND $%~1=1336, TEAM ENVI-ret %~2= AMD Radeon Pro Duo| EXIT _SUB
	FIND $%~1=0336, TEAM ENVI-ret %~2= AMD Radeon Pro Duo| EXIT _SUB
	FIND $%~1=67c4, TEAM ENVI-ret %~2= AMD Radeon Pro WX 7100| EXIT _SUB
	FIND $%~1=67c2, TEAM ENVI-ret %~2= AMD Radeon Pro V7300X| EXIT _SUB
	FIND $%~1=67c0, TEAM ENVI-ret %~2= AMD Radeon Pro WX 7100 Mobile| EXIT _SUB
	FIND $%~1=67b9, TEAM ENVI-ret %~2= AMD Radeon R9 295X2| EXIT _SUB
	FIND $%~1=67b8, TEAM ENVI-ret %~2= AMD Radeon R9 290X| EXIT _SUB
	FIND $%~1=67b1, TEAM ENVI-ret %~2= AMD Radeon R9 290/390| EXIT _SUB
	FIND $%~1=67b0, TEAM ENVI-ret %~2= AMD Radeon R9 290X| EXIT _SUB
	FIND $%~1=677b, TEAM ENVI-ret %~2= AMD Radeon HD 7450| EXIT _SUB
	FIND $%~1=6779, TEAM ENVI-ret %~2= AMD Radeon HD 6450| EXIT _SUB
	FIND $%~1=6778, TEAM ENVI-ret %~2= AMD Radeon HD 7470| EXIT _SUB
	FIND $%~1=6772, TEAM ENVI-ret %~2= AMD Radeon HD 7450A| EXIT _SUB
	FIND $%~1=6771, TEAM ENVI-ret %~2= AMD Radeon HD 8490 | EXIT _SUB
	FIND $%~1=6770, TEAM ENVI-ret %~2= AMD Radeon HD 6450A| EXIT _SUB
	FIND $%~1=6765, TEAM ENVI-ret %~2= AMD Radeon HD 6400M | EXIT _SUB
	FIND $%~1=6764, TEAM ENVI-ret %~2= AMD Radeon HD 6400M | EXIT _SUB
	FIND $%~1=6763, TEAM ENVI-ret %~2= AMD Radeon E6460| EXIT _SUB
	FIND $%~1=6761, TEAM ENVI-ret %~2= AMD Radeon HD 6430M| EXIT _SUB
	FIND $%~1=0134, TEAM ENVI-ret %~2= AMD Radeon HD 6470M| EXIT _SUB
	FIND $%~1=0124, TEAM ENVI-ret %~2= AMD Radeon HD 6470M| EXIT _SUB
	FIND $%~1=6760, TEAM ENVI-ret %~2= AMD Radeon HD 7400M | EXIT _SUB
	FIND $%~1=675f , TEAM ENVI-ret %~2=AMD Radeon HD 8510| EXIT _SUB
	FIND $%~1=675d, TEAM ENVI-ret %~2= AMD Radeon HD 7570| EXIT _SUB
	FIND $%~1=675b, TEAM ENVI-ret %~2= AMD Radeon HD 7600 | EXIT _SUB
	FIND $%~1=6759, TEAM ENVI-ret %~2= AMD Radeon HD 6570| EXIT _SUB
	FIND $%~1=6758, TEAM ENVI-ret %~2= AMD Radeon HD 6670| EXIT _SUB
	FIND $%~1=6751, TEAM ENVI-ret %~2= AMD Radeon HD 7650A| EXIT _SUB
	FIND $%~1=6750, TEAM ENVI-ret %~2= AMD Radeon HD 6650A| EXIT _SUB
	FIND $%~1=6742, TEAM ENVI-ret %~2= AMD Radeon HD 7610M| EXIT _SUB
	FIND $%~1=6741, TEAM ENVI-ret %~2= AMD Radeon HD 7690M| EXIT _SUB
	FIND $%~1=6740, TEAM ENVI-ret %~2= AMD Radeon HD 7690M XT| EXIT _SUB
	FIND $%~1=673e, TEAM ENVI-ret %~2= AMD Radeon HD 6790| EXIT _SUB
	FIND $%~1=6739, TEAM ENVI-ret %~2= AMD Radeon HD 6850| EXIT _SUB
	FIND $%~1=6738, TEAM ENVI-ret %~2= AMD Radeon HD 6870| EXIT _SUB
	FIND $%~1=6720, TEAM ENVI-ret %~2= AMD Radeon HD 6990M| EXIT _SUB
	FIND $%~1=671f , TEAM ENVI-ret %~2=AMD Radeon HD 6930| EXIT _SUB
	FIND $%~1=671d, TEAM ENVI-ret %~2= AMD Radeon HD 6990| EXIT _SUB
	FIND $%~1=671c, TEAM ENVI-ret %~2= AMD Radeon HD 6990| EXIT _SUB
	FIND $%~1=6719, TEAM ENVI-ret %~2= AMD Radeon HD 6950| EXIT _SUB
	FIND $%~1=6718, TEAM ENVI-ret %~2= AMD Radeon HD 6970| EXIT _SUB
	FIND $%~1=66af , TEAM ENVI-ret %~2=AMD Radeon VII| EXIT _SUB
	FIND $%~1=66a7, TEAM ENVI-ret %~2= AMD Radeon Pro Vega 20| EXIT _SUB
	FIND $%~1=66a3, TEAM ENVI-ret %~2= AMD Radeon Pro Vega II Pro Vega| EXIT _SUB
	FIND $%~1=66a2, TEAM ENVI-ret %~2= AMD Radeon 20| EXIT _SUB
	FIND $%~1=66a1, TEAM ENVI-ret %~2= AMD Radeon Pro VII Instinct| EXIT _SUB
	FIND $%~1=66a0, TEAM ENVI-ret %~2= AMD Radeon Instinct| EXIT _SUB
	FIND $%~1=666f , TEAM ENVI-ret %~2=AMD Radeon HD 8550M| EXIT _SUB
	FIND $%~1=6667, TEAM ENVI-ret %~2= AMD Radeon R5 M230| EXIT _SUB
	FIND $%~1=6665, TEAM ENVI-ret %~2= AMD Radeon R5 M230| EXIT _SUB
	FIND $%~1=6664, TEAM ENVI-ret %~2= AMD Radeon R5 M240| EXIT _SUB
	FIND $%~1=6663, TEAM ENVI-ret %~2= AMD Radeon HD 8570M| EXIT _SUB
	FIND $%~1=6660, TEAM ENVI-ret %~2= AMD Radeon HD 8670A| EXIT _SUB
	FIND $%~1=665f , TEAM ENVI-ret %~2=AMD Radeon R7 360| EXIT _SUB
	FIND $%~1=665d, TEAM ENVI-ret %~2= AMD Radeon R7 200 | EXIT _SUB
	FIND $%~1=665c, TEAM ENVI-ret %~2= AMD Radeon HD 7790| EXIT _SUB
	FIND $%~1=6658, TEAM ENVI-ret %~2= AMD Radeon R7 260X/360| EXIT _SUB
	FIND $%~1=6607, TEAM ENVI-ret %~2= AMD Radeon HD 8530M| EXIT _SUB
	FIND $%~1=6606, TEAM ENVI-ret %~2= AMD Radeon HD 8790M| EXIT _SUB
	FIND $%~1=6605, TEAM ENVI-ret %~2= AMD Radeon R7 M260X| EXIT _SUB
	FIND $%~1=6604, TEAM ENVI-ret %~2= AMD Radeon R7 M465| EXIT _SUB
	FIND $%~1=6601, TEAM ENVI-ret %~2= AMD Radeon HD 8730M| EXIT _SUB
	FIND $%~1=6600, TEAM ENVI-ret %~2= AMD Radeon HD 8670A| EXIT _SUB
	FIND $%~1=5f57 , TEAM ENVI-ret %~2=AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=5e6d, TEAM ENVI-ret %~2= AMD Radeon X700| EXIT _SUB
	FIND $%~1=5e6b, TEAM ENVI-ret %~2= AMD Radeon X700 PRO| EXIT _SUB
	FIND $%~1=5e4f , TEAM ENVI-ret %~2=AMD Radeon X700| EXIT _SUB
	FIND $%~1=5e4d, TEAM ENVI-ret %~2= AMD Radeon X700| EXIT _SUB
	FIND $%~1=5e4c, TEAM ENVI-ret %~2= AMD Radeon X700 SE| EXIT _SUB
	FIND $%~1=5e4b, TEAM ENVI-ret %~2= AMD Radeon X700 PRO| EXIT _SUB
	FIND $%~1=5e4a, TEAM ENVI-ret %~2= AMD Radeon X700 XT| EXIT _SUB
	FIND $%~1=5e49, TEAM ENVI-ret %~2= AMD Radeon X700 | EXIT _SUB
	FIND $%~1=5b63, TEAM ENVI-ret %~2= AMD Radeon X1050| EXIT _SUB
	FIND $%~1=5b62, TEAM ENVI-ret %~2= AMD Radeon X600 SE| EXIT _SUB
	FIND $%~1=5b60, TEAM ENVI-ret %~2= AMD Radeon X300| EXIT _SUB
	FIND $%~1=5a62, TEAM ENVI-ret %~2= AMD Radeon Xpress 200M| EXIT _SUB
	FIND $%~1=5a61, TEAM ENVI-ret %~2= AMD Radeon Xpress 200| EXIT _SUB
	FIND $%~1=5a42, TEAM ENVI-ret %~2= AMD Radeon Xpress 200M| EXIT _SUB
	FIND $%~1=5a41, TEAM ENVI-ret %~2= AMD Radeon Xpress 200| EXIT _SUB
	FIND $%~1=5975, TEAM ENVI-ret %~2= AMD Radeon Xpress 200| EXIT _SUB
	FIND $%~1=5974, TEAM ENVI-ret %~2= AMD Radeon Xpress 1150| EXIT _SUB
	FIND $%~1=556f , TEAM ENVI-ret %~2=AMD Radeon X800| EXIT _SUB
	FIND $%~1=556d, TEAM ENVI-ret %~2= AMD Radeon X800 GTO2| EXIT _SUB
	FIND $%~1=556b, TEAM ENVI-ret %~2= AMD Radeon X800 GT| EXIT _SUB
	FIND $%~1=5569, TEAM ENVI-ret %~2= AMD Radeon X800 PRO| EXIT _SUB
	FIND $%~1=5964, TEAM ENVI-ret %~2= AMD Radeon 9200 SE| EXIT _SUB
	FIND $%~1=5964, TEAM ENVI-ret %~2= AMD Radeon 9200 SE| EXIT _SUB
	FIND $%~1=5962, TEAM ENVI-ret %~2= AMD Radeon 9200| EXIT _SUB
	FIND $%~1=2f72 , TEAM ENVI-ret %~2=AMD All-In-Wonder 9200 | EXIT _SUB
	FIND $%~1=5961, TEAM ENVI-ret %~2= AMD Radeon 9200| EXIT _SUB
	FIND $%~1=5960, TEAM ENVI-ret %~2= AMD Radeon 9200 PRO| EXIT _SUB
	FIND $%~1=5955, TEAM ENVI-ret %~2= AMD Radeon Xpress 200| EXIT _SUB
	FIND $%~1=5954, TEAM ENVI-ret %~2= AMD Radeon Xpress 200 | EXIT _SUB
	FIND $%~1=5944, TEAM ENVI-ret %~2= AMD Radeon 9200 SE| EXIT _SUB
	FIND $%~1=5941, TEAM ENVI-ret %~2= AMD Radeon 9200| EXIT _SUB
	FIND $%~1=5940, TEAM ENVI-ret %~2= AMD Radeon 9200 PRO| EXIT _SUB
	FIND $%~1=5874, TEAM ENVI-ret %~2= AMD Radeon Xpress 1150| EXIT _SUB
	FIND $%~1=5854, TEAM ENVI-ret %~2= AMD Radeon Xpress 200 | EXIT _SUB
	FIND $%~1=5835, TEAM ENVI-ret %~2= AMD Radeon 9100 IGP| EXIT _SUB
	FIND $%~1=5834, TEAM ENVI-ret %~2= AMD Radeon 9100 IGP| EXIT _SUB
	FIND $%~1=5657, TEAM ENVI-ret %~2= AMD Radeon XX700| EXIT _SUB
	FIND $%~1=5653, TEAM ENVI-ret %~2= AMD Radeon X700| EXIT _SUB
	FIND $%~1=5652, TEAM ENVI-ret %~2= AMD Radeon X700| EXIT _SUB
	FIND $%~1=564f , TEAM ENVI-ret %~2=AMD Radeon X700 XL| EXIT _SUB
	FIND $%~1=5462, TEAM ENVI-ret %~2= AMD Radeon X600 SE| EXIT _SUB
	FIND $%~1=5461, TEAM ENVI-ret %~2= AMD Radeon X300| EXIT _SUB
	FIND $%~1=5460, TEAM ENVI-ret %~2= AMD Radeon X300| EXIT _SUB
	FIND $%~1=554f , TEAM ENVI-ret %~2=AMD Radeon X800| EXIT _SUB
	FIND $%~1=554e, TEAM ENVI-ret %~2=  AMD All-In-Wonder X800 GT| EXIT _SUB
	FIND $%~1=0322, TEAM ENVI-ret %~2=  AMD All-In-Wonder X800 XL| EXIT _SUB
	FIND $%~1=554d, TEAM ENVI-ret %~2= AMD Radeon X800 GTO2| EXIT _SUB
	FIND $%~1=0302, TEAM ENVI-ret %~2= AMD Radeon X800 SE| EXIT _SUB
	FIND $%~1=554b, TEAM ENVI-ret %~2= AMD Radeon X800 GT| EXIT _SUB
	FIND $%~1=554a, TEAM ENVI-ret %~2= AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=5549, TEAM ENVI-ret %~2= AMD Radeon X800 GTO| EXIT _SUB
	FIND $%~1=053a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=02aa, TEAM ENVI-ret %~2= AMD Radeon AIW| EXIT _SUB
	FIND $%~1=028a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0139, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=00ba, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=008a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0039, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0038, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0029, TEAM ENVI-ret %~2= AMD Radeon AIW| EXIT _SUB
	FIND $%~1=001a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=000a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0009, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0008, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=5144, TEAM ENVI-ret %~2= AMD Radeon 7200| EXIT _SUB
	FIND $%~1=0f2b, TEAM ENVI-ret %~2=AMD All-In-Wonder VE| EXIT _SUB
	FIND $%~1=013a, TEAM ENVI-ret %~2= AMD Radeon 7500| EXIT _SUB
	FIND $%~1=5157, TEAM ENVI-ret %~2= AMD Radeon 7500/7500 LE| EXIT _SUB
	FIND $%~1=514d, TEAM ENVI-ret %~2= AMD Radeon 9100| EXIT _SUB
	FIND $%~1=013a, TEAM ENVI-ret %~2= AMD Radeon 8500| EXIT _SUB
	FIND $%~1=003a, TEAM ENVI-ret %~2= AMD Radeon 8500 LE| EXIT _SUB
	FIND $%~1=514c, TEAM ENVI-ret %~2= AMD Radeon 8500| EXIT _SUB
	FIND $%~1=013a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=00ba, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=003a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=0038, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=000b, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=000a, TEAM ENVI-ret %~2= AMD Radeon 7000| EXIT _SUB
	FIND $%~1=5159, TEAM ENVI-ret %~2= AMD Radeon 7000 | EXIT _SUB
	FIND $%~1=4e66, TEAM ENVI-ret %~2= AMD Radeon 9600| EXIT _SUB
	FIND $%~1=0003, TEAM ENVI-ret %~2= AMD Radeon 9500 Pro| EXIT _SUB
	FIND $%~1=4e65, TEAM ENVI-ret %~2= AMD Radeon 9500 PRO| EXIT _SUB
	FIND $%~1=4e64, TEAM ENVI-ret %~2= AMD Radeon 9700 PRO| EXIT _SUB
	FIND $%~1=4e56, TEAM ENVI-ret %~2= AMD Radeon 9550| EXIT _SUB
	FIND $%~1=4e46, TEAM ENVI-ret %~2= AMD Radeon 9600 TX| EXIT _SUB
	FIND $%~1=0002, TEAM ENVI-ret %~2= AMD Radeon 9500 Pro| EXIT _SUB
	FIND $%~1=4e45, TEAM ENVI-ret %~2= AMD Radeon 9500 PRO| EXIT _SUB
	FIND $%~1=5965, TEAM ENVI-ret %~2= AMD Radeon ES1000| EXIT _SUB
	FIND $%~1=515e, TEAM ENVI-ret %~2= AMD Radeon ES1000| EXIT _SUB
	FIND $%~1=4e44, TEAM ENVI-ret %~2= AMD Radeon 9700 PRO| EXIT _SUB
	FIND $%~1=4a4b, TEAM ENVI-ret %~2= AMD Radeon X800 AGP | EXIT _SUB
	FIND $%~1=4a4a, TEAM ENVI-ret %~2= AMD Radeon X800 GT AGP| EXIT _SUB
	FIND $%~1=4a49, TEAM ENVI-ret %~2= AMD Radeon X800 PRO| EXIT _SUB
	FIND $%~1=496e, TEAM ENVI-ret %~2= AMD Radeon 9000| EXIT _SUB
	FIND $%~1=4966, TEAM ENVI-ret %~2= AMD Radeon 9000 | EXIT _SUB
	FIND $%~1=4b6c, TEAM ENVI-ret %~2= AMD Radeon X850 XT| EXIT _SUB
	FIND $%~1=4b6b, TEAM ENVI-ret %~2= AMD Radeon X850 PRO AGP| EXIT _SUB
	FIND $%~1=4b69, TEAM ENVI-ret %~2= AMD Radeon X850 XT AGP| EXIT _SUB
	FIND $%~1=4b4c, TEAM ENVI-ret %~2= AMD Radeon X850 XT| EXIT _SUB
	FIND $%~1=4b4b, TEAM ENVI-ret %~2= AMD Radeon X850 PRO AGP| EXIT _SUB
	FIND $%~1=4b49, TEAM ENVI-ret %~2= AMD Radeon X850 XT AGP| EXIT _SUB
	FIND $%~1=4a74, TEAM ENVI-ret %~2= AMD Radeon X800 VE| EXIT _SUB
	FIND $%~1=4a70, TEAM ENVI-ret %~2= AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=4a6b, TEAM ENVI-ret %~2= AMD Radeon X800 XT AGP| EXIT _SUB
	FIND $%~1=4a6a, TEAM ENVI-ret %~2= AMD Radeon X800| EXIT _SUB
	FIND $%~1=4a69, TEAM ENVI-ret %~2= AMD Radeon X800 PRO/GTO| EXIT _SUB
	FIND $%~1=4422, TEAM ENVI-ret %~2= AMD All-In-Wonder X800 VE AGP| EXIT _SUB
	FIND $%~1=4a54, TEAM ENVI-ret %~2= AMD Radeon X800 VE AGP| EXIT _SUB
	FIND $%~1=4a50, TEAM ENVI-ret %~2= AMD Radeon X800 XT| EXIT _SUB
	FIND $%~1=4a4f , TEAM ENVI-ret %~2=AMD Radeon X850 AGP| EXIT _SUB
	FIND $%~1=4a4e, TEAM ENVI-ret %~2= AMD Radeon 9800| EXIT _SUB
_END
