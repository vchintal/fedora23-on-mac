# Guide to installing Fedora 23 on Mac

## Preparing the installation media 

1. Download [Fedora 23 Server](https://download.fedoraproject.org/pub/fedora/linux/releases/23/Server/x86_64/iso/Fedora-Server-DVD-x86_64-23.iso)

2. Plug-in a sacrificial USB with at least 3 GB of storage space onto your Mac 
3. Run the command `diskutil list` and view the output, it should look somewhat like the output below. Note the number **N** at the end of the device name, in my case the number is 1. We will need this number for running the next command.
  
  ```sh
  /dev/disk0
     #:                       TYPE NAME                    SIZE       IDENTIFIER
     0:      GUID_partition_scheme                        *500.3 GB   disk0
     1:                        EFI EFI                     209.7 MB   disk0s1
     2:                  Apple_HFS Macintosh HD            349.4 GB   disk0s2
     3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
     4:                  Apple_HFS Linux HFS+ ESP          209.7 MB   disk0s4
     5: 0FC63DAF-8483-4772-8E79-3D69D8477DE4               524.3 MB   disk0s5
     6:                  Linux LVM                         149.3 GB   disk0s6
  /dev/disk1
     #:                       TYPE NAME                    SIZE       IDENTIFIER
     0:     FDisk_partition_scheme                        *16.1 GB    disk1
     1:                 DOS_FAT_32 VIJAY                   16.1 GB    disk1s1
  ```

4. Unmount the USB device by the following command

  ```sh
  # Replace N with the number you noted earlier
  diskutil unmountDisk /dev/diskN
  ```

5. Change directory to the folder where you downloaded **Fedora-Server-DVD-x86_64-23.iso** file and run the follwing command:

  ```sh
  # Intermediate status can be checked with CTRL+T while the 
  # command is still running
  sudo dd if=Fedora-Server-DVD-x86_64-23.iso of=/dev/rdisk1 bs=1m
  ```
  
## Creating a new partition

1. Open **Finder → Utilities → Disk Utility**. Choose the top-level SSD on the left and **Partition** on the right as shown in the image below. 
2. Click on the **+** symbol and a new partition and call it **Fedora**, make selections such that your choices resemble the image below and click **Apply**
3. The disk layout should now look like the image below.

## Fedora 23 Installation

1. Open this page in your phone/tablet or any other device/computer
2. Plug-in the USB and restart the Mac. Before the Mac could boot up press and hold the **alt/option** button. You should be presented with a screen that resembles the image below. Choose **Fedora Media** and double-click/enter.
3. Choose the default **Language** and **Keyboard** and continue
4. When presented with a screen like the one shown below, click on the **Installation Destination**
5. Find the **Fedora** partition, as shown in the image below, and delete it; this will create space for your installation
6. Click on the link that says **Click here to create them automatically**, as shown in the image
7. Post creation your partitions should look like the image below. Click **Done** on the top left hand corner.
8. You will now be presented with **Summary of Changes**, make sure you review them and be 100% sure that your Mac partition is unaffected as shown in the image below
9. After the review click on **Accept Changes**
10. Before you click on **Begin Installation**, make appropriate software selection by clicking on the **Software Selection** option on the main screen which will lead you to the screen like the one shown below
  
