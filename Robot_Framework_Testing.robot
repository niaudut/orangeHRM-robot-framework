*** Settings ***
Library           Selenium2Library

*** Variables ***
${Username}       id=txtUsername
${Password}       id=txtPassword
${BtnLogin}       id=btnLogin
${TabLeave}       id=menu_leave_viewLeaveModule
${TabApply}       id=menu_leave_applyLeave
${SlctLeaveType}    name=applyleave[txtLeaveType]
${TxtFromDate}    name=applyleave[txtFromDate]
${TxtToDate}      name=applyleave[txtToDate]
${SlctDuration}    id=applyleave_duration_duration
${SlctDurationAmPm}    id=applyleave_duration_ampm
${TtlApplyLeave}    class=head
${BtnDate5Oct}    xpath=/html/body/div[3]/table/tbody/tr[2]/td[1]/a
${ImgDatePicker}    class=ui-datepicker-trigger
${BtnNextMonth}    class=ui-icon ui-icon-circle-triangle-e
${SlctMonth}      class=ui-datepicker-month
${BtnApplyLeave}    id=applyBtn
${TtlSuccessSubmit}    class=message success fadable
${TabMyLeave}     id=menu_leave_viewMyLeaveList
${TtlUserRoleAdmin}    xpath=//*[@id="resultTable"]/tbody/tr[6]/td[3]
${TabNationalities}    id=menu_admin_nationality
${BtnAddNationalities}    id=btnAdd
${TxtNationalityName}    id=nationality_name
${BtnSaveAddNationalities}    id=btnSave
${TtlAaab}        xpath=//*[@id="resultTable"]/tbody/tr[1]/td[2]/a
${ChkNationalities}    name=chkSelectRow[]
${BtnWelcome}     id=welcome
${BtnLogout}      xpath=//*[contains(text(),'Logout')]
${TabMyInfo}      id=menu_pim_viewMyDetails
${BtnDeleteNationalities}    id=btnDelete
${BtnConfirmDelete}    id=dialogDeleteBtn
${TabAdmin}       id=menu_admin_viewAdminModule
${TtlLoginPanel}    id=logInPanelHeading

*** Test Cases ***
TC_NavigateToURL
    [Documentation]    This test case is to navigate user to URL https://opensource-demo.orangehrmlive.com/
    Open Browser    https://opensource-demo.orangehrmlive.com/    firefox

TC_Login
    [Documentation]    This test case is login process
    Input Text    ${Username}    Admin
    Input Text    ${Password}    admin123
    Click Button    ${BtnLogin}

TC_AddDeleteNationalities
    [Documentation]    This test case is to add and delete Nationalities
    Click Element    ${TabAdmin}
    Wait Until Element Is Visible    ${TabNationalities}
    Click Element    ${TabNationalities}
    Click Button    ${BtnAddNationalities}
    Input Text    ${TxtNationalityName}    aaab
    Click Button    ${BtnSaveAddNationalities}
    Element Should Be Visible    ${TtlAaab}
    Select Checkbox    ${ChkNationalities}
    Click Button    ${BtnDeleteNationalities}
    Click Button    ${BtnConfirmDelete}

TC_ApplyLeave
    [Documentation]    This test case is to apply leave in 5-Oct-2020
    Click Element    ${TabLeave}
    Wait Until Element Is Visible    ${TabApply}
    Click Element    ${TabApply}
    Page Should Contain Element    ${TtlApplyLeave}
    Select From List by Index    ${SlctLeaveType}    2
    Click Image    ${ImgDatePicker}
    Select From List by Label    ${SlctMonth}    Oct
    Click Element    ${BtnDate5Oct}
    Select From List by Value    ${SlctDuration}    half_day
    Select From List by Label    ${SlctDurationAmPm}    Afternoon
    Click Button    ${BtnApplyLeave}

TC_Logout
    Sleep    2
    Wait Until Element is Visible    ${BtnWelcome}
    Click Element    ${BtnWelcome}
    Wait Until Element is Visible    ${BtnLogout}
    Click Element    ${BtnLogout}
    Page Should Contain Element    ${TtlLoginPanel}
    Close Browser
