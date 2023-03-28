using ResourceTrackerApi.Model;
using SqlKata.Execution;

namespace ResourceTrackerApi.Repository
{
    public class ProjectRepo
    {
        static DBContext _context = new DBContext();
        QueryFactory db = _context.GetQueryFactory();
        public int InsertGetId(Project project)
        {
            int id = 0;
            try
            {
                id = db.Query("Project").InsertGetId<int>(new
                {
                    projectCode = project.ProjectCode,
                    projectName = project.Name,
                    accountId = project.AccountId
                });
            }
            catch (Exception ex) { return 0; }
            return id;
        }

        public int UpdateGetAffected(Project project)
        {
            int affectedrowsProject = 0;
            try
            {
                affectedrowsProject = db.Query("Project").Where("Id", project.Id).Update(new
                {
                    projectCode = project.ProjectCode,
                    projectName = project.Name,
                    accountId = project.AccountId
                });
            }
            catch (Exception ex) { return 0; }
            return affectedrowsProject;
        }

        public int Delete(int Id)
        {
            int deleted = 0;
            try
            {
                deleted = db.Query("Project").Where("Id", Id).Delete();
            }
            catch (Exception ex) { return 0; }
            return deleted;
        }

        public Project GetById(int id)
        {
            Project project = null;
            try
            {
                project = db.Query("Project").Where("Id", id).FirstOrDefault<Project>();
            }
            catch (Exception ex) { return null; }
            return project;
        }
    }
}
