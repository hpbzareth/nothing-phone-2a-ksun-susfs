# Nothing Phone (2a) Kernel 5.15 with KernelSU-Next & SuSFS 2.x

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/hpbzareth/nothing-phone-2a-ksun-susfs/build-kernel.yml?branch=main&style=for-the-badge)
![Device](https://img.shields.io/badge/Device-Nothing%20Phone%20(2a)-black?style=for-the-badge&logo=nothing)
![SoC](https://img.shields.io/badge/SoC-MediaTek%20MT6886%20(Dimensity%207200)-blue?style=for-the-badge)
![Kernel](https://img.shields.io/badge/Kernel-5.15%20GKI-green?style=for-the-badge)
![KernelSU-Next](https://img.shields.io/badge/Root-KernelSU--Next%20(uapi%20v5)-orange?style=for-the-badge)
![SuSFS](https://img.shields.io/badge/Stealth-SuSFS%202.x-red?style=for-the-badge)

Automated GitHub Actions builder for Nothing Phone (2a) (`Pacman` / MT6886) Android Kernel 5.15 based on the official NothingOSS source code:
`https://github.com/NothingOSS/android_kernel_5.15_nothing_mt6886`

---

## 📱 Device Specifications

| Parameter | Value |
|---|---|
| **Device Model** | Nothing Phone (2a) / Nothing Phone (2a) Plus |
| **Codename** | `Pacman` / `PacmanPro` / `Aerodactyl` |
| **SoC** | MediaTek Dimensity 7200 Pro (MT6886) |
| **CPU Architecture** | ARM64 (ARMv9-A) |
| **Kernel Version** | Linux 5.15 (`android13-5.15` GKI architecture) |
| **Compiler** | Google AOSP Prebuilt Clang `r450784e` (`LLVM=1 LLVM_IAS=1`) |

---

## ✨ Features

- **Official Nothing Kernel Tree:** Synchronized with `NothingOSS/android_kernel_5.15_nothing_mt6886` (`mt6886/Pacman/16b` Nothing OS 4.1 / `mt6886/Pacman/v` / `mt6886/Pacman/t`).
- **KernelSU-Next (UAPI v5):** Modern root framework with UAPI v5 support (`v3.4.2` / `v3.4.1`), high stability, and modular extension.
- **SuSFS 2.x Integration:** Comprehensive stealth root hiding:
  - Hides suspicious mount points (`/proc/self/mounts`, `mountinfo`, `mountstat`)
  - Spoofs `/proc/self/maps` and `/proc/self/stat` (kstat spoofing)
  - Hides KernelSU and SuSFS symbols from `/proc/kallsyms`
  - Spoofs `uname` and `bootconfig` / `cmdline`
  - `open_redirect` support
- **Stealth Hooking:** Default **Direct Inline Hook** (VFS & Syscall hook via SuSFS kernel patches) without using kprobes or exposed tracepoints, making detection virtually impossible.
- **AnyKernel3 Flashable ZIP:** Packaged automatically with device checks and GKI boot partition flashing scripts.

---

## 🚀 How to Build (GitHub Actions)

1. Fork this repository or go to the **[Actions](../../actions)** tab in your repository.
2. Select **"Build Nothing Phone (2a) Kernel with KernelSU-Next & SuSFS"** from the left sidebar.
3. Click **"Run workflow"** and customize parameters if desired:
   - **NothingOSS Kernel Branch:** Select `mt6886/Pacman/16b` (latest) or `mt6886/Pacman/v`.
   - **KernelSU-Next Version:** `v3.4.2` (UAPI v5) or commit SHA.
   - **Enable SuSFS:** `true` (checked).
   - **Hook Method:** `inline` (recommended) or `tracepoint`.
   - **Clang Version:** `r450784e` (recommended official compiler).
   - **Publish Release:** Checked (will create a GitHub Release with download links).
4. Wait for the compilation to finish (approximately 15–25 minutes).
5. Download your artifacts from the **Releases** or the job's **Artifacts** section!

---

## 📦 Output Artifacts

The build produces:
- `AnyKernel3-Nothing-Phone-2a-Pacman-KSUN-SuSFS-*.zip`: Flashable ZIP file.
- `Image` / `Image.lz4` / `Image.gz`: Raw kernel binaries.
- `kernel_config.txt`: Kernel `.config` file for auditing.
- `sha256sums.txt`: Integrity verification hashes.

---

## ⚡ Flashing Guide

> [!WARNING]
> Always backup your original `boot.img` or `init_boot.img` before flashing!
> Unlocking the bootloader will wipe your device data.

### Option 1: Via Kernel Flasher (Recommended & Easiest)
1. Install [Kernel Flasher](https://github.com/capntrips/KernelFlasher) APK on your phone.
2. Grant Root access (or temporary Magisk/KSU).
3. Tap **"Flash"**, select `AnyKernel3-Nothing-Phone-2a-Pacman-KSUN-SuSFS-*.zip` (or `Image.lz4`).
4. Flash to the `boot` slot and reboot!

### Option 2: Via Custom Recovery (TWRP / OrangeFox)
1. Boot into TWRP or OrangeFox recovery.
2. Flash `AnyKernel3-Nothing-Phone-2a-Pacman-KSUN-SuSFS-*.zip`.
3. Reboot to System.

### Option 3: Via Fastboot (GKI boot.img)
If repacking your stock `boot.img` with `magiskboot`:
```bash
# Unpack stock boot.img
./magiskboot unpack boot.img

# Replace kernel
cp Image.lz4 kernel

# Repack
./magiskboot repack boot.img new-boot.img

# Flash via fastboot
adb reboot bootloader
fastboot flash boot new-boot.img
fastboot reboot
```

---

## 📱 Manager Applications

- **KernelSU-Next Manager:** Download from [KernelSU-Next Releases](https://github.com/KernelSU-Next/KernelSU-Next/releases).
- **SuSFS Manager / Module:** Install the companion module from [sidex15/susfs4ksu-module](https://github.com/sidex15/susfs4ksu-module).

---

## 🤝 Credits & Acknowledgements

- [NothingOSS](https://github.com/NothingOSS) for Nothing Phone (2a) kernel source
- [KernelSU-Next](https://github.com/KernelSU-Next/KernelSU-Next) by rifsxd and contributors
- [simonpunk](https://gitlab.com/simonpunk/susfs4ksu) & [Zhanfg](https://github.com/Zhanfg/susfs4ksu) for SuSFS
- [osm0sis](https://github.com/osm0sis/AnyKernel3) for AnyKernel3
- [AOSP / Google](https://android.googlesource.com/) for Android Clang prebuilts & GKI
