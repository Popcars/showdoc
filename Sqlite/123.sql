

-- Table: item_member
CREATE TABLE item_member ( 
    item_member_id  INTEGER   PRIMARY KEY AUTO_INCREMENT
                              UNIQUE,
    item_id         INTEGER,
    uid             INTEGER,
    username        TEXT,
    addtime         INTEGER   DEFAULT 0,
    member_group_id INT( 1 )  NOT NULL
                              DEFAULT '1' 
);


-- Table: item
CREATE TABLE item ( 
    item_id          INTEGER   PRIMARY KEY AUTO_INCREMENT
                               UNIQUE,
    item_name        TEXT,
    item_description TEXT,
    uid              INTEGER,
    username         TEXT,
    password         TEXT,
    addtime          INTEGER,
    last_update_time INTEGER   DEFAULT 0,
    item_domain      TEXT      NOT NULL
                               DEFAULT '',
    item_type        INT( 1 )  NOT NULL
                               DEFAULT '1',
    is_archived      INT( 1 )  NOT NULL
                               DEFAULT '0',
    is_del           INT( 1 )  NOT NULL
                               DEFAULT '0' 
);

INSERT INTO [item] ([item_id], [item_name], [item_description], [uid], [username], [password], [addtime], [last_update_time], [item_domain], [item_type], [is_archived], [is_del]) VALUES (1, 'PBTP', '一个PHP项目', 1, 'showdoc', '', 1537861248, 1537864550, '', 1, 0, 0);

-- Table: user
CREATE TABLE user ( 
    uid                 INTEGER PRIMARY KEY AUTO_INCREMENT,
    username            TEXT,
    groupid             INTEGER DEFAULT 2,
    name                TEXT,
    avatar              TEXT,
    avatar_small        TEXT,
    email               TEXT,
    password            TEXT,
    cookie_token        BLOB,
    cookie_token_expire TEXT    DEFAULT 0,
    reg_time            INTEGER DEFAULT 0,
    last_login_time     INTEGER DEFAULT 0 
);

INSERT INTO [user] ([uid], [username], [groupid], [name], [avatar], [avatar_small], [email], [password], [cookie_token], [cookie_token_expire], [reg_time], [last_login_time]) VALUES (1, 'showdoc', 1, null, null, null, null, 'a89da13684490eb9ec9e613f91d24d00', null, 0, 1470414832, 1537861886);

-- Table: catalog
CREATE TABLE catalog ( 
    cat_id        INTEGER    PRIMARY KEY AUTO_INCREMENT
                             UNIQUE,
    cat_name      TEXT,
    item_id       INTEGER,
    s_number      INTEGER    DEFAULT 99,
    addtime       INTEGER    DEFAULT 0,
    parent_cat_id INT( 10 )  NOT NULL
                             DEFAULT '0',
    level         INT( 10 )  NOT NULL
                             DEFAULT '2' 
);

INSERT INTO [catalog] ([cat_id], [cat_name], [item_id], [s_number], [addtime], [parent_cat_id], [level]) VALUES (1, 000000, 1, 99, 1537862042, 0, 2);
INSERT INTO [catalog] ([cat_id], [cat_name], [item_id], [s_number], [addtime], [parent_cat_id], [level]) VALUES (2, 1111, 1, 99, 1537862054, 1, 3);

-- Table: page
CREATE TABLE page ( 
    page_id         INTEGER   PRIMARY KEY AUTO_INCREMENT
                              UNIQUE,
    author_uid      INTEGER,
    author_username TEXT,
    item_id         INTEGER,
    cat_id          INTEGER,
    page_title      TEXT,
    page_content    TEXT,
    s_number        INTEGER   DEFAULT 99,
    addtime         INTEGER   DEFAULT 0,
    page_comments   TEXT      NOT NULL
                              DEFAULT '',
    is_del          INT( 1 )  NOT NULL
                              DEFAULT '0' 
);

INSERT INTO [page] ([page_id], [author_uid], [author_username], [item_id], [cat_id], [page_title], [page_content], [s_number], [addtime], [page_comments], [is_del]) VALUES (1, 1, 'showdoc', 1, 0, '一标题', '欢迎使用ShowDoc！', 99, 1537861266, '', 0);
INSERT INTO [page] ([page_id], [author_uid], [author_username], [item_id], [cat_id], [page_title], [page_content], [s_number], [addtime], [page_comments], [is_del]) VALUES (2, 1, 'showdoc', 1, 0, '而发生', '欢迎使用ShowDoc！', 99, 1537861321, '', 0);
INSERT INTO [page] ([page_id], [author_uid], [author_username], [item_id], [cat_id], [page_title], [page_content], [s_number], [addtime], [page_comments], [is_del]) VALUES (3, 1, 'showdoc', 1, 0, 2125, '
    
**简要描述：** 

- 用户注册接口

**请求URL：** 
- ` http://xx.com/api/user/register `
  
**请求方式：**
- POST 

**参数：** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string |用户名   |
|password |是  |string | 密码    |
|name     |否  |string | 昵称    |

 **返回示例**

``` 
  {
    "error_code": 0,
    "data": {
      "uid": "1",
      "username": "12154545",
      "name": "吴系挂",
      "groupid": 2 ,
      "reg_time": "1436864169",
      "last_login_time": "0",
    }
  }
```

 **返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|groupid |int   |用户组id，1：超级管理员；2：普通用户  |

 **备注** 

- 更多返回错误代码请看首页的错误代码描述



    
-  用户表，储存用户信息

|字段|类型|空|默认|注释|
|:----    |:-------    |:--- |-- -|------      |
|uid    |int(10)     |否 |  |             |
|username |varchar(20) |否 |    |   用户名  |
|password |varchar(50) |否   |    |   密码    |
|name     |varchar(15) |是   |    |    昵称     |
|reg_time |int(11)     |否   | 0  |   注册时间  |

- 备注：无



    
**简要描述：** 

- 用户注册接口

**请求URL：** 
- ` http://xx.com/api/user/register `
  
**请求方式：**
- POST 

**参数：** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string |用户名   |
|password |是  |string | 密码    |
|name     |否  |string | 昵称    |

 **返回示例**

``` 
  {
    "error_code": 0,
    "data": {
      "uid": "1",
      "username": "12154545",
      "name": "吴系挂",
      "groupid": 2 ,
      "reg_time": "1436864169",
      "last_login_time": "0",
    }
  }
```

 **返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|groupid |int   |用户组id，1：超级管理员；2：普通用户  |

 **备注** 

- 更多返回错误代码请看首页的错误代码描述


欢迎使用ShowDoc！', 99, 1537861990, '', 0);
INSERT INTO [page] ([page_id], [author_uid], [author_username], [item_id], [cat_id], [page_title], [page_content], [s_number], [addtime], [page_comments], [is_del]) VALUES (4, 1, 'showdoc', 1, 0, 99, '欢迎使用ShowDoc！
    
**简要描述：** 

- 用户注册接口

**请求URL：** 
- ` http://xx.com/api/user/register `
  
**请求方式：**
- POST 

**参数：** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|username |是  |string |用户名   |
|password |是  |string | 密码    |
|name     |否  |string | 昵称    |

 **返回示例**

``` 
  {
    "error_code": 0,
    "data": {
      "uid": "1",
      "username": "12154545",
      "name": "吴系挂",
      "groupid": 2 ,
      "reg_time": "1436864169",
      "last_login_time": "0",
    }
  }
```

 **返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|groupid |int   |用户组id，1：超级管理员；2：普通用户  |

 **备注** 

- 更多返回错误代码请看首页的错误代码描述


', 99, 1537864550, '', 0);

-- Table: page_history
CREATE TABLE page_history ( 
    page_history_id INTEGER PRIMARY KEY AUTO_INCREMENT
                            UNIQUE,
    page_id         INTEGER,
    author_uid      INTEGER,
    author_username TEXT,
    item_id         INTEGER,
    cat_id          INTEGER,
    page_title      TEXT,
    page_content    TEXT,
    s_number        INTEGER,
    addtime         INTEGER,
    page_comments   TEXT    NOT NULL
                            DEFAULT '' 
);

INSERT INTO [page_history] ([page_history_id], [page_id], [author_uid], [author_username], [item_id], [cat_id], [page_title], [page_content], [s_number], [addtime], [page_comments]) VALUES (1, 4, 1, 'showdoc', 1, 0, 99, 'eNp1U99v0lAUfr9/xQ2PZLUDkSjPPpponD7ThjasyUZJW7Il1gTIhhqQYoILA7M4h2wPhm4Zc3Gg/We495Yn/gVPe8uPLHqbJvd85zvn3q/fKf3xzfea098ea19sbet7T/XcfFJBGBaKx9mw7A8q1HF873I+6cbjGCEBA5W+v6XXF6TWoM3vxDlDwPXdW3pVff3yWUQUsIS3LauYEcX9/Qc5fVeUi5pYMlVDNNS8ZlqqgSUUHsNL6dEvMnHCaih+8XzrFQ76EqdKPy9Pt3lIWh9t4h3Oyh9sdjUmJ3Xbd0e007SRnRFgBfcPdzwUsC1EMDCCOxTkXRXbtOMCYlqGVshjm+uC1pxWlE1zTzeU+zRM3Br7WsGcFTYK96Q1WGfRzg07v+QshEGk1ya9E9a/m/6pg0IkSRIG+W/Cbx1TDUM3sjldUWMZvLnBQUW2ZAg5BeKSpkAYS8Q2lkgkJYSTiUcpeFbZRYa0Rux6TBvVVSpv6KVi2C6JlyD4krW0qFvqYfpxOpVIP1kV7cimld3R81phSduMsm9R8IKmNa3cKm7MffP+6ZoQmQa2Lez634KSSAK2tYIVINw+Nj7QlPmkkYCJ8X8esrtzNjxlrRr51JlPeklA6fFwVu5y9sIc0n8H8xzNN+2NSL/LNczax77rTsdn4DiMKftSnw2OZqc3rHuwnuK/CELoL7kEX7w=', 99, 1537862106, '');

-- Table: user_token
CREATE TABLE user_token ( 
    id           INTEGER      PRIMARY KEY,
    uid          INT( 10 )    NOT NULL
                              DEFAULT '0',
    token        CHAR( 200 )  NOT NULL
                              DEFAULT '',
    token_expire INT( 11 )    NOT NULL
                              DEFAULT '0',
    ip           CHAR( 200 )  NOT NULL
                              DEFAULT '',
    addtime      INT( 11 )    NOT NULL
                              DEFAULT '0' 
);

INSERT INTO [user_token] ([id], [uid], [token], [token_expire], [ip], [addtime]) VALUES (2, 1, '2b5b6c9ff25dfd26ab93f2c3abbf5b3433fc70a786cb03d869265ca7b560512e', 1545637211, '::1', 1537861211);
INSERT INTO [user_token] ([id], [uid], [token], [token_expire], [ip], [addtime]) VALUES (3, 1, 'acb780be371b4aba54697efbe923acc895293adc22e0abdcc1da06bfe0810883', 1545637886, '172.18.154.25', 1537861886);

-- Table: template
CREATE TABLE template ( 
    id               INTEGER      PRIMARY KEY,
    uid              INT( 10 )    NOT NULL
                                  DEFAULT '0',
    username         CHAR( 200 )  NOT NULL
                                  DEFAULT '',
    template_title   CHAR( 200 )  NOT NULL
                                  DEFAULT '',
    template_content TEXT         NOT NULL
                                  DEFAULT '',
    addtime          INT( 11 )    NOT NULL
                                  DEFAULT '0' 
);


-- Table: options
CREATE TABLE options ( 
    option_id    INTEGER      PRIMARY KEY,
    option_name  CHAR( 200 )  NOT NULL
                              UNIQUE,
    option_value CHAR( 200 )  NOT NULL 
);


-- Table: item_token
CREATE TABLE item_token ( 
    id              INTEGER      PRIMARY KEY,
    item_id         INT( 11 )    NOT NULL
                                 DEFAULT '0',
    api_key         CHAR( 200 )  NOT NULL
                                 UNIQUE,
    api_token       CHAR( 200 )  NOT NULL,
    addtime         INT( 11 )    NOT NULL
                                 DEFAULT '0',
    last_check_time INT( 11 )    NOT NULL
                                 DEFAULT '0' 
);

INSERT INTO [item_token] ([id], [item_id], [api_key], [api_token], [addtime], [last_check_time]) VALUES (1, 1, '5889440c866c4eabd48b1c69735415385975', '032bed074eb04cae54c41c5eeb8dc83a2439', 1537861800, 0);

-- Table: item_top
CREATE TABLE item_top ( 
    id      INTEGER    PRIMARY KEY,
    item_id INT( 11 )  NOT NULL
                       DEFAULT '0',
    uid     INT( 11 )  NOT NULL
                       DEFAULT '0',
    addtime INT( 11 )  NOT NULL
                       DEFAULT '0' 
);

