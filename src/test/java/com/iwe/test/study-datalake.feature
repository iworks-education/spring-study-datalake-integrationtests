Feature: API for register your Study Plan

Background:
* url 'http://localhost:8080/'

Scenario: Creates a new Study Task and search by Topic

Given path 'study'
And request
"""
{
    "topic": "AWS",
    "dateTimeCreation": "2020-07-17T13:00:00Z",
    "tag": "lambda",
    "url": "https://aws.amazon.com/lambda/",
    "description": "AWS Lambda lets you run code without provisioning or managing servers",
    "consumed": false
}
"""
When method post
Then status 201

* def studyTaskRegistered = response

# Get Study Task by Topic
Given path 'study', 'findByTopic'
And param topic = 'AWS'
When method get
Then status 200
And match $[0] == studyTaskRegistered