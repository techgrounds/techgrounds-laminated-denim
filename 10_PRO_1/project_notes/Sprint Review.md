Maandag sprint review.

1. Discuss your planning. 
2. Showcase a demo. 
3. Discuss what parts of your planning you failed to complete.


Hoi goedemorgen, ik ga vandaag vertellen over mijn progressie met het project.

Om te beginnen heb ik een lijst gemaakt van leer doelen. Dingen zoals Bicep en scrum terminologie zodat ik het project beter kon indelen. Daarna heb ik een dagindeling gemaakt voor de eerste sprint, met taken los verdeelt over de eerste twee weken.

Mijn initiele focus was om een goed overzicht te creeeren voor mijzelf en daarna om de basics van Bicep te leren. In week 2 was ik van plan om te beginnen met het bouwen van de infrastructuur voor het project.

Ik zal nu een korte demo tonen van mijn werkende code, die wat networking en storage resources online brengt.

....

Om het makkelijk te houden heb ik gekozen voor de creatie van een resourcegroup via Powershell. Gezien Bicep scripting-vriendelijk is, geeft dit veel extra flexibiliteit. Door te kiezen voor een specifieke regio met de resource group is het mogelijk om alle andere resources in diezelfde locatie aan te maken.

Terwijl we wachten voor de Azure Portal, zal ik kort vertellen over de mismatch tussen mijn planning en de werkelijke output.

In de eerste week was ik een paar dagen ziek, en ik ben sinsdien achtergevallen op mijn planning. Daarboven duurde het leren van Bicep langer dan verwacht. In plaats van het bouwen van alle componenten ben ik dus vooral bezig geweest met het leren van Bicep. Wel is het me gelukt om networking componenten en een storage account te bouwen en heb ik een begin gemaakt aan een keyvault en onderzoek voor de servers.


```
New-AzResourceGroup -Name testRG -Location westeurope
New-AzResourceGroupDeployment -ResourceGroupName testRG -TemplateFile main.bicep
```
