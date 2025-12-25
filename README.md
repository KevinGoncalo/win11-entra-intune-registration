# Windows 11 Entra ID & Intune Registration – Portfolio Version

## Overview
This project demonstrates post-install Windows 11 device registration into Microsoft Entra ID and Intune without domain join or device wipe. It mirrors real-world cloud-first onboarding scenarios used in SMB and enterprise environments where devices arrive preinstalled and must be secured, standardized, and managed via MDM.

I chose registration as opposed to join because in my current role we receive new devices with Windows 11 pre-installed and a local admin account. I'm aware that at scale in an enterprise environment it would be more common to join devices as opposed to register. However, this scenario also simulates registering an employee device in a BYOD situation. 

The purpose of this project is to offer proof of my understanding of cloud-first identity work flows. As well as demonstrating my ability to thoroughly and accurately document technical procedures. 

---

## 1. VM Provisioning

**Screenshot 1:** 
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/vm-system-info.png" alt="vm system info">

**Screenshot 2:** 
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/vm-accounts-your-info.png" alt="vm accounts your info">

*Fresh Windows 11 VM created in Hyper-V, ready for post-install registration.*

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

*During Entra ID registered device enrollment, Intune MDM discovery failed. Root cause was identified as Windows Information Protection (WIP) user scope enforcement prior to device trust establishment, combined with incomplete IPv6 connectivity in the VM. Resolution required setting WIP scope to "None" and disabling IPv6 to restore successful MDM discovery and enrollment.*

**Screenshot 6:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/intune-device-registered.png" alt="intune device registered">

*Device connected to Intune. Baseline configuration policies and app deployments are now manageable, even though the device is registered rather than fully joined.*

---

## 4. Policy & Compliance

**Screenshot 7:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/compliance-policy.png" alt="compliance policy">

*Enforcement of baseline security policies via Intune (e.g., password requirements for demonstration purposes).*

**Screenshot 8:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/entra-join-machine-compliant.png" alt="entra join machine compliant">

*Device is compliant.*

**Screenshot 9:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/conditional-access.png" alt="conditional access">

*Shows how non-compliant devices are restricted from corporate resources ("All resources" in this case), demonstrating Conditional Access awareness.*

---

## 5. App Deployment & Configuration

**Screenshot 10:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/apps-assigned.png" alt="apps assigned">

**Screenshot 11:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/installed-apps.png" alt="installed apps">

*Application automatically installed via Intune upon registration, demonstrating managed software deployment.*

**Screenshot 12:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/usb-restricted-intune.png" alt="usb restricted intune">

**Screenshot 13:**
<img src="https://raw.githubusercontent.com/KevinGoncalo/win11-entra-intune-enrollment/main/screenshots/usb-restricted-device.png" alt="usb restricted device">

*Configuration profiles applied (USB restrictions), highlighting standardized endpoint management.*

---

## Notes

- PowerShell was used to create the Entra ID user, demonstrating automation skills.  
- Out of Scope: Windows Autopilot, Hybrid AD Join, SCCM/ConfigMgr.  
- This project focuses on **post-install device registration**, which allows cloud integration and Intune management without a full device join.  
- **Note:** Full enrollment (join) provides stronger management and compliance enforcement; registration is used here to demonstrate post-install cloud integration and device identity awareness.
