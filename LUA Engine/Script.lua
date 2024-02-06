--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

entered = false;
hasSpell = false;
castSpellLib = false;

function story(aName)
    if(aName == "start") then
        playMusic("background.wav")
        setBackground("Ball.JPG")
        createTextfield("You stole a Snickers bar and got sentenced to the \nPORN HOUSE. You have arrived at the house, what will you do?")
        createButton("exit", "Run away from the porn house, your existence is not worth it.")
        createButton("entrance", "Enter the porn house, accept your fate.")
    end
    if(aName == "entrance") then
        if(entered == false) then
            playSound("door.wav")
            entered = true;
        else
            playSound("Badtobone.wav")
        end
        CLS();
        setBackground("Inside.JPG");
        createTextfield("You've entered the empty corridor, it smells like fish.")
        createButton("leftHallway", "Go to the hallway on your left");
        createButton("rightHallway", "Go to the hallway on your right")
        createButton("upStairs", "go up the stairs")
    end
    if(aName == "leftHallway") then
        playSound("Badtobone.wav")
        CLS();
        setBackground("Unclejim.jpg")
        createTextfield("You stumble upon a weird room, why is Uncle Jim here? \n He is wanking it old school style.")
        createButton("entrance", "RUN");
        if(hasSpell == false) then
            createButton("searchBooks", "Join him.")
        end
    end
    if(aName == "searchBooks") then
        CLS();
        playSound("pageFlip.wav")
        createTextfield("You joined Uncle Jim, you feel power surge through your veins.")
        createButton("entrance", "You go back to the main hall")
        hasSpell = true;
    end
    if(aName == "rightHallway") then
        CLS()
        playSound("Badtobone.wav")
        setBackground("Milkshake.jpg")
        if(castSpellLib == true) then
            createTextfield("You spot a milkshake on the table, it looks to be vanilla!")
        else
            createTextfield("You spot a milkshake on the table, it looks to be vanilla!")
        end
        
        createButton("entrance", "Take a sip! Yummy yummy yummy!")
        if(hasSpell == true and castSpellLib == false) then
            createButton("rightHallwaySpell", "not again")
        end
    end
    if(aName == "rightHallwaySpell") then
        CLS()
        createTextfield("it's not milkshake")
        castSpellLib = true;
        createButton("entrance", "what have you done")
    end
    if(aName == "upStairs") then
        CLS()
        playSound("Badtobone.wav")
        if(hasSpell == true and castSpellLib == true) then
            setBackground("Adolfin.jpg")
            createTextfield("You drank my home made sauce, haha!")
            createButton("exit", "You drank the sauce, why wasn't it milkshake?")
        else
            setBackground("Joebiden.jpg")
            createTextfield("SODAAAAAAAAAAAAAA!!!!!!!!")
            createButton("exit", "Hit the griddy old school style.")
            playSound("soda.wav")
        end
    end
    if(aName == "exit") then
        setBackground("Drone.jpg") -- Change this to the path of your new image
        exitGame();
		playSound("Explosion.wav")
    end
end
