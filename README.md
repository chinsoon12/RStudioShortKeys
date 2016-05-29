# RStudioShortKeys
An addin package to complement RStudio by providing shortcut keys to commonly used functions (e.g. str, head, and tail) 

## Introduction
This package contains RStudio (>= 0.99.878) addins for commonly used functions (str, head, and tail). 

## Usage
After installing the package, user can then perform these steps as follows 

1. Highlight a variable or a section of the code, 
2. Click on Addins menu, 
3. Select either 'Call str', 'Call head' or 'Call tail'. 

User can also set their own keyboard shortcut keys for faster addin call.

## Testing
Code was developed using RStudio 0.99.896 using R-3.3.0 Win x64 and rstudioapi-0.5-1. 
RStudio should be as least >= 0.99.878 (for the addins) and rstudioapi has to be at least >= 0.5.1 (for sending code to console)


## Installation steps for Windows

1. Install R from [here](https://cran.r-project.org/bin/windows/base/)
2. Install RStudio (>= 0.99.878) from [here](https://www.rstudio.com/products/rstudio/download/)
3. Install devtools package using 'install.packages("devtools")'
4. Install rstudioapi package using 'devtools::install_github("rstudio/rstudioapi")'. If you are using a proxy server, you might need to set proxy url as mentioned [here](http://stackoverflow.com/questions/17783686/solution-how-to-install-github-when-there-is-a-proxy). If you do not know your proxy server name, check out [this](http://superuser.com/questions/346372/how-do-i-know-what-proxy-server-im-using) or open IE then click Tools, click Internet Options, click the Connections Tab, then click LAN settings.
5. Install RStudioShortKeys using 'devtools::install_github("chinsoon12/RStudioShortKeys")'
6. Highlight a variable or a section of the code, 
7. Click on Addins menu, 
8. Select either 'Call str', 'Call head' or 'Call tail'.
9. Set keyboard shortcut keys for easier calls.

