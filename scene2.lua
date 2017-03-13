-----------------------------------------------------------------------------------------
--
-- scene2.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require("widget")
local dropdown = require('dropdown')
local screen = require('screen')
local scene = composer.newScene()
   

-------------------------------------------<><><><<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
    local sceneGroup = self.view

    local myTextObject = display.newText("RecipeFinder", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5
    sceneGroup:insert(myTextObject)

    ---local backbutton = display.newImage("assets/backbutton.png")
    ---backbutton:scale( 0.2, 0.2 )
    ---backbutton.x = 40; backbutton.y = 8

    ---sceneGroup:insert(backbutton)

    local myDropdown

local dropdownOptions = {
  {
    title     = 'User Profile',
    action    = function() 
      composer.gotoScene("profile")
    end 
  },
  {
    title     = 'Recipes',
    action    = function() 
      composer.gotoScene("recipes")
    end 
  },
  {
    title     = 'Saved Recipes',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    title     = '7 Day Planner',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    title     = 'Health Tracker',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    title     = 'Group Meal Planner',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    title     = 'Help and Support',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    title     = 'Log Out',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  }

}

local button = widget.newButton{
  width       = 30,
  height      = 30,
  defaultFile = 'assets/burger.png',
  overFile    = 'assets/burger.png',
  onEvent     = function( event )
    local target = event.target
    local phase  = event.phase
    if phase == 'began' then
      target.alpha = .5
    else
      target.alpha = 1
      if phase ==  'ended' then
        myDropdown:toggle()
      end
    end
  end
}
button.alpha = 10

myDropdown     = dropdown.new{
  x            = screen.rightSide - 50,
  y            = screen.topSide + 50,
  toggleButton = button,
  width        = 280,
  marginTop    = 12,
  padding      = 20,
  options      = dropdownOptions
}

end







-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    ---signin:removeSelf()

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

  --  local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene

