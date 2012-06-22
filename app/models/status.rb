# encoding: UTF-8

class Status <ActiveRecord::Base
    
  ACTIVE = 1
  INACTIVE = 2
  
  STATUS = {
    ACTIVE => "Ativo",
    INACTIVE => "Inativo"
  }
  
  STATUS_LIST = [["Ativo", ACTIVE],["Inativo", INACTIVE]]
end