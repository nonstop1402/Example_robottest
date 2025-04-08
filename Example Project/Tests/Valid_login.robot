*** Settings ***
Documentation    ตรวจสอบการล็อกอิน

Library     SeleniumLibrary
Resource    ../Keywords/standarduser__keywords.robot
Test Setup    Set Selenium Speed    0.25
Suite Setup    Open and maximize browser
Suite Teardown    Close All Browsers


*** Test Cases ***
Login As Standard User
    Login With Credentials    standard_user    secret_sauce
