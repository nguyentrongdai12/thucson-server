
function OnCreate(guild, creater)
   local strGuildName = GuildGetName(guild);
   local strCreater = GetUserNameByObjId(creater);
   BroadcastMedia(string.format(L("msg_guild_build"),strCreater,strGuildName),6);
end

--function OnToDestroy(guild)
--end

--function OnBeforeRealDestroy(guild)
--end

--function OnDestroyed(guild)
--end

--function OnUserJoined(guild)
--end

--function OnUserLeft(guild)
--end

--function OnHouseHoldUpdate(guild)
--end

--function OnLeaderChanged(guild)
--end

function OnLevelUp(guild, level)
    if level>=5 then
	local strGuildName = GuildGetName(guild);
        BroadcastMedia(string.format(L("msg_guild_levup"),strGuildName,level),6);
    end
end

function OnManagerDie(_user, official, _killer, reason)
    if official==4 and IsWarAreaLeader(1, _user) and IsUserPtr(_killer) then -- 是帮主 是城主 杀手是玩家
	    local strCityMaster = GetUserNameByObjId(PTR2OID(_user));
	    local strKiller = GetUserNameByObjId(PTR2OID(_killer));
        BroadcastMedia(string.format(L("msg_guildmaster_kill"),strCityMaster,strKiller),7);
    end
end
