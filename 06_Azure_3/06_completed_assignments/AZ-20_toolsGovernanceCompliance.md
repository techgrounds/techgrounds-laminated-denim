# Azure features and tools for governance and compliance
These features and tools allow for high and low level management of Azure resources.

## Key-terms
#### Azure Blueprints
Azure Blueprints allows for the standardisation of subscription or environment deployments. This allows one to define settings and policies that are applied as new subscriptions are created. Each component in a blueprint definition is called an artifact. Artifacts can contain parameters for configuration, but do not require them. Artifacts include:
* Role assignments
* Policy assignments
* Azure Resource Manager templates
* Resource groups

Blueprints are version-able. Azure creates a record that associates resources with the blueprints that define them, which is useful for tracking and auditing deployments. Blueprints can override subscription owner access controls; the resources they create can be toggled to be read-only, do-not-delete or don't lock at the ARM level.

#### Azure Policy
Azure Policy is a service for the creation, assignment and management of policies that control or audit resources. These policies different rules across resource configurations so that they comply with a company's standards. *Initiatives* are groups of related policies. Azure Policies can be set on each level of a hierarchy, from resources to management groups. They are inherited. Azure Policy is capable of automatically adjusting noncompliant resources and configurations to match the policy definition. Resources can be flagged as an exception to this automatic adjustment.

#### Resource locks
Resource locks prevent resources from being deleted or changed by accident. They can be applied to anything from a resource to a subscription, and are inherited. There are two types of resource locks:
* **Delete:** authorised users can modify and read a resource but not delete it.
* **ReadOnly:** Authorised users can only read a resource, but not delete or change it.
Even as resource owner, the lock needs to be removed before executing the blocked action.

#### Service Trust portal
The Microsoft Service Trust Portal allows access to content, tools and information about MS security, privacy and compliance practices.

#### Agreements
* **Microsoft Privacy Statement:** Contains information about what kind of information MS collects about customers.
* **Online Services Terms (OST):** Key online services agreement.
* **Data Protection Amendment (DPA):** Information about how MS stores and processes data.

## Opdracht
### Gebruikte bronnen
[Describe features and tools in Azure for governance and compliance](https://learn.microsoft.com/en-us/training/modules/describe-features-tools-azure-for-governance-compliance/) 
