
module PE;

export {
	const machine_types: table[count] of string = {
		[0x00]   = "UNKNOWN",
		[0x1d3]  = "AM33",
		[0x8664] = "AMD64",
		[0x1c0]  = "ARM",
		[0x1c4]  = "ARMNT",
		[0xaa64] = "ARM64",
		[0xebc]  = "EBC",
		[0x14c]  = "I386",
		[0x200]  = "IA64",
		[0x9041] = "M32R",
		[0x266]  = "MIPS16",
		[0x366]  = "MIPSFPU",
		[0x466]  = "MIPSFPU16",
		[0x1f0]  = "POWERPC",
		[0x1f1]  = "POWERPCFP",
		[0x166]  = "R4000",
		[0x1a2]  = "SH3",
		[0x1a3]  = "SH3DSP",
		[0x1a6]  = "SH4",
		[0x1a8]  = "SH5",
		[0x1c2]  = "THUMB",
		[0x169]  = "WCEMIPSV2"
	} &default=function(i: count):string { return fmt("unknown-%d", i); };

	const file_characteristics: table[count] of string = {
		[0x1]    = "RELOCS_STRIPPED",
		[0x2]    = "EXECUTABLE_IMAGE",
		[0x4]    = "LINE_NUMS_STRIPPED",
		[0x8]    = "LOCAL_SYMS_STRIPPED",
		[0x10]   = "AGGRESSIVE_WS_TRIM",
		[0x20]   = "LARGE_ADDRESS_AWARE",
		[0x80]   = "BYTES_REVERSED_LO",
		[0x100]  = "32BIT_MACHINE",
		[0x200]  = "DEBUG_STRIPPED",
		[0x400]  = "REMOVABLE_RUN_FROM_SWAP",
		[0x800]  = "NET_RUN_FROM_SWAP",
		[0x1000] = "SYSTEM",
		[0x2000] = "DLL",
		[0x4000] = "UP_SYSTEM_ONLY",
		[0x8000] = "BYTES_REVERSED_HI"
	} &default=function(i: count):string { return fmt("unknown-%d", i); };

	const dll_characteristics: table[count] of string = {
		[0x40]   = "DYNAMIC_BASE",
		[0x80]   = "FORCE_INTEGRITY",
		[0x100]  = "NX_COMPAT",
		[0x200]  = "NO_ISOLATION",
		[0x400]  = "NO_SEH",
		[0x800]  = "NO_BIND",
		[0x2000] = "WDM_DRIVER",
		[0x8000] = "TERMINAL_SERVER_AWARE"
	} &default=function(i: count):string { return fmt("unknown-%d", i); };

	const windows_subsystems: table[count] of string = {
		[0]  = "UNKNOWN",
		[1]  = "NATIVE",
		[2]  = "WINDOWS_GUI",
		[3]  = "WINDOWS_CUI",
		[7]  = "POSIX_CUI",
		[9]  = "WINDOWS_CE_GUI",
		[10] = "EFI_APPLICATION",
		[11] = "EFI_BOOT_SERVICE_DRIVER",
		[12] = "EFI_RUNTIME_ DRIVER",
		[13] = "EFI_ROM",
		[14] = "XBOX"
	} &default=function(i: count):string { return fmt("unknown-%d", i); };

	const section_characteristics: table[count] of string = {
		[0x8]        = "TYPE_NO_PAD",
		[0x20]       = "CNT_CODE",
		[0x40]       = "CNT_INITIALIZED_DATA",
		[0x80]       = "CNT_UNINITIALIZED_DATA",
		[0x100]      = "LNK_OTHER",
		[0x200]      = "LNK_INFO",
		[0x800]      = "LNK_REMOVE",
		[0x1000]     = "LNK_COMDAT",
		[0x8000]     = "GPREL",
		[0x20000]    = "MEM_16BIT",
		[0x40000]    = "MEM_LOCKED",
		[0x80000]    = "MEM_PRELOAD",
		[0x100000]   = "ALIGN_1BYTES",
		[0x200000]   = "ALIGN_2BYTES",
		[0x300000]   = "ALIGN_4BYTES",
		[0x400000]   = "ALIGN_8BYTES",
		[0x500000]   = "ALIGN_16BYTES",
		[0x600000]   = "ALIGN_32BYTES",
		[0x700000]   = "ALIGN_64BYTES",
		[0x800000]   = "ALIGN_128BYTES",
		[0x900000]   = "ALIGN_256BYTES",
		[0xa00000]   = "ALIGN_512BYTES",
		[0xb00000]   = "ALIGN_1024BYTES",
		[0xc00000]   = "ALIGN_2048BYTES",
		[0xd00000]   = "ALIGN_4096BYTES",
		[0xe00000]   = "ALIGN_8192BYTES",
		[0x1000000]  = "LNK_NRELOC_OVFL",
		[0x2000000]  = "MEM_DISCARDABLE",
		[0x4000000]  = "MEM_NOT_CACHED",
		[0x8000000]  = "MEM_NOT_PAGED",
		[0x10000000] = "MEM_SHARED",
		[0x20000000] = "MEM_EXECUTE",
		[0x40000000] = "MEM_READ",
		[0x80000000] = "MEM_WRITE"
	} &default=function(i: count):string { return fmt("unknown-%d", i); };

	const os_versions: table[count, count] of string = {
		[6,2]  = "Windows 8",
		[6,1]  = "Windows 7",
		[6,0]  = "Windows Vista",
		[5,2]  = "Windows XP 64-Bit Edition",
		[5,1]  = "Windows XP",
		[5,0]  = "Windows 2000",
		[4,90] = "Windows Me",
		[4,1]  = "Windows 98",
		[4,0]  = "Windows NT 4.0",
	} &default=function(i: count, j: count):string { return fmt("unknown-%d.%d", i, j); };

	const section_descs: table[string] of string = {
		[".bss"]      = "Uninitialized data",
		[".cormeta"]  = "CLR metadata that indicates that the object file contains managed code",
		[".data"]     = "Initialized data",
		[".debug$F"]  = "Generated FPO debug information",
		[".debug$P"]  = "Precompiled debug types",
		[".debug$S"]  = "Debug symbols",
		[".debug$T"]  = "Debug types",
		[".drective"] = "Linker options",
		[".edata"]    = "Export tables",
		[".idata"]    = "Import tables",
		[".idlsym"]   = "Includes registered SEH to support IDL attributes",
		[".pdata"]    = "Exception information",
		[".rdata"]    = "Read-only initialized data",
		[".reloc"]    = "Image relocations",
		[".rsrc"]     = "Resource directory",
		[".sbss"]     = "GP-relative uninitialized data",
		[".sdata"]    = "GP-relative initialized data",
		[".srdata"]   = "GP-relative read-only data",
		[".sxdata"]   = "Registered exception handler data",
		[".text"]     = "Executable code",
		[".tls"]      = "Thread-local storage",
		[".tls$"]     = "Thread-local storage",
		[".vsdata"]   = "GP-relative initialized data",
		[".xdata"]    = "Exception information",
	} &default=function(i: string):string { return fmt("unknown-%s", i); };

}
