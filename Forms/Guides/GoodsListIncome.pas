unit GoodsListIncome;

interface

uses
  Winapi.Windows, AncestorGuides, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, dsdAddOn, dxBarExtItems,
  dxBar, cxClasses, dsdDB, Datasnap.DBClient, dsdAction, System.Classes,
  Vcl.ActnList, cxPropertiesStore, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.Controls, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, Vcl.Menus, cxButtonEdit, cxContainer, dsdGuides, cxLabel,
  cxTextEdit, cxMaskEdit, Vcl.ExtCtrls, cxCurrencyEdit, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TGoodsListIncomeForm = class(TAncestorGuidesForm)
    ContractCode: TcxGridDBColumn;
    Panel: TPanel;
    edRetail: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel27: TcxLabel;
    edContract: TcxButtonEdit;
    cxLabel1: TcxLabel;
    edJuridical: TcxButtonEdit;
    JuridicalGuides: TdsdGuides;
    ContractGuides: TdsdGuides;
    RetailGuides: TdsdGuides;
    PartnerName: TcxGridDBColumn;
    RetailName: TcxGridDBColumn;
    actShowAll: TBooleanStoredProcAction;
    bbShowAll: TdxBarButton;
    RefreshDispatcher: TRefreshDispatcher;
    actOpenReportForm: TdsdOpenForm;
    bbOpenReportForm: TdxBarButton;
    mactOpenReportForm: TMultiAction;
    ExecuteDialog: TExecuteDialog;
    bbExecuteDialog: TdxBarButton;
    Amount: TcxGridDBColumn;
    GoodsKindName_List: TcxGridDBColumn;
    GoodsKindName: TcxGridDBColumn;
    GoodsKindCode: TcxGridDBColumn;
    GoodsKindId_List: TcxGridDBColumn;
    AmountChoice: TcxGridDBColumn;
    LastDate: TcxGridDBColumn;
    isLast: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TGoodsListIncomeForm);

end.
