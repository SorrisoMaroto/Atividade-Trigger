-- Criar o trigger AFTER INSERT na tabela acesso
DELIMITER //
CREATE TRIGGER atualiza_ultima_acao AFTER INSERT ON acesso
FOR EACH ROW
BEGIN
    -- Verificar o tipo de ação inserida (login ou logout)
    IF NEW.acao IN ('login', 'logout') THEN
        -- Atualizar o campo ultima_acao na tabela usuario
        UPDATE usuario
        SET ultima_acao = NEW.data_acesso
        WHERE id_usuario = NEW.id_usuario;
    END IF;
END;
//
DELIMITER ;
