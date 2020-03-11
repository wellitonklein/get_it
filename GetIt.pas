unit GetIt;

interface

uses
  GetIt.Interf,
  System.Generics.Collections;

type
  TGetIt = class(TInterfacedObject, IGetIt)
  private
    FInstances: TDictionary<string, TInterfacedObject>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IGetIt;
    function registerInstance(const value: TInterfacedObject): TInterfacedObject;
    function I(const value: TInterfacedObject): TInterfacedObject;
    function removeInstance(const value: TInterfacedObject): IGetIt;
  end;

implementation

uses
  System.SysUtils;

{ TGetIt }

constructor TGetIt.Create;
begin
  FInstances := TDictionary<string, TInterfacedObject>.Create;
end;

destructor TGetIt.Destroy;
begin
  FreeAndNil(FInstances);
  inherited;
end;

function TGetIt.I(const value: TInterfacedObject): TInterfacedObject;
begin
  FInstances.TryGetValue(value.ClassName, Result);
end;

class function TGetIt.New: IGetIt;
begin
  Result := Self.Create;
end;

function TGetIt.registerInstance(const value: TInterfacedObject): TInterfacedObject;
begin
  FInstances.AddOrSetValue(value.ClassName, value);
  Result := I(value);
end;

function TGetIt.removeInstance(const value: TInterfacedObject): IGetIt;
begin
  Result := Self;
  FInstances.Remove(value.ClassName);
end;

end.
