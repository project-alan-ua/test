unit BankAccountMovement_Split;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorEditDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dsdDB, dsdAction,
  Vcl.ActnList, cxPropertiesStore, dsdAddOn, Vcl.StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, dsdGuides, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxLabel, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dsdCommon,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  Data.DB, cxDBData, dxSkinsdxBarPainter, cxClasses, dxBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TBankAccountMovement_SplitForm = class(TAncestorEditDialogForm)
    ���: TcxLabel;
    cxLabel1: TcxLabel;
    ceOperDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    ceBankAccount: TcxButtonEdit;
    GuidesBankAccount: TdsdGuides;
    ceAmountIn: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    ceAmountOut: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxLabel6: TcxLabel;
    ceObject: TcxButtonEdit;
    GuidesObject: TdsdGuides;
    cxLabel5: TcxLabel;
    ceInfoMoney: TcxButtonEdit;
    GuidesInfoMoney: TdsdGuides;
    ceContract: TcxButtonEdit;
    cxLabel8: TcxLabel;
    GuidesContract: TdsdGuides;
    cxLabel10: TcxLabel;
    ceComment: TcxTextEdit;
    cxLabel9: TcxLabel;
    ceCurrency: TcxButtonEdit;
    GuidesCurrency: TdsdGuides;
    edInvNumber: TcxTextEdit;
    cxLabel11: TcxLabel;
    ceCurrencyPartnerValue: TcxCurrencyEdit;
    cxLabel12: TcxLabel;
    ceParPartnerValue: TcxCurrencyEdit;
    ceBank: TcxButtonEdit;
    cxLabel13: TcxLabel;
    GuidesBank: TdsdGuides;
    cxLabel4: TcxLabel;
    ceAmountSumm: TcxCurrencyEdit;
    ceUnit: TcxButtonEdit;
    cxLabel14: TcxLabel;
    GuidesUnit: TdsdGuides;
    cxLabel15: TcxLabel;
    ceInvoice: TcxButtonEdit;
    GuidesInvoice: TdsdGuides;
    cxLabel16: TcxLabel;
    ceComment_Invoice: TcxTextEdit;
    cxLabel17: TcxLabel;
    ceServiceDate: TcxDateEdit;
    cxLabel18: TcxLabel;
    edPartner: TcxButtonEdit;
    GuidesPartner: TdsdGuides;
    cxLabel29: TcxLabel;
    ceInvNumberInvoice: TcxTextEdit;
    Panel1: TPanel;
    cxGridDetail: TcxGrid;
    cxGridDBTableViewDetail: TcxGridDBTableView;
    InfoMoneyName: TcxGridDBColumn;
    chAmount: TcxGridDBColumn;
    isErased: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    Panel2: TPanel;
    DetailDS: TDataSource;
    DetailCDS: TClientDataSet;
    dsdDBViewAddOn: TdsdDBViewAddOn;
    spSelectMI_Detail: TdsdStoredProc;
    actShowErased: TBooleanStoredProcAction;
    bbRefreshMIDetail: TdxBarButton;
    actRefreshMIDetail: TdsdDataSetRefresh;
    bbb: TdxBarButton;
    bbShowErased: TdxBarButton;
    spErasedMIDetail: TdsdStoredProc;
    spUnErasedMIDetail: TdsdStoredProc;
    SetErasedDetail: TdsdUpdateErased;
    SetUnErasedDetail: TdsdUpdateErased;
    bbSetErasedDetail: TdxBarButton;
    bbSetUnErasedDetail: TdxBarButton;
    actChoiceFormInfoMoney: TOpenChoiceForm;
    bbInsertRecord: TdxBarButton;
    LineNum: TcxGridDBColumn;
    spInsertUpdateMIDetail: TdsdStoredProc;
    actUpdateDataSetDetail: TdsdUpdateDataSet;
    spInsertUpdate_Split: TdsdStoredProc;
    MovementItemProtocolOpenForm: TdsdOpenForm;
    bbMovementItemProtocolOpenForm: TdxBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TBankAccountMovement_SplitForm);

end.
