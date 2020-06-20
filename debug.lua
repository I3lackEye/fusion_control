local component = require("component")
local thread = require("thread")
local reactor = component.nc_fusion_reactor

local nReactorFunctions = {}

function nReactorFunctions.checkState() end
--Will return true if the reactor is processing(on) or false if it is not processing(off)
--This function returns a boolean value (true or false)

function nReactorFunctions.checkEnergyLevel() end
--Will return the current energy level of the reactor
--This function returns a double (0.0100000)

function nReactorFunctions.checkHeatLevel() end
--Will return the current heat level of the reactor
--This function returns a double (0.0100000)

function nReactorFunctions.checkMaxHeatLevel() end
--Will return the maximum heat level of the reactor

function nReactorFunctions.checkEnergyChange() end
--Returns the power change

function nReactorFunctions.checkProcessHeat() end
--Returns the reactor's heat output in negative or positive

function nReactorFunctions.powerOutput() end
--Returns the power output of the reactor

function nReactorFunctions.currentStoredPower() end
--Returns the currently stored power

function nReactorFunctions.currentHeatLevel() end
--Returns the current heat level

function nReactorFunctions.firstFuel() end
--Returns the name of the current fuel being processed

function nReactorFunctions.remainingProcessTime() end
--Returns the remaining processing time for the current fuel type

function nReactorFunctions.efficiency() end
--Returns the efficiency of the current reactor setup

function nReactorFunctions.changeReactorState() end
--Will switch the reactor's active state

function nReactorFunctions.auto() end
--Will automate the reactor temperature and energy level monitoring

function nReactorFunctions.autoWithoutMainUI() end
--Will run the automation processes except that it will also display a very primitive UI

function nReactorFunctions.main() end
--This function should only be called if you do not want the primary GUI system.

function nReactorFunctions.checkState()
  return reactor.isProcessing()
end --end checkState

function nReactorFunctions.checkEnergyLevel()
  return reactor.getEnergyStored() / reactor.getMaxEnergyStored()
end --end checkEnergyLevel

function nReactorFunctions.checkHeatLevel()
  return reactor.getTemperature() / reactor.getMaxTemperature()
end --end cheackHeatLevel

function nReactorFunctions.checkEnergyChange() 
  return reactor.getEnergyChange()
end --end checkEnergyChange

function nReactorFunctions.checkProcessHeat()
  return reactor.getReactorProcessHeat()
end --end checkProcessHeat

function nReactorFunctions.powerOutput() 
  return reactor.getReactorProcessPower()
end --end powerOutput

function nReactorFunctions.currentStoredPower()
  return reactor.getEnergyStored()
end --end currentStoredPower

function nReactorFunctions.currentHeatLevel()
  return reactor.getTemperature()
end --end currentHeatLevel

function nReactorFunctions.firstFuel()
  return reactor.getFirstFusionFuel()
end --end fuelName

function nReactorFunctions.remainingProcessTime() 
  return reactor.getReactorProcessTime()
end --end remainingProcessTime

function nReactorFunctions.efficiency() 
  return reactor.getEfficiency()
end --end efficiency

function nReactorFunctions.changeReactorState()
  if nReactorFunctions.checkState() then
    reactor.deactivate()
  else
    reactor.activate()
  end
end --end changeReactorState

print(toint(reactor.getReactorProcessPower()))

