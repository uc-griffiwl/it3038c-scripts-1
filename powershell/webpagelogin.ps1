$navOpenInBackgroundTab = 0x1000;
$ie = new-object -com InternetExplorer.Application
$ie.Navigate2("http://canopy.uc.edu/webapps/login/?action=relogin");
$ie.Navigate2("https://www.twitch.tv", $navOpenInBackgroundTab);
$ie.Navigate2("https://www.reddit.com/r/legaladvice/ ", $navOpenInBackgroundTab);
$ie.Navigate2("https://www.reddit.com/r/nfl/ ", $navOpenInBackgroundTab);
$ie.Navigate2("https://www.reddit.com/r/fantasyfootball/ ", $navOpenInBackgroundTab);
$ie.Visible = $true;