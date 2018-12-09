package haxetended;

@:pure
class MathExt
{
    /**
        Max value of int; not guaranteed to be accurate
    **/

    public static var INT_MAX: Int = 2147483647;
    
    /**
        Min value of int; not guaranteed to be accurate
    **/

    public static var INT_MIN: Int = -2147483648;

    /**
            Same as abs, but takes two integers and returns
            an integer
    **/

    public static function iabs(math:Class<Math>, a:Int, b:Int):Int
    {
        var tmp = a - b;
        return tmp > 0 ? tmp : -tmp;
    }

    /**
            Same as max, but takes two integers and returns
            an integer
    **/

    public static function imax(math:Class<Math>, a:Int, b:Int):Int
    {
        var tmp = a - b;
        return tmp > 0 ? a : b;
    }

    /**
            Same as min, but takes two integers and returns
            an integer
    **/

    public static function imin(math:Class<Math>, a:Int, b:Int):Int
    {
        var tmp = a - b;
        return tmp > 0 ? b : a;
    }

    /**
            Returns a random integer value between lower (inclusive)
            and upper (exclusive)
    **/

    public static function randomInt(math:Class<Math>,lower:Int, upper:Int):Int
    {
        var diff: Int = upper - lower;
        return lower + Math.floor(Math.random() * diff); 
    }

    /**
            Returns a random boolean value
    **/

    public static function randomBool(math:Class<Math>):Bool
    {
        return Math.random() < 0.5;
    }

    public static function randomChoice<T>(math:Class<Math>, collection:Array<T>)
    {
        return collection[randomInt(math, 0, collection.length)];
    }
    /**
            Returns 1 if passed value is positive, -1 
            if it is negative, and 0 otherwise.
    **/

    public static function sign(math:Class<Math>, v:Float):Int
    {
        return  
            if(v < 0)
                -1;
            else if(v > 0)
                1;
            else 0;
    }

    /**
            Returns true if both values are approximately equal 
            within the range of epsilon, false otherwise
    **/

    public static function approx(math:Class<Math>, a:Float, b:Float, epsilon:Float = 0.001):Bool
    {
        return Math.abs(a - b) < epsilon;
    }
}