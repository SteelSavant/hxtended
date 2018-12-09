package ext;

using ext.MathExt;
using Lambda;

class LambdaExt
{
    /**
        Like filter, but also passes the index of the element being compared
    **/

    public static function filteri<T>(iter:Iterable<T>, fun:(index:Int, elem:T)->Bool):Array<T>
    {
        var arr = [];
        var i = 0;
        for(x in iter)
            if(fun(i++, x))
                arr.push(x);
        return arr;
    }

    /**
        Returns an array containing one of each element from source
        iter. Does not maintain a stable ordering.
    **/

    public static function unique<T:Dynamic>(iter:Iterable<T>):Array<T>
    {
        return LambdaIterator.array([for(x in iter) x=>true].keys());
    }
}

class LambdaIterator
{
    public static inline function array<T>(iter:Iterator<T>)
    {
        return [for(x in iter) x];
    }

    /**
        Returns an array containing all elements for which predicate
        fun returned true.
    **/

    public static function filter<T>(iter:Iterator<T>, fun:(elem:T)->Bool):Array<T>
    {
        var arr = [];
        while(iter.hasNext())
        {
            var next = iter.next();
            if(fun(next))
                arr.push(next);
        }
        return arr;
    }

    /**
        Like filter, but also passes the index of the element being compared
    **/

    public static function filteri<T>(iter:Iterator<T>, fun:(index:Int, elem:T)->Bool):Array<T>
    {
        var arr = [];
        var i = 0;
        while(iter.hasNext())
        {
            var next = iter.next();
            if(fun(i++, next))
                arr.push(next);
        }
        return arr;
    }

    /**
        Returns an array containing all elements mapped via fun
    **/

    public static function map<T, R>(iter:Iterator<T>, fun:(elem:T)->R):Array<R>
    {
        return [for(x in iter) fun(x)];
    }

    /**
        Like map, but also passes the index to be used while mapping
    **/

    public static function mapi<T, R>(iter:Iterator<T>, fun:(index:Int, elem:T)->R):Array<R>
    {
        var i = 0;
        return [for(x in iter) fun(i++, x)]; 
    }

    /**
        Returns an array containing one of each element from source
        iter. Does not maintain a stable ordering.
    **/

    public static function unique<T:Dynamic>(iter:Iterable<T>):Array<T>
    {
        return LambdaIterator.array([for(x in iter) x=>true].keys());
    }
}

class ArrayExt
{
    /**
        Removes the element at index and returns it. 
        Returns null if index exceeds the bounds of the array.
    **/

    public static function removeAt<T>(arr:Array<T>, index:Int):Null<T>
    {
        var temp = arr.splice(index, 1);
        return temp.empty() ? null : temp[0];
    }

    /**
        Shuffles the array in place.
    **/

    public static function shuffle<T>(arr:Array<T>)
    {
        for(x in 0...arr.length)
            swapAt(arr, x, Math.randomInt(x, arr.length));
    }

    
    /**
        Returns a shuffled copy of the array. Does not modify
        the original array.
    **/

    public static function shuffled<T>(arr:Array<T>):Array<T>
    {
        var temp = arr.copy();
        shuffle(temp);
        return temp;
    }

    /**
        Returns a reversed copy of the array. Does not modify
        the original array.
    **/

    public static function reversed<T>(arr:Array<T>):Array<T>
    {
        var temp = arr.copy();
        temp.reverse();
        return temp;
    }

    /**
        Returns a copy of the array, sorted by fun. Does not modify
        the original array.
    **/
    
    public static function sorted<T>(arr:Array<T>, fun:(T,T)->Int):Array<T>
    {
        var temp = arr.copy();
        temp.sort(fun);
        return temp;
    }

    /**
        Swaps the values in arr located at a and b. If
        a or b exceeds the bounds of the array, behaviour
        is undefined.
    **/

    public static function swapAt<T>(arr:Array<T>, a:Int, b:Int)
    {
        var tmp = arr[a];
        arr[a] = arr[b];
        arr[b] = tmp;
    }
}