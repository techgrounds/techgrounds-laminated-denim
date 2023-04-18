# Identity and Access Management
Identity and access management refer to the authentication and authorisation of users on devices and networks.  Authentication is the process of verifying a user's identity. Authorisation is the process of granting them the required permissions.

#Cybersecurity

## Key-terms
#### Authentication
Authentication is the process of determining who a user is. This is done through checking their credentials. For example, by asking for a password or having them scan a code on a previously authenticated device or service.

#### Authorisation
Once a user's identity has been determined and they have logged in, the authorisation process decides what functions they have access to. This is done through policies and permissions. These permissions are typically granted through Access Tokens (see below.)

#### Access Tokens
Access tokens are a digital credential that notify an application or API that the token owner has authorisation to act in certain ways. For example, allowing a logged-in user on a website to access their profile settings page and make changes there; or allowing an administrator on the same website access to an administrative panel.

#### OIDC
A protocol used to authenticate and verify a user's identity via method of JSON web tokens (see Access Tokens above.) It is built on the OAuth 2.0 framework, an authorisation framework that lays out rules for authorisation.

#### Multi-factor authentication
MFA is a method of authentication that requires a user to provide more than one form of verification. As an example, a website might require a password and a code they receive via SMS on their phone. This greatly increases the security of the authentication process, since there is no longer a single point of failure; a bad actor would require not just the password, but also the device or service used for MFA.

The three factors for MFA are:
##### Knowledge factor
This involves a user authenticating by revealing secret information, such as a password or PIN code. This is a secure method so long as the information remains private. Brute-forcing a password, social engineering or OSINT are possible weaknesses.

##### Possession factor
This involves a user authenticating by ownership of a unique item. This could be a mobile phone, a display card, or an e-mail account. If this item is stolen or lost, the account could be compromised.

##### Inherence factor
This involves authenticating a user by factors inherent to them. Fingerprint or retina scans and voice or facial recognition are examples of this authentication method. This information needs to be stored and secured by the organisation authenticating the user.

#### Principle of least privilege
The principle of least privilege indicates that each entity or user should be assigned the minimum authorisation they require to function. For example, allowing employees at a company access to their workstations and peripherals but preventing them from accessing database servers.

## Opdracht
### Gebruikte bronnen
[Authentication vs. Authorisation](https://auth0.com/docs/get-started/identity-fundamentals/authentication-and-authorization)  
[Principle of least privilege](https://csrc.nist.gov/glossary/term/least_privilege)  
[MFA](https://aws.amazon.com/what-is/mfa)  
[OIDC](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol)  
[Access Tokens](https://auth0.com/docs/glossary?term=access-token)

### Ervaren problemen
The assignment was entirely theoretical. I experienced no problems.

### Resultaat
I read about the required subjects and built an understanding of their purpose.
