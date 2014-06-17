makeoptions	MODULES_OVERRIDE="opensolaris zfs krpc acl_nfs4"

cpu		HAMMER
ident		sql

#makeoptions	DEBUG=-gdwarf-2		# Build kernel with gdb(1) debug symbols
makeoptions	WITH_CTF=1		# Run ctfconvert(1) for DTrace support

options 	SCHED_ULE		# ULE scheduler
options 	PREEMPTION		# Enable kernel thread preemption
options 	INET			# InterNETworking
options 	INET6			# IPv6 communications protocols
options 	TCP_OFFLOAD		# TCP offload
options 	SCTP			# Stream Control Transmission Protocol
options 	FFS			# Berkeley Fast Filesystem
options 	SOFTUPDATES		# Enable FFS soft updates support
options 	UFS_ACL			# Support for access control lists
options 	UFS_DIRHASH		# Improve performance on big directories
options 	UFS_GJOURNAL		# Enable gjournal-based UFS journaling
options 	QUOTA			# Enable disk quotas for UFS
options 	MD_ROOT			# MD is a potential root device
options 	NFSCL			# New Network Filesystem Client
options 	NFSD			# New Network Filesystem Server
options 	NFSLOCKD		# Network Lock Manager
options 	NFS_ROOT		# NFS usable as /, requires NFSCL
options 	MSDOSFS			# MSDOS Filesystem
options 	CD9660			# ISO 9660 Filesystem
options		TMPFS
#options 	PROCFS			# Process filesystem (requires PSEUDOFS)
options 	PSEUDOFS		# Pseudo-filesystem framework
options 	GEOM_PART_GPT		# GUID Partition Tables.
options 	GEOM_RAID		# Soft RAID functionality.
options 	GEOM_LABEL		# Provides labelization
#options 	COMPAT_FREEBSD32	# Compatible with i386 binaries
#options 	COMPAT_FREEBSD4		# Compatible with FreeBSD4
#options 	COMPAT_FREEBSD5		# Compatible with FreeBSD5
#options 	COMPAT_FREEBSD6		# Compatible with FreeBSD6
#options 	COMPAT_FREEBSD7		# Compatible with FreeBSD7
options 	SCSI_DELAY=5000		# Delay (in ms) before probing SCSI
options 	KTRACE			# ktrace(1) support
options 	STACK			# stack(9) support
options 	SYSVSHM			# SYSV-style shared memory
options 	SYSVMSG			# SYSV-style message queues
options 	SYSVSEM			# SYSV-style semaphores
options 	_KPOSIX_PRIORITY_SCHEDULING # POSIX P1003_1B real-time extensions
options 	PRINTF_BUFR_SIZE=128	# Prevent printf output being interspersed.
options 	KBD_INSTALL_CDEV	# install a CDEV entry in /dev
options 	HWPMC_HOOKS		# Necessary kernel hooks for hwpmc(4)
options 	AUDIT			# Security event auditing
options 	CAPABILITY_MODE		# Capsicum capability mode
options 	CAPABILITIES		# Capsicum capabilities
options 	PROCDESC		# Support for process descriptors
#options 	MAC			# TrustedBSD MAC Framework
options 	KDTRACE_FRAME		# Ensure frames are compiled in
options 	KDTRACE_HOOKS		# Kernel DTrace hooks
options 	DDB_CTF			# Kernel ELF linker loads CTF data
options 	INCLUDE_CONFIG_FILE     # Include this file in kernel

# Debugging support.  Always need this:
options 	KDB			# Enable kernel debugger support.
options 	KDB_TRACE		# Print a stack trace for a panic.

# Make an SMP-capable kernel by default
options 	SMP			# Symmetric MultiProcessor Kernel

# CPU frequency control
device		cpufreq

# Bus support.
device		acpi
options 	ACPI_DMAR
device		pci

# Floppy drives
#device		fdc

# ATA controllers
device		ahci		# AHCI-compatible SATA controllers
device		ata		# Legacy ATA/SATA controllers
options 	ATA_STATIC_ID	# Static device numbering
#device		mvs		# Marvell 88SX50XX/88SX60XX/88SX70XX/SoC SATA
#device		siis		# SiliconImage SiI3124/SiI3132/SiI3531 SATA

# SCSI Controllers
#device		ahc		# AHA2940 and onboard AIC7xxx devices
#options 	AHC_REG_PRETTY_PRINT	# Print register bitfields in debug
					# output.  Adds ~128k to driver.
#device		ahd		# AHA39320/29320 and onboard AIC79xx devices
#options 	AHD_REG_PRETTY_PRINT	# Print register bitfields in debug
					# output.  Adds ~215k to driver.
#device		esp		# AMD Am53C974 (Tekram DC-390(T))
#device		hptiop		# Highpoint RocketRaid 3xxx series
#device		isp		# Qlogic family
#device		ispfw		# Firmware for QLogic HBAs- normally a module
device		mpt		# LSI-Logic MPT-Fusion
device		mps		# LSI-Logic MPT-Fusion 2
#device		ncr		# NCR/Symbios Logic
#device		sym		# NCR/Symbios Logic (newer chipsets + those of `ncr')
#device		trm		# Tekram DC395U/UW/F DC315U adapters

#device		adv		# Advansys SCSI adapters
#device		adw		# Advansys wide SCSI adapters
#device		aic		# Adaptec 15[012]x SCSI adapters, AIC-6[23]60.
#device		bt		# Buslogic/Mylex MultiMaster SCSI adapters
#device		isci		# Intel C600 SAS controller

# ATA/SCSI peripherals
device		scbus		# SCSI bus (required for ATA/SCSI)
#device		ch		# SCSI media changers
device		da		# Direct Access (disks)
#device		sa		# Sequential Access (tape etc)
#device		cd		# CD
device		pass		# Passthrough device (direct ATA/SCSI access)
#device		ses		# Enclosure Services (SES and SAF-TE)
#device		ctl		# CAM Target Layer

# RAID controllers interfaced to the SCSI subsystem
#device		amr		# AMI MegaRAID
#device		arcmsr		# Areca SATA II RAID
#XXX it is not 64-bit clean, -scottl
#device		asr		# DPT SmartRAID V, VI and Adaptec SCSI RAID
#device		ciss		# Compaq Smart RAID 5*
#device		dpt		# DPT Smartcache III, IV - See NOTES for options
#device		hptmv		# Highpoint RocketRAID 182x
#device		hptnr		# Highpoint DC7280, R750
#device		hptrr		# Highpoint RocketRAID 17xx, 22xx, 23xx, 25xx
#device		hpt27xx		# Highpoint RocketRAID 27xx
#device		iir		# Intel Integrated RAID
#device		ips		# IBM (Adaptec) ServeRAID
#device		mly		# Mylex AcceleRAID/eXtremeRAID
#device		twa		# 3ware 9000 series PATA/SATA RAID
#device		tws		# LSI 3ware 9750 SATA+SAS 6Gb/s RAID controller

# RAID controllers
#device		aac		# Adaptec FSA RAID
#device		aacp		# SCSI passthrough for aac (requires CAM)
#device		aacraid		# Adaptec by PMC RAID
#device		ida		# Compaq Smart RAID
#device		mfi		# LSI MegaRAID SAS
#device		mlx		# Mylex DAC960 family
#XXX pointer/int warnings
#device		pst		# Promise Supertrak SX6000
#device		twe		# 3ware ATA RAID

# atkbdc0 controls both the keyboard and the PS/2 mouse
device		atkbdc		# AT keyboard controller
device		atkbd		# AT keyboard
device		psm		# PS/2 mouse

device		kbdmux		# keyboard multiplexer

device		vga		# VGA video card driver
options 	VESA		# Add support for VESA BIOS Extensions (VBE)

device		splash		# Splash screen and screen saver support

# syscons is the default console driver, resembling an SCO console
device		sc
options 	SC_PIXEL_MODE	# add support for the raster text mode
options		SC_KERNEL_CONS_REV_ATTR=(FG_BLACK|BG_RED)
options		SC_KERNEL_CONS_ATTR=(FG_RED|BG_BLACK)
options		SC_NORM_REV_ATTR=(FG_YELLOW|BG_BLACK)
options		SC_NORM_ATTR=(FG_GREEN|BG_BLACK)


#device		agp		# support several AGP chipsets

# PCCARD (PCMCIA) support
# PCMCIA and cardbus bridge support
#device		cbb		# cardbus (yenta) bridge
#device		pccard		# PC Card (16-bit) bus
#device		cardbus		# CardBus (32-bit) bus

# Serial (COM) ports
#device		uart		# Generic UART driver

# Parallel port
#device		ppc
#device		ppbus		# Parallel port bus (required)
#device		lpt		# Printer
#device		ppi		# Parallel port interface device
#device		vpo		# Requires scbus and da

device		puc		# Multi I/O cards and multi-channel UARTs

# PCI Ethernet NICs.
#device		bxe		# Broadcom NetXtreme II BCM5771X/BCM578XX 10GbE
#device		de		# DEC/Intel DC21x4x (``Tulip'')
#device		em		# Intel PRO/1000 Gigabit Ethernet Family
#device		igb		# Intel PRO/1000 PCIE Server Gigabit Family
#device		ixgbe		# Intel PRO/10GbE PCIE Ethernet Family
#device		le		# AMD Am7900 LANCE and Am79C9xx PCnet
#device		ti		# Alteon Networks Tigon I/II gigabit Ethernet
#device		txp		# 3Com 3cR990 (``Typhoon'')
#device		vx		# 3Com 3c590, 3c595 (``Vortex'')

# PCI Ethernet NICs that use the common MII bus controller code.
# NOTE: Be sure to keep the 'device miibus' line in order to use these NICs!
device		miibus		# MII bus support
#device		ae		# Attansic/Atheros L2 FastEthernet
#device		age		# Attansic/Atheros L1 Gigabit Ethernet
#device		alc		# Atheros AR8131/AR8132 Ethernet
#device		ale		# Atheros AR8121/AR8113/AR8114 Ethernet
#device		bce		# Broadcom BCM5706/BCM5708 Gigabit Ethernet
#device		bfe		# Broadcom BCM440x 10/100 Ethernet
#device		bge		# Broadcom BCM570xx Gigabit Ethernet
#device		cas		# Sun Cassini/Cassini+ and NS DP83065 Saturn
#device		dc		# DEC/Intel 21143 and various workalikes
#device		et		# Agere ET1310 10/100/Gigabit Ethernet
#device		fxp		# Intel EtherExpress PRO/100B (82557, 82558)
#device		gem		# Sun GEM/Sun ERI/Apple GMAC
#device		hme		# Sun HME (Happy Meal Ethernet)
#device		jme		# JMicron JMC250 Gigabit/JMC260 Fast Ethernet
#device		lge		# Level 1 LXT1001 gigabit Ethernet
#device		msk		# Marvell/SysKonnect Yukon II Gigabit Ethernet
#device		nfe		# nVidia nForce MCP on-board Ethernet
#device		nge		# NatSemi DP83820 gigabit Ethernet
#device		nve		# nVidia nForce MCP on-board Ethernet Networking
#device		pcn		# AMD Am79C97x PCI 10/100 (precedence over 'le')
#device		re		# RealTek 8139C+/8169/8169S/8110S
#device		rl		# RealTek 8129/8139
#device		sf		# Adaptec AIC-6915 (``Starfire'')
#device		sge		# Silicon Integrated Systems SiS190/191
#device		sis		# Silicon Integrated Systems SiS 900/SiS 7016
#device		sk		# SysKonnect SK-984x & SK-982x gigabit Ethernet
#device		ste		# Sundance ST201 (D-Link DFE-550TX)
#device		stge		# Sundance/Tamarack TC9021 gigabit Ethernet
#device		tl		# Texas Instruments ThunderLAN
#device		tx		# SMC EtherPower II (83c170 ``EPIC'')
#device		vge		# VIA VT612x gigabit Ethernet
#device		vr		# VIA Rhine, Rhine II
#device		wb		# Winbond W89C840F
#device		xl		# 3Com 3c90x (``Boomerang'', ``Cyclone'')

# ISA Ethernet NICs.  pccard NICs included.
#device		cs		# Crystal Semiconductor CS89x0 NIC
# 'device ed' requires 'device miibus'
#device		ed		# NE[12]000, SMC Ultra, 3c503, DS8390 cards
#device		ex		# Intel EtherExpress Pro/10 and Pro/10+
#device		ep		# Etherlink III based cards
#device		fe		# Fujitsu MB8696x based cards
#device		sn		# SMC's 9000 series of Ethernet chips
#device		xe		# Xircom pccard Ethernet

# Wireless NIC cards
#device		wlan		# 802.11 support
#options 	IEEE80211_DEBUG	# enable debug msgs
#options 	IEEE80211_AMPDU_AGE # age frames in AMPDU reorder q's
#options 	IEEE80211_SUPPORT_MESH	# enable 802.11s draft support
#device		wlan_wep	# 802.11 WEP support
#device		wlan_ccmp	# 802.11 CCMP support
#device		wlan_tkip	# 802.11 TKIP support
#device		wlan_amrr	# AMRR transmit rate control algorithm
#device		an		# Aironet 4500/4800 802.11 wireless NICs.
#device		ath		# Atheros NICs
#device		ath_pci		# Atheros pci/cardbus glue
#device		ath_hal		# pci/cardbus chip support
#options 	AH_SUPPORT_AR5416	# enable AR5416 tx/rx descriptors
#options 	AH_AR5416_INTERRUPT_MITIGATION	# AR5416 interrupt mitigation
#options 	ATH_ENABLE_11N	# Enable 802.11n support for AR5416 and later
#device		ath_rate_sample	# SampleRate tx rate control for ath
#device		bwi		# Broadcom BCM430x/BCM431x wireless NICs.
#device		bwn		# Broadcom BCM43xx wireless NICs.
#device		ipw		# Intel 2100 wireless NICs.
#device		iwi		# Intel 2200BG/2225BG/2915ABG wireless NICs.
#device		iwn		# Intel 4965/1000/5000/6000 wireless NICs.
#device		malo		# Marvell Libertas wireless NICs.
#device		mwl		# Marvell 88W8363 802.11n wireless NICs.
#device		ral		# Ralink Technology RT2500 wireless NICs.
#device		wi		# WaveLAN/Intersil/Symbol 802.11 wireless NICs.
#device		wpi		# Intel 3945ABG wireless NICs.

# Pseudo devices.
device		loop		# Network loopback
device		random		# Entropy device
#device		padlock_rng	# VIA Padlock RNG
#device		rdrand_rng	# Intel Bull Mountain RNG
device		ether		# Ethernet support
device		vlan		# 802.1Q VLAN support
device		tun		# Packet tunnel.
device		md		# Memory "disks"
device		gif		# IPv6 and IPv4 tunneling
device		faith		# IPv6-to-IPv4 relaying (translation)
device		firmware	# firmware assist module

# The `bpf' device enables the Berkeley Packet Filter.
# Be aware of the administrative consequences of enabling this!
# Note that 'bpf' is required for DHCP.
device		bpf		# Berkeley packet filter

# USB support
options 	USB_DEBUG	# enable debug msgs
device		uhci		# UHCI PCI->USB interface
device		ohci		# OHCI PCI->USB interface
device		ehci		# EHCI PCI->USB interface (USB 2.0)
device		xhci		# XHCI PCI->USB interface (USB 3.0)
device		usb		# USB Bus (required)
device		ukbd		# Keyboard
device		umass		# Disks/Mass storage - Requires scbus and da

# Sound support
#device		sound		# Generic sound driver (required)
#device		snd_cmi		# CMedia CMI8338/CMI8738
#device		snd_csa		# Crystal Semiconductor CS461x/428x
#device		snd_emu10kx	# Creative SoundBlaster Live! and Audigy
#device		snd_es137x	# Ensoniq AudioPCI ES137x
#device		snd_hda		# Intel High Definition Audio
#device		snd_ich		# Intel, NVidia and other ICH AC'97 Audio
#device		snd_via8233	# VIA VT8233x Audio

# MMC/SD
device		mmc		# MMC/SD bus
device		mmcsd		# MMC/SD memory card
device		sdhci		# Generic PCI SD Host Controller

# VirtIO support
#device		virtio		# Generic VirtIO bus (required)
#device		virtio_pci	# VirtIO PCI device
#device		vtnet		# VirtIO Ethernet device
#device		virtio_blk	# VirtIO Block device
#device		virtio_scsi	# VirtIO SCSI device
#device		virtio_balloon	# VirtIO Memory Balloon device

# HyperV drivers
#device		hyperv		# HyperV drivers 

# Xen HVM Guest Optimizations
# NOTE: XENHVM depends on xenpci.  They must be added or removed together.
#options 	XENHVM		# Xen HVM kernel infrastructure
#device		xenpci		# Xen HVM Hypervisor services driver

# VMware support
device		vmx		# VMware VMXNET3 Ethernet


# netgraph options
#options		HZ=1000
#options		NETGRAPH
#options		NETGRAPH_PPPOE
#options		NETGRAPH_SOCKET
#options		NETGRAPH_CISCO
#options		NETGRAPH_ECHO
#options		NETGRAPH_FRAME_RELAY
#options		NETGRAPH_HOLE
#options		NETGRAPH_KSOCKET
#options		NETGRAPH_LMI
#options		NETGRAPH_RFC1490
#options		NETGRAPH_TTY
#options		NETGRAPH_ASYNC
#options		NETGRAPH_BPF
#options		NETGRAPH_ETHER
#options		NETGRAPH_IFACE
#options		NETGRAPH_KSOCKET
#options		NETGRAPH_L2TP
#options		NETGRAPH_MPPC_ENCRYPTION
#options		NETGRAPH_PPP
#options		NETGRAPH_PPTPGRE
#options		NETGRAPH_TEE
#options		NETGRAPH_UI
#options		NETGRAPH_VJC

device		pf
device		pflog
device		pfsync

