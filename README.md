# Windows 11 Entra ID & Intune Registration – Portfolio Version

## Overview
This project demonstrates registering a freshly installed Windows 11 device with Microsoft Entra ID and Intune, applying baseline configuration policies, deploying apps, and validating compliance. The focus is on **post-install registration**, showing how an unmanaged device can be connected to the cloud without performing a full wipe or join.

---

## 1. VM Provisioning

**Screenshot 1:** 
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/vm-system-info.png" alt="vm system info">

**Screenshot 2:** 
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/vm-accounts-your-info.png" alt="vm accounts your info">

*Fresh Windows 11 VM created in Hyper-V, ready for post-install registration. See [Initial State](docs/initial-state.md) for VM setup and configuration details.*

---

## 2. User Creation (Entra ID)

**Screenshot 3:**  
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/entra-user-created.png" alt="Entra ID user created">

*Entra ID user created via PowerShell using the script in [scripts/create-user.ps1](scripts/create-user.ps1)
. Demonstrates ability to provision cloud users programmatically and prepare them for device registration.*

---

## 3. Device Registration

**Screenshot 4:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/access-work-school-registered.png" alt="access work school registered">

**Screenshot 5:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/entra-device-registered.png" alt="entra device registered">

*VM successfully registered with Entra ID post-install. Demonstrates understanding of device identity management in a cloud environment.*

*During Entra ID–registered device enrollment, Intune MDM discovery failed. Root cause analysis identified Windows Information Protection (WIP) user scope enforcement prior to device trust establishment, combined with incomplete IPv6 connectivity in the VM. Resolution required setting WIP scope to None and disabling IPv6 to restore successful MDM discovery and enrollment.*

**Screenshot 6:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/intune-device-registered.png" alt="intune device registered">

*Device connected to Intune. Baseline configuration policies and app deployments are now manageable, even though the device is registered rather than fully joined.*

---

## 4. Policy & Compliance

**Screenshot 5:** `screenshots/compliance_policy.png`  
*Enforcement of baseline security policies via Intune (e.g., password requirements, BitLocker). Device is compliant with corporate standards.*

**Screenshot 6 (optional):** `screenshots/noncompliant.png`  
*Shows how non-compliant devices are restricted from corporate resources, demonstrating Conditional Access awareness.*

---

## 5. App Deployment & Configuration

**Screenshot 7:** `screenshots/app_deployed.png`  
*Application automatically installed via Intune upon registration, demonstrating managed software deployment.*

**Screenshot 8 (optional):** `screenshots/config_profile.png`  
*Configuration profiles applied (e.g., Wi-Fi or USB restrictions), highlighting standardized endpoint management.*

---

## Notes

- PowerShell was used to create the Entra ID user, demonstrating automation skills.  
- Out of Scope: Windows Autopilot, Hybrid AD Join, SCCM/ConfigMgr.  
- This project focuses on **post-install device registration**, which allows cloud integration and Intune management without a full device join.  
- **Note:** Full enrollment (join) provides stronger management and compliance enforcement; registration is used here to demonstrate post-install cloud integration and device identity awareness.
