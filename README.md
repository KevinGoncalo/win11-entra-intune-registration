# Windows 11 Post Install Device Registration with Microsoft Entra ID & Intune

## Overview
This project demonstrates post install Windows 11 device registration into Microsoft Entra ID and Intune without domain join or device wipe. It mirrors real-world cloud-first onboarding scenarios where devices arrive with Windows 11 preinstalled and are initially configured with a local admin account.

I chose device registration instead of full join because this reflects how devices are handled in my current role and in common BYOD scenarios. While full Entra ID join is more common at enterprise scale, registration is still used when devices need cloud identity and Intune management without reimaging.

The purpose of this project is to demonstrate my understanding of cloud first identity workflows and my ability to accurately document technical procedures.

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

*During testing, Intune MDM discovery initially failed. Root cause was identified as Windows Information Protection (WIP) user scope enforcement prior to device trust establishment, combined with incomplete IPv6 connectivity in the VM. Resolution required setting WIP scope to "None" and disabling IPv6 to restore successful MDM discovery and enrollment.*

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

*Shows how non-compliant devices are restricted from corporate resources ("All resources" in this case), demonstrating Conditional Access enforcement.*

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

- PowerShell was used to create the Entra ID user, demonstrating programmatic cloud user provisioning.

- Scope intentionally excludes Windows Autopilot, Hybrid Entra ID Join, and SCCM/ConfigMgr.

- This project focuses specifically on post-install device registration to demonstrate cloud identity integration and Intune management without full device join or reimaging.
