////////////////////////////////////////////////////////////////////////////////////////
/// 此脚本是Qemu 启动测试器pecmd源代码，bbs.wuyou.com 阿弥陀佛 原创分享///
///          请尊重原创，保留此信息。感谢mdyblog开发的pecmd2012程序 !           ///
////////////////////////////////////////////////////////////////////////////////////////
FIND --wid &&WID,Qemu启动测试器 终结版
FIND $%&WID%>0,team ENVI @@Visable=%&WID%:2|ENVI @@POS=%&WID%:::::3::1!
{
  FIND --wid &&WID,Qemu啟動測試器 終結版
  FIND $%&WID%>0,team ENVI @@Visable=%&WID%:2|ENVI @@POS=%&WID%:::::3::1!
  {
    FIND --wid &&WID,QemuBootTester Final
    FIND $%&WID%>0,team ENVI @@Visable=%&WID%:2|ENVI @@POS=%&WID%:::::3::1!call @^WINmain
  }
}
_SUB WINmain,W365H275,QemuBootTester Final,call onexit,,99,,  //主窗口
    IFEX %windir%\fonts\Tahoma*,ENVI @this.Font=10:Tahoma
    ENVI^ EnviMode=1
    envi &times=100
    time &timer2,1,call Ontimer2
    REGI HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language\Default,&&Lang
    ifex MEM=?,&&memory
    find |%&memory%>4000,envi &&memory=1000!calc #&&memory=%&memory%/4
    HKEY #0x78,EXEC --exe:#2
    GROU -center ,L10T5W340H55,
    EDIT &disklist,L500T500W1H1,,,0x10

    find $%&Lang%=0804,team envi &&lang1=Qemu启动测试器 终结版|envi @WINmain=%&lang1%|envi &&lang2=磁盘测试|envi &&lang3=光驱测试|envi &&lang4=PXE 网启|envi &&lang5=Linux内核|envi &&lang6=磁盘镜像|envi &&lang7=光盘镜像|envi &&lang8=软盘镜像|envi &&lang9=Fbinst存档|envi &&lang10=打 开|envi &&lang11=服务器|envi &&lang12=启动文件|envi &&lang13=选择 linux内核 ( e.g : bzImage )|envi &&lang14=选择 linux内核文件  ( 可拖拽至此 )|envi &&lang15=选择 初始内存盘文件 ( e.g : initrd.gz )|envi &&lang16=选择初始内存盘文件  ( 可拖拽至此 )|envi &&lang17=命令行|envi &&lang18=启动模式|envi &&lang19=内存|envi &&lang20=标准VGA|envi &&lang21=开始测试|envi &&lang22=可用内存|envi &&lang23=CPU使用率|envi &&lang24=请选择tftp目录|envi &&lang25=从tftp服务器选择启动文件|envi &&lang26=请选择一个|envi &&lang27=无盘片|envi &&lang28=浏览并选定一个文件或将文件拖拽至此|envi &&lang29=全部格式|envi &&lang30=文本文档|envi &&lang31=输入命令行|envi &&lang32=或选择一个命令行文本|envi &&lang33=只读模式|envi &&lang34=包含命令行的文本文件 ( ≤30 行 )|envi &&lang35=附加磁盘|envi &&lang36=设置虚拟磁盘路径|envi &&lang37=正在准备文件...请稍后...!find $%&Lang%=0404,team envi &&lang1=Qemu啟動測試器 終結版|envi @WINmain=%&lang1%|envi &&lang2=磁盤測試|envi &&lang3=光驅測試|envi &&lang4=PXE 網啟|envi &&lang5=Linux內核|envi &&lang6=磁盤鏡像|envi &&lang7=光盤鏡像|envi &&lang8=軟盤鏡像|envi &&lang9=Fbinst存檔|envi &&lang10=打 開|envi &&lang11=服務器|envi &&lang12=啟動文件|envi &&lang13=選擇 linux內核 ( e.g : bzImage )|envi &&lang14=選擇 linux內核文件  ( 可拖拽至此 )|envi &&lang15=選擇 初始內存盤文件 ( e.g : initrd.gz )|envi &&lang16=選擇初始內存盤文件  ( 可拖拽至此 )|envi &&lang17=命令行|envi &&lang18=啟動模式|envi &&lang19=內存|envi &&lang20=標準VGA|envi &&lang21=開始測試|envi &&lang22=可用內存|envi &&lang23=CPU使用率|envi &&lang24=請選擇tftp目錄|envi &&lang25=從tftp服務器選擇啟動文件|envi &&lang26=請選擇壹個|envi &&lang27=無盤片|envi &&lang28=瀏覽並選定壹個文件或將文件拖拽至此|envi &&lang29=全部格式|envi &&lang30=文本文檔|envi &&lang31=輸入命令行|envi &&lang32=或選擇壹個命令行文本|envi &&lang33=只讀模式|envi &&lang34=包含命令行的文本文件 ( ≤30 行 )|envi &&lang35=附加磁盤|envi &&lang36=設置虛擬磁盤路徑|envi &&lang37=正在準備文件...請稍後...!team envi &&lang1=QemuBootTester Final|envi @WINmain=%&lang1%|envi &&lang2=Hard Disk|envi &&lang3=CD-ROM|envi &&lang4=PXE Boot|envi &&lang5=Linux Kernel|envi &&lang6=Disk Image|envi &&lang7=CD Image|envi &&lang8=FloppyImage|envi &&lang9=FbinstArchive|envi &&lang10=Open|envi &&lang11=server|envi &&lang12=Boot file|envi &&lang13=Select a Linux kernel ( e.g : bzImage )|envi &&lang14=Select a Linux kernel ( or drag it to here )|envi &&lang15=Select a Linux initial ram disk ( e.g : initrd.gz )|envi &&lang16=Select a Linux initial ram disk ( or drag it to here )|envi &&lang17=Cmdline|envi &&lang18=Boot Mode|envi &&lang19=Memory|envi &&lang20=Std VGA|envi &&lang21=Run Qemu|envi &&lang22=Free Memory|envi &&lang23=CPU usage|envi &&lang24=Select tftp server Folder|envi &&lang25=Select a bootfile from tftp server|envi &&lang26=Select a|envi &&lang27=Empty|envi &&lang28=Select a file or drag it to here|envi &&lang29=all|envi &&lang30=Text file|envi &&lang31=Enter cmdline|envi &&lang32=or select a Textfile|envi &&lang33=ReadOnly|envi &&lang34=Command line text file ( ≤30 lines )|envi &&lang35=Virtual Disk|envi &&lang36=Set the path for the Virtualdisk|envi &&lang37=Preparing ...
    RADI &hdtest,L20T15W75H19,%&lang2%,team call efistate 1|call Ondisktest|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,1,1
    RADI &cdtest,L105T15W75H19,%&lang3%,team call efistate 1|call Oncdromtest|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,0,1
    RADI &pxetest,L185T15W75H19,%&lang4%,team call efistate 1|call OnPXEtest|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,0,1
    RADI &linux,L265T15W78H19,%&lang5%,team call efistate 1|call Linuxtest|ENVI @&setvdisk.Visable=0|ENVI @&vdisk.Visable=0|ENVI @&vdisksize.Visable=0,0,1
    RADI &hdimagetest,L20T35W75H19,%&lang6%,team call efistate 1|call filetest %&lang6%|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,0,1
    RADI &cdromtest,L105T35W75H19,%&lang7%,team call efistate 1|call filetest %&lang7%|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,0,1
    RADI &fdimagetest,L185T35W77H19,%&lang8%,team call efistate 0|call filetest %&lang8%|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,0,1
    RADI &fbatest,L265T35W80H19,%&lang9%,team call efistate 0|call filetest %&lang9%|ENVI @&setvdisk.Visable=1|ENVI @&vdisk.Visable=1|ENVI @&vdisksize.Visable=1,0,1
    LIST &phylist,L15T70W330H20,,call settestdrv,
    ITEM &itembrow,L20T73W45H23,%&lang10%,call browtestfile,,16
    EDIT+ -3D &testfile,L70T75W270H20,,,0x110
    CHEK &setvdisk,L20T116W75H19,%&lang35% : ,call creatdisk,0
    EDIT+ -3D &vdisk,L105T116W185H20,,,0x8
    LIST &vdisksize,L295T115W45H20,1G|2G|3G|4G|5G|10G|15G|20G|25G,,1G
    ITEM &browtftp,L20T63W70H23,tftp %&lang11%,call settftp,,16
    EDIT+ -3D &tftp,L95T65W245H20,,,0x10
    ITEM &browbootfile,L20T88W70H23,%&lang12%,call selbootfile,,-16
    EDIT+ -3D &bootfile,L95T90W245H20,,,0x10
    ITEM &browkernel,L20T63W50H23,Kernel,call browlinuxkernel,,16
    EDIT+ -3D &kernel,L75T65W265H20, %&lang14%  ,,0x110
    ITEM &browinitrd,L20T88W50H23,initrd,call browlinuxinitrd,,16
    EDIT+ -3D &initrd,L75T90W265H20, %&lang16%  ,,0x110
    ITEM &append,L20T114W50H23,%&lang17%,call browtext,,16
    LIST &cmdline,L75T115W265H20,,,,0x14
    LABE ,L20T141W370H40,※ %&lang18% : ,
    RADI &efi64test,L105T138W75H19,EFI-x64,envi @&stdvga.Enable=0,0,2
    RADI &efi32test,L185T138W75H19,EFI-IA32,envi @&stdvga.Enable=0,0,2
    RADI &biostest,L265T138W80H19,Legacy BIOS,envi @&stdvga.Enable=1,1,2
    LABE &setmem,L20T163W100H20,※ %&lang19% ( M ) : ,
    EDIT+ -3D -center &memory,L105T160W55H20,%&memory%,,0x400
    CHEK &stdvga,L185T160W70H19,%&lang20%,,1
    CHEK &readonly,L265T160W80H19,%&lang33%,,1
    ITEM -font:18 &go,L125T190W105H35,%&lang21%,call starting,
    LABE+ ,L-1T230W390H1
    LABE -left &label1,L20T232W230H20,,,0x444444
    LABE &label2,L255T232W100H20,Welcome to my Blog,exec $http://txm100308.blog.163.com/,0x660000##0x999999
    IMAG &Image1,L260T190W80H35,#2,exec --exe:#2
    ENVI @&go.Cursor=32649
    ENVI @&memory.ID=?&&mem_ID
    ENVI @@SENDMSG=%&mem_ID%:0x00C5;4
    ENVI @&tftp.ID=?;&&tftp_ID
    CALC -base=16 #&&tftp_CHANGE=0x0300 * 0x10000  + %&tftp_ID%
    ENVI @this.MSG=_0x0111::&&wp,&&lp, Call OnCommand
    ENVI &CPUS=1
    FIND  --pid  &TMS,
    MSTR  &I1=<1>%&TMS%
    MSTR  &T1=<2>%&TMS%
    MSTR  &CPUS=<3>%&TMS%
    SET &Last=-100
    Call OnTimer1
    TIME &Timer1,1000,Call OnTimer1
    ENVI @&append.MSG=0x02A1: team ENVI @@Cur=?&&heng;&&zong|TIPS* %&lang31%,%&lang32%,,,@aL%&heng%T%&zong%
    ENVI @&append.MSG=0x02A3: TIPS *
_END
_SUB onexit
envi-get &y0=%&times%
loop #%&y0%<99,
{
calc #&y0=%&y0%+5
ENVI @this.POS=:::::%&y0%
wait 1
}
_END
_SUB Ontimer2
envi-get &y0=%&times%
calc #&y0=%&y0%-5
envi-ret &times=%&y0%
ENVI @this.POS=:::::%&y0%
find $%&y0%<10,ENVI @&timer2=-del
_END
_SUB OnCommand 
IFEX $%&tftp_CHANGE%=%&wp%,
{
ifex %&tftp%,envi @&browbootfile.Enable=1!envi @&browbootfile.Enable=0
}
_END
_SUB creatdisk
find $%&setvdisk.Check%=1,
{
BROW &&vd,&VirtualDisk.vmdk,%&lang36%,vmdk
FIND $%&vd%=,!ENVI @&vdisk=%&vd%
}
ENVI @&vdisk.Val=?&&abc
find $%&abc%=,ENVI @&setvdisk.Check=0
EXIT _SUB
_END
_SUB efistate
envi @&efi64test.Enable=%1
envi @&efi32test.Enable=%1
find $%1=0,team envi @&efi32test.Check=0|envi @&efi64test.Check=0|envi @&biostest.Check=1|envi @&stdvga.Enable=1
_END
_SUB starting
find $%&linux.Check%=1,
{
ifex %&kernel%,!exit _SUB
ifex %&initrd%,!exit _SUB
}
find $%&testfile.visable%=1,
{
ifex %&testfile%,!exit _SUB
}
find $%&cdtest.Check%=1,
{
mstr &V=3,1,%&phylist%
ifex %&V%:\,!exit _SUB
}
envi @&go.Enable=0
envi @&Timer1=0
ENVI @&label1=%&lang37%
mdir %temp%\QemuBootTester
exec --hide --wait --exe:*#5
envi &options=-L "%temp%\QemuBootTester" -m %&memory% -localtime
find $%&biostest.Check%=1,
{
find $%&stdvga.Check%=1,envi &options=%&options% -vga std
}
find $%&efi64test.Check%=1,envi &options=%&options% -bios efi64.bin!find $%&efi32test.Check%=1,envi &options=%&options% -bios efi32.bin
find $%&readonly.Check%=1,envi &options=%&options% -snapshot
find $%&hdtest.Check%=1,team mstr &disknum=5,1,%&phylist%|envi &options=%&options% -hda \\.\PhysicalDrive%&disknum% -boot c
find $%&cdtest.Check%=1,team mstr &cdvolume=3,1,%&phylist%|envi &options=%&options% -cdrom \\.\%&cdvolume%: -boot d
find $%&pxetest.Check%=1,team ENVI @&tftp.Val=?&tdir|ENVI @&bootfile.Val=?&bootf|envi &options=%&options% -boot n -net nic,model=e1000 -net user,tftp="%&tdir%",bootfile="%&bootf%"
find $%&fbatest.Check%=1,team ENVI @&testfile.Val=?&tfile|exec --wait --hide --exe:#4 fba2img "%&tfile%" "%temp%\QemuBootTester\test.img"|envi &options=%&options% -hda "%temp%\QemuBootTester\test.img" -boot c
find $%&fdimagetest.Check%=1,team ENVI @&testfile.Val=?&tfile|exec --wait --hide --exe:#3 fbinst "%temp%\QemuBootTester\test.fba" add floppy.img "%&tfile%"|exec --wait --hide --exe:#4 fba2img "%temp%\QemuBootTester\test.fba" "%temp%\QemuBootTester\test.img"|envi &options=%&options% -hda "%temp%\QemuBootTester\test.img" -boot c
find $%&hdimagetest.Check%=1,team ENVI @&testfile.Val=?&tfile|envi &options=%&options% -hda "%&tfile%" -boot c
find $%&cdromtest.Check%=1,team ENVI @&testfile.Val=?&tfile|envi &options=%&options% -cdrom "%&tfile%" -boot d
find $%&linux.Check%=1,
{
team ENVI @&kernel.Val=?&kfile|ENVI @&initrd.Val=?&ifile|envi &options=%&options% -kernel "%&kfile%" -initrd "%&ifile%" -append "%&cmdline%"
}!
{
find $%&setvdisk.Check%=1,
  {
  ENVI @&vdisk.Val=?&&abc
  ifex %&abc%,!
    {
    find $%&vdisksize%=1G,FILE %temp%\QemuBootTester\1.vmdk->%&abc%!find $%&vdisksize%=2G,FILE %temp%\QemuBootTester\2.vmdk->%&abc%!find $%&vdisksize%=3G,FILE %temp%\QemuBootTester\3.vmdk->%&abc%!find $%&vdisksize%=4G,FILE %temp%\QemuBootTester\4.vmdk->%&abc%!find $%&vdisksize%=5G,FILE %temp%\QemuBootTester\5.vmdk->%&abc%!find $%&vdisksize%=10G,FILE %temp%\QemuBootTester\10.vmdk->%&abc%!find $%&vdisksize%=15G,FILE %temp%\QemuBootTester\15.vmdk->%&abc%!find $%&vdisksize%=20G,FILE %temp%\QemuBootTester\20.vmdk->%&abc%!find $%&vdisksize%=25G,FILE %temp%\QemuBootTester\25.vmdk->%&abc%
      }
  envi &options=%&options% -hdb "%&abc%"
  }
}
FILE %temp%\QemuBootTester\*.vmdk
envi @&Timer1=1000
exec !="%temp%\QemuBootTester\myqemu.exe" %&options%
file "%temp%\QemuBootTester"
file "%temp%\qem*.tmp"
envi @&go.Enable=1
_END
_SUB OnTimer1
    find $%&hdtest.Check%=1,call Refreshdisk
    FIND  --pid  &TMS,
    MSTR  &I2=<1>%&TMS%
    MSTR  &T2=<2>%&TMS%
    CALC #&I21=%&I2% - %&I1%
    CALC #&T21=%&T2% - %&T1%
    CALC &P= 100 - 100 * %&I21% / %&T21% / %&CPUS% ##1
    FIND $%P%=-0.0, SET P=0
    IFEX $%P%<0, EXIT
    IFEX $%Last%=%P%, EXIT 
    SET Last=%P%
    ENVI &I1=%&I2%
    ENVI &T1=%&T2%
    ifex MEM=?,&&memory
    ENVI @&label1=※ %&lang22% : %&memory% MB  %&lang23% : %&P%%% 
_END
_SUB Refreshdisk
part list disk,&&D
envi &&D1=%&disklist%
find $%&D%=%&D1%,!team envi @&disklist=%&D%|call Ondisktest
_END
_SUB OnPXEtest
    envi @&browkernel.visable=0
    envi @&kernel.visable=0
    envi @&browinitrd.visable=0
    envi @&initrd.visable=0
    envi @&phylist.visable=0
    envi @&append.visable=0
    envi @&cmdline.visable=0
    ENVI @&phylist.POS=500:500:::
    envi @&itembrow.visable=0
    envi @&testfile.visable=0
    envi @&browtftp.visable=1
    envi @&tftp.visable=1
    envi @&browbootfile.visable=1
    envi @&bootfile.visable=1
_END
_SUB settftp
BROW &dir,*%desktop%,%&lang24%
FIND $%&dir%=,!envi @&tftp=%&dir%
_END
_SUB selbootfile
STRL &sLenth=%&tftp%
envi &dir=%&tftp%
FIND $%&sLenth%=3,LSTR &dir=2,%&dir%
BROW &file,%&dir%\*,%&lang25%,all|*|,0x1000
FIND $%&file%=,EXIT _SUB
STRL &mLenth=%&dir%
STRL &fLenth=%&file%
calc #&getlenth=%&fLenth%-%&mLenth%-1
LSTR &getstr=%&mLenth%,%&file%
RSTR &V=%&getlenth%,%&file%
FIND $%&getstr%=%&dir%,envi @&bootfile=%&V%!call selbootfile
_END
_SUB Linuxtest
    envi @&browtftp.visable=0
    envi @&tftp.visable=0
    envi @&browbootfile.visable=0
    envi @&bootfile.visable=0
    envi @&itembrow.visable=0
    envi @&testfile.visable=0
    envi @&phylist.visable=0
    ENVI @&phylist.POS=500:500:::
    envi @&browkernel.visable=1
    envi @&kernel.visable=1
    envi @&browinitrd.visable=1
    envi @&initrd.visable=1
    envi @&append.visable=1
    envi @&cmdline.visable=1
_END
_SUB browlinuxkernel
BROW &linuxfile,,%&lang13%,%&lang29% ( * )|*.*|,0x1000
find $%&linuxfile%=,!envi @&kernel=%&linuxfile%
_END
_SUB browlinuxinitrd
BROW &linuxfile,,%&lang15%,%&lang29% ( * )|*.*|,0x1000
find $%&linuxfile%=,!envi @&initrd=%&linuxfile%
_END
_SUB listalldisk
part list disk,&diskall
STRL &iLen=%&diskall%
find $%*=-all,envi &listall=!envi &listall=find $%&dtype%=127,
LOOP #%&iLen%>0,
{
mstr &disknum=%&iLen%,1,%&diskall%
part -devid list disk %&disknum%,&abc
MSTR -delims:\ &V12=<2>%&abc%
LPOS &iPos=__,1,%&V12%
CALC #&iPos=%&iPos%-1
LSTR &V12=%&iPos%,%&V12%
SED &V12=0:0,&PROD_, ,%&V12%
SED &V12=0:0,&VEN_,,%&V12%
SED &V12=0:0,&REV_, ,%&V12%
SED &V12=0:0,_, ,%&V12%
SED &V12=0:0,&,,%&V12%
SED &V12=1:0,DISK,,%&V12%
MSTR &V2=<2>%&abc%
FIND #%&V2%>=1073741824,TEAM calc &disksize=%&V2%/1073741824 ##1|ENVI &disksize=%&disksize%GB!FIND #%&V2%>=1048576,TEAM calc &disksize=%&V2%/1048576 ##1|ENVI &disksize=%&disksize%MB!FIND #%&V2%>=1024,TEAM calc &disksize=%&V2%/1024 ##1|ENVI &disksize=%&disksize%KB!ENVI &disksize=%&disksize%B
FDRV &AllDrive=*
STRL &drvLen=%&AllDrive%
envi &drives=
LOOP #%&drvLen%>0,
{
mstr &getdrive=%&drvLen%,1,%&AllDrive%
PART -fill list drv %&getdrive%,&drvinfo
MSTR &V9=<9>%&drvinfo%
FIND $%&V9%=%&disknum%,envi &drives=%&getdrive%: %&drives%
CALC #&drvLen=%&drvLen%-2
}
calc #&iLen=%&iLen%-2
FORM &DriveType,&Bustype=\\.\PhysicalDrive%&disknum%
envi &dtype=%&DriveType%%&Bustype%
find $%&dtype%=117,envi-ret &diskinfo=  RM%&disknum%: %&V12% ( %disksize%, %&drives%)|%&diskinfo%!%&listall%envi-ret &diskinfo=  HD%&disknum%: %&V12% ( %disksize%, %&drives%)|%&diskinfo%
_END
_SUB Ondisktest
    envi @&browtftp.visable=0
    envi @&tftp.visable=0
    envi @&browbootfile.visable=0
    envi @&bootfile.visable=0
    envi @&itembrow.visable=0
    envi @&testfile.visable=0
    envi @&browkernel.visable=0
    envi @&kernel.visable=0
    envi @&browinitrd.visable=0
    envi @&initrd.visable=0
    envi @&append.visable=0
    envi @&cmdline.visable=0
    ENVI @&phylist.POS=15:70:::
    envi @&phylist.visable=1
    envi &diskinfo=
    call listalldisk -all
    envi @&phylist.VAL=%&diskinfo%
_END
_SUB listcdrom
FDRV &allvolume=*:
STRL &iLen=%&allvolume%
envi &cdroms=
envi &num=1
loop #%&num%<%&iLen%,
{
MSTR &volume=%&num%,2,%&allvolume%
FORM &DriveType=%&volume%
ifex %&volume%,team FDRV *vol &&V=%&volume%|envi &drvsta=%&V%!envi &drvsta=%&lang27%
find $%&DriveType%=DRIVE_CDROM,envi-ret &cdroms=%&cdroms%|※ %&volume% DVD/CD-ROM  (  %&drvsta%  ) !find $%&DriveType%=DRIVE_CDROMUSB,envi-ret &cdroms=%&cdroms%|※ %&volume% USB CD-ROM  (  %&drvsta%  ) 
calc #&&n=%&num%+3
envi-ret &num=%&n%
}
MSTR &cdroms=2,0,%&cdroms%
ENVI @&phylist.VAL=%&cdroms%
_END
_SUB Oncdromtest
    envi @&browtftp.visable=0
    envi @&tftp.visable=0
    envi @&browbootfile.visable=0
    envi @&bootfile.visable=0
    envi @&itembrow.visable=0
    envi @&testfile.visable=0
    envi @&browkernel.visable=0
    envi @&kernel.visable=0
    envi @&browinitrd.visable=0
    envi @&initrd.visable=0
    envi @&append.visable=0
    envi @&cmdline.visable=0
    ENVI @&phylist.POS=15:70:::
    envi @&phylist.visable=1
    call listcdrom
_END
_SUB browtext
    BROW &textfile,,%&lang26% %&lang34%,%&lang30% (*.txt;*.ini)|*.txt;*.ini|,0x1000
    find $%&textfile%=,!
    {
    READ %&textfile%,-1,&Lines
    find #%&Lines%<=30,
      {
      READ %&textfile%,-1,&Line
      envi &cmds=
      LOOP #%&Line%>0,
        {
        READ %&textfile%,%&Line%,&getcmd
        sed &V0=0:0, ,,%&getcmd%
        find $%&V0%=,!envi-ret &cmds=%&cmds%|%&getcmd%
        calc #&V1=%&Line%-1
        envi-ret &Line=%&V1%
        }
      rstr &&V2=1,%&cmds%
      find $%&V2%=|,team strl &&L=%&cmds%|calc #&&L=%&L%-1|lstr &cmds=%&L%,%&cmds%
      ENVI @&cmdline.VAL=%&cmds%
      }!
      {
      call browtext
      }
    }
_END
_SUB filetest
    envi @&browtftp.visable=0
    envi @&tftp.visable=0
    envi @&browbootfile.visable=0
    envi @&bootfile.visable=0
    envi @&browkernel.visable=0
    envi @&kernel.visable=0
    envi @&browinitrd.visable=0
    envi @&initrd.visable=0
    envi @&phylist.visable=0
    envi @&append.visable=0
    envi @&cmdline.visable=0
    ENVI @&phylist.POS=500:500:::
    envi @&testfile= %&lang28%
    envi @&itembrow.visable=1
    envi @&testfile.visable=1
_END
_SUB browtestfile
find $%&fbatest.Check%=1,BROW &imagefile,,%&lang26% %&lang9%,%&lang9% (*.fba)|*.FBA|%&lang29% ( * )|*.*|,0x1000!find $%&cdromtest.Check%=1,BROW &imagefile,,%&lang26% %&lang7%,%&lang7% (*.iso)|*.iso|%&lang29% ( * )|*.*|,0x1000!find $%&hdimagetest.Check%=1,BROW &imagefile,,%&lang26% %&lang6%,%&lang6% (*.vhd;*.mos;*.vmdk;*.vdi;*.img;*.ima)|*.ima;*.img;*.vhd;*.vmdk;*.vdi;*.mos|%&lang29% ( * )|*.*|,0x1000!BROW &imagefile,,%&lang26% %&lang8%,%&lang8% (*.ima;*.img;*.gz;*.bin)|*.ima;*.img;*.gz;*.bin|%&lang29% ( * )|*.*|,0x1000
find $%&imagefile%=,!envi @&testfile=%&imagefile%
_END
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////