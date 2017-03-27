package Pool;

import java.sql.Connection;

/**
 * Created by duchenguang on 2017/1/9.
 */
class PooledConnection{
    private Connection connection = null; // 数据库连接
    private boolean busy = false; // 此连接是否正在使用的标志，默认没有正在使用
    // 构造函数，根据一个 Connection 构告一个 PooledConnection 对象
    PooledConnection(Connection connection) {
        this.connection = connection;
    }

    // 返回此对象中的连接
    Connection getConnection() {
        return connection;
    }

    // 设置此对象的，连接
    void setConnection(Connection connection) {
        this.connection = connection;
    }

    // 获得对象连接是否忙
    boolean isBusy() {
        return busy;
    }

    // 设置对象的连接正在忙
    void setBusy(boolean busy) {
        this.busy = busy;
    }
}