using ResourceTrackerApi.Model;
using SqlKata.Compilers;
using SqlKata.Execution;
using System.Data.SqlClient;

namespace ResourceTrackerApi.Repository
{
    public class InterviewDetailsRepo
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();

        public int InsertGetId(InterviewDetails details)
        {
            if (details.UpdatedDate == "")
                details.UpdatedDate = null;
            int id = 0;
            try
            {
                id = db.Query("InterviewDetails").InsertGetId<int>(new
                {
                    projectId = details.ProjectId,
                    interviewType = details.InterviewType,
                    interviewDate = details.InterviewDate,
                    panel = details.Panel,
                    interviewStatus = details.InterviewStatus,
                    remarks = details.Remarks,
                    createdBy = details.CreatedBy
                });
            }
            catch (Exception ex) { return -1; }
            return id;
        }

        public int UpdateGetAffected(InterviewDetails details, int Id)
        {
            int affected = 0;
            try
            {
                affected = db.Query("InterviewDetails").Where("Id", Id).Update(new
                {
                    interviewType = details.InterviewType,
                    interviewDate = details.InterviewDate,
                    panel = details.Panel,
                    interviewStatus = details.InterviewStatus,
                    remarks = details.Remarks
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
                deleted = db.Query("InterviewDetails").Where("Id", Id).Delete();
            }
            catch (Exception ex) { return 0; }
            return deleted;
        }
    }
}
