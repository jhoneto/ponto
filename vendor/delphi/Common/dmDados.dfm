object dtmDados: TdtmDados
  OldCreateOrder = False
  Height = 239
  Width = 518
  object cnnPrincipal: TZConnection
    Protocol = 'postgresql'
    Port = 5432
    Left = 136
    Top = 24
  end
  object qryFuncionario: TZQuery
    Connection = cnnPrincipal
    SQL.Strings = (
      'select * from employees'
      'where registry = :registry')
    Params = <
      item
        DataType = ftUnknown
        Name = 'registry'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'registry'
        ParamType = ptUnknown
      end>
  end
  object qryBatida: TZQuery
    Connection = cnnPrincipal
    SQL.Strings = (
      'select * from points'
      'where employee_id = :employee_id'
      '  and cast( "date" as date) = cast(:data as date)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'employee_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'employee_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
  end
  object qryHorario: TZQuery
    Connection = cnnPrincipal
    SQL.Strings = (
      'select o.*'
      'from office_hours o'
      'inner join employees e'
      'on o.id = e.office_hour_id'
      'where e.id = :funcionario_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'funcionario_id'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'funcionario_id'
        ParamType = ptUnknown
      end>
  end
  object qryFuncionarios: TZQuery
    Connection = cnnPrincipal
    SQL.Strings = (
      'select * from employees'
      'where status = 1')
    Params = <>
    Left = 168
    Top = 80
  end
  object cnnCentralizador: TZConnection
    Protocol = 'postgresql'
    Left = 408
    Top = 24
  end
  object qryBatidasNaoImportadas: TZQuery
    Connection = cnnPrincipal
    SQL.Strings = (
      'select * from points'
      'where exported = false')
    Params = <>
    Left = 112
    Top = 184
  end
  object qryInserirBatida: TZQuery
    Connection = cnnCentralizador
    SQL.Strings = (
      'INSERT INTO points'
      '(employee_id, date, entry_1, exit_1, entry_2, exit_2, entry_3,'
      ' exit_3, created_at, updated_at, "action", obs, delay, extra,'
      ' exported)'
      'VALUES'
      
        '(:employee_id, :date, :entry_1, :exit_1, :entry_2, :exit_2, :ent' +
        'ry_3,'
      
        ' :exit_3, :created_at, :updated_at, :action, :obs, :delay, :extr' +
        'a,'
      ' true);')
    Params = <
      item
        DataType = ftUnknown
        Name = 'employee_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entry_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exit_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entry_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exit_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entry_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exit_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'created_at'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'updated_at'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'action'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'delay'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'extra'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'employee_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entry_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exit_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entry_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exit_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'entry_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'exit_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'created_at'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'updated_at'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'action'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'delay'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'extra'
        ParamType = ptUnknown
      end>
  end
end
