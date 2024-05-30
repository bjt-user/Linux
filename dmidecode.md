## installation
```
sudo pacman -S dmidecode
```

## general

```
man 8 dmidecode
```

The program seems to read binary files from dirs like `/sys/firmware/dmi/tables`.

```
sudo dmidecode | less
```

Among other things it will show the form factor:
```
Handle 0x0003, DMI type 3, 22 bytes
  Chassis Information
  Manufacturer: To Be Filled By O.E.M.
  Type: Desktop
```

#### look for specific handle

Handles can be specified in decimal or hexadecimal numbers.

```
sudo dmidecode -H 3
# dmidecode 3.5
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.
Table at 0x8DB71000.

Handle 0x0003, DMI type 3, 22 bytes
Chassis Information
	Manufacturer: To Be Filled By O.E.M.
	Type: Desktop
	Lock: Not Present
	Version: To Be Filled By O.E.M.
	Serial Number: To Be Filled By O.E.M.
	Asset Tag: To Be Filled By O.E.M.
	Boot-up State: Safe
	Power Supply State: Safe
	Thermal State: Safe
	Security Status: None
	OEM Information: 0x00000000
	Height: Unspecified
	Number Of Power Cords: 1
	Contained Elements: 0
	SKU Number: To Be Filled By O.E.M.
```

It gets the info from this file:
```
$ cat /sys/class/dmi/id/chassis_type
3
```
And apparently 3 means "Desktop".

#### get processor information

```
sudo dmidecode -H 0x17
```

or

```
sudo dmidecode -H 23
```

#### get motherboard information

```
$ sudo dmidecode -H 2
# dmidecode 3.5
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.
Table at 0x8DB71000.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
	Manufacturer: ASRock
	Product Name: H470M-HDV
	Version:
	Serial Number: BR80FC002300855
	Asset Tag:
	Features:
		Board is a hosting board
		Board is replaceable
	Location In Chassis:
	Chassis Handle: 0x0003
	Type: Motherboard
	Contained Object Handles: 0
```
