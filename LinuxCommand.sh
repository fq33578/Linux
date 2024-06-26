#設定日期時間
timedatectl set-time '2020-10-11 17:51:00'

#啟用/停止NTP自動對時
service ntpd start
service ntpd stop

#查看本機所有連結網卡(包含未啟用)
ip addr 

#重新獲取設備UUID
uuidgen (網卡名稱)

# 將 myfolder 目錄複製到 /path/to/ 路徑下
cp -r myfolder /path/to/

#強制刪除opsmgr檔案資料夾(非空資料夾)
rm -rf opsmgr

#查看資料夾占用容量大小
du 
-a：列出所有檔案，包含隱藏檔( 開頭為 . 的檔案)，預設只有統計目錄下的檔案數量
-h：可將檔案容易以易讀式呈現(EX：GB、MB、 KB、…)
-s：計算這個目錄下的所有檔案、資料夾總量大小(但不分別列出個資料夾與檔案大小)
-S：計算並列出目錄下所有資料夾檔案大小
-sh:目前目錄檔案占用大小
-ah列出所有資料夾與檔案大小

# 將 myfolder 目錄壓縮成 archive.zip
zip -r archive.zip myfolder

#ping IP 帶時間搓
ping 10.46.73.16 | awk '{ print $0"\t" strftime("%H:%M:%S",systime()) } '

#開/關WiFi(也可用於重啟無線網路模組)
ifconfig wlan0 up
ifconfig wlan0 down

#CentOS重啟網路
>CentOS 6(Ubuntu/Debian)
service network restart 

or

/etc/init.d/network restart

>CentOS 7
systemctl restart network

#檔案改權限
>全讀全寫(Error:Permission Denied)
chmod 777 XXXX

>全讀
chmod 444 XXX

###ubuntu 修改IP###

1. ifconfig #取得網卡名稱
2. netplan generate #生成配置文件
3. sudo vi /etc/netplan/01-network-manager-all.yaml#編輯文件
4. 修改為:
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    ens32: #網卡名稱
      addresses: [ 10.46.73.71/24 ]
5. wq! #強制寫入保存	  
6. netplan apply #套用設置
ps:需注意文字縮排
