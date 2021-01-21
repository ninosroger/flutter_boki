class Sqls {
  ///数据库名
  static String databaseName = "boki.db";

  ///创建用户表
  static String createUsersTable = "CREATE TABLE users("
                                                      "id INTEGER PRIMARY KEY autoincrement," //角色id
                                                      "nickname TEXT," //角色名称
                                                      "avatar TEXT," //角色头像
                                                      "create_date INTEGER," //创建时间
                                                      "birthday INTEGER," //角色生日
                                                      "budget INTEGER," //角色预算
                                                      "spent INTEGER," //角色支出
                                                      "has_property_password INTEGER," //查看资产是否需要密码
                                                      ")";

  ///创建密码表
  static String createPasswordsTable = "CREATE TABLE passwords("
                                                      "id INTEGER PRIMARY KEY autoincrement," //密码id
                                                      "password TEXT," //密码密文
                                                      "password_type TEXT," //密码类型
                                                      "user_id INTEGER," //所属用户id
                                                      "create_date INTEGER," //创建时间
                                                      ")";

  ///创建Banner表
  static String createBannersTable = "CREATE TABLE banners("
                                                      "id INTEGER PRIMARY KEY autoincrement," //banner id
                                                      "title TEXT," //标题
                                                      "url TEXT," //链接地址
                                                      "create_date INTEGER," //创建时间
                                                      "start_date INTEGER," //开始时间
                                                      "end_date INTEGER," //结束时间
                                                      "has_show INTEGER," //是否显示
                                                      "type INTEGER," //类型
                                                      "image TEXT," //图片
                                                      ")";

  ///创建收支类型表
  static String  createIncomeExpensesTypesTable = "CREATE TABLE income_expenses_types("
                                                      "id INTEGER PRIMARY KEY autoincrement," //类型id
                                                      "name TEXT," //名称
                                                      "remark TEXT," //备注
                                                      "create_date INTEGER," //创建时间
                                                      "parent_id INTEGER," //父类型id
                                                      "types INTEGER," //收支类型
                                                      "icon TEXT," //图标
                                                      ")";

  ///创建薄记表
  static String  createBookkeepingTable = "CREATE TABLE bookkeeping("
                                                      "id INTEGER PRIMARY KEY autoincrement," //薄记id
                                                      "user_id INTEGER," //所属用户id
                                                      "ledger_id INTEGER," //所属账本id
                                                      "create_date INTEGER," //创建时间
                                                      "location_name TEXT," //地址信息
                                                      "location TEXT," //地址经纬度
                                                      "create_type INTEGER," //创建类型
                                                      "price INTEGER," //金额
                                                      "price_formula TEXT," //金额公式
                                                      "income_expenses_id INTEGER," //收支类型id
                                                      "income_expenses_types INTEGER," //收支类型
                                                      "remark TEXT," //备注
                                                      "image TEXT," //图片
                                                      "is_special INTEGER," //是否特殊
                                                      ")";

  ///创建账本表
  static String  createLedgerTable = "CREATE TABLE ledger("
                                                      "id INTEGER PRIMARY KEY autoincrement," //账本id
                                                      "name TEXT," //名称
                                                      "create_date INTEGER," //创建时间
                                                      "price INTEGER," //金额
                                                      "income_price INTEGER," //收入
                                                      "expenses_price INTEGER," //支出
                                                      "bookkeep_count INTEGER," //收支类型id
                                                      "user_id INTEGER," //参与角色id
                                                      "remark TEXT," //备注
                                                      "image TEXT," //图片
                                                      ")";

  ///创建消息表
  static String  createMessagesTable = "CREATE TABLE messages("
                                                      "id INTEGER PRIMARY KEY autoincrement," //消息id
                                                      "url TEXT," //链接
                                                      "title TEXT," //标题
                                                      "create_date INTEGER," //创建时间
                                                      "has_read INTEGER," //是否已读
                                                      "user_id INTEGER," //角色id
                                                      "content TEXT," //内容
                                                      "image TEXT," //图片
                                                      ")";

  ///创建存钱罐表
  static String  createPiggyBankTable = "CREATE TABLE piggy_bank("
                                                      "id INTEGER PRIMARY KEY autoincrement," //存钱罐id
                                                      "create_date INTEGER," //创建时间
                                                      "has_damage INTEGER," //是否损坏
                                                      "user_id INTEGER," //角色id
                                                      "password_id INTEGER," //密码id
                                                      "price INTEGER," //金额
                                                      "remark TEXT," //存钱罐信息
                                                      "image TEXT," //存钱罐封面
                                                      ")";

  ///创建存钱罐存入记录表
  static String  createPiggyBankRecordTable = "CREATE TABLE piggy_bank_record("
                                                      "id INTEGER PRIMARY KEY autoincrement," //存钱罐存入记录id
                                                      "create_date INTEGER," //创建时间
                                                      "user_id INTEGER," //角色id
                                                      "piggy_bank_id INTEGER," //存钱罐id
                                                      "price INTEGER," //金额
                                                      "remark TEXT," //备注
                                                      ")";

  ///创建自动录入表
  static String  createAutomaticInsertionTable = "CREATE TABLE automatic_insertion("
                                                      "id INTEGER PRIMARY KEY autoincrement," //自动录入id
                                                      "create_date INTEGER," //创建时间
                                                      "start_date INTEGER," //开始时间
                                                      "end_date INTEGER," //结束时间
                                                      "user_id INTEGER," //角色id
                                                      "bookkeeping_id INTEGER," //薄记id
                                                      "has_enable INTEGER," //是否启用
                                                      "remark TEXT," //备注
                                                      ")";

  ///创建资产表
  static String  createPropertyTable = "CREATE TABLE property("
                                                      "id INTEGER PRIMARY KEY autoincrement," //资产id
                                                      "create_date INTEGER," //创建时间
                                                      "user_id INTEGER," //角色id
                                                      "password_id INTEGER," //密码id
                                                      "price INTEGER," //金额
                                                      "remark TEXT," //备注
                                                      "image TEXT," //图片
                                                      "number TEXT," //号码
                                                      ")";
}
