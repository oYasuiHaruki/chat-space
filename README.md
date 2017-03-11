
* Database creation
###users テーブル
|column               |type    |
|:-----               |-----   |
|name                 |string  |
|devise use           |text    |
|devise use           |text    |

### アソシエーション
+ has_many group_users
+ has_many groups through group_users
+ has_many messages


### messagesテーブル
|column               |type    |
|:---                 |------  |
|body                 |text    |
|image                |string  |
|user_id              |integer |
|group_id             |integer |

### アソシエーション
+ belongs_to user
+ belongs_to group


###groups テーブル
|column                |type  |
|:--                   |----  |
|name                  |string|

### アソシエーション
+ has_many messages
+ has_many group_users
+ has_many users through group_users

###group_user テーブル
|column                |type  |
|:--                   |----  |
|group_id              |integer |
|user_id               |integer |

### アソシエーション 中間テーブル
+ belongs_to user
+ belongs_to group
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
