  
  //����ű� ���� pecmd ʵ�ֶ԰�����һ������ vhd �ļ��Ĺ��ء�ж�ء�������
  //2021.06.03

  envi verx=1.15.4x
  call locate_vhds
  envi vhd_file1=
  Envi vhd_Cre2=
  envi vhds_up=
  
  //����в������ݹ������ͳ����жϲ������ͣ�������̷�·�����ͳ���ж�ض�Ӧ�ķ�����
   Find $"%~1"="*Unmount*",
   {	
			lstr drv1=2,%~2
			part -raw list drv %drv1%,drv_info
			mstr disk_n=<1> %drv_info%
			part list dep %disk_n%,vhd_file1
			Find $"%vhd_file1%"<>"",
			{
				call mount_yn "%vhd_file1%"
				FORX * -delims:: %mount%,ltr_9,subj - %ltr_9%
				moun-vhd  -u "%vhd_file1%"
				mess= [%drv1%]/[%mount%]\n[%vhd_file1%]\nж�����! @One_vhd Version:%verx%
			
			}!
			{
				mess= [%drv1%:] ����һ��VHDx������! @One_vhd Version:%verx%
			}
			exit file
   }

/////////////////
  envi single=������ѡ�ȷ��...
  call @win_VHD "%~1" "%~2"

_Sub page1,W476 H160,,,#
  list -h vhd_file0,  L15  T52  W460  H120,,,,0x104
  item but_find_vhd,  L425 T80  W50   H24,���,call Find_vhd
  radi r_vhd_up,      L15   T15  W100   H24,����VHDx,envi @vhd_file0.val=%vhds_UP%,1,0
  radi r_vhd_down,    L120  T15  W100   H24,ж��VHDx,team call locate_vhds|envi @vhd_file0.val=%vhds%,0,0
_END

_Sub page2, W476 H160,,,#
  edit vhd_Cre1,       L15  T12  W400  H24 ,,,
  item but_find_vhd1,  L419 T12  W50   H24 ,���,call Cre_vhd
  Labe Cre_l,          L15  T42  W70   H24 ,���(M) :
  List -h cre_size,    L70  T40  W50   H160,512M|1G|3G|4G|8G|10G|15G|20G|25G|30G|35G|40G|50G|60G|70G|80G,,20G,0x104
  labe Cre_2,          L135 T42  W35   H24 ,����:
  List -h vhd_type1,   L165 T40  W90   H240 ,FIXED|EXPANDABLE,,EXPANDABLE,0x100
  Labe Cre_3,		   L15   T65  W70   H24,�����ṹ:
  list -h vhd_sty,     L70   T62  W50   H240,MBR|GPT,,MBR,0X100
  Labe CRE_4,		   L135  T65  W35  H24,���: 
  Edit vol_LAB,		   L165  T62  W150  H18,VHD_PART,,
  lABE CRE_5,		   L325  T65  W40  H24,��ʽ:
  list -h VHD_FMT,	   L355  T62  W70  H240,NTFS|FAT32|FAT,,NTFS
  chek cre_child,	   L15  T92 W160  H20,�������(������VHDԴ),call show_hide_set,
  labe parent1,		   L15  T118 W20  H20,Դ:
  edit parent,		   L35 T113 W380 H20,,,
  item but_find_vhd0,  L419 t113 W50  H20,���,call find_parent
_END

_Sub show_hide_Set

  find #%cre_child.check%=1,
  {
	envi @Cre_l.visible=0
	envi @cre_size.visible=0
	envi @Cre_2.visible=0
	envi @vhd_type1.visible=0
	envi @Cre_3.visible=0
	envi @vhd_sty.visible=0
	envi @CRE_4.visible=0
	envi @vol_LAB.visible=0
	envi @CRE_5.visible=0
	envi @VHD_FMT.visible=0
  }!
  {
  	envi @Cre_l.visible=1
	envi @cre_size.visible=1
	envi @Cre_2.visible=1
	envi @vhd_type1.visible=1
	envi @Cre_3.visible=1
	envi @vhd_sty.visible=1
	envi @CRE_4.visible=1
	envi @vol_LAB.visible=1
	envi @CRE_5.visible=1
	envi @VHD_FMT.visible=1
  }
_end


_Sub win_vhd,W515 H250,װ��ж������ VHD(x)  One_vhd Version:%verx%,exit,shell32.dll#187,0,,-top
  Envi @this.font=9
  TABS TABS1,L10 T4 W490 H160,Page1:Name1:װж:װжVHDx;Page2:Name2:����:����VHDx,
  item but_vhd,      L12  T180 W60   H24,ȷ��,call vhd_program 
  Labe cre_6,		 L80 T185 W400 H18,%single%
  Find $"%~1"<>"",
  {
	Find $"%~1"="*Background*",
	{
		Envi @tabs1.select=2
		Envi @name2:vhd_cre1=%~2\
	}!
	{
		Envi @tabs1.select=1
	    call mount_yn "%~1"
		find $%mount%=NO,
		{ 
			envi @NAME1:vhd_file0.val=%~1
			envi vhds_up=%~1
		}!
		{
			Envi @name1:r_vhd_down.check=1
			Envi @name1:r_vhd_up.check=0
			envi @name1:vhd_file0.val=%vhds%
			envi @name1:vhd_file0.sel=%~1/%mount%
		}
		envi @name2:parent=%~1
		envi @name2:vhd_cre1=%~1.1
	}
  }
  ENVI @TABS1.MSG=_0x0201: call chk_tabs
_END
_Sub chk_tabs
	Find #%Tabs1.select%=1,
	{
		Find #%r_vhd_up.check%=1,envi @NAME1:vhd_file0.val=%vhds_UP%
		Find #%r_vhd_down.check%=1,envi @name1:vhd_file0.val=%vhds%
	}
_end

_Sub Find_vhd
  Find #%r_vhd_up.check%=1,envi up_down=����
  Find #%r_vhd_down.check%=1,envi up_down=ж��
  brow vhd_file1,,��ѡ��Ҫ%up_down%��VHD(x)�������ļ�,΢������Ӳ���ļ�VHD(x)|*.vhd?|��������|*.*,0x10000000
  ifex "%vhd_file1%",envi @vhd_file0=%vhd_file1%
_end
_Sub Cre_vhd
  brow vhd_Cre2,&,������Ҫ������VHDx�������ļ�,VHD(x)|*.vhd?,
  Fext vhd_ext=%vhd_cre2%
  Find $%vhd_cre2%=,!
  {
      Find $%vhd_ext%=, envi @vhd_cre1=%vhd_cre2%.vhd!envi @vhd_cre1=%vhd_cre2%
  }
_end
_Sub find_parent
  brow parent0,&,������Ҫ�����Ĳ��VHDx���ϼ��������ļ�,VHD(x)|*.vhd?,
  ifex "%parent0%",envi @parent=%parent0%
_end
_Sub vhd_program  
  Find #%Tabs1.select%=1,
  {
		////װ�غ���ת��ж��ҳ
		Find #%r_vhd_up.check%=1, 
		{
			envi @cre_6=���ڹ���VHDx�ļ�....
			call vhd_up_x "%vhd_file0%"
			call locate_vhds
			envi @cre_6=%single%
			Envi @name1:r_vhd_down.check=1
			Envi @name1:r_vhd_up.check=0
			envi @name1:vhd_file0.val=%vhds%
			envi @name1:vhd_file0.sel=%vhd_file9%/%ltrs%
			exit _sub		
		}
    
		////ж��
		Find #%r_vhd_down.check%=1,
		{
			envi @cre_6=����ж��VHDx�ļ�....
			envi vhd_file_n=%vhd_file0.isel%
			mstr -delims:/ vhd_file2=<1>%vhd_file0%
			call mount_yn "%vhd_file2%"
			find $%mount%=NO,
			{
				mess= [���ļ�û�б�����!] @One_vhd Version:%verx%
			
			}!
			{
				ifex "%vhd_file2%",
				{
					FORX * -delims:: %mount%,ltr_9,subj - %ltr_9%
					moun-vhd  -u "%vhd_file2%"
					mess= [%vhd_file2%]\n[%mount%]\n[ж�����!] @One_vhd Version:%verx%	
				
				}!
				{
					mess= [Ҫװ�ص�����Ӳ���ļ�������!] @One_vhd Version:%verx%
				}
				call locate_vhds
				envi @name1:vhd_file0.val=%vhds%
			}
			envi @cre_6=%single%
			exit _sub
		}
   } 
   ////����
   Find #%Tabs1.select%=2,
   {
        envi @cre_6=���ڴ���VHDx�ļ�....
		Find $"%vhd_cre1%"="",
		{
          mess= ������Ҫ����������Ӳ���ļ�λ��! @One_vhd Version:%verx%
          exit _sub
		}
		ifex "%vhd_Cre1%",
		{
			mess= [�������ļ����ô���!] @One_vhd Version:%verx%
			exit _sub
		}
		Find #%cre_child.check%=0,
		{
		//������Ǵ������vhd 
			fext ext=%vhd_Cre1%
			Find [$"%ext%"<>"vhd" & $"%ext%"<>"vhdx"] ,
			{
				envi @name2:vhd_cre1=%vhd_cre1%.vhd
				envi ext=vhd
			}
			envi vhd_name="%vhd_Cre1%"
			envi vhd_offset=64K
			envi vhd_type11=
			Find $%vhd_type1%=expandable,envi vhd_type11=-d
			find $"%ext%"="vhdx",envi vhd_type0=-cx
			find $"%ext%"="vhd" ,envi vhd_type0=-c
			ENVI GPT_ARG2=
			find $%vhd_sty%=GPT,
			{
				ENVI vhd_part_id={EBD0A0A2-B9E5-4433-87C0-68B6B72699C7}
				ENVI GPT_ARG2={EBD0A0A2-B9E5-4433-87C0-68B6B72699C7} 0x0000000000000001  "Basic data partition"
			}
			find $%vhd_sty%=MBR,envi vhd_part_id=a 0X07
			//�����������ļ�
				Find $%vhd_type1%=Fixed,envi @cre_6=%Cre_6%[Fixed]ģʽ������Ҫһ���ʱ��.....
				calc cre_size0=int(%cre_size%)
				ENVI CMD1=moun -vhd %vhd_type0% %vhd_type11% %vhd_name%,%cre_size0%
				%CMD1%
			//�����������ļ�,�����ر��� vhd_info
				moun -vhd %vhd_name%,,,vhd_info
			//���� vhd_info ��ȡ�����̶�Ӧ��Ӳ�������е����
				mstr vhd_disk=<1>%vhd_info%
				
			//����������ļ������ɹ�
			ifex #%vhd_disk%>-1,
			{
				//���������̴�С������������Է����Ŀռ��С�������� offset=64K λ�ÿ�ʼ��
					calc vhd_part_size=%cre_size0%-%vhd_offset%
			
				//��������
					envi @cre_6=VHDx ��������......
					PART -xup -admin -force -%vhd_sty% init %vhd_disk%
					envI CMD2=part -%vhd_sty% -xup -admin -fs %vhd_disk%#1 %vhd_part_id% %vhd_offset%  %vhd_part_size% %gpt_arg2%
					%CMD2%
				//ѭ���жϲ��ȴ�����������ϲ��Ѿ���ʶ��Ϊ��
					call loop1 volume %vhd_disk%#1
				//���������ʶ��Ϊ���������̷�����ж���̷�,���·����̷�����ʽ��������
					envi mount_ltr=
				find $"%info_x%"<>"",
				{
					envi @cre_6=VHDx ��ʽ������......
					mstr mount_ltr=<8> %info_x%
					find $"%mount_ltr%"<>"",
					{
						disk ,%vhd_disk%,1,1
					}
					//�������һ�����ÿ����̷�����������մ����ķ���������ʽ��Ϊָ����ʽ��
					fdrv *idlec drvs=*:
					mstr mount_ltr=<-1> %drvs%
					disk %mount_ltr%,%vhd_disk%,1
					dfmt %mount_ltr%,%VHD_FMT%,%vol_LAB%,1	
				}
				call up_vhds0 %vhd_name%			
				envi msg1=[%ext% �ļ��������!]\n [DISK=%vhd_disk%] \n [%vhd_name%]\n [%cre_size%] [%vhd_type1%]\n [%mount_ltr%] [%vhd_disk%:1] [%vhd_sty%] [%VHD_FMT%] [%vol_lab%]

			}!
			{
				envi msg1=[%ext% �ļ�����ʧ��!]\n [DISK=%vhd_disk%] \n [%vhd_name%]\n [%cre_size%] [%vhd_type1%]\n [%mount_ltr%] [%vhd_disk%:1] [%vhd_sty%] [%VHD_FMT%] [%vol_lab%]
			}
			envi @cre_6=VHDx �������......
			mess= %msg1% @One_vhd Version:%verx%
		}
		Find #%cre_child.check%=1,
		{
		  //����������
			ifex "%parent%",
			{
				envi vhd_name="%vhd_cre1%"
				call mount_yn "%parent%"
				find $"%mount%"<>"NO",
				{
					FORX * -delims:: %mount%,ltr_9,subj - %ltr_9%
					moun-vhd  -u "%parent%"
				}
				envi vhd_result=9
				forx * -c -cx ,type0,
				{
						envi vhd_info9=
						envi cmd5=moun -vhd %type0% -d %vhd_name%,"%parent%",,vhd_info9
						%cmd5%
						mstr vhd_info9=<1>%vhd_info9%
						find #%vhd_info9%=0,envi vhd_result=0
				}
				find #%vhd_result%=0,
				{
					call vhd_up_x %vhd_name%
				
				}!
				{
					mess= [����������ļ�����ʧ��.] @One_vhd Version:%verx%
					exit _sub
				}
			
			}!
			{
				mess= [�ϼ��������ļ����ò���ȷ!] @One_vhd Version:%verx%
				exit _sub
			}
		}
		call locate_vhds
		Envi @name1:r_vhd_down.check=1
		Envi @name1:r_vhd_up.check=0
		envi @name1:vhd_file0.val=%vhds%
        envi @cre_6=%single%
		exit _sub
   }
_end

//���ղ������� ��Ӧ vhd �ļ�
_Sub vhd_up_x
	envi vhd_file9="%~1"
      ifex %vhd_file9%,
        {
			call mount_yn %vhd_file9%
			find $"%mount%"="No",
			{
				moun-vhd %vhd_file9%,,,vhd_info
				mstr vhd_n=<1> %vhd_info%
				Find #%vhd_n% < 0,
				{
					mess= [%vhd_file9%]\n [װ��ʧ�� !] @One_vhd Version:%verx%
				
				}!
				{
					call loop1 disk %vhd_n%
					call up_part_ltr %vhd_n%
					mess= [%vhd_file9%]\n[%ltrs%]\n[װ����� !] @One_vhd Version:%verx%
				}
			
			}!
			{
				mess= [���ļ����ѱ����أ�] [%mount%] @One_vhd Version:%verx%
			}
			call up_vhds0 %vhd_file9%
        
        }!
        {
          mess= [Ҫװ�ص�����Ӳ���ļ�������!] @One_vhd Version:%verx%
        }
_end

//�Ѽ���ǰ�����ص�����Ӳ���ļ��������̽��������������̷�
_sub Locate_vhds
	envi vhds=
	part list disk ,disks
	forx * %disks%,disk,
	{
		part list dep %disk%,vhd_files
		find $%vhd_files%<>,
		{
			envi vhd_ltr=
			part  list part %disk% ,parts
			forx * %parts% ,partx ,
			{
				Find #%partx%>0,
				{
					part -fill list part %disk%#%partx%,part_info
					mstr ltr2=<8> %part_info%
					find $%ltr2%<>*,envi vhd_ltr=%vhd_ltr%%ltr2%
				}
			}
			envi vhds=%vhds%|%vhd_files%/%vhd_ltr%
		}
	}
_end

//����һ�����������·����vhd�ļ������ж����vhd�Ƿ񱻹�����
_Sub mount_yn
	envi mount=No
	envi &vhds2=%vhds%
	forx *NL:| vhds2,vhd_file3,
	{
		mstr -delims:/ vhd_fx,vhd_ltr2=<1><2>%vhd_file3%
		Find $%vhd_fx%=%~1,envi mount=%vhd_ltr2%
	}
_end

//����һ�����������·����vhd�ļ���������������ӵ��������ع���vhd�����
_Sub up_vhds0
	    	envi &vhds_up2=%vhds_up%
			envi found1=No
			forx *NL:| vhds_up2,vhds_up3,
			{
				find $%vhds_up3%=%~1,envi found1=yes
			}
			find $%found1%=No,envi vhds_up=%vhds_up%|%~1
_end

//�����ݹ�����Ӳ�̺Ŷ�Ӧ��Ӳ����û�з����̷��Ŀ�ʶ����������̷�
_Sub up_part_ltr
	envi diskx=%~1
	part  list part %diskx% ,parts
	envi ltrs=
	forx * %parts% ,partx ,
	{
		Find #%partx%>0,
		{
			call loop1 part %diskx%#%partx%
			mstr id2,ltr2=<2><8> %info_x%
			find $%ltr2%=*,
			{
				part list volume %diskx%#%partx%,vol_info
				ifex ['%vol_info%'<>'' | '%id2%'='C12A7328-F81F-11D2-BA4B-00A0C93EC93B'],
				{
					fdrv -idlec drvs=*:
					mstr ltr3=<1> %drvs%
					disk %ltr3%,%diskx%,%partx%,1
					CALL LOOP1 drv %ltr3%
					envi ltrs=%ltrs%%ltr3%
				}
			
			}!
			{
				envi ltrs=%ltrs%%ltr2%
			}
		}
	}
_end

//������������ 1,����(disk part volume drv) 2,��� 1 1#1 1#1 x:
//ѭ���ж� ĳ���ض����͵� Ŀ���Ƿ�װ����.���װ���� info_x �Ͳ���Ϊ�ա�
_Sub loop1
	envi info_x=
	envi n=0
	loop ['%info_x%'='' & #%n%<30],
	{
		find $"%1"="volume",PART -drv list volume %2,info_x
		find $"%1"="disk",  part list disk %2,info_x
		find $"%1"="part",  part -fill list part %2,info_x
		find $"%1"="drv",   fdrv -vol ,,info_x=%2
		calc n=%n%+1
		wait 50
	}
_END