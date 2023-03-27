using ResourceTrackerApi.Model;
using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;

namespace ResourceTrackerApi.Repository
{
    public class AccountRepo
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();
        public int InsertGetId(Account account)
        {
            int id = 0;
            try
            {
                id = db.Query("Account").InsertGetId<int>(new
                {
                    accountName = account.Name
                });
            }
            catch (Exception ex) { return 0; }
            return id;
        }

        public int UpdateGetAffected(Account account, int Id)
        {
            int affected = 0;
            try
            {
                affected = db.Query("Account").Where("Id", Id).Update(new
                {
                    accountName = account.Name
                });
            }
            catch (Exception ex) { return 0; }
            return affected;
        }

        public int Delete(int Id)
        {
            int deleted = 0;
            try
            {
                deleted = db.Query("Account").Where("Id", Id).Delete();
            }
            catch (Exception ex) { return 0; }
            return deleted;
        }
    }
}
