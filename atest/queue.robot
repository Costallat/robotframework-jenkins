*** Settings ***
Library    JenkinsLibrary
Resource    lib/jenkins_keywords.robot
Suite Setup    Set Jenkins Server    url=${jenkins_address}    username=admin    password=admin

*** Test Cases ***
Get Queue
    [Tags]    Queue
    [Setup]    Create Job From Template    ${test_job_name}    ${job_parameterized_scratch}
    [Teardown]    Delete Jenkins Job    ${test_job_name}
    ${random_int} =    Get Random Integer    4    10
    :FOR    ${run}    IN RANGE    ${random_int}
    \    Start Jenkins Job    ${test_job_name}    ${job_parameterized_scratch_parameters}
    ${queue} =    Get Jenkins Queue
    Should Be True    ${queue}