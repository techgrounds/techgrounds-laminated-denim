3m


Goedemorgen iedereen. Vandaag ga ik het gedeelte Azure presenteren van opdracht 5, Storage Accounts. Mijn collega Younes neemt daarna over voor het gedeelte AWS.

Wat is een storage service?

Een storage service laat gebruikers files online op een server in de cloud opslaan. Dit zorgt voor makkelijke toegang zolang als je een internet connectie hebt. Terwijl we vandaag over Azure Storage Accounts en Amazon's oplossing zullen spreken, zou je ook diensten zoals Dropbox of Google Drive als cloud storage services kunnen zien.

NEW SLIDE

Een Storage Account in Azure is Microsoft's antwoord voor data storage. Storage in de cloud is van nature scalable, omdat je met gemak extra erbij kan kopen. Ook is het highly available. Voor de situaties waar een server rack of datacentrum problemen ervaart zijn er meerdere redundancy opties om te zorgen dat je toegang tot je data behoudt. Security met Storage Accounts is erg belangrijk: de data op een storage account is standaard toegankelijk vanaf het internet, dus boven op standaard encryptie van de data zijn er veel opties om controle te geven over wie de data kan inzien.

NEW SLIDE

Bij Azure heb je keuze uit meerdere services die gegroupeerd worden onder Storage Accounts. Dit zijn:
* Azure Blobs
	* Blob storage is ideaal voor grote hoevelheiden van ongestructeerde data, bijvoorbeeld text. Het kan gebruikt worden voor het hosten van statische files die toegankelijk zijn vanuit een web browser, data backup, of zelfs video streaming.
* Azure Files
	* Azure Files is een file sharing systeem dat volledig in de cloud zit. Dit maakt het een potentiele vervanging voor on-premises file servers zoals een NAS server. Je kan het zien als een storage methode waarin je kan navigeren via file paths.
* Azure Queues
	* Queue Storage is een storage methode voor grote hoevelheden messages. Dit zijn kleine files van tot 64 kilobytes, dus je kan wel goed voorstellen hoe veel messages er in een queue van 500 gigabytes zitten.
* Azure Tables
	* Table Storage is een vorm van database storage en vaak een goedkoper alternatief tot zoiets als SQL. Het is een goede vorm van storage voor dingen zoals user data, device information en andere vormen van metadata.

NEW SLIDE

Verder zal ik nog kort ingaan over de opties voor beveiliging, redundancy en access.

Het beveiligen van de data op een Storage Account is belangrijk, en er zijn veel mogelijkheden. Access restricties kunnen bestaan uit specifieke IP addressen of subnets, of role-based access controls die gezet kunnen worden in de Azure Portal.

Voor redundancy zijn er meerdere mogelijkheden beschikbaar, afhankelijk van welke performance tier gekozen wordt. Locally-redundant storage, geo-redundant storage, zone-redundant storage en geo-zone-redundant storage zijn de 4 opties beschikbaar voor de standard performance tier. Deze bieden allemaal verschillende niveaus van beveiliging tegen rampen.

Iets wat je terug zal zien onder een ander naam is de access tier. Hot and Cold zijn de twee opties in Azure: hot voor data die vaak gebruikt wordt, en cold voor backup scenarios.

Nu zal ik jullie overdragen aan Younes voor een uitleg over AWS. Bedankt voor jullie tijd.