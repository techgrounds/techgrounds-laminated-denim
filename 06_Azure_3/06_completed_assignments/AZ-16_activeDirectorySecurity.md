# Azure Active Directory and Security options
Azure Active Directory is an identity and access management platform with many different features. It can interface with on-premises Active Directory via AD Connect, for example. Azure also features many other security features and concepts, listed under key-terms below.

#Azure/AZ-900 #Azure/Services #Cybersecurity #Azure/Management #Azure/SC-900
## Key-terms

#### Microsoft Entra
Microsoft Entra is a suite containing multiple identity services, such as Azure Active Directory. Features include Azure AD, Verified ID and permissions management.

#### Azure Active Directory
Azure Active Directory is a centralised identity and access management platform. It can interface with other Azure services, Office 365, 3rd party SaaS solutions and even custom apps. In this way, it acts as an identity provider and gives end-users a single-sign on (SSO): one account and password for multiple applications.

Azure AD supports self-service password resets, MFA, a banned password list and smart lockout services. It also support device registration through tools like MS InTune, offering device-based conditional access policies. It can be connected to an on-premises Active Directory through Azure AD Connect. Identity Secure Score is an Azure AD feature that represents an organisation's security posture.

##### Azure Active Directory Domain Services
Azure AD DS offers managed domain services such as domain join, group policies, LDAP, and Kerberos or NLTM authentication. This allows one to use applications that do not support modern authentication protocols in the cloud. Azure AD DS integrates with Azure AD, allowing users to access resources tied to AD DS with their SSO.

![ss1](../../00_includes/AZ-16_screenshot1.png)

##### [Azure AD licenses](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis)
Azure Active Directory features four different payment options:
* **Free:** which is available to anyone with a subscription to any MS Online business service. Ancilliary functions are available to those with a subscription to a number of Office 365 offerings. The free subscription supports 50 000 objects or users.
* **Premium P1:** This allows users to access on-prem and cloud resources. It also supports dynamic groups, self-service group management, Microsoft Identity Manager, and self-service password reset.
* **Premium P2:** In addition to the above, P2 offers Azure Active Directory Identity Protection. This provides Conditional Access and Privileged Identity Management.
* **Pay as you go:** This allows one to purchase licenses for specific features, such as Azure AD B2C.

#### Passwordless Authentication options
Azure and Azure Government features three passwordless authentication options that integrate with Azure AD:

* **Windows Hello for Business:** This ties biometric and PIN credentials directly to a user's PC.
* **MS Authenticator:** This uses an employee's phone as a "something you have" authentication tool, combined with PIN or biometric data.
* **FIDO2 security keys:** Fast IDentity Online is an open standard for passwordless authentication. Typically, sign-in involves something such as a USB device, Bluetooth or NFC communication.

##### External Identities
External identities are people, devices or services outside one's organisation. Azure AD External Identities allows for secure interaction with external identities by allowing them to use their own, external credentials such as a Google account to sign in. External Identities has three features:
* **Business to business (B2B) collaboration:** This allows external users to sign in to one's applications with an external identity. Collaborators are typically represented as guest users in the directory.
* **B2B Direct Connect:** This establishes mutual trust with another organisation's Azure AD. This supports Teams shared channels. Direct connect users aren't represented in the directory but are visible from within a Teams shared channel.
* **Azure AD business to customer (B2C):** This allows for the publishing of SaaS or other apps to consumers and customers, with Azure AD B2C used for authentication and authorisation.

##### Azure Conditional Access
Conditional access is an Azure AD tool for authorisation based on identity signals, such as who the user is, where they are and what device they are using. This allows for more granular control. MFA might be requested if the user is signing on from an unfamiliar location, or access rights may be limited if they are on a foreign device.

##### Privileged Identity Management
PIM is a feature of the Azure AD Premium P2 license. It allows for time-based and approval-based role activation. Key features include:
* Just-in-time privileged access to Azure AD and Azure resources.
* Assigning time-bound access to resources that include start and end dates.
* Requiring approval to activate privileged roles.
* Enforcing the use of MFA to activate any role.
* Access reviews.
* Audit histories.

#### Role Based Access Control
RBAC offers access control for actions that pass through the Azure Resource Manager: through the Azure portal, Cloud Shell, PowerShell and Azure CLI. It does not affect authorisation on the application or data level. It does this by using scope and role. A role given read access on the subscription scope will have read access for all child scopes, such as associated resource groups and resources.

![ss2](../../00_includes/AZ-16_screenshot2.png)

#### Zero Trust Model
The Zero Trust model is a security model that assumes a worst case scenario. It requires authentication from everyone accessing the network and grants access based on that authentication, rather than the legacy model of trusting everyone connected to the corporate network. These are the guiding principles:
* **Verify explicitly:** Authenticate and authorise based on all available data points, such as user identity, location, device and any anomalies.
* **Use least privilege access:** Limit user access with Just-In-Time (JIT) and Just-Enough-Access (JEA), data protection and adaptive policies based on risk.
* **Assume breach:** This involves the verification of end-to-end encryption, analytics to gain visibility on threats, and the segmentation of access.

#### Defence-in-depth
Defence-in-depth refers to the layering of security.

* The physical security layer, which might include unauthorised personnel attempting access to a real-world facility.
* The policies and access layer, where authentication and authorisation for users occurs.
* The perimeter layer, which should use DDoS protection and firewalls.
* The networking layer, where communication between resources should be limited, and inbound and outbound internet access should be limited where appropriate.
* The VM/Compute layer, in which it is important to keep systems patched and secure access to machines.
* The application layer, where it is important to keep applications free of vulnerabilities and store application secrets in a secure medium.
* The data layer, where the use of strong encryption and the proper storage of encryption keys is important.
![ss3](../../00_includes/AZ-16_screenshot3.png)

#### [Microsoft Defender for Cloud](https://learn.microsoft.com/en-us/training/modules/intro-to-defender-cloud/)
MS Defender for Cloud is software that secures hybrid cloud environments. It uses a Secure Score to provide recommendations on how to improve security posture. It supports visibility over compliance with regulations. Its central use is protecting workloads in Azure. Defender for Cloud has many different integrated plans, with examples including:
* **Defender for Servers:** Threat detection and defence for Windows and Linux machines no matter their environment.
* **Defender for Storage:** Detection for unusual or harmful attempts to access storage accounts.
* **Defender for DNS:** Detection for suspicious activity such as data exfiltration, malware, DNS attacks and communication with suspicious domains.
* **Defender for Key Vault:** Detection for strange attempts to access or exploit Key Vault data.

##### MS Defender Key terms
* **SOC:** Security Operations Center. The part of an organisation that deals with security issues.
* **Secure Score:** A Secure Score is a percentage-based KPI (key performance indicator) which contains several measures and recommendations.
* **Cloud Security Posture Management:** CSPM is a system with which organisations can identify and fix misconfigurations, threats, misuse and compliance violations.
* **Cloud Workload Protection:** CWP is the process by which cloud workloads are kept secure.
* **Security Posture:** This is the combination of one's visibility over the asset environment and attack surface, alongside one's ability to detect, contain, mitigate, protect and react to security threats.

#### [MS Defender for Identity](https://learn.microsoft.com/en-us/defender-for-identity/what-is) 
([Intro to MS Defender for Identity](https://learn.microsoft.com/en-us/training/modules/defender-identity-introduction/introduction))  
MS Defender for Identity, formerly known as Azure Advanced Threat Protection or ATP, is a cloud-based security service that uses signals from an on-prem Active Directory to detect threats. This makes it useful for hybrid environments. It can:
* Monitor user and entity activity with AI analytics.
* Protect user identities stored in Active Directory, for example by identifying lateral movement paths.
* Detect and protect against attacks aimed at the on-prem components of Active Directory Federation Services (AD FS.)

##### Lateral movement paths
Lateral movement paths refers to the concept of an attacker gaining access to a less-secured device with less authorisation privileges, and using that device to later gain access to penetrate more deeply. For example, by gaining an administrator's credentials if that admin ever logs in using the compromised device.

#### [MS Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/overview)
Microsoft Sentinel is a scalable cloud platform that provides security information and event management (SIEM) alongside security orchestration, automation, and response (SOAR.) In essence, the detection and automated response to security incidents. Sentinel can take data from security logs and signals, apply tools from Azure Monitor such as Log Analytics, and create actionable information from these sources.

## Opdracht
##### Assignment:
* Create a tenant in Azure Active Directory
* Create a user
* Assign a role to the user
* Delete the user
* Delete the directory

### Gebruikte bronnen
[Describe Azure Identity and Access Security](https://learn.microsoft.com/en-us/training/modules/describe-azure-identity-access-security/)  
[Quickstart: Create a new tenant in Azure AD](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant)  

### Ervaren problemen
None.

### Resultaat
By following a tutorial in the documentation, I was able to create a tenant in Azure Active Directory. Cursory examination allowed me to create a user and assign a role to the user.  
![ss3](AZ-16_screenshot4.png)  
Deleting the user was similarly easy to execute. Deletion of the directory was possible from the overview page where I could view all tenants, accessible through my profile.