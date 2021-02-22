repo <- "New"
user <- "trinker"
password <- "password"

url <- "http://curl.askapache.com/download/curl-7.23.1-win64-ssl-sspi.zip"
tmp <- tempfile( fileext = ".zip" )
download.file(url,tmp)
unzip(tmp, exdir = tempdir())

system(paste0(tempdir(), "/curl http://curl.haxx.se/ca/cacert.pem -o " , 
              tempdir() , "/curl-ca-bundle.crt"))

cmd1 <- paste0(tempdir(), "/curl -u '", user, ":", password, 
               "' https://api.github.com/user/repos -d '{\"name\":\"", repo, "\"}'")

system(cmd1)

cmd2 <- paste0(tempdir(), "/curl -k -u '", user, ":", password, 
               "' https://api.github.com/user/repos -d '{\"name\":\"", repo, "\"}'")

