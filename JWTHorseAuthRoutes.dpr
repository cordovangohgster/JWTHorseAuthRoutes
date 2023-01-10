{Ejemplo pr�ctico:                                                             }
{Protecci�n de las rutas                                                       }
{Genere un token y consuma este recurso enviando el token bearer}
program JWTHorseAuthRoutes;

{$APPTYPE CONSOLE}

{$R *.res}

uses Horse, Horse.JWT;

begin
  THorse.Use(HorseJWT('key'));

  THorse.Post('ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong'); //Si el token es v�lido se mostrar� este mensaje
    end);

  THorse.Listen(9001);
end.
