local resp = http.get("https://raw.githubusercontent.com/Anonymous-crow/ccbot/master/main.lua")
write(resp.readAll())
resp.close()
