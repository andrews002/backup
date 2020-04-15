unit ConexaoFirebirdU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, midasLib, FireDAC.Phys.SQLite;

type
  TConexaoFirebirdU = class
  private
    class var
      FInstancia: TConexaoFirebirdU;
      FDPhysFBDriverLink1: TFDPhysFBDriverLink;
      conFB: TFDConnection;
    procedure AfterConnect();
  strict private
    constructor Create();
    destructor Destroy(); override;
  public
    class function GetInstancia: TConexaoFirebirdU; static;
    class property Instancia: TConexaoFirebirdU read GetInstancia;
    class function GetConexao(tipo: string): TFDConnection;
  end;

implementation

{ TConexaoFirebirdU }

procedure TConexaoFirebirdU.AfterConnect();
begin

end;

constructor TConexaoFirebirdU.Create;
begin
  conFB := TFDConnection.Create(nil);

  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);

  conFB.DriverName := 'FB';
  conFB.Params.Values['Database'] := 'C:/Gescom/Banco/BDGESCOM.FDB';
  conFB.Params.Values['User_Name'] := 'SYSDBA';
  conFB.Params.Values['Password'] := 'masterkey';
  conFB.Params.Values['DriverID'] := 'FB';
//  conFB.Params.Values['Server'] := varCam.SERVER;
  conFB.UpdateOptions.LockWait := True;

end;

destructor TConexaoFirebirdU.Destroy;
begin
  if (Assigned(FDPhysFBDriverLink1)) then
  begin
    FreeAndNil(FDPhysFBDriverLink1);
  end;

  if (Assigned(conFB)) then
  begin
    FreeAndNil(conFB);
  end;

  inherited;
end;

class function TConexaoFirebirdU.GetConexao(tipo: string): TFDConnection;
begin
  if tipo = 'FB' then
  begin
    Result := conFB;
  end;
end;

class function TConexaoFirebirdU.GetInstancia: TConexaoFirebirdU;
begin
  if (not (Assigned(FInstancia))) then
    FInstancia := TConexaoFirebirdU.Create();

  Result := FInstancia;
end;

initialization

finalization
  if (Assigned(TConexaoFirebirdU.FInstancia)) then
    FreeAndNil(TConexaoFirebirdU.FInstancia);

end.

