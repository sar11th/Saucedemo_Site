*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Openbrowser
    Start Browser and Maximize
    [Documentation]   This keyword is used for start browser and maximize its window
    [Arguments]    ${siteurl}    ${browser}
    Open Browser    https://demoqa.com/profile    chrome
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Create Webdriver    Chrome    options=${chrome_options}
    Set Window Size    1366    768
    Maximize Browser Window
    ${Title}=    Get Title
    log to console    ${Title}
    Should Be Equal As Strings    ${Title}    DEMOQA
