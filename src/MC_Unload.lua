--------------------------------------------------------------------------
-- Lmod License
--------------------------------------------------------------------------
--
--  Lmod is licensed under the terms of the MIT license reproduced below.
--  This means that Lmod is free software and can be used for both academic
--  and commercial purposes at absolutely no cost.
--
--  ----------------------------------------------------------------------
--
--  Copyright (C) 2008-2014 Robert McLay
--
--  Permission is hereby granted, free of charge, to any person obtaining
--  a copy of this software and associated documentation files (the
--  "Software"), to deal in the Software without restriction, including
--  without limitation the rights to use, copy, modify, merge, publish,
--  distribute, sublicense, and/or sell copies of the Software, and to
--  permit persons to whom the Software is furnished to do so, subject
--  to the following conditions:
--
--  The above copyright notice and this permission notice shall be
--  included in all copies or substantial portions of the Software.
--
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
--  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
--  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
--  NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
--  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
--  ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
--  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
--  THE SOFTWARE.
--
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- When unloading all the positive actions of a module are reversed. So
-- a "setenv()" becomes an unset and so forth.  Note that reversing an
-- unload or an unsetenv command produces a warning about:
--   "Stubbornly refusing to ..."


require("strict")

MC_Unload              = inheritsFrom(MasterControl)
MC_Unload.my_name      = "MC_Unload"

local M                = MC_Unload
local dbg              = require("Dbg"):dbg()
local format           = string.format
local getenv           = os.getenv


M.always_load          = MasterControl.quiet
M.always_unload        = MasterControl.unload
M.add_property         = MasterControl.remove_property
M.append_path          = MasterControl.remove_path_last
M.conflict             = MasterControl.quiet
M.execute              = MasterControl.execute
M.family               = MasterControl.unset_family
M.help                 = MasterControl.quiet
M.inherit              = MasterControl.inherit
M.load                 = MasterControl.unload
M.load_usr             = MasterControl.unload
M.myFileName           = MasterControl.myFileName
M.myModuleFullName     = MasterControl.myModuleFullName
M.myModuleUsrName      = MasterControl.myModuleUsrName
M.myModuleName         = MasterControl.myModuleName
M.myModuleVersion      = MasterControl.myModuleVersion
M.prepend_path         = MasterControl.remove_path_first
M.prereq               = MasterControl.quiet
M.prereq_any           = MasterControl.quiet
M.pushenv              = MasterControl.popenv
M.remove_path          = MasterControl.bad_remove_path
M.remove_property      = MasterControl.bad_remove_property
M.report               = MasterControl.error
M.setenv               = MasterControl.unsetenv
M.set_alias            = MasterControl.unset_alias
M.set_shell_function   = MasterControl.unset_shell_function
M.try_load             = MasterControl.unload
M.unload               = MasterControl.bad_unload
M.unload_usr           = MasterControl.bad_unload
M.unsetenv             = MasterControl.bad_unsetenv
M.unset_alias          = MasterControl.bad_unset_alias
M.unset_shell_function = MasterControl.bad_unset_shell_function
M.usrload              = MasterControl.unload
M.whatis               = MasterControl.quiet

return M
