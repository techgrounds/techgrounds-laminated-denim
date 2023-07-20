
Deploy beforehand. Open:
* Github on 01 planning.
* Github on documentation.
* Drawio on infrastructure diagram
* Azure Portal on relevant resource group.
* Azure Portal on visualiser.
* Explorer on the MKVs / screenshots.
* 
* 

1. Show planning. Trello Board, then 01 planning.
	1. Discuss the process: de identificatie van services voor het voldoen van de eisen. Hoe je documentatie hebt gelezen en terug heb gekeken op je notes voor AZ-900.
2. Show documentation.
	1. Waarom je specifieke diensten hebt gekozen. Ga af van wat je leest in de documentatie.
3. Show deployment.
	1. Laat de readme zien; die bevat alle relevante informatie. Vertel over de resource group maken via powershell vs aanmaken via module.
4. Showcase Azure Portal.
5. Show screenshots of stress test, explain what you did. 
6. Showcase working SSL encryption screenshot. Explain how SSL is implemented.
7. RDP into management server.
8. ssh into webserver.
9. Show python script video to show connection to database.
10. Afsluiten


Goeiemorgen, ik ga vandaag mijn eindproject presenteren. Ik zal vandaag beginnen met een korte kijk op mijn planning. Daarna zal ik jullie door de documentatie nemen en uiteindelijk een korte demo doen van het eindresultaat op de Azure Portal.

Zoals jullie kunnen zien, hier is mijn planning... Ik ben begonnen met het onderzoeken van de benodigde diensten en het leren van Bicep. ***Scroll through Trello and the planning doc, talk about some things you see.***

Ik zal jullie nu vertellen over welke diensten ik heb gebruikt. **Scroll through documentation as you speak.**
* Networking: NSGs, VNets, waarom 3rde subnet
* Mgmt server: basics, parameter met IP addressen voor access. Dit vs Azure AD PIM. Vertel over de backups.
* Webserver: VM basics, scaling rules (forecast), app gateway rerouting rules (reden waarom ik voor AppGW koos over LB), self-signed SSL certificate.
* Database: Translate documentation. Verder, omdat het een managed service is, bied deze keuze automatische backups en encryptie om aan de requirements te voldoen.
* Storage: kort beschrijven wat de storage account doet voor de project eisen. (disk storage, mogelijkheid om post deployment scripts te uploaden)
* Backups: Recovery Services Vault. Vertel dat de default policy (30dagen) een goede keuze is omdat Azure default policies een goed startpunt zijn voor beveiliging van data.
* Key Vault: login credentials voor de admin user, en doet aan disk encryptie via customer managed keys voor de VMs. Dit is een extra laag encryptie boven wat Azure by default bied,  omdat encryptie een strenge eis is in de project requirements.

***Show drawio diagram, praat even kort over hoe je alles kan zien.***

***Go into live demo.***
Show NSG rules, disk encryption, explain how recovery services vault is set up.
	1. Wees specifiek over de regels en waarom je de keuze hebt gemaakt voor een statisch IP voor de management server en dynamische prive IPs voor de webserver / gateway.

Live demo.

Static content.