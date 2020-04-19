SET sql_mode = '';

create table if not exists  oauth_client_details (
  client_id varchar(255) not null,
  client_secret varchar(255) not null,
  scope varchar(255) default null,
  access_token_validity int(11) default null,
  refresh_token_validity int(11) default null,
  resource_ids varchar(1024) default null,
  authorized_grant_types varchar(1024) default null,
  authorities varchar(1024) default null,
  web_server_redirect_uri varchar(1024) default null,
  additional_information varchar(1024) default null,
  autoapprove varchar(1024) default null,
  primary key (client_id)
) engine=innodb;

create table if not exists user (
  id int(11) not null auto_increment,
  username varchar(1024) not null,
  email varchar(1024) not null,
  password varchar(1024) not null,
  firstname varchar(1024) not null,
  lastname varchar(1024) not null,
  credentialsExpiryDate date not null,
  enabled tinyint(4) not null,
  accountNonExpired tinyint(4) not null,
  credentialsNonExpired tinyint(4) not null,
  accountNonLocked tinyint(4) not null,
  primary key (id),
  unique key username (username)
) engine=innodb;

create table if not exists authority (
  id int(11) not null auto_increment,
  name varchar(1024) not null,
  primary key (id)
) engine=innodb;

create table if not exists user_authority (
  userId int(11) not null,
  authorityId int(11) not null,
  primary key (userId, authorityId),
  key authorityId (authorityId),
  constraint FK_users_user_id foreign key (userId) references user (id),
  constraint FK_authorities_authority_id foreign key (authorityId) references authority (id)
) engine=innodb;