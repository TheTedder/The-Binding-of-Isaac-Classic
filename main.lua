local mod = RegisterMod("The Binding of Isaac Classic", 1)

function mod:PostNewLevel()
    local game = Game()
    local level = game:GetLevel()
    local stage = level:GetStage()
    local stagetype = level:GetStageType()
    if stagetype == StageType.STAGETYPE_AFTERBIRTH then
        print("replacing stage")
        -- TODO: use the seed to calculate this
        level:SetStage(stage, StageType.STAGETYPE_ORIGINAL)
        -- This is a hack. If you don't do this then the room graphics don't update.
        game:ChangeRoom(level:GetStartingRoomIndex())
    end
end

mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, mod.PostNewLevel)