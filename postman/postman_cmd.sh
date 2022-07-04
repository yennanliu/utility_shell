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
