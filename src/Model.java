import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Model
{
    public Connection databaseConnection;

    public Model()
    {
        createDBConnectionFromPool();
    }

    public void createDBConnectionFromPool()
    {
        try
        {
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            DataSource ds = (DataSource) context.lookup("connectionPool");
            this.databaseConnection = ds.getConnection();
        }

        catch (NamingException ex)
        {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (SQLException ex)
        {
            Logger.getLogger(Model.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


}