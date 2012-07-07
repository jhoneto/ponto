# encoding: UTF-8

class UserRole<ActiveRecord::Base
    
  ADMIN = 1
  ADMIN_POINT = 2
  CRUD = 3
  POINT = 4
  
  ROLE_USER = {
    ADMIN => "Administrador",
    ADMIN_POINT => "Administrador ponto",
    CRUD => "Cadastros",
    POINT => "Registro de ponto"
  }
  
  ROLE_USER_LIST = [["Administrador", ADMIN],["Administrador ponto", ADMIN_POINT], ["Cadastros", CRUD], ["Registro de ponto", POINT]]
end