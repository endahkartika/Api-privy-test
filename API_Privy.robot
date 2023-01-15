*** Settings ***
Library               RequestsLibrary
Library               String

*** Variables ***
${user_id}      AWO7813
${grub_id}      alfin grub
${token}        token1234
${base_url}     http://pretest-qa.dcidev.id/documentation/v1#
${Request_url}  http://pretest-qa.dcidev.id

*** Keywords ***
Random number
    ${random_numbers}=    Evaluate    random.sample(range(628987544444, 628987544999), 1)[0]
    [Return]   ${random_numbers}

Random String
    ${random_auth}=   Generate Random String    12    [LOWER]
    [Return]   ${random_auth}


*** Test Cases ***

# Quick Get Request Test
#     ${response}=    GET   ${base_url}

# Test get random phone number
#     ${random_auth}=   Generate Random String    12   [LOWER]
#     ${random_numbers}=    Evaluate    random.sample(range(628987544444, 628987544999), 1)[0]

TC1_message : /api/v1/message/${user_id}
    ${random_auth}=   Random string
    ${response1}=   GET   ${Request_url}/api/v1/message/${user_id}  params=Authorization=${random_auth}&user_id=${user_id}   expected_status=200

TC2_message : /api/v1/message/send
    ${random_auth}=   Random string
    ${response2}=   POST   ${Request_url}/api/v1/message/send  params=Authorization=${random_auth}&user_id=${user_id}&message=API automation   expected_status=201

TC3_notification : /api/v1/notification/${grub_id}/${token}
    ${response}=   POST   ${Request_url}/api/v1/notification/${grub_id}/${token}  params=grub_id=${grub_id}&token=${token}   expected_status=201

TC4_oauth : /api/v1/oauth/credentials
    ${response}=   GET   ${Request_url}/api/v1/oauth/credentials  params=access_token=auhusdaw22xxx   expected_status=200

TC5_oauth : /api/v1/oauth/sign_in
    ${random_numbers}=   Random number
    ${response}=   POST   ${Request_url}/api/v1/oauth/sign_in  params=phone=${random_numbers}&password=APIPrivyID&latlong=8awydo3&device_token&device_type=1   expected_status=201

TC6_oauth : /api/v1/oauth/revoke
    ${response}=   POST   ${Request_url}/api/v1/oauth/revoke  params=access_token=auhusdaw22xxx   expected_status=201

TC7_profile : /api/v1/profile/career
    ${random_auth}=   Random string
    ${response}=   POST   ${Request_url}/api/v1/profile/career  params=Authorization=${random_auth}&position=QA_Engineer&company_name=LandX&starting_from=12-12-2022&ending_in=12-12-2023   expected_status=201

TC8_profile : /api/v1/profile/education
    ${random_auth}=   Random string
    ${response}=   POST   ${Request_url}/api/v1/profile/education  params=Authorization=${random_auth}&school_name=SMK%203%20Yogyakarta&graduation_time=12-12-2022   expected_status=201

TC9_profile : /api/v1/profile/profile
    ${random_auth}=   Random string
    ${response}=   POST   ${Request_url}/api/v1/profile/profile  params=Authorization=${random_auth}&name=alfin%20wicaksono&gender=1&birthday=12-12-2022&hometown=Yogyakarta&bio=aku%20ganteng%20makasih   expected_status=201

TC10_profile : /api/v1/profile/profile/me
    ${random_auth}=   Random string
    ${response}=   GET   ${Request_url}/api/v1/profile/profile/me  params=Authorization=${random_auth}   expected_status=200

TC11_register : /api/v1/register/remove
    ${random_numbers}=   Random number
    ${response}=   POST   ${Request_url}/api/v1/register/remove  params=phone=${random_numbers}   expected_status=201

TC12_register : /api/v1/register/otp/request
    ${random_numbers}=   Random number
    ${response}=   POST   ${Request_url}/api/v1/register/otp/request  params=phone=${random_numbers}   expected_status=201

TC13_register : /api/v1/register/otp/match
    ${response}=   POST   ${Request_url}/api/v1/register/otp/match  params=user_id=${user_id}&otp_code=55223   expected_status=201

TC14_register : /api/v1/register/
    ${random_numbers}=   Random number
    ${response}=   POST   ${Request_url}/api/v1/register  params=phone=${random_numbers}&password=KapanOnePieceTamat&country=Indonesia&latlong=zxcwssss&device_token=${token}&device_type=1   expected_status=201

TC15_uploads : /api/v1/uploads/cover
    ${random_auth}=   Random string
    ${file}=   Get File For Streaming Upload   ${CURDIR}/../image jmeter/dw.png
    ${files}=   Create Dictionary   image   ${file}
    ${response}=   POST   ${Request_url}/api/v1/uploads/cover  params=Authorization=${random_auth}   files=${files}   expected_status=201

TC16_upload : /api/v1/uploads/profile/default
    ${random_auth}=   Random string
    ${response}=   POST   ${Request_url}/api/v1/uploads/profile/default  params=Authorization=${random_auth}&id=ssxawsdaw   expected_status=201

TC17_upload : /api/v1/uploads/profile
    ${random_auth}=   Random string
    ${response}=   DELETE   ${Request_url}/api/v1/uploads/profile  params=Authorization=${random_auth}&id=ssxawsdaw   expected_status=204

TC18_upload : /api/v1/uploads/profile
    ${random_auth}=   Random string
    ${file}=   Get File For Streaming Upload   ${CURDIR}/../image jmeter/dw.png
    ${files}=   Create Dictionary   image   ${file}
    ${response}=   POST   ${Request_url}/api/v1/uploads/profile  params=Authorization=${random_auth}   files=${files}   expected_status=201
