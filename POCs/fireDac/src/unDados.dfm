object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 311
  Width = 422
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\fortes\Posto ABC\PostoABC\POCs\fireDac\data\DATABASE' +
        '.FDB'
      'User_Name=SYSDBA'
      'Password=123456'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
end
