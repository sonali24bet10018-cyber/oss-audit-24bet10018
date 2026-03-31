# The Open Source Audit: VLC Media Player

## 1. Cover Page
- **Project Title:** The Open Source Audit
- **Name:** Sonali Tripathy
- **Registration Number:** 24BET10018
- **Slot:** D11
- **Date:** 31/03/2026
- **Selected Software:** VLC Media Player
- **Course:** Open Source Software (VITyarthi)

---

## 2. Part A: Origin and Philosophy
### A1: The Problem VLC Solved
- **The 1996 landscape:** Network video streaming was proprietary and closed off.
- **The origin:** Students at École Centrale Paris needed to broadcast live TV over their campus network (VIA Centrale Réseaux).
- **The bottleneck:** Tools like Windows Media Player wouldn't let them tweak the code to fit their needs. They had to build their own client and server.
- **Going open source:** In 2001, they released it under GPL. This changed everything—volunteers from outside the university ported it to Windows almost immediately.
- **The human element:** Jean-Baptiste Kempf taking over, saving the project from university red tape, and the funny story behind the traffic cone logo.

### A2: Breaking Down the License
- **The dual-license strategy:** The main VLC app is GPL v2, but the core engine (libVLC) is LGPL v2. This lets proprietary apps use the engine without going fully open source, which was needed for App Store compatibility.
- **The Four Freedoms:** Matching VLC's features to the FSF's four freedoms (running, studying, distributing, and modifying).
- **GPL vs MIT:** My thoughts on copyleft (forcing future versions to stay open) versus permissive licenses.
- **"Free beer vs free speech":** Comparing VLC (free in price and freedom) to Windows Media Player (free in price, closed in freedom).

### A3: Ethics of Open Source
- **The big debate:** Should all software be open source? I'll argue about security through transparency, but acknowledge the funding issues.
- **Corporate use of FOSS:** Looking at how massive companies profit off volunteer code. I'll use VideoLabs as an example of a sustainable, non-exploitative model.
- **Standing on the shoulders of giants:** How VLC relies heavily on other open-source projects like FFmpeg and x264.

---

## 3. Part B: Linux Footprint
- **Installation:** How to get it via apt, dnf, Flatpak, Snap, or compiling from source.
- **Directory structure:** Documenting where the specific binaries (`/usr/bin/vlc`), plugins, and config files (`~/.config/vlc`) actually live on my system.
- **Security architecture:** Explaining why it's a good thing that VLC runs as a standard user rather than as root, minimizing the danger of malicious video files.
- **Service management:** Running VLC headlessly as a streaming server without systemd.
- **Updates:** How patches are distributed transparently by repo maintainers rather than a closed corporate server.

---

## 4. Part C: The FOSS Ecosystem
- **Core dependencies:** The critical libraries VLC needs (FFmpeg, libdvdcss, dav1d).
- **Downstream impact:** Other projects that rely on VLC code, like HandBrake and Phonon.
- **Network stack:** How VLC integrates with web protocols (HTTP, HLS) and servers like Apache.
- **Project governance:** VideoLAN's structure as a French non-profit, how developers communicate (IRC, GitLab), and its democratic nature compared to corporate projects.

---

## 5. Part D: Open Source vs Proprietary
- **Comparison:** A head-to-head table comparing VLC against Windows Media Player on cost, security, format support, and community control.
- **Final Verdict:** My personal recommendation on whether I'd use VLC in an enterprise setting, and whether I think I could realistically contribute to the project.

---

## 6. Conclusion
- Summary of what surprised me about VLC's history and its massive cultural impact.
- How digging into the Linux filesystem gave me a hands-on understanding of open-source structure.
- Final thoughts on the sustainability of community-driven software.

---

## 7. References
- VideoLAN wiki, FSF/OSI definitions, SPDX license texts, "The Cathedral and the Bazaar," and Linux man pages.
