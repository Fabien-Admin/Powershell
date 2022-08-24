## Script Powershell permettant d'automatiser des tâches sur le navigateur Brave

#Chemin des fichiers nécessaires
$brave = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe" #Brave location
$chromedriverExe = "$env:USERPROFILE\Desktop\Selenium" #Chromedriver location

#Chargement dll
Add-Type -Path "$env:USERPROFILE\Desktop\Selenium\WebDriver.dll"

#Options Chrome
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
#Chemin de l'executable chrome (Brave)
$chromeOptions.BinaryLocation = $brave

#Déclarer les options dans ChromeDriver
$service = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($chromedriverExe)
#Activation des logs
$service.EnableVerboseLogging = $true
#Ouvre Brave via ChromeDriver
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($service, $chromeOptions)

#Ouvrir URL
$driver.Navigate().GoToUrl("https://www.google.fr/")
#Action sur l'élément "Tout accepter" 
$driver.FindElement([OpenQA.Selenium.By]::Id("L2AGLb")).Submit()

#Taper toto dans la barre de recherche
$driver.FindElement([OpenQA.Selenium.By]::Name("q")).SendKeys("toto")
#Click sur Recherche Google
$driver.FindElement([OpenQA.Selenium.By]::XPath("/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]")).Click()
#$driver.FindElement([OpenQA.Selenium.By]::Name("q")).SendKeys("toto`n") #Alternative aux deux commandes précédentes



#Fermer le navigateur et chromedriver
$driver.Quit()