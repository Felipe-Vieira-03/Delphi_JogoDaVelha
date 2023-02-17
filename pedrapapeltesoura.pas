unit pedrapapeltesoura;

{$mode ObjFPC}{$H+}

interface

uses
      Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

			{ TForm2 }

      TForm2 = class(TForm)
						Button1: TButton;
						Button2: TButton;
						ED_J1: TEdit;
						ED_J2: TEdit;
						Image1: TImage;
						Image2: TImage;
						Image3: TImage;
						Image4: TImage;
						Image5: TImage;
						Image6: TImage;
						Label1: TLabel;
						Label2: TLabel;
						Label3: TLabel;
						Label4: TLabel;
						Label5: TLabel;
						LB_Ganhador: TLabel;
						Panel1: TPanel;
						Panel2: TPanel;
						Panel3: TPanel;
						procedure Button1Click(Sender: TObject);
						procedure Button2Click(Sender: TObject);
						procedure Image1Click(Sender: TObject);
						procedure Image2Click(Sender: TObject);
						procedure Image3Click(Sender: TObject);
						procedure Image4Click(Sender: TObject);
						procedure Image5Click(Sender: TObject);
						procedure Image6Click(Sender: TObject);
      private

      public
            function VerificarJogadas(Jog1, Jog2: String): String;

      end;

var
      Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }


procedure TForm2.Button1Click(Sender: TObject);
var
  Jog1, Jog2, Ganhador: String;
begin
  Jog1 := ED_J1.Text;
  Jog2 := ED_J2.Text;
  LB_Ganhador.Visible := False;
  Ganhador :=  VerificarJogadas(Jog1, Jog2);

  LB_Ganhador.Visible := True;
  LB_Ganhador.Caption := Ganhador;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
   ED_J1.Text := '';
   ED_J2.Text := '';
end;



procedure TForm2.Image1Click(Sender: TObject);
begin
  ED_J1.Text := 'Pedra';
end;


procedure TForm2.Image2Click(Sender: TObject);
begin
  ED_J1.Text := 'Tesoura';
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
  ED_J1.Text := 'Papel';
end;

procedure TForm2.Image4Click(Sender: TObject);
begin
  ED_J2.Text := 'Pedra';
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
  ED_J2.Text := 'Tesoura';
end;

procedure TForm2.Image6Click(Sender: TObject);
begin
  ED_J2.Text := 'Papel';
end;

function TForm2.VerificarJogadas(Jog1, Jog2: String): String;
var
  LGanhador: String;
begin

  if ((AnsiSameText(Jog1, '')) and (not (AnsiSameText(Jog2, '')))) or
      (not (AnsiSameText(Jog1, '')) and (AnsiSameText(Jog2, ''))) then
  begin
	  ShowMessage('Insira a jogada dos dois jogadores para prosseguir!');
		Abort();
  end;


  if (AnsiSameText(Jog1, Jog2) and (AnsiSameText(Jog1, Jog2))) then
  begin
    ShowMessage('Nenhuma jogada foi selecionada, por favor verifique');
    Abort();
  end;


  if (AnsiSameText(Jog1, Jog2)) then
    LGanhador := 'Empate';


  if ((AnsiSameText(Jog1, 'Pedra') and AnsiSameText(Jog2, 'Papel')) or
      (AnsiSameText(Jog1, 'papel') and AnsiSameText(Jog2, 'Tesoura')) or
      (AnsiSameText(Jog1, 'Tesoura') and AnsiSameText(Jog2, 'Pedra'))) then
  LGanhador := 'Jogador 2';

  if ((AnsiSameText(Jog2, 'Pedra') and AnsiSameText(Jog1, 'Papel')) or
      (AnsiSameText(Jog2, 'papel') and AnsiSameText(Jog1, 'Tesoura')) or
      (AnsiSameText(Jog2, 'Tesoura') and AnsiSameText(Jog1, 'Pedra'))) then
  LGanhador := 'Jogador 1';

  result := LGanhador;
end;

end.
