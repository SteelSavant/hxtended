package haxetended;

@:pure
class IntExt
{
    /**
        Static extension for convenient integer division
    **/

    public static function div(a:Int, b:Int):Int
    {
        return Std.int(a / b);
    }
}