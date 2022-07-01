# 1) Add new API call to postman
# step 1 : go to target url
# step 2 : open "developer tool" and filter "Fetch/XHR"
# step 3 : right click "Request URL" and "copy"  -> "copy as cURL"
# step 4 : go to postman, click "import" -> "Raw text" -> paste what we copy on step 3, and "Continue"
# step 5 : done! we should be able to see and test our API endpoint in postman

# 2) Send `Map<String, Object>` with POST request via Postname ?
#     - step 1) set up url (endpoint), choose POST type
#     - step 2) Body -> raw -> choose "Json" type
#     - step 3) add content into body (Map<String, Object>)
#     - step 4) send request
#     - <img src ="https://github.com/yennanliu/SpringPlayground/blob/main/DownloadServiceV2/doc/img/post_with_map_1.png">
#     - <img src ="https://github.com/yennanliu/SpringPlayground/blob/main/DownloadServiceV2/doc/img/post_with_map_2.png">
#     - Ref
#         - http://www.codebaoku.com/it-java/it-java-220952.html
#         - https://github.com/yennanliu/SpringPlayground/tree/main/DownloadServiceV2

# 3) how to "refresh" session token, cookie.. when send a request need auth
#   - step 1) go to postman
#   - step 2) get updated cookie via "copy as cURL" (UI) ("copy as cURL" you get from develop tool in UI)
#   - step 3) go to request, go to header, replace "cookie" with the cookie you got from step 2)
#   - step 4) done, ur request should work now
#
#  cookie example :
#    -H 'cookie: xxx-uuid=xxxx; _hjSessionUser_2841114=eyJpZCI6IjRhYThkZWE3LWE3ZWQtNWM5Yy1iODQxLWY1ZTA1OTNjZmFhYSIsImNyZWF0ZWQiOjE2NTIyNTQ3MjMwNTUsImV4aXN0aW5nIjp0cnVlfQ==; source=referral; campaign=confluence.toolsfdg.net; sensorsdata2015jssdkcross=xxxxyyyyy22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%7D%2C%22%24device_id%22%3A%22180b20e5bc1a98-01458c0964977a-34736704-1484784-180b20e5bc21dc2%22%7D; _hjMinimizedPolls=788559; sidebarStatus=0; _hjIncludedInSessionSample=0; _hjSession_2841114=eyJpZCI6ImUzZjFiMDU2LTlmYWYtNDIxMi05YWYyLTk2MTc5NWQ0YjBjOSIsImNyZWF0ZWQiOjE2NTY2NTM2NDI0NDgsImluU2FtcGxlIjpmYWxzZX0=; _hjIncludedInPageviewSample=1; _hjAbsoluteSessionInProgress=0; SESSION=yyyyy; session_jwt_token=zzzz'
