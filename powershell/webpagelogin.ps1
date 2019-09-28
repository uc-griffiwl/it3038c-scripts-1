$navOpenInBackgroundTab = 0x1000; #opens the window in the background
$ie = new-object -com InternetExplorer.Application #calls internet explorer
$ie.Navigate2("http://canopy.uc.edu/webapps/login/?action=relogin");#opens the site listed
$ie.Navigate2("https://www.twitch.tv", $navOpenInBackgroundTab);#opens tabs behind the first
$ie.Navigate2("https://www.reddit.com/r/legaladvice/ ", $navOpenInBackgroundTab);
$ie.Navigate2("https://www.reddit.com/r/nfl/ ", $navOpenInBackgroundTab);
$ie.Navigate2("https://www.reddit.com/r/fantasyfootball/ ", $navOpenInBackgroundTab);
$ie.Visible = $true;