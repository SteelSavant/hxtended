package ext;

@:pure
class MathExt
{
    /**
        Max value of int; not guaranteed to be accurate
    **/

    public static inline function maxIntVal(math:Class<Math>): Int
    {
        return 2147483647;
    }
    
    /**
        Min value of int; not guaranteed to be accurate
    **/

    public static inline function minIntVal(math:Class<Math>):Int
    {
        return -2147483648;
    }

    /**
        Same as abs, but takes and returns an integer
    **/

    public static inline function iabs(math:Class<Math>, v:Int):Int
    {
        return v > 0 ? v : -v;
    }

    /**
        Same as max, but takes two integers and returns
        an integer
    **/

    public static inline function imax(math:Class<Math>, a:Int, b:Int):Int
    {
        return a - b > 0 ? a : b;
    }

    /**
        Same as min, but takes two integers and returns
        an integer
    **/

    public static inline function imin(math:Class<Math>, a:Int, b:Int):Int
    {
        return a - b > 0 ? b : a;
    }

    /**
        Forces the value [a] inside the ranges [min] and [max].
    **/

    public static inline function clamp(math:Class<Math>, a:Float, min:Float, max:Float)
    {
        return Math.max(Math.min(a, max), min);
    }

    /**
        Returns a random integer value between lower (inclusive)
        and upper (exclusive)
    **/

    public static inline function randomInt(math:Class<Math>,lower:Int, upper:Int):Int
    {
        return lower + Math.floor(Math.random() *  (upper - lower)); 
    }

    /**
        Returns a random boolean value
    **/

    public static inline function randomBool(math:Class<Math>):Bool
    {
        return Math.random() < 0.5;
    }

    public static inline function randomChoice<T>(math:Class<Math>, collection:Array<T>):T
    {
        return collection[randomInt(math, 0, collection.length)];
    }
    /**
        Returns 1 if passed value is positive, -1 
        if it is negative, and 0 otherwise.
    **/

    public static inline function sign(math:Class<Math>, v:Float):Int
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

    public static inline function approx(math:Class<Math>, a:Float, b:Float, epsilon:Float = 0.001):Bool
    {
        return Math.abs(a - b) < epsilon;
    }
}

@:pure
class IntExt
{
    /**
        Static extension for convenient integer division
    **/

    public static inline function div(a:Int, b:Int):Int
    {
        return Std.int(a / b);
    }

    /**
        Static extension for true modulo
    **/

    public static inline function mod(x:Int, n:Int):Int
    {
        return (x % n + n) % n;
    }
}

@:pure
class FloatExt
{
    /**
        Static extension for convenient integer division
    **/

    public static inline function div(a:Float, b:Float):Int
    {
        return Std.int(a / b);
    }
}