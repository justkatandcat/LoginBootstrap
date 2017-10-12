create database login;
use login;

create table usuarios(
idUsuario varchar(100) primary key auto_increment,
contraseña varchar(50)
);

delimiter $$
create procedure sp_log(
in id varchar(20),
in psd varchar(18))
begin
    declare existe int;
    declare comcontra int;
    declare xMsj varchar(50);

    
    set existe=(select count(*) from usuarios where idUsuario=id);
    if(existe=0) then
		set xMsj='!=existe'; 
    else
		set comcontra=(select count(*) from usuarios where idUsuario=id and contraseña=psd);
        if(comcontra=0) then
			set xMsj='!=contra';
        else
			set xMsj='true';
        end if;
    end if;
    
    select xMsj;

end; $$

delimiter ;