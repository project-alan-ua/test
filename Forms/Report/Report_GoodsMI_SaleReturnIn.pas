unit Report_GoodsMI_SaleReturnIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorReport, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsdxBarPainter, dsdAddOn, ChoicePeriod,
  dxBarExtItems, dxBar, cxClasses, dsdDB, Datasnap.DBClient, dsdAction,
  Vcl.ActnList, cxPropertiesStore, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.ExtCtrls, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  dsdGuides, cxButtonEdit, cxCurrencyEdit, Vcl.Menus, cxCheckBox, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dsdCommon;

type
  TReport_GoodsMI_SaleReturnInForm = class(TAncestorReportForm)
    TradeMarkName: TcxGridDBColumn;
    GoodsGroupName: TcxGridDBColumn;
    GoodsCode: TcxGridDBColumn;
    GoodsName: TcxGridDBColumn;
    Sale_Summ: TcxGridDBColumn;
    Sale_Amount_Weight: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    edGoodsGroup: TcxButtonEdit;
    GuidesGoodsGroup: TdsdGuides;
    FormParams: TdsdFormParams;
    Sale_Amount_Sh: TcxGridDBColumn;
    JuridicalName: TcxGridDBColumn;
    PartnerName: TcxGridDBColumn;
    Return_Amount_Sh: TcxGridDBColumn;
    Return_Amount_Weight: TcxGridDBColumn;
    Return_Summ: TcxGridDBColumn;
    GoodsKindName: TcxGridDBColumn;
    Sale_AmountPartner_Weight: TcxGridDBColumn;
    Sale_AmountPartner_Sh: TcxGridDBColumn;
    Return_AmountPartner_Weight: TcxGridDBColumn;
    Return_AmountPartner_Sh: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    edJuridical: TcxButtonEdit;
    GuidesJuridical: TdsdGuides;
    ReturnPercent: TcxGridDBColumn;
    GoodsGroupNameFull: TcxGridDBColumn;
    cxLabel5: TcxLabel;
    edPaidKind: TcxButtonEdit;
    cxLabel7: TcxLabel;
    edInfoMoney: TcxButtonEdit;
    GuidesInfoMoney: TdsdGuides;
    GuidesPaidKind: TdsdGuides;
    MeasureName: TcxGridDBColumn;
    actPrint: TdsdPrintAction;
    bbPrint: TdxBarButton;
    RetailName: TcxGridDBColumn;
    actPrint_byJuridical: TdsdPrintAction;
    bbPrint_byJuridical: TdxBarButton;
    JuridicalGroupName: TcxGridDBColumn;
    BranchName: TcxGridDBColumn;
    actPrint_byStatGroup: TdsdPrintAction;
    bbPrint_byStatGroup: TdxBarButton;
    cbPartner: TcxCheckBox;
    cbGoods: TcxCheckBox;
    bbPartner: TdxBarControlContainerItem;
    bbGoods: TdxBarControlContainerItem;
    AreaName: TcxGridDBColumn;
    RetailReportName: TcxGridDBColumn;
    PartnerTagName: TcxGridDBColumn;
    CityName: TcxGridDBColumn;
    CityKindName: TcxGridDBColumn;
    RegionName: TcxGridDBColumn;
    ProvinceName: TcxGridDBColumn;
    PartnerId: TcxGridDBColumn;
    InfoMoneyName_all: TcxGridDBColumn;
    Sale_SummCost: TcxGridDBColumn;
    Return_SummCost: TcxGridDBColumn;
    actPrint_byPartner: TdsdPrintAction;
    bbPrint_byPartner: TdxBarButton;
    edBranch: TcxButtonEdit;
    cxLabel8: TcxLabel;
    GuidesBranch: TdsdGuides;
    edArea: TcxButtonEdit;
    cxLabel20: TcxLabel;
    edRetail: TcxButtonEdit;
    cxLabel6: TcxLabel;
    GuidesArea: TdsdGuides;
    GuidesRetail: TdsdGuides;
    cxLabel9: TcxLabel;
    ådTradeMark: TcxButtonEdit;
    GuidesTradeMark: TdsdGuides;
    cbTradeMark: TcxCheckBox;
    bbTradeMark: TdxBarControlContainerItem;
    Sale_Summ_10200: TcxGridDBColumn;
    Sale_Summ_10300: TcxGridDBColumn;
    Sale_Amount_10500_Weight: TcxGridDBColumn;
    Sale_Amount_40200_Weight: TcxGridDBColumn;
    Return_Amount_40200_Weight: TcxGridDBColumn;
    Sale_SummCost_10500: TcxGridDBColumn;
    Sale_SummCost_40200: TcxGridDBColumn;
    Return_SummCost_40200: TcxGridDBColumn;
    Return_Summ_10300: TcxGridDBColumn;
    GoodsGroupAnalystName: TcxGridDBColumn;
    ContractTagGroupName: TcxGridDBColumn;
    Address: TcxGridDBColumn;
    PartnerCode: TcxGridDBColumn;
    cbGoodsKind: TcxCheckBox;
    bbGoodsKind: TdxBarControlContainerItem;
    ExecuteDialog: TExecuteDialog;
    bbExecuteDialog: TdxBarButton;
    GoodsPlatformName: TcxGridDBColumn;
    cbContract: TcxCheckBox;
    bbContract: TdxBarControlContainerItem;
    Sale_Summ_10250: TcxGridDBColumn;
    actRefreshReal: TdsdDataSetRefresh;
    bbRefreshReal: TdxBarButton;
    Promo_Summ: TcxGridDBColumn;
    Promo_SummCost: TcxGridDBColumn;
    Promo_AmountPartner_Weight: TcxGridDBColumn;
    Promo_AmountPartner_Sh: TcxGridDBColumn;
    Return_Summ_10700: TcxGridDBColumn;
    Sale_SummReal: TcxGridDBColumn;
    Sale_AmountPartnerR_Weight: TcxGridDBColumn;
    Sale_AmountPartnerR_Sh: TcxGridDBColumn;
    cxLabel10: TcxLabel;
    edProtocolDateOlapSR: TcxDateEdit;
    cxLabel11: TcxLabel;
    edEndDateOlapSR: TcxDateEdit;
    spGetGlobalConst_DateOlapSR: TdsdStoredProc;
    cxLabel12: TcxLabel;
    cbIsDate: TcxCheckBox;
    OperDate: TcxGridDBColumn;
    DayOfWeekName_full: TcxGridDBColumn;
    Count_TT: TcxGridDBColumn;
    sbisMonth: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
initialization
  RegisterClass(TReport_GoodsMI_SaleReturnInForm);

end.
