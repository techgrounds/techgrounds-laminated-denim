# [Onderwerp]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht
### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
Following a quickstart tutorial in the Azure Functions documentation, I used Visual Studio Code to create a Python-based HTML trigger. By selecting *create function* under the *workspace* dropdown in the left menu, I was able to create this function on the basis of a template. Next, I used F5 to launch into debug mode and executed the function by right clicking on it. This resulted in a hello message being sent.  
![ss1](../../00_includes/AZ-18_screenshot1.png)  
Next, I used VSC to create a Function app in Azure and then deployed the HTML trigger to it. A second execution of the function resulted in another successful response.

With this step completed, I then prepared to connect the trigger to Azure Queue Storage. This required creating a binding extension and copying some code into the project. I ran the function locally, and it successfully added a message to the Queue Storage that was visible from within Storage Explorer.  
![SS2](../../00_includes/AZ-18_screenshot2.png)  
Next, I deployed the app and executed the function again. Another message was added to the queue.  
![ss3](../../00_includes/AZ-18_screenshot3.png)  
Finally, I checked the Azure Portal to see how the function looked there.  
![ss4](../../00_includes/AZ-18_screenshot4.png)  

The code for the project I used is available [here.](../AZ-18_functions)

