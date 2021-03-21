create table table_user
(
    id         int auto_increment
        primary key,
    first_name varchar(30) not null,
    last_name  varchar(50) not null,
    email      varchar(50) not null
);

create table table_account
(
    id         int auto_increment
        primary key,
    login      varchar(10)          not null,
    password   varchar(15)          not null,
    is_blocked tinyint(1) default 0 not null,
    constraint tab_account_login_uindex
        unique (login),
    constraint tab_account_table_user_id_fk
        foreign key (id) references table_user (id)
);

create table table_role
(
    id   int auto_increment
        primary key,
    name varchar(15) not null
);

create table table_account_role
(
    id         int auto_increment
        primary key,
    id_account int not null,
    id_role    int not null,
    constraint table_account_role_table_account_id_fk
        foreign key (id_account) references table_account (id),
    constraint table_account_role_table_role_id_fk
        foreign key (id_role) references table_role (id)
);