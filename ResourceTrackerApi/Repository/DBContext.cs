using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;

namespace ResourceTrackerApi.Repository
{
    public class DBContext
    {
        static SqlConnection connection = new SqlConnection("Data Source=NGL000867;Initial Catalog=SummitAI;Integrated Security=True");
        static SqlServerCompiler compiler = new SqlServerCompiler();
        QueryFactory db = new QueryFactory(connection, compiler);
        public QueryFactory GetQueryFactory() { return db; }
    }
}
