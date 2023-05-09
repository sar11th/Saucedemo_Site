*** Settings ***
Library    SeleniumLibrary
Variables    D:/PycharmProjects/testing/project/saucedemo_project/Pageobjects/locators.robot


*** Keywords ***
Open My Browser
    [Documentation]    Opens the browser and navigates to the login page
    [Arguments]    ${siteUrl}    ${Browser}
    Set Selenium Speed    3s
    Usernames
    Open Browser    ${siteUrl}    ${Browser}
    Maximize Browser Window
    Wait Until Page Contains Element    id=user-name
Enter UserName
    [Arguments]    ${username}
    Input Text  ${txt_loginUserName}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text  ${txt_loginPassword}    ${password}

click signIn
    click button      ${btn_signIn}

Verify Successfull Login


