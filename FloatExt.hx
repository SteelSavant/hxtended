@:pure
class Float
{
    /**
        Static extension for convenient integer division
    **/

    public static function div(a:Float, b:Float):Int
    {
        return Std.int(a / b);
    }
}