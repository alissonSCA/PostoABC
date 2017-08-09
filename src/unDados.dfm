object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 364
  Width = 481
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\fortes\Posto ABC\PostoABC\data\DATABASE.FDB'
      'User_Name=SYSDBA'
      'Password=123456'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 64
  end
  object myQry: TFDQuery
    Connection = FDConnection1
    Left = 224
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 296
    Top = 56
  end
end
