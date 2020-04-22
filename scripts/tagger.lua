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
    comp = "comp",
    tagf = "favorites",
    delfile = "Tagged for deletion",
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

function tag_5()
    tag_file(o.tagf)
end

function tag_anal()
    tag_file(o.anal)
end

function tag_comp()
    tag_file(o.comp)
end

function tag_del()
    tag_file(o.delfile)
end




mp.add_key_binding("F", "tag_favorite", tag_fav)
mp.add_key_binding("", "tag_1", tag_1)
mp.add_key_binding("", "tag_2", tag_2)
mp.add_key_binding("", "tag_3", tag_3)
mp.add_key_binding("", "tag_4", tag_4)
mp.add_key_binding("", "tag_5", tag_5)
mp.add_key_binding("", "tag_f", tag_f)
mp.add_key_binding("", "tag_del", tag_del)
mp.add_key_binding("", "tag_anal", tag_anal)
mp.add_key_binding("", "tag_comp", tag_comp)

