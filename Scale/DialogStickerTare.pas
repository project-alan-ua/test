unit DialogStickerTare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AncestorDialogScale, StdCtrls, Mask, Buttons,
  ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, dsdDB, Vcl.ActnList, dsdAction, cxPropertiesStore,
  dsdAddOn, cxButtons, Vcl.ComCtrls, dxCore, cxDateUtils, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, dxSkinBlack, dxSkinBlue,
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
  TDialogStickerTareForm = class(TAncestorDialogScaleForm)
    PanelValue: TPanel;
    cxLabel3: TcxLabel;
    deDateTare: TcxDateEdit;
    cbTare: TcxCheckBox;
    cbGoodsName: TcxCheckBox;
    cbPartion: TcxCheckBox;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    deDateProduction: TcxDateEdit;
    deDatePack: TcxDateEdit;
    edPartion: TcxLabel;
    cxLabel5: TcxLabel;
    ceNumTech: TcxCurrencyEdit;
    ceNumPack: TcxCurrencyEdit;
  private
    function Checked: boolean; override;//�������� ����������� ����� � Edit
  public
   NumberValue:Integer;
  end;

var
   DialogStickerTareForm: TDialogStickerTareForm;

implementation
{$R *.dfm}
{------------------------------------------------------------------------------}
function TDialogStickerTareForm.Checked: boolean; //�������� ����������� ����� � Edit
var NumberValue : Integer;
begin
     Result:= true;
     //
     if (cbTare.Checked = TRUE) and (cbPartion.Checked = FALSE) then
     begin
       try StrToDate (deDateTare.Text); except Result:= false; end;
     end;
     //
     if (cbTare.Checked = TRUE) and (cbPartion.Checked = TRUE) then
     begin
       try StrToDate (deDatePack.Text);      except Result:= false; end;
       try StrToDate (deDateProduction.Text);except Result:= false; end;
       //
       if Result then
       begin
         try NumberValue:= StrToInt (ceNumPack.Text);except NumberValue:=0;end;
         Result:= NumberValue > 0;
       end;
       //
       if Result then
       begin
         try NumberValue:=StrToInt(ceNumTech.Text);except NumberValue:=0;end;
         Result:=NumberValue>0;
       end;
     end;

end;
{------------------------------------------------------------------------------}
end.
