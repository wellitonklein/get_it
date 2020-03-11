unit GetIt.Interf;

interface

type

  IGetIt = interface
    ['{2473DBB5-7C03-4C3C-9217-3DBA54277F59}']
    function registerInstance(const value: TInterfacedObject): TInterfacedObject;
    function I(const value: TInterfacedObject): TInterfacedObject;
    function removeInstance(const value: TInterfacedObject): IGetIt;
  end;

implementation

end.
