local msg = require "mp.msg"
local utils = require "mp.utils"
local options = require "mp.options"

local cut_pos = nil
local copy_audio = true
local o = {
    tag1 = "1 Star",
    tag2 = "2 Star",
    tag3 = "3 Star",
    tag4 = "4 Star",
    tag5 = "5 Star",
    command_template = [[
        tmsu tag "$in" "$tag"
    ]],
}
options.read_options(o)


function osd(str)
    return mp.osd_message(str, 3)
end

function trim(str)
    return str:gsub("^%s+", ""):gsub("%s+$", "")
end

function tag_file(label)
    local filename = mp.get_property("path")
    local cmd = trim(o.command_template:gsub("%s+", " "))

    cmd = cmd:gsub("$in", filename)
    cmd = cmd:gsub("$tag", label)

    msg.info(cmd)
    os.execute(cmd)
    osd("Added file to " .. label .. '!')
end

function tag_fav()
    tag_file("favorites")
end

function tag_1()
    tag_file(o.tag1)
end

function tag_2()
    tag_file(o.tag2)
end

function tag_3()
    tag_file(o.tag3)
end

function tag_4()
    tag_file(o.tag4)
end

function tag_5()
    tag_file(o.tag5)
end




mp.add_key_binding("F", "tag_favorite", tag_fav)
mp.add_key_binding("", "tag_1", tag_1)
mp.add_key_binding("", "tag_2", tag_2)
mp.add_key_binding("", "tag_3", tag_3)
mp.add_key_binding("", "tag_4", tag_4)
mp.add_key_binding("", "tag_5", tag_5)

