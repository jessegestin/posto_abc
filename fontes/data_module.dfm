object DM: TDM
  Height = 480
  Width = 640
  object Connection: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\posto_abc\banco_de_dados\POSTO_ABC.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 8
  end
end
