// True math 
local MathEx = {}

local TickInterval = engine.TickInterval()

function MathEx.Average( nums )
    local sum = 0

    for i = 1, #nums do
        sum = sum + nums[ i ]
    end

    return sum / #nums
end

function MathEx.Remap( val, inmax, outmax )
    return math.ceil( val / inmax * outmax )
end

function MathEx.TimeToTicks( Time )
	return math.floor( 0.5 + Time / TickInterval )
end

function MathEx.TicksToTime( Ticks )
    return TickInterval * Ticks
end

function MathEx.RoundToTick( Time )
    return MathEx.TicksToTime( MathEx.TimeToTicks( Time ) )
end
