package ext;

abstract Lazy<T>(LazySlot<T>)
{
    private inline function new(slot:LazySlot<T>)
    {
        this = slot;
    }

    @:from static public inline function fromFunc<T>(f:()->T):Lazy<T>
    return new Lazy(Think(f));

    @:from static public inline function fromValue<T>(v:T):Lazy<T>
    return new Lazy(Value(v));

    @:to public inline function toValue():T 
    {
        return get();
    }

    @:to public inline function get():T
    {
        switch (this) 
        {
            case Think(f):
                var v = f();
                this = Value(v);
                return v;
            case Value(v): 
                return v;
        }
    }
    // Currently uses reflection and returns dynamic. Add back in
    // if static typing for field access becomes possible;
    // @:op(A.B) public inline function dotOp(access)
    // {
    //     return Reflect.field(get(), access);
    // }

}

//consider manually forwarding all fields so they return LazyArrays
@:forward() @:forwardStatics()
abstract LazyArray<T>(Array<Lazy<T>>)
{
    public function new()
    {
        this = new Array();
    }

    @:from static public inline function fromArray<T>(arr:Array<Lazy<T>>):LazyArray<T>
    {
        return cast arr;
    }

    @:arrayAccess public inline function read(index:Int):Lazy<T>
    {
        return this[index];
    }

    @:arrayAccess public inline function writeFunc(index:Int, func:()->T):Lazy<T>
    {
        this[index] = Lazy.fromFunc(func);
        return this[index];
    }

    @:arrayAccess public inline function writeValue(index:Int, value:T):Lazy<T>
    {
        this[index] = Lazy.fromValue(value);
        return this[index];
    }

    @:arrayAccess public inline function writeLazy(index:Int, lazy:Lazy<T>):Lazy<T>
    {
        this[index] = lazy;
        return this[index];
    }
}

enum LazySlot<T>
{
    Think(f:()->T);
    Value(v:T);
}