unit Orcamentos;

interface

uses
  Winapi.Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, DBCtrls, FuncoesGlobal,
  XMLIntf, XMLDoc, msxmldom, Variants, xmldom, Provider, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Phys.FBDef, Assina_XML_TLB,
  rImprovedComps, rDBGrid, scGPExtControls, Vcl.Mask, scGPControls,
  scExtControls, scGPPagers, scControls, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  PesquisaItens, frxClass, frxDBSet, Recarregar, PesquisaClientes, frxExportPDF,
  scImageCollection, scGPImages, Vcl.ImgList, scDrawUtils, PesquisaItensEstoque,
  PedidosObservacao, AtGlobal, System.Generics.Collections, Datasnap.DBClient,
  frmImagemComponente, ObservacaoCliente, MenuPrincipal, OrcamentosU;

type
  TfOrcamentos = class(TForm)
    scGPPanel2: TscGPPanel;
    lblCaption: TLabel;
    scGPPanel3: TscGPPanel;
    PnRodape: TscGPPanel;
    scGPPanel1: TscGPPanel;
    btnSair: TscGPButton;
    fdmItens: TFDMemTable;
    DataSource1: TDataSource;
    btnLimpar: TscGPButton;
    btnFinalizar: TscGPButton;
    scgplbl7: TscGPLabel;
    edtFinal: TscGPEdit;
    fdmParcelas: TFDMemTable;
    DataSource2: TDataSource;
    scGPPageControl1: TscGPPageControl;
    scGPPageControlPage1: TscGPPageControlPage;
    scGPPanel4: TscGPPanel;
    scGPPanel5: TscGPPanel;
    scGPLabel9: TscGPLabel;
    edtDataEntrega: TscGPDateEdit;
    scGPPanel10: TscGPPanel;
    scGPPanel11: TscGPPanel;
    rGroupBox3: TrGroupBox;
    rGroupBox4: TrGroupBox;
    scGPPanel12: TscGPPanel;
    scGPLabel5: TscGPLabel;
    edtDescricao: TscGPEdit;
    scGPLabel12: TscGPLabel;
    edtValor: TscGPEdit;
    scGPLabel13: TscGPLabel;
    edtQuantidade: TscGPEdit;
    edtTotal: TscGPEdit;
    scGPLabel14: TscGPLabel;
    edtPlaca: TscGPEdit;
    scgplbl1: TscGPLabel;
    scgplbl2: TscGPLabel;
    edtNota: TscGPEdit;
    edtCodigo: TscGPEdit;
    scGPLabel17: TscGPLabel;
    rGroupBox5: TrGroupBox;
    scGPPanel13: TscGPPanel;
    btnExcluir: TscGPButton;
    btnAlterar: TscGPButton;
    btnIncluir: TscGPButton;
    scGPPageControlPage2: TscGPPageControlPage;
    scGPPanel6: TscGPPanel;
    scGPPanel7: TscGPPanel;
    scGPLabel19: TscGPLabel;
    edtSeq: TscGPEdit;
    scGPLabel20: TscGPLabel;
    edtNumOrc: TscGPEdit;
    btnObservacoes_Itens: TscGPButton;
    scGPImage1: TscGPImage;
    pn1: TscGPPanel;
    pn2: TscGPPanel;
    scGPLabel25: TscGPLabel;
    edtCodigoCliente: TscGPEdit;
    scGPLabel26: TscGPLabel;
    edtNomeCliente: TscGPEdit;
    scGPButton1: TscGPButton;
    edtNumeroLogradouro: TscGPEdit;
    scGPLabel30: TscGPLabel;
    scGPLabel27: TscGPLabel;
    edtIE: TscGPEdit;
    edtCNPJ: TscGPEdit;
    lblCNPJ: TscGPLabel;
    lblIE: TscGPLabel;
    scGPLabel31: TscGPLabel;
    edtLogradouro: TscGPEdit;
    edtMunicipio: TscGPEdit;
    scGPLabel32: TscGPLabel;
    rbCNPJ: TRadioButton;
    rbCPF: TRadioButton;
    pn3: TscGPPanel;
    scGPLabel10: TscGPLabel;
    edtDesconto: TscGPEdit;
    scGPLabel16: TscGPLabel;
    scGPLabel11: TscGPLabel;
    scGPLabel7: TscGPLabel;
    btnRecarregar: TscGPButton;
    btnPesquisa: TscGPButton;
    rDBGrid1: TrDBGrid;
    rDBGrid2: TrDBGrid;
    scGPLabel6: TscGPLabel;
    edtBairro: TscGPEdit;
    scGPLabel8: TscGPLabel;
    edtTelefone: TscGPEdit;
    scGPLabel18: TscGPLabel;
    edtCEP: TscGPEdit;
    scGPLabel21: TscGPLabel;
    edtFrete: TscGPEdit;
    scGPLabel1: TscGPLabel;
    scGPLabel3: TscGPLabel;
    scGPLabel22: TscGPLabel;
    scGPLabel2: TscGPLabel;
    edtUF: TscGPComboEdit;
    scGPPageControlPage3: TscGPPageControlPage;
    pn4: TscGPPanel;
    pn5: TscGPPanel;
    scGPLabel40: TscGPLabel;
    scGPLabel57: TscGPLabel;
    edtPlacaTransporte: TscGPEdit;
    scGPLabel23: TscGPLabel;
    edtKM: TscGPEdit;
    scGPLabel24: TscGPLabel;
    edtMotorista: TscGPEdit;
    scGPLabel28: TscGPLabel;
    edtDescVeiculo: TscGPEdit;
    scGPLabel29: TscGPLabel;
    scGPLabel72: TscGPLabel;
    edtEndEntrega: TscGPEdit;
    scGPLabel73: TscGPLabel;
    edtNumEndEntrega: TscGPEdit;
    cbeUfEntrega: TscGPComboEdit;
    scGPLabel76: TscGPLabel;
    edtCidadeEndEntrega: TscGPEdit;
    scGPLabel75: TscGPLabel;
    edtBairroEndEntrega: TscGPEdit;
    scGPLabel74: TscGPLabel;
    scGPLabel33: TscGPLabel;
    cbeUnidade: TscGPComboEdit;
    scGPLabel34: TscGPLabel;
    scGPLabel35: TscGPLabel;
    edtAcrescimo: TscGPEdit;
    scGPLabel36: TscGPLabel;
    edtComplemento: TscGPEdit;
    scGPLabel37: TscGPLabel;
    btnCadastraCliente: TscGPButton;
    cbeEntregaOrcamento: TscGPComboEdit;
    scGPLabel38: TscGPLabel;
    edtDataEmissao: TscGPDateEdit;
    scGPLabel39: TscGPLabel;
    btnImagens: TscGPButton;
    fdmImagensComponentes: TFDMemTable;
    CaminhoImagem: TStringField;
    btnPecaForaEstoque: TscGPButton;
    scGPPageControlPage4: TscGPPageControlPage;
    edtMensagemPadrao: TscGPEdit;
    scGPLabel4: TscGPLabel;
    btnCadastrarMensagemPadrao: TscGPButton;
    scGPLabel15: TscGPLabel;
    edtTransacao: TscGPComboBox;
    cbbParcelas: TscGPComboBox;
    cbbFormaPagamento: TscGPComboBox;
    cbbRepresentante: TscGPComboBox;
    cbbTransportador: TscGPComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure rDBGrid1DblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbCPFClick(Sender: TObject);
    procedure rbCNPJClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure cbbFormaPagamentoChange(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure cbbParcelasExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnRecarregarClick(Sender: TObject);
    procedure btnPesquisaClienteClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure scGPPageControl1ChangePage(Sender: TObject);
    procedure btnObservacoes_ItensClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtFreteKeyPress(Sender: TObject; var Key: Char);
    procedure edtFreteExit(Sender: TObject);
    procedure edtDataEntregaExit(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure edtAcrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAcrescimoExit(Sender: TObject);
    procedure btnCadastraClienteClick(Sender: TObject);
    procedure btnImagensClick(Sender: TObject);
    procedure btnPecaForaEstoqueClick(Sender: TObject);
    procedure btnCadastrarMensagemPadraoClick(Sender: TObject);
  private
    { Private declarations }
    procedure calculaTotalFinal();
    procedure limparCampos(Parametro: integer);
    procedure cpfExibeCampos();
    procedure cnpjExibeCampos();
    procedure checarRadioButton();
    procedure reiniciar();
    procedure bloquearBotoes(boolIncluir, boolAlterar, boolExcluir: boolean);
    procedure acertaSequencia();
    procedure bloquearCampos(boolDescricao, boolPlaca, boolNota: boolean);
    procedure calculaValores;
    function retornaSubtotalGrade: Double;
    procedure MontaTransacao;
    procedure incluirItem;
    function montaObjCorpoOrcamento: TOrcamento;
    function montaObjItensOrcamento: TObjectList<TItensOrcamento>;
    procedure montaComboBox;
  public
    { Public declarations }

  end;

var
  fOrcamentos: TfOrcamentos;
  IntUltPecGID: Integer;
  verificaBarra: string;
  descBarra: string;
  resultPesquisa: TRetGridSelecionado;
  resultPesquisaCliente: TRetClienteSelecionado;
  resultPesquisaItensEstoque: TRetItSelecionado;
  numOrc: integer;
  boolIncluir, boolAlterar, boolExcluir: Boolean;
  sCaminhoReports, sLocalLogo: string;
  resultRecarregar: TObjectList<TRet>;
  numeroOrcamento: Integer;
  ie: string;
  listaItens: TObjectList<TItensOrcamento>;
  item: TItensOrcamento;
  orcamento: TOrcamento;

implementation

uses
  OperacoesOrcamento, PesquisaValorCarroForaEstoqueGID;


{$R *.dfm}

procedure TfOrcamentos.btnExcluirClick(Sender: TObject);
begin
  if (fdmItens.Fields[1].AsString = '') then
  begin
    ShowMessage('Não há registros para excluir!');
  end
  else
  begin
    fdmItens.Delete;
    acertaSequencia;
    limparCampos(1);
    calculaTotalFinal;
  end;
  btnPecaForaEstoque.Enabled := False;
end;

function tfOrcamentos.retornaSubtotalGrade: Double;
var
  subTotal: Double;
begin
  subTotal := 0;
  fdmItens.First;
  while not fdmItens.Eof do
  begin
    subTotal := fdmItens.FieldByName('SUBTOTAL').AsFloat + subTotal;
    fdmItens.Next;
  end;
  Result := subTotal;
end;

function TfOrcamentos.montaObjItensOrcamento: TObjectList<TItensOrcamento>;
begin
  fdmItens.First;
  listaItens := TObjectList<TItensOrcamento>.Create;
  while not fdmItens.Eof do
  begin
    item := TItensOrcamento.Create;
    fMenuPrincipal.QryItensOrcamento.SQL.Add('       PLACA)');
    item.CDEMPRESA := StrToInt(strFilial);
    item.NUMORC := numeroOrcamento;
    item.CDITEMMERC := Copy(Trim(fdmItens.FieldByName('CODIGO').AsString), 1, 20);
    item.NRSEQITEM := fdmItens.FieldByName('SEQ').AsInteger;
    item.DATAENTREGA := edtDataEntrega.Date;
    item.QTDEORC := fdmItens.FieldByName('QTDE').AsFloat;
    item.VLRUNITORC := fdmItens.FieldByName('VALOR').AsFloat;
    item.VLRUNITPRAZO := fdmItens.FieldByName('VALOR').AsFloat;
    item.VALORFINAL := fdmItens.FieldByName('SUBTOTAL').AsFloat;
    item.DESCITORC := fdmItens.FieldByName('RATDESCITEM').AsFloat;
    item.ACRESCITORC := fdmItens.FieldByName('RATACRESITEM').AsFloat;
    item.UNIDORC := Copy(Trim(fdmItens.FieldByName('UN').AsString), 1, 3);
    item.PERCIPI := 0;
    item.VALORIPI := 0;
    item.DESTINO := 'U';
    item.DESCMERC := Copy(Trim(fdmItens.FieldByName('DESCRICAO').AsString), 1, 130);
    item.DESCMERCREDUZ := Copy(Trim(fdmItens.FieldByName('DESCRICAO').AsString), 1, 29);
    item.STITORC := 'R';
    item.TIPOENTREGA := 'R';
    item.TIPOPRECO := 'V';
    item.OBSITEM := Copy(Trim(fdmItens.FieldByName('OBSERVACOES').AsString), 1, 80);
    item.SALDORESTANTE := 0;
    item.PLACA := Trim(fdmItens.FieldByName('PLACA').AsString);
    listaItens.Add(item);
    fdmItens.Next;
  end;
  Result := listaItens;
end;

function TfOrcamentos.montaObjCorpoOrcamento: TOrcamento;
begin
  orcamento := TOrcamento.Create;
  orcamento.ITENS := montaObjItensOrcamento;
  orcamento.CDEMPRESA := StrToInt(StrFilial);
  orcamento.SITUACAO := 'E';
  orcamento.NUMORC := numeroOrcamento;
  orcamento.DTORC := Now;
  orcamento.TMORC := Trim(FormatDateTime('tt', Now));
  orcamento.RESPREGORC := Trim(stratdUsuario);
  orcamento.DTTMREGORC := StrToDateTime(FormatDateTime('c', Now));
  orcamento.CLIENTEORC := Copy(Trim(UpperCase(edtCodigoCliente.Text)), 1, 20);
  orcamento.CGCCPF := Copy(Trim(edtCNPJ.Text), 1, 20);
  orcamento.RAZSOCORC := Copy(Trim(UpperCase(edtNomeCliente.Text)), 1, 60);
  orcamento.INSCESTORC := Copy(Trim(UpperCase(edtIE.Text)), 1, 20);
  orcamento.MUNICIPIOORC := Copy(Trim(UpperCase(edtMunicipio.Text)), 1, 60);

  if edtTransacao.ItemIndex <> -1 then
  begin
    orcamento.CDTRANSACAO := Copy(Trim(UpperCase(edtTransacao.Items[edtTransacao.ItemIndex].Detail)), 1, 50);
    orcamento.DESCRICAOTRANSACAO := Copy(Trim(UpperCase(edtTransacao.Items[edtTransacao.ItemIndex].Caption)), 1, 50);
  end;

  orcamento.PERCDESC := StrToFloat(edtDesconto.Text);
  orcamento.ORDEMCOMPRA := 'VERBAL';
  orcamento.VLRVISTA := StrToFloat(edtFinal.Text);
  orcamento.VLRPRAZO := StrToFloat(edtFinal.Text);

  if cbbFormaPagamento.ItemIndex <> -1 then
    orcamento.FORMAPAGAMENTOORC := Trim(UpperCase(cbbFormaPagamento.Items[cbbFormaPagamento.ItemIndex].Caption));

  orcamento.PREVISAOENTREGA := edtDataEntrega.Date;
  orcamento.UFORC := Copy(Trim(edtUF.Text), 1, 2);
  orcamento.LOGORC := Copy(Trim(edtLogradouro.Text), 1, 60);
  orcamento.NUMEROLOGORC := Copy(Trim(edtNumeroLogradouro.Text), 1, 10);
  orcamento.CDVENDEDOR := '';
  orcamento.BAIRROORC := Copy(Trim(edtBairro.Text), 1, 30);
  orcamento.FONEORC := Copy(Trim(edtTelefone.Text), 1, 12);
  orcamento.CEPORC := Copy(Trim(edtCEP.Text), 1, 9);
  orcamento.VALORFRETEORC := StrToFloat(edtFrete.Text);

  if cbbRepresentante.ItemIndex <> -1 then
    orcamento.REPRESENTANTE := Copy(Trim(cbbRepresentante.Items[cbbRepresentante.ItemIndex].Caption), 1, 20);

  if cbbTransportador.ItemIndex <> -1 then
    orcamento.TRANSPORTADOR := Copy(Trim(cbbTransportador.Items[cbbTransportador.ItemIndex].Caption), 1, 20);

  if cbbParcelas.ItemIndex <> -1 then
    orcamento.CDCONDICAO := Copy(Trim(cbbParcelas.Items[cbbParcelas.ItemIndex].Detail), 1, 5);

  orcamento.VALORDESCONTO := ((retornaSubtotalGrade * StrToFloat(edtDesconto.Text)) / 100);
  orcamento.VEICULO := Trim(edtPlaca.Text);
  orcamento.KILOMETRAGEM := Trim(edtKM.Text);
  orcamento.MOTORISTA := Trim(edtMotorista.Text);
  orcamento.DESCVEICULO := Trim(edtDescVeiculo.Text);
  orcamento.ENDENT1 := Trim(edtLogradouro.Text) + ' ' + Trim(edtNumeroLogradouro.Text);
  orcamento.ENDENT2 := Trim(edtBairroEndEntrega.Text);
  orcamento.ENDENT3 := Trim(edtCidadeEndEntrega.Text);
  orcamento.PERCACRESCIMO := StrToFloat(edtAcrescimo.Text);
  orcamento.VALORACRESCIMO := ((retornaSubtotalGrade * strtofloat(edtAcrescimo.Text)) / 100);
  orcamento.COMPLEMENTOPARCORC := Trim(edtComplemento.Text);

  if cbeEntregaOrcamento.Text = 'PRESENCIAL' then
    orcamento.FORMAENTREGARORCAMENTO := 'P'
  else if cbeEntregaOrcamento.Text = 'REMOTA' then
    orcamento.FORMAENTREGARORCAMENTO := 'P';

  orcamento.MENSAGEMORC := Trim(edtMensagemPadrao.Text);

  Result := orcamento;
end;

procedure TfOrcamentos.btnFinalizarClick(Sender: TObject);
begin
  if edtTransacao.ItemIndex = -1 then
  begin
    ShowMessage('Escolha a transação');
    edtTransacao.SetFocus;
    Exit;
  end;

  if (fdmItens.Fields[1].AsString = '') then
  begin
    ShowMessage('Adicione ao menos um item!');
    edtCodigo.SetFocus;
    Exit;
  end;

  if (StrToFloat(edtFinal.Text) = 0) then
  begin
    ShowMessage('Total não pode ser zero!');
    edtCodigo.SetFocus;
    Exit;
  end;

  if (edtNomeCliente.Text = '') then
  begin
    ShowMessage('Adicione um cliente!');
    edtNomeCliente.SetFocus;
    Exit;
  end;

  if (cbbFormaPagamento.ItemIndex = -1) then
  begin
    ShowMessage('Preencha a forma de pagamento!');
    cbbFormaPagamento.SetFocus;
    Exit;
  end;

  if edtNumOrc.Text = '' then
  begin
    fMenuPrincipal.QryOrcamentos.Close;
    fMenuPrincipal.QryOrcamentos.SQL.Clear;
    fMenuPrincipal.QryOrcamentos.SQL.Add('SELECT GEN_ID(GEN_ORCAMENTODIFERENTE, 1) FROM RDB$DATABASE FOR UPDATE WITH LOCK');
    fMenuPrincipal.QryOrcamentos.Open;
    numeroOrcamento := fMenuPrincipal.QryOrcamentos.FieldByName('GEN_ID').AsInteger;
    edtNumOrc.Text := IntToStr(numeroOrcamento);
  end
  else
  begin
    numeroOrcamento := StrToInt(edtNumOrc.Text);
  end;

  TPesqOrcamento.GravaOrcamento(orcamento);

  fOperacoesOrcamento := TfOperacoesOrcamento.Create(Self);
  fOperacoesOrcamento.ShowModal;
  FreeAndNil(fOperacoesOrcamento);
  fOrcamentos.reiniciar;
end;

procedure TfOrcamentos.btnLimparClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja mesmo limpar os campos?', 'Limpar?', mb_yesno + mb_iconquestion) = ID_YES then
  begin
    limparCampos(0);
    fdmItens.EmptyDataSet;
    fdmParcelas.EmptyDataSet;
  end;
end;

procedure TfOrcamentos.btnObservacoes_ItensClick(Sender: TObject);
begin
  fPedidosObservacao.ShowModal;
end;

procedure TfOrcamentos.btnPecaForaEstoqueClick(Sender: TObject);
begin
  Application.CreateForm(TfPesquisaValorVeiculoForaEstoqueGID, fPesquisaValorVeiculoForaEstoqueGID);
  fPesquisaValorVeiculoForaEstoqueGID.ShowModal;
end;

procedure TfOrcamentos.btnPesquisaClick(Sender: TObject);
var
  dblValor: Double;
begin
  limparCampos(1);
  if (strUsaGid = 'S') or (strUsaGidComp = 'S') then
  begin
    btnPecaForaEstoque.Enabled := False;
    fPesquisaItens.ShowModal;
    resultPesquisa := fPesquisaItens.retornaDadosPrincipal;
    if resultPesquisa.retCodigoPrincipal <> '' then
    begin
      edtDescricao.Text := resultPesquisa.retDescricaoPrincipal;
      tempDescricao := resultPesquisa.retDescPrincipal;
      tempDescOriginario := resultPesquisa.retDescPrincipal;
      edtNota.Text := resultPesquisa.retCodNotaPrincipal;
      tempPlaca := resultPesquisa.retPlacaPrincipal;
      edtCodigo.Text := resultPesquisa.retCodigoPrincipal;
      edtPlaca.Text := tempPlaca;
      dblValor := StrToFloat(resultPesquisa.retValorListaPrincipal);
      if dblValor <> 0 then
        edtValor.Text := FormatFloat('#0.00', dblValor);
      edtValor.SetFocus;
    end;
  end

  else
  begin
    Application.CreateForm(TfPesquisaItensEstoque, fPesquisaItensEstoque);
    fPesquisaItensEstoque.ShowModal;
    resultPesquisaItensEstoque := fPesquisaItensEstoque.retornaItemPrincipal;
    edtCodigo.Text := resultPesquisaItensEstoque.retCodigoItem;
    edtCodigoExit(Sender);
  end;
end;

procedure TfOrcamentos.btnPesquisaClienteClick(Sender: TObject);
var
  temp, ie: string;
begin
  limparCampos(2);
  Application.CreateForm(TfPesquisaClientes, fPesquisaClientes);
  fPesquisaClientes.ShowModal;
  resultPesquisaCliente := fPesquisaClientes.retornarClientePrincipal;

  temp := Trim(resultPesquisaCliente.retCNPJ);

  if (Length(temp) > 14) then
  begin
    rbCNPJ.Checked := True;
    rbCPF.Checked := False;
    cnpjExibeCampos;

  end;

  if (Length(temp) <= 14) then
  begin
    rbCPF.Checked := True;
    rbCNPJ.Checked := False;
    cpfExibeCampos;
  end;

  edtCodigoCliente.Text := resultPesquisaCliente.retCodigoCliente;
  edtNomeCliente.Text := resultPesquisaCliente.retRazaoSocial;
  edtCNPJ.Text := resultPesquisaCliente.retCNPJ;
  ie := resultPesquisaCliente.retIE;

  if rbCNPJ.Checked then
  begin
    if length(ie) = 11 then
      edtIE.Text := ie;
    if length(ie) < 11 then
    begin
      while pos('/', ie) <> 0 do
        delete(ie, pos('/', ie), 1);
      edtIE.Text := ie;
    end;
  end;

  edtMunicipio.Text := resultPesquisaCliente.retMunicipio;
  edtBairro.Text := resultPesquisaCliente.retBairroCliente;
  edtCEP.Text := resultPesquisaCliente.retCepCliente;
  edtTelefone.Text := resultPesquisaCliente.retTelefoneCliente;
  edtUF.Text := resultPesquisaCliente.retUF;
  edtLogradouro.Text := resultPesquisaCliente.retLogradouro;
  edtNumeroLogradouro.Text := resultPesquisaCliente.retNumeroLogradouro;
  edtComplemento.Text := resultPesquisaCliente.retComplementoLogradouroCliente;

  if resultPesquisaCliente.retObservacaoCliente <> '' then
  begin
    fObservacaoCliente := TfObservacaoCliente.Create(Self);
    fObservacaoCliente.mmoAviso.Text := trim(resultPesquisaCliente.retObservacaoCliente);
    fObservacaoCliente.ShowModal;
//  fEtiquetas.Free;
    FreeAndNil(fObservacaoCliente);
  end;

  edtDesconto.SetFocus;
end;

procedure TfOrcamentos.btnRecarregarClick(Sender: TObject);
var
  i, j: integer;
begin
  StrFilial := (PARAMSTR(1));

  Application.CreateForm(TfRecarregar, fRecarregar);
  fRecarregar.ShowModal;
  fdmItens.EmptyDataSet;
  fdmParcelas.EmptyDataSet;
  resultRecarregar := fRecarregar.retornarNumOrcPrincipal;
  numeroOrcamento := resultRecarregar.Items[0].NumOrc;

  fMenuPrincipal.QryOrcamentos.Close;
  fMenuPrincipal.QryOrcamentos.SQL.Clear;
  fMenuPrincipal.QryOrcamentos.SQL.Add('SELECT A.*, B.*, B.PLACA AS PLACAITEM FROM  TBCORPOORCAMENTO A');
  fMenuPrincipal.QryOrcamentos.SQL.Add('JOIN TBITEMORCAMENTO B');
  fMenuPrincipal.QryOrcamentos.SQL.Add('ON A.cdempresa = B.cdempresa');
  fMenuPrincipal.QryOrcamentos.SQL.Add(' WHERE A.cdempresa = :cdempresa AND A.numorc = :numorc  AND B.numorc = :numorc');
  fMenuPrincipal.QryOrcamentos.ParamByName('cdempresa').AsInteger := StrToInt(StrFilial);
  fMenuPrincipal.QryOrcamentos.ParamByName('numorc').AsInteger := numeroOrcamento;
  fMenuPrincipal.QryOrcamentos.Open;

  if (Length(fMenuPrincipal.QryOrcamentos.FieldByName('CGCCPF').AsString) > 14) then
  begin
    rbCNPJ.Checked := True;
    rbCPF.Checked := False;
    cnpjExibeCampos;

  end;

  if (Length(fMenuPrincipal.QryOrcamentos.FieldByName('CGCCPF').AsString) <= 14) then
  begin
    rbCPF.Checked := True;
    rbCNPJ.Checked := False;
    cpfExibeCampos;
  end;

  if (fMenuPrincipal.QryOrcamentos.FieldByName('INSCESTORC').AsString <> '') and (fMenuPrincipal.QryOrcamentos.FieldByName('INSCESTORC').AsString <> 'ISENTO') then
  begin
    edtCNPJ.Text := fMenuPrincipal.QryOrcamentos.FieldByName('CGCCPF').AsString;
    ie := fMenuPrincipal.QryOrcamentos.FieldByName('INSCESTORC').AsString;

    if rbCNPJ.Checked then
    begin
      if length(ie) = 11 then
        edtIE.Text := ie;
      if length(ie) < 11 then
      begin
        while pos('/', ie) <> 0 do
          delete(ie, pos('/', ie), 1);
        edtIE.Text := ie;
      end;
    end;
  end
  else
  begin
    edtCNPJ.Text := fMenuPrincipal.QryOrcamentos.FieldByName('CGCCPF').AsString;
  end;

  edtNumOrc.Text := IntToStr(numeroOrcamento);
  edtDataEmissao.Text := DateToStr(fMenuPrincipal.QryOrcamentos.FieldByName('DTORC').AsDateTime);
  edtDataEntrega.Text := DateToStr(fMenuPrincipal.QryOrcamentos.FieldByName('PREVISAOENTREGA').AsDateTime);
  edtCodigoCliente.Text := fMenuPrincipal.QryOrcamentos.FieldByName('CLIENTEORC').AsString;

  edtNomeCliente.Text := fMenuPrincipal.QryOrcamentos.FieldByName('RAZSOCORC').AsString;
  edtCNPJ.Text := fMenuPrincipal.QryOrcamentos.FieldByName('CGCCPF').AsString;

  edtMunicipio.Text := fMenuPrincipal.QryOrcamentos.FieldByName('MUNICIPIOORC').AsString;
  edtLogradouro.Text := fMenuPrincipal.QryOrcamentos.FieldByName('LOGORC').AsString;
  edtNumeroLogradouro.Text := fMenuPrincipal.QryOrcamentos.FieldByName('NUMEROLOGORC').AsString;
  edtUF.Text := fMenuPrincipal.QryOrcamentos.FieldByName('UFORC').AsString;
  edtDesconto.Text := FormatFloat('#0.00', fMenuPrincipal.QryOrcamentos.FieldByName('PERCDESC').AsFloat);
  edtFinal.Text := FormatFloat('#0.00', fMenuPrincipal.QryOrcamentos.FieldByName('VLRVISTA').AsFloat);
  edtBairro.Text := fMenuPrincipal.QryOrcamentos.FieldByName('BAIRROORC').AsString;
  edtTelefone.Text := fMenuPrincipal.QryOrcamentos.FieldByName('FONEORC').AsString;
  edtCEP.Text := fMenuPrincipal.QryOrcamentos.FieldByName('CEPORC').AsString;
  edtFrete.Text := FormatFloat('#0.00', fMenuPrincipal.QryOrcamentos.FieldByName('VALORFRETEORC').AsFloat);
  if fMenuPrincipal.QryOrcamentos.FieldByName('REPRESENTANTE').AsString <> '' then
    cbbRepresentante.ItemIndex := cbbRepresentante.IndexOfCaption(fMenuPrincipal.QryOrcamentos.FieldByName('REPRESENTANTE').AsString);
  if fMenuPrincipal.QryOrcamentos.FieldByName('TRANSPORTADOR').AsString <> '' then
    cbbTransportador.ItemIndex := cbbTransportador.IndexOfCaption(fMenuPrincipal.QryOrcamentos.FieldByName('TRANSPORTADOR').AsString);
  edtPlacaTransporte.Text := fMenuPrincipal.QryOrcamentos.FieldByName('VEICULO').AsString;
  edtKM.Text := fMenuPrincipal.QryOrcamentos.FieldByName('KILOMETRAGEM').AsString;
  edtMotorista.Text := fMenuPrincipal.QryOrcamentos.FieldByName('MOTORISTA').AsString;
  edtDescVeiculo.Text := fMenuPrincipal.QryOrcamentos.FieldByName('DESCVEICULO').AsString;
  edtLogradouro.Text := fMenuPrincipal.QryOrcamentos.FieldByName('ENDENT1').AsString;
  edtBairroEndEntrega.Text := fMenuPrincipal.QryOrcamentos.FieldByName('ENDENT2').AsString;
  edtCidadeEndEntrega.Text := fMenuPrincipal.QryOrcamentos.FieldByName('ENDENT3').AsString;
  edtAcrescimo.Text := FormatFloat('#0.00', fMenuPrincipal.QryOrcamentos.FieldByName('PERCACRESCIMO').AsFloat);
  edtComplemento.Text := fMenuPrincipal.QryOrcamentos.FieldByName('COMPLEMENTOPARCORC').AsString;
  edtMensagemPadrao.Text := fMenuPrincipal.QryOrcamentos.FieldByName('MENSAGEMORC').AsString;
  fMenuPrincipal.QryOrcamentos.First;
  while not fMenuPrincipal.QryOrcamentos.EOF do
  begin
    fdmItens.Append;
    fdmItens.FieldByName('SEQ').AsString := fMenuPrincipal.QryOrcamentos.FieldByName('NRSEQITEM').AsString;
    fdmItens.FieldByName('CODIGO').AsString := fMenuPrincipal.QryOrcamentos.FieldByName('CDITEMMERC').AsString;
    fdmItens.FieldByName('PLACA').AsString := fMenuPrincipal.QryOrcamentos.FieldByName('PLACAITEM').AsString;
    fdmItens.FieldByName('DESCRICAO').AsString := fMenuPrincipal.QryOrcamentos.FieldByName('DESCMERC').AsString;
    fdmItens.FieldByName('QTDE').AsInteger := fMenuPrincipal.QryOrcamentos.FieldByName('QTDEORC').AsInteger;
    fdmItens.FieldByName('VALOR').AsFloat := fMenuPrincipal.QryOrcamentos.FieldByName('VLRUNITORC').AsFloat;
    fdmItens.FieldByName('SUBTOTAL').AsFloat := fMenuPrincipal.QryOrcamentos.FieldByName('VALORFINAL').AsFloat;
    fdmItens.FieldByName('RATDESCITEM').AsFloat := fMenuPrincipal.QryOrcamentos.FieldByName('DESCITORC').AsFloat;
    fdmItens.FieldByName('RATACRESITEM').AsFloat := fMenuPrincipal.QryOrcamentos.FieldByName('ACRESCITORC').AsFloat;
    fdmItens.FieldByName('OBSERVACOES').AsString := fMenuPrincipal.QryOrcamentos.FieldByName('OBSITEM').AsString;
    fdmItens.Post;
    fMenuPrincipal.QryOrcamentos.Next;
  end;
  cbbFormaPagamento.ItemIndex := cbbFormaPagamento.IndexOfCaption(fMenuPrincipal.QryOrcamentos.FieldByName('FORMAPAGAMENTOORC').AsString);
  cbbFormaPagamentoChange(Sender);

  if cbbParcelas.Enabled then
  begin
    cbbParcelas.ItemIndex := cbbParcelas.IndexOfCaption(fMenuPrincipal.QryOrcamentos.FieldByName('CDCONDICAO').AsString);
    cbbParcelasExit(Sender);
  end;

end;

procedure TfOrcamentos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfOrcamentos.calculaTotalFinal;
var
  tempFloat: double;
begin
  tempFloat := 0;
  fdmItens.First;
  while not fdmItens.Eof do
  begin
    tempFloat := fdmItens.FieldByName('SUBTOTAL').AsFloat + tempFloat;
    fdmItens.Next;
  end;
  edtFinal.Text := FormatFloat('#0.00', tempFloat);
end;

procedure TfOrcamentos.checarRadioButton;
begin
  if rbCPF.Checked = true then //CPF
  begin
    rbCNPJ.Checked := False;
    cpfExibeCampos;
  end;
  if rbCNPJ.Checked = true then //CNPJ
  begin
    rbCPF.Checked := False;
    cnpjExibeCampos;
  end;
end;

procedure TfOrcamentos.cnpjExibeCampos;
begin
  lblCNPJ.Caption := 'CNPJ';
  edtIE.Visible := True;
  lblIE.Visible := True;
  edtCNPJ.EditMask := '99.999.999/9999-99;1;';
  edtIE.EditMask := '999/9999999;1;';
  edtCNPJ.Text := '';
  edtIE.Text := '';
end;

procedure TfOrcamentos.cpfExibeCampos;
begin
  lblCNPJ.Caption := 'CPF';
  edtIE.Visible := False;
  lblIE.Visible := False;
  edtCNPJ.EditMask := '999.999.999-99;1;';
  edtCNPJ.Text := '';
end;

procedure TfOrcamentos.calculaValores;
var
  totalGrade, totalFrete, acrescimo, porcentagemAcrescimo, totalAcrescimo, desconto, porcentagemDesconto, totalDesconto: double;
begin
  totalGrade := retornaSubtotalGrade;

  acrescimo := StrToFloatDef(edtAcrescimo.Text, 0);
  desconto := StrToFloatDef(edtDesconto.Text, 0);
  totalFrete := StrToFloatDef(edtFrete.Text, 0);

  porcentagemAcrescimo := (acrescimo / 100);
  totalAcrescimo := (porcentagemAcrescimo * totalGrade);

  porcentagemDesconto := (desconto / 100);

  if porcentagemDesconto > 100 then
  begin
    ShowMessage('Não é possível dar um desconto maior que 100% do valor total.');
    edtDesconto.SetFocus;
    Exit;
  end;

  totalDesconto := (porcentagemDesconto * totalGrade);

  fdmItens.First;
  while not fdmItens.Eof do
  begin
    fdmItens.Edit;
    fdmItens.FieldByName('RATDESCITEM').AsFloat := ((fdmItens.FieldByName('SUBTOTAL').AsFloat * (porcentagemDesconto * totalGrade)) / StrToFloat(edtFinal.Text));
    fdmItens.FieldByName('RATACRESITEM').AsFloat := ((fdmItens.FieldByName('SUBTOTAL').AsFloat * (porcentagemAcrescimo * totalGrade)) / StrToFloat(edtFinal.Text));
    fdmItens.Post;
    fdmItens.Next;
  end;

  edtFinal.Text := FormatFloat('#0.00', totalGrade + (totalFrete + totalAcrescimo - totalDesconto));
  edtAcrescimo.Text := FormatFloat('#0.00', acrescimo);
  edtFrete.Text := FormatFloat('#0.00', totalFrete);
  edtDesconto.Text := FormatFloat('#0.00', desconto);

end;

procedure TfOrcamentos.edtAcrescimoExit(Sender: TObject);
begin
  calculaValores;
end;

procedure TfOrcamentos.edtAcrescimoKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteFloat(Sender, Key);
end;

procedure TfOrcamentos.MontaTransacao;
var
  listaTransacoes: TObjectList<TTransacao>;
  transacao: TTransacao;
begin
  listaTransacoes := fMenuPrincipal.listarNatOp;
  edtTransacao.Items.Clear;
  if (listaTransacoes.Count > 0) and (listaTransacoes.Items[0].CDTRANSACAO <> '') then
  begin
    listaTransacoes.First;
    for transacao in listaTransacoes do
    begin
      with edtTransacao.Items.Add do
      begin
        Caption := transacao.CDTRANSACAO;
        Detail := transacao.CDNATOP;
      end;
    end;
    edtTransacao.ItemIndex := -1;
  end;
end;

procedure TfOrcamentos.edtCNPJExit(Sender: TObject);
begin
  if rbCPF.Checked then
    if FuncoesGlobal.Testa_CNPJ_CPF(edtCodigoCliente.Text, edtCNPJ.Text, 'FÍSICA', edtCodigoCliente, StrToInt(strfilial)) then

    else
    begin
      edtCNPJ.Text := '';
      edtCNPJ.SetFocus;
    end

  else if rbCNPJ.Checked then
    if FuncoesGlobal.Testa_CNPJ_CPF(edtCodigoCliente.Text, edtCNPJ.Text, 'JURÍDICA', edtCodigoCliente, StrToInt(strfilial)) then

    else
    begin
      edtCNPJ.Text := '';
      edtCNPJ.SetFocus;
    end;
end;

procedure TfOrcamentos.edtCodigoClienteExit(Sender: TObject);
var
  ie: string;
begin
  fMenuPrincipal.QryAuxiliar.Close;
  fMenuPrincipal.QryAuxiliar.SQL.Clear;
  fMenuPrincipal.QryAuxiliar.SQL.Add('SELECT A.*, B.*, C.OBSERVACAO    ');
  fMenuPrincipal.QryAuxiliar.SQL.Add('FROM TBPARCEIROS A               ');
  fMenuPrincipal.QryAuxiliar.SQL.Add('JOIN TBPAPELPARCEIRO B           ');
  fMenuPrincipal.QryAuxiliar.SQL.Add('ON B.marcaparc = A.marcaparc     ');
  fMenuPrincipal.QryAuxiliar.SQL.Add('LEFT JOIN TBOBSCLIENTE C              ');
  fMenuPrincipal.QryAuxiliar.SQL.Add('ON C.marcaparc = A.marcaparc     ');
  fMenuPrincipal.QryAuxiliar.SQL.Add('WHERE A.MARCAPARC = :MARCAPARC');
  fMenuPrincipal.QryAuxiliar.SQL.Add('AND B.CDPAPEL = :cdpapel');
  fMenuPrincipal.QryAuxiliar.SQL.Add('AND B.STPARC = :stparc');
  fMenuPrincipal.QryAuxiliar.SQL.Add('ORDER BY A.RAZSOCPARC ASC');
  fMenuPrincipal.QryAuxiliar.ParamByName('MARCAPARC').AsString := UpperCase(edtCodigoCliente.Text);
  fMenuPrincipal.QryAuxiliar.ParamByName('CDPAPEL').AsString := UpperCase('CLIENTE');
  fMenuPrincipal.QryAuxiliar.ParamByName('STPARC').AsString := UpperCase('ATIVO');
  fMenuPrincipal.QryAuxiliar.Open();

  edtCodigoCliente.Text := fMenuPrincipal.QryAuxiliar.FieldByName('MARCAPARC').AsString;
  edtNomeCliente.Text := fMenuPrincipal.QryAuxiliar.FieldByName('RAZSOCPARC').AsString;
  edtTelefone.Text := fMenuPrincipal.QryAuxiliar.FieldByName('FONEPRINCIPALPARC').AsString;

  if (Length(fMenuPrincipal.QryAuxiliar.FieldByName('CGC').AsString) > 14) then
  begin
    rbCNPJ.Checked := True;
    rbCPF.Checked := False;
    cnpjExibeCampos;

  end;

  if (Length(fMenuPrincipal.QryAuxiliar.FieldByName('CGC').AsString) <= 14) then
  begin
    rbCPF.Checked := True;
    rbCNPJ.Checked := False;
    cpfExibeCampos;
  end;

  if (fMenuPrincipal.QryAuxiliar.FieldByName('INSCESTADUALPARC').AsString <> '') and (fMenuPrincipal.QryAuxiliar.FieldByName('INSCESTADUALPARC').AsString <> 'ISENTO') then
  begin
    edtCNPJ.Text := fMenuPrincipal.QryAuxiliar.FieldByName('CGC').AsString;
    ie := fMenuPrincipal.QryAuxiliar.FieldByName('INSCESTADUALPARC').AsString;

    if rbCNPJ.Checked then
    begin
      if length(ie) = 11 then
        edtIE.Text := ie;
      if length(ie) < 11 then
      begin
        while pos('/', ie) <> 0 do
          delete(ie, pos('/', ie), 1);
        edtIE.Text := ie;
      end;
    end;
  end
  else
  begin
    edtCNPJ.Text := fMenuPrincipal.QryAuxiliar.FieldByName('CGC').AsString;
  end;

  edtCep.Text := fMenuPrincipal.QryAuxiliar.FieldByName('CEPPARC').AsString;
  edtMunicipio.Text := fMenuPrincipal.QryAuxiliar.FieldByName('MUNICIPIO').AsString;
  edtLogradouro.Text := fMenuPrincipal.QryAuxiliar.FieldByName('LOGRADOURO').AsString;
  edtNumeroLogradouro.Text := fMenuPrincipal.QryAuxiliar.FieldByName('NUMEROLOG').AsString;
  edtBairro.Text := fMenuPrincipal.QryAuxiliar.FieldByName('BAIRRO').AsString;
  edtUF.ItemIndex := edtUF.indexOf(fMenuPrincipal.QryAuxiliar.FieldByName('UF').AsString);
  edtUF.Text := fMenuPrincipal.QryAuxiliar.FieldByName('UF').AsString;
  edtComplemento.Text := fMenuPrincipal.QryAuxiliar.FieldByName('COMPLEMENTOPARC').AsString;

  if fMenuPrincipal.QryAuxiliar.FieldByName('OBSERVACAO').AsString <> '' then
  begin
    fObservacaoCliente := TfObservacaoCliente.Create(Self);
    fObservacaoCliente.mmoAviso.Text := trim(fMenuPrincipal.QryAuxiliar.FieldByName('OBSERVACAO').AsString);
    fObservacaoCliente.ShowModal;
//  fEtiquetas.Free;
    FreeAndNil(fObservacaoCliente);
  end;
end;

procedure TfOrcamentos.edtCodigoEnter(Sender: TObject);
begin
//  bloquearBotoes(True, False, False);
end;

procedure TfOrcamentos.edtCodigoExit(Sender: TObject);
var
  a: IAssina_XML;
  b: Integer;
  c: WideString;
  DocRet: TXMLDocument;
  II: integer;
  NdNvlA, NdNvlB, NdNvlC, NdNvlD, NdNvlE, NdNvlF: IXMLNode;
  NodeBody: IXMLNode;
  Nodecod: IXMLNode;
  NodeConsEst: IXMLNode;
  NodeEnv: IXMLNode;
  NodeEstoque: IXMLNode;
  NodeRes: IXMLNode;
  NodeStatus: IXMLNode;
  strCdnatop: string;
  strCodTribGid: string;
  strGruGid: string;
  strMntItemLei12741: string;
  strNome1: string;
  strPermiteCodZero: string;
  strSaida: TStringList;
  vDesItem: string;
  vRetCons: string;
  vXMLDoc: TXMLDocument;
  vPlacaDestino: string;
  vObsGID: string;
  strPlacaPecaGID: string;
  intcnt: Integer;
  vFlag: Boolean;
begin

 // if strPermiteCodZero = 'S' then
//  begin
  if (strUsaGid = 'S') or (strUsaGidComp = 'S') then
  begin
    if edtCodigo.Text = '0' then
    begin
      limparCampos(1);
      bloquearCampos(True, True, True);
      edtDescricao.TabOrder := 1;
      edtValor.TabOrder := 2;
      edtCodigo.Text := '0';
      edtDescricao.SetFocus;
      btnPecaForaEstoque.Enabled := True;
    end
    else
    begin
      btnPecaForaEstoque.Enabled := False;
      if edtCodigo.text = '' then
      begin
        bloquearBotoes(True, True, True);
        btnPesquisa.Enabled := True;
        edtDescricao.TabOrder := 2;
        edtValor.TabOrder := 1;
      end
      else
      begin
        edtDescricao.TabOrder := 2;
        edtValor.TabOrder := 1;
        bloquearCampos(False, False, False);

        vFlag := False;

        if vFlag then
        begin
          exit;
        end;

        vPlacaDestino := '';

        vXMLDoc := TXMLDocument.Create(Nil);
        with vXMLDoc do
        begin
          Active := True;
          Version := '1.0';
          Encoding := 'UTF-8';
          AddChild('soapenv:Envelope');

          ChildNodes['soapenv:Envelope'].Childnodes.last;
          ChildNodes['soapenv:Envelope'].Attributes['xmlns:soapenv'] := 'http://schemas.xmlsoap.org/soap/envelope/';
          ChildNodes['soapenv:Envelope'].Attributes['xmlns:rem'] := 'http://remote.cdv.procergs.com/';
          ChildNodes['soapenv:Envelope'].Attributes['xmlns:xd'] := 'http://www.w3.org/2000/09/xmldsig#';

          NdNvlA := DocumentElement;
          NdNvlA.AddChild('soapenv:Header');

          NdNvlB := NdNvlA.AddChild('soapenv:Body');

          NdNvlC := NdNvlB.AddChild('rem:consultarEstoqueGid', '');

          NdNvlD := NdNvlC.AddChild('CONSULTAR_ESTOQUE', '');
          NdNvlD.Attributes['Id'] := 'CDV';

          NdNvlE := NdNvlD.AddChild('infEstoque');
          NdNvlE.ChildNodes['CDV'].AddChild('COD_CREDENCIADO').NodeValue := AllTrim(strCodCreGID);

          if AllTrim(strAmbGID) = '2' then
          begin
            NdNvlE.ChildNodes['CDV'].AddChild('CNPJ_CREDENCIADO').NodeValue := '11111111111180';
          end
          else
          begin
            NdNvlE.ChildNodes['CDV'].AddChild('CNPJ_CREDENCIADO').NodeValue := strCNPJGID;
          end;

          NdNvlE.ChildNodes['CDV'].AddChild('COD_AMBIENTE').NodeValue := TRIM(strAmbGID);
          NdNvlE.ChildNodes['CDV'].AddChild('MATR_OPER').NodeValue := '0';
          NdNvlE.ChildNodes['CDV'].AddChild('VERSAO_LEIAUTE').NodeValue := '1';
          NdNvlE.ChildNodes['CDV'].AddChild('SENHA_CREDENCIADO').NodeValue := '';

          if TRIM(strAmbGID) = '2' then
          begin
            NdNvlE.ChildNodes['CDV'].AddChild('OPER_HOMOLOGACAO').NodeValue := '2';
          end;

          NdNvlE.ChildNodes['CDV'].AddChild('NOME_EMISSOR_NFE').NodeValue := 'GESCOM';
          NdNvlE.ChildNodes['CDV'].AddChild('CNPJ_EMISSOR_NFE').NodeValue := '15254156000176';

          NdNvlE.ChildNodes['COD_ESTOQUE'].NodeValue := edtCodigo.Text;

          strNome1 := AllTrim(strCamGid) + 'consultaEstoqueGID.xml';
          vXMLDoc.SaveToFile(strNome1);
          strSaida := TStringList.Create;

          strSaida.Text := FormatXMLData(vXMLDoc.XML.Text);
          strSaida.STRINGS[0] := '<?xml version=''1.0'' encoding=''UTF-8'' ?>';
          vXMLDoc.SaveToFile(strNome1);

          FreeAndNil(strSaida);
        end;

        a := CoAssina_XML_.Create();

        b := a.Consultar_Estoque(AllTrim(strCamGid) + 'consultaEstoqueGID.xml', 'CONSULTAR_ESTOQUE', TRIM(strCamCertGID), TRIM(strSenCertGID), StrToInt(strTipCertGID), StrToInt(strAmbGID));

        if b <> 0 then
        begin
          case b of
            1:
              ShowMessage('Problema ao acessar o certificado digital');
            2:
              ShowMessage('Problemas no certificado digital');
            3:
              ShowMessage('XML mal formado');
            4:
              ShowMessage('A tag de assinatura inexiste');
            5:
              ShowMessage('A tag de assinatura não é unica');
            6:
              ShowMessage('Erro Ao assinar o documento - ID deve ser string');
            7:
              ShowMessage('Erro: Ao assinar o documento');
            8:
              ShowMessage('A tag de assinatura inexiste');
            9:
              ShowMessage('Nome de arquivo não informado');
            10:
              ShowMessage('Arquivo inexistente');
            11:
              ShowMessage('O WebService não esta acessivel ou você não possui conexão com a internet!');
          else
            DocRet := TXMLDocument.Create(Self);
            DocRet.LoadFromFile(AllTrim(strCamGid) + 'consultaEstoqueGID_Ret.xml');
            DocRet.XML.Text := xmlDoc.FormatXMLData(DocRet.XML.Text);
            DocRet.Active := True;
            ShowMessage(DocRet.XML.Text);
          end;

        end
        else
        begin

          DocRet := TXMLDocument.Create(Self);

          DocRet.LoadFromFile(AllTrim(strCamGid) + 'consultaEstoqueGID_Ret.xml');
          DocRet.XML.Text := xmlDoc.FormatXMLData(DocRet.XML.Text);
          DocRet.Active := True;

          NodeConsEst := DocRet.DocumentElement;

          NodeStatus := NodeConsEst.ChildNodes['STATUS'];
          vRetCons := NodeStatus.ChildNodes['COD_STATUS'].Text;

          if vRetCons = '1' then
          begin
            NodeEstoque := NodeConsEst.ChildNodes['ESTOQUE'];
            edtDescricao.Text := copy(NodeEstoque.ChildNodes['NOME_PECA'].Text + ' | ' + NodeEstoque.ChildNodes['NOME_ORIGINARIO'].Text, 1, 119);
            edtPlaca.Text := NodeEstoque.ChildNodes['PLACA_VEICULO'].Text;
            edtNota.Text := NodeEstoque.ChildNodes['COD_NOTA'].Text;
            tempDescricao := NodeEstoque.ChildNodes['NOME_PECA'].Text;
            tempDescOriginario := NodeEstoque.ChildNodes['NOME_ORIGINARIO'].Text;

            tempPlaca := NodeEstoque.ChildNodes['PLACA_VEICULO'].Text;
            tempCodNota := NodeEstoque.ChildNodes['COD_NOTA'].Text;
            tempAno := NodeEstoque.ChildNodes['ANO_MODELO'].Text;
            tempMarca := NodeEstoque.ChildNodes['NOME_MARCA'].Text;
            tempModelo := NodeEstoque.ChildNodes['NOME_MODELO'].Text;
            tempChassi := NodeEstoque.ChildNodes['CHASSI_VEICULO'].Text;
            strSituacaoPeca := NodeEstoque.ChildNodes['SITUACAO_PECA'].Text;
            tempPedidosObservacao := 'Marca: ' + tempMarca + '; ' + 'Modelo: ' + tempModelo + '; ' + 'Ano: ' + tempAno + '; ' + 'Placa: ' + tempPlaca + 'Chassi: ' + tempChassi + ';';
            fPedidosObservacao.memoObservacoes.Clear;
            fPedidosObservacao.memoObservacoes.Text := tempPedidosObservacao;

            fMenuPrincipal.QryAuxiliar.Close;
            fMenuPrincipal.QryAuxiliar.Sql.Clear;
            fMenuPrincipal.QryAuxiliar.Sql.Add(' SELECT * FROM TBGIDRASTREABILIDADE WHERE DESCRICAO LIKE :DESCRICAO ');

            if Pos('(C)', NodeEstoque.ChildNodes['NOME_PECA'].Text) > 0 then
              vDesItem := Uppercase(System.SysUtils.Trim(StringReplace(NodeEstoque.ChildNodes['NOME_PECA'].Text, '(C)', '', [rfReplaceAll, rfIgnoreCase])) + '%');

            fMenuPrincipal.QryAuxiliar.ParamByName('DESCRICAO').AsString := UpperCase(vDesItem);

            fMenuPrincipal.QryAuxiliar.Open();

            strPlacaPecaGID := NodeEstoque.ChildNodes['PLACA_VEICULO'].Text;
            strGruGid := NodeEstoque.ChildNodes['NRO_GRUPO'].Text;

            if strGruGid <> '' then
            begin
              fMenuPrincipal.QryGPmerc.Close;
              fMenuPrincipal.QryGPmerc.Sql.Clear;
              fMenuPrincipal.QryGPmerc.Sql.Add('Select * From TbGpMerc   ');
              fMenuPrincipal.QryGPmerc.Sql.Add('   Where CDGPMERC = :CDGPMERC ');
              fMenuPrincipal.QryGPmerc.ParamByName('CDGPMERC').AsString := strGruGid;
              fMenuPrincipal.QryGPmerc.Open;

              if fMenuPrincipal.QryGPmerc.Eof then
              begin
                ShowMessage('Grupo não encontrado. O PADRAO sera utilizado!');
                fMenuPrincipal.QryGPmerc.Close;
                fMenuPrincipal.QryGPmerc.Sql.Clear;
                fMenuPrincipal.QryGPmerc.Sql.Add('Select * From TbGpMerc   ');
                fMenuPrincipal.QryGPmerc.Sql.Add('   Where CDGPMERC = :CDGPMERC ');
                fMenuPrincipal.QryGPmerc.ParamByName('CDGPMERC').AsString := 'PADRAO';
                fMenuPrincipal.QryGPmerc.Open;
              end;

              if Pos('[', NodeEstoque.ChildNodes['NOME_PECA'].Text) > 0 then
                vDesItem := Trim(Copy(NodeEstoque.ChildNodes['NOME_PECA'].Text, 1, Pos('[', NodeEstoque.ChildNodes['NOME_PECA'].Text) - 2)) + '%'
              else if Pos('(C)', NodeEstoque.ChildNodes['NOME_PECA'].Text) > 0 then
                vDesItem := UpperCase(System.SysUtils.Trim(StringReplace(NodeEstoque.ChildNodes['NOME_PECA'].Text, '(C)', '', [rfReplaceAll, rfIgnoreCase]))) + '%'
              else
                vDesItem := NodeEstoque.ChildNodes['NOME_PECA'].Text + '%';

              fMenuPrincipal.QryAuxiliar.ParamByName('DESCRICAO').AsString := UpperCase(vDesItem);
              fMenuPrincipal.QryAuxiliar.Open;
            end;

            fMenuPrincipal.QryAuxiliar.close;
            fMenuPrincipal.QryAuxiliar.Sql.clear;
            fMenuPrincipal.QryAuxiliar.Sql.add('Select *                           ');
            fMenuPrincipal.QryAuxiliar.Sql.add('   From TBGIDNCM                   ');

            fMenuPrincipal.QryAuxiliar.Sql.add('   WHERE DESCRICAO like :DESCRICAO    ');

            if Pos('[', NodeEstoque.ChildNodes['NOME_PECA'].Text) > 0 then
              vDesItem := Trim(Copy(NodeEstoque.ChildNodes['NOME_PECA'].Text, 1, Pos('[', NodeEstoque.ChildNodes['NOME_PECA'].Text) - 2)) + '%'
            else if Pos('(C)', NodeEstoque.ChildNodes['NOME_PECA'].Text) > 0 then
              vDesItem := UpperCase(System.SysUtils.Trim(StringReplace(NodeEstoque.ChildNodes['NOME_PECA'].Text, '(C)', '', [rfReplaceAll, rfIgnoreCase]))) + '%'
            else
              vDesItem := NodeEstoque.ChildNodes['NOME_PECA'].Text + '%';

            fMenuPrincipal.QryAuxiliar.ParamByName('DESCRICAO').AsString := UpperCase(vDesItem);
            fMenuPrincipal.QryAuxiliar.Open;

            if strSituacaoPeca = '2' then
            begin
              edtDescricao.Enabled := True;
              edtDescricao.ReadOnly := False;
            end;

            if strUsaPrecoPecas = 'S' then
            begin
              fMenuPrincipal.QryHeidi.Close;
              fMenuPrincipal.QryHeidi.SQL.Clear;
              fMenuPrincipal.QryHeidi.SQL.Add('SELECT *');
              fMenuPrincipal.QryHeidi.SQL.Add('FROM TBPERCENTUAIS_PECAS');
              fMenuPrincipal.QryHeidi.SQL.Add('WHERE CODIGO = :CODIGO');
              fMenuPrincipal.QryHeidi.ParamByName('CODIGO').AsInteger := StrToInt(edtCodigo.Text);
              fMenuPrincipal.QryHeidi.Open;

              fMenuPrincipal.QryHeidi.First;
              while not fMenuPrincipal.QryHeidi.Eof do
              begin
                edtValor.Text := FormatFloat('#0.00', fMenuPrincipal.QryHeidi.FieldByName('valor_venda').AsFloat);
                edtTotal.Text := FormatFloat('#0.00', fMenuPrincipal.QryHeidi.FieldByName('valor_venda').AsFloat * StrToFloat(edtQuantidade.Text));
                fMenuPrincipal.QryHeidi.Next;
              end;
            end;

            edtValor.SetFocus;
            bloquearBotoes(True, True, True);
            btnPesquisa.Enabled := True;
          end
          else
          begin
            ShowMessage(NodeConsEst.ChildNodes['ERROS'].ChildNodes['ERRO'].ChildNodes['NOME_ERRO'].Text);
          end;
        end;
      end;
    end;
  end
  else
  begin
    limparCampos(1);
    bloquearCampos(False, False, False);
    if edtCodigo.text = '' then
    begin
      bloquearBotoes(True, True, True);
      btnPesquisa.Enabled := True;
      edtDescricao.TabOrder := 2;
      edtValor.TabOrder := 1;
    end
    else if edtCodigo.text = '0' then
    begin
      bloquearCampos(True, True, True);
      edtDescricao.TabOrder := 1;
      edtValor.TabOrder := 2;
      edtCodigo.Text := '0';
      edtDescricao.SetFocus;
    end
    else
    begin
      edtDescricao.TabOrder := 2;
      edtValor.TabOrder := 1;
      fMenuPrincipal.QryEstoque.Close;
      fMenuPrincipal.QryEstoque.SQL.Clear;
      fMenuPrincipal.QryEstoque.SQL.Add('SELECT A.*, ');
      fMenuPrincipal.QryEstoque.SQL.Add('B.* ');
      fMenuPrincipal.QryEstoque.SQL.Add('FROM ');
      fMenuPrincipal.QryEstoque.SQL.Add('TBMERCEMPRESA A ');
      fMenuPrincipal.QryEstoque.SQL.Add('JOIN ');
      fMenuPrincipal.QryEstoque.SQL.Add('TBITMERC B');
      fMenuPrincipal.QryEstoque.SQL.Add('ON ');
      fMenuPrincipal.QryEstoque.SQL.Add('A.CDITEMMERC = B.CDITEMMERC ');
      fMenuPrincipal.QryEstoque.SQL.Add('WHERE ');
      fMenuPrincipal.QryEstoque.SQL.Add('A.CDEMPRESA = :CDEMPRESA ');
      fMenuPrincipal.QryEstoque.SQL.Add('AND ');
      fMenuPrincipal.QryEstoque.SQL.Add('A.STATUS = :STATUS ');
      fMenuPrincipal.QryEstoque.SQL.Add('AND ');
      fMenuPrincipal.QryEstoque.SQL.Add('A.CDITEMMERC = :CDITEMMERC ');
      fMenuPrincipal.QryEstoque.ParamByName('CDEMPRESA').AsInteger := StrToInt(PARAMSTR(1));
      fMenuPrincipal.QryEstoque.ParamByName('STATUS').AsString := 'ATIVO';
      fMenuPrincipal.QryEstoque.ParamByName('CDITEMMERC').AsString := edtCodigo.Text;
      fMenuPrincipal.QryEstoque.Open;
      fMenuPrincipal.QryEstoque.First;

      edtDescricao.Text := fMenuPrincipal.QryEstoque.FieldByName('DESCITEMMERC').AsString;
      if fMenuPrincipal.QryEstoque.FieldByName('PRECOUNITMERC').AsFloat > 0 then
      begin
        edtValor.Text := FloatToStr(fMenuPrincipal.QryEstoque.FieldByName('PRECOUNITMERC').AsFloat);
        edtValorExit(Sender);
      end;

      edtValor.SetFocus;
    end;
    bloquearBotoes(True, True, True);
    btnPesquisa.Enabled := True;
  end;
end;

procedure TfOrcamentos.edtDataEntregaExit(Sender: TObject);
begin
  try
    StrToDate(edtDataEntrega.Text);
  except
    ShowMessage('Data inválida!');
    edtDataEntrega.SetFocus;
  end;
end;

procedure TfOrcamentos.edtDescontoExit(Sender: TObject);
begin
  calculaValores();
end;

procedure TfOrcamentos.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteFloat(Sender, Key);
end;

procedure TfOrcamentos.edtFreteExit(Sender: TObject);
begin
  calculaValores();
end;

procedure TfOrcamentos.edtFreteKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteFloat(Sender, Key);
end;

procedure TfOrcamentos.edtValorExit(Sender: TObject);
var
  Quantidade, Valor, Total: Double;
begin
  Quantidade := StrToFloatDef(edtQuantidade.Text, 0);
  Valor := StrToFloatDef(edtValor.Text, 0);
  Total := Quantidade * Valor;
  edtValor.Text := FormatFloat('#0.00', Valor);
  edtTotal.Text := FormatFloat('#0.00', Total);
end;

procedure TfOrcamentos.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteFloat(Sender, Key);
end;

procedure TfOrcamentos.montaComboBox;
var
  UF: TUF;
  listaUFs: TObjectList<TUF>;
  representante: TRepresentante;
  listaRepresentante: TObjectList<TRepresentante>;
  transportador: TTransportador;
  listaTransportadores: TObjectList<TTransportador>;
  unidade: TUnidades;
  listaUnidades: TObjectList<TUnidades>;
  condicaoPagamento: TCondicoesPagamento;
  listaCondicaoPagamento: TObjectList<TCondicoesPagamento>;
begin

  listaUFs := fMenuPrincipal.listarUfs;
  if listaUFs.Count > 0 then
  begin
    listaUFs.First;
    if listaUFs.Items[1].CDUF <> '' then
    begin
      for UF in listaUFs do
      begin
        with edtUF.Items.Add do
        begin
          Caption := UF.CDUF;
          Detail := UF.CDUF;
        end;

        with cbeUfEntrega.Items.Add do
        begin
          Caption := UF.CDUF;
          Detail := UF.CDUF;
        end;
      end;
      cbeUFEntrega.ItemIndex := cbeUfEntrega.IndexOf('RS');
      edtUF.ItemIndex := edtUF.IndexOf('RS');
    end;
  end;

  listaRepresentante := fMenuPrincipal.listarRepresentantes;
  if listaRepresentante.Count > 0 then
  begin
    listaRepresentante.First;
    if listaRepresentante.Items[0].CDREPRESENTANTE <> '' then
    begin
      for representante in listaRepresentante do
      begin
        with cbbRepresentante.Items.Add do
        begin
          Caption := representante.CDREPRESENTANTE;
          Detail := representante.CDREPRESENTANTE;
        end;
      end;
    end;
  end;

  listaUnidades := fMenuPrincipal.listarUnidades;
  if listaUnidades.Count > 0 then
  begin
    listaUnidades.First;
    if listaUnidades.Items[0].CDUNIDADES <> '' then
    begin
      for unidade in listaUnidades do
      begin
        with cbeUnidade.Items.Add do
        begin
          Caption := unidade.CDUNIDADES;
          Detail := unidade.CDUNIDADES;
        end;
      end;
      cbeUnidade.ItemIndex := cbeUnidade.IndexOf('PÇ');
    end;
  end;

  listaTransportadores := fMenuPrincipal.listarTransportadores;
  if listaTransportadores.Count > 0 then
  begin
    listaTransportadores.First;
    if listaTransportadores.Items[0].CDTRANSPORTADOR <> '' then
    begin
      for transportador in listaTransportadores do
      begin
        with cbbTransportador.Items.Add do
        begin
          Caption := transportador.CDTRANSPORTADOR;
          Detail := transportador.CDTRANSPORTADOR;
        end;
      end;
    end;
  end;

  listaCondicaoPagamento := fMenuPrincipal.listarCondicoesPagamento;
  if listaCondicaoPagamento.Count > 0 then
  begin
    listaCondicaoPagamento.First;
    if listaCondicaoPagamento.Items[0].CDCONDICAO <> '' then
    begin
      for condicaoPagamento in listaCondicaoPagamento do
      begin
        with cbbParcelas.Items.Add do
        begin
          Caption := condicaoPagamento.DESCCONDPAGTO;
          Detail := condicaoPagamento.CDCONDICAO;
        end;
      end;
    end;
  end;
end;

procedure TfOrcamentos.FormCreate(Sender: TObject);
begin
  fdmItens.FieldDefs.Add('SEQ', ftInteger);
  fdmItens.FieldDefs.Add('CODIGO', ftString, 10);
  fdmItens.FieldDefs.Add('PLACA', ftString, 10);
  fdmItens.FieldDefs.Add('DESCRICAO', ftString, 80, False);
  fdmItens.FieldDefs.Add('UN', ftString, 4);
  fdmItens.FieldDefs.Add('QTDE', ftFloat);
  fdmItens.FieldDefs.Add('RATDESCITEM', ftFloat);
  fdmItens.FieldDefs.Add('RATACRESITEM', ftFloat);
  fdmItens.FieldDefs.Add('VALOR', ftFloat);
  fdmItens.FieldDefs.Add('SUBTOTAL', ftFloat);
  fdmItens.FieldDefs.Add('OBSERVACOES', ftString, 255);
  fdmItens.CreateDataSet;
  fdmImagensComponentes.CreateDataSet;

  TFloatField(fdmItens.FieldByName('VALOR')).DisplayFormat := '0.00';
  TFloatField(fdmItens.FieldByName('SUBTOTAL')).DisplayFormat := '0.00';
  TFloatField(fdmItens.FieldByName('RATDESCITEM')).DisplayFormat := '0.00';
  TFloatField(fdmItens.FieldByName('RATACRESITEM')).DisplayFormat := '0.00';

  fdmParcelas.FieldDefs.Add('Parcela', ftInteger);
  fdmParcelas.FieldDefs.Add('Valor', ftFloat);
  fdmParcelas.CreateDataSet;

  TFloatField(fdmParcelas.FieldByName('Valor')).DisplayFormat := '0.00';

  MontaComboBox;

  MontaTransacao;

  if (strUsaGid = 'S') or (strUsaGidComp = 'S') then
  begin
    strUsaPrecoPecas := fMenuPrincipal.QryParamVendas.FieldByName('USAPRECOPECAS').AsString;
    edtTransacao.ItemIndex := edtTransacao.IndexOfCaption('VENDA GID');
    edtQuantidade.Enabled := False;
    edtDescricao.Enabled := False;
  end
  else
  begin
    edtTransacao.ItemIndex := edtTransacao.IndexOfCaption('VENDA');
    edtQuantidade.Enabled := True;
    edtDescricao.Enabled := True;
  end;

  edtMensagemPadrao.Text := Trim(strMensagemPadraoOrcamento);
  Application.CreateForm(TfPesquisaItens, fPesquisaItens);
end;

procedure TfOrcamentos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    if scGPPageControl1.ActivePage = scGPPageControlPage3 then
    begin
      scGPPageControl1.ActivePage := scGPPageControlPage2;
    end
    else if scGPPageControl1.ActivePage = scGPPageControlPage2 then
    begin
      scGPPageControl1.ActivePage := scGPPageControlPage1;
    end
    else if scGPPageControl1.ActivePage = scGPPageControlPage1 then
    begin
      ShowMessage('Não há mais páginas para trás!');
    end;
    Exit;
  end;

  if Key = VK_F2 then
  begin
    if scGPPageControl1.ActivePage = scGPPageControlPage1 then
    begin
      scGPPageControl1.ActivePage := scGPPageControlPage2;
    end
    else if scGPPageControl1.ActivePage = scGPPageControlPage2 then
    begin
      scGPPageControl1.ActivePage := scGPPageControlPage3;
    end
    else if scGPPageControl1.ActivePage = scGPPageControlPage3 then
    begin
      ShowMessage('Não há mais páginas para trás!');
    end;
    Exit;
  end;

  if scGPPageControl1.ActivePage = scGPPageControlPage2 then
  begin
    if Key = VK_F3 then
    begin
      btnPesquisaClienteClick(Sender);
      Exit;
    end;
  end;

  if scGPPageControl1.ActivePage = scGPPageControlPage1 then
  begin
    if Key = VK_F3 then
    begin
      btnPesquisaClick(Sender);
      Exit;
    end;

    if Key = VK_F5 then
    begin
      if edtSeq.Text = '' then
      begin
        btnIncluirClick(Sender);
      end
      else
      begin
        btnAlterarClick(Sender);
      end;
      edtCodigo.SetFocus;
      Exit;
    end;
  end;

  if Key = VK_F9 then
  begin
    btnFinalizarClick(Sender);
    Exit;
  end;
end;

procedure TfOrcamentos.FormShow(Sender: TObject);
begin
  cpfExibeCampos;
  edtDataEmissao.Text := DateToStr(Now);
  edtDataEntrega.Text := DateToStr(Now);
  edtCodigo.SetFocus;
end;

procedure TfOrcamentos.rbCNPJClick(Sender: TObject);
begin
  checarRadioButton;
end;

procedure TfOrcamentos.rbCPFClick(Sender: TObject);
begin
  checarRadioButton;
end;

procedure TfOrcamentos.rDBGrid1DblClick(Sender: TObject);
var
  dblValor, tempTot: Double;
begin
  bloquearBotoes(false, True, false);
  edtSeq.Text := fdmItens.FieldByName('SEQ').AsString;
  edtCodigo.Text := fdmItens.FieldByName('CODIGO').AsString;
  edtDescricao.Text := fdmItens.FieldByName('DESCRICAO').AsString;
  edtQuantidade.Text := IntToStr(fdmItens.FieldByName('QTDE').AsInteger);
  dblValor := fdmItens.FieldByName('VALOR').AsFloat;
  edtValor.Text := FormatFloat('#0.00', dblValor);
  tempTot := fdmItens.FieldByName('SUBTOTAL').AsFloat;
  edtTotal.Text := FormatFloat('#0.00', tempTot);
  fPedidosObservacao.memoObservacoes.Text := fdmItens.FieldByName('OBSERVACOES').AsString;
end;

procedure TfOrcamentos.rDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not Odd(fdmParcelas.RecNo) then
  begin
    rDBGrid1.Canvas.Brush.Color := $00D8D8D8;
  end;

  if (gdSelected in State) or (gdFocused in State) then
  begin
    rDBGrid1.Canvas.Brush.Color := rgb(230, 103, 103);
    rDBGrid1.Canvas.Font.Style := Font.Style + [fsBold];
    rDBGrid1.Canvas.Font.Color := clBlack;
  end;
end;

procedure TfOrcamentos.reiniciar;
begin
  limparCampos(0);
  fdmItens.EmptyDataSet;
  fdmParcelas.EmptyDataSet;
end;

procedure TfOrcamentos.scGPPageControl1ChangePage(Sender: TObject);
begin
  if fdmItens.RecordCount = 0 then
  begin
    if scGPPageControl1.ActivePage = scGPPageControlPage1 then
    begin

    end
    else
    begin
      ShowMessage('Busque alguma peça antes de prosseguir!');
      scGPPageControl1.ActivePage := scGPPageControlPage1;
      edtCodigo.SetFocus;
    end;
  end
  else
  begin
    if scGPPageControl1.ActivePage = scGPPageControlPage1 then
    begin
      edtCodigo.SetFocus;
    end
    else if scGPPageControl1.ActivePage = scGPPageControlPage2 then
    begin
      edtNomeCliente.SetFocus;
    end
    else if scGPPageControl1.ActivePage = scGPPageControlPage3 then
    begin
      cbbTransportador.SetFocus;
    end;
  end;
end;

procedure TfOrcamentos.acertaSequencia;
begin
  fdmItens.First;
  while not fdmItens.Eof do
  begin
    fdmItens.Edit;
    fdmItens.FieldByName('SEQ').AsInteger := fdmItens.RecNo;
    fdmItens.Post;
    fdmItens.Next;
  end;
end;

procedure TfOrcamentos.bloquearBotoes(boolIncluir, boolAlterar, boolExcluir: boolean);
begin
  btnIncluir.Enabled := boolIncluir;
  btnAlterar.Enabled := boolAlterar;
  btnExcluir.Enabled := boolExcluir;
end;

procedure TfOrcamentos.bloquearCampos(boolDescricao, boolPlaca, boolNota: boolean);
begin
  edtDescricao.Enabled := boolDescricao;
  edtPlaca.Enabled := boolPlaca;
  edtNota.Enabled := boolNota;
end;

procedure TfOrcamentos.btnAlterarClick(Sender: TObject);
begin
  edtValorExit(Sender);
  edtDesconto.Text := '0,00';
  edtSeq.Text := '';
  with fdmItens do
    if (Fields[1].AsString = '') or (edtDescricao.Text = '') or (edtValor.Text = '') or (edtValor.Text = '0') then
    begin
      ShowMessage('Para alterar os dados dê duplo clique no registro!');
    end
    else
    begin
      Edit;
      fdmItens.FieldByName('CODIGO').AsString := edtCodigo.Text;
      fdmItens.FieldByName('PLACA').AsString := tempPlaca;
      fdmItens.FieldByName('DESCRICAO').AsString := edtDescricao.Text;
      fdmItens.FieldByName('QTDE').AsInteger := StrToInt(edtQuantidade.Text);
      fdmItens.FieldByName('VALOR').AsFloat := StrToFloat(edtValor.Text);
      fdmItens.FieldByName('SUBTOTAL').AsFloat := StrToFloat(edtTotal.Text);
      fdmItens.FieldByName('OBSERVACOES').AsString := fPedidosObservacao.memoObservacoes.Text;
      Post;
      bloquearBotoes(True, True, True);
    end;
  acertaSequencia;
  limparCampos(1);
  calculaTotalFinal;
  edtCodigo.Text := '';
  edtCodigo.SetFocus;
  btnPecaForaEstoque.Enabled := False;
end;

procedure TfOrcamentos.btnCadastraClienteClick(Sender: TObject);
begin
  ChamaCadastro(StrFilial, stratdUsuario, 'VENDC00.EXE', '002', edtCodigoCliente.Text);
  ForceForegroundWindow(Application.Handle);

  if BuscaCodigoCadastrado <> '' then
    edtCodigoCliente.Text := BuscaCodigoCadastrado
  else
    edtCodigoCliente.Text := edtCodigoCliente.Text;
  edtCodigoClienteExit(Sender);
  edtNomeCliente.SetFocus;
end;

procedure TfOrcamentos.btnCadastrarMensagemPadraoClick(Sender: TObject);
begin
  if edtMensagemPadrao.Text <> '' then
  begin
    fMenuPrincipal.QryParamVendas.Close;
    fMenuPrincipal.QryParamVendas.SQL.Clear;
    fMenuPrincipal.QryParamVendas.SQL.Add('UPDATE TBPARAMVENDAS');
    fMenuPrincipal.QryParamVendas.SQL.Add('SET');
    fMenuPrincipal.QryParamVendas.SQL.Add('MENSAGEMPADRAOORCAMENTO = :MENSAGEM');
    fMenuPrincipal.QryParamVendas.ParamByName('MENSAGEM').AsString := Trim(edtMensagemPadrao.Text);
    fMenuPrincipal.QryParamVendas.ExecSQL;
  end;
end;

procedure TfOrcamentos.btnImagensClick(Sender: TObject);
var
  Ret: integer;
  F: TSearchRec;
begin
  if fdmItens.RecordCount <> 0 then
  begin
    fMenuPrincipal.QryImagemComponente.Close;
    fMenuPrincipal.QryImagemComponente.SQL.Clear;
    fMenuPrincipal.QryImagemComponente.SQL.Add('SELECT A.CAMINHO_IMAGEM_COMPONENTE');
    fMenuPrincipal.QryImagemComponente.SQL.Add('FROM TBPERCENTUAIS_PECAS A');
    fMenuPrincipal.QryImagemComponente.SQL.Add('WHERE A.CODIGO = :CODIGO');
    fMenuPrincipal.QryImagemComponente.ParamByName('CODIGO').AsInteger := fdmItens.FieldByName('CODIGO').AsInteger;
    fMenuPrincipal.QryImagemComponente.Open;

    if fMenuPrincipal.QryImagemComponente.FieldByName('CAMINHO_IMAGEM_COMPONENTE').AsString <> '' then
    begin
      Ret := FindFirst(fMenuPrincipal.QryImagemComponente.FieldByName('CAMINHO_IMAGEM_COMPONENTE').AsString + '\*.*', 0, F);

      while Ret = 0 do
      begin
        fdmImagensComponentes.Append;
        fdmImagensComponentes.FieldByName('CaminhoImagem').AsString := fMenuPrincipal.QryImagemComponente.FieldByName('CAMINHO_IMAGEM_COMPONENTE').AsString + '\' + F.Name;
        fdmImagensComponentes.Post;
        Ret := FindNext(F);
      end;

      Application.CreateForm(TfImagemComponente, fImagemComponente);
      fdmImagensComponentes.First;
      fImagemComponente.scGPImage1.Picture.LoadFromFile(fdmImagensComponentes.FieldByName('CaminhoImagem').AsString);

      fImagemComponente.ShowModal;
      FreeAndNil(fImagemComponente);
    end
    else
      ShowMessage('Não há imagens para esse Componente')
  end;
  btnPecaForaEstoque.Enabled := False;
end;

procedure TfOrcamentos.incluirItem();
begin
  fdmItens.Append;
  fdmItens.FieldByName('CODIGO').AsString := edtCodigo.Text;
  fdmItens.FieldByName('DESCRICAO').AsString := edtDescricao.Text;
  fdmItens.FieldByName('PLACA').AsString := tempPlaca;
  fdmItens.FieldByName('QTDE').AsInteger := StrToInt(edtQuantidade.Text);
  fdmItens.FieldByName('UN').AsString := Trim(cbeUnidade.Text);
  fdmItens.FieldByName('VALOR').AsFloat := StrToFloat(edtValor.Text);
  fdmItens.FieldByName('SUBTOTAL').AsFloat := StrToFloat(edtTotal.Text);
  fdmItens.FieldByName('OBSERVACOES').AsString := fPedidosObservacao.memoObservacoes.Text;
  fdmItens.Post;

  if fdmItens.FieldByName('CODIGO').AsString = '' then
  begin
    fdmItens.Delete;
  end;
end;

procedure TfOrcamentos.btnIncluirClick(Sender: TObject);
var
  valor: Double;
begin
  edtValorExit(Sender);

  valor := StrToFloat(edtValor.Text);
  edtDesconto.Text := '0,00';

  if (edtDescricao.Text = '') then
  begin
    ShowMessage('Preencha a descrição corretamente!');
    edtDescricao.SetFocus;
    Exit;
  end;

  if (edtValor.Text = '') or (valor <= 0) then
  begin
    ShowMessage('Preencha o valor corretamente!');
    edtValor.SetFocus;
    Exit;
  end;

  fdmItens.First;
  while not fdmItens.Eof do
  begin
    if (edtCodigo.Text = fdmItens.FieldByName('CODIGO').AsString) and (StrToInt(edtCodigo.Text) <> 0) then
    begin
      ShowMessage('O item já consta na grade, não é possível inserir novamente!');
      edtCodigo.SetFocus;
      Exit;
    end
    else
      fdmItens.Next;
  end;

  incluirItem;
  bloquearCampos(False, False, False);
  acertaSequencia;
  limparCampos(1);
  calculaTotalFinal;
  edtCodigo.Text := '';
  edtCodigo.SetFocus;
  btnPecaForaEstoque.Enabled := False;
end;

procedure TfOrcamentos.cbbFormaPagamentoChange(Sender: TObject);
begin
  //0-Dinheiro; 1-Cheque; 2-C. Credito; 3-C. Debito;  4-Credito Loja; 5-V. Alimentacao;
  //6-V.Refeição; 7-V. Presente; 8-V. Combustivel; 9-Boleto Bancario; 10-Sem Pagamento; 11-Outros
  if (cbbFormaPagamento.ItemIndex = 0) or (cbbFormaPagamento.ItemIndex = 3) or (cbbFormaPagamento.ItemIndex = 5) or (cbbFormaPagamento.ItemIndex = 6) or (cbbFormaPagamento.ItemIndex = 7) or (cbbFormaPagamento.ItemIndex = 8) or (cbbFormaPagamento.ItemIndex = 10) then
  begin
    cbbParcelas.Enabled := False;
  end
  else if (cbbFormaPagamento.ItemIndex = 1) or (cbbFormaPagamento.ItemIndex = 2) or (cbbFormaPagamento.ItemIndex = 4) or (cbbFormaPagamento.ItemIndex = 9) or (cbbFormaPagamento.ItemIndex = 11) then
  begin
    cbbParcelas.Enabled := True;
  end
  else
  begin
    ShowMessage('Opção inválida, tente novamente!');
  end
end;

procedure TfOrcamentos.cbbParcelasExit(Sender: TObject);
var
  tempFinal, tempResto, tempQuociente: Double;
  i, tempParcelas: Integer;
begin
  fdmParcelas.EmptyDataSet;

  fMenuPrincipal.QryAuxiliar.Close;
  fMenuPrincipal.QryAuxiliar.SQL.Clear;
  fMenuPrincipal.QryAuxiliar.SQL.Add('SELECT * FROM TBITEMCONDPAGTO WHERE  CDEMPRESA = :CDEMPRESA');
  if cbbParcelas.ItemIndex <> -1 then
  begin
    fMenuPrincipal.QryAuxiliar.SQL.Add('   AND CDCONDICAO = :CDCONDICAO   ');
    fMenuPrincipal.QryAuxiliar.ParamByName('CDCONDICAO').AsString := cbbParcelas.Items[cbbParcelas.ItemIndex].Detail;
  end;
  fMenuPrincipal.QryAuxiliar.ParamByName('CDEMPRESA').AsInteger := StrToInt(ParamStr(1));
  fMenuPrincipal.QryAuxiliar.Open();

  tempFinal := StrToFloat(edtFinal.Text);
  tempParcelas := fMenuPrincipal.QryAuxiliar.RecordCount;
  tempQuociente := Trunc(tempFinal / tempParcelas);
  tempResto := tempFinal - tempParcelas * tempQuociente;

  for i := 1 to tempParcelas do
  begin
    fdmParcelas.Append;
    if i = 1 then
    begin
      fdmParcelas.FieldByName('Parcela').AsInteger := i;
      fdmParcelas.FieldByName('Valor').AsFloat := tempQuociente + tempResto;
    end
    else
    begin
      fdmParcelas.FieldByName('Parcela').AsInteger := i;
      fdmParcelas.FieldByName('Valor').AsFloat := tempQuociente;
    end;
  end;
  fdmParcelas.Post;
end;

procedure TfOrcamentos.limparCampos(Parametro: integer);
begin
//0-limpa tudo --- 1-limpa pagina 01 --- 2-limpa pagina 02 --- 3-limpa pagina 03
  if Parametro = 0 then
  begin
    scGPPageControl1.ActivePage := scGPPageControlPage1;
    edtCodigo.SetFocus;
  end;
  if (Parametro = 0) or (Parametro = 1) then
  begin
    edtSeq.Text := '';
    edtNumOrc.Text := '';
    edtCodigo.Text := '';
    edtDescricao.Text := '';
    edtNota.Text := '';
    edtPlaca.Text := '';
    edtQuantidade.Text := '1';
    edtValor.Text := '0,00';
    edtTotal.text := '0,00';
    edtDataEmissao.Date := Now;
    edtDataEntrega.Date := Now;
    edtDescricao.Enabled := False;
    edtPlaca.Enabled := False;
    edtNota.Enabled := False;
    if (strUsaGid = 'S') or (strUsaGidComp = 'S') then
    begin
      cbeUnidade.ItemIndex := cbeUnidade.IndexOf('PÇ');
      edtTransacao.ItemIndex := edtTransacao.IndexOfCaption('VENDA GID');
    end
    else
    begin
      cbeUnidade.ItemIndex := 1;
      edtTransacao.ItemIndex := edtTransacao.IndexOfCaption('VENDA');
    end;
  end;
  if (Parametro = 0) or (Parametro = 2) then
  begin
    edtBairro.Text := '';
    edtCodigoCliente.Text := '';
    edtCEP.Text := '';
    edtTelefone.Text := '';
    edtNomeCliente.Text := '';
    edtCNPJ.Text := '';
    edtIE.Text := '';
    edtMunicipio.Text := '';
    edtUF.Text := '';
    edtLogradouro.Text := '';
    edtNumeroLogradouro.Text := '';
    edtDesconto.Text := '0,00';
    edtFrete.Text := '0,00';
    edtAcrescimo.Text := '0,00';
    if cbbParcelas.ItemIndex <> -1 then
      cbbParcelas.ItemIndex := -1;
    cbbParcelas.Enabled := False;
    if cbbRepresentante.ItemIndex <> -1 then
      cbbRepresentante.ItemIndex := -1;
 //   btnPecaForaEstoque.Enabled := False;
  end;
  if (Parametro = 0) or (Parametro = 3) then
  begin
    edtMotorista.Text := '';
    edtPlacaTransporte.Text := '';
    edtKM.Text := '';
    edtDescVeiculo.Text := '';
    edtEndEntrega.Text := '';
    edtNumEndEntrega.Text := '';
    edtCidadeEndEntrega.Text := '';
    edtBairroEndEntrega.Text := '';
    if cbbTransportador.ItemIndex <> -1 then
      cbbTransportador.ItemIndex := -1;
    if cbeUfEntrega.ItemIndex <> -1 then
      cbeUfEntrega.ItemIndex := -1;
  end;
end;

end.

