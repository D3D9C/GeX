// Colors extension 

local ColorEx = {}

-- Create new color table 
function ColorEx.New( r, g, b, a )
    return { r or 255, g or 255, b or 255, a or 255 }
end

function ColorEx.Complementary( obj )
    return 255 - obj[ 1 ], 255 - obj[ 2 ], 255 - obj[ 3 ], a and obj[ 4 ] or 255
end

-- Support for HEX, RGB, VEC, BIT formats 
local HexPattern = "#%02X%02X%02X"
local VecPattern = "%G %G %G"

-- Basic methods 
function ColorEx.Rgb2Vec( r, g, b, a ) 
    return r / 255, g / 255, b / 255, a and ( a / 255 ) or 1
end

function ColorEx.RgbToHex( r, g, b )
    return string.format( HexPattern, r, g, b )
end

-- RGB format 
function ColorEx.RgbObj2Vec( obj ) 
    return obj[ 1 ] / 255, obj[ 2 ] / 255, obj[ 3 ] / 255, obj[ 4 ] and ( obj[ 4 ] / 255 ) or 1
end

function ColorEx.RgbObj2VecObj( obj ) 
    return Vector( obj[ 1 ] / 255, obj[ 2 ] / 255, obj[ 3 ] / 255 ), obj[ 4 ] and ( obj[ 4 ] / 255 ) or 1
end

function ColorEx.RgbObj2ColObj( obj ) 
    return Color( obj[ 1 ], obj[ 2 ], obj[ 3 ], obj[ 4 ] or 255 )
end

function ColorEx.RgbObjToHex( obj )
    return string.format( HexPattern, obj[ 1 ], obj[ 2 ], obj[ 3 ] )
end

function ColorEx.RgbObjToStrVec( obj )
    return string.format( VecPattern, obj[ 1 ] / 255, obj[ 2 ] / 255, obj[ 3 ] / 255 ) 
end

-- Hex format 
function ColorEx.HexToRgb( hex )
    if not isstring( hex ) then return end 

    hex = string.sub( hex, 2, 7 ) 
    return tonumber( string.sub( hex, 1, 2 ), 16 ), tonumber( string.sub( hex, 3, 4 ), 16 ), tonumber( string.sub( hex, 5, 6 ), 16 )
end

-- Bit format 
function ColorEx.Decode( bnum )
    return bit.band( bit.rshift( bnum, 24 ), 0xFF ), bit.band( bit.rshift( bnum, 16 ), 0xFF ), bit.band( bit.rshift( bnum, 8 ), 0xFF ), bit.band( bnum, 0xFF )
end

function ColorEx.Encode( r, g, b, a )
    return bit.bor( bit.lshift( r, 24 ), bit.lshift( g, 16 ), bit.lshift( b, 8 ), a )
end
