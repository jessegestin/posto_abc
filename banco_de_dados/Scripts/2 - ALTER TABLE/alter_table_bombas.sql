ALTER TABLE bombas
  ADD CONSTRAINT FK_Bombas_Tanque
  FOREIGN KEY (tanque)
  REFERENCES tanques (ID);