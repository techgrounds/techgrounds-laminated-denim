# [Onderwerp]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
#### Azure Active Directory
Azure Active Directory is a centralised identity and access management platform. It can interface with other Azure services, Office 365, 3rd party SaaS solutions and even custom apps. In this way, it acts as an identity provider and gives end-users a single-sign on (SSO): one account and password for multiple applications.

Azure AD supports self-service password resets, MFA, a banned password list and smart lockout services. It also support device registration through tools like MS InTune, offering device-based conditional access policies. It can be connected to an on-premises Active Directory through Azure AD Connect.

##### Azure Active Directory Domain Services
Azure AD DS offers managed domain services such as domain join, group policies, LDAP, and Kerberos or NLTM authentication. This allows one to use applications that do not support modern authentication protocols in the cloud. Azure AD DS integrates with Azure AD, allowing users to access resources tied to AD DS with their SSO.

![ss1](../../00_includes/AZ-16_screenshot1.png)

#### Passwordless Authentication options
Azure and Azure Government features three passwordless authentication options that integrate with Azure AD:

* **Windows Hello for Business:** This ties biometric and PIN credentials directly to a user's PC.
* **MS Authenticator:** This uses an employee's phone as a "something you have" authentication tool, combined with PIn or biometric data.
* **FIDO2 security keys:** Fast IDentity Online is an open standard for passwordless authentication. Typically, sign-in involves something such as a USB device, Bluetooth or NFC communication.

##### External Identities
External identities are people, devices or services outside one's organisation. Azure AD External Identities allows for secure interaction with external identities by allowing them to use their own, external credentials such as a Google account to sign in. External Identities has three features:
* **Business to business (B2B) collaboration:** This allows external users to sign in to one's applications with an external identity. Collaborators are typically represented as guest users in the directory.
* **B2B Direct Connect:** This establishes mutual trust with another organisation's Azure AD. This supports Teams shared channels. Direct connect users aren't represented in the directory but are visible from within a Teams shared channel.
* **Azure AD business to customer (B2C):** This allows for the publishing of SaaS or other apps to consumers and customers, with Azure AD B2C used for authentication and authorisation.

##### Azure Conditional Access
Conditional access is an Azure AD tool for authorisation based on identity signals, such as who the user is, where they are and what device they are using. This allows for more granular control. MFA might be requested if the user is signing on from an unfamiliar location, or access rights may be limited if they are on a foreign device.

#### Role Based Access Control
RBAC offers access control for actions that pass through the Azure Resource Manager: through the Azure portal, Cloud Shell, PowerShell and Azure CLI. It does not affect authorisation on the application or data level. It does this by using scope and role. A role given read access on the subscription scope will have read access for all child scopes, such as associated resource groups and resources.

![ss2](../../00_includes/AZ-16_screenshot2.png)

#### Zero Trust Model
The Zero Trust model is a security model that assumes a worst case scenario. It requires authentication from everyone accessing the network and grants access based on that authentication, rather than the legacy model of trusting everyone connected to the corporate network. These are the guiding principles:
* **Verify explicitly:** Authenticate and authorise based on all available data points.
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

#### Microsoft Defender for Cloud


#### Azure Arc

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
