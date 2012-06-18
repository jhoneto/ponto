# encoding: UTF-8

class Day <ActiveRecord::Base
    
  SUNDAY = 0
  MONDAY = 1
  TUESDAY = 2
  WEDNESDAY = 3
  THURSDAY = 4
  FRIDAY = 5
  SATURDAY = 6
  
  DAY = {
    SUNDAY => "Domingo",
    MONDAY => "Segunda",
    TUESDAY => "Terça",
    WEDNESDAY => "Quarta",
    THURSDAY => "Quinta",
    FRIDAY => "Sexta",
    SATURDAY => "Sábado"
  }
  
  DAY_LIST = [["Domingo", SUNDAY],["Segunda", MONDAY], ["Terça", TUESDAY], ["Quarta", WEDNESDAY], ["Quinta", THURSDAY], ["Sexta", FRIDAY], ["Sábado", SATURDAY]]
end