
--- Input library
--- @class input
input = {}

--- Returns whether candidate list indexing starts at 1
--- @return boolean
function input.CandidateListStartsAtOne()
  return false
end

--- Returns the panel that has app-modal input
--- @return userdata|nil
function input.GetAppModalSurface()
  return nil
end

--- Returns the number of candidate items
--- @return integer
function input.GetCandidateListCount()
  return 0
end

--- Returns the number of items per page in candidate list
--- @return integer
function input.GetCandidateListPageSize()
  return 0
end

--- Returns the first item index of the current page
--- @return integer
function input.GetCandidateListPageStart()
  return 0
end

--- Returns the currently selected item in candidate list
--- @return integer
function input.GetCandidateListSelectedItem()
  return 0
end

--- Returns the current IME handle
--- @return integer
function input.GetCurrentIMEHandle()
  return 0
end

--- Returns cursor position (x, y)
--- @return integer x
--- @return integer y
function input.GetCursorPosition()
  return 0, 0
end

--- Returns English IME handle
--- @return integer
function input.GetEnglishIMEHandle()
  return 0
end

--- Returns the panel that currently has focus
--- @return userdata|nil
function input.GetFocus()
  return nil
end

--- Returns the modal sub-tree panel
--- @return userdata|nil
function input.GetModalSubTree()
  return nil
end

--- Returns the panel that currently has mouse capture
--- @return userdata|nil
function input.GetMouseCapture()
  return nil
end

--- Returns the panel that the mouse is currently over
--- @return userdata|nil
function input.GetMouseOver()
  return nil
end

--- Returns whether composition string should be inverted
--- @return boolean
function input.GetShouldInvertCompositionString()
  return false
end

--- Returns whether a key is currently down
--- @param key integer
--- @return boolean
function input.IsKeyDown(key)
  return false
end

--- Returns whether a mouse button is currently down
--- @param button integer
--- @return boolean
function input.IsMouseDown(button)
  return false
end

--- Stub for OnChangeIME event
--- @param enable boolean
function input.OnChangeIME(enable) end

--- Stub for OnKeyCodeUnhandled event
--- @param key integer
function input.OnKeyCodeUnhandled(key) end

--- Sets cursor position
--- @param x integer
--- @param y integer
function input.SetCursorPos(x, y) end

--- Checks whether the modal sub-tree should receive messages
--- @return boolean
function input.ShouldModalSubTreeReceiveMessages()
  return false
end

--- Returns whether a key was pressed
--- @param key integer
--- @return boolean
function input.WasKeyPressed(key)
  return false
end

--- Returns whether a key was released
--- @param key integer
--- @return boolean
function input.WasKeyReleased(key)
  return false
end

--- Returns whether a key was typed
--- @param key integer
--- @return boolean
function input.WasKeyTyped(key)
  return false
end

--- Returns whether a mouse button was pressed
--- @param button integer
--- @return boolean
function input.WasMousePressed(button)
  return false
end

--- Returns whether a mouse button was released
--- @param button integer
--- @return boolean
function input.WasMouseReleased(button)
  return false
end

return input