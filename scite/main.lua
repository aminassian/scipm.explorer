-- -*- coding: utf-8 -

-- --------------------------------------------------------------------------------------------------------------------------------
-- scipm.explorer namespace
-- --------------------------------------------------------------------------------------------------------------------------------
scipm.explorer = {}
scipm.explorer.config = {
    ["GTK_cmd"] = "dolphin",  -- if unix then exec this command
    ["WIN_cmd"] = "explorer"  -- if win then exec this command
}

-- (global) scipm.explorer.start
-- -------------------------------------------------------------------------------
scipm.explorer.start = function ()

    local cmd = "";
    if props["PLAT_GTK"] == "1" then
        cmd = scipm.explorer.config.GTK_cmd;
        -- swith SciTE[Global|User|Directory|].properties
        if props["scipm.explorer.config.GTK_cmd"] ~= "" then
            cmd = props["scipm.explorer.config.GTK_cmd"];
        end
    else
        cmd = scipm.explorer.config.WIN_cmd;
        -- swith SciTE[Global|User|Directory|].properties
        if props["scipm.explorer.config.WIN_cmd"] ~= "" then
            cmd = props["scipm.explorer.config.WIN_cmd"];
        end
    end

    -- print(cmd);
    -- os.execute(cmd); <=== temporary black cmd if WIN
    local result = scipm.exec(cmd)
    if result.content ~= "" then
        _ALERT(result.content)
    end

end

