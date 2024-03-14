#!/usr/bin/env luajit
-- ## DESC
-- * title: githubio blog generate tool
-- * date: 2024-03-14 17:54:16
-- * update: 2024-03-14 17:54:16
-- * author: borisu
-- ## TODO

file = io.open('README.md','w')

file:write("* [wiki](wiki/index)\n")
file:write("* [lua](wiki/lua)\n")
file:write("* [nvim](wiki/nvim)\n")
file:close()

if arg[1] == 'push' then
	os.execute("git add . && git commit -m 'update files' && git push")
end
