//用于找出符合特定条件的分区。没有盘符的分配盘符。或者卸载盘符
//特定卷标，包含特定文件或文件夹，具有引导特性（esp/act/0），特定总线接口(usb/sata/ata...)，特定驱动id（scsi/usbstor/svbus...）

Writ -,$+0,
Writ -,$+0,  找出特定条件的分区,并 装载 盘符。Ver.2.61
Writ -,$+0,

//////分析参数/////////////
forx *  n args_a args list help UnMount,&argz,envi %&argz%=0
forx *  label_y boot_x file_path_x bus_x devid_x part_x fs_x  sty_x disk_x,&argz,envi %&argz%=
forx * %*,argn,
{
    calc #n=%n%+1
    call valuex %%n%
}
_sub valuex
    mstr -delims:= &item,&value=<1><2>%~1
    forx * boot file_path bus devid part fs sty disk ,&argy,
    {
        ifex ['%&item%'='%&argy%' & '%&value%'='' ],exit _sub
    }
    envi %&item%_x=%&value%
    ifex '%&item%'='part',
    {   
        envi part_x=;%&value%;
        sed  part_x=0, ,;,%part_x%  //将空格转换为 分号
    }
    ifex '%&item%'='label'  ,envi label_y=1
    ifex '%&item%'='list'   ,team envi list=1    |calc args_A=%args_a%+1
    ifex '%&item%'='UnMount',team envi Unmount=1 |calc args_A=%args_a%+1
    ifex '%&item%'='HELP'   ,envi HELP=1
_end

//记录有效参数个数 args 1-7
forx * %label_y% %boot_x% %file_path_x% %bus_x% %devid_x% %part_x% %fs_x% %sty_x% %disk_x% ,&argz,
{
    ifex '%&argz%'<>'', calc args=%args%+1
}

ifex [#%HELP%=1 | (#%args%=0 & #%args_a%=0)],
{
    Writ -,$+0,  ----------------------------------------------------------
    Writ -,$+0,    帮助信息(参数说明)：
    Writ -,$+0,    参数没有顺序, 但至少应设定 1~9 中的一个有效参数。
    Writ -,$+0,     1.label=卷标,           明确特定卷标的分区。
    Writ -,$+0,     2.boot=N,               1/2/3/0,对应 激活分区/ESP分区/Act+efi/一般分区。
    Writ -,$+0,     3."file_path=文件路径", 明确 搜索包含特定文件或文件夹，如 \petools 2\ 的文件夹,注意如果包含空格应连同file_path一起用引号包裹。
    Writ -,$+0,     4.Bus=N,特定总线类型,   0-21分别对应，Unknown,Scsi,Atapi,Ata,1394,Ssa,Fibre,Usb,RAID,iScsi,Sas,Sata,Sd,Mmc,Virtual,FileBackedVirtual,Spaces,Nvme,SCM,Ufs,Max,MaxReserved
    Writ -,$+0,     5.devid=Enum,           特定驱动id,如：scsi,usbstor,svbus.....
    Writ -,$+0,     6."part=a:b;c:d"../All, 特指某些硬盘分区或当前全部硬盘分区,如,0:1,表示第一个硬盘的第一个分区;All,表示全部.可是一组分区,每个分区用分号或空格隔开,如有空格需用引号包裹。
    Writ -,$+0,     7.FS=NTFS/FAT32/RAW..., 指定分区的文件系统类型 ntfs/fat32/raw...。
    Writ -,$+0,     8.Sty=MBR/GPT,          指定硬盘分区模式 mgr/gpt。
    Writ -,$+0,     9.Disk=0/1/2/3....,     指定某个硬盘。
    Writ -,$+0,    10.UnMount,              卸载指定的分区。不带此参数时为装载分区。
    Writ -,$+0,    11.HELP,                 不带任何参数或带 help 参数，显示本帮助信息。
    Writ -,$+0,    12.list,                 显示硬盘分区序列。
    Writ -,$+0,
    Writ -,$+0,    比如：
    Writ -,$+0,      1.%0 bus=7 label=GPTBOOT boot=2  "file_path=\petools 2\"
    Writ -,$+0,        表示找出 u盘中 卷标为 "GPTboot"的 ESP 分区 ，且该分区包含名为 "\petools 2\" 的文件夹。如果该分区没有盘符，就分配一个。
    Writ -,$+0,      2.要装载全部未分配盘符的分区，可以使用 part=all
    Writ -,$+0,  ----------------------------------------------------------
}
ifex [#%args%=0 & #%unmount%=1],team Writ -,$+0,  Unmount 缺少锁定分区的参数...|Writ -,$+0,
ifex [#%args%=0 & #%list%=0],exit file

/////////获取分区序列/////////////
envi part_list=
envi part_list1=
envi mount_part=
//获取硬盘分区序列
Writ -,$+0,  获取硬盘分区序列并筛选目标分区...... //part_list part_list1
Writ -,$+0,
part list disk ,disks  //获取硬盘号列表
forx * %disks% ,disk,
{
    part -devidx -devid list disk %disk%,&disk_info
    //Writ -,$+0,%&disk_info%
    mstr &Bus_name,&sty,&devid=<9><10><12>%disk_info%
    mstr -delims:\ &devid=<1>%&devid%
    envi &bus_n=0
    envi &bus_name1=
    forx * Unknown Scsi Atapi Ata 1394 Ssa Fibre Usb RAID iScsi Sas Sata Sd Mmc Virtual FileBackedVirtual Spaces Nvme SCM Ufs Max MaxReserved ,&bus_y,
    {
        ifex #%&Bus_name%=%&bus_n%,envi &bus_name1=%&bus_y%
        calc &bus_n=%&bus_n%+1
    }
    part list part %disk%,parts  //获取某硬盘分区号列表
    forx * %parts% ,part,  
    {
        ifex #%part%>0,  //如果分区号大于0，说明这个分区是有意义的非扩展分区
        {
            part  -fill -hextp list part %disk%:%part%,&part_info //获取分区信息，其最后一个字段是盘符
            part   -hpy list volume %disk%:%part%,&vol_info  //获取分区对应的卷信息，其第一个字段是卷路径
            mstr &vol=<1>%&vol_info%
            mstr &id,&drv,&act=<2><-1><3>%&part_info%
            ifex '%&drv%'='*',envi &drv=*:
            envi &boot1=0
            ifex #%&act%=1,envi &boot1=1
            ifex '%&id%'='C12A7328-F81F-11D2-BA4B-00A0C93EC93B',envi &boot1=2
            FDRV -vol &label,&file_system=\\?\Harddisk%disk%Partition%part%
            envi. part_list=%part_list%  %disk%:%part%,%&drv%,%&boot1%,%&sty%,%&file_system%,%&vol%,%&label%,%&bus_name%.%&bus_name1%,%&devid%\n
            
            ///如果有特定参数
            ifex ['%part_x%'<>'' & '%part_x%'<>';all;'],
            {
                //如果当前分区不在 part_x 变量中，就直接跳至下一分区。
                lpos &part_find=;%disk%:%part%;,,%part_x%
                ifex #%&part_find%=0,exit Continue
            }
            ifex ['%devid_x%'<>'' & '%devid_x%'<>'%&devid%'                        ],exit CONTINUE  
            ifex ['%bus_x%'<>''   & '%bus_x%'<>'%&bus_name%'                       ],exit CONTINUE  
            ifex [#%label_y%=1    & '%label_x%'<>'%&label%'                        ] ,exit CONTINUE
            ifex ['%fs_x%'<>''    & '%fs_x%'<>'%&file_system%'                     ] ,exit CONTINUE
            ifex ['%sty_x%'<>''   & '%sty_x%'<>'%&sty%'                            ] ,exit CONTINUE
            ifex ['%disk_x%'<>''  & '%disk_x%'<>'%disk%'                           ] ,exit CONTINUE
            ifex '%boot_x%'<>'',
            {
                ifex [ #%boot_x%=3 & #%&boot1%>0 ],envi &boot2=1
                ifex '%boot_x%'='%&boot1%',envi &boot2=1
                ifex #%&boot2%<>1,exit Continue
            }
            envi. part_list1=%part_list1%  %disk%:%part%,%&drv%,%&boot1%,%&sty%,%&file_system%,%&vol%,%&label%,%&bus_name%.%&bus_name1%,%&devid%\n
        }
    }
}
ifex [#%list%=1],
{
    Writ -,$+0,  硬盘分区列表如下：
    Writ -,$+0,  Part     ,Ltr ,Boot    ,STY     ,FS      ,Volume,Label,BUS ,DEVID
    Writ -,$+0,  硬盘:分区,盘符,启动标记,分区结构,文件系统,卷路径, 卷标,接口,驱动
    Writ -,$+0,  -------------------------------------------------------------------------------
    Writ  -,$+0,%part_list%
    Writ  -,$+0,  ------------------------------------------------------------------------------
}

ifex [#%args%=0],
{
    ifex #%list%=0,Writ -,$+0,  缺少锁定分区的参数......
    exit file
}

//在筛选出的分区中查找含有特定文件或文件夹的分区
envi part_list3=
envi &part_list2=%part_list1%
ifex '%file_path_x%'<>'',
{
    forx *NL &part_list2,str1,
    {
            mstr -delims:, part,drv,act,sty,file_system,vol,label,bus,devid=<1><2><3><4><5><6><7><8><9>%str1%
            ifex '%drv%'<>'*:',
            {   //如果这个分区有盘符，就直接判断一下，如果有目标，就显示一下
                ifex %drv%%file_path_x%,
                {
                    envi. part_list3=%part_list3%%str1%\n
                }
            }!
            {   
                //如果没有盘符
                ifex '%vol%'<>'', //如果是可识别卷,即，有卷路径
                {
                    ifex \%vol%%file_path_x%, //如果该卷有目标就装个盘符
                    {
                        envi. part_list3=%part_list3%%str1%\n
                    }
                }!
                {  //如果分区不是可识别的卷就强行分配个盘符再判断
                        fdrv -idlec &drv_0s=*
                        mstr &drvx=<1>%&drv_0s%
                        show * %part%,,,%&drvx%
                        ifex %&drvx%:%file_path_x%, //如果这个分区有目标就显示找到
                        {
                            ifex #%UNmount%=0, //如果没有设置为卸载盘符
                            {
                                envi. part_list3=%part_list3%  %part%,%drvx%*,%act%,%sty%,%file_system%,%vol%,%label%,%bus%,%devid%,\n
                                envi mount_part=%part% %mount_part%
                            }!
                            {
                                envi. part_list3=%part_list3%%str1%\n
                                show - %part%
                            }
                            
                        }!
                        { //如果这个分区没有目标，就卸载刚分配的盘符
                            show - %part%
                        }
                }
            }
    }
}!
{
    envi part_list3=%part_list1%
}

//显示找到的分区 part_list3 ,并计算出 需要卸载的盘符 或者需要装载的分区。
envi 无盘符分区集1=  //需要装载的分区，或 
envi 盘符集1=        //需要卸载的盘符列表，或 已找到的符合条件的分区对应的盘符列表
ifex '%part_list3%'<>'',
{
    Writ -,$+0,  找到分区：
    Writ -,$+0,%part_list3%
    envi &part_list0=%part_list3%
    forx *NL &part_list0,str1,
    {
        mstr -delims:, part,drv,act,sty,file_system,vol,label,bus,devid=<1><2><3><4><5><6><7><8><9>%str1%
        ifex '%drv%'<>'*:',  //有盘符
        {
            mstr drv=1,1,%drv%
            envi 盘符集1=%drv%: %盘符集1%
        }!
        {   //无盘符
            envi 无盘符分区集1=%part% %无盘符分区集1%
        }
    }
}!
{
    Writ -,$+0,  未找到分区.
}

//装卸分区
Writ -,$+0,  ----------------------------------------------------------
ifex #%UNmount%=1, //如果设置为卸载盘符
{
    Writ -,$+0,  UnMount = %盘符集1%
    forx * %盘符集1%,&drvx,subj *-%&drvx%
}!
{  //默认为装载
    Writ -,$+0,  Mount = %无盘符分区集1% %mount_part%  //当前无盘符的分区和此前通过搜索文件而强行加载的分区
    forx * %无盘符分区集1%,&part1,
    {
        fdrv -idlec &drv_0s=*
        mstr &drvx=<1>%&drv_0s%
        show * %&part1%,,,%&drvx%
        envi 盘符集1=%&drvx%: %盘符集1%
    }
    Writ -,$+0,   drvs = %盘符集1%
}