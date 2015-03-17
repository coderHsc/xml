--解析XML工具
local xmlFile    = io.open("unit_tank.asc","r")


--local allContent = xmlFile:read("*a")

local tmpFile    = io.open("hello.txt","w")
local cnt = 0
for line in xmlFile:lines() do 
	local len    = string.len(line)


	if len > 0 then 
		local num = string.sub(line,1,1)
		local tonum= tonumber(num)

		if tonum~=nil then
			local start = 1
			local aEnd=string.find(line," ",start)
			local a = string .sub(line,start,aEnd-1)
			start = aEnd+1 

			local bEnd=string.find(line," ",start)
			local b = string .sub(line,start,bEnd-1)
			start = bEnd+1

			local cEnd=string.find(line," ",start)
			if cEnd ~= nil then 
			
				local c = string .sub(line,start,cEnd-1)

				start = cEnd+1

				local dEnd=string.find(line," ",start)
				local d
				local e 
				if dEnd ~= nil then 
				    d =string.sub(line,start,dEnd-1)
					start = dEnd+1
					local eEnd=string.find(line," ",start)
					e =string.sub(line,start,eEnd-1)
				else
					d =string.sub(line,start)
				end
				if e ~= nil then 
					cnt = cnt +1
					print("<key>image"..cnt..".png</key>")
					print("<dict>")
					print("<key>frame</key>")
					print("<string>{{" .. b .. "," .. c .."},{" ..d.. "," .. e.. "}}</string>")
					print("<key>offset</key>")
					print("<string>{0,0}</string>")
					print("<key>rotated</key>")
					print("<false/>")
					print("<key>sourceColorRect</key>")
					print("<string>{{0,0},{" ..d.. "," .. e.. "}}</string>")
					print("<key>sourceSize</key>")
					print("<string>{" ..d.. "," .. e.. "}}</string>")
					print("</dict>")
				end 
			end
		end
	end 
end

-- function getABCD(str)
-- 	local start = 1
-- 	local aEnd=string.find(str,",",start)
-- 	local a = string .sub(str,start,aEnd-1)

-- 	start = aEnd+1 
-- 	local bEnd=string.find(str,",",start)
-- 	local b = string .sub(str,start,bEnd-1)
-- 	start = bEnd+1
-- 	local cEnd=string.find(str,",",start)
-- 	local c = string .sub(str,start,cEnd-1)
-- 	start = cEnd+1
-- 	local d =string.sub(str,start)

-- 	return a,b,c,d
-- end 
-- for line in xmlFile:lines() do print("xxxxxx",line) end

-- local len    = string.len(allContent)
-- local curLen = 10 
-- local cnt = 0
-- while curLen < len do
-- 	local subStr = string.sub(allContent,curLen,curLen+3)

-- 	if subStr == "src=" then 
-- 		cnt = cnt + 1
-- 		local endLen = string.find(allContent," ",curLen+4)
-- 		local subStr2 = string.sub(allContent,curLen+5,endLen-2)

-- 		local a,b,c,d =getABCD(subStr2)
 
-- 		--print("str",a,b,c,d)

-- 		print("<key>image"..cnt..".png</key>")
-- 		print("<dict>")
-- 		print("<key>frame</key>")
-- 		print("<string>{{" .. a .. "," .. b .."},{" ..c.. "," .. d.. "}}</string>")
-- 		print("<key>offset</key>")
-- 		print("<string>{0,0}</string>")
-- 		print("<key>rotated</key>")
-- 		print("<false/>")
-- 		print("<key>sourceColorRect</key>")
-- 		print("<string>{{0,0},{" ..c.. "," .. d.. "}}</string>")
-- 		print("<key>sourceSize</key>")
-- 		print("<string>{" ..c.. "," .. d.. "}}</string>")
-- 		print("</dict>")
-- 		  -- <key>image2.png</key>
--     --         <dict>
--     --             <key>frame</key>
--     --             <string>{{112,0},{110,150}}</string>
--     --             <key>offset</key>
--     --             <string>{0,0}</string>
--     --             <key>rotated</key>
--     --             <false/>
--     --             <key>sourceColorRect</key>
--     --             <string>{{0,0},{110,150}}</string>
--     --             <key>sourceSize</key>
--     --             <string>{110,150}</string>
--     --         </dict>
-- 		--print("str",subStr2)
-- 		--print("cnt",cnt)


-- 	end
	
-- 	curLen = curLen + 1
-- end


tmpFile:close()
xmlFile:close()
