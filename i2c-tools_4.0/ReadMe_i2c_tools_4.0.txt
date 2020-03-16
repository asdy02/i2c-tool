I2C-Tools (4.0)
The I2C tools that used to be part of the lm-sensors package have been split to a separate package. The rationale for that move is that not all hardware monitoring chips are I2C devices, and not all I2C devices are hardware monitoring chips, so having everything in a single package was confusing and impractical.
The i2c-tools package contains a heterogeneous set of I2C tools for Linux: a bus probing tool, a chip dumper, register-level SMBus access helpers, EEPROM decoding scripts, EEPROM programming tools, and a python module for SMBus access. All versions of Linux are supported, as long as I2C support is included in the kernel.

���ص�ַ
https://i2c.wiki.kernel.org/index.php/I2C_Tools ����
git clone git://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git

ִ���ļ�
i2c-tools -4.0�������ִ���ļ�
i2cdetect �C ��ʾ���е�i2c������(������)����ʹ�õ�����
i2cdump �C��ȡ��������register��ֵ
i2cget �C ��ȡ����ĳ��register��ֵ
i2cset �C ������ĳ��registerд��ֵ
i2ctransfer �C��дi2c�豸������ -4.0�汾���

������Ϣ
i2ctransfer �Chelp��Ϣ                                    
Usage: i2ctransfer [-f] [-y] [-v] [-V] I2CBUS DESC [DATA] [DESC [DATA]]...
  I2CBUS is an integer or an I2C bus name
  DESC describes the transfer in the form: {r|w}LENGTH[@address]
    1) read/write-flag  2) LENGTH (range 0-65535)  3) I2C address (use last one if omitted)
  DATA are LENGTH bytes for a write message. They can be shortened by a suffix:
    = (keep value constant until LENGTH)    //д��LENGTH����ͬ������
    + (increase value by 1 until LENGTH)     //д��LENTH�����ݣ����ݵݼ�
		- (decrease value by 1 until LENGTH)    //д��LENTH�����ݣ����ݵݼ�
p (use pseudo random generator until LENGTH with value as seed)   //д�������

Example (bus 0, read 8 byte at offset 0x64 from EEPROM at 0x50):
  # i2ctransfer 0 w1@0x50 0x64 r8
Example (same EEPROM, at offset 0x42 write 0xff 0xfe ... 0xf0):
  # i2ctransfer 0 w17@0x50 0x42 0xff-
eg��# i2ctransfer -f -y 1 w1@0x33 0x55 r5
0x67 0x76 0x30 0x30 0x32

-f ǿ��ִ�У��������ʾDevice or resource busy
-y Ĭ��ִ��yes ���������ʾȷ��ִ��Continue? [Y/n] Y

i2cdetect ��i2cdump ��i2cget ��i2cset��������ִ��ʱ����ʾ��Ӧ�İ�����Ϣ���ɲο���
�����о�i2c����
i2cdetect -l
�о� I2C bus i2c-1 �������ӵ�����i2c�豸
i2cdetect -y 1
�磺��ȡI2C �豸(��ַΪ0x33)�Ĵ���0x55��ֵ��W��ʾ��ȡ����Ϊһ��word��Ĭ��Ϊһ���ֽ�
i2cget -y -f 1 0x33 0x55 w                          
0x7667
���� I2C �豸(��ַΪ0x33)�Ĵ���0x03��ֵΪ0x05
# i2cset -y -f 1 0x33 0x03 0x05
dump I2C ��ȡ����(��ַΪ0x33)�����мĴ���ֵ
i2cdump -y -f 1 0x33

�ο����ϣ�
http://blog.csdn.net/lqxandroid2012/article/details/48527887