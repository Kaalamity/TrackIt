function TrackIt_OnLoad()
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage("TRACKIT - 0.1.1");
	end -- Basic "Print the thing" function
	
	createStatusBar();
end

function createStatusBar()
	MyStatusBar = CreateFrame("StatusBar", "MainStatusBar", TrackIt_StatusBarFrame)
	MyStatusBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	MyStatusBar:GetStatusBarTexture():SetHorizTile(false)
	MyStatusBar:SetMinMaxValues(0, 100)
	MyStatusBar:SetValue(0)
	MyStatusBar:SetWidth(200)
	MyStatusBar:SetHeight(10)
	MyStatusBar:SetPoint("CENTER",TrackIt_MainFrame,"CENTER")
	MyStatusBar:SetStatusBarColor(0,1,0)
end

local thisItemID

function TrackIt_CheckObject()
	if CursorHasItem() then
		tempCursorType, tempItemID, tempItemLink = GetCursorInfo();
		ClearCursor();
		if tempCursorType == "item" then
			print(tempCursorType.." ID: "..tempItemID.." || "..tempItemLink);
			tempItemNumber = GetItemCount(tempItemID, true);
			thisItemID = tempItemID;
			print("Currently In Inventory: "..tempItemNumber);
		
		end
		TrackIt_MainFrame:SetWidth(250);
		MainStatusBar:SetValue(tempItemNumber);
	end
end

function CheckItemUpdates()
	if thisItemID then
		tempItemNumber = GetItemCount(thisItemID, true);
		print("Currently In Inventory: "..tempItemNumber);
		MainStatusBar:SetValue(tempItemNumber);
	end
end
