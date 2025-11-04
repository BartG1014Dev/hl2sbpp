---@class GMTable
---@field Name string The name of the gamemode
---@field Developer string The developer or team
---@field Homepage string Gamemode homepage URL
---@field Manual string? Optional manual path
---@field BaseClass GMTable? The parent gamemode table, used to call original functions
GM = {}

---Called when the gamemode is initialized.
function GM:Initialize() end

---Gives the default items to a player.
---@param pPlayer CBasePlayer
function GM:GiveDefaultItems(pPlayer) end

---Called when a player selects a spawn point.
---@param pPlayer CBasePlayer
---@return CBaseEntity
function GM:PlayerEntSelectSpawnPoint(pPlayer) end

---Determines if a weapon should respawn.
---@param pWeapon CBaseCombatWeapon
---@return boolean
function GM:WeaponShouldRespawn(pWeapon) end

---Determines if an item should respawn.
---@param pItem CBaseEntity
---@return boolean
function GM:ItemShouldRespawn(pItem) end

---Called when a player tries to pick up an object.
---@param pPlayer CBasePlayer
---@param pObject CBaseEntity
---@param bLimitMassAndSize boolean
---@return boolean
function GM:PlayerPickupObject(pPlayer, pObject, bLimitMassAndSize) end

---Called when a level designer–placed object is added.
---@param pEntity CBaseEntity
function GM:AddLevelDesignerPlacedObject(pEntity) end

---Determines if damage is allowed.
---@param pVictim CBaseEntity
---@param info CTakeDamageInfo
function GM:AllowDamage(pVictim, info) end

---Checks if a player can enter a vehicle.
---@param pPlayer CBasePlayer
---@param pVehicle CBaseEntity
---@param nRole integer
function GM:CanEnterVehicle(pPlayer, pVehicle, nRole) end

---Checks if the player can pick up an item.
---@param pPlayer CBasePlayer
---@param pItem CBaseEntity
---@return boolean
function GM:CanHavePlayerItem(pPlayer, pItem) end

---Determines if one player can hear another.
---@param pListener CBasePlayer
---@param pTalker CBasePlayer
---@param bProximity boolean
function GM:CanPlayerHearPlayer(pListener, pTalker, bProximity) end

---Called for cheat impulse commands.
---@param pPlayer CBasePlayer
---@param iImpulse integer
function GM:CheatImpulseCommands(pPlayer, iImpulse) end

---Checks chat for "ready" signals.
---@param pPlayer CBasePlayer
---@param chatmsg string
function GM:CheckChatForReadySignal(pPlayer, chatmsg) end

---Cleans up the map.
function GM:CleanUpMap() end

---Called when a client connects.
---@param pEntity CBaseEntity
---@param pszName string
---@param pszAddress string
---@param reject string
---@param maxrejectlen integer
function GM:ClientConnected(pEntity, pszName, pszAddress, reject, maxrejectlen) end

---Called when a client disconnects.
---@param pClient CBasePlayer
function GM:ClientDisconnected(pClient) end

---Gets the respawn time for an item.
---@param pItem CBaseEntity
---@return number
function GM:FlItemRespawnTime(pItem) end

---Called to compute player fall damage.
---@param pPlayer CBasePlayer
---@return number
function GM:FlPlayerFallDamage(pPlayer) end

---Gets the spawn time for a player.
---@param pPlayer CBasePlayer
---@return number
function GM:FlPlayerSpawnTime(pPlayer) end

---Checks if a player can respawn.
---@param pPlayer CBasePlayer
---@return boolean
function GM:FPlayerCanRespawn(pPlayer) end

---Checks if a player can take damage.
---@param pPlayer CBasePlayer
---@param pAttacker CBaseEntity
---@return boolean
function GM:FPlayerCanTakeDamage(pPlayer, pAttacker) end

---Determines if a player should switch to a weapon.
---@param pPlayer CBasePlayer
---@param pWeapon CBaseCombatWeapon
---@return boolean
function GM:FShouldSwitchWeapon(pPlayer, pWeapon) end

---Called when a player uses "say".
---@param pPlayer CBasePlayer
---@param p string
---@param teamonly boolean
function GM:Host_Say(pPlayer, p, teamonly) end

---Initializes the HUD for a player.
---@param pPlayer CBasePlayer
function GM:InitHUD(pPlayer) end

---Called when the map is initialized.
---@param strMapName string
---@param strMapEntities string
---@param strOldLevel string
---@param strLandmarkName string
---@param loadGame boolean
---@param background boolean
function GM:LevelInit(strMapName, strMapEntities, strOldLevel, strLandmarkName, loadGame, background) end

---Called when a player's network ID is validated.
---@param strUserName string
---@param strNetworkID string
function GM:NetworkIDValidated(strUserName, strNetworkID) end

---Checks if a listener can hear chat from a speaker.
---@param pListener CBasePlayer
---@param pSpeaker CBasePlayer
function GM:PlayerCanHearChat(pListener, pSpeaker) end

---Determines if an object can be picked up.
---@param pObject CBaseEntity
---@param massLimit number
---@param sizeLimit number
function GM:PlayerCanPickupObject(pObject, massLimit, sizeLimit) end

---Called when a player dies (for sounds).
---@param info CTakeDamageInfo
function GM:PlayerDeathSound(info) end

---Called while dead, controls respawn thinking.
---@param pPlayer CBasePlayer
function GM:PlayerDeathThink(pPlayer) end

---Called when a player picks up an item.
---@param pPlayer CBasePlayer
---@param pItem CBaseEntity
function GM:PlayerGotItem(pPlayer, pItem) end

---Called when a player initially spawns.
---@param pPlayer CBasePlayer
function GM:PlayerInitialSpawn(pPlayer) end

---Called when a player spawns.
---@param pPlayer CBasePlayer
function GM:PlayerSpawn(pPlayer) end

---Think function for players.
---@param pPlayer CBasePlayer
function GM:PlayerThink(pPlayer) end

---Removes a level designer–placed object.
---@param pEntity CBaseEntity
function GM:RemoveLevelDesignerPlacedObject(pEntity) end

---Restarts the game.
function GM:RestartGame() end

---Called when the server activates.
---@param edictCount integer
---@param clientMax integer
function GM:ServerActivate(edictCount, clientMax) end

---Determines if the server should be hidden.
---@return boolean
function GM:ShouldHideServer() end

---Gets the respawn spot for an item.
---@param pItem CBaseEntity
---@return Vector
function GM:VecItemRespawnSpot(pItem) end

---Gets the respawn angles for an item.
---@param pItem CBaseEntity
---@return QAngle
function GM:VecItemRespawnAngles(pItem) end

---Called when a weapon is equipped.
---@param pPlayer CBasePlayer
---@param pWeapon CBaseCombatWeapon
function GM:Weapon_Equip(pPlayer, pWeapon) end
return GMTable
