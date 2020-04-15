unit OrcamentosU;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, ConexaoFirebirdU, generics.collections, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Funcoes, System.SysUtils, System.Classes, LogU;

type
  TItensOrcamento = class
  private
    FCDEMPRESA: integer;
    FNUMORC: integer;
    FCDITEMMERC: string;
    FNRSEQITEM: integer;
    FDATAENTREGA: TDate;
    FQTDEORC: Double;
    FVLRUNITORC: Double;
    FVLRUNITPRAZO: Double;
    FVALORFINAL: Double;
    FDESCITORC: Double;
    FACRESCITORC: Double;
    FUNIDORC: string;
    FPERCIPI: Double;
    FVALORIPI: Double;
    FDESTINO: string;
    FDESCMERC: string;
    FDESCMERCREDUZ: string;
    FSTITORC: string;
    FTIPOENTREGA: string;
    FTIPOPRECO: string;
    FOBSITEM: string;
    FSALDORESTANTE: Double;
    FPLACA: string;
  public
    property CDEMPRESA: integer read FCDEMPRESA write FCDEMPRESA;
    property NUMORC: integer read FNUMORC write FNUMORC;
    property CDITEMMERC: string read FCDITEMMERC write FCDITEMMERC;
    property NRSEQITEM: integer read FNRSEQITEM write FNRSEQITEM;
    property DATAENTREGA: TDate read FDATAENTREGA write FDATAENTREGA;
    property QTDEORC: Double read FQTDEORC write FQTDEORC;
    property VLRUNITORC: Double read FVLRUNITORC write FVLRUNITORC;
    property VLRUNITPRAZO: Double read FVLRUNITPRAZO write FVLRUNITPRAZO;
    property VALORFINAL: Double read FVALORFINAL write FVALORFINAL;
    property DESCITORC: Double read FDESCITORC write FDESCITORC;
    property ACRESCITORC: Double read FACRESCITORC write FACRESCITORC;
    property UNIDORC: string read FUNIDORC write FUNIDORC;
    property PERCIPI: Double read FPERCIPI write FPERCIPI;
    property VALORIPI: Double read FVALORIPI write FVALORIPI;
    property DESTINO: string read FDESTINO write FDESTINO;
    property DESCMERC: string read FDESCMERC write FDESCMERC;
    property DESCMERCREDUZ: string read FDESCMERCREDUZ write FDESCMERCREDUZ;
    property STITORC: string read FSTITORC write FSTITORC;
    property TIPOENTREGA: string read FTIPOENTREGA write FTIPOENTREGA;
    property TIPOPRECO: string read FTIPOPRECO write FTIPOPRECO;
    property OBSITEM: string read FOBSITEM write FOBSITEM;
    property SALDORESTANTE: Double read FSALDORESTANTE write FSALDORESTANTE;
    property PLACA: string read FPLACA write FPLACA;
  end;

type
  TOrcamento = class
  private
    FITENS: TObjectList<TItensOrcamento>;
    FCDEMPRESA: Integer;
    FSITUACAO: string;
    FNUMORC: Integer;
    FDTORC: TDate;
    FTMORC: TTime;
    FRESPREGORC: string;
    FDTTMREGORC: TDateTime;
    FCLIENTEORC: string;
    FCGCCPF: string;
    FRAZSOCORC: string;
    FINSCESTORC: string;
    FMUNICIPIOORC: string;
    FCDTRANSACAO: string;
    FDESCRICAOTRANSACAO: string;
    FPERCDESC: Double;
    FORDEMCOMPRA: string;
    FVLRVISTA: Double;
    FVLRPRAZO: Double;
    FFORMAPAGAMENTOORC: string;
    FPREVISAOENTREGA: TDate;
    FUFORC: string;
    FLOGORC: string;
    FNUMEROLOGORC: string;
    FCDVENDEDOR: string;
    FBAIRROORC: string;
    FFONEORC: string;
    FCEPORC: string;
    FVALORFRETEORC: Double;
    FREPRESENTANTE: string;
    FTRANSPORTADOR: string;
    FCDCONDICAO: string;
    FVALORDESCONTO: Double;
    FVEICULO: string;
    FKILOMETRAGEM: string;
    FMOTORISTA: string;
    FDESCVEICULO: string;
    FENDENT1: string;
    FENDENT2: string;
    FENDENT3: string;
    FPERCACRESCIMO: Double;
    FVALORACRESCIMO: Double;
    FCOMPLEMENTOPARCORC: string;
    FFORMAENTREGARORCAMENTO: string;
    FMENSAGEMORC: string;
  public
    property ITENS: TObjectList<TItensOrcamento> read FITENS write FITENS;
    property CDEMPRESA: Integer read FCDEMPRESA write FCDEMPRESA;
    property SITUACAO: string read FSITUACAO write FSITUACAO;
    property NUMORC: Integer read FNUMORC write FNUMORC;
    property DTORC: TDate read FDTORC write FDTORC;
    property TMORC: TTime read FTMORC write FTMORC;
    property RESPREGORC: string read FRESPREGORC write FRESPREGORC;
    property DTTMREGORC: TDateTime read FDTTMREGORC write FDTTMREGORC;
    property CLIENTEORC: string read FCLIENTEORC write FCLIENTEORC;
    property CGCCPF: string read FCGCCPF write FCGCCPF;
    property RAZSOCORC: string read FRAZSOCORC write FRAZSOCORC;
    property INSCESTORC: string read FINSCESTORC write FINSCESTORC;
    property MUNICIPIOORC: string read FMUNICIPIOORC write FMUNICIPIOORC;
    property CDTRANSACAO: string read FCDTRANSACAO write FCDTRANSACAO;
    property DESCRICAOTRANSACAO: string read FDESCRICAOTRANSACAO write FDESCRICAOTRANSACAO;
    property PERCDESC: Double read FPERCDESC write FPERCDESC;
    property ORDEMCOMPRA: string read FORDEMCOMPRA write FORDEMCOMPRA;
    property VLRVISTA: Double read FVLRVISTA write FVLRVISTA;
    property VLRPRAZO: Double read FVLRPRAZO write FVLRPRAZO;
    property FORMAPAGAMENTOORC: string read FFORMAPAGAMENTOORC write FFORMAPAGAMENTOORC;
    property PREVISAOENTREGA: TDate read FPREVISAOENTREGA write FPREVISAOENTREGA;
    property UFORC: string read FUFORC write FUFORC;
    property LOGORC: string read FLOGORC write FLOGORC;
    property NUMEROLOGORC: string read FNUMEROLOGORC write FNUMEROLOGORC;
    property CDVENDEDOR: string read FCDVENDEDOR write FCDVENDEDOR;
    property BAIRROORC: string read FBAIRROORC write FBAIRROORC;
    property FONEORC: string read FFONEORC write FFONEORC;
    property CEPORC: string read FCEPORC write FCEPORC;
    property VALORFRETEORC: Double read FVALORFRETEORC write FVALORFRETEORC;
    property REPRESENTANTE: string read FREPRESENTANTE write FREPRESENTANTE;
    property TRANSPORTADOR: string read FTRANSPORTADOR write FTRANSPORTADOR;
    property CDCONDICAO: string read FCDCONDICAO write FCDCONDICAO;
    property VALORDESCONTO: Double read FVALORDESCONTO write FVALORDESCONTO;
    property VEICULO: string read FVEICULO write FVEICULO;
    property KILOMETRAGEM: string read FKILOMETRAGEM write FKILOMETRAGEM;
    property MOTORISTA: string read FMOTORISTA write FMOTORISTA;
    property DESCVEICULO: string read FDESCVEICULO write FDESCVEICULO;
    property ENDENT1: string read FENDENT1 write FENDENT1;
    property ENDENT2: string read FENDENT2 write FENDENT2;
    property ENDENT3: string read FENDENT3 write FENDENT3;
    property PERCACRESCIMO: Double read FPERCACRESCIMO write FPERCACRESCIMO;
    property VALORACRESCIMO: Double read FVALORACRESCIMO write FVALORACRESCIMO;
    property COMPLEMENTOPARCORC: string read FCOMPLEMENTOPARCORC write FCOMPLEMENTOPARCORC;
    property FORMAENTREGARORCAMENTO: string read FFORMAENTREGARORCAMENTO write FFORMAENTREGARORCAMENTO;
    property MENSAGEMORC: string read FMENSAGEMORC write FMENSAGEMORC;
  end;

type
  TPesqOrcamento = class
  private
    class var
      fdqAux, fdqAux2: TFDQuery;
  public
    class function GravaOrcamento(orcamento: TOrcamento): Boolean; static;
  end;

implementation

{ TPesqCor }

uses
  Vcl.Dialogs;

class function TPesqOrcamento.GravaOrcamento(orcamento: TOrcamento): Boolean;
var
  con: TConexaoFirebirdU;
  conec: TFDConnection;
  item: TItensOrcamento;
begin
  con := TConexaoFirebirdU.GetInstancia;
  conec := con.GetConexao('FB');

  try
    try
      fdqAux := TFDQuery.Create(nil);
      fdqAux.Connection := conec;

      {<-------------- Grava Corpo Orçamento -------------->}
      fdqAux.Close;
      fdqAux.SQL.Clear;
      fdqAux.SQL.Add('UPDATE OR INSERT INTO TBCORPOORCAMENTO');
      fdqAux.SQL.Add('(CDEMPRESA, SITUACAO, NUMORC, DTORC, TMORC, RESPREGORC, DTTMREGORC, CLIENTEORC, CGCCPF, RAZSOCORC, INSCESTORC,');
      fdqAux.SQL.Add('MUNICIPIOORC, CDTRANSACAO, DESCRICAOTRANSACAO, PERCDESC, ORDEMCOMPRA, VLRVISTA, VLRPRAZO, FORMAPAGAMENTOORC, PREVISAOENTREGA, UFORC, LOGORC, NUMEROLOGORC,');
      fdqAux.SQL.Add('CDVENDEDOR, BAIRROORC, FONEORC, CEPORC, VALORFRETEORC, REPRESENTANTE, TRANSPORTADOR, CDCONDICAO, VALORDESCONTO,');
      fdqAux.SQL.Add('VEICULO, KILOMETRAGEM, MOTORISTA, DESCVEICULO, ENDENT1, ENDENT2, ENDENT3, PERCACRESCIMO, VALORACRESCIMO, COMPLEMENTOPARCORC, FORMAENTREGARORCAMENTO, MENSAGEMORC');
      fdqAux.SQL.Add(')');
      fdqAux.SQL.Add('VALUES (:CDEMPRESA, :SITUACAO, :NUMORC, :DTORC, :TMORC, :RESPREGORC, :DTTMREGORC,  :CLIENTEORC, :CGCCPF, :RAZSOCORC, :INSCESTORC, :MUNICIPIOORC, :CDTRANSACAO, :DESCRICAOTRANSACAO, :PERCDESC, :ORDEMCOMPRA, :VLRVISTA, :VLRPRAZO, ');
      fdqAux.SQL.Add(':FORMAPAGAMENTOORC, :PREVISAOENTREGA, :UFORC, :LOGORC, :NUMEROLOGORC,  ');
      fdqAux.SQL.Add(':CDVENDEDOR, :BAIRROORC, :FONEORC, :CEPORC, :VALORFRETEORC, :REPRESENTANTE, :TRANSPORTADOR, :CDCONDICAO, :VALORDESCONTO,');
      fdqAux.SQL.Add(':VEICULO, :KILOMETRAGEM, :MOTORISTA, :DESCVEICULO, :ENDENT1, :ENDENT2, :ENDENT3, :PERCACRESCIMO, :VALORACRESCIMO, :COMPLEMENTOPARCORC, :FORMAENTREGARORCAMENTO, :MENSAGEMORC');
      fdqAux.SQL.Add('  ) MATCHING (NUMORC, CDEMPRESA) ');
      fdqAux.ParamByName('CDEMPRESA').AsInteger := orcamento.CDEMPRESA;
      fdqAux.ParamByName('SITUACAO').AsString := 'E';
      fdqAux.ParamByName('NUMORC').AsInteger := orcamento.NUMORC;
      fdqAux.ParamByName('DTORC').AsDate := Now;
      fdqAux.ParamByName('TMORC').AsString := Trim(FormatDateTime('tt', Now));
      fdqAux.ParamByName('RESPREGORC').AsString := orcamento.RESPREGORC;
      fdqAux.ParamByName('DTTMREGORC').AsDateTime := StrToDateTime(FormatDateTime('c', Now));
      fdqAux.ParamByName('CLIENTEORC').AsString := orcamento.CLIENTEORC;
      fdqAux.ParamByName('CGCCPF').AsString := orcamento.CGCCPF;
      fdqAux.ParamByName('RAZSOCORC').AsString := orcamento.RAZSOCORC;
      fdqAux.ParamByName('INSCESTORC').AsString := orcamento.INSCESTORC;
      fdqAux.ParamByName('MUNICIPIOORC').AsString := orcamento.MUNICIPIOORC;
      fdqAux.ParamByName('CDTRANSACAO').AsString := orcamento.CDTRANSACAO;
      fdqAux.ParamByName('DESCRICAOTRANSACAO').AsString := orcamento.DESCRICAOTRANSACAO;
      fdqAux.ParamByName('PERCDESC').AsFloat := orcamento.PERCDESC;
      fdqAux.ParamByName('ORDEMCOMPRA').AsString := 'VERBAL';
      fdqAux.ParamByName('VLRVISTA').AsFloat := orcamento.VLRVISTA;
      fdqAux.ParamByName('VLRPRAZO').AsFloat := orcamento.VLRPRAZO;
      fdqAux.ParamByName('FORMAPAGAMENTOORC').AsString := orcamento.FORMAPAGAMENTOORC;
      fdqAux.ParamByName('PREVISAOENTREGA').AsDate := orcamento.PREVISAOENTREGA;
      fdqAux.ParamByName('UFORC').AsString := orcamento.UFORC;
      fdqAux.ParamByName('LOGORC').AsString := orcamento.LOGORC;
      fdqAux.ParamByName('NUMEROLOGORC').AsString := orcamento.NUMEROLOGORC;
      fdqAux.ParamByName('CDVENDEDOR').AsString := '';
      fdqAux.ParamByName('BAIRROORC').AsString := orcamento.BAIRROORC;
      fdqAux.ParamByName('FONEORC').AsString := orcamento.FONEORC;
      fdqAux.ParamByName('CEPORC').AsString := orcamento.CEPORC;
      fdqAux.ParamByName('VALORFRETEORC').AsFloat := orcamento.VALORFRETEORC;
      fdqAux.ParamByName('REPRESENTANTE').AsString := orcamento.REPRESENTANTE;
      fdqAux.ParamByName('TRANSPORTADOR').AsString := orcamento.TRANSPORTADOR;
      fdqAux.ParamByName('CDCONDICAO').AsString := orcamento.CDCONDICAO;
      fdqAux.ParamByName('VALORDESCONTO').AsFloat := orcamento.VALORDESCONTO;
      fdqAux.ParamByName('VEICULO').AsString := orcamento.VEICULO;
      fdqAux.ParamByName('KILOMETRAGEM').AsString := orcamento.KILOMETRAGEM;
      fdqAux.ParamByName('MOTORISTA').AsString := orcamento.MOTORISTA;
      fdqAux.ParamByName('DESCVEICULO').AsString := orcamento.DESCVEICULO;
      fdqAux.ParamByName('ENDENT1').AsString := orcamento.ENDENT1;
      fdqAux.ParamByName('ENDENT2').AsString := orcamento.ENDENT2;
      fdqAux.ParamByName('ENDENT3').AsString := orcamento.ENDENT3;
      fdqAux.ParamByName('PERCACRESCIMO').AsFloat := orcamento.PERCACRESCIMO;
      fdqAux.ParamByName('VALORACRESCIMO').AsFloat := orcamento.VALORACRESCIMO;
      fdqAux.ParamByName('COMPLEMENTOPARCORC').AsString := orcamento.COMPLEMENTOPARCORC;
      fdqAux.ParamByName('FORMAENTREGARORCAMENTO').AsString := orcamento.FORMAENTREGARORCAMENTO;
      fdqAux.ParamByName('MENSAGEMORC').AsString := orcamento.MENSAGEMORC;
      fdqAux.ExecSQL;

      {<-------------- Grava Itens Existentes Orçamento -------------->}
      fdqAux2.Close;
      fdqAux2.SQL.Clear;
      fdqAux2.SQL.Add('DELETE FROM TBITEMORCAMENTO WHERE NUMORC = :NUMORC');
      fdqAux2.ParamByName('NUMORC').AsInteger := orcamento.NUMORC;
      fdqAux2.ExecSQL();

      {<-------------- Grava Itens Orçamento -------------->}
      item := TItensOrcamento.Create;

      for item in itens do
      begin
        fdqAux2.SQL.Clear;
        fdqAux2.SQL.Add('INSERT INTO TBITEMORCAMENTO                                       ');
        fdqAux2.SQL.Add('(  CDEMPRESA, NUMORC, CDITEMMERC, NRSEQITEM, DATAENTREGA,         ');
        fdqAux2.SQL.Add('   QTDEORC, VLRUNITORC, VLRUNITPRAZO, VALORFINAL, DESCITORC,      ');
        fdqAux2.SQL.Add('   ACRESCITORC, UNIDORC, PERCIPI, VALORIPI, DESTINO,              ');
        fdqAux2.SQL.Add('   DESCMERC,DESCMERCREDUZ,STITORC, TIPOENTREGA, TIPOPRECO,        ');
        fdqAux2.SQL.Add('   OBSITEM, SALDORESTANTE, PLACA)                                 ');
        fdqAux2.SQL.Add('VALUES                                                            ');
        fdqAux2.SQL.Add('(  :CDEMPRESA, :NUMORC, :CDITEMMERC, :NRSEQITEM, :DATAENTREGA,    ');
        fdqAux2.SQL.Add('   :QTDEORC, :VLRUNITORC, :VLRUNITPRAZO, :VALORFINAL, :DESCITORC, ');
        fdqAux2.SQL.Add('   :ACRESCITORC, :UNIDORC, :PERCIPI, :VALORIPI, :DESTINO,         ');
        fdqAux2.SQL.Add('   :DESCMERC, :DESCMERCREDUZ, :STITORC, :TIPOENTREGA, :TIPOPRECO, ');
        fdqAux2.SQL.Add('   :OBSITEM, :SALDORESTANTE, :PLACA)                              ');
        fdqAux2.ParamByName('CDEMPRESA').AsInteger := item.CDEMPRESA;
        fdqAux2.ParamByName('NUMORC').AsInteger := item.NUMORC;
        fdqAux2.ParamByName('CDITEMMERC').AsString := item.CDITEMMERC;
        fdqAux2.ParamByName('NRSEQITEM').AsInteger := item.NRSEQITEM;
        fdqAux2.ParamByName('DATAENTREGA').AsDate := item.DATAENTREGA;
        fdqAux2.ParamByName('QTDEORC').AsFloat := item.QTDEORC;
        fdqAux2.ParamByName('VLRUNITORC').AsFloat := item.VLRUNITORC;
        fdqAux2.ParamByName('VLRUNITPRAZO').AsFloat := item.VLRUNITPRAZO;
        fdqAux2.ParamByName('VALORFINAL').AsFloat := item.VALORFINAL;
        fdqAux2.ParamByName('DESCITORC').AsFloat := item.DESCITORC;
        fdqAux2.ParamByName('ACRESCITORC').AsFloat := item.ACRESCITORC;
        fdqAux2.ParamByName('UNIDORC').AsString := item.UNIDORC;
        fdqAux2.ParamByName('PERCIPI').AsFloat := item.PERCIPI;
        fdqAux2.ParamByName('VALORIPI').AsFloat := item.VALORIPI;
        fdqAux2.ParamByName('DESTINO').AsString := item.DESTINO;
        fdqAux2.ParamByName('DESCMERC').AsString := item.DESCMERC;
        fdqAux2.ParamByName('DESCMERCREDUZ').AsString := item.DESCMERCREDUZ;
        fdqAux2.ParamByName('STITORC').AsString := item.STITORC;
        fdqAux2.ParamByName('TIPOENTREGA').AsString := item.TIPOENTREGA;
        fdqAux2.ParamByName('TIPOPRECO').AsString := item.TIPOPRECO;
        fdqAux2.ParamByName('OBSITEM').AsString := item.OBSITEM;
        fdqAux2.ParamByName('SALDORESTANTE').AsFloat := item.SALDORESTANTE;
        fdqAux2.ParamByName('PLACA').AsString := item.PLACA;
        fdqAux2.ExecSQL;
      end;

      Result := True;

    finally
      fdqAux.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
      ShowMessage(E.ClassName + ' error raised, with message : ' + E.Message);
      Result := False;
    end;
  end;
end;

end.

