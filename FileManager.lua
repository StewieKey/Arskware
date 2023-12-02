if isfolder("./Arskware") then
    if not isfolder("./Arskware/Scripts") then
        makefolder("./Arskware/Scripts")
    end
else
    makefolder("./Arskware")
    makefolder("./Arskware/Scripts")
end

local Library = {}
local ArskFolderPath = "./Arskware"
local ScriptsPath = `{ArskFolderPath}/Scripts`

function Library:GetScriptFiles()
    local Scripts = {}
    
    for _, File in pairs(listfiles(ScriptsPath)) do
        if string.find(File, "lua") then
            table.insert(Scripts, File)
        end
    end
    
    return Scripts
end

function Library:ReadScript(File)
    local Script = ""

    if isfile(File) then
        Script = readfile(File):gsub("\n$", "")
    end
    
    return Script
end

function Library:WriteScript(File, Script)
    if not isfile(File) then
        writefile(File, Script)
        
        return "Wrote File"
    else
        return "Dupe File"
    end
end

function Library:DeleteScript(File)
    if isfile(File) then
        delfile(File)
    end
end

function Library:UpdateScript(File, Script)
    if isfile(File) then
        Library:DeleteScript(File)
        Library:WriteScript(File, Script)
    end
end

return Library
